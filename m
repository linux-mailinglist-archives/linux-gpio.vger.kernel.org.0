Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D3135D24A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Apr 2021 23:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238962AbhDLVAa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 17:00:30 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:38779 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237497AbhDLVA3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Apr 2021 17:00:29 -0400
Received: by mail-ot1-f44.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so14117406otk.5;
        Mon, 12 Apr 2021 14:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9kV9TPzMbj2AK5mnP1JUBfDT2PtlPnfSPxEfBJjhy6c=;
        b=mTnvSRa1gOH2lEQtuZkSPRC5C6ufWep5LT22TuE8XXQyX5RZT+aJ5RT8SmbqqQZRiA
         s46/X/aznFasYk+iRIxiS/4LNEoRRhDkxIdcAL3zHEMv4sVLkYiS37S9+hIQfhAeeSg2
         5Mw3EZhdmDkS3Mp7L1Zk2iqWSSBZWTgwk1r2NkMq1QEpvLJX+ieI8paekK9Mm44kokLb
         oyuU7UdfvcLxw7VK2Jqvx+W3PaZpltwQSgA+E8EhwS0l9ohVx7sF5eGB3bfVWmpYoWEo
         CNdiKKS6UmOQU0K+ZY8w4BFuFEZsQWER3J8oaZBFyJtz+XrYgfwTwlSVVmsT9nN3KFxK
         p5lg==
X-Gm-Message-State: AOAM533+l15fyr2hYPNuW4PVwBFAgASysOpQMwFYZt0SdGQa3cNxFaEt
        wMg97up4o4j76hAhX+QY5g==
X-Google-Smtp-Source: ABdhPJzWzVc2nOaQbuEcja8+P7guBn1+ygDJX+82K34uQEKwwya2ozAjHry3cN4toPk12iO3x4HyVw==
X-Received: by 2002:a9d:2e1:: with SMTP id 88mr25423735otl.120.1618261207901;
        Mon, 12 Apr 2021 14:00:07 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e44sm1698218ote.21.2021.04.12.14.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 14:00:06 -0700 (PDT)
Received: (nullmailer pid 161379 invoked by uid 1000);
        Mon, 12 Apr 2021 21:00:05 -0000
Date:   Mon, 12 Apr 2021 16:00:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: gpio: add YAML description for
 rockchip,gpio-bank
Message-ID: <20210412210005.GA158955@robh.at.kernel.org>
References: <20210411175435.807-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210411175435.807-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 11, 2021 at 07:54:35PM +0200, Johan Jonker wrote:
> Current dts files with "rockchip,gpio-bank" subnodes
> are manually verified. In order to automate this process
> the text that describes the compatible in rockchip,pinctrl.txt
> is removed and converted to YAML in rockchip,gpio-bank.yaml.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../bindings/gpio/rockchip,gpio-bank.yaml          | 82 ++++++++++++++++++++++
>  .../bindings/pinctrl/rockchip,pinctrl.txt          | 58 +--------------
>  2 files changed, 83 insertions(+), 57 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> new file mode 100644
> index 000000000..ac2479732
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/rockchip,gpio-bank.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip GPIO bank
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,gpio-bank
> +      - rockchip,rk3188-gpio-bank0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    pinctrl: pinctrl {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      gpio0: gpio0@2000a000 {

gpio@...

> +        compatible = "rockchip,rk3188-gpio-bank0";
> +        reg = <0x2000a000 0x100>;
> +        interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk_gates8 9>;
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +      };
> +
> +      gpio1: gpio1@2003c000 {

gpio@...

> +        compatible = "rockchip,gpio-bank";
> +        reg = <0x2003c000 0x100>;
> +        interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk_gates8 10>;
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> index d3eae61a3..4719a6a07 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
> @@ -50,23 +50,7 @@ Deprecated properties for iomux controller:
>  	 Use rockchip,grf and rockchip,pmu described above instead.
>  
>  Required properties for gpio sub nodes:
> -  - compatible: "rockchip,gpio-bank"
> -  - reg: register of the gpio bank (different than the iomux registerset)
> -  - interrupts: base interrupt of the gpio bank in the interrupt controller
> -  - clocks: clock that drives this bank
> -  - gpio-controller: identifies the node as a gpio controller and pin bank.
> -  - #gpio-cells: number of cells in GPIO specifier. Since the generic GPIO
> -    binding is used, the amount of cells must be specified as 2. See generic
> -    GPIO binding documentation for description of particular cells.
> -  - interrupt-controller: identifies the controller node as interrupt-parent.
> -  - #interrupt-cells: the value of this property should be 2 and the interrupt
> -    cells should use the standard two-cell scheme described in
> -    bindings/interrupt-controller/interrupts.txt
> -
> -Deprecated properties for gpio sub nodes:
> -  - compatible: "rockchip,rk3188-gpio-bank0"
> -  - reg: second element: separate pull register for rk3188 bank0, use
> -	 rockchip,pmu described above instead
> +See rockchip,gpio-bank.yaml
>  
>  Required properties for pin configuration node:
>    - rockchip,pins: 3 integers array, represents a group of pins mux and config
> @@ -127,43 +111,3 @@ uart2: serial@20064000 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart2_xfer>;
>  };
> -
> -Example for rk3188:
> -
> -	pinctrl@20008000 {
> -		compatible = "rockchip,rk3188-pinctrl";
> -		rockchip,grf = <&grf>;
> -		rockchip,pmu = <&pmu>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges;
> -
> -		gpio0: gpio0@2000a000 {
> -			compatible = "rockchip,rk3188-gpio-bank0";
> -			reg = <0x2000a000 0x100>;
> -			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk_gates8 9>;
> -
> -			gpio-controller;
> -			#gpio-cells = <2>;
> -
> -			interrupt-controller;
> -			#interrupt-cells = <2>;
> -		};
> -
> -		gpio1: gpio1@2003c000 {
> -			compatible = "rockchip,gpio-bank";
> -			reg = <0x2003c000 0x100>;
> -			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk_gates8 10>;
> -
> -			gpio-controller;
> -			#gpio-cells = <2>;
> -
> -			interrupt-controller;
> -			#interrupt-cells = <2>;
> -		};
> -
> -		...
> -
> -	};
> -- 
> 2.11.0
> 
