Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1F52ABFCF
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 16:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730199AbgKIP1w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 10:27:52 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:53527 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729776AbgKIP1v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 10:27:51 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 436A7C000E;
        Mon,  9 Nov 2020 15:27:49 +0000 (UTC)
Date:   Mon, 9 Nov 2020 16:27:48 +0100
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
Message-ID: <20201109152748.GA1691943@piout.net>
References: <20201109132643.457932-1-lars.povlsen@microchip.com>
 <20201109132643.457932-3-lars.povlsen@microchip.com>
 <CAHp75Vdfm7A5=Mi-LZ1sHJS5fSngypZQ50-rGQ7A6kD2kmVFTA@mail.gmail.com>
 <20201109143237.GJ1257108@piout.net>
 <CAHp75Vc7eRDq5wUyUdvCZCnV_VS+afGnbJpQeDSeXVE9K_MGng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vc7eRDq5wUyUdvCZCnV_VS+afGnbJpQeDSeXVE9K_MGng@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/11/2020 17:16:49+0200, Andy Shevchenko wrote:
> On Mon, Nov 9, 2020 at 4:32 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > On 09/11/2020 16:17:40+0200, Andy Shevchenko wrote:
> > > > +       if (input != bank->is_input) {
> > >
> > > > +               dev_err(pctldev->dev, "Pin %d direction as %s is not possible\n",
> > > > +                       pin, input ? "input" : "output");
> > >
> > > Do we need this noise? Isn't user space getting a proper error code as
> > > per doc and can handle this?
> >
> > Why would userspace get the error code?
> 
> Huh?! Why it shouldn't. How will users know if they are doing something wrong?
> 
> > Userspace should never have to
> > handle gpios directly or you are doing something wrong.
> 
> This is true, but check how error codes are propagated to the user space.
> 

your point is to remove an error message because the error may be
propagated to userspace. My point is that userspace should never use
gpios and the kernel has to be the consumer. I don't see how your answer
is relevant here. Did you already check all the call sites from the
kernel too?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
