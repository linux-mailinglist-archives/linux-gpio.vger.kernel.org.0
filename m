Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B271E53B0
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 04:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgE1CLm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 22:11:42 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:46712 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgE1CLm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 22:11:42 -0400
Received: by mail-il1-f194.google.com with SMTP id h3so3581561ilh.13;
        Wed, 27 May 2020 19:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8/7AtcVQnogEJMITKMjo/+NbsrcSCHvci6t4MVh9Kc8=;
        b=d5LCXuCw9SWG3qJRvbpPLoPX1fFN0k4rSS+k2b8ciZ5tLE7LW9rVeDljwHKt9HwMoA
         eM61FFhMlHVN64eSvJR5u/HQoNULb5gbqImMZbJo5PvmXVkKDJ2h6cn86Sgsh04DThd8
         97VEYkK+vGvbd9unwiqtfnQ2HBOaoMHZjHKm6KxfOduTUMGko90uCLYw0bn1kHCM6Yu3
         cxXDurYVoUWSleiS2WVJMsZmjvDrnGiDH8UATpGIQWQWNM2ujKy6akwRcgi9q7WeIq4M
         Y6sgDzTFzcDX0LL9ijawjdCj30I7K97QcHL/I+OTdAUH8doYLC/cV4TiuyVoE/jBu+18
         IWtw==
X-Gm-Message-State: AOAM531dUBirf/D4cLh3LG/F1Wus7fGl1zqBFkhbePHwf0SIveYPD0N7
        hWUBbVuCy55tujqk8YRqaQ==
X-Google-Smtp-Source: ABdhPJyarlfDg0topsEF4LLMlLljnAFIUiSejKfnwzERU46ep1pIjMA9nxf26wH/i1HT1FPTA9wZsg==
X-Received: by 2002:a92:2907:: with SMTP id l7mr1061985ilg.48.1590631899776;
        Wed, 27 May 2020 19:11:39 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id b18sm2458167ilh.77.2020.05.27.19.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 19:11:39 -0700 (PDT)
Received: (nullmailer pid 3220699 invoked by uid 1000);
        Thu, 28 May 2020 02:11:37 -0000
Date:   Wed, 27 May 2020 20:11:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 05/14] dt-bindings: arm: sparx5: Add documentation for
 Microchip Sparx5 SoC
Message-ID: <20200528021137.GA3214411@bogus>
References: <20200513125532.24585-1-lars.povlsen@microchip.com>
 <20200513125532.24585-6-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513125532.24585-6-lars.povlsen@microchip.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 13, 2020 at 02:55:23PM +0200, Lars Povlsen wrote:
> This adds the main Sparx5 SoC DT documentation file, with information
> abut the supported board types.
> 
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> ---
>  .../bindings/arm/microchip,sparx5.yaml        | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
> new file mode 100644
> index 0000000000000..83b36d1217988
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/microchip,sparx5.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip Sparx5 Boards Device Tree Bindings
> +
> +maintainers:
> +  - Lars Povlsen <lars.povlsen@microchip.com>
> +
> +description: |+
> +   The Microchip Sparx5 SoC is a ARMv8-based used in a family of
> +   gigabit TSN-capable gigabit switches.
> +
> +   The SparX-5 Ethernet switch family provides a rich set of switching
> +   features such as advanced TCAM-based VLAN and QoS processing
> +   enabling delivery of differentiated services, and security through
> +   TCAM-based frame processing using versatile content aware processor
> +   (VCAP)
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: The Sparx5 pcb125 board is a modular board,
> +          which has both spi-nor and eMMC storage. The modular design
> +          allows for connection of different network ports.
> +        items:
> +          - const: microchip,sparx5-pcb125
> +          - const: microchip,sparx5
> +
> +      - description: The Sparx5 pcb134 is a pizzabox form factor
> +          gigabit switch with 20 SFP ports. It features spi-nor and
> +          either spi-nand or eMMC storage (mount option).
> +        items:
> +          - const: microchip,sparx5-pcb134
> +          - const: microchip,sparx5
> +
> +      - description: The Sparx5 pcb135 is a pizzabox form factor
> +          gigabit switch with 48+4 Cu ports. It features spi-nor and
> +          either spi-nand or eMMC storage (mount option).
> +        items:
> +          - const: microchip,sparx5-pcb135
> +          - const: microchip,sparx5
> +
> +  axi@600000000:
> +    type: object
> +    description: the root node in the Sparx5 platforms must contain
> +      an axi bus child node. They are always at physical address
> +      0x600000000 in all the Sparx5 variants.
> +    properties:
> +      compatible:
> +        items:
> +          - const: simple-bus
> +      reg:
> +        maxItems: 1

simple-bus doesn't have 'reg'. If there's bus registers, then it's not 
simple.

> +
> +    required:
> +      - compatible
> +      - reg
> +
> +patternProperties:
> +  "^syscon@[0-9a-f]+$":

This should be under a bus node.

> +    description: All Sparx5 boards must provide a system controller,
> +      typically under the axi bus node. It contain reset registers and
> +      other system control.
> +    type: object
> +    properties:
> +      compatible:
> +        items:
> +          - const: microchip,sparx5-cpu-syscon
> +          - const: syscon

This probably should be in its own document. If really this simple, 
there's already syscon.yaml you can add to. 

> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +required:
> +  - compatible
> +  - axi@600000000
> +  - syscon@600000000
> +
> +...
> --
> 2.26.2
