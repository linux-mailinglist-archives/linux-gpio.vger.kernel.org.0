Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07047AF88E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 11:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfIKJLI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 05:11:08 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:60895 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfIKJLI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 05:11:08 -0400
Received: from localhost (unknown [148.69.85.38])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9046124001F;
        Wed, 11 Sep 2019 09:11:05 +0000 (UTC)
Date:   Wed, 11 Sep 2019 11:11:01 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: at91-pio4: implement .get_multiple and
 .set_multiple
Message-ID: <20190911091101.GC21254@piout.net>
References: <20190905141304.22005-1-alexandre.belloni@bootlin.com>
 <CACRpkdbVC6DLHWftpL1wfkx_kWyfE=LpCQWZw=cv=RMVxDBm_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbVC6DLHWftpL1wfkx_kWyfE=LpCQWZw=cv=RMVxDBm_g@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/09/2019 01:27:10+0100, Linus Walleij wrote:
> On Thu, Sep 5, 2019 at 3:13 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Implement .get_multiple and .set_multiple to allow reading or setting
> > multiple pins simultaneously. Pins in the same bank will all be switched at
> > the same time, improving synchronization and performances.
> >
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Good initiative!
> 
> > +       for (bank = 0; bank < atmel_pioctrl->nbanks; bank++) {> +               unsigned int word = bank;
> > +               unsigned int offset = 0;
> > +               unsigned int reg;
> > +
> > +#if ATMEL_PIO_NPINS_PER_BANK != BITS_PER_LONG
> 
> Should it not be > rather than != ?
> 

Realistically, the only case that could happen would be
ATMEL_PIO_NPINS_PER_BANK == 32 and BITS_PER_LONG ==64. so I would go for
ATMEL_PIO_NPINS_PER_BANK < BITS_PER_LONG

> > +               word = BIT_WORD(bank * ATMEL_PIO_NPINS_PER_BANK);
> > +               offset = bank * ATMEL_PIO_NPINS_PER_BANK % BITS_PER_LONG;
> > +#endif
> 
> This doesn't look good for multiplatform kernels.
> 

I don't think we have multiplatform kernels that run both in 32 and 64
bits. I don't believe ATMEL_PIO_NPINS_PER_BANK will ever change, it has
been 32 on all the atmel SoCs since 2001.

> We need to get rid of any compiletime constants like this.
> 
> Not your fault I suppose it is already there, but this really need
> to be fixed. Any ideas?
> 

I can go for a variable instead of a constant but the fact is that there
is currently no 64bit SoC with that IP. I added the compile time check
just in case a 64 bit SoC appears with that IP one day.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
