Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539382D6EF4
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 04:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395300AbgLKDzw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 22:55:52 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42720 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395297AbgLKDzc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 22:55:32 -0500
Received: by mail-oi1-f196.google.com with SMTP id l200so8384930oig.9;
        Thu, 10 Dec 2020 19:55:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jg43q2n1KDadesdGGoPvRtgEcEu/bB0AmQcOaS55oHQ=;
        b=s7JIJS2VrI2NK0X6hiC5i/WYbK5nZqjmCH1S7EMIEw2u4fvcemeS4B3lj6kxEOjJbe
         PlVFj92s8HO85/h0mEjrbd3WHtnewvRZzO7dekNegxIcBxfR/l3H4AaU6f2PJZtf3oaA
         fLSV85pYrcl6KcZLdxSi+300/bmLwD7JucK0SK5TnHCoP7KD4zmTo1/h797ewjOIxh8D
         H+3XiTiR3rQDdct7C9V33wWCvfUu6s6eDAuXooC7CbytdQqMZdmcrysgowamq/CdjLnk
         JHSgMZv8CCumygVa+Teeof+i29B1wf1ev9QZxHgu/Zp1BBEeh4o5UuxLp9xWpslBZAcM
         cPyg==
X-Gm-Message-State: AOAM531fFVNX3VnfJJquhTZHDjIAjYsP2N8EJxdvZu5EQg5kn+TXr8mF
        3b3P+x0vptOzqS2/ZRqmtA==
X-Google-Smtp-Source: ABdhPJyxsD7fhYNejCAuQal6tfRPHmBDNB2l51iUU5epxUE4gGdgMpqPe/gSgXx9TJRDGTwWA2afwQ==
X-Received: by 2002:aca:1e03:: with SMTP id m3mr7898681oic.107.1607658891426;
        Thu, 10 Dec 2020 19:54:51 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v13sm1507827ook.13.2020.12.10.19.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 19:54:50 -0800 (PST)
Received: (nullmailer pid 3614115 invoked by uid 1000);
        Fri, 11 Dec 2020 03:54:49 -0000
Date:   Thu, 10 Dec 2020 21:54:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH v8 11/22] dt-binding: mfd: Document canaan,k210-sysctl
 bindings
Message-ID: <20201211035449.GA3610311@robh.at.kernel.org>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
 <20201210140313.258739-12-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210140313.258739-12-damien.lemoal@wdc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 10, 2020 at 11:03:02PM +0900, Damien Le Moal wrote:
> Document the device tree bindings of the Canaan Kendryte K210 SoC
> system controller driver in
> Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/mfd/canaan,k210-sysctl.yaml      | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
> new file mode 100644
> index 000000000000..a61d8ea4fbec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/canaan,k210-sysctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K210 System Controller Device Tree Bindings
> +
> +maintainers:
> +  - Damien Le Moal <damien.lemoal@wdc.com>
> +
> +description:
> +  Canaan Inc. Kendryte K210 SoC system controller which provides a
> +  register map for controlling the clocks, reset signals and pin power
> +  domains of the SoC.
> +
> +properties:
> +  compatible:
> +    allOf:

Don't need 'allOf'.

> +      - items:
> +          - const: canaan,k210-sysctl
> +          - const: syscon
> +          - const: simple-mfd
> +
> +  clocks:
> +    description:
> +      System controller Advanced Power Bus (APB) interface clock source.

How many entries?

> +
> +  clock-names:
> +    maxItems: 1

Don't need maxItems as it is implied by length of 'items'.

> +    items:
> +      - const: pclk
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Offset and length of the system controller register space.

Drop. That's pretty much the description for all 'reg' entries.

> +
> +  reg-io-width:
> +    const: 4

Why is this needed if always 4?

> +
> +  clock-controller:
> +    # Child node
> +    type: object
> +    $ref: "../clock/canaan,k210-clk.yaml"
> +    description:
> +      Clock controller for the SoC clocks. This child node definition
> +      should follow the bindings specified in
> +      Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml.
> +
> +  reset-controller:
> +    # Child node
> +    type: object
> +    $ref: "../reset/canaan,k210-rst.yaml"
> +    description:
> +      Reset controller for the SoC. This child node definition
> +      should follow the bindings specified in
> +      Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml.
> +
> +  syscon-reboot:
> +    # Child node
> +    type: object
> +    $ref: "../power/reset/syscon-reboot.yaml"
> +    description:
> +      Reboot method for the SoC. This child node definition
> +      should follow the bindings specified in
> +      Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +  - clock-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/k210-clk.h>
> +    #include <dt-bindings/reset/k210-rst.h>
> +
> +    clocks {
> +      in0: oscllator {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <26000000>;
> +      };
> +    };
> +
> +    sysctl: syscon@50440000 {
> +      compatible = "canaan,k210-sysctl",
> +                   "syscon", "simple-mfd";
> +      reg = <0x50440000 0x100>;
> +      reg-io-width = <4>;
> +      clocks = <&sysclk K210_CLK_APB1>;
> +      clock-names = "pclk";
> +
> +      sysclk: clock-controller {
> +        #clock-cells = <1>;
> +        compatible = "canaan,k210-clk";
> +        clocks = <&in0>;
> +      };
> +
> +      sysrst: reset-controller {
> +        compatible = "canaan,k210-rst";
> +        #reset-cells = <1>;
> +      };
> +
> +      reboot: syscon-reboot {
> +        compatible = "syscon-reboot";
> +        regmap = <&sysctl>;
> +        offset = <48>;
> +        mask = <1>;
> +        value = <1>;
> +      };
> +    };
> -- 
> 2.29.2
> 
