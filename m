Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF68346CF1
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 23:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233659AbhCWW2X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 18:28:23 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:40945 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234562AbhCWWZb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 18:25:31 -0400
Received: by mail-io1-f46.google.com with SMTP id n21so19444625ioa.7;
        Tue, 23 Mar 2021 15:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3UEZQQ7RMfbKq29KOMPJ7OFjYy/c2+8w9Uu+gz84dH8=;
        b=obaLNuUXXklhP05nBcpYoFjpXyrXDCTWOdy748jPO4aYqJBRzfqRDbQ0jjRzOv7Y1k
         Ttk5sZ8FcikQ4ULXqcS4fD8fF159nAvnsejhnsOFrLC/Ietr7dBBG0NDnYRhLBGfWY5w
         rfIXckOIsk4JSxnNy7EGyYdf0Mt0mv7F0GS0HSHdGbKx+8vzUvOSQ/srX/hwuEH2gesK
         azJ1nNcW9YcwO4XWfNlZU5mQyFELV9DeAouDRnKJCwNpif8kMf0TficjwGTvhUFAB6Qa
         ijw+no6ME1NYzHaCkoTKzl/3qAyP3ORhlYRk9LHpQyncJgZKhjEuyBlV7NzvyOY4u2gX
         XZSg==
X-Gm-Message-State: AOAM530S01lfOYybBUWji+z2pBclVeBCLYeCl2JQypni+aLEf2X9FxEy
        0CnpgTDzAMGo6MYWiq832b0tJ4v4kA==
X-Google-Smtp-Source: ABdhPJzpye4yZ6ZA9N5nsZvxWBnNkcfhmSyb65SVrlQxKOct2In09TM3vWFyao/ESlTp5Mg6ePVyDQ==
X-Received: by 2002:a05:6602:737:: with SMTP id g23mr253177iox.130.1616538328686;
        Tue, 23 Mar 2021 15:25:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id q12sm101849ilm.63.2021.03.23.15.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:25:28 -0700 (PDT)
Received: (nullmailer pid 1454318 invoked by uid 1000);
        Tue, 23 Mar 2021 22:25:25 -0000
Date:   Tue, 23 Mar 2021 16:25:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 17/22] dt-bindings: add BCM63268 pincontroller binding
 documentation
Message-ID: <20210323222525.GA1449625@robh.at.kernel.org>
References: <20210317143803.26127-1-noltari@gmail.com>
 <20210317143803.26127-18-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317143803.26127-18-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 17, 2021 at 03:37:58PM +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the pincontrol core found in the BCM63268
> family SoCs.
> 
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com></jonas.gorski>

checkpatch.pl highlights an error here.

> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v8: add changes suggested by Rob Herring
>  v7: add changes suggested by Rob Herring
>  v6: add changes suggested by Rob Herring
>  v5: change Documentation to dt-bindings in commit title
>  v4: no changes
>  v3: add new gpio node
>  v2: remove interrupts
> 
>  .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 166 ++++++++++++++++++
>  1 file changed, 166 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
> new file mode 100644
> index 000000000000..1acd6ef38c5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm63268-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM63268 pin controller
> +
> +maintainers:
> +  - Álvaro Fernández Rojas <noltari@gmail.com>
> +  - Jonas Gorski <jonas.gorski@gmail.com>
> +
> +description:
> +  Bindings for Broadcom's BCM63268 memory-mapped pin controller.
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm63268-pinctrl
> +
> +  reg:
> +    maxItems: 3
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    $ref: pinmux-node.yaml#
> +
> +    properties:
> +      function:
> +        $ref: "pinmux-node.yaml#/properties/function"

Drop this. The previous $ref already does the same thing.

> +        enum: [ serial_led_clk, serial_led_data, hsspi_cs4, hsspi_cs5,
> +                hsspi_cs6, hsspi_cs7, adsl_spi_miso, adsl_spi_mosi,
> +                vreq_clk, pcie_clkreq_b, robosw_led_clk, robosw_led_data,
> +                nand, gpio35_alt, dectpd, vdsl_phy_override_0,
> +                vdsl_phy_override_1, vdsl_phy_override_2,
> +                vdsl_phy_override_3, dsl_gpio8, dsl_gpio9 ]
> +
> +      pins:
> +        $ref: "pinmux-node.yaml#/properties/pins"

And this.

Same applies to the other pinctrl bindings.

> +        enum: [ gpio0, gpio1, gpio16, gpio17, gpio8, gpio9, gpio18, gpio19,
> +                gpio22, gpio23, gpio30, gpio31, nand_grp, gpio35
> +                dectpd_grp, vdsl_phy_override_0_grp,
> +                vdsl_phy_override_1_grp, vdsl_phy_override_2_grp,
> +                vdsl_phy_override_3_grp, dsl_gpio8, dsl_gpio9 ]
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl@10 {
> +      compatible = "brcm,bcm63268-pinctrl";
> +      reg = <0x10 0x4>, <0x18 0x8>, <0x38 0x4>;
> +
> +      pinctrl_serial_led: serial_led-pins {
> +        pinctrl_serial_led_clk: serial_led_clk-pins {
> +          function = "serial_led_clk";
> +          pins = "gpio0";
> +        };
> +
> +        pinctrl_serial_led_data: serial_led_data-pins {
> +          function = "serial_led_data";
> +          pins = "gpio1";
> +        };
> +      };
> +
> +      pinctrl_hsspi_cs4: hsspi_cs4-pins {
> +        function = "hsspi_cs4";
> +        pins = "gpio16";
> +      };
> +
> +      pinctrl_hsspi_cs5: hsspi_cs5-pins {
> +        function = "hsspi_cs5";
> +        pins = "gpio17";
> +      };
> +
> +      pinctrl_hsspi_cs6: hsspi_cs6-pins {
> +        function = "hsspi_cs6";
> +        pins = "gpio8";
> +      };
> +
> +      pinctrl_hsspi_cs7: hsspi_cs7-pins {
> +        function = "hsspi_cs7";
> +        pins = "gpio9";
> +      };
> +
> +      pinctrl_adsl_spi: adsl_spi-pins {
> +        pinctrl_adsl_spi_miso: adsl_spi_miso-pins {
> +          function = "adsl_spi_miso";
> +          pins = "gpio18";
> +        };
> +
> +        pinctrl_adsl_spi_mosi: adsl_spi_mosi-pins {
> +          function = "adsl_spi_mosi";
> +          pins = "gpio19";
> +        };
> +      };
> +
> +      pinctrl_vreq_clk: vreq_clk-pins {
> +        function = "vreq_clk";
> +        pins = "gpio22";
> +      };
> +
> +      pinctrl_pcie_clkreq_b: pcie_clkreq_b-pins {
> +        function = "pcie_clkreq_b";
> +        pins = "gpio23";
> +      };
> +
> +      pinctrl_robosw_led_clk: robosw_led_clk-pins {
> +        function = "robosw_led_clk";
> +        pins = "gpio30";
> +      };
> +
> +      pinctrl_robosw_led_data: robosw_led_data-pins {
> +        function = "robosw_led_data";
> +        pins = "gpio31";
> +      };
> +
> +      pinctrl_nand: nand-pins {
> +        function = "nand";
> +        group = "nand_grp";
> +      };
> +
> +      pinctrl_gpio35_alt: gpio35_alt-pins {
> +        function = "gpio35_alt";
> +        pin = "gpio35";
> +      };
> +
> +      pinctrl_dectpd: dectpd-pins {
> +        function = "dectpd";
> +        group = "dectpd_grp";
> +      };
> +
> +      pinctrl_vdsl_phy_override_0: vdsl_phy_override_0-pins {
> +        function = "vdsl_phy_override_0";
> +        group = "vdsl_phy_override_0_grp";
> +      };
> +
> +      pinctrl_vdsl_phy_override_1: vdsl_phy_override_1-pins {
> +        function = "vdsl_phy_override_1";
> +        group = "vdsl_phy_override_1_grp";
> +      };
> +
> +      pinctrl_vdsl_phy_override_2: vdsl_phy_override_2-pins {
> +        function = "vdsl_phy_override_2";
> +        group = "vdsl_phy_override_2_grp";
> +      };
> +
> +      pinctrl_vdsl_phy_override_3: vdsl_phy_override_3-pins {
> +        function = "vdsl_phy_override_3";
> +        group = "vdsl_phy_override_3_grp";
> +      };
> +
> +      pinctrl_dsl_gpio8: dsl_gpio8-pins {
> +        function = "dsl_gpio8";
> +        group = "dsl_gpio8";
> +      };
> +
> +      pinctrl_dsl_gpio9: dsl_gpio9-pins {
> +        function = "dsl_gpio9";
> +        group = "dsl_gpio9";
> +      };
> +    };
> -- 
> 2.20.1
> 
