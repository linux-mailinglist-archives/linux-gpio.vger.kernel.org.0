Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B163992EF
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 20:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbhFBS6c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 14:58:32 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:38580 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbhFBS6c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 14:58:32 -0400
Received: by mail-oo1-f43.google.com with SMTP id o66-20020a4a44450000b029020d44dea886so798382ooa.5;
        Wed, 02 Jun 2021 11:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HV/1DfBojFUwrdMs7QrF9iDEvUgBueKT1+LXPi3QpkQ=;
        b=tmdEfx4qeAajduKcZ6A02Fs+BdhlRWoWsDXzW68djO3+uNg7Q0RCMjkNhLWkh8qGWX
         evWe/0ic7m09ljTTC9uJlPS6HnkJjB5FHlWqtRiNkop/j/U84bLUQf6dGq2Vc/vgoJcC
         Vylklj8Jc03Bg2+lGLm+47AlHLHz20tEmIXSzSDJylTWahJrhvo5EL8G9Nbgz2O2SHac
         9PkYegpvjivKVseqcbj1ztSNTuYYB6CytoqEM+UaDq2sp03Ufla3RBtnkP+XozoxrB0t
         3PSuLs7bnME/if0kFSXFEJZMK0USoA7Cne1OcTEfNmqEvj4g0MW3UI+7LMo5kBxwqXWv
         grVQ==
X-Gm-Message-State: AOAM5312B6TYzLk0gFvIyzxotENiDVJlBxOa5E9tJnD5KtpVb4qgAdkg
        2A4jRumSA3Q7b+nJ//fvuA==
X-Google-Smtp-Source: ABdhPJzrBpAEWGxOwYMpoh/3Ut0MjYQULkg9RaYiZU6Vj4WJhDG3Kvbuod0mHQ9f//AayfkabzklCg==
X-Received: by 2002:a05:6820:169:: with SMTP id k9mr25940341ood.92.1622660208407;
        Wed, 02 Jun 2021 11:56:48 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o11sm139268oog.30.2021.06.02.11.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 11:56:47 -0700 (PDT)
Received: (nullmailer pid 3775578 invoked by uid 1000);
        Wed, 02 Jun 2021 18:56:46 -0000
Date:   Wed, 2 Jun 2021 13:56:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        john@phrozen.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: gpio: stp: convert to json-schema
Message-ID: <20210602185646.GA3769998@robh.at.kernel.org>
References: <20210523173910.661598-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210523173910.661598-1-olek2@wp.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 23, 2021 at 07:39:10PM +0200, Aleksander Jan Bajkowski wrote:
> Convert the Lantiq STP Device Tree binding documentation to json-schema.
> Add the missing pinctrl property to the example. Add missing lantiq,phy3
> and lantiq,phy4 bindings for xRX300 and xRX330 SoCs.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> Changes since v2:
>  - Changed phy numbering in description of pattern Properties. Numbering
>    should start with 1. 
> Changes since v1:
>  - Renamed node to gpio.
>  - Dropped default pinctrl from this binding.
>  - Converted lantiq,phyX to patternProperties.
> ---
>  .../bindings/gpio/gpio-stp-xway.txt           |  42 --------
>  .../bindings/gpio/gpio-stp-xway.yaml          | 101 ++++++++++++++++++
>  2 files changed, 101 insertions(+), 42 deletions(-)
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
> index 000000000000..7d817d84c434
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
> @@ -0,0 +1,101 @@
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
> +    pattern: "^gpio@[0-9a-f]+$"
> +
> +  compatible:
> +    const: lantiq,gpio-stp-xway
> +
> +  reg:
> +    description:
> +      Address and length of the register set for the device.

Drop. Don't need generic descriptions.

> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    description:
> +      The first cell is the pin number and the second cell is used to specify
> +      consumer flags.
> +    const: 2
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
> +patternProperties:
> +  "lantiq,phy[1-4]":

"^lantiq,phy[1-4]$"

> +    description:
> +      The gphy core can control 3 bits of the gpio cascade. In the xRX200 family
> +      phy[1-2] are available, in xRX330 phy[1-3] and in XRX330 phy[1-4].
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0x0
> +    maximum: 0x7
> +
> +  lantiq,rising:

Not a pattern. Move to 'properties'.


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
> +    gpio@e100bb0 {
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
