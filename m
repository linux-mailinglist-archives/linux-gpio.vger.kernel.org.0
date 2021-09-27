Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEB441A11D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 23:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237367AbhI0VGQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 17:06:16 -0400
Received: from gloria.sntech.de ([185.11.138.130]:42970 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237235AbhI0VGP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Sep 2021 17:06:15 -0400
Received: from user91-192-32-221.grape.cz ([91.192.32.221] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mUxnb-00057F-JB; Mon, 27 Sep 2021 23:04:31 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH v8 9/9] pinctrl/rockchip: drop the gpio related codes
Date:   Mon, 27 Sep 2021 23:04:26 +0200
Message-ID: <46772783.fMDQidcC6G@phil>
In-Reply-To: <f13ff971-8af2-be9b-fa5d-7913c0ff1351@collabora.com>
References: <20210816011948.1118959-1-jay.xu@rock-chips.com> <20210816012146.1119289-1-jay.xu@rock-chips.com> <f13ff971-8af2-be9b-fa5d-7913c0ff1351@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Guillaume,

Am Montag, 27. September 2021, 12:18:04 CEST schrieb Guillaume Tucker:
> On 16/08/2021 02:21, Jianqun Xu wrote:
> > With the patch to separate the gpio driver from the pinctrl driver, now
> > the pinctrl-rockchip can drop the gpio related codes now.
> > 
> > Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> > ---
> > v8:
> >  - none
> > v7:
> >  - none, from v1
> > 
> >  drivers/pinctrl/pinctrl-rockchip.c | 645 +----------------------------
> >  1 file changed, 17 insertions(+), 628 deletions(-)
> 
> [...]
> 
> Please see the bisection report below about a boot failure on
> rk3288-veyron-jaq which is pointing to this patch.  The issue
> appears to be present on mainline but not on linux-next as of
> next-20210924.
> 
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org but this one
> looks valid.
> 
> Some more details can be found here:
> 
>   https://linux.kernelci.org/test/case/id/614f19a33f5497c2bc99a2df/
> 
> Please let us know if you need help debugging the issue or if you
> have a fix to try.

This is probably the issue I had on veyron-pinky as well, pinctrl-hogs
grabbing things with output-enable configs before the gpio driver are
probed. I've already submitted a fix series for this and all patches
have at least reached maintainer trees.

See https://lore.kernel.org/all/20210913224926.1260726-1-heiko@sntech.de/
for reference.

So in theory that issue should go away with hopefully the next -rc kernek.


Heiko


> 
> Best wishes,
> Guillaume
> 
> 
> GitHub: https://github.com/kernelci/kernelci-project/issues/58
> 
> -------------------------------------------------------------------------------
> 
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> 
> mainline/master bisection: baseline.login on rk3288-veyron-jaq
> 
> Summary:
>   Start:      7d42e9818258 Merge tag 'gpio-fixes-for-v5.15-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
>   Plain log:  https://storage.kernelci.org/mainline/master/v5.15-rc2-159-g7d42e9818258/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
>   HTML log:   https://storage.kernelci.org/mainline/master/v5.15-rc2-159-g7d42e9818258/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
>   Result:     9ce9a02039de pinctrl/rockchip: drop the gpio related codes
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       mainline
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>   Branch:     master
>   Target:     rk3288-veyron-jaq
>   CPU arch:   arm
>   Lab:        lab-collabora
>   Compiler:   gcc-8
>   Config:     multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y
>   Test case:  baseline.login
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit 9ce9a02039de72ec8af1bd4bff14f1780337ffcc
> Author: Jianqun Xu <jay.xu@rock-chips.com>
> Date:   Mon Aug 16 09:21:46 2021 +0800
> 
>     pinctrl/rockchip: drop the gpio related codes
>     
>     With the patch to separate the gpio driver from the pinctrl driver, now
>     the pinctrl-rockchip can drop the gpio related codes now.
>     
>     Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
>     Link: https://lore.kernel.org/r/20210816012146.1119289-1-jay.xu@rock-chips.com
>     Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 




