Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2754419218
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 12:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233782AbhI0KTs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 06:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233757AbhI0KTs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 06:19:48 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9440C061575;
        Mon, 27 Sep 2021 03:18:10 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id B21C91F427CE
Subject: Re: [PATCH v8 9/9] pinctrl/rockchip: drop the gpio related codes
To:     Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Heiko Stuebner <heiko@sntech.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>
References: <20210816011948.1118959-1-jay.xu@rock-chips.com>
 <20210816012146.1119289-1-jay.xu@rock-chips.com>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <f13ff971-8af2-be9b-fa5d-7913c0ff1351@collabora.com>
Date:   Mon, 27 Sep 2021 12:18:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210816012146.1119289-1-jay.xu@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jianqun,

On 16/08/2021 02:21, Jianqun Xu wrote:
> With the patch to separate the gpio driver from the pinctrl driver, now
> the pinctrl-rockchip can drop the gpio related codes now.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
> v8:
>  - none
> v7:
>  - none, from v1
> 
>  drivers/pinctrl/pinctrl-rockchip.c | 645 +----------------------------
>  1 file changed, 17 insertions(+), 628 deletions(-)

[...]

Please see the bisection report below about a boot failure on
rk3288-veyron-jaq which is pointing to this patch.  The issue
appears to be present on mainline but not on linux-next as of
next-20210924.

Reports aren't automatically sent to the public while we're
trialing new bisection features on kernelci.org but this one
looks valid.

Some more details can be found here:

  https://linux.kernelci.org/test/case/id/614f19a33f5497c2bc99a2df/

Please let us know if you need help debugging the issue or if you
have a fix to try.

Best wishes,
Guillaume


GitHub: https://github.com/kernelci/kernelci-project/issues/58

-------------------------------------------------------------------------------

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
*                                                               *
* If you do send a fix, please include this trailer:            *
*   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
*                                                               *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

mainline/master bisection: baseline.login on rk3288-veyron-jaq

Summary:
  Start:      7d42e9818258 Merge tag 'gpio-fixes-for-v5.15-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
  Plain log:  https://storage.kernelci.org/mainline/master/v5.15-rc2-159-g7d42e9818258/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:   https://storage.kernelci.org/mainline/master/v5.15-rc2-159-g7d42e9818258/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Result:     9ce9a02039de pinctrl/rockchip: drop the gpio related codes

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       mainline
  URL:        https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  Branch:     master
  Target:     rk3288-veyron-jaq
  CPU arch:   arm
  Lab:        lab-collabora
  Compiler:   gcc-8
  Config:     multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y
  Test case:  baseline.login

Breaking commit found:

-------------------------------------------------------------------------------
commit 9ce9a02039de72ec8af1bd4bff14f1780337ffcc
Author: Jianqun Xu <jay.xu@rock-chips.com>
Date:   Mon Aug 16 09:21:46 2021 +0800

    pinctrl/rockchip: drop the gpio related codes
    
    With the patch to separate the gpio driver from the pinctrl driver, now
    the pinctrl-rockchip can drop the gpio related codes now.
    
    Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
    Link: https://lore.kernel.org/r/20210816012146.1119289-1-jay.xu@rock-chips.com
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
