Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F3A44EAA2
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 16:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235253AbhKLPnm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 10:43:42 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:38823 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233551AbhKLPnj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 10:43:39 -0500
Received: by mail-oi1-f171.google.com with SMTP id r26so18578241oiw.5;
        Fri, 12 Nov 2021 07:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nzVMGtks6rrWhxXjE+FNEYQ2vPVnBRRsHmjFJbXZd9Q=;
        b=vSpqBZBFnDT6IrY5jZUtGrPS6lxrk9vUDGcxce2Qx2CVcBuDZXgG39W4vSScltUQpD
         +icSzoZVEig0zEXZk/pctte70d/GlzB2NUVggO2l7HgPB+m7FrmOGeCY431n//VpolIX
         SxuaQWqPAwD8j1nC9gC+uEHl0000PfCGqHS6vzf7ttp0Oc/tqYLh7a5VgxvRaIfiDWPj
         J2Z4Q1433oGGKz8ATuwLVGXOqA9fovX2lCXOeLp5p+gZ0G9lOK98egiYCWF13PxFGzG7
         Bx+JFR+UMpXSyXKc23lRmEG46EVeIz8Bi98pxEd5jgNpdf2uQZSsuhx0Dfs0RUU0VG4t
         5GfA==
X-Gm-Message-State: AOAM532VVj11Y+KMp0bNYLLCxQLc4gL8jMNTaROAs1VK6EJX2VWiEMI2
        +tgcNc8cjXhBGTZSPMbcCQ==
X-Google-Smtp-Source: ABdhPJySeCyS8+hB8H/nj8C5IHPl5OU84DQCx6Sks3+0VZ9TlDlz+wXCYcq2KKL/IdtD/aNdEV04SQ==
X-Received: by 2002:aca:110e:: with SMTP id 14mr19815794oir.100.1636731647969;
        Fri, 12 Nov 2021 07:40:47 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v20sm1294642otj.27.2021.11.12.07.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 07:40:47 -0800 (PST)
Received: (nullmailer pid 2899506 invoked by uid 1000);
        Fri, 12 Nov 2021 15:40:46 -0000
Date:   Fri, 12 Nov 2021 09:40:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wells Lu <wellslutw@gmail.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        qinjian@cqplus1.com, dvorkin@tibbo.com,
        Wells Lu <wells.lu@sunplus.com>
Subject: Re: [PATCH v2 3/3] devicetree: bindings: pinctrl: Add bindings doc
 for Sunplus SP7021.
Message-ID: <YY6K/sJi9xZLmW+W@robh.at.kernel.org>
References: <1635324926-22319-1-git-send-email-wells.lu@sunplus.com>
 <1635754277-32429-1-git-send-email-wells.lu@sunplus.com>
 <1635754277-32429-4-git-send-email-wells.lu@sunplus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635754277-32429-4-git-send-email-wells.lu@sunplus.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 01, 2021 at 04:11:17PM +0800, Wells Lu wrote:
> Add bindings documentation for Sunplus SP7021.

Patch 2 and 3 can be combined. Use consistent subjects. Patch 2 is good. 
This one is not.

> 
> Signed-off-by: Wells Lu <wells.lu@sunplus.com>
> ---
> Changes in v2:
>  - None
> 
>  .../bindings/pinctrl/sunplus,sp7021-pinctrl.yaml   | 277 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 278 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml
> new file mode 100644
> index 0000000..7cfa0ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml
> @@ -0,0 +1,277 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) Sunplus Co., Ltd. 2021
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/sunplus,sp7021-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sunplus SP7021 Pin Controller Device Tree Bindings
> +
> +maintainers:
> +  - Dvorkin Dmitry <dvorkin@tibbo.com>
> +  - Wells Lu <wells.lu@sunplus.com>
> +
> +description: |
> +  The Sunplus SP7021 pin controller is used to control SoC pins. Please
> +  refer to pinctrl-bindings.txt in this directory for details of the common
> +  pinctrl bindings used by client devices.
> +
> +  Refer to https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/pages/
> +  1443495991/How+to+setup+pins+of+SP7021+in+device-tree+source
> +
> +  The device node of pin controller of Sunplus SP7021 has following
> +  properties.
> +
> +properties:
> +  compatible:
> +    const: sunplus,sp7021-pctl
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  reg:
> +    items:
> +      - description: Base address and length of the MOON2 registers.
> +      - description: Base address and length of the GPIOXT registers.
> +      - description: Base address and length of the GPIOXT2 registers.
> +      - description: Base address and length of the FIRST registers.
> +      - description: Base address and length of the MOON1 registers.
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +patternProperties:
> +  '^.*$':
> +    if:
> +      type: object
> +    then:

For new bindings, don't use this hack. Make the node name something you 
can match on (e.g. '-pins$').

> +      description: |
> +        A pinctrl node should contain at least one subnodes representing the
> +        pins or function-pins group available on the machine. Each subnode
> +        will list the pins it needs, and how they should be configured.
> +
> +        Pinctrl node's client devices use subnodes for desired pin
> +        configuration. Client device subnodes use below standard properties.
> +
> +      properties:
> +        pins:
> +          description: |
> +            Define pins which are used by pinctrl node's client device.
> +
> +            It consists of one or more integers which represents the config
> +            setting for corresponding pin. Please use macro SPPCTL_IOPAD to
> +            define the integers for pins.
> +
> +            The first argument of the macro is pin number, the second is pin
> +            type, the third is type of GPIO, the last is default output state
> +            of GPIO.
> +          $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +        function:
> +          description: |
> +            Define pin-function which is used by pinctrl node's client device.
> +            The name should be one of string in the following enumeration.
> +          $ref: "/schemas/types.yaml#/definitions/string"
> +          enum: [ SPI_FLASH, SPI_FLASH_4BIT, SPI_NAND, CARD0_EMMC, SD_CARD,
> +                  UA0, FPGA_IFX, HDMI_TX, LCDIF, USB0_OTG, USB1_OTG ]
> +
> +        groups:
> +          description: |
> +            Define pin-group in a specified pin-function.
> +            The name should be one of string in the following enumeration.
> +          $ref: "/schemas/types.yaml#/definitions/string"
> +          enum: [ SPI_FLASH1, SPI_FLASH2, SPI_FLASH_4BIT1, SPI_FLASH_4BIT2,
> +                  SPI_NAND, CARD0_EMMC, SD_CARD, UA0, FPGA_IFX, HDMI_TX1,
> +                  HDMI_TX2, HDMI_TX3, LCDIF, USB0_OTG, USB1_OTG ]
> +
> +        zero_func:
> +          description: |
> +            Disabled pins which are not used by pinctrl node's client device.
> +          $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +      additionalProperties: false
> +
> +      allOf:
> +        - if:
> +            properties:
> +              function:
> +                enum:
> +                  - SPI_FLASH
> +          then:
> +            properties:
> +              groups:
> +                enum:
> +                  - SPI_FLASH1
> +                  - SPI_FLASH2
> +        - if:
> +            properties:
> +              function:
> +                enum:
> +                  - SPI_FLASH_4BIT
> +          then:
> +            properties:
> +              groups:
> +                enum:
> +                  - SPI_FLASH_4BIT1
> +                  - SPI_FLASH_4BIT2
> +        - if:
> +            properties:
> +              function:
> +                enum:
> +                  - SPI_NAND
> +          then:
> +            properties:
> +              groups:
> +                enum:
> +                  - SPI_NAND
> +        - if:
> +            properties:
> +              function:
> +                enum:
> +                  - CARD0_EMMC
> +          then:
> +            properties:
> +              groups:
> +                enum:
> +                  - CARD0_EMMC
> +        - if:
> +            properties:
> +              function:
> +                enum:
> +                  - SD_CARD
> +          then:
> +            properties:
> +              groups:
> +                enum:
> +                  - SD_CARD
> +        - if:
> +            properties:
> +              function:
> +                enum:
> +                  - UA0
> +          then:
> +            properties:
> +              groups:
> +                enum:
> +                  - UA0
> +        - if:
> +            properties:
> +              function:
> +                enum:
> +                  - FPGA_IFX
> +          then:
> +            properties:
> +              groups:
> +                enum:
> +                  - FPGA_IFX
> +        - if:
> +            properties:
> +              function:
> +                enum:
> +                  - HDMI_TX
> +          then:
> +            properties:
> +              groups:
> +                enum:
> +                  - HDMI_TX1
> +                  - HDMI_TX2
> +                  - HDMI_TX3
> +        - if:
> +            properties:
> +              function:
> +                enum:
> +                  - LCDIF
> +          then:
> +            properties:
> +              groups:
> +                enum:
> +                  - LCDIF
> +        - if:
> +            properties:
> +              function:
> +                enum:
> +                  - USB0_OTG
> +          then:
> +            properties:
> +              groups:
> +                enum:
> +                  - USB0_OTG
> +        - if:
> +            properties:
> +              function:
> +                enum:
> +                  - USB1_OTG
> +          then:
> +            properties:
> +              groups:
> +                enum:
> +                  - USB1_OTG
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +  - clocks
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sp-sp7021.h>
> +    #include <dt-bindings/reset/sp-sp7021.h>
> +    #include <dt-bindings/pinctrl/sppctl-sp7021.h>
> +
> +    pctl: pctl@9C000100 {

pinctl@9c000100

> +        compatible = "sunplus,sp7021-pctl";
> +        reg = <0x9C000100 0x100>, <0x9C000300 0x80>, <0x9C000380 0x80>,
> +              <0x9C0032e4 0x1C>, <0x9C000080 0x20>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        clocks = <&clkc GPIO>;
> +        resets = <&rstc RST_GPIO>;
> +
> +        pins_uart0: pins_uart0 {
> +            function = "UA0";
> +            groups = "UA0";
> +        };
> +
> +        pins_uart1: pins_uart1 {
> +            pins = <
> +                SPPCTL_IOPAD(11,SPPCTL_PCTL_G_PMUX,MUXF_UA1_TX,0)
> +                SPPCTL_IOPAD(10,SPPCTL_PCTL_G_PMUX,MUXF_UA1_RX,0)
> +                SPPCTL_IOPAD(7,SPPCTL_PCTL_G_GPIO,0,SPPCTL_PCTL_L_OUT)
> +            >;
> +        };
> +
> +        emmc_mux: emmc_mux {
> +            function = "CARD0_EMMC";
> +            groups = "CARD0_EMMC";
> +        };
> +
> +        mmc1_mux: mmc1_mux {
> +            function = "SD_CARD";
> +            groups = "SD_CARD";
> +            pins = < SPPCTL_IOPAD(91,SPPCTL_PCTL_G_GPIO,0,0) >;
> +        };
> +
> +        hdmi_A_tx1: hdmi_A_tx1_pins {
> +            function = "HDMI_TX";
> +            groups = "HDMI_TX1";
> +        };
> +        hdmi_A_tx2: hdmi_A_tx2_pins {
> +            function = "HDMI_TX";
> +            groups = "HDMI_TX2";
> +        };
> +        hdmi_A_tx3: hdmi_A_tx3_pins {
> +            function = "HDMI_TX";
> +            groups = "HDMI_TX3";
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index da6378f..11835e7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14872,6 +14872,7 @@ M:	Wells Lu <wells.lu@sunplus.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  W:	https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview
> +F:	Documentation/devicetree/bindings/pinctrl/sunplus,*
>  F:	drivers/pinctrl/sunplus/
>  F:	include/dt-bindings/pinctrl/sppctl*
>  
> -- 
> 2.7.4
> 
> 
