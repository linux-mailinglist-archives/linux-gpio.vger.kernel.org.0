Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32DBB33DFA1
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 21:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbhCPUzT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 16:55:19 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:44628 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbhCPUzC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Mar 2021 16:55:02 -0400
Received: by mail-io1-f45.google.com with SMTP id 81so38701657iou.11;
        Tue, 16 Mar 2021 13:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=b/HLRtc9/GppMSPP5tT4uFEB2bYhGH4aO6xHcwQ2WfQ=;
        b=my5GrnLQTfPKyGXWfirRVeUa7Qe3rsX2hfvaSfS8WoZCFHTWIk39tUFcWY4NdFvE6B
         LAOSF9Wza26MMmp1WBOf1cGM4z2TqPoICyBXOO8jnBQxzCQiybS1tJfst8eOWn1VPJqp
         lQO9TWXGywEW97b+099EYgwpHOS1sVgFXUZSAJL6q0vtD+AknCrLWsYl7zwCUUbZkVza
         zUwM9dHumswjoSsqTnaY33BDfxLlV2g2fl55uuCW0WiHdf5JMIv7jeYrwsZK8aGr2oXQ
         g803EnEmlyU1xkajPzvm7vDxNkI0OhIPvpxWBJQp1cIlOOWv3mbqCj/1aTev1h+/Z5o2
         Z6Uw==
X-Gm-Message-State: AOAM531Dxwn0+QRcFLV7KzwxOt5AWwld0rX9M7wVbqG7cUrXYw1jcjjN
        aK3AtOaN9HWDgMWl+vWVqTESVGMC2A==
X-Google-Smtp-Source: ABdhPJy2FFbwPfeH4HjcRF/xa3S7dCrwdPT3NP7sdc78q/Hb0Z2ft0uvTjdvs8BIYhPvswTeMdhyAA==
X-Received: by 2002:a02:53:: with SMTP id 80mr468199jaa.96.1615928094530;
        Tue, 16 Mar 2021 13:54:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id j17sm8971166iok.37.2021.03.16.13.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 13:54:54 -0700 (PDT)
Received: (nullmailer pid 3647201 invoked by uid 1000);
        Tue, 16 Mar 2021 20:54:51 -0000
Date:   Tue, 16 Mar 2021 14:54:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 03/22] dt-bindings: add BCM63XX GPIO binding
 documentation
Message-ID: <20210316205451.GA3629500@robh.at.kernel.org>
References: <20210315114214.3096-1-noltari@gmail.com>
 <20210315114214.3096-4-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210315114214.3096-4-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 12:41:55PM +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the GPIO controller found in BCM6318, BCM6328,
> BCM6358, BCM6362, BCM6368 and BCM63268 SoCs.
> 
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v7: new patch, splitted from pinctrl documentation
> 
>  .../bindings/gpio/brcm,bcm63xx-gpio.yaml      | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
> new file mode 100644
> index 000000000000..94a4f00ae2c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/brcm,bcm63xx-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM63xx GPIO controller
> +
> +maintainers:
> +  - Álvaro Fernández Rojas <noltari@gmail.com>
> +  - Jonas Gorski <jonas.gorski@gmail.com>
> +
> +description: |+
> +  The GPIO controller node should be the child of a syscon node.
> +
> +  Refer to the the bindings described in
> +  Documentation/devicetree/bindings/mfd/syscon.yaml

The above description is not too useful because it should hopefully 
later on in the series be expressed as a schema. IOW, the syscon schema 
should have a gpio child node with a $ref to this schema.

What would be useful is to say something about the GPIO block.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm6318-gpio
> +      - brcm,bcm6328-gpio
> +      - brcm,bcm6358-gpio
> +      - brcm,bcm6362-gpio
> +      - brcm,bcm6368-gpio
> +      - brcm,bcm63268-gpio
> +
> +  data:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Offset in the register map for the data register (in bytes).
> +
> +  dirout:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Offset in the register map for the dirout register (in bytes).

As I said earlier, copy what brcm,bcm6345-gpio.txt did and use reg 
instead of data and dirout properties.

That binding says it is for bcm63xx SoCs, too. So that should be 
resolved. It looks like it should be 1 binding IMO. The only difference 
I see is the number of GPIO lines and register size. The fact that the 
parent is a syscon in some cases is irrelevant.

> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - gpio-ranges
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio@0 {
> +      compatible = "brcm,bcm6328-gpio";
> +      reg = <0x0 0x10>;
> +
> +      data = <0xc>;
> +      dirout = <0x4>;
> +
> +      gpio-controller;
> +      gpio-ranges = <&pinctrl 0 0 32>;
> +      #gpio-cells = <2>;
> +    };
> +
> +  - |
> +    gpio@0 {
> +      compatible = "brcm,bcm63268-gpio";
> +      reg = <0x0 0x10>;
> +
> +      data = <0xc>;
> +      dirout = <0x4>;
> +
> +      gpio-controller;
> +      gpio-ranges = <&pinctrl 0 0 52>;
> +      #gpio-cells = <2>;
> +    };
> -- 
> 2.20.1
> 
