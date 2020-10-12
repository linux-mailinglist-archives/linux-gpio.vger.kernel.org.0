Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA94A28AD0C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 06:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbgJLEfW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 00:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbgJLEfW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 00:35:22 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A15FC0613CE;
        Sun, 11 Oct 2020 21:35:22 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id t20so7852401qvv.8;
        Sun, 11 Oct 2020 21:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nGaRgY5KXDnDzgTPGxT6g3wAgRB6O4Efwdc4BkmUcUQ=;
        b=SOWUjFcCQQ64YMoS0aewIWeR2JZr4N4UPekS7iGiL3qAfsUMJ4/CkpEiG+L1PmUcdy
         0JknrUGXjVlQEGtpGwfJ+mL4W1w1sPyNaf9bo/oEwcTLRZ8fUId82aPbBnrpuUFSAW3y
         JR57zS7q5TJXMyJXE1U2e1e/AxudPhhcjIAbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nGaRgY5KXDnDzgTPGxT6g3wAgRB6O4Efwdc4BkmUcUQ=;
        b=bxOHsP+bEhu0lRPxrywbBlS2d95jlCa+LHT9278UCnrZFbXAdFiY/LHGzob53ByuZu
         lQuQ0YJJDOt1Tr30f/9FJaalIaVO7ei61GiP1RvkG8DWBr4Z4xLZVmVA9EfLQbkKuZLk
         SQ1CIxLJ8goKZygoDURD48wrMlLFqbErpgpgH/BDdReiFT0hrarbSI5iw15Ibrd71S5K
         rt9LuZrp5n0jxyuQHwPxkSWR7r9TD2MO+eggEQsmJmOofZO5XyUFm0/R4LEIzrk4o6vs
         h4hIFXu5tH0ujpoST9UTaah7B2+C8yrRVur+f7MHOFHTv/lc+WZwDtqA1d8yB/jqWCbn
         vaaA==
X-Gm-Message-State: AOAM531P3pbdsJEcCW+kj5mG6yhBsOEhHOQijFqfBK+vsc++6SIxHtl2
        EbOvgJN+b2Jy7nAWeR0sptC0okZy0AFP7c54XuBIRwIFOq0=
X-Google-Smtp-Source: ABdhPJz7CL/VjmDDY37z1JG7gnOXApbbOdETG7sUFAFSF3cJkzGsH4f/RHqySKhCjPt72g6ojvIXvmBDeknLFRJYh3I=
X-Received: by 2002:a0c:e308:: with SMTP id s8mr3269819qvl.10.1602477321232;
 Sun, 11 Oct 2020 21:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com> <20201012033150.21056-3-billy_tsai@aspeedtech.com>
In-Reply-To: <20201012033150.21056-3-billy_tsai@aspeedtech.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 12 Oct 2020 04:35:09 +0000
Message-ID: <CACPK8XdYvSmwdAkBzAO3kC8_PYa3CtPkNb0VxcOhmb2UYz5zDA@mail.gmail.com>
Subject: Re: [PATCH 2/3] Arm: dts: aspeed-g6: Add sgpio node
To:     Billy Tsai <billy_tsai@aspeedtech.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        BMC-SW <BMC-SW@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 12 Oct 2020 at 03:32, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> This patch is used to add sgpiom and sgpios nodes and add compatiable
> string for sgpiom.

You also need to add sgpios documentation to the bindings docs.

Whenever you add new device tree bindings to the kernel tree you
should add documentation for them.

When preparing patches for submission, use scripts/checkpatch.pl to
check for common issues. It will warn you if you are adding strings
that are not documented.

Cheers,

Joel

>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt |  8 +--
>  arch/arm/boot/dts/aspeed-g6.dtsi              | 52 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> index d4d83916c09d..815d9b5167a5 100644
> --- a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> +++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> @@ -1,8 +1,10 @@
>  Aspeed SGPIO controller Device Tree Bindings
>  --------------------------------------------
>
> -This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full
> -featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to
> +This SGPIO controller is for ASPEED AST2500/AST2600 SoC, it supports 2 master.
> +One is up to 128 SGPIO input ports and 128 output ports concurrently(after AST2600A1)
> +and Second one is up to 80.
> +Each of the Serial GPIO pins can be programmed to
>  support the following options:
>  - Support interrupt option for each input port and various interrupt
>    sensitivity option (level-high, level-low, edge-high, edge-low)
> @@ -14,7 +16,7 @@ support the following options:
>  Required properties:
>
>  - compatible : Should be one of
> -  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio"
> +  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio", "aspeed,ast2600-sgpiom"

I think we should add sgpiom strings for the ast2500 (and ast2400?)
too, as this is how they should have been named in the first place:

>  - compatible : Should be one of
>    "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio"
>   "aspeed,ast2400-sgpiom", "aspeed,ast2500-sgpiom", "aspeed,ast2600-sgpiom"


>  - #gpio-cells : Should be 2, see gpio.txt
>  - reg : Address and length of the register set for the device
>  - gpio-controller : Marks the device node as a GPIO controller
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index ad19dce038ea..cb053a996e87 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -366,6 +366,58 @@
>                                 #interrupt-cells = <2>;
>                         };
>
> +                       sgpiom0: sgpiom@1e780500 {
> +                               #gpio-cells = <2>;
> +                               gpio-controller;
> +                               compatible = "aspeed,ast2600-sgpiom";
> +                               reg = <0x1e780500 0x100>;
> +                               interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +                               ngpios = <128>;
> +                               clocks = <&syscon ASPEED_CLK_APB2>;
> +                               interrupt-controller;
> +                               bus-frequency = <12000000>;
> +
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pinctrl_sgpm1_default>;
> +                               status = "disabled";
> +                       };
> +
> +                       sgpiom1: sgpiom@1e780600 {
> +                               #gpio-cells = <2>;
> +                               gpio-controller;
> +                               compatible = "aspeed,ast2600-sgpiom";
> +                               reg = <0x1e780600 0x100>;
> +                               interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +                               ngpios = <80>;
> +                               clocks = <&syscon ASPEED_CLK_APB2>;
> +                               interrupt-controller;
> +                               bus-frequency = <12000000>;
> +
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pinctrl_sgpm2_default>;
> +                               status = "disabled";
> +                       };
> +
> +                       sgpios0: sgpios@1e780700 {
> +                               #gpio-cells = <2>;
> +                               gpio-controller;
> +                               compatible = "aspeed,ast2600-sgpios";
> +                               reg = <0x1e780700 0x40>;
> +                               interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&syscon ASPEED_CLK_APB2>;
> +                               status = "disabled";
> +                       };
> +
> +                       sgpios1: sgpios@1e780740 {
> +                               #gpio-cells = <2>;
> +                               gpio-controller;
> +                               compatible = "aspeed,ast2600-sgpios";
> +                               reg = <0x1e780740 0x40>;
> +                               interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&syscon ASPEED_CLK_APB2>;
> +                               status = "disabled";
> +                       };
> +
>                         gpio1: gpio@1e780800 {
>                                 #gpio-cells = <2>;
>                                 gpio-controller;
> --
> 2.17.1
>
