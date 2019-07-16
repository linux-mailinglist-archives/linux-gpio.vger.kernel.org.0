Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C02BD6B15A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 23:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728828AbfGPVsp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 17:48:45 -0400
Received: from atlmailgw2.ami.com ([63.147.10.42]:65255 "EHLO
        atlmailgw2.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728235AbfGPVsp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 17:48:45 -0400
X-AuditID: ac10606f-d11ff70000003324-70-5d2e463cf93b
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id 38.D3.13092.C364E2D5; Tue, 16 Jul 2019 17:48:44 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 16 Jul 2019 17:48:43 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <devicetree@vger.kernel.org>
CC:     Hongwei Zhang <hongweiz@ami.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH 2/3 v3] dt-bindings: gpio: aspeed: Add SGPIO support
Date:   Tue, 16 Jul 2019 17:48:31 -0400
Message-ID: <1563313711-17961-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsWyRiBhgq6Nm16swedDqha7LnNYfJl7isVi
        /pFzrBa/z/9ltpjyZzmTxabH11gtmlefY7bYPP8Po8XlXXPYLJZev8hk0br3CLsDt8fV9l3s
        HmvmrWH0eH+jld3j4sdjzB6bVnWyedy5tofNY/OSeo/zMxYyenzeJBfAGcVlk5Kak1mWWqRv
        l8CVcWbCO6aCVWYVPRfaWRoYj2p3MXJySAiYSNy48pali5GLQ0hgF5PE75nNTBDOYUaJnh1b
        GUGq2ATUJPZungOWEBHoZZRY+HUxmMMssJpJon3DcXaQKmEBF4kvbafYQGwWAVWJ/7OPMYPY
        vAIOErMbX7BD7JOTuHmuEyouKHFy5hMWEJtZQELi4IsXYHEhAVmJW4ceM0HUK0g873vMMoGR
        bxaSlllIWhYwMq1iFEosyclNzMxJLzfSS8zN1EvOz93ECAn0/B2MHz+aH2Jk4mA8xCjBwawk
        wmv7VTtWiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+qNd9ihATSE0tSs1NTC1KLYLJMHJxSDYxR
        Hr4sTptep+9/slP0i0fML4fZx3/FO2t6t8sZG9R8mvEtmfmXi4bFmolRT8sM1A0kfgd2Shu6
        7jCuThO3udZmculNxF3OPa8jlSvX+b09eviN367wFbzbPyQvXFtxa/639zU7P/0/XpbnySE9
        JXyGv5Ty4tyM97N9424c1ml7UFu5ZNpDnVAlluKMREMt5qLiRADOyDkEYgIAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings to support SGPIO on AST2400 or AST2500.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt

diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
new file mode 100644
index 0000000..8c3a747
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
@@ -0,0 +1,55 @@
+Aspeed SGPIO controller Device Tree Bindings
+-------------------------------------------
+
+This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full 
+featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to 
+support the following options:
+- Support interrupt option for each input port and various interrupt 
+  sensitivity option (level-high, level-low, edge-high, edge-low)
+- Support reset tolerance option for each output port
+- Directly connected to APB bus and its shift clock is from APB bus clock
+  divided by a programmable value.
+- Co-work with external signal-chained TTL components (74LV165/74LV595)
+
+
+Required properties:
+
+- compatible		: Either "aspeed,ast2400-sgpio" or "aspeed,ast2500-sgpio"
+
+- #gpio-cells 		: Should be two
+			  - First cell is the GPIO line number
+			  - Second cell is used to specify optional
+			    parameters (unused)
+
+- reg			: Address and length of the register set for the device
+- gpio-controller	: Marks the device node as a GPIO controller.
+- interrupts		: Interrupt specifier (see interrupt bindings for
+			  details)
+
+- interrupt-controller	: Mark the GPIO controller as an interrupt-controller
+
+- nr-gpios		: number of GPIO pins to serialise. 
+			  (should be multiple of 8, up to 80 pins; 0 if not used)
+
+- clocks               : A phandle to the APB clock for SGPM clock division
+
+- bus-frequency	: SGPM CLK frequency, derived from APB bus clock by a programmable devisor
+
+
+The sgpio and interrupt properties are further described in their respective bindings documentation:
+
+- Documentation/devicetree/bindings/sgpio/gpio.txt
+- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+
+  Example:
+	sgpio@1e780200 {
+		#gpio-cells = <2>;
+		compatible = "aspeed,ast2500-sgpio";
+		gpio-controller;
+		interrupts = <40>;
+		reg = <0x1e780200 0x0100>;
+		clocks = <&syscon ASPEED_CLK_APB>;
+		interrupt-controller;
+		nr-gpios = <8>;
+		bus-frequency = <12000000>;
+	};
-- 
2.7.4


Thanks Andrew, please see above v3 and inline comments at below.
--Hongwei

> From:	Andrew Jeffery <andrew@aj.id.au>
> Sent:	Sunday, July 14, 2019 10:25 PM
> To:	Hongwei Zhang; Joel Stanley; Linus Walleij; devicetree@vger.kernel.org
> Cc:	Rob Herring; Mark Rutland; Bartosz Golaszewski; linux-aspeed@lists.ozlabs.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-gpio@vger.kernel.org
> Subject:	Re: [PATCH 2/3 v2] dt-bindings: gpio: aspeed: Add SGPIO support
> 
> Hello Hongwei,
> 
> On Sat, 13 Jul 2019, at 05:44, Hongwei Zhang wrote:
> > Add bindings to support SGPIO on AST2400 or AST2500.
> > 
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> > ---
> >  .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 43 ++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100755 
> > Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > new file mode 100755
> > index 0000000..3ae2b79
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > @@ -0,0 +1,43 @@
> > +Aspeed SGPIO controller Device Tree Bindings
> > +-------------------------------------------
> > +
> > +Required properties:
> > +- compatible		: Either "aspeed,ast2400-sgpio" or "aspeed,ast2500-sgpio"
> > +
> > +- #gpio-cells 		: Should be two
> > +			  - First cell is the GPIO line number
> > +			  - Second cell is used to specify optional
> > +			    parameters (unused)
> > +
> > +- reg			: Address and length of the register set for the device
> > +- gpio-controller	: Marks the device node as a GPIO controller.
> > +- interrupts		: Interrupt specifier (see interrupt bindings for
> > +			  details)
> > +
> > +- interrupt-controller	: Mark the GPIO controller as an 
> > interrupt-controller
> > +
> > +- nr-gpios		: number of GPIO pins to serialise. (should be multiple of 
> > 8, up to 80 pins)
> > +			  if not specified, defaults to 80.
> 
> This appears to be a statement about the driver implementation, but bindings documents are about 
> describing hardware. Reading the datasheet it actually appears the ASPEED SGPIO hardware comes up 
> in what is "technically" a forbidden state (equivalent to `nr-gpios = <0>;`), though the device is also 
> disabled at this point, so it's probably moot. The point is the true default value from a hardware 
> perspective is 0, not 80, so if we're going to talk about default values, 0 would be more appropriate. 
> However:
> 
> You've also listed nr-gpios under the "Required properties" header, but the description suggests it's 
> optional. It's either one or the other, please lets be clear about it. On that front, lets make it nr-gpios 
> *not* optional (i.e. make it
> required) thus force the specification of how many SGPIOs we want to emit on the bus. This value is 
> coupled to the platform design, so I don't think there's ever a scenario where we want nr-gpios to take a 
> default value.
> 

Added some descriptions and updated nr-gpios, please see v3.

> > +
> > +- clocks               : A phandle to the APB clock for SGPM clock 
> > division
> > +
> > +- bus-frequency	: SGPM CLK frequency, if not specified defaults to 1 
> > MHz
> 
> Again here with the default value - SGPM CLK period is derived from PCLK by the expression `period = 
> PCLK * 2 *(GPIO254[31:16] + 1)`, where GPIO254's initialisation state is `GPIO254[31:16] = 0`, which 
> gives a default SGPM bus frequency of PCLK / 2. This is likely not going to be 1MHz (more like ~12MHz).
> 
> Lets just make the property required. That way we avoid any ambiguity about the bus frequency and 
> thus don't need words about defaults that turn out to be about the driver, not about the hardware.
> 

updated, please see v3.

> Finally, when updating patches in response to feedback, please send the full series again, and bump the 
> series version number. That way people can review a coherent set of patches and not have to hunt 
> around and (fail to) collate the correct combination. It makes it easier to say "Reviewed-by:" on your 
> patches :)
> 
> Cheers,
> 
> Andrew
