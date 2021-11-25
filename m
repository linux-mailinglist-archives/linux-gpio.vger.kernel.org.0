Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3B945D67B
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 09:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350333AbhKYIyT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 03:54:19 -0500
Received: from muru.com ([72.249.23.125]:60034 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350913AbhKYIwT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Nov 2021 03:52:19 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4021D8027;
        Thu, 25 Nov 2021 08:49:45 +0000 (UTC)
Date:   Thu, 25 Nov 2021 10:49:04 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/6] dt-bindings: pinctrl: support specifying pins,
 groups & functions
Message-ID: <YZ9OAC/swfCbBXFt@atomide.com>
References: <20211124230439.17531-1-zajec5@gmail.com>
 <20211124230439.17531-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124230439.17531-2-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

* Rafał Miłecki <zajec5@gmail.com> [211124 23:05]:
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> @@ -42,4 +42,44 @@ properties:
>        This property can be set either globally for the pin controller or in
>        child nodes for individual pin group control.
>  
> +  pins:
> +    type: object
> +
> +    patternProperties:
> +      "^.*$":
> +        type: object
> +
> +        properties:
> +          number:
> +            description: Pin number
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +        additionalProperties: false

Please don't introduce Linux kernel internal numbering here. It's
like bringing back the interrupt numbers again. Just make this into
a proper hardware offset from the controller base, so a reg property.
Sure in some cases the reg property is just an index depending on
the controller, we don't really care from the binding point of view.

We already have #pinctrl-cells, so plase do something like the four
ximaginary examples below:

	#pinctrl-cells = <1>;
	...
	pin@foo {
		reg = <0xf00 MUX_MODE0>;
		label = "foo_pin";
	};


	#pinctrl-cells = <2>;
	...
	pin@foo {
		reg = <0xf00 PIN_INPUT_PULLUP MUX_MODE3>;
	};


	#pinctrl-cells = <2>;
	...
	pin@f00 {
		reg = <0xf00 DELAY_PS(0) DELAY_PS(0)>;
	};


	#pinctrl-cells = <3>;
	...
	pin@f00 {
		reg = <0xf00 MUX_MODE3 PULL_UP_STRENGTH(36) PULL_DOWN_STRENGTH(20)>;
	};


Then let's attempt to use just standard numbers and defines for the
values where possible. Then a group of pins is just a list of the pin
phandles in the devicetree.

Regards,

Tony
