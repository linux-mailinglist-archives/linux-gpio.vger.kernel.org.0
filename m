Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B198524AA69
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Aug 2020 02:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgHTAA1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 20:00:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:56620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbgHTAAY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Aug 2020 20:00:24 -0400
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2C1E20B1F;
        Thu, 20 Aug 2020 00:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597881623;
        bh=0vycRTEeeBdj+dFUoX/HgFRCl8uwmaqhcCCn+aBekpU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TQF/TVzRsZiyEOtuCO2nax72h/3qbmm2InffKR0nnN2G+0PCM9SGXMPO/IO71dYr4
         5aTyy1N/4n39VfbjF09tCcTzXFalIgs87UHmfo+hbYjVSHYNGS5E2F7X6LdugHQRbJ
         i0KTTg92kLgY/7XPh+Ggr/8eoBUO8aTUI77w39KI=
Received: by mail-il1-f178.google.com with SMTP id t13so265431ile.9;
        Wed, 19 Aug 2020 17:00:23 -0700 (PDT)
X-Gm-Message-State: AOAM533ZS6wJeFzzUctTUYfEeRmprsJFNPuAPJf1O26agUfNpK4X1S0j
        vVVsKHZcUXwUPPXdtDXEIOrwyZsTU0izwn9W4Fw=
X-Google-Smtp-Source: ABdhPJyB6Po7iKwA/ejWuqNc1cFuP3GSPXRSd8MiDhAB/4dEkY5cF2upLARpUQTZHnrpwGjaF+/PpevXuEQt3pLBaOU=
X-Received: by 2002:a92:c8cd:: with SMTP id c13mr447921ilq.162.1597881623057;
 Wed, 19 Aug 2020 17:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200819161945.1155298-1-enric.balletbo@collabora.com>
In-Reply-To: <20200819161945.1155298-1-enric.balletbo@collabora.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Wed, 19 Aug 2020 17:00:12 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzqw3KMgAYL9yF74BQFSrgv5GMcROeUEyQbfCeGZnPsgGg@mail.gmail.com>
Message-ID: <CAGp9Lzqw3KMgAYL9yF74BQFSrgv5GMcROeUEyQbfCeGZnPsgGg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Free eint data on failure
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>, hsinyi@chromium.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 19, 2020 at 9:19 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> The pinctrl driver can work without the EINT resource, but, if it is
> expected to have this resource but the mtk_build_eint() function fails
> after allocating their data (because can't get the resource or can't map
> the irq), the data is not freed and you end with a NULL pointer
> dereference. Fix this by freeing the data if mtk_build_eint() fails, so
> pinctrl still works and doesn't hang.
>
> This is noticeable after commit f97dbf48ca43 ("irqchip/mtk-sysirq: Convert
> to a platform driver") on MT8183 because, due this commit, the pinctrl driver
> fails to map the irq and spots the following bug:
>
> [    1.947597] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000004
> [    1.956404] Mem abort info:
> [    1.959203]   ESR = 0x96000004
> [    1.962259]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    1.967565]   SET = 0, FnV = 0
> [    1.970613]   EA = 0, S1PTW = 0
> [    1.973747] Data abort info:
> [    1.976619]   ISV = 0, ISS = 0x00000004
> [    1.980447]   CM = 0, WnR = 0
> [    1.983410] [0000000000000004] user address but active_mm is swapper
> [    1.989759] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    1.995322] Modules linked in:
> [    1.998371] CPU: 7 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc1+ #44
> [    2.004715] Hardware name: MediaTek krane sku176 board (DT)
> [    2.010280] pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
> [    2.015850] pc : mtk_eint_set_debounce+0x48/0x1b8
> [    2.020546] lr : mtk_eint_set_debounce+0x34/0x1b8
> [    2.025239] sp : ffff80001008baa0
> [    2.028544] x29: ffff80001008baa0 x28: ffff0000ff7ff790
> [    2.033847] x27: ffff0000f9ec34b0 x26: ffff0000f9ec3480
> [    2.039150] x25: ffff0000fa576410 x24: ffff0000fa502800
> [    2.044453] x23: 0000000000001388 x22: ffff0000fa635f80
> [    2.049755] x21: 0000000000000008 x20: 0000000000000000
> [    2.055058] x19: 0000000000000071 x18: 0000000000000001
> [    2.060360] x17: 0000000000000000 x16: 0000000000000000
> [    2.065662] x15: ffff0000facc8470 x14: ffffffffffffffff
> [    2.070965] x13: 0000000000000001 x12: 00000000000000c0
> [    2.076267] x11: 0000000000000040 x10: 0000000000000070
> [    2.081569] x9 : ffffaec0063d24d8 x8 : ffff0000fa800270
> [    2.086872] x7 : 0000000000000000 x6 : 0000000000000011
> [    2.092174] x5 : ffff0000fa800248 x4 : ffff0000fa800270
> [    2.097476] x3 : ffff8000100c5000 x2 : 0000000000000000
> [    2.102778] x1 : 0000000000000000 x0 : 0000000000000000
> [    2.108081] Call trace:
> [    2.110520]  mtk_eint_set_debounce+0x48/0x1b8
> [    2.114870]  mtk_gpio_set_config+0x5c/0x78
> [    2.118958]  gpiod_set_config+0x5c/0x78
> [    2.122786]  gpiod_set_debounce+0x18/0x28
> [    2.126789]  gpio_keys_probe+0x50c/0x910
> [    2.130705]  platform_drv_probe+0x54/0xa8
> [    2.134705]  really_probe+0xe4/0x3b0
> [    2.138271]  driver_probe_device+0x58/0xb8
> [    2.142358]  device_driver_attach+0x74/0x80
> [    2.146532]  __driver_attach+0x58/0xe0
> [    2.150274]  bus_for_each_dev+0x70/0xc0
> [    2.154100]  driver_attach+0x24/0x30
> [    2.157666]  bus_add_driver+0x14c/0x1f0
> [    2.161493]  driver_register+0x64/0x120
> [    2.165319]  __platform_driver_register+0x48/0x58
> [    2.170017]  gpio_keys_init+0x1c/0x28
> [    2.173672]  do_one_initcall+0x54/0x1b4
> [    2.177499]  kernel_init_freeable+0x1d0/0x238
> [    2.181848]  kernel_init+0x14/0x118
> [    2.185328]  ret_from_fork+0x10/0x34
> [    2.188899] Code: a9438ac1 12001266 f94006c3 121e766a (b9400421)
> [    2.194991] ---[ end trace 168cf7b3324b6570 ]---
> [    2.199611] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    2.207260] SMP: stopping secondary CPUs
> [    2.211294] Kernel Offset: 0x2ebff4800000 from 0xffff800010000000
> [    2.217377] PHYS_OFFSET: 0xffffb50500000000
> [    2.221551] CPU features: 0x0240002,2188200c
> [    2.225811] Memory Limit: none
> [    2.228860] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>
> Fixes: 89132dd8ffd2 ("pinctrl: mediatek: extend eint build to pinctrl-mtk-common-v2.c")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 27 ++++++++++++++-----
>  1 file changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 2f3dfb56c3fa..4b532e6b9038 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -355,6 +355,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
>  {
>         struct device_node *np = pdev->dev.of_node;
>         struct resource *res;
> +       int ret;
>
>         if (!IS_ENABLED(CONFIG_EINT_MTK))
>                 return 0;
> @@ -369,19 +370,26 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
>         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "eint");
>         if (!res) {
>                 dev_err(&pdev->dev, "Unable to get eint resource\n");
> -               return -ENODEV;
> +               ret = -ENODEV;
> +               goto err_free_eint;
>         }
>
>         hw->eint->base = devm_ioremap_resource(&pdev->dev, res);
> -       if (IS_ERR(hw->eint->base))
> -               return PTR_ERR(hw->eint->base);
> +       if (IS_ERR(hw->eint->base)) {
> +               ret = PTR_ERR(hw->eint->base);
> +               goto err_free_eint;
> +       }
>
>         hw->eint->irq = irq_of_parse_and_map(np, 0);
> -       if (!hw->eint->irq)
> -               return -EINVAL;
> +       if (!hw->eint->irq) {
> +               ret = -EINVAL;
> +               goto err_free_eint;
> +       }
>
> -       if (!hw->soc->eint_hw)
> -               return -ENODEV;
> +       if (!hw->soc->eint_hw) {
> +               ret = -ENODEV;
> +               goto err_free_eint;
> +       }
>
>         hw->eint->dev = &pdev->dev;
>         hw->eint->hw = hw->soc->eint_hw;
> @@ -389,6 +397,11 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
>         hw->eint->gpio_xlate = &mtk_eint_xt;
>
>         return mtk_eint_do_init(hw->eint);
> +

Similarly, I think we have to call devm_ioremap_release to explicitly
free resource when a certain failure occurs after
devm_ioremap_resource, right?

> +err_free_eint:
> +       devm_kfree(hw->dev, hw->eint);
> +       hw->eint = NULL;
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(mtk_build_eint);
>
> --
> 2.28.0
>
