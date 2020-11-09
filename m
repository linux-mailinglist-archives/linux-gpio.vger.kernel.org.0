Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13602AC0B3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 17:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730017AbgKIQWM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 11:22:12 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:42321 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729451AbgKIQWM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 11:22:12 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id DD487FF80C;
        Mon,  9 Nov 2020 16:22:08 +0000 (UTC)
Date:   Mon, 9 Nov 2020 17:22:08 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl
 driver for Microsemi Serial GPIO
Message-ID: <20201109162208.GB1691943@piout.net>
References: <20201109132643.457932-1-lars.povlsen@microchip.com>
 <20201109132643.457932-3-lars.povlsen@microchip.com>
 <CAHp75Vdfm7A5=Mi-LZ1sHJS5fSngypZQ50-rGQ7A6kD2kmVFTA@mail.gmail.com>
 <20201109143237.GJ1257108@piout.net>
 <CAHp75Vc7eRDq5wUyUdvCZCnV_VS+afGnbJpQeDSeXVE9K_MGng@mail.gmail.com>
 <20201109152748.GA1691943@piout.net>
 <CAHp75VfcgyMEr3YscC2Na_RCTtd=ozCzCGq=UO6zKAa+9b4rqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfcgyMEr3YscC2Na_RCTtd=ozCzCGq=UO6zKAa+9b4rqg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/11/2020 18:15:30+0200, Andy Shevchenko wrote:
> > > > Userspace should never have to
> > > > handle gpios directly or you are doing something wrong.
> > >
> > > This is true, but check how error codes are propagated to the user space.
> > >
> >
> > your point is to remove an error message because the error may be
> > propagated to userspace. My point is that userspace should never use
> > gpios and the kernel has to be the consumer.
> 
> Tell this to plenty of users of old sysfs interface and to libgpiod ones.

Exactly, that is what I'm telling to them.

> If what you are saying had been true, we would have never had the new
> ABI for GPIOs.
> 
> > I don't see how your answer
> > is relevant here.
> 
> I have an opposite opinion.
> 
> > Did you already check all the call sites from the
> > kernel too?
> 
> If you think we have to print a message on each possible error case
> (but not always the one) we will get lost in the messages disaster and
> dmesg overflow.
> It is consumer who should decide if the setting is critical or not to
> be printed to user.
> 

This is the valid reason and as you can see, it has nothing to do with
userspace.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
