Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCA73228B0
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Feb 2021 11:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbhBWKOP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Feb 2021 05:14:15 -0500
Received: from gloria.sntech.de ([185.11.138.130]:57176 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231863AbhBWKOM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Feb 2021 05:14:12 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lEUh9-0008Tf-AQ; Tue, 23 Feb 2021 11:13:31 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Wang Panzhenzhuan <randy.wang@rock-chips.com>,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH] pinctrl: rockchip: fix restore error in resume
Date:   Tue, 23 Feb 2021 11:13:30 +0100
Message-ID: <9688540.oDFzTOozpa@diego>
In-Reply-To: <20210223100725.269240-1-jay.xu@rock-chips.com>
References: <20210223064807.121358-1-jay.xu@rock-chips.com> <20210223100725.269240-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jianqun,

Please add a version to the subject when sending updated patches.

So this would be :
[PATCH v2] pinctrl: rockchip: fix restore error in resume

And in general, kernel tooling will grab received Reviewed-by tags
automatically nowadays, so no need to send new versions just for that.


Heiko

Am Dienstag, 23. Februar 2021, 11:07:25 CET schrieb Jianqun Xu:
> From: Wang Panzhenzhuan <randy.wang@rock-chips.com>
> 
> The restore in resume should match to suspend which only set for RK3288
> SoCs pinctrl.
> 
> Fixes: 8dca933127024 ("pinctrl: rockchip: save and restore gpio6_c6 pinmux in suspend/resume")
> Reviewed-by: Jianqun Xu <jay.xu@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Wang Panzhenzhuan <randy.wang@rock-chips.com>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index aa1a1c850d05..53a0badc6b03 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3727,12 +3727,15 @@ static int __maybe_unused rockchip_pinctrl_suspend(struct device *dev)
>  static int __maybe_unused rockchip_pinctrl_resume(struct device *dev)
>  {
>  	struct rockchip_pinctrl *info = dev_get_drvdata(dev);
> -	int ret = regmap_write(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
> -			       rk3288_grf_gpio6c_iomux |
> -			       GPIO6C6_SEL_WRITE_ENABLE);
> +	int ret;
>  
> -	if (ret)
> -		return ret;
> +	if (info->ctrl->type == RK3288) {
> +		ret = regmap_write(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
> +				   rk3288_grf_gpio6c_iomux |
> +				   GPIO6C6_SEL_WRITE_ENABLE);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	return pinctrl_force_default(info->pctl_dev);
>  }
> 




