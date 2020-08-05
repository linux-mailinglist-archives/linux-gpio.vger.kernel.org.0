Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC5323CD32
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Aug 2020 19:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgHERWk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Aug 2020 13:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbgHERVU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2020 13:21:20 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D08C0086B8;
        Wed,  5 Aug 2020 08:01:40 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id 25so16271712oir.0;
        Wed, 05 Aug 2020 08:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KpSkGT0sqeWSPVbB9YWF53QAp9yWgeXDzmqQe2gS0mE=;
        b=brt7S+HWZ+qCQRJrmS/H77/FQUAihk4iNLzlpJiPHfxIAxDpPi0rP7P+2UQZ3B/wQZ
         JbsSDXX82x2uH39ZG3jrYi+GFQH/Wye5GaM7gJLWp+Rs83NtOaLHwPWN0v8Y7Ny5Q44P
         Kt6TrUbIONa7RW/nAM3YilBo773Z9NwCsCi+PpR5kU5sWyNjsfWcHqv/QDsGTiqlnubx
         1G82dpHmmEouW4OV/x/1Ya/JuCwINUoeiVJEp4wfQEM+K5+3oUM95NytloLOpVmUDIDh
         FlqwYrVwsvjM1B9Wua7q4vAMzP3ObQMXLoa09b61Qc+Ka+bHJkQ8x42ioHaHRKHxTVGH
         264Q==
X-Gm-Message-State: AOAM5321d2yjC6mh781Xc+3ydR2lmtAHzK/PbdMKNy+qHUUEytiVrCFe
        4cq+8mB/ayGsDV8xu6WXanp1BJp6WULhzrJ/ZIfSAw==
X-Google-Smtp-Source: ABdhPJzaH4zTsrgzNx69iRmwyHml98ZQD9ozbnTPTQLAKWGy3HP+8cUxpbvRTv864Gyp5ehoYnUmUXzfliJFRneKZsw=
X-Received: by 2002:aca:adc4:: with SMTP id w187mr2315544oie.153.1596629329046;
 Wed, 05 Aug 2020 05:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <87tuxjgcx9.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tuxjgcx9.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 14:08:37 +0200
Message-ID: <CAMuHMdUquhgV4ahP5SScd_zBWow3QHXoS3pzcQtwOBeop3RjDA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: collect Renesas related CONFIGs in one place
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Morimoto-san,

On Tue, Aug 4, 2020 at 8:11 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Renesas related pinctrl CONFIGs are located many places when menuconfig,
> and it is confusable.
> This patch collects these into same place,
> and group into "Renesas pinctrl drivers" menu.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> ---
>  drivers/pinctrl/Kconfig        | 32 ------------------------------
>  drivers/pinctrl/sh-pfc/Kconfig | 36 ++++++++++++++++++++++++++++++++++

Shouldn't the drivers be moved, and the Makefile be adapted, too?

The main reason why the RZ/A and RZ/N pin control drivers were not added
to the sh-pfc subdirectory is because they do not use the sh-pfc
framework.

Still, it may make sense to move them.
And perhaps rename the sh-pfc subdir to renesas?  It's the largest
subsystem shared by Renesas SuperH and ARM SoCs.

Linus: what's your opinion?
Thanks!

>  2 files changed, 36 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 834c59950d1c..deb1ce8afbdb 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -205,38 +205,6 @@ config PINCTRL_ROCKCHIP
>         select GENERIC_IRQ_CHIP
>         select MFD_SYSCON
>
> -config PINCTRL_RZA1
> -       bool "Renesas RZ/A1 gpio and pinctrl driver"
> -       depends on OF
> -       depends on ARCH_R7S72100 || COMPILE_TEST
> -       select GPIOLIB
> -       select GENERIC_PINCTRL_GROUPS
> -       select GENERIC_PINMUX_FUNCTIONS
> -       select GENERIC_PINCONF
> -       help
> -         This selects pinctrl driver for Renesas RZ/A1 platforms.
> -
> -config PINCTRL_RZA2
> -       bool "Renesas RZ/A2 gpio and pinctrl driver"
> -       depends on OF
> -       depends on ARCH_R7S9210 || COMPILE_TEST
> -       select GPIOLIB
> -       select GENERIC_PINCTRL_GROUPS
> -       select GENERIC_PINMUX_FUNCTIONS
> -       select GENERIC_PINCONF
> -       help
> -         This selects GPIO and pinctrl driver for Renesas RZ/A2 platforms.
> -
> -config PINCTRL_RZN1
> -       bool "Renesas RZ/N1 pinctrl driver"
> -       depends on OF
> -       depends on ARCH_RZN1 || COMPILE_TEST
> -       select GENERIC_PINCTRL_GROUPS
> -       select GENERIC_PINMUX_FUNCTIONS
> -       select GENERIC_PINCONF
> -       help
> -         This selects pinctrl driver for Renesas RZ/N1 devices.
> -
>  config PINCTRL_SINGLE
>         tristate "One-register-per-pin type device tree based pinctrl driver"
>         depends on OF
> diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
> index 9552851b96f1..4200a3dcbb30 100644
> --- a/drivers/pinctrl/sh-pfc/Kconfig
> +++ b/drivers/pinctrl/sh-pfc/Kconfig
> @@ -3,6 +3,8 @@
>  # Renesas SH and SH Mobile PINCTRL drivers
>  #
>
> +menu "Renesas pinctrl drivers"
> +
>  config PINCTRL_SH_PFC
>         bool "Renesas SoC pin control support" if COMPILE_TEST && !(ARCH_RENESAS || SUPERH)
>         default y if ARCH_RENESAS || SUPERH
> @@ -51,6 +53,38 @@ config PINCTRL_SH_PFC
>         help
>           This enables pin control drivers for Renesas SuperH and ARM platforms
>
> +config PINCTRL_RZA1
> +       bool "RZ/A1 gpio and pinctrl driver"
> +       depends on OF
> +       depends on ARCH_R7S72100 || COMPILE_TEST
> +       select GPIOLIB
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF
> +       help
> +         This selects pinctrl driver for Renesas RZ/A1 platforms.
> +
> +config PINCTRL_RZA2
> +       bool "RZ/A2 gpio and pinctrl driver"
> +       depends on OF
> +       depends on ARCH_R7S9210 || COMPILE_TEST
> +       select GPIOLIB
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF
> +       help
> +         This selects GPIO and pinctrl driver for Renesas RZ/A2 platforms.
> +
> +config PINCTRL_RZN1
> +       bool "RZ/N1 pinctrl driver"
> +       depends on OF
> +       depends on ARCH_RZN1 || COMPILE_TEST
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF
> +       help
> +         This selects pinctrl driver for Renesas RZ/N1 devices.
> +
>  config PINCTRL_SH_PFC_GPIO
>         select GPIOLIB
>         bool
> @@ -195,3 +229,5 @@ config PINCTRL_PFC_SH7786
>  config PINCTRL_PFC_SHX3
>         bool "SH-X3 pin control support" if COMPILE_TEST
>         select PINCTRL_SH_FUNC_GPIO
> +
> +endmenu

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
