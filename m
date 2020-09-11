Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50227265681
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 03:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbgIKBR4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 21:17:56 -0400
Received: from pi.codeconstruct.com.au ([103.231.89.101]:41894 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgIKBRz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2020 21:17:55 -0400
X-Greylist: delayed 438 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 Sep 2020 21:17:52 EDT
Received: from pecola.lan (180-150-121-66.b49679.p1.nbn.aussiebb.net [180.150.121.66])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AE2DB3FEA9;
        Thu, 10 Sep 2020 21:10:30 -0400 (EDT)
Message-ID: <788526c84deb4763d874be1748fcc5a583f8f79d.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] gpio/aspeed-sgpio: enable access to all 80 input &
 output sgpios
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Joel Stanley <joel@jms.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
Date:   Fri, 11 Sep 2020 09:10:29 +0800
In-Reply-To: <CACPK8XcT02qv+1H=DDv8BRAdUmrBoweZ+Qb3aG34bQ9-UC08Xg@mail.gmail.com>
References: <20200715135418.3194860-1-jk@codeconstruct.com.au>
         <CACPK8XcT02qv+1H=DDv8BRAdUmrBoweZ+Qb3aG34bQ9-UC08Xg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Joel,

Thanks for the review!

> A Fixes: might be a good idea.

OK, given this isn't strictly (just) a fix, should I split that out?

> > -#define MAX_NR_SGPIO                   80
> > +#define MAX_NR_HW_SGPIO                        80
> > +#define SGPIO_OUTPUT_OFFSET            MAX_NR_HW_SGPIO
> 
> A short comment explaining what's going on with these defines (as you
> did in your commit message) will help future reviewers.

Sounds good, I'll add one.

> 
> > +static void aspeed_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
> > +               unsigned long *valid_mask, unsigned int ngpios)
> > +{
> > +       struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
> > +       int n = sgpio->n_sgpio;
> > +
> > +       WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
> > +
> > +       /* input GPIOs in the lower range */
> > +       bitmap_set(valid_mask, 0, n);
> > +       bitmap_clear(valid_mask, n, ngpios - n);
> > +}
> > +
> > +static const bool aspeed_sgpio_is_input(unsigned int offset)
> 
> The 0day bot complained about the 'const' here.

ack, will remove.

> > +{
> > +       return offset < SGPIO_OUTPUT_OFFSET;
> > +}
> >  static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
> >  {
> >         struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> >         unsigned long flags;
> > +       int rc;
> > 
> > -       spin_lock_irqsave(&gpio->lock, flags);
> > -
> > -       gpio->dir_in[GPIO_BANK(offset)] &= ~GPIO_BIT(offset);
> > -       sgpio_set_value(gc, offset, val);
> > +       /* No special action is required for setting the direction; we'll
> > +        * error-out in sgpio_set_value if this isn't an output GPIO */
> > 
> > +       spin_lock_irqsave(&gpio->lock, flags);
> > +       rc = sgpio_set_value(gc, offset, val);
> >         spin_unlock_irqrestore(&gpio->lock, flags);
> > 
> >         return 0;
> 
> I think this should be 'return rc'

Yup. I'll send a v2 with these changes.

Cheers,


Jeremy

