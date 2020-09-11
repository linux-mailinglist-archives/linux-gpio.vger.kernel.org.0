Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2CB265674
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 03:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725294AbgIKBPW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 21:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgIKBPQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2020 21:15:16 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65098C061573;
        Thu, 10 Sep 2020 18:15:16 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id u21so11520001eja.2;
        Thu, 10 Sep 2020 18:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DqB7DPHtIqi+Bw4fMVuljm+cc0DjSGuY8RA1DkIWScA=;
        b=DHL8lSflYdMnee4Le9oK2Cmw2kT1eKSCFxkEhyOVZfuzMIo/md+bD1KtO10sDhEJ7s
         xkYUKlXqQqmHWSsOqTkXU9VCQa6ufMsGzNaeAa6D+XybzjCJZhojTlf9pYPIgmghItuY
         Try0QKw8VXdzCAO3PeOi3EogI8kn3HmlTB3Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DqB7DPHtIqi+Bw4fMVuljm+cc0DjSGuY8RA1DkIWScA=;
        b=D9XjCsFpuiO50dsV29xH5aiQnXaTSw49H40Ei3QLxftAUoVI+is8ekUZP9MA2/aHV8
         3MRZRWPRdX31nSw52AE0eEBPnc3nDVMnUJJaNiXlxRyK4cGODBKF4+aDvUgvNA6sYq12
         j2tyCaHvBBY1U1aGw3yBrvqWIxS4/D5S9mbK1v/HvAfIrA0qML4fnmgVKOBV8HAkjm2D
         9nAkv2nIFniUwAz0vaPDptr7nTWoR6ADmzqqt/9Z8T3nny95TnoiVpLu4yA5HT3nv6zE
         2L/FH8uN4kvZ+JgSVvMHXc3Knj8JYcqbF9BrESR8HcIGmN7QF1Bkis+Ks3exdoq+Xm2A
         mDHw==
X-Gm-Message-State: AOAM531DcCy2xh7oo1Kmy8UmuB7M8fr1lNgD/3PpKkimAempvtgWxWr7
        JLA/jxA/zCpTyS1F2+it8huZkXbd16XtPFiB19Y=
X-Google-Smtp-Source: ABdhPJyC/5wFl0aS0uol0uyiBTrxuWRqUjvlvqNkVX3NwIiFYVzywBU8WdIF3SqqzUmJnc3M3EdqulZFtzFPOftVnJE=
X-Received: by 2002:a17:906:8695:: with SMTP id g21mr11320548ejx.504.1599786914775;
 Thu, 10 Sep 2020 18:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200715135418.3194860-1-jk@codeconstruct.com.au>
 <CACPK8XcT02qv+1H=DDv8BRAdUmrBoweZ+Qb3aG34bQ9-UC08Xg@mail.gmail.com> <788526c84deb4763d874be1748fcc5a583f8f79d.camel@codeconstruct.com.au>
In-Reply-To: <788526c84deb4763d874be1748fcc5a583f8f79d.camel@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 11 Sep 2020 01:15:02 +0000
Message-ID: <CACPK8XetpRt9gnfA3WbTzXOctqD5Anb0ugub3LaVzyyVnjycmQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio/aspeed-sgpio: enable access to all 80 input &
 output sgpios
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 11 Sep 2020 at 01:10, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Joel,
>
> Thanks for the review!
>
> > A Fixes: might be a good idea.
>
> OK, given this isn't strictly (just) a fix, should I split that out?

I assume anyone using the sgpio driver in anger would need this patch
for it to work properly, so a fix tag will help them there. No need to
break it down any further in my opinion.

Cheers,

Joel

>
> > > -#define MAX_NR_SGPIO                   80
> > > +#define MAX_NR_HW_SGPIO                        80
> > > +#define SGPIO_OUTPUT_OFFSET            MAX_NR_HW_SGPIO
> >
> > A short comment explaining what's going on with these defines (as you
> > did in your commit message) will help future reviewers.
>
> Sounds good, I'll add one.
>
> >
> > > +static void aspeed_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
> > > +               unsigned long *valid_mask, unsigned int ngpios)
> > > +{
> > > +       struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
> > > +       int n = sgpio->n_sgpio;
> > > +
> > > +       WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
> > > +
> > > +       /* input GPIOs in the lower range */
> > > +       bitmap_set(valid_mask, 0, n);
> > > +       bitmap_clear(valid_mask, n, ngpios - n);
> > > +}
> > > +
> > > +static const bool aspeed_sgpio_is_input(unsigned int offset)
> >
> > The 0day bot complained about the 'const' here.
>
> ack, will remove.
>
> > > +{
> > > +       return offset < SGPIO_OUTPUT_OFFSET;
> > > +}
> > >  static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
> > >  {
> > >         struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > >         unsigned long flags;
> > > +       int rc;
> > >
> > > -       spin_lock_irqsave(&gpio->lock, flags);
> > > -
> > > -       gpio->dir_in[GPIO_BANK(offset)] &= ~GPIO_BIT(offset);
> > > -       sgpio_set_value(gc, offset, val);
> > > +       /* No special action is required for setting the direction; we'll
> > > +        * error-out in sgpio_set_value if this isn't an output GPIO */
> > >
> > > +       spin_lock_irqsave(&gpio->lock, flags);
> > > +       rc = sgpio_set_value(gc, offset, val);
> > >         spin_unlock_irqrestore(&gpio->lock, flags);
> > >
> > >         return 0;
> >
> > I think this should be 'return rc'
>
> Yup. I'll send a v2 with these changes.
>
> Cheers,
>
>
> Jeremy
>
