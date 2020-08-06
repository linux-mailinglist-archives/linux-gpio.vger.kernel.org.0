Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 438C723DF19
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 19:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729675AbgHFRiH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Aug 2020 13:38:07 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46143 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728326AbgHFRiG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Aug 2020 13:38:06 -0400
Received: by mail-pg1-f194.google.com with SMTP id p8so11196626pgn.13;
        Thu, 06 Aug 2020 10:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=95jSJ3te6UKN4c4qj8dg70elf5G/isxuGiBIgEMkyo4=;
        b=EIcvJ7lK4mbR9atV3K6U8lU7zB6WPVYeKEfHMOL2vTFApi1VvsG73xiFcfA2Vt5D4S
         j65/Djo/7ldn3LVK1PJlmG0PzxM5Oo1DmMCzFhB2QHLjNyzTtUHjWLW6D5zTsUTOkq2D
         bRd3fv2ZYOvUm5RsorSXR2yMoYYqdKm4rE3eZ6rc8ZEDHTKsnqBdLo3flNM2opsnEQNf
         XTwZzbOsTkPYMHL122ZtbQhFlOQ6CiSNPgL1ZPkRqm/0X6nhlg0isRpo+F8el069Io6s
         HwDGKEal2unRt9R7VA/QdQDeXPlZRJhDYAu9jBPcvva9haI9o0uDWd2r30rV7l5z7xOE
         U27Q==
X-Gm-Message-State: AOAM533yzY51CR9teDy50IF5TFdARv01YWe6P1+Iz8cVHJm0FJU10g5Y
        bnSyiycLhGfBWWgYvaFcZHWa/hc=
X-Google-Smtp-Source: ABdhPJzQxlCrKaCEA8CQun+YjOCdHUSTdRtuoUW6K/DZaJTY7WtbL+3D++zT8k6Zo/rMhN92CumwdA==
X-Received: by 2002:a92:b60a:: with SMTP id s10mr11082869ili.119.1596722908050;
        Thu, 06 Aug 2020 07:08:28 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id h12sm4131184ilo.79.2020.08.06.07.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 07:08:27 -0700 (PDT)
Received: (nullmailer pid 770192 invoked by uid 1000);
        Thu, 06 Aug 2020 14:08:25 -0000
Date:   Thu, 6 Aug 2020 08:08:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        stefan@agner.ch, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH] dt-bindings: gpio: Convert vf610 to json-schema
Message-ID: <20200806140825.GB766974@bogus>
References: <1596553308-13190-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596553308-13190-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 04, 2020 at 11:01:48PM +0800, Anson Huang wrote:
> Convert the vf610 gpio binding to DT schema format using json-schema.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-vf610.txt        | 63 -----------------
>  .../devicetree/bindings/gpio/gpio-vf610.yaml       | 79 ++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 63 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-vf610.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.txt b/Documentation/devicetree/bindings/gpio/gpio-vf610.txt
> deleted file mode 100644
> index ae254aa..0000000
> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.txt
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -* Freescale VF610 PORT/GPIO module
> -
> -The Freescale PORT/GPIO modules are two adjacent modules providing GPIO
> -functionality. Each pair serves 32 GPIOs. The VF610 has 5 instances of
> -each, and each PORT module has its own interrupt.
> -
> -Required properties for GPIO node:
> -- compatible : Should be "fsl,<soc>-gpio", below is supported list:
> -	       "fsl,vf610-gpio"
> -	       "fsl,imx7ulp-gpio"
> -- reg : The first reg tuple represents the PORT module, the second tuple
> -  the GPIO module.
> -- interrupts : Should be the port interrupt shared by all 32 pins.
> -- gpio-controller : Marks the device node as a gpio controller.
> -- #gpio-cells : Should be two. The first cell is the pin number and
> -  the second cell is used to specify the gpio polarity:
> -      0 = active high
> -      1 = active low
> -- interrupt-controller: Marks the device node as an interrupt controller.
> -- #interrupt-cells : Should be 2.  The first cell is the GPIO number.
> -  The second cell bits[3:0] is used to specify trigger type and level flags:
> -      1 = low-to-high edge triggered.
> -      2 = high-to-low edge triggered.
> -      4 = active high level-sensitive.
> -      8 = active low level-sensitive.
> -
> -Optional properties:
> --clocks:	Must contain an entry for each entry in clock-names.
> -		See common clock-bindings.txt for details.
> --clock-names:	A list of clock names. For imx7ulp, it must contain
> -		"gpio", "port".
> -
> -Note: Each GPIO port should have an alias correctly numbered in "aliases"
> -node.
> -
> -Examples:
> -
> -aliases {
> -	gpio0 = &gpio1;
> -	gpio1 = &gpio2;
> -};
> -
> -gpio1: gpio@40049000 {
> -	compatible = "fsl,vf610-gpio";
> -	reg = <0x40049000 0x1000 0x400ff000 0x40>;
> -	interrupts = <0 107 IRQ_TYPE_LEVEL_HIGH>;
> -	gpio-controller;
> -	#gpio-cells = <2>;
> -	interrupt-controller;
> -	#interrupt-cells = <2>;
> -	gpio-ranges = <&iomuxc 0 0 32>;
> -};
> -
> -gpio2: gpio@4004a000 {
> -	compatible = "fsl,vf610-gpio";
> -	reg = <0x4004a000 0x1000 0x400ff040 0x40>;
> -	interrupts = <0 108 IRQ_TYPE_LEVEL_HIGH>;
> -	gpio-controller;
> -	#gpio-cells = <2>;
> -	interrupt-controller;
> -	#interrupt-cells = <2>;
> -	gpio-ranges = <&iomuxc 0 32 32>;
> -};
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> new file mode 100644
> index 0000000..315ffde
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale VF610 PORT/GPIO module
> +
> +maintainers:
> +  - Stefan Agner <stefan@agner.ch>
> +
> +description: |
> +  The Freescale PORT/GPIO modules are two adjacent modules providing GPIO
> +  functionality. Each pair serves 32 GPIOs. The VF610 has 5 instances of
> +  each, and each PORT module has its own interrupt.
> +
> +  Note: Each GPIO port should have an alias correctly numbered in "aliases"
> +  node.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,vf610-gpio
> +      - fsl,imx7ulp-gpio
> +
> +  reg:
> +    description: The first reg tuple represents the PORT module, the second tuple
> +      represents the GPIO module.
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  clocks:
> +    items:
> +      - description: SoC GPIO clock
> +      - description: SoC PORT clock
> +
> +  clock-names:
> +    items:
> +      - const: gpio
> +      - const: port
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - "#gpio-cells"
> +  - gpio-controller

additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpio1: gpio@40049000 {
> +        compatible = "fsl,vf610-gpio";
> +        reg = <0x40049000 0x1000 0x400ff000 0x40>;
> +        interrupts = <0 107 IRQ_TYPE_LEVEL_HIGH>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        gpio-ranges = <&iomuxc 0 0 32>;
> +    };
> -- 
> 2.7.4
> 
