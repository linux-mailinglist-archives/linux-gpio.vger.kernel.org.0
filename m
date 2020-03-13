Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E80D184F5E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 20:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbgCMTle (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 15:41:34 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40323 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgCMTld (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2020 15:41:33 -0400
Received: by mail-ot1-f65.google.com with SMTP id h17so11338735otn.7
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2020 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wjieT0R9WZnB9z3n+XY1qg0Ch3LybzVq7EUWHcy5YTo=;
        b=kMlus6sC2nyintFvkXx9LHI0rgeCLG37gf4jtSyinrKY+YclOGnKzKJePfCn5QlwPl
         YE5mMTwfiLKM9qhLlcNux4oSh+KMhKpwgc/lTfE7kLuFYjSliG5MuOmK9L2+7jrcgkuS
         P/zojkhxaqelvLeov7dWwxqLSE+BmBFNJ3rlGn80JqYQwRKLPFu9pfr19m7H5auefrpW
         dfPhDvvY+s8NCU+EeVfHUX7iP75icFzDdzXEkO4lxK1ujA++3w0bA/WkNmTLsgIvnXPM
         d6PztCKlbM25SnoIAwKg6nz2f56lFb9vYDbZS82WyCJ4xXm58ANZaIf+uE7vhtALzOe/
         aypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wjieT0R9WZnB9z3n+XY1qg0Ch3LybzVq7EUWHcy5YTo=;
        b=g71qHqAvyCA/dyIHh5uq6xd6JO5kQeX/aKDIaNV80+jOEN5LSjuK20xYOmArz1pkY+
         AWqj3j7pkme11V4dRZGJ9jEX2zLw/AowaL8nBVMKwdMKP+6qk6ADQE0dMJkjwiCSb+qq
         DClmOEFmr00dLesSGKVk6buUb2iFK7kyRdlKEdmsNIojMtRwfxACku5uVU8JzRs/82Tm
         KQeBpxmCK4Zw+LEL2qsfWBGwUll1e6nWb2kYtEuFvAY0vwgEZJJtGYNDYckUlL5FdAKJ
         G1UqRQbw2megF/kqxu8x/cAsak0ehNnFuCXjpQdBYeT2kDJUFwEXOfaEfuJi9r1SmTxb
         Q0lg==
X-Gm-Message-State: ANhLgQ2J4k8l0/8Z/aeEmpdfcE5Z1e5rBKSp+k4TxWXwFp8CUgwDEvta
        7b9Z5OM8bf996IlcENbmBfEvIlxZyWfH/xMaXkHR0w==
X-Google-Smtp-Source: ADFU+vvz3zyxGYanegEtEhYVsPXr7j+OJ3pchZ5Pgj4K3BmzZJUyaiASUSU1nbsKYRV4BYUb2xdxCgQLa7EcmLJRnHY=
X-Received: by 2002:a05:6830:1e06:: with SMTP id s6mr1601032otr.28.1584128491269;
 Fri, 13 Mar 2020 12:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <1583941433-15876-1-git-send-email-tharvey@gateworks.com>
 <20200313153151.e5nmsbr6yrzchdxi@rric.localdomain> <20200313191230.qrrlo7ht24fhfhvj@rric.localdomain>
In-Reply-To: <20200313191230.qrrlo7ht24fhfhvj@rric.localdomain>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 13 Mar 2020 12:41:19 -0700
Message-ID: <CAJ+vNU0q7wW8JPC8FjEkD4a-ZJc1QAmVNne0w1T4MX9pd4bCyg@mail.gmail.com>
Subject: Re: [PATCH] gpio: thunderx: fix irq_request_resources
To:     Robert Richter <rrichter@marvell.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 13, 2020 at 12:12 PM Robert Richter <rrichter@marvell.com> wrote:
>
> On 13.03.20 16:31:51, Robert Richter wrote:
> > On 11.03.20 08:43:53, Tim Harvey wrote:
> > > If there are no parent resources do not call irq_chip_request_resources_parent
> > > at all as this will return an error.
> > >
> > > This resolves a regression where devices using a thunderx gpio as an interrupt
> > > would fail probing.
> > >
> > > Fixes: 0d04d0c ("gpio: thunderx: Use the default parent apis for {request,release}_resources")
> > > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > > ---
> > >  drivers/gpio/gpio-thunderx.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
> > > index 4627704..f84b9b1 100644
> > > --- a/drivers/gpio/gpio-thunderx.c
> > > +++ b/drivers/gpio/gpio-thunderx.c
> > > @@ -366,15 +366,18 @@ static int thunderx_gpio_irq_request_resources(struct irq_data *data)
> > >  {
> > >     struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
> > >     struct thunderx_gpio *txgpio = txline->txgpio;
> > > +   struct irq_data *parent_data = data->parent_data;
> > >     int r;
> > >
> > >     r = gpiochip_lock_as_irq(&txgpio->chip, txline->line);
> > >     if (r)
> > >             return r;
> > >
> > > -   r = irq_chip_request_resources_parent(data);
> > > -   if (r)
> > > -           gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
> > > +   if (parent_data && parent_data->chip->irq_request_resources) {
> > > +           r = irq_chip_request_resources_parent(data);
> > > +           if (r)
> > > +                   gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
> > > +   }
> >
> > There is no unlocking for the else case. I would assume the
> > parent_data should be checked before grabbing the lock, or is this
> > intended?
>
> Looking at the original code, the parent resources are requested only
> if existing. So the change is ok.
>
> On the other hand, the overall change using irq_chip_{request,
> release}_resources_parent() became pointless now. It is unreadable and
> more complex now. Thus, commit 0d04d0c should just be reverted.
>
> The function interface is limited. Instead of letting the child device
> deal with the parent, parent requests should be handled directly in
> irq_request_resources(). Another aspect is that the code for this
> driver has been already removed upstream and ti_sci_inta_msi.c is the
> last remaining user of it. This speaks also for a removal by a revert.
>

Robert,

A revert does make the most sense to me and it works for 5.2, 5.3, and
5.5 but the revert fails for 5.4 and needs some manual intervention.

I'm not sure how to proceed with this.

Tim
