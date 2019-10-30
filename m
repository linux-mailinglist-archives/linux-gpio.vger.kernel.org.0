Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 555F0E9CA8
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 14:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbfJ3Nvm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 09:51:42 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50767 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfJ3Nvm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 09:51:42 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iPoNs-00020h-Nw; Wed, 30 Oct 2019 14:51:36 +0100
Message-ID: <116e2d1eb1333c322450f20a5f591b7038586865.camel@pengutronix.de>
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org
Date:   Wed, 30 Oct 2019 14:51:35 +0100
In-Reply-To: <5bca4eb6-6379-394f-c95e-5bbbba5308f1@ti.com>
References: <20191030120440.3699-1-peter.ujfalusi@ti.com>
         <CAL_JsqK-eqoyU7RWiVXMpPZ8BfT8a0WB47756s8AUtyOqbkPXA@mail.gmail.com>
         <5bca4eb6-6379-394f-c95e-5bbbba5308f1@ti.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2019-10-30 at 15:32 +0200, Peter Ujfalusi wrote:
> 
> On 30/10/2019 15.12, Rob Herring wrote:
> > On Wed, Oct 30, 2019 at 7:03 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
> > > Hi,
> > > 
> > > The shared GPIO line for external components tends to be a common issue and
> > > there is no 'clean' way of handling it.
> > > 
> > > I'm aware of the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag, which must be provided when
> > > a driver tries to request a GPIO which is already in use.
> > > However the driver must know that the component is going to be used in such a
> > > way, which can be said to any external components with GPIO line, so in theory
> > > all drivers must set this flag when requesting the GPIO...
> > > 
> > > But with the GPIOD_FLAGS_BIT_NONEXCLUSIVE all clients have full control of the
> > > GPIO line. For example any device using the same GPIO as reset/enable line can
> > > reset/enable other devices, which is not something the other device might like
> > > or can handle.
> > > For example a device needs to be configured after it is enabled, but some other
> > > driver would reset it while handling the same GPIO -> the device is not
> > > operational anymmore as it lost it's configuration.
> > > 
> > > With the gpio-shared gpiochip we can overcome this by giving the gpio-shared
> > > the role of making sure that the GPIO line only changes state when it will not
> > > disturb any of the clients sharing the same GPIO line.
> > 
> > Why can't we just add a shared flag like we have for interrupts?
> > Effectively, we have that for resets too, it's just hardcoded in the
> > the drivers.
> 
> This would be kind of the same thing what the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE does, which was a quick workaround for
> fixed-regulators afaik.
> 
> But let's say that a board design will pick two components (C1 and C2)
> and use the same GPIO line to enable them. We already have the drivers
> for them and they are used in boards already.
> 
> Both needs the GPIO line to be high for normal operation.
> One or both of them needs register writes after they are enabled.
> 
> During boot both requests the GPIO (OUTPUT_LOW) and sets it high, then
> run the register setup.
> 
> C1 request GPIO (LOW)
> C1 gpio_set(1)
> C1 register writes
> C2 requests GPIO (LOW)
>  C1 placed to reset and looses the configuration
> C2 gpio_set(1)
>  C1 also enabled
> C2 register writes
> 
> At this point C2 is operational, C1 is not.
> 
> In shared GPIO case the GPIO should be handled like a regulator with a
> twist that the 'sticky' state of the GPIO might be low or high depending
> on the needs of the components it is connected to.
> 
> The shared GPIO line is a board design quirk and basically any device
> which have reset/enable GPIO must be able to work in a situation when
> they are sharing that line with other components and the driver should
> not know much about this small detail.

What about components that require a register write right after being
enabled, for example to put the device into a low power state, to
silence it on a bus, or to mask some initially enabled interrupts?

regards
Philipp

