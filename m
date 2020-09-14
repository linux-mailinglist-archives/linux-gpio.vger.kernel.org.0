Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8BD2686EF
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 10:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgININM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 04:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgINIM5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 04:12:57 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68607C061788;
        Mon, 14 Sep 2020 01:12:57 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z1so17630178wrt.3;
        Mon, 14 Sep 2020 01:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nl/00HUyr8Wq28pXUoEd3YsEKDmjzTKBgf6RHxEgN2w=;
        b=ONIEbqQNIppWr9sMLWIk0/uNv3NAhbGE0+Tp3USoCkWyinCG4kPTxww4R2hVG/mKQH
         M2ndIJGX5qT1yqbd2sWlpJ1JPHngxo1FICW+iAyG4zcZZplybqFDwamWYeKWznidLGEN
         HJ+gJesXp1pLvqItytWKtWxVw0F3a67kqlk4X0lLVQRYmjzJjq3UsvbKWtR2b/WXJntU
         PDrP2MzwvVX3Xk/MJ5ipt5lu21hujZwUmN63JRsINpaIX72r8Su+8kp8648y4dSO+laW
         d2w3jrBvkLgkcXAHsj3q7r/cn9j5Cx86xxXxoVdcvxewcGZUn1e295QOHoqQLF4ZlTig
         89qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nl/00HUyr8Wq28pXUoEd3YsEKDmjzTKBgf6RHxEgN2w=;
        b=FiloWwikFb5gc+853cDHiEGxOfCBYsyhpQrjVGzH59QlNocf726GH3K3HxCW+Y/2Gx
         P72JfMNDcC4INh5ZnBlCPPhVwdAtTIfhiurAprdFLhquSeXhmARQPQjyw+aFGWNJwDi0
         kSmIsx/bMxJY21SHT4C356CWcqa08VPxArOUXAIPrnFiKTgOwMmUoOZuziIiR2cT42mS
         d9ylbRJGN9T/UoOmVl7j5UjkpxnczTGZTjmrcZxHJnebXsWhJhci04OQws4M4MlO0jOz
         jkT+Xe2WGw9WRa323C5624IbxDgL1UigIo8wcXZCFHYZ4aVUB1exzpMAB0fvsIySZg0H
         rUww==
X-Gm-Message-State: AOAM530V5Qlj3mLbpYqdfaq1l+M8hYTWb+j9NbSOheXZ+369ZMVw2Q9e
        Or/eU2um3JscgwaeQzvgOGQwj2s4TbewJTkxyFc=
X-Google-Smtp-Source: ABdhPJwgJr/P9fpl+yVQtwr8SbLBhNjOxwMAurDB9DGb2j7bkcCL0T9ns3zboqQ5xgfw0q8F1ug0owm9VBxO3R5cHl8=
X-Received: by 2002:a5d:67d0:: with SMTP id n16mr15768211wrw.198.1600071175710;
 Mon, 14 Sep 2020 01:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200914065402.3726408-1-liushixin2@huawei.com>
In-Reply-To: <20200914065402.3726408-1-liushixin2@huawei.com>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Mon, 14 Sep 2020 16:12:19 +0800
Message-ID: <CAAfSe-uvy4Fz0RdcfWmJtyB7K_0LBD5_Dm8HFLaiV7aQ2HP_eQ@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: sprd: use module_platform_driver to
 simplify the code
To:     Liu Shixin <liushixin2@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-gpio@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 14 Sep 2020 at 14:32, Liu Shixin <liushixin2@huawei.com> wrote:
>
> module_platform_driver() makes the code simpler by eliminating
> boilerplate code.
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

> ---
>  drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c b/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
> index 06c8671b40e7..d14f382f2392 100644
> --- a/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
> +++ b/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
> @@ -946,18 +946,7 @@ static struct platform_driver sprd_pinctrl_driver = {
>         .remove = sprd_pinctrl_remove,
>         .shutdown = sprd_pinctrl_shutdown,
>  };
> -
> -static int sprd_pinctrl_init(void)
> -{
> -       return platform_driver_register(&sprd_pinctrl_driver);
> -}
> -module_init(sprd_pinctrl_init);
> -
> -static void sprd_pinctrl_exit(void)
> -{
> -       platform_driver_unregister(&sprd_pinctrl_driver);
> -}
> -module_exit(sprd_pinctrl_exit);
> +module_platform_driver(sprd_pinctrl_driver);
>
>  MODULE_DESCRIPTION("SPREADTRUM Pin Controller Driver");
>  MODULE_AUTHOR("Baolin Wang <baolin.wang@spreadtrum.com>");
> --
> 2.25.1
>
