//
//  DYHomeCell.m
//  FitNess
//
//  Created by 黄德玉 on 2017/7/4.
//  Copyright © 2017年 none. All rights reserved.
//

#import "DYHomeCell.h"
#import "ZFPlayerView.h"

@interface DYHomeCell ()<ZFPlayerDelegate>

@property (nonatomic,strong) UIButton * playBtn;
@property (nonatomic,strong) UIImageView * imgView;
@property (nonatomic,strong) ZFPlayerView * playerView;
@property (nonatomic, strong) ZFPlayerModel *playerModel;

@end

@implementation DYHomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.imgView];
        [self.imgView addSubview:self.playerView];
        [self.contentView addSubview:self.playBtn];
        [self _layout];
    }
    return self;
}


- (void)_layout{
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.imgView);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


#pragma mark - ZFPlayerDelegate

- (void)zf_playerBackAction {
    DLog(@"点击返回");
}

- (void)zf_playerDownload:(NSString *)url {
    DLog(@"点击下载");
}

- (void)zf_playerControlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen {
    
}

- (void)zf_playerControlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen {
}

#pragma mark - action
- (void)btnClicked:(UIButton *)btn{
    
    btn.hidden = YES;
    [self.playerView autoPlayTheVideo];
}

#pragma mark - 初始化

- (UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_playBtn setImage:[UIImage imageNamed:@"video_list_cell_big_icon"] forState:UIControlStateNormal];
    }
    return _playBtn;
}

- (UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.backgroundColor = [UIColor lightGrayColor];
        _imgView.userInteractionEnabled = YES;
    }
    return _imgView;
}

- (ZFPlayerView *)playerView{
    if (!_playerView) {
        _playerView = [[ZFPlayerView alloc] init];
        [_playerView playerControlView:nil playerModel:self.playerModel];
        
        // 设置代理
        _playerView.delegate = self;
        
        //（可选设置）可以设置视频的填充模式，内部设置默认（ZFPlayerLayerGravityResizeAspect：等比例填充，直到一个维度到达区域边界）
        // _playerView.playerLayerGravity = ZFPlayerLayerGravityResize;
        
        // 打开下载功能（默认没有这个功能）
        _playerView.hasDownload    = YES;
        
        // 打开预览图
        self.playerView.hasPreviewView = YES;
    }
    return _playerView;
}

- (ZFPlayerModel *)playerModel {
    if (!_playerModel) {
        _playerModel                  = [[ZFPlayerModel alloc] init];
        _playerModel.title            = @"这是视频标题";
        _playerModel.videoURL         = [NSURL URLWithString:@"http://2449.vod.myqcloud.com/2449_22ca37a6ea9011e5acaaf51d105342e3.f20.mp4"];
        _playerModel.placeholderImage = [UIImage imageNamed:@"loading_bgView"];
        _playerModel.fatherView       = self.imgView;
        //        _playerModel.resolutionDic = @{@"高清" : self.videoURL.absoluteString,
        //                                       @"标清" : self.videoURL.absoluteString};
    }
    return _playerModel;
}


@end
