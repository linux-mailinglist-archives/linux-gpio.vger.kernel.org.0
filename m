Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C192E399451
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 22:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbhFBUMV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 16:12:21 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:41912 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhFBUMU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 16:12:20 -0400
Received: by mail-ot1-f48.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so3586168oth.8;
        Wed, 02 Jun 2021 13:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KJXe/j4S+tTBfupUvcLNtHwssps3qp4qDEKF4hgTJ3E=;
        b=N9tzQSR5uVjPnsM5DTEDzDE7f/qxbn85rgWUaCnR/kEYCd2nHWoimYXxe+YhA/u2Ai
         Zw3/s5vDVAuPAmNoVj3Mtw3XorE/xfTP0CVvmIR4wCOVPJe9VK0WPpTAQnlQQipKsNLe
         mNOTcTMcwpfyHPO/B4OnVmp0bmUQAoAfapuYkzkD7o8Ed3WPXT69akMcG21BumIFZuKl
         WKCsqEMs9E6I73nQ+kwoYN4VHhJhxKhD9DotFT/USSHvAsx0+59xeso0cd+xV/3amfdE
         jIsNu4vG/i0GIcJP+ylibS7YCNTtJvZcdFtAsp9xRnnWI5oly+MoQUl4keJYBwXGCdRf
         5qkg==
X-Gm-Message-State: AOAM530DxvHh1g8Js8Va9Ymaf+0c8w2m8+4ReMbhLH7C2fbrryPKDuDm
        chHOKkqOoTUTQ8D9fIk+PpHLnKPCOQ==
X-Google-Smtp-Source: ABdhPJx4iZCcx1NuCo6GfI2rKBzE1Fi8O4daJSQD2hB9/vnoJOnXkkRiZa8E39kJeTxqN6ge2Z8eQA==
X-Received: by 2002:a05:6830:164c:: with SMTP id h12mr27991909otr.321.1622664623785;
        Wed, 02 Jun 2021 13:10:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h9sm189017otn.56.2021.06.02.13.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 13:10:22 -0700 (PDT)
Received: (nullmailer pid 3907739 invoked by uid 1000);
        Wed, 02 Jun 2021 20:10:21 -0000
Date:   Wed, 2 Jun 2021 15:10:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>, Hongweiz@ami.com,
        ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com
Subject: Re: [PATCH v2 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings
 to yaml.
Message-ID: <20210602201021.GA3900491@robh.at.kernel.org>
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
 <20210527005455.25758-2-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527005455.25758-2-steven_lee@aspeedtech.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 27, 2021 at 08:54:50AM +0800, Steven Lee wrote:
> SGPIO bindings should be converted as yaml format.
> In addition to the file conversion, a new property max-ngpios is
> added in the yaml file as well.
> The new property is required by the enhanced sgpio driver for
> making the configuration of the max number of gpio pins more flexible.

The rest of the binding looks fine. Make this property a separate patch 
if you don't end up dropping it.

> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  .../bindings/gpio/aspeed,sgpio.yaml           | 91 +++++++++++++++++++
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt | 46 ----------
>  2 files changed, 91 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> new file mode 100644
> index 000000000000..02eb0c5023e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed SGPIO controller
> +
> +maintainers:
> +  - Andrew Jeffery <andrew@aj.id.au>
> +
> +description:
> +  This SGPIO controller is for ASPEED AST2400, AST2500 and AST2600 SoC,
> +  AST2600 have two sgpio master one with 128 pins another one with 80 pins,
> +  AST2500/AST2400 have one sgpio master with 80 pins. Each of the Serial
> +  GPIO pins can be programmed to support the following options
> +  - Support interrupt option for each input port and various interrupt
> +    sensitivity option (level-high, level-low, edge-high, edge-low)
> +  - Support reset tolerance option for each output port
> +  - Directly connected to APB bus and its shift clock is from APB bus clock
> +    divided by a programmable value.
> +  - Co-work with external signal-chained TTL components (74LV165/74LV595)
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-sgpiom
> +      - aspeed,ast2500-sgpiom
> +      - aspeed,ast2600-sgpiom
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +  ngpios:
> +    minimum: 0
> +    maximum: 128
> +
> +  max-ngpios:
> +    description:
> +      represents the number of actual hardware-supported GPIOs (ie,
> +      slots within the clocked serial GPIO data). Since each HW GPIO is both an
> +      input and an output, we provide max_ngpios * 2 lines on our gpiochip
> +      device. We also use it to define the split between the inputs and
> +      outputs; the inputs start at line 0, the outputs start at max_ngpios.
> +    minimum: 0
> +    maximum: 128
> +
> +  bus-frequency: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - interrupts
> +  - interrupt-controller
> +  - ngpios
> +  - max-ngpios
> +  - clocks
> +  - bus-frequency
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    sgpio: sgpio@1e780200 {
> +        #gpio-cells = <2>;
> +        compatible = "aspeed,ast2500-sgpiom";
> +        gpio-controller;
> +        interrupts = <40>;
> +        reg = <0x1e780200 0x0100>;
> +        clocks = <&syscon ASPEED_CLK_APB>;
> +        interrupt-controller;
> +        ngpios = <8>;
> +        max-ngpios = <80>;
> +        bus-frequency = <12000000>;
> +    };
> diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> deleted file mode 100644
> index be329ea4794f..000000000000
> --- a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -Aspeed SGPIO controller Device Tree Bindings
> ---------------------------------------------
> -
> -This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full
> -featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to
> -support the following options:
> -- Support interrupt option for each input port and various interrupt
> -  sensitivity option (level-high, level-low, edge-high, edge-low)
> -- Support reset tolerance option for each output port
> -- Directly connected to APB bus and its shift clock is from APB bus clock
> -  divided by a programmable value.
> -- Co-work with external signal-chained TTL components (74LV165/74LV595)
> -
> -Required properties:
> -
> -- compatible : Should be one of
> -  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio"
> -- #gpio-cells : Should be 2, see gpio.txt
> -- reg : Address and length of the register set for the device
> -- gpio-controller : Marks the device node as a GPIO controller
> -- interrupts : Interrupt specifier, see interrupt-controller/interrupts.txt
> -- interrupt-controller : Mark the GPIO controller as an interrupt-controller
> -- ngpios : number of *hardware* GPIO lines, see gpio.txt. This will expose
> -  2 software GPIOs per hardware GPIO: one for hardware input, one for hardware
> -  output. Up to 80 pins, must be a multiple of 8.
> -- clocks : A phandle to the APB clock for SGPM clock division
> -- bus-frequency : SGPM CLK frequency
> -
> -The sgpio and interrupt properties are further described in their respective
> -bindings documentation:
> -
> -- Documentation/devicetree/bindings/gpio/gpio.txt
> -- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> -
> -  Example:
> -	sgpio: sgpio@1e780200 {
> -		#gpio-cells = <2>;
> -		compatible = "aspeed,ast2500-sgpio";
> -		gpio-controller;
> -		interrupts = <40>;
> -		reg = <0x1e780200 0x0100>;
> -		clocks = <&syscon ASPEED_CLK_APB>;
> -		interrupt-controller;
> -		ngpios = <8>;
> -		bus-frequency = <12000000>;
> -	};
> -- 
> 2.17.1
