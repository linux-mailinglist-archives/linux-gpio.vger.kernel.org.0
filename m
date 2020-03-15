Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8C4185FED
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Mar 2020 22:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729178AbgCOVPX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Mar 2020 17:15:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:53872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729166AbgCOVPX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 15 Mar 2020 17:15:23 -0400
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52B9F20674;
        Sun, 15 Mar 2020 21:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584306922;
        bh=I0g6ojUYaVQQh4Yfg/YJnRtaQaO75W6X4bRMQz89Ssc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=U1tyGz5j1knx7F7AOjLZ0kHMBz3jiKJ9N2o+QnPAluXRnWbt76Dn6iMeICVxCOpMn
         3K9X0w8jyRk3oJ/lN5wayrkyOJuC4R2WicZ2pp/RPLlcQQIbAJxM188U/0jlZG5gEP
         6sdGzUkp61RiDbC8UPLEY2jVFw/bypaReiAT3yDc=
Received: by mail-il1-f173.google.com with SMTP id h3so14554703ils.3;
        Sun, 15 Mar 2020 14:15:22 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1+1MUB3Kkqj9NqZ8iJL+hOHQ8u4AJFkrMrCynlmwUzFdVMaxPq
        kQRhLyH/UV1l9ga2b3pUMNRVYHzOzVaUUDtOEkI=
X-Google-Smtp-Source: ADFU+vt4PuCONW+VhbJRvtM7lzRmHkPT9FHvRDtafzkxRpQO9Oxna27KSMtEWJgHjV7CZ6FKg8l2LzUJNgsXbnQY3tc=
X-Received: by 2002:a92:216:: with SMTP id 22mr24194655ilc.53.1584306921712;
 Sun, 15 Mar 2020 14:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <1583825986-8189-1-git-send-email-light.hsieh@mediatek.com> <1583825986-8189-3-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1583825986-8189-3-git-send-email-light.hsieh@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Sun, 15 Mar 2020 14:15:10 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzo-HkmiitBBJF9Mybbrdgy-Kphfyi2wf0SwMGXTeuWGVA@mail.gmail.com>
Message-ID: <CAGp9Lzo-HkmiitBBJF9Mybbrdgy-Kphfyi2wf0SwMGXTeuWGVA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: make MediaTek MT6765 pinctrl ready for
 buidling loadable module
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, Light

On Tue, Mar 10, 2020 at 12:39 AM <light.hsieh@mediatek.com> wrote:
>
> From: Light Hsieh <light.hsieh@mediatek.com>
>
> This patch make pinctrl-mt6765 ready for building as loadable module.
s/building/building/

I got build error after when those two patches are being applied
../drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:529:1: error:
'mtk_pinconf_bias_set_gev1' undeclared here (not in a function)

>
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/pinctrl/mediatek/Kconfig          | 2 +-
>  drivers/pinctrl/mediatek/pinctrl-mt6765.c | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 4cd1109..c645fdb 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -89,7 +89,7 @@ config PINCTRL_MT2712
>         select PINCTRL_MTK
>
>  config PINCTRL_MT6765
> -       bool "Mediatek MT6765 pin control"
> +       tristate "Mediatek MT6765 pin control"
>         depends on OF
>         depends on ARM64 || COMPILE_TEST
>         default ARM64 && ARCH_MEDIATEK
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> index 905dae8c..2c59d39 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> @@ -6,6 +6,7 @@
>   *
>   */
>
> +#include <linux/module.h>
>  #include "pinctrl-mtk-mt6765.h"
>  #include "pinctrl-paris.h"
>
> @@ -1103,3 +1104,6 @@ static int __init mt6765_pinctrl_init(void)
>         return platform_driver_register(&mt6765_pinctrl_driver);
>  }
>  arch_initcall(mt6765_pinctrl_init);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("MediaTek MT6765 Pinctrl Driver");
> --
> 1.8.1.1.dirty
