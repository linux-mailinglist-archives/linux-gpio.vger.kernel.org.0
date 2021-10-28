Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21EE43E043
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 13:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhJ1Lz1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 07:55:27 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:52460 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhJ1Lz1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 07:55:27 -0400
X-Greylist: delayed 10811 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 Oct 2021 07:55:26 EDT
Received: from [IPv6:2a02:a03f:eafe:c901:6c18:8b05:4bd4:d9c2] (unknown [IPv6:2a02:a03f:eafe:c901:6c18:8b05:4bd4:d9c2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 98A5926878E;
        Thu, 28 Oct 2021 13:52:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1635421978;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1gbyaB4CnoIk3BZehsPmxOskoWAiekdQXyVFvPOrOfQ=;
        b=cvN61TsVQUecCBmHfY7oZ8VWVts2M81nJlsYkBVuLs1VV7hGySYhfBwhYaJ0YobVMJ4vts
        Xbm0bTMJ1wQB2ii+rKQlzyGFgWJ8kow92LRp8TtnDyOwOHqp8A7PA83tM2JZQXpX8jLuRC
        yB3NdYAqN/qbzsK5/erCimmlA+oDE3zKmW6FQYuBSDT9vmlNVCiyr9f0P34X27ym+XiZLc
        AT685BcDvGl0LMe+17BdRzY9oi3khOSmKXKHcVpJFZzobS+DuPKfTHP0vSGA3sOVhA+R4N
        FVNOVcv4rTtFH2daXjc0cXca3q5L2dLWBCxMbCUjnRostEbRRVOLQblit5rn5g==
Message-ID: <943e9850fba584ea93262f37165819bb18d2e1c3.camel@svanheule.net>
Subject: Re: [PATCH] gpio: realtek-otto: fix GPIO line IRQ offset
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 28 Oct 2021 13:52:55 +0200
In-Reply-To: <CAHp75VdafMtemORf3FvV-M4x7iJMxhCQrGSa17vJHrHuzQCqyg@mail.gmail.com>
References: <20211028085243.34360-1-sander@svanheule.net>
         <CAHp75VdafMtemORf3FvV-M4x7iJMxhCQrGSa17vJHrHuzQCqyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-10-28 at 13:23 +0300, Andy Shevchenko wrote:
> On Thu, Oct 28, 2021 at 11:52 AM Sander Vanheule <sander@svanheule.net> wrote:
> > 
> > The irqchip uses one domain for all GPIO lines, so the line offset
> > should be determined w.r.t. the first line of the first port, not the
> > first line of the triggered port.
> > 
> > Fixes: 0d82fb1127fb ("gpio: Add Realtek Otto GPIO support")
> 
> Not sure it fixes anything (it wasn't working from day 1), but in any
> case the patch is good.

The original patch was tested using a GPIO line on port A, so the missing offset was
irrelevant there (as it was zero). After recently acquiring a new device, I was trying to
use a line on port C, which resulted in unhandled interrupts.

> 
> > Signed-off-by: Sander Vanheule <sander@svanheule.net>
> > ---
> >  drivers/gpio/gpio-realtek-otto.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
> > index eeeb39bc171d..bd75401b549d 100644
> > --- a/drivers/gpio/gpio-realtek-otto.c
> > +++ b/drivers/gpio/gpio-realtek-otto.c
> > @@ -205,7 +205,7 @@ static void realtek_gpio_irq_handler(struct irq_desc *desc)
> >                 status = realtek_gpio_read_isr(ctrl, lines_done / 8);
> >                 port_pin_count = min(gc->ngpio - lines_done, 8U);
> >                 for_each_set_bit(offset, &status, port_pin_count)
> > -                       generic_handle_domain_irq(gc->irq.domain, offset);
> > +                       generic_handle_domain_irq(gc->irq.domain, offset +
> > lines_done);
> 
> Looking into these '/ 8', '8U' sounds to me that it may be a good idea
> to switch to for_each_set_clump8(). But it's out of scope here.

For the current code, I could indeed have used for_each_set_clump8, instead of the u8
read_isr() accessor.

However, I'm also preparing support for the RTL9302 device I have recently acquired. On
RTL930x and RTL931x the port order is reversed, requiring different port order handling.
My plan is to provide different port_read_isr() functions for the different port orders,
that return the requested u8. I'll try to get that patch set out today as well.

Best,
Sander

