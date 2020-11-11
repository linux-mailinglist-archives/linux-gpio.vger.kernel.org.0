Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2422AFA28
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 22:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKKVGH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 16:06:07 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41382 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgKKVGH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 16:06:07 -0500
Received: by mail-oi1-f193.google.com with SMTP id m13so3763509oih.8;
        Wed, 11 Nov 2020 13:06:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WYNczxSjDE23Pwjm/JYzPYiAl8+Mw5j0D8+bwmWHfpk=;
        b=pTlIwB6Cm0E9O3TL1mSRTkDy7nFyZMtjZnxAVcpfckl01E62gsQ2LpyBlaT48tz0Ul
         GallqnVb2X6/YelpRCskCujYyh87M8niWbtUbOOPECcs7Uf0+7ylHwlA2P0H7NRjrUUy
         DPG1Au7jAdnUHQK43+qvSoMSfQhbU+2BWQ2k4HbfuTWErrn3EehwasYU05XVzGEUJ7Vj
         FW1yM4j4bvnh3CSKPXMkl9d6ti+sVIFk3tnLKlcPcZbkaOnKQB9yV6/LB9vwnOCcoDLb
         2LSma+skSgHbEmrpCdaTxt7q0l2Q1XwYKolrNzhWPb3MeQng+SN6Y0YqSFfzoMIVbPR5
         +slg==
X-Gm-Message-State: AOAM5310pHZ2ma9sQrbVI95ygiyojO59IrhlRM+MymaFLr6vkh13+/R4
        TjSA2sWkA1tS41S8Ahew+A==
X-Google-Smtp-Source: ABdhPJzKxe8G0bEDi5iOyK9Zh2c59ErqGs3ZMcQtD3yw7+8doRWZsx/HDary7B0zdkaBRLQqFHt1Iw==
X-Received: by 2002:aca:3a46:: with SMTP id h67mr3536472oia.21.1605128764582;
        Wed, 11 Nov 2020 13:06:04 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n21sm661975oie.15.2020.11.11.13.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 13:06:03 -0800 (PST)
Received: (nullmailer pid 2031561 invoked by uid 1000);
        Wed, 11 Nov 2020 21:06:02 -0000
Date:   Wed, 11 Nov 2020 15:06:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     soc@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, w@1wt.eu
Subject: Re: [PATCH v3 2/5] dt-bindings: gpio: Binding for MStar MSC313 GPIO
 controller
Message-ID: <20201111210602.GA1974594@bogus>
References: <20201109121731.1537580-1-daniel@0x0f.com>
 <20201109121731.1537580-3-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109121731.1537580-3-daniel@0x0f.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 09:17:28PM +0900, Daniel Palmer wrote:
> Add a binding description for the MStar/SigmaStar GPIO controller
> found in the MSC313 and later ARMv7 SoCs.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  .../bindings/gpio/mstar,msc313-gpio.yaml      | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> new file mode 100644
> index 000000000000..8c7cfe3a51b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/mstar,msc313-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MStar/SigmaStar GPIO controller
> +
> +maintainers:
> +  - Daniel Palmer <daniel@thingy.jp>
> +
> +properties:
> +  $nodename:
> +    pattern: "^gpio@[0-9a-f]+$"
> +
> +  compatible:
> +    const: mstar,msc313-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-ranges: true
> +
> +  gpio-ranges-group-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array

Not a standard property. Probably should be dropped, but why do you need 
this and what is it for?

> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/msc313-gpio.h>
> +
> +    gpio: gpio@207800 {
> +      compatible = "mstar,msc313e-gpio";
> +      #gpio-cells = <2>;
> +      reg = <0x207800 0x200>;
> +      gpio-controller;
> +      gpio-ranges = <&pinctrl 0 36 22>,
> +                    <&pinctrl 22 63 4>,
> +                    <&pinctrl 26 68 6>;
> +      #interrupt-cells = <2>;
> +      interrupt-controller;
> +      interrupt-parent = <&intc_fiq>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index db9c008a0395..87ca71f55de3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2131,6 +2131,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  W:	http://linux-chenxing.org/
>  F:	Documentation/devicetree/bindings/arm/mstar/*
> +F:	Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
>  F:	arch/arm/boot/dts/mstar-*
>  F:	arch/arm/mach-mstar/
>  F:	include/dt-bindings/gpio/msc313-gpio.h
> -- 
> 2.29.2
> 
