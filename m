Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30799579FD
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 05:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfF0DcT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 23:32:19 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46301 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbfF0DcT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 23:32:19 -0400
Received: by mail-qt1-f193.google.com with SMTP id h21so900548qtn.13;
        Wed, 26 Jun 2019 20:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bOKSn4h8UbNa4bhH6s8l9K8A6O5RgA8nAwBLjlOPwUM=;
        b=DdUG37bvOwcyaWSy6M13nTaI2R8usW/b5i+Lo4o91DIKR+Yv4aYaqKt3LwZCRoIwXF
         RMH1KHIsWn5AbYj/OG3mKgQkK/CJO+GwSMzPNXjYSMtN3NvsLmLxKuUcN/BThWUw5l4I
         Zt5C+xwKKibH8zeEtBf6n4dlyyNaD93v0oi60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bOKSn4h8UbNa4bhH6s8l9K8A6O5RgA8nAwBLjlOPwUM=;
        b=ZtWEPDtnIhEqFKkOCgEbRxFSEan32sU/VY+wHjUMHQsv3NIOxlFs/dLs6ieqOxAeuE
         pseOvLuKNwO2nUtdhnZzTBdrDUSyOr5IV8+yPhGGedAoJ3W1eozvgGl07iHCmf+rIOUH
         W24iy/JpQt4FodiKSYsyPEzWlQ/C+928RIyPFFhQ8igZZSIsGxZ/UMrLPGQhtb64fPXx
         zjhyIhs75Cqa9Sw5fjFr9DpaM7lcI+4/QQakH1Tk3Yv8ishWQl6Xbi9GuE8iF04FQq/+
         9rB7esBCq3qLJI03VrK/ix6hR5p9VK37OEREHXVRt70EtcwmoTO+Oz6bJqBOuySniB+1
         OAHA==
X-Gm-Message-State: APjAAAXgWBw366EvJRVvC2SsHMcN9SVgwwUGdUkqtW0Rp/bqyO2fqcKx
        9S+GY/nHV0bvsidbGaFG8SEnx34QwwsY1RdMNdA=
X-Google-Smtp-Source: APXvYqy0OoXzrm4i8gt1EjUI1gu1q3ZGM0JJPJEbSEDvnzmmpEcORgo8+O/90MFlItcdWHr9XA7yiuZt1aoWyz+PUws=
X-Received: by 2002:a0c:afd5:: with SMTP id t21mr1134555qvc.105.1561606337880;
 Wed, 26 Jun 2019 20:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190626071430.28556-1-andrew@aj.id.au> <20190626071430.28556-2-andrew@aj.id.au>
In-Reply-To: <20190626071430.28556-2-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 27 Jun 2019 03:32:06 +0000
Message-ID: <CACPK8Xfdd1ReAHr9f6zRbZ-WJRquDJsTdUQeT_JuEBhOzS8tig@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: pinctrl: aspeed: Split bindings document
 in two
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-gpio@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-aspeed@lists.ozlabs.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 26 Jun 2019 at 07:15, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Have one for each of the AST2400 and AST2500. The only thing that was
> common was the fact that both support ASPEED BMC SoCs.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../pinctrl/aspeed,ast2400-pinctrl.txt        | 80 +++++++++++++++++++
>  ...-aspeed.txt => aspeed,ast2500-pinctrl.txt} | 63 ++-------------
>  2 files changed, 85 insertions(+), 58 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
>  rename Documentation/devicetree/bindings/pinctrl/{pinctrl-aspeed.txt => aspeed,ast2500-pinctrl.txt} (66%)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
> new file mode 100644
> index 000000000000..67e0325ccf2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
> @@ -0,0 +1,80 @@
> +=============================
> +Aspeed AST2400 Pin Controller
> +=============================
> +
> +Required properties for the AST2400:
> +- compatible :                         Should be one of the following:
> +                               "aspeed,ast2400-pinctrl"
> +                               "aspeed,g4-pinctrl"
> +
> +The pin controller node should be the child of a syscon node with the required
> +property:
> +
> +- compatible :                 Should be one of the following:
> +                       "aspeed,ast2400-scu", "syscon", "simple-mfd"
> +                       "aspeed,g4-scu", "syscon", "simple-mfd"

I think we can use this as an opportunity to drop the unused g4-scu
compatible from the bindings. Similarly for the g5.

Acked-by: Joel Stanley <joel@jms.id.au>

> +
> +Refer to the the bindings described in
> +Documentation/devicetree/bindings/mfd/syscon.txt
> +
> +Subnode Format
> +==============
> +
> +The required properties of pinmux child nodes are:
> +- function: the mux function to select
> +- groups  : the list of groups to select with this function
> +
> +Required properties of pinconf child nodes are:
> +- groups: A list of groups to select (either this or "pins" must be
> +          specified)
> +- pins  : A list of ball names as strings, eg "D14" (either this or "groups"
> +          must be specified)
> +
> +Optional properties of pinconf child nodes are:
> +- bias-disable  : disable any pin bias
> +- bias-pull-down: pull down the pin
> +- drive-strength: sink or source at most X mA
> +
> +Definitions are as specified in
> +Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt, with any
> +further limitations as described above.
> +
> +For pinmux, each mux function has only one associated pin group. Each group is
> +named by its function. The following values for the function and groups
> +properties are supported:
> +
> +ACPI ADC0 ADC1 ADC10 ADC11 ADC12 ADC13 ADC14 ADC15 ADC2 ADC3 ADC4 ADC5 ADC6
> +ADC7 ADC8 ADC9 BMCINT DDCCLK DDCDAT EXTRST FLACK FLBUSY FLWP GPID GPID0 GPID2
> +GPID4 GPID6 GPIE0 GPIE2 GPIE4 GPIE6 I2C10 I2C11 I2C12 I2C13 I2C14 I2C3 I2C4
> +I2C5 I2C6 I2C7 I2C8 I2C9 LPCPD LPCPME LPCRST LPCSMI MAC1LINK MAC2LINK MDIO1
> +MDIO2 NCTS1 NCTS2 NCTS3 NCTS4 NDCD1 NDCD2 NDCD3 NDCD4 NDSR1 NDSR2 NDSR3 NDSR4
> +NDTR1 NDTR2 NDTR3 NDTR4 NDTS4 NRI1 NRI2 NRI3 NRI4 NRTS1 NRTS2 NRTS3 OSCCLK PWM0
> +PWM1 PWM2 PWM3 PWM4 PWM5 PWM6 PWM7 RGMII1 RGMII2 RMII1 RMII2 ROM16 ROM8 ROMCS1
> +ROMCS2 ROMCS3 ROMCS4 RXD1 RXD2 RXD3 RXD4 SALT1 SALT2 SALT3 SALT4 SD1 SD2 SGPMCK
> +SGPMI SGPMLD SGPMO SGPSCK SGPSI0 SGPSI1 SGPSLD SIOONCTRL SIOPBI SIOPBO SIOPWREQ
> +SIOPWRGD SIOS3 SIOS5 SIOSCI SPI1 SPI1DEBUG SPI1PASSTHRU SPICS1 TIMER3 TIMER4
> +TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2 TXD3 TXD4 UART6 USB11D1 USB11H2 USB2D1
> +USB2H1 USBCKI VGABIOS_ROM VGAHS VGAVS VPI18 VPI24 VPI30 VPO12 VPO24 WDTRST1
> +WDTRST2
> +
> +Example
> +=======
> +
> +syscon: scu@1e6e2000 {
> +       compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
> +       reg = <0x1e6e2000 0x1a8>;
> +
> +       pinctrl: pinctrl {
> +               compatible = "aspeed,g4-pinctrl";
> +
> +               pinctrl_i2c3_default: i2c3_default {
> +                       function = "I2C3";
> +                       groups = "I2C3";
> +               };
> +
> +               pinctrl_gpioh0_unbiased_default: gpioh0 {
> +                       pins = "A8";
> +                       bias-disable;
> +               };
> +       };
> +};
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.txt
> similarity index 66%
> rename from Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> rename to Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.txt
> index 3b7266c7c438..2f16e401338a 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.txt
> @@ -1,14 +1,6 @@
> -======================
> -Aspeed Pin Controllers
> -======================
> -
> -The Aspeed SoCs vary in functionality inside a generation but have a common mux
> -device register layout.
> -
> -Required properties for g4:
> -- compatible :                         Should be one of the following:
> -                               "aspeed,ast2400-pinctrl"
> -                               "aspeed,g4-pinctrl"
> +=============================
> +Aspeed AST2500 Pin Controller
> +=============================
>
>  Required properties for g5:
>  - compatible :                         Should be one of the following:
> @@ -23,8 +15,6 @@ The pin controller node should be the child of a syscon node with the required
>  property:
>
>  - compatible :                 Should be one of the following:
> -                       "aspeed,ast2400-scu", "syscon", "simple-mfd"
> -                       "aspeed,g4-scu", "syscon", "simple-mfd"
>                         "aspeed,ast2500-scu", "syscon", "simple-mfd"
>                         "aspeed,g5-scu", "syscon", "simple-mfd"
>
> @@ -57,24 +47,6 @@ For pinmux, each mux function has only one associated pin group. Each group is
>  named by its function. The following values for the function and groups
>  properties are supported:
>
> -aspeed,ast2400-pinctrl, aspeed,g4-pinctrl:
> -
> -ACPI ADC0 ADC1 ADC10 ADC11 ADC12 ADC13 ADC14 ADC15 ADC2 ADC3 ADC4 ADC5 ADC6
> -ADC7 ADC8 ADC9 BMCINT DDCCLK DDCDAT EXTRST FLACK FLBUSY FLWP GPID GPID0 GPID2
> -GPID4 GPID6 GPIE0 GPIE2 GPIE4 GPIE6 I2C10 I2C11 I2C12 I2C13 I2C14 I2C3 I2C4
> -I2C5 I2C6 I2C7 I2C8 I2C9 LPCPD LPCPME LPCRST LPCSMI MAC1LINK MAC2LINK MDIO1
> -MDIO2 NCTS1 NCTS2 NCTS3 NCTS4 NDCD1 NDCD2 NDCD3 NDCD4 NDSR1 NDSR2 NDSR3 NDSR4
> -NDTR1 NDTR2 NDTR3 NDTR4 NDTS4 NRI1 NRI2 NRI3 NRI4 NRTS1 NRTS2 NRTS3 OSCCLK PWM0
> -PWM1 PWM2 PWM3 PWM4 PWM5 PWM6 PWM7 RGMII1 RGMII2 RMII1 RMII2 ROM16 ROM8 ROMCS1
> -ROMCS2 ROMCS3 ROMCS4 RXD1 RXD2 RXD3 RXD4 SALT1 SALT2 SALT3 SALT4 SD1 SD2 SGPMCK
> -SGPMI SGPMLD SGPMO SGPSCK SGPSI0 SGPSI1 SGPSLD SIOONCTRL SIOPBI SIOPBO SIOPWREQ
> -SIOPWRGD SIOS3 SIOS5 SIOSCI SPI1 SPI1DEBUG SPI1PASSTHRU SPICS1 TIMER3 TIMER4
> -TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2 TXD3 TXD4 UART6 USB11D1 USB11H2 USB2D1
> -USB2H1 USBCKI VGABIOS_ROM VGAHS VGAVS VPI18 VPI24 VPI30 VPO12 VPO24 WDTRST1
> -WDTRST2
> -
> -aspeed,ast2500-pinctrl, aspeed,g5-pinctrl:
> -
>  ACPI ADC0 ADC1 ADC10 ADC11 ADC12 ADC13 ADC14 ADC15 ADC2 ADC3 ADC4 ADC5 ADC6
>  ADC7 ADC8 ADC9 BMCINT DDCCLK DDCDAT ESPI FWSPICS1 FWSPICS2 GPID0 GPID2 GPID4
>  GPID6 GPIE0 GPIE2 GPIE4 GPIE6 I2C10 I2C11 I2C12 I2C13 I2C14 I2C3 I2C4 I2C5 I2C6
> @@ -90,33 +62,8 @@ SPI2CS1 SPI2MISO SPI2MOSI TIMER3 TIMER4 TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2
>  TXD3 TXD4 UART6 USB11BHID USB2AD USB2AH USB2BD USB2BH USBCKI VGABIOSROM VGAHS
>  VGAVS VPI24 VPO WDTRST1 WDTRST2
>
> -Examples
> -========
> -
> -g4 Example
> -----------
> -
> -syscon: scu@1e6e2000 {
> -       compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
> -       reg = <0x1e6e2000 0x1a8>;
> -
> -       pinctrl: pinctrl {
> -               compatible = "aspeed,g4-pinctrl";
> -
> -               pinctrl_i2c3_default: i2c3_default {
> -                       function = "I2C3";
> -                       groups = "I2C3";
> -               };
> -
> -               pinctrl_gpioh0_unbiased_default: gpioh0 {
> -                       pins = "A8";
> -                       bias-disable;
> -               };
> -       };
> -};
> -
> -g5 Example
> -----------
> +Example
> +=======
>
>  ahb {
>         apb {
> --
> 2.20.1
>
