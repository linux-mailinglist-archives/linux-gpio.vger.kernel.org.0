Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656B839EC0E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jun 2021 04:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhFHC3k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 22:29:40 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:62056 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbhFHC3j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 22:29:39 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1582BpMG065091;
        Tue, 8 Jun 2021 10:11:51 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Jun
 2021 10:25:40 +0800
Date:   Tue, 8 Jun 2021 10:25:32 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Andrew Jeffery <andrew@aj.id.au>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v4 3/7] ARM: dts: aspeed-g6: Add SGPIO node.
Message-ID: <20210608022531.GA2948@aspeedtech.com>
References: <20210607071514.11727-1-steven_lee@aspeedtech.com>
 <20210607071514.11727-4-steven_lee@aspeedtech.com>
 <5277db96-4eb8-4794-a1fa-6a5bc40bffb7@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5277db96-4eb8-4794-a1fa-6a5bc40bffb7@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1582BpMG065091
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 06/08/2021 07:28, Andrew Jeffery wrote:
> On Mon, 7 Jun 2021, at 16:45, Steven Lee wrote:
> > AST2600 supports 2 SGPIO master interfaces one with 128 pins another one
> > with 80 pins.
> > 
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  arch/arm/boot/dts/aspeed-g6.dtsi | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> > index f96607b7b4e2..c09b24824b6d 100644
> > --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> > @@ -377,6 +377,36 @@
> >  				#interrupt-cells = <2>;
> >  			};
> >  
> > +			sgpiom0: sgpiom@1e780500 {
> > +				#gpio-cells = <2>;
> > +				gpio-controller;
> > +				compatible = "aspeed,ast2600-sgpiom-128";
> > +				reg = <0x1e780500 0x100>;
> > +				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> > +				ngpios = <128>;
> 
> Doesn't this affect the way the data is presented on the bus?
> 

I add ngpios in aspeed-g6.dtsi as it can be overridden by dts files and
driver won't return error if users only add status = "okay" in
dts files without adding ngpios property.

I will remove the property from aspeed-g6.dtsi if we don't need a
default value for ngpios.

> My understanding is this should be defined by each platform, not in the dtsi. Having said that, it appears it is specified in aspeed-g5.dtsi (as the value 8?).
> 

I will remove the property from aspeed-g5 in a separate patch.

Thanks,
Steven

> > +				clocks = <&syscon ASPEED_CLK_APB2>;
> > +				interrupt-controller;
> > +				bus-frequency = <12000000>;
> > +				pinctrl-names = "default";
> > +				pinctrl-0 = <&pinctrl_sgpm1_default>;
> > +				status = "disabled";
> > +			};
> > +
> > +			sgpiom1: sgpiom@1e780600 {
> > +				#gpio-cells = <2>;
> > +				gpio-controller;
> > +				compatible = "aspeed,ast2600-sgpiom-80";
> > +				reg = <0x1e780600 0x100>;
> > +				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> > +				ngpios = <80>;
> 
> As above.
> 
> Andrew
