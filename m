Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160B71E6DE6
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 23:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436590AbgE1Vms (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 17:42:48 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:40495 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436581AbgE1Vmq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 17:42:46 -0400
Received: by mail-il1-f194.google.com with SMTP id a18so458496ilp.7;
        Thu, 28 May 2020 14:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kKfMEdEPf1qQORIeLe3Cv29R1EeXGe6brVInGMzh/i8=;
        b=bbtrpU57Eb48sz9j5rF7mf9ITYpOwEmLH1+ZRRptqPYHKqZQeK5XOAs5gqCG4l9zCQ
         VBx3XUWy/mxw9VQ93lKLd64w0D+gwZCANRcZzENq8ArWccbWwp5a50o8nxMYECZU0tel
         DxA4p71XO+a/C1coIUMJcwbi9OuIu7gfNNRzjoUDIeyLGZfplxry2gtEQ186Ex810/vO
         ldFMIp7mSSPIbu1GowRIt3b3iYTuGZG8sF8A6lAVpONQFjv95/iDeJK9wLxW9Bsear4q
         cFnGL39ADlkWnG/W12SJhT9vlElfyBLgQaNtTUoeNVu/Bpu6DhhsolDtq5cR3q746ZXA
         RGgA==
X-Gm-Message-State: AOAM532XWTob9/xdu6PUmDYjRxNy3j+OUhyA4VO/u5fuVYeTcLuIAjMB
        8XCHyuSwmx7wOTQrIiqcpg==
X-Google-Smtp-Source: ABdhPJwzMqJMjsR6qnJhFZThxIFACTIgnQWqf3/oGxPMvS4qxVMWPovqxkHZ6ABDo7bKbNCpywwDYQ==
X-Received: by 2002:a05:6e02:11a5:: with SMTP id 5mr4857068ilj.108.1590702165155;
        Thu, 28 May 2020 14:42:45 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id h10sm3115504ioe.3.2020.05.28.14.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 14:42:44 -0700 (PDT)
Received: (nullmailer pid 735075 invoked by uid 1000);
        Thu, 28 May 2020 21:42:43 -0000
Date:   Thu, 28 May 2020 15:42:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Boris Brezillon <bbrezillon@kernel.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Convert ingenic,pinctrl.txt
 to YAML
Message-ID: <20200528214243.GA711753@bogus>
References: <20200520002234.418025-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520002234.418025-1-paul@crapouillou.net>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 20, 2020 at 02:22:32AM +0200, Paul Cercueil wrote:
> Convert the ingenic,pinctrl.txt doc file to ingenic,pinctrl.yaml.
> 
> In the process, some compatible strings now require a fallback, as the
> corresponding SoCs are pin-compatible with their fallback variant.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: - Use 'pinctrl' instead of 'pin-controller' as the node name
>         - remove 'additionalProperties: false' since we will have pin conf nodes

You need to describe those nodes and not just allow anything.

> 
>  .../bindings/pinctrl/ingenic,pinctrl.txt      |  81 -----------
>  .../bindings/pinctrl/ingenic,pinctrl.yaml     | 136 ++++++++++++++++++
>  2 files changed, 136 insertions(+), 81 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml


> diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> new file mode 100644
> index 000000000000..5be2b1e95b36
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs pin controller devicetree bindings
> +
> +description: >
> +  Please refer to pinctrl-bindings.txt in this directory for details of the
> +  common pinctrl bindings used by client devices, including the meaning of the
> +  phrase "pin configuration node".
> +
> +  For the Ingenic SoCs, pin control is tightly bound with GPIO ports. All pins
> +  may be used as GPIOs, multiplexed device functions are configured within the
> +  GPIO port configuration registers and it is typical to refer to pins using the
> +  naming scheme "PxN" where x is a character identifying the GPIO port with
> +  which the pin is associated and N is an integer from 0 to 31 identifying the
> +  pin within that GPIO port. For example PA0 is the first pin in GPIO port A,
> +  and PB31 is the last pin in GPIO port B. The JZ4740, the X1000 and the X1830
> +  contains 4 GPIO ports, PA to PD, for a total of 128 pins. The JZ4760, the
> +  JZ4770 and the JZ4780 contains 6 GPIO ports, PA to PF, for a total of 192
> +  pins.
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +properties:
> +  nodename:

It's $nodename as that's not a real property. And that will expose the 
error in the example for you.

> +    pattern: "^pinctrl@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +        - ingenic,jz4740-pinctrl
> +        - ingenic,jz4725b-pinctrl
> +        - ingenic,jz4760-pinctrl
> +        - ingenic,jz4770-pinctrl
> +        - ingenic,jz4780-pinctrl
> +        - ingenic,x1000-pinctrl
> +        - ingenic,x1500-pinctrl
> +        - ingenic,x1830-pinctrl
> +      - items:
> +        - const: ingenic,jz4760b-pinctrl
> +        - const: ingenic,jz4760-pinctrl
> +      - items:
> +        - const: ingenic,x1000e-pinctrl
> +        - const: ingenic,x1000-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^gpio@[0-9]$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - ingenic,jz4740-gpio
> +          - ingenic,jz4725b-gpio
> +          - ingenic,jz4760-gpio
> +          - ingenic,jz4770-gpio
> +          - ingenic,jz4780-gpio
> +          - ingenic,x1000-gpio
> +          - ingenic,x1500-gpio
> +          - ingenic,x1830-gpio
> +
> +      reg:
> +        items:
> +          - description: The GPIO bank number
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges:
> +        maxItems: 1
> +
> +      interrupt-controller: true
> +
> +      "#interrupt-cells":
> +        const: 2
> +        description:
> +          Refer to ../interrupt-controller/interrupts.txt for more details.
> +
> +      interrupts:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - interrupts
> +      - interrupt-controller
> +      - "#interrupt-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +examples:
> +  - |
> +    pin-controller@10010000 {
> +      compatible = "ingenic,jz4770-pinctrl";
> +      reg = <0x10010000 0x600>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      gpio@0 {
> +        compatible = "ingenic,jz4770-gpio";
> +        reg = <0>;
> +
> +        gpio-controller;
> +        gpio-ranges = <&pinctrl 0 0 32>;
> +        #gpio-cells = <2>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +
> +        interrupt-parent = <&intc>;
> +        interrupts = <17>;
> +      };
> +    };
> -- 
> 2.26.2
> 
