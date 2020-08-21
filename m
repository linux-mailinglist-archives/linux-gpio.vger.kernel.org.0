Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E5024D6B5
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Aug 2020 15:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbgHUN4l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Aug 2020 09:56:41 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40546 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727925AbgHUN4k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Aug 2020 09:56:40 -0400
Received: by mail-ot1-f65.google.com with SMTP id h16so1617260oti.7;
        Fri, 21 Aug 2020 06:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QI4R6h1N15nPKIzAgnIObknClkSWsY0kPwv9SgYP8oc=;
        b=eJTOtF7ov7yiuzze/YF08k4aDbOf/GMHNZFFDuCME3DlAb/qO8d+de2oZBVJK4VESP
         NRaBMRVEnwXg90CYAwMULyUioxtX14haPeUWVSbzMU2KbXh9iJtMeNKu1xi9Bguu4f5n
         vShyU6moUwIFcl8vs/dhcMYDGwhtgSjtY19YsSq2bnDT1OioQDOTzE3Q8RJTTFT/Muh8
         N7ZYoaIdGM7u2/WXr72CXXxHSNTqyyO0lUpk3F6TZw3aGe/CT481nFZjNDPkCioRfhsG
         B51QtQWm1N8RJ3SokC4JR74pnXJSzGIJ/xiL9lRFzEBS9tpQqSeqRxq+m8n6yqvyC1Cc
         ++Gw==
X-Gm-Message-State: AOAM530h8MaWKICSZKYDU+wzShdjHxH1TXXWeAX/Wv4JCJlYfWucTRzU
        i0eCYrOaKv1Xsk7ElurmDlTELibP/butY8Zjf+g=
X-Google-Smtp-Source: ABdhPJzduzSApJkaqqM6zWyVvkjDDmu3rMnbpcfV90OsKWH5uZOgnjb/N7j10v6akB7g/ZyVsLMwRMVUzoDBTNkdVg4=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr1950619otl.145.1598018199739;
 Fri, 21 Aug 2020 06:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <87r1s5hoht.wl-kuninori.morimoto.gx@renesas.com> <87pn7phofb.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pn7phofb.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Aug 2020 15:56:28 +0200
Message-ID: <CAMuHMdWqc1Peo06g_1JrEvEExyaY+k33WJNmbhugE7YrppiRmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: sh-pfc: collect Renesas related CONFIGs
 in one place
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 17, 2020 at 6:46 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Renesas related pinctrl CONFIGs are located many places,
> and it is confusable.
> This patch collects these into same place,
> and group into "Renesas pinctrl drivers" menu.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Still wondering about moving drivers/pinctrl/pinctrl-rz{a1,a2,n1}.c
into drivers/pinctrl/sh-pfc/, too.

> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -213,38 +213,6 @@ config PINCTRL_ROCKCHIP
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
> index c461a2f1927a..a16393e6b9c2 100644
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
> @@ -52,6 +54,38 @@ config PINCTRL_SH_PFC
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
> @@ -199,3 +233,5 @@ config PINCTRL_PFC_SH7786
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
