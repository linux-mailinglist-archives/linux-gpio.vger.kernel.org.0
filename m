Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 605086FDC8A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 May 2023 13:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236797AbjEJLVA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 May 2023 07:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235609AbjEJLU7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 May 2023 07:20:59 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 131571FF7;
        Wed, 10 May 2023 04:20:53 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5CCD18109;
        Wed, 10 May 2023 11:20:52 +0000 (UTC)
Date:   Wed, 10 May 2023 14:20:51 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: pinctrl: Update pinctrl-single to
 use yaml
Message-ID: <20230510112051.GD14287@atomide.com>
References: <20230510095330.30742-1-tony@atomide.com>
 <20230510095330.30742-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510095330.30742-2-tony@atomide.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [230510 09:54]:
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
...
> +patternProperties:
...
> +  'cpsw_default|cpsw_sleep|davinci_mdio_default|davinci_mdio_sleep':
> +    description: Deprecated legacy naming for cpsw and mdio on TI SoCs
> +    deprecated: true
> +    type: object
> +    $ref: pinmux-node.yaml#
> +
> +  'usb1_drvvbus|usb_hub_ctrl|usb2_phy':
> +    description: Deprecated legacy naming for USB on TI SoCs
> +    deprecated: true
> +    type: object
> +    $ref: pinmux-node.yaml#
> +
> +  'gpio_keys_s0|matrix_keypad_default|matrix_keypad_sleep|matrix_keypad_s0':
> +    description: Deprecated legacy naming for input on TI SoCs
> +    deprecated: true
> +    type: object
> +    $ref: pinmux-node.yaml#
> +
> +  'user_leds_s0|gpio_led_pmx':
> +    description: Deprecated legacy naming for LEDs on TI SoCs
> +    deprecated: true
> +    type: object
> +    $ref: pinmux-node.yaml#
> +
> +  'nand_flash_x8':
> +    description: Deprecated legacy naming for NAND on TI SoCs
> +    deprecated: true
> +    type: object
> +    $ref: pinmux-node.yaml#

Looks like fixing the pin group node names for all the older TI SoC dts
files should not be too bad, for example diffstat for experimental am335x
changes is:

42 files changed, 323 insertions(+), 323 deletions(-)

This includes changing node names to use - instead of _ while at it.
I'll send out about 10 or so patches once Rob has the dts subdirectories
created.

Regards,

Tony
