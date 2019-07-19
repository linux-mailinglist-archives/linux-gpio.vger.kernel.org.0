Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B79A6EBA5
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2019 22:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbfGSUi0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jul 2019 16:38:26 -0400
Received: from atlmailgw1.ami.com ([63.147.10.40]:44733 "EHLO
        atlmailgw1.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbfGSUi0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jul 2019 16:38:26 -0400
X-AuditID: ac1060b2-3fdff70000003a7d-d3-5d322a4365dd
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id AD.8C.14973.34A223D5; Fri, 19 Jul 2019 16:38:27 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Jul 2019 16:38:24 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     <hongweiz@ami.com>, Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Joel Stanley <joel@jms.id.au>, <devicetree@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: dt-bindings: gpio: aspeed: Add SGPIO support 
Date:   Fri, 19 Jul 2019 16:37:24 -0400
Message-ID: <1563568644-10392-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563394325-15941-1-git-send-email-hongweiz@ami.com>
References: <1563394325-15941-1-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsWyRiBhgq6zllGswdyFsha7LnNYfJl7isVi
        /pFzrBa/z/9ltpjyZzmTxabH11gtmlefY7bYPP8Po8XlXXPYLJZev8hk0br3CLsDt8fV9l3s
        HmvmrWH0eH+jld3j4sdjzB6bVnWyedy5tofNY/OSeo/zMxYyenzeJBfAGcVlk5Kak1mWWqRv
        l8CVcWw9S8ENuYqVz24yNjDOluhi5OSQEDCReLr4J2sXIxeHkMAuJonuExeZIJzDjBKr755i
        BKliE1CT2Lt5DlhCRKCJUeJt02cwh1lgBZNE87Q37CBVwgJmEm8mnGQDsVkEVCXOrF7JCmLz
        CjhIdJ5rZYbYJydx81wnmM0p4Cgx+eU8MFsIqObN02NMEPWCEidnPmEBsZkFJCQOvngBVSMr
        cevQYyaIOQoSz/ses0xgFJiFpGUWkpYFjEyrGIUSS3JyEzNz0ssN9RJzM/WS83M3MULiYtMO
        xpaL5ocYmTgYDzFKcDArifDefqkfK8SbklhZlVqUH19UmpNafIhRmoNFSZx35ZpvMUIC6Ykl
        qdmpqQWpRTBZJg5OqQZGYXNpDvuN5RdiYoOenjvHVrb9X7Fv8IzT82acjtSboHD2/Jmzsra5
        r3p7P1SvnKPE4hwU9vTjRdtPFWzX/QoF/fr3mUen9YhYzlyzs3fK5NczPa9/O/Kr7d5UZv62
        DwrX7TidK9Qa91xjMO/8X8Pk8nWN2vurX/jSXqfo/E37yCryvX/eun4dJZbijERDLeai4kQA
        krwKtHkCAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andrew,

Thanks for reviewing and please see my inline comments.

--Hongwei

> From:	Andrew Jeffery <andrew@aj.id.au>
> Sent:	Wednesday, July 17, 2019 9:48 PM
> To:	Hongwei Zhang; Joel Stanley; Linus Walleij; devicetree@vger.kernel.org
> Cc:	Rob Herring; Mark Rutland; Bartosz Golaszewski; linux-aspeed@lists.ozlabs.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-gpio@vger.kernel.org
> Subject:	Re: [PATCH 2/3 v4] dt-bindings: gpio: aspeed: Add SGPIO support
> 
> The subject is largely correct, but please see the discussion on the driver patch about how to clean up 
> the [PATCH ...] prefix.
> 
> On Thu, 18 Jul 2019, at 05:42, Hongwei Zhang wrote:
> > Add bindings to support SGPIO on AST2400 or AST2500.
> > 
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> > ---
> >  .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 55 ++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >  create mode 100644 
> > Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > new file mode 100644
> > index 0000000..2d6305e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > @@ -0,0 +1,55 @@
> > +Aspeed SGPIO controller Device Tree Bindings
> > +-------------------------------------------
> > +
> > +This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80
> > full
> > +featured Serial GPIOs. Each of the Serial GPIO pins can be programmed
> > to
> > +support the following options:
> > +- Support interrupt option for each input port and various interrupt
> > +  sensitivity option (level-high, level-low, edge-high, edge-low)
> > +- Support reset tolerance option for each output port
> > +- Directly connected to APB bus and its shift clock is from APB bus
> > clock
> > +  divided by a programmable value.
> > +- Co-work with external signal-chained TTL components 
> > +(74LV165/74LV595)
> > +
> > +
> > +Required properties:
> > +
> > +- compatible		: Either "aspeed,ast2400-sgpio" or "aspeed,ast2500-sgpio"
> > +
> > +- #gpio-cells 		: Should be two
> > +			  - First cell is the GPIO line number
> > +			  - Second cell is used to specify optional
> > +			    parameters (unused)
> > +
> > +- reg			: Address and length of the register set for the device
> > +- gpio-controller	: Marks the device node as a GPIO controller
> > +- interrupts		: Interrupt specifier (see interrupt bindings for
> > +			  details)
> > +
> > +- interrupt-controller	: Mark the GPIO controller as an 
> > interrupt-controller
> > +
> > +- nr-gpios		: number of GPIO pins to serialise. 
> > +			  (should be multiple of 8, up to 80 pins)
> 
> Please change the property name to "ngpios", as per the generic GPIO bindings[1].
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindi
> ngs/gpio/gpio.txt?h=v5.2#n141

done

> 
> Cheers,
> 
> Andrew
> 
> > +
> > +- clocks                : A phandle to the APB clock for SGPM clock 
> > division
> > +
> > +- bus-frequency		: SGPM CLK frequency
> > +
> > +
> > +The sgpio and interrupt properties are further described in their
> > respective bindings documentation:
> > +
> > +- Documentation/devicetree/bindings/sgpio/gpio.txt
> > +- 
> > +Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> > +
> > +  Example:
> > +	sgpio: sgpio@1e780200 {
> > +		#gpio-cells = <2>;
> > +		compatible = "aspeed,ast2500-sgpio";
> > +		gpio-controller;
> > +		interrupts = <40>;
> > +		reg = <0x1e780200 0x0100>;
> > +		clocks = <&syscon ASPEED_CLK_APB>;
> > +		interrupt-controller;
> > +		nr-gpios = <8>;
> > +		bus-frequency = <12000000>;
> > +	};
> > --
> > 2.7.4
> > 
> >
