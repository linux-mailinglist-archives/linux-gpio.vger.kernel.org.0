Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474C91E0F3F
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 15:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390772AbgEYNRg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 09:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390771AbgEYNRg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 09:17:36 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE14C061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 06:17:35 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j10so1442038wrw.8
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AlT33sTdJ8LNl2Fkt59oe950O0RQoKaN3X8WWl/CfBA=;
        b=InV3XGCbA91nUAKRa49lBZGLcoa4PnFmacrsy+TCKJ9cuFPPdbFezEspNi2Np1l4fz
         nCXj8bzDnkXoe1pXi9a7VouXrW4eOiv+YNYrg64Y44aPXzHZjjP4uZd5lSGRFgnD5C+j
         j5gyDXkLypaHvme/SZq8rGR7SA0igPe4Zk5+TSZrebqmm1O1DbdTxSoy7cnxLcKl70Ie
         jxNtJuFCP/OuJOzgsxJaC6Rba+BSX63BmNO4qDEh0Wb71A+5G8EnKyAe2QVL5rXzQBX4
         J29QJtimNjx48nrku8Bv1Gl+lHgWWXS2pQomX6mLqk3SGwmC/fEyZlXpTFgwWor/Y9z6
         ozJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AlT33sTdJ8LNl2Fkt59oe950O0RQoKaN3X8WWl/CfBA=;
        b=PfvCWrDkJVv13NlfgiFeWBN/m3YwwGOIj6V+efdvZO+GTzR04cEMwKwQdXhpOFqTQF
         4AifVBIMRU6RjSA4VXzdlybNdcPWi9CfvtAk6eeX71Lnb7UrzREsgOQGcQWX5E16qFrb
         UK9G13Rc0fGe8fDTz2YHkUykLYGuQCqiRNnuJp3FuoNja/jufFL+zxaryXdMMJ4eRDmx
         /JLa6cYFt90taGpvUr0P0X7UNJRwXHX6oYY2c7L356LPVyAZ8pKE/cKUPqoKGJ5b2wbo
         /qoHh19fo+eh6NQJOZtb8Mwhk/T+xH6qzM9ZMYnYjCPbYyUt7Q/6ssMA/BkY4TSGrmf5
         tOAw==
X-Gm-Message-State: AOAM533PV1GUMQaGGpcPwqcRcRy4wW4vOKSmnbTI74f3CawPL0jTC4EA
        86cBHpuKacg9TONWQL01kS7GrPX142sTWHw6AxU=
X-Google-Smtp-Source: ABdhPJx6J6bU5K3YTFbMWu7QwpJWplwue+YyUQ/IjKchhkjeMk+gthU/BbFFdj87TAmW1kV5ivKsxw==
X-Received: by 2002:adf:eccf:: with SMTP id s15mr14921227wro.70.1590412654296;
        Mon, 25 May 2020 06:17:34 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id 40sm17599325wrc.15.2020.05.25.06.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 06:17:33 -0700 (PDT)
Date:   Mon, 25 May 2020 15:17:31 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Drew Fustini <drew@pdp7.com>,
        Robert Nelson <robertcnelson@gmail.com>,
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
Message-ID: <20200525131731.GA948395@x1>
References: <578a51c3-9cb4-91f9-4735-c512bf75553c@ti.com>
 <CAOCHtYg=rM_zP6Wr3bWKfvGpeK7sXLj6GLN3DXSh8JgfqDTcCA@mail.gmail.com>
 <db5e49dc-41b4-2ba5-87b3-f345749d7984@ti.com>
 <CAOCHtYgNH-OUWdKgKLr7U8Zy2OZb=P9Rpsv4mFii+VwU7h-vGA@mail.gmail.com>
 <20200415233712.GA16167@x1>
 <20200416163215.GH37466@atomide.com>
 <20200423131738.GA16584@x1>
 <20200423164208.GF37466@atomide.com>
 <20200424173242.GA25624@x1>
 <20200424174944.GL37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424174944.GL37466@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 24, 2020 at 10:49:44AM -0700, Tony Lindgren wrote:
> * Drew Fustini <drew@pdp7.com> [200424 17:32]:
> > On Thu, Apr 23, 2020 at 09:42:08AM -0700, Tony Lindgren wrote:
> > > * Drew Fustini <drew@pdp7.com> [200423 13:17]:
> > > > Thanks, Tony.  I was able to apply your patch cleanly to 5.5.9 kernel
> > > > and boot it ok on the PocketBeagle (AM3358) which is what I'm currently
> > > > testing with.  I can switch to 5.7.x but I just happened to be on 5.5.x
> > > > because that is when bias flags were added to gpiolib uapi.
> > > 
> > > OK. BTW, with PocketBeagle and mainline v5.6 kernel, I see the micro-USB
> > > connection always get disconnected after few hours of use. Are you aware
> > > ofthat?
> > > 
> > > This is with the micro-USB configured as acm and ecm gadget via configfs.
> > 
> > I've been rebooting often as I build new kernels with debug output but I
> > will do a test with 5.6 by leaving it running overnight and see if it gets
> > disrupted.  I use the PocketBeagle with the TechLab PocketCape [0] for
> > kernel development as there is no eMMC to confuse the boot sequence and
> > the TechLab has a seperate USB to serial converter so I can easily see
> > u-boot and kernel console.
> 
> Oh OK that looks like a nice cape :)
> 
> > I asked Robert Nelson if he'd heard of this issue and he had not.  But he
> > asked how you are powering the board as any blip would probably reset the
> > board instantly as not enough cap's on the PocketBeagle's USB power rail.  
> 
> Hmm good point. I recall the pocketbeagle uptime being many days with
> USB stopping enumerating. But yes, this is powered over USB.
> 
> > > > I'm a somewhat confused about the difference between the "gpio-ranges"
> > > > property for the gpio[0-3] nodes and the "pinctrl-single,gpio-range"
> > > > property for the am33xx_pinmux node.
> > > > 
> > > > For a test, I tried adding "gpio-ranges" to arch/arm/boot/dts/am33xx-l4.dtsi:
> > > > 
> > > >                         gpio0: gpio@0 {
> > > >                                 compatible = "ti,omap4-gpio";
> > > >                                 gpio-controller;
> > > >                                 #gpio-cells = <2>;
> > > >                                 interrupt-controller;
> > > >                                 #interrupt-cells = <2>;
> > > >                                 reg = <0x0 0x1000>;
> > > >                                 interrupts = <96>;
> > > >                                 gpio-ranges = <&am33xx_pinmux 0 0 1>;
> > > > 			}
> > > 
> > > So the gpio-ranges tells the gpio contorller what pinctrl device pin
> > > to use for configuring things.
> > 
> > Thanks, that makes sense. 
> > 
> > But in this case, pinctrl-single also needs to parse "gpio-ranges"
> > property from the gpio nodes?
> 
> Hmm not sure but don't think so, I think that information comes from
> the calls from gpio-omap.c to pinctrl-single.c.
> 
> > > > and "pinctrl-single,gpio-range" like this:
> > > > 
> > > >                                 am33xx_pinmux: pinmux@800 {
> > > >                                         compatible = "pinctrl-single";
> > > >                                         reg = <0x800 0x238>;
> > > >                                         #pinctrl-cells = <1>;
> > > >                                         pinctrl-single,register-width = <32>;
> > > >                                         pinctrl-single,function-mask = <0x7f>;
> > > > 
> > > >                                         pinctrl-single,gpio-range = <&range 0 1 0>;
> > > > 
> > > >                                         range: gpio-range {
> > > >                                                 #pinctrl-single,gpio-range-cells = <3>;
> > > >                                         };
> > > >                                 };
> > > > 
> > > > Do you think both of those properties would be needed?
> > > 
> > > No I don't think so. The pinctrl-single could be additionally
> > > configured for gpio functionality too. For omaps, that gpio
> > > functionality would be mostly limited to output toggling using the
> > > internal pulls. Would be still usable on some systems though.
> > 
> > What woud it mean for the pinctrl-single to be configured for gpio
> > functionality?
> 
> That would mean that you can also use pinctrl-single as a gp(i)o
> controller in some cases with the pulls instead of gpio-omap.
> 
> > Would that be needed for pinctrl_gpio_request() to succeed?
> 
> No, that's a separate feature.
> 
> > > Also, it's been a while so I don't remember where I started running
> > > into addressing issues though.. My guess is that you will soon hit
> > > them too and notice :)
> > > 
> > > But basically we want to reference the pinctrl pins based on their
> > > physical offset from the padconf base register, and not based on an
> > > invented number in the dts. Well maybe you can describe the problem
> > > further for us to discuss when you see it :)
> > 
> > Wouldn't the pinctrl pin numbering be from 0 to pcs_device.size /
> > pcs_device.width ?  
> 
> Yes. And ideally we'd specify the real register offset rather
> than the index number for the pin also in the dts.
> 
> If that does not work for some reason, then it's best to set up a
> macro to avoid confusion with figuring out the pin index rather
> than look up the register offset in the TRM. But we can figure
> that out once you have something working.
> 
> > That index number of the pin plus pcs_device would give the physical
> > address of the padconf register.
> 
> Right, I'm more concerned what gets put into the dts files
> as that's an ABI.
> 
> Regards,
> 
> Tony

I have compiled the following csv list to generate the gpio-ranges
properties by referencing "Table 9-10. CONTROL_MODULE REGISTERS" in
the  "AM335xTechnical Reference Manual" [0] and "Table 4-2. Pin 
Attributes" in the "AM335x Sitara Processor datasheet" [1]:

gpiochip,gpio-line,pinctrl-PIN,pinctrl-address
0,0,82,44e10948
0,1,83,44e1094c
0,2,84,44e10950
0,3,85,44e10954
0,4,86,44e10958
0,5,87,44e1095c
0,6,88,44e10960
0,7,89,44e10964
0,8,52,44e108d0
0,9,53,44e108d4
0,10,54,44e108d8
0,11,55,44e108dc
0,12,94,44e10978
0,13,95,44e1097c
0,14,96,44e10980
0,15,97,44e10984
0,16,71,44e1091c
0,17,72,44e10920
0,18,135,44e10a1c
0,19,108,44e109b0
0,20,109,44e109b4
0,21,73,44e10924
0,22,8,44e10820
0,23,9,44e10824
0,26,10,44e10828
0,27,11,44e1082c
0,28,74,44e10928
0,29,81,44e10944
0,30,28,44e10870
0,31,29,44e10874
1,0,0,44e10800
1,1,1,44e10804
1,2,2,44e10808
1,3,3,44e1080c
1,4,4,44e10810
1,5,5,44e10814
1,6,6,44e10818
1,7,7,44e1081c
1,8,90,44e10968
1,9,91,44e1096c
1,10,92,44e10970
1,11,93,44e10974
1,12,12,44e10830
1,13,13,44e10834
1,14,14,44e10838
1,15,15,44e1083c
1,16,16,44e10840
1,17,17,44e10844
1,18,18,44e10848
1,19,19,44e1084c
1,20,20,44e10850
1,21,21,44e10854
1,22,22,44e10858
1,23,23,44e1085c
1,24,24,44e10860
1,25,25,44e10864
1,26,26,44e10868
1,27,27,44e1086c
1,28,30,44e10878
1,29,31,44e1087c
1,30,32,44e10880
1,31,33,44e10884
2,0,34,44e10888
2,1,35,44e1088c
2,2,36,44e10890
2,3,37,44e10894
2,4,38,44e10898
2,5,39,44e1089c
2,6,40,44e108a0
2,7,41,44e108a4
2,8,42,44e108a8
2,9,43,44e108ac
2,10,44,44e108b0
2,11,45,44e108b4
2,12,46,44e108b8
2,13,47,44e108bc
2,14,48,44e108c0
2,15,49,44e108c4
2,16,50,44e108c8
2,17,51,44e108cc
2,18,77,44e10934
2,19,78,44e10938
2,20,79,44e1093c
2,21,80,44e10940
2,22,56,44e108e0
2,23,57,44e108e4
2,24,58,44e108e8
2,25,59,44e108ec
2,26,60,44e108f0
2,27,61,44e108f4
2,28,62,44e108f8
2,29,63,44e108fc
2,30,64,44e10900
2,31,65,44e10904
3,0,66,44e10908
3,1,67,44e1090c
3,2,68,44e10910
3,3,69,44e10914
3,4,70,44e10918
3,5,98,44e10988
3,6,99,44e1098c
3,9,75,44e1092c
3,10,76,44e10930
3,13,141,44e10a34
3,14,100,44e10990
3,15,101,44e10994
3,16,102,44e10998
3,17,103,44e1099c
3,18,104,44e109a0
3,19,105,44e109a4
3,20,106,44e109a8
3,21,107,44e109ac


Here is the gpio-ranges property for gpiochip0 and I will post a patch
for gpiochip[0..3] if it seems like I am on the right track:
 
diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 5ed7f3c58c0f..65d46777ffb3 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -151,6 +151,19 @@ SYSC_OMAP2_SOFTRESET |
 
                        gpio0: gpio@0 {
                                compatible = "ti,omap4-gpio";
+                               gpio-ranges =
+                               <&am33xx_pinmux  0  82 8>, // gpio0.0  ->  PIN82 (0x948)
+                               <&am33xx_pinmux  8  52 4>, // gpio0.8  ->  PIN52 (0x8D0)
+                               <&am33xx_pinmux 12  94 4>, // gpio0.12 ->  PIN94 (0x978)
+                               <&am33xx_pinmux 16  71 2>, // gpio0.16 ->  PIN71 (0x91C)
+                               <&am33xx_pinmux 18 135 1>, // gpio0.18 -> PIN135 (0xA1C)
+                               <&am33xx_pinmux 19 108 2>, // gpio0.19 -> PIN135 (0x9B0)
+                               <&am33xx_pinmux 21  73 1>, // gpio0.21 ->  PIN73 (0x9B0)
+                               <&am33xx_pinmux 22   8 2>, // gpio0.22 ->   PIN8 (0x820)
+                               <&am33xx_pinmux 26  10 2>, // gpio0.26 ->  PIN10 (0x828)
+                               <&am33xx_pinmux 28  74 1>, // gpio0.28 ->  PIN10 (0x928)
+                               <&am33xx_pinmux 29  81 1>, // gpio0.29 ->  PIN10 (0x944)
+                               <&am33xx_pinmux 30  28 2>; // gpio0.30 ->  PIN10 (0x870)
                                gpio-controller;
                                #gpio-cells = <2>;
                                interrupt-controller;

And here is the content of
/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/gpio-ranges:

GPIO ranges handled:
0: gpio-0-31 GPIOS [0 - 7] PINS [82 - 89]
8: gpio-0-31 GPIOS [8 - 11] PINS [52 - 55]
12: gpio-0-31 GPIOS [12 - 15] PINS [94 - 97]
16: gpio-0-31 GPIOS [16 - 17] PINS [71 - 72]
18: gpio-0-31 GPIOS [18 - 18] PINS [135 - 135]
19: gpio-0-31 GPIOS [19 - 20] PINS [108 - 109]
21: gpio-0-31 GPIOS [21 - 21] PINS [73 - 73]
22: gpio-0-31 GPIOS [22 - 23] PINS [8 - 9]
26: gpio-0-31 GPIOS [26 - 27] PINS [10 - 11]
28: gpio-0-31 GPIOS [28 - 28] PINS [74 - 74]
29: gpio-0-31 GPIOS [29 - 29] PINS [81 - 81]
30: gpio-0-31 GPIOS [30 - 31] PINS [28 - 29]

Therefore, I think it would be useful to populate "gpio-ranges" in 
am33xx-l4.dtsi.

Is there a problem that I am missing?

Thank you,
Drew
