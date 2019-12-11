Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A47811ABCB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 14:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbfLKNPa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 08:15:30 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39504 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729334AbfLKNP3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 08:15:29 -0500
Received: by mail-qk1-f196.google.com with SMTP id c16so11157159qko.6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 05:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+PB7EX7lDwiMw8Kbb0mQdnM19n3srgqYc0puD6EH7Ng=;
        b=dnZsQXljRvH8bQR/1WpIxRW/yP93fCFc+YQT+bh52rtRzKAKwXAAUmH8zlV97jXIJi
         2f7tYLxiMUjcCysS1NTnrdpE/IltabmXh7yBm/HfQs1X7J0w3WHD3wQKU+dLSnrTOzK/
         RNReMiDyp1zZA6Ml1HscM3Y3gC/0kbOg1dXTyqXU3AQqwJ9cSG7qxvucFQ8Ve1rG7m3Z
         tCv8yBy4x7kR5W/bLqF2dygNT62dv+AjQB6SxuH1y2GNeetZNA2M4DG/o6pnCyovKWfW
         ODhMGiEkzHZALz+feeLKgWpXffTiFH6N3VfGyR3TWQvimALoOK3+qjbBqq4/jIsqN45/
         5q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+PB7EX7lDwiMw8Kbb0mQdnM19n3srgqYc0puD6EH7Ng=;
        b=MzdI1ZaTyEm+uGnpOlouB74Q8ltBbD0zm7QY1QDtSZGvKf5P5pcmY23nXqKzUvhUIe
         HKcCesouZqR04qFUPW389UvVEwhIhaBntpyT5v5uk/uuPZs7K9qQJosAfulCDPC5ecqe
         MkUH0C5rA+R3tSDNQL4Ud+M8LKxw9+xBqHqrSuKVEfIfwzlcdkBV20Qz9xgJKSbqaWJE
         Nvo3V+rLKfS+MbLEgpZifbkGAGGTZJvFHURQpaf3I7N04mZLhCB8pWi0OGduwWTS1RVA
         BisvQRDuLjRfOrOf9CjdAw4hMRQRaL/NFd9PoQ1CewnmPuvYcBwk7y1XPUqxCgQ6KiiQ
         y+Bg==
X-Gm-Message-State: APjAAAXGJI6IxJ4vqSooKXo4udgFEsyXxKeusQt3ST4Q98FBvxllrJci
        Ee7ELXl/CB2Oun8kYMDd1qDW1YMGyh3z/S+CQaqq7A==
X-Google-Smtp-Source: APXvYqwEH+gE7sudKrThUzXAm0Gs8Xg82LRYRxieL5GQ5/NQ4KdSYSKi/Zz/Cs6nb9Sh3iPShczr4GwI0rWFjYVHbks=
X-Received: by 2002:a37:744:: with SMTP id 65mr2756449qkh.323.1576070128866;
 Wed, 11 Dec 2019 05:15:28 -0800 (PST)
MIME-Version: 1.0
References: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mc88eiLtu7_0y51nGDzM0nRmwaOurLx9isf=qRB0uj7KA@mail.gmail.com>
 <20191210143902.GA3509@sol> <20191210165548.GY32742@smile.fi.intel.com>
 <CAMpxmJVMW=3k2odB9UKEzeopZ0q7T48Cux6ux=1j72Hv5A4yOQ@mail.gmail.com>
 <20191211092921.GA21730@sol> <20191211104723.GO32742@smile.fi.intel.com>
In-Reply-To: <20191211104723.GO32742@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Dec 2019 14:15:17 +0100
Message-ID: <CAMpxmJXAG=FW2x7zS77ZGH-9Og+0eeWfv-qA=UWq+KZ4UoWwqg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in compatible mode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 11 gru 2019 o 11:47 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Wed, Dec 11, 2019 at 05:29:21PM +0800, Kent Gibson wrote:
> > On Wed, Dec 11, 2019 at 10:18:39AM +0100, Bartosz Golaszewski wrote:
> > > wt., 10 gru 2019 o 17:55 Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> > > > > Neither of those options are available for the
> > > > > gpioevent_data, as that would break the ABI.
> > > >
> > > > ABI needs v2 actually.
> > > >
> > >
> > > I finally sat down to integrate this with my series and figured that
> > > this can't go on top of it. It's a bug-fix actually and maybe even
> > > stable material.
> > >
> > > On the other hand - if we have so few users of GPIO chardev with
> > > 32-bit user-space and 64-bit kernel - maybe we should just bite the
> > > bullet, not fix this one, deprecate it and introduce a proper v2 of
> > > the API?
> > >
> >
> > Fixing it in API v2 makes the most sense to me.
>
> I agree. Please, use only second patch in my series (if needed I can rese=
nd
> it separately) and drop this one.
>
> P.S. Actually it's not a bugfix since it's never worked from the day 1.
>

Yeah I guess so. Anyway, in this case, I won't be adding the event
watch feature to v1 - I'll go ahead and just add it to v2 then.

Bart
