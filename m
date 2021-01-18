Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA782F9AB2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 08:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732719AbhARHlr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 02:41:47 -0500
Received: from muru.com ([72.249.23.125]:55324 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730272AbhARHlq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Jan 2021 02:41:46 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 382D680AE;
        Mon, 18 Jan 2021 07:41:03 +0000 (UTC)
Date:   Mon, 18 Jan 2021 09:41:00 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Emmanuel Vadot <manu@bidouilliste.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: am33xx-l4: change #pinctrl-cells from 1
 to 2
Message-ID: <YAU7jHQv8E5ln5zS@atomide.com>
References: <20200701013320.130441-1-drew@beagleboard.org>
 <20200701013320.130441-3-drew@beagleboard.org>
 <20210115190201.9273b637a7f967e7e55bc740@bidouilliste.com>
 <20210115214018.GA554007@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115214018.GA554007@x1>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [210115 21:40]:
> On Fri, Jan 15, 2021 at 07:02:01PM +0100, Emmanuel Vadot wrote:
> > 
> >  Hello Drew,
> > 
> > On Wed,  1 Jul 2020 03:33:20 +0200
> > Drew Fustini <drew@beagleboard.org> wrote:
> > 
> > > Increase #pinctrl-cells to 2 so that mux and conf be kept separate. This
> > > requires the AM33XX_PADCONF macro in omap.h to also be modified to keep pin
> > > conf and pin mux values separate.
> > > 
> > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > > ---
> > >  arch/arm/boot/dts/am33xx-l4.dtsi   | 2 +-
> > >  include/dt-bindings/pinctrl/omap.h | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
> > > index a9cbefc80c0c..3141590e5889 100644
> > > --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> > > +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> > > @@ -278,7 +278,7 @@ scm: scm@0 {
> > >  				am33xx_pinmux: pinmux@800 {
> > >  					compatible = "pinctrl-single";
> > >  					reg = <0x800 0x238>;
> > > -					#pinctrl-cells = <1>;
> > > +					#pinctrl-cells = <2>;
> > >  					pinctrl-single,register-width = <32>;
> > >  					pinctrl-single,function-mask = <0x7f>;
> > >  				};
> > > diff --git a/include/dt-bindings/pinctrl/omap.h b/include/dt-bindings/pinctrl/omap.h
> > > index 625718042413..2d2a8c737822 100644
> > > --- a/include/dt-bindings/pinctrl/omap.h
> > > +++ b/include/dt-bindings/pinctrl/omap.h
> > > @@ -65,7 +65,7 @@
> > >  #define DM814X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
> > >  #define DM816X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
> > >  #define AM33XX_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
> > > -#define AM33XX_PADCONF(pa, dir, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))
> > > +#define AM33XX_PADCONF(pa, conf, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) (conf) (mux)
> > >  
> > >  /*
> > >   * Macros to allow using the offset from the padconf physical address
> > > -- 
> > > 2.25.1
> > 
> >  Based on the bindings doc a value of 2 is only acceptable if one uses
> > pinctrl-single,bits but all the am33xx pins still uses
> > pinctrl-single,pins.
> >  I noticed this because this breaks FreeBSD when I tried with 5.9 dts.
> > 
> > -- 
> > Emmanuel Vadot <manu@bidouilliste.com> <manu@freebsd.org>
> 
> Hello Emmanuel,
> 
> Sorry to hear about that. This change was made based on discussion with
> Tony Lindgren this past July. Trent Piepho later pointed out issues wtih
> the change including the binding documentation. I had tried to fix
> the documentation in September [1]. However, I notice that it seems I
> missed changing the lines near the top of pinctrl-single.txt [2]:
> 
> - #pinctrl-cells : number of cells in addition to the index, set to 1
>   for pinctrl-single,pins and 2 for pinctrl-single,bits
> 
> I am thinking that should be re-written as:
> 
> - #pinctrl-cells : number of cells in addition to the index, this value
>   can be 1 or 2 for pinctrl-single,pins and must be 2 for pinctrl-single,bits
> 
> Tony - what do you think?

Sounds good to me.

Regards,

Tony

> [1] https://lore.kernel.org/linux-gpio/20200919200836.3218536-1-drew@beagleboard.org/
> [2] https://www.kernel.org/doc/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
