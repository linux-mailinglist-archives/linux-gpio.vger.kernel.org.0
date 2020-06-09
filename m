Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51821F359A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 09:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgFIH6c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 03:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgFIH63 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2020 03:58:29 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F02C03E97C
        for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2020 00:58:27 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id r77so8730462ior.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2020 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D0Izobairq3HPGIM7wB1F+v5CJ0c4Z0+kAZbB2rwCBI=;
        b=F+Y1CC9/NEP+GxLXxOTnfU4bNjYY1wz/x6+SLxjPKqio2rOqvkD87hsXOMdaAq0Xud
         ZllRkeQk689ZblVTsazfI4A7GlJTegbZKyX2ZTP1pNjAVQupq+fFnyXLZtZuP/1nub8o
         puChyFupDjWLtQvJSLILRou6XOJjURzf6OHkdVye3xCHgvnb738v3os4lRvrqzheh42n
         A6Xdv5RCBxlU05vi+c5IIEHzyeBUqpxO4fiNnSRK/u//KAfUoJj9+d7XvE3T1lRRtWSV
         CKr68NLRM5exe/mCIfwlN9X1HrseA7RBy4GEzdxRWwg7kxpfNLauOorlv0d7QZlGJA43
         3aJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D0Izobairq3HPGIM7wB1F+v5CJ0c4Z0+kAZbB2rwCBI=;
        b=moaUTkldU1RdeGWuyeF5LJy3+/2kiw8a5vWNR3EtF2DO2oBSKRxwaIU2TkeFllpE/V
         umHWwlaoR59pw5Tu+6DqXIxMrT7nQz3wggu0weKcDG/MyNHzyujXsmyAqaNN+XkyzwNB
         0T6phjeQZX8Qy8UtQxNJobJmF0ccIjHHkygj7XJqjp/l8V5GVTnn+IWMbyhCQ0pX05Ys
         Kn/3eLuISIYCrZAQtekmYNhL/+I24n4YZThV5p1x+iw1JCq0k++1qkOBPyGBo+3W1KFk
         Ev/upzl/TrOXGk5SgyDbJpohlmuURK9+OYG0gzKeZnc+OTmGgBjXEV21lAzu80/Etiy2
         PESg==
X-Gm-Message-State: AOAM530YXTbLYI8JaqeIzafSMTbdpsm/pqd6XNDOPjjukikZLbgVdyrn
        gUmlymI/y3uhMeyuHnKYEZy+hp6qpR7uARZW8hecng==
X-Google-Smtp-Source: ABdhPJx2bQ9MpurOw+kbFkTpuwXAUL7qWR5/nMePphcxKeTXiD5GWJBTCE0v27bLoKC5cHGy8OdCkAkiYPTXgWfz/WY=
X-Received: by 2002:a6b:39d7:: with SMTP id g206mr25951591ioa.31.1591689507052;
 Tue, 09 Jun 2020 00:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191224120709.18247-1-brgl@bgdev.pl> <20191224120709.18247-13-brgl@bgdev.pl>
 <20200609002346.GA6042@sol>
In-Reply-To: <20200609002346.GA6042@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 9 Jun 2020 09:58:16 +0200
Message-ID: <CAMRc=Mf+xYFaznq+O=wEjb3UyanuH5b3hvOpNx9Jcx+Vm65g7A@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 9 cze 2020 o 02:23 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a):
>
> On Tue, Dec 24, 2019 at 01:07:08PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
>
> [snip!]
>
> > +static int lineinfo_changed_notify(struct notifier_block *nb,
> > +                                unsigned long action, void *data)
> > +{
> > +     struct gpio_chardev_data *priv =3D to_gpio_chardev_data(nb);
> > +     struct gpioline_info_changed chg;
> > +     struct gpio_desc *desc =3D data;
> > +     int ret;
> > +
> > +     if (!test_bit(desc_to_gpio(desc), priv->watched_lines))
> > +             return NOTIFY_DONE;
> > +
> > +     memset(&chg, 0, sizeof(chg));
> > +     chg.info.line_offset =3D gpio_chip_hwgpio(desc);
> > +     chg.event_type =3D action;
> > +     chg.timestamp =3D ktime_get_real_ns();
> > +     gpio_desc_to_lineinfo(desc, &chg.info);
> > +
>
> Is this call legal?  It can sleep - in fact you recently changed that
> very function to move a mutex call outside of a spinlock protected sectio=
n.
> Here it is being called within an RCU lock, as lineinfo_changed_notify
> is at the end of an atomic_notifier_call_chain.
>

Yeah, this is clearly wrong and lockdep would complain about invalid
wait context. I'm trying to remember why I went for an atomic notifier
chain here though... At first glance it doesn't look like the chain
could be called from atomic context anywhere.

Bart
