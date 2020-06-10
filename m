Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 483AF1F4A71
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 02:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgFJAta (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 20:49:30 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:58948 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgFJAt3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2020 20:49:29 -0400
X-Greylist: delayed 599 seconds by postgrey-1.27 at vger.kernel.org; Tue, 09 Jun 2020 20:49:28 EDT
Received: from localhost (ip-78-45-211-110.net.upcbroadband.cz [78.45.211.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 5783F40005D;
        Wed, 10 Jun 2020 02:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1591749563;
        bh=623zmTaBKS6E2t14Sz0TpBJ8bnfIQ7azFyIxqD9eoVA=;
        h=From:To:Cc:Subject:Date;
        b=hUnbQ2/eYhn0eAq5yieFvb6K0zjh2SLTEwVMBRWpahyK7vB0v5n6NevKPkbbLRKGK
         20LKcu0+a404YV9T9XE6m+SqHOxFbNK6/CsFcHrOZ3AzTeX6vksXxbhAnx6HvxHu7N
         ffY98KFtSln2Der2FDp/aasPlpXzuOhejfQDtp/lDJmlJgYdjXmM3FynLsnnJjh2QQ
         Hv/OWjiqm7X6UOluZsT5kbXsudRK9E+OM5VcxGzqxSCrjgRPC3BGCKWzebXWxnZl1W
         K4qNMCj17I50Ax2PPOq5RkvSQG0S5q70bvAMIHhdjbYRyTuKD8FpqO9SFUrCUPfOWz
         3HRaZIrFQmdkA==
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     <linux-gpio@vger.kernel.org>
Cc:     Thierry Reding <treding@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vidya Sagar <vidyas@nvidia.com>
Subject: GPIO regression on mvebu and/or max310x since 2ab73c6d8323
Date:   Wed, 10 Jun 2020 02:39:22 +0200
MIME-Version: 1.0
Message-ID: <8cffce08-ed84-4242-8dcd-72de693f0f71@cesnet.cz>
Organization: CESNET
User-Agent: Trojita/v0.7-412-g2869c385e; Qt/5.13.0; xcb; Linux; Gentoo Base System release 2.4.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,
after upgrading from v5.6.7 to v5.7.1, my bit-banged I2C bus no longer=20
works. I've run a bisection and it led me to commit 2ab73c6d8323 (gpio:=20
Support GPIO controllers without pin-ranges). If I make=20
gpiochip_generic_request() call pinctrl_gpio_request() unconditionally=20
again, stuff gets back to working.

My HW setup is "unusual" as there's also an analog switch in the path of=20
the bit-banged bus, and that one is controlled by another GPIO from=20
MAX14830 (drivers/tty/serial/max310x.c). The I2C bit-banging is driven by a=20=

Solidrun ClearFog Base (mvebu, Armada AM385) pins MPP24 and MPP25 which are=20=

configured as GPIOs. In terms of a DTS snippet, here's how it looks like:

        /* Bit-banged I2C instead of the default UART function from the SoC=20=

*/
        &uart1_pins {
                status =3D "disabled";
        };
        &uart1 {
                status =3D "disabled";
        };
        gpio_i2c {
                compatible =3D "i2c-gpio";
                sda-gpios =3D <&gpio0 25 (GPIO_ACTIVE_HIGH |=20
GPIO_OPEN_DRAIN)>;
                scl-gpios =3D <&gpio0 24 (GPIO_ACTIVE_HIGH |=20
GPIO_OPEN_DRAIN)>;
                i2c-gpio.delay-us =3D <1>;
                #address-cells =3D <1>;
                #size-cells =3D <0>;
        };
       =20
        /* Analog switch control via a GPIO hog. This drives that analog=20
switch
           so that the signals from the SoC actually reach the I2C slaves=20
*/
        max14830@2 {
                // ...
                i2c_bitbang_enable {
                        gpio-hog;
                        gpios =3D <7 GPIO_ACTIVE_HIGH>;
                        output-high;
                        line-name =3D "I2C bitbang bus";
                };
        };

This means that for my bit-banged I2C to work, I need both the mvebu's=20
gpio+pinctrl and the MAX14830 GPIOs. I hope that the max310x.c path is OK=20
(max310x_gpio_direction_output() and friends are being called when kernel=20
sets up GPIO hogs). According to some dev_dbg()s in i2c/busses/i2c-gpio.c=20
and i2c/algos/i2c-algo-bit.c, the I2C slaves never respond with an ACK. The=20=

machine is remote so I have not had a chance to attach a logical analyzer=20
yet -- but I *think* that the root cause is somewhere in pinconf. When=20
stuff doesn't work, I get this:

# grep -e mpp24 -e mpp25=20
/sys/kernel/debug/pinctrl/f1018000.pinctrl/pinconf-groups
24 (mpp24): current: ua1(rxd), available =3D [ gpio(io) spi0(miso) ua0(cts)=20=

sd0(d4) dev(ready) ]
25 (mpp25): current: ua1(txd), available =3D [ gpio(io) spi0(cs0) ua0(rts)=20=

sd0(d5) dev(cs0) ]

...whereas on the old kernel, it looks like this:

# grep -e mpp24 -e mpp25=20
/sys/kernel/debug/pinctrl/f1018000.pinctrl/pinconf-groups=20
24 (mpp24): current: gpio(io), available =3D [ spi0(miso) ua0(cts) ua1(rxd)=20=

sd0(d4) dev(ready) ]
25 (mpp25): current: gpio(io), available =3D [ spi0(cs0) ua0(rts) ua1(txd)=20=

sd0(d5) dev(cs0) ]

There's also some difference in=20
/sys/kernel/debug/pinctrl/f1018000.pinctrl/pinmux-pins says, for example:

 pin 19 (PIN19): f1072004.mdio (GPIO UNCLAIMED) function gpio group mpp19

...whereas in the old kernel it is:

 pin 19 (PIN19): f1072004.mdio mvebu-gpio:19 function gpio group mpp19

...and the same for 22, 24, 29, 44, 54, all of these are supposed to be=20
GPIOs I think. At this time I'm deep in the bowels of pinconf/pinmux that I=20=

do not understand.

TL;DR: 2ab73c6d8323 breaks GPIOs on mvebu on my system. I'll be happy to=20
test patches which fix this in some better way than just a revert.

With kind regards,
Jan
