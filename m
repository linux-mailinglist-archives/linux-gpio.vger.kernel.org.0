Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3723670BF
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 18:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240315AbhDUQ6U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 12:58:20 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:36614 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241333AbhDUQ6S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 12:58:18 -0400
Received: by mail-oi1-f182.google.com with SMTP id v6so15240738oiv.3;
        Wed, 21 Apr 2021 09:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dj2Qh7xMKJFcrmCxu5nCBfLMViTrmBXGJolx8Z1PHiY=;
        b=OxN1OVtJTAbsBxMUCF0UfcYuviVZBp7IYt3JhOjXf0tue87x9sGa0qVh3Mi7ldfptG
         hmEzwctz+3hKolGhum2wHqym0Eeo6ngoxslPyYADQHPxsyuIBbZqCwZa1UexPkEmGjXR
         RCYnPM1kQhMCfWHn7wdO5NwDJoSblCdnt08xha4SwhgChqqA4kaNqBV+vMr/iRHN5iEx
         dpUcjeaPIJPr8EUd6X3IPhNW6USR+maYNyvKyfNKfHaIdYOQKg07lUC0piVYkom0NdPq
         gdEVJqoPpNE/POtXhIw2dsDsRf4gaZXldp439W/9klfhvlqp5fQZw3W1VGRw2cRHem4g
         GrnQ==
X-Gm-Message-State: AOAM5310hAtTGVUNWN+eS+tEGuSfIoUI1na7LJAzwmlCzOMDeL6N+6tL
        UC8uGTxLO7UDyNVOYlX1yQ==
X-Google-Smtp-Source: ABdhPJxmZP0jvFq1Lbd/6/YBHYNFZmruff1uFOT1sHcSZMAkZnvwms4oIxdDs2Ve9JMt5SkNTtDcYA==
X-Received: by 2002:aca:4806:: with SMTP id v6mr7315520oia.90.1619024264525;
        Wed, 21 Apr 2021 09:57:44 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o2sm619998oti.30.2021.04.21.09.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 09:57:43 -0700 (PDT)
Received: (nullmailer pid 1286564 invoked by uid 1000);
        Wed, 21 Apr 2021 16:57:42 -0000
Date:   Wed, 21 Apr 2021 11:57:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: pinctrl: convert Broadcom Northstar to the
 json-schema
Message-ID: <20210421165742.GA1278985@robh.at.kernel.org>
References: <20210421082928.26869-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210421082928.26869-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 21, 2021 at 10:29:28AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Important: this change converts the binding as it is. It includes
> dependency on undocumented CRU that must be refactored. That will be
> handled once every CRU MFD subdevice gets documented properly (including
> pinmux).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/pinctrl/brcm,bcm4708-pinmux.txt  | 55 -----------
>  .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 98 +++++++++++++++++++
>  2 files changed, 98 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm4708-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm4708-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm4708-pinmux.txt
> deleted file mode 100644
> index 8ab2d468dbdb..000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm4708-pinmux.txt
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -Broadcom Northstar pins mux controller
> -
> -Some of Northstar SoCs's pins can be used for various purposes thanks to the mux
> -controller. This binding allows describing mux controller and listing available
> -functions. They can be referenced later by other bindings to let system
> -configure controller correctly.
> -
> -A list of pins varies across chipsets so few bindings are available.
> -
> -Node of the pinmux must be nested in the CRU (Central Resource Unit) "syscon"
> -noce.
> -
> -Required properties:
> -- compatible: must be one of:
> -	"brcm,bcm4708-pinmux"
> -	"brcm,bcm4709-pinmux"
> -	"brcm,bcm53012-pinmux"
> -- offset: offset of pin registers in the CRU block
> -
> -Functions and their groups available for all chipsets:
> -- "spi": "spi_grp"
> -- "i2c": "i2c_grp"
> -- "pwm": "pwm0_grp", "pwm1_grp", "pwm2_grp", "pwm3_grp"
> -- "uart1": "uart1_grp"
> -
> -Additionally available on BCM4709 and BCM53012:
> -- "mdio": "mdio_grp"
> -- "uart2": "uart2_grp"
> -- "sdio": "sdio_pwr_grp", "sdio_1p8v_grp"
> -
> -For documentation of subnodes see:
> -Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> -
> -Example:
> -	dmu@1800c000 {
> -		compatible = "simple-bus";
> -		ranges = <0 0x1800c000 0x1000>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		cru@100 {
> -			compatible = "syscon", "simple-mfd";
> -			reg = <0x100 0x1a4>;
> -
> -			pinctrl {
> -				compatible = "brcm,bcm4708-pinmux";
> -				offset = <0xc0>;
> -
> -				spi-pins {
> -					function = "spi";
> -					groups = "spi_grp";
> -				};
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
> new file mode 100644
> index 000000000000..1cba8f0db5c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/brcm,ns-pinmux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom Northstar pins mux controller
> +
> +maintainers:
> +  - Rafał Miłecki <rafal@milecki.pl>
> +
> +description:
> +  Some of Northstar SoCs's pins can be used for various purposes thanks to the
> +  mux controller. This binding allows describing mux controller and listing
> +  available functions. They can be referenced later by other bindings to let
> +  system configure controller correctly.
> +
> +  A list of pins varies across chipsets so few bindings are available.
> +
> +  Node of the pinmux must be nested in the CRU (Central Resource Unit) "syscon"
> +  node.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm4708-pinmux
> +      - brcm,bcm4709-pinmux
> +      - brcm,bcm53012-pinmux
> +
> +  offset:
> +    description: offset of pin registers in the CRU block
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

How many entries are valid?

Really, this should have been just 'reg'.

> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    description: pin node
> +    $ref: pinmux-node.yaml#
> +
> +    properties:
> +      function:
> +        enum: [ spi, i2c, pwm, uart1, mdio, uart2, sdio ]
> +      groups:
> +        items:
> +          enum: [ spi_grp, i2c_grp, pwm0_grp, pwm1_grp, pwm2_grp, pwm3_grp,
> +                  uart1_grp, mdio_grp, uart2_grp, sdio_pwr_grp, sdio_1p8v_grp ]

How many items are valid?

I thought I made the meta-schema require an 'items' schema to also have 
minItems/maxItems. I'll have to check...

> +
> +    required:
> +      - function
> +      - groups
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm4708-pinmux
> +    then:
> +      patternProperties:
> +        '-pins$':
> +          properties:
> +            function:
> +              enum: [ spi, i2c, pwm, uart1 ]
> +            groups:
> +              items:
> +                enum: [ spi_grp, i2c_grp, pwm0_grp, pwm1_grp, pwm2_grp, pwm3_grp,
> +                        uart1_grp ]
> +
> +required:
> +  - offset
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dmu@1800c000 {
> +        compatible = "simple-bus";

No need to show this node in examples.

> +        ranges = <0 0x1800c000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        cru@100 {
> +            compatible = "syscon", "simple-mfd";

Is this the same CRU as your other patch?

> +            reg = <0x100 0x1a4>;
> +
> +            pinctrl {
> +                compatible = "brcm,bcm4708-pinmux";
> +                offset = <0xc0>;
> +
> +                spi-pins {
> +                    function = "spi";
> +                    groups = "spi_grp";
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.26.2
> 
