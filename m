Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0278A1B7D44
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 19:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgDXRtu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 13:49:50 -0400
Received: from muru.com ([72.249.23.125]:51280 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727123AbgDXRtt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Apr 2020 13:49:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3C75E80E7;
        Fri, 24 Apr 2020 17:50:35 +0000 (UTC)
Date:   Fri, 24 Apr 2020 10:49:44 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@pdp7.com>
Cc:     Robert Nelson <robertcnelson@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
Message-ID: <20200424174944.GL37466@atomide.com>
References: <20200413123921.GA32586@x1>
 <578a51c3-9cb4-91f9-4735-c512bf75553c@ti.com>
 <CAOCHtYg=rM_zP6Wr3bWKfvGpeK7sXLj6GLN3DXSh8JgfqDTcCA@mail.gmail.com>
 <db5e49dc-41b4-2ba5-87b3-f345749d7984@ti.com>
 <CAOCHtYgNH-OUWdKgKLr7U8Zy2OZb=P9Rpsv4mFii+VwU7h-vGA@mail.gmail.com>
 <20200415233712.GA16167@x1>
 <20200416163215.GH37466@atomide.com>
 <20200423131738.GA16584@x1>
 <20200423164208.GF37466@atomide.com>
 <20200424173242.GA25624@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424173242.GA25624@x1>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@pdp7.com> [200424 17:32]:
> On Thu, Apr 23, 2020 at 09:42:08AM -0700, Tony Lindgren wrote:
> > * Drew Fustini <drew@pdp7.com> [200423 13:17]:
> > > Thanks, Tony.  I was able to apply your patch cleanly to 5.5.9 kernel
> > > and boot it ok on the PocketBeagle (AM3358) which is what I'm currently
> > > testing with.  I can switch to 5.7.x but I just happened to be on 5.5.x
> > > because that is when bias flags were added to gpiolib uapi.
> > 
> > OK. BTW, with PocketBeagle and mainline v5.6 kernel, I see the micro-USB
> > connection always get disconnected after few hours of use. Are you aware
> > ofthat?
> > 
> > This is with the micro-USB configured as acm and ecm gadget via configfs.
> 
> I've been rebooting often as I build new kernels with debug output but I
> will do a test with 5.6 by leaving it running overnight and see if it gets
> disrupted.  I use the PocketBeagle with the TechLab PocketCape [0] for
> kernel development as there is no eMMC to confuse the boot sequence and
> the TechLab has a seperate USB to serial converter so I can easily see
> u-boot and kernel console.

Oh OK that looks like a nice cape :)

> I asked Robert Nelson if he'd heard of this issue and he had not.  But he
> asked how you are powering the board as any blip would probably reset the
> board instantly as not enough cap's on the PocketBeagle's USB power rail.  

Hmm good point. I recall the pocketbeagle uptime being many days with
USB stopping enumerating. But yes, this is powered over USB.

> > > I'm a somewhat confused about the difference between the "gpio-ranges"
> > > property for the gpio[0-3] nodes and the "pinctrl-single,gpio-range"
> > > property for the am33xx_pinmux node.
> > > 
> > > For a test, I tried adding "gpio-ranges" to arch/arm/boot/dts/am33xx-l4.dtsi:
> > > 
> > >                         gpio0: gpio@0 {
> > >                                 compatible = "ti,omap4-gpio";
> > >                                 gpio-controller;
> > >                                 #gpio-cells = <2>;
> > >                                 interrupt-controller;
> > >                                 #interrupt-cells = <2>;
> > >                                 reg = <0x0 0x1000>;
> > >                                 interrupts = <96>;
> > >                                 gpio-ranges = <&am33xx_pinmux 0 0 1>;
> > > 			}
> > 
> > So the gpio-ranges tells the gpio contorller what pinctrl device pin
> > to use for configuring things.
> 
> Thanks, that makes sense. 
> 
> But in this case, pinctrl-single also needs to parse "gpio-ranges"
> property from the gpio nodes?

Hmm not sure but don't think so, I think that information comes from
the calls from gpio-omap.c to pinctrl-single.c.

> > > and "pinctrl-single,gpio-range" like this:
> > > 
> > >                                 am33xx_pinmux: pinmux@800 {
> > >                                         compatible = "pinctrl-single";
> > >                                         reg = <0x800 0x238>;
> > >                                         #pinctrl-cells = <1>;
> > >                                         pinctrl-single,register-width = <32>;
> > >                                         pinctrl-single,function-mask = <0x7f>;
> > > 
> > >                                         pinctrl-single,gpio-range = <&range 0 1 0>;
> > > 
> > >                                         range: gpio-range {
> > >                                                 #pinctrl-single,gpio-range-cells = <3>;
> > >                                         };
> > >                                 };
> > > 
> > > Do you think both of those properties would be needed?
> > 
> > No I don't think so. The pinctrl-single could be additionally
> > configured for gpio functionality too. For omaps, that gpio
> > functionality would be mostly limited to output toggling using the
> > internal pulls. Would be still usable on some systems though.
> 
> What woud it mean for the pinctrl-single to be configured for gpio
> functionality?

That would mean that you can also use pinctrl-single as a gp(i)o
controller in some cases with the pulls instead of gpio-omap.

> Would that be needed for pinctrl_gpio_request() to succeed?

No, that's a separate feature.

> > Also, it's been a while so I don't remember where I started running
> > into addressing issues though.. My guess is that you will soon hit
> > them too and notice :)
> > 
> > But basically we want to reference the pinctrl pins based on their
> > physical offset from the padconf base register, and not based on an
> > invented number in the dts. Well maybe you can describe the problem
> > further for us to discuss when you see it :)
> 
> Wouldn't the pinctrl pin numbering be from 0 to pcs_device.size /
> pcs_device.width ?  

Yes. And ideally we'd specify the real register offset rather
than the index number for the pin also in the dts.

If that does not work for some reason, then it's best to set up a
macro to avoid confusion with figuring out the pin index rather
than look up the register offset in the TRM. But we can figure
that out once you have something working.

> That index number of the pin plus pcs_device would give the physical
> address of the padconf register.

Right, I'm more concerned what gets put into the dts files
as that's an ABI.

Regards,

Tony

> [0] https://beagleboard.org/techlab
