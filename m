Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6371A298E72
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 14:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1780640AbgJZNs5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 09:48:57 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:43221 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1780638AbgJZNs5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 09:48:57 -0400
Received: by mail-oo1-f66.google.com with SMTP id z14so2101815oom.10;
        Mon, 26 Oct 2020 06:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/W3rXMOeU4UW4iv7U7wh96qR+8ca/6ZnYv5sDQ2FeyY=;
        b=dXGYoRA9IRQJI4yEkK4EsaPcA2mHpbU/yLy444JyKmHPkEaCsZrGn8LpykGcWEbfmG
         G/MQ2qJdb/0zDxaR3hbQOAaFj9c3ZepxqdHqeQXr5McYE+wFeBi23Lwfrawi8Atyh4nr
         JFK7o5MuE51YhM80S6V6IsqTF7ryQGvQsdnxVfjAyQT38s1df7Op8ANQArabEaW3f9Vi
         VPvsHr9AiLbTXO4e+1xdQkm2cJh99TVVc5wOGbi4v1y6aYuoK5IGW5Ov8v2pbMaeN6Oa
         aKK5hhWBQ/DJ+E4fsEzGhRlqXvIZ1QavWE/Y2IPuQNt0gsUIKCGiZ/j0gvvh+QXz7yh0
         fViQ==
X-Gm-Message-State: AOAM533CA7foCiZVE3HuvRUdm9IopAvTxYVoValNTfMJlHqehHfhLYED
        lOqkYmd/ko3ns+tQpZyjew==
X-Google-Smtp-Source: ABdhPJwDqkBUrTzPmtu85Tlq/UdpQobzvMsc1i0t7ux0poD1zKv5XdGkpQhLohJO9HaBgZ/KeaiFkA==
X-Received: by 2002:a4a:d815:: with SMTP id f21mr14009344oov.44.1603720134465;
        Mon, 26 Oct 2020 06:48:54 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 19sm1747519oin.54.2020.10.26.06.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 06:48:53 -0700 (PDT)
Received: (nullmailer pid 57625 invoked by uid 1000);
        Mon, 26 Oct 2020 13:48:52 -0000
Date:   Mon, 26 Oct 2020 08:48:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org
Subject: Re: [PATCH v2 2/5] dt-bindings: gpio: Binding for MStar MSC313 GPIO
 controller
Message-ID: <20201026134852.GA54362@bogus>
References: <20201019141008.871177-1-daniel@0x0f.com>
 <20201019141008.871177-3-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019141008.871177-3-daniel@0x0f.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 11:10:05PM +0900, Daniel Palmer wrote:
> Add a binding description for the MStar/SigmaStar GPIO controller
> found in the MSC313 and later ARMv7 SoCs.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  .../bindings/gpio/mstar,msc313-gpio.yaml      | 61 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> new file mode 100644
> index 000000000000..8c69153ac27e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> @@ -0,0 +1,61 @@
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

The strings in your header should be defined here.

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

additionalProperties: false

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
> +      status = "okay";

Don't show status in examples.

> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a188fae8c04e..102aedca81dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2130,6 +2130,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  W:	http://linux-chenxing.org/
>  F:	Documentation/devicetree/bindings/arm/mstar/*
> +F:	Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
>  F:	arch/arm/boot/dts/mstar-*
>  F:	arch/arm/mach-mstar/
>  F:	include/dt-bindings/gpio/msc313-gpio.h
> -- 
> 2.28.0
> 
