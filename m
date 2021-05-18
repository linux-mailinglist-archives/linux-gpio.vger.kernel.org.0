Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21FED386F07
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 03:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237500AbhERBUU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 21:20:20 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:43688 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbhERBUU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 21:20:20 -0400
Received: by mail-ot1-f41.google.com with SMTP id u19-20020a0568302493b02902d61b0d29adso7237646ots.10;
        Mon, 17 May 2021 18:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8YBfycSTZM5eXxJrQDdNoVunHQ8cvvjZR/bZOnqm4wI=;
        b=GBBAwh3eaAiGyNDU+gIlhzrPXDdy7xLz9pilHWoPPnEXOMFL/1OdSrRhQEu8/NxmA1
         rXMa+qJqbKFpkKI7+DbYUNqkMu0RMFAQX+5cP43Ksw5Oa63SJFU4BjggearxIuJOVInL
         xHsb3Nj1K517AZ+Yr6uaRdHTEGUbzTiBooAAt+WURoeIgA6LDcLR7ja9tH84dCgilwGt
         FB4uYLP63B8zEQnmWB/Reh9enFh+yFqj14f/Jmpr1qGfTrMFovgJFNO44N5gmDEYn+j8
         egTC9BGM+jOgR/sKxxN7PESddliKS0yLAaematgbObT71moJfCl81KM6jqBWfy9B/5oD
         c3MA==
X-Gm-Message-State: AOAM532GSPBbxvctftmQDxPcBAxsTqyNidLpJWmTCjweZ+4EHx/+1UC3
        JInN8T96OLfkbCI6X0G8ww==
X-Google-Smtp-Source: ABdhPJwyn2+Bvltt5aKy/7oS706JXMsz1eSLk8H5Hcjb/jn2TtOh5P9eq0Jl5y7qHcu6PlO45SsFZw==
X-Received: by 2002:a9d:4505:: with SMTP id w5mr1979413ote.265.1621300742850;
        Mon, 17 May 2021 18:19:02 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v79sm3087254oia.14.2021.05.17.18.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:19:01 -0700 (PDT)
Received: (nullmailer pid 3585969 invoked by uid 1000);
        Tue, 18 May 2021 01:19:00 -0000
Date:   Mon, 17 May 2021 20:19:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        john@phrozen.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: stp: convert to json-schema
Message-ID: <20210518011900.GA3581937@robh.at.kernel.org>
References: <20210513210340.10466-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513210340.10466-1-olek2@wp.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 13, 2021 at 11:03:39PM +0200, Aleksander Jan Bajkowski wrote:
> Convert the Lantiq STP Device Tree binding documentation to json-schema.
> Add the missing pinctrl property.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../bindings/gpio/gpio-stp-xway.txt           |  42 -------
>  .../bindings/gpio/gpio-stp-xway.yaml          | 117 ++++++++++++++++++
>  2 files changed, 117 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt
> deleted file mode 100644
> index 78458adbf4b7..000000000000
> --- a/Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Lantiq SoC Serial To Parallel (STP) GPIO controller
> -
> -The Serial To Parallel (STP) is found on MIPS based Lantiq socs. It is a
> -peripheral controller used to drive external shift register cascades. At most
> -3 groups of 8 bits can be driven. The hardware is able to allow the DSL modem
> -to drive the 2 LSBs of the cascade automatically.
> -
> -
> -Required properties:
> -- compatible : Should be "lantiq,gpio-stp-xway"
> -- reg : Address and length of the register set for the device
> -- #gpio-cells : Should be two.  The first cell is the pin number and
> -  the second cell is used to specify optional parameters (currently
> -  unused).
> -- gpio-controller : Marks the device node as a gpio controller.
> -
> -Optional properties:
> -- lantiq,shadow : The default value that we shall assume as already set on the
> -  shift register cascade.
> -- lantiq,groups : Set the 3 bit mask to select which of the 3 groups are enabled
> -  in the shift register cascade.
> -- lantiq,dsl : The dsl core can control the 2 LSBs of the gpio cascade. This 2 bit
> -  property can enable this feature.
> -- lantiq,phy1 : The gphy1 core can control 3 bits of the gpio cascade.
> -- lantiq,phy2 : The gphy2 core can control 3 bits of the gpio cascade.
> -- lantiq,rising : use rising instead of falling edge for the shift register
> -
> -Example:
> -
> -gpio1: stp@e100bb0 {
> -	compatible = "lantiq,gpio-stp-xway";
> -	reg = <0xE100BB0 0x40>;
> -	#gpio-cells = <2>;
> -	gpio-controller;
> -
> -	lantiq,shadow = <0xffff>;
> -	lantiq,groups = <0x7>;
> -	lantiq,dsl = <0x3>;
> -	lantiq,phy1 = <0x7>;
> -	lantiq,phy2 = <0x7>;
> -	/* lantiq,rising; */
> -};
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
> new file mode 100644
> index 000000000000..a36acc98898c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-stp-xway.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq SoC Serial To Parallel (STP) GPIO controller
> +
> +description: |
> +  The Serial To Parallel (STP) is found on MIPS based Lantiq socs. It is a
> +  peripheral controller used to drive external shift register cascades. At most
> +  3 groups of 8 bits can be driven. The hardware is able to allow the DSL modem
> +  and Ethernet PHYs to drive some bytes of the cascade automatically.
> +
> +maintainers:
> +  - John Crispin <john@phrozen.org>
> +
> +properties:
> +  $nodename:
> +    pattern: "^stp@[0-9a-f]+$"

gpio@...

> +
> +  compatible:
> +    const: lantiq,gpio-stp-xway
> +
> +  reg:
> +    description:
> +      Address and length of the register set for the device.
> +    maxItems: 1
> +
> +  gpio-controller:
> +    description:
> +      Marks the device node as a gpio controller.
> +    type: boolean

Just:

gpio-controller: true

This property already has a type and description.

> +
> +  "#gpio-cells":
> +    description:
> +      The first cell is the pin number and the second cell is used to specify
> +      consumer flags.
> +    const: 2
> +

> +  pinctrl-0:
> +    description: Should specify pin control groups used for this controller.
> +
> +  pinctrl-names:
> +    const: default

You can drop these. They are supported by default.

> +
> +  lantiq,shadow:
> +    description:
> +      The default value that we shall assume as already set on the
> +      shift register cascade.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0x000000
> +    maximum: 0xffffff
> +
> +  lantiq,groups:
> +    description:
> +      Set the 3 bit mask to select which of the 3 groups are enabled
> +      in the shift register cascade.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0x0
> +    maximum: 0x7
> +
> +  lantiq,dsl:
> +    description:
> +      The dsl core can control the 2 LSBs of the gpio cascade. This 2 bit
> +      property can enable this feature.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0x0
> +    maximum: 0x3
> +
> +  lantiq,phy1:
> +    description:
> +      The gphy1 core can control 3 bits of the gpio cascade. Available on
> +      the xRX200, xRX300 and xRX330 family.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0x0
> +    maximum: 0x7
> +
> +  lantiq,phy2:
> +    description:
> +      The gphy2 core can control 3 bits of the gpio cascade. Available on
> +      the xRX200, xRX300 and xRX330 family.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0x0
> +    maximum: 0x7
> +
> +  lantiq,rising:
> +    description:
> +      Use rising instead of falling edge for the shift register.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    stp: stp@e100bb0 {
> +        compatible = "lantiq,gpio-stp-xway";
> +        reg = <0xE100BB0 0x40>;
> +        #gpio-cells = <2>;
> +        gpio-controller;
> +
> +        pinctrl-0 = <&stp_pins>;
> +        pinctrl-names = "default";
> +
> +        lantiq,shadow = <0xffffff>;
> +        lantiq,groups = <0x7>;
> +        lantiq,dsl = <0x3>;
> +        lantiq,phy1 = <0x7>;
> +        lantiq,phy2 = <0x7>;
> +    };
> +...
> -- 
> 2.30.2
> 
