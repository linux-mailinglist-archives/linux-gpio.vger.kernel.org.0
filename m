Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309573228CD
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Feb 2021 11:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbhBWKYw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Feb 2021 05:24:52 -0500
Received: from gloria.sntech.de ([185.11.138.130]:57266 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230142AbhBWKYt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Feb 2021 05:24:49 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lEUrQ-00006b-AO; Tue, 23 Feb 2021 11:24:08 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Ziyuan Xu <xzy.xu@rock-chips.com>
Subject: Re: [PATCH] pinctrl: rockchip: clear int status when driver probed
Date:   Tue, 23 Feb 2021 11:24:07 +0100
Message-ID: <14836062.ZYm5mLc6kN@diego>
In-Reply-To: <20210223101937.273085-1-jay.xu@rock-chips.com>
References: <20210223101937.273085-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Dienstag, 23. Februar 2021, 11:19:37 CET schrieb Jianqun Xu:
> Some devices may do gpio interrupt trigger and make an int status before
> pinctrl driver probed, then the gpio handler will keep complain untill
> the device driver works to stop trigger.
> 
> Signed-off-by: Ziyuan Xu <xzy.xu@rock-chips.com>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index aa1a1c850d05..ec4cb88572cf 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3433,6 +3433,7 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
>  		 * things enabled, so for us that's all masked and all enabled.
>  		 */
>  		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTMASK);
> +		writel_relaxed(0xffffffff, bank->reg_base + GPIO_PORTS_EOI);
>  		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTEN);
>  		gc->mask_cache = 0xffffffff;
>  
> 




