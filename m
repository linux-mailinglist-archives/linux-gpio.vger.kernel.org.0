Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB581118BB6
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 15:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbfLJOzX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 09:55:23 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:34566 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbfLJOzW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 09:55:22 -0500
Received: by mail-pj1-f65.google.com with SMTP id j11so6389638pjs.1;
        Tue, 10 Dec 2019 06:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=O0mxM2akhs1azWPtzdXiIb6fHUMPLCLScLzWjLvsN/k=;
        b=f5gdEnXu/jpogrrmQnS3TU7rCbVYwV4sl7HWZYj8XCwQDRsudZh0YdckkFN3kLU3Tx
         S62mgMTtsKuyYT5NGuWuHNR922jc13dCiCJdUXqGXsmES2w8L8cWvQSqREg0xroCcWzL
         Sk5wyFl6i0rWt0jOCaSCRUzBV3sSdhSgAy0HgBtZpHYjFSjJl3UFWW7TXgWoGaa8VR1Z
         wRtGef/BkhlmHX7oMKTe4p+ydhN/hHqktqKE71S4QoNKdkwsVZWOoTnHQhwr6qYf8fK9
         EsfeMbCCuL6nGygWwB87o8pDHeP1XE+JlOOzD55FKV0uGG0WJ6Bao9qSklsxXEYJNG1B
         zHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=O0mxM2akhs1azWPtzdXiIb6fHUMPLCLScLzWjLvsN/k=;
        b=LUL8AJC9VrVN/woCKlmCCQFm2hVqF8ebJSqkQG8yH7vi/fOM5cCxatuuar0+rGiPLn
         rbiQ2DnivH81NiNfolLguksSFUX5ue9Nh9GL8+lj/qutB7pxV2U440w8F/qNDnAH7IwT
         IWd1OEKeq+EjcLFv2Ufc7ROqN0OeI/wSDWcrADTRJ+YmlLrA+QT9/rHjqw55+q3BS3o+
         LEjtolVIZlfiDrc3UypcSWoQgJ6aP63XYwQKewsZ2XwzS9p1rlJj12I7jEKsR1Zhyl0f
         t9O5VLFMiL7/lTBK2nN0N7JWVKzUKI+qXBIWBJq9ocWHFAjv4huB8xm7pbomHNPBsmZv
         sZhg==
X-Gm-Message-State: APjAAAW/Aswp81I6aHpmZzLvEzFmqT3u5cEvFIvgd4nE6wqxORzkGhzB
        5XKlo2sMXrXnfjTcwUOyEHg=
X-Google-Smtp-Source: APXvYqxZhrwjqd8WvaspMBoCdMauMryqbbfQfMaCo9PcP1VwqPlCTsMO1HUsCqw6oIl1IMzv7OexvA==
X-Received: by 2002:a17:902:409:: with SMTP id 9mr35448362ple.306.1575989721931;
        Tue, 10 Dec 2019 06:55:21 -0800 (PST)
Received: from sol (220-235-124-2.dyn.iinet.net.au. [220.235.124.2])
        by smtp.gmail.com with ESMTPSA id e16sm3731207pff.181.2019.12.10.06.55.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 06:55:21 -0800 (PST)
Date:   Tue, 10 Dec 2019 22:55:15 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>
Subject: Re: [PATCH] gpio: gpio-mockup: Fix usage of new GPIO_LINE_DIRECTION
Message-ID: <20191210145515.GB3509@sol>
References: <20191210021525.13455-1-warthog618@gmail.com>
 <CAMRc=Md4PmbcGAKxP1LG08bREtWCtsXbt=ZgL50PrizF4F4pxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md4PmbcGAKxP1LG08bREtWCtsXbt=ZgL50PrizF4F4pxg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 10, 2019 at 03:11:12PM +0100, Bartosz Golaszewski wrote:
> wt., 10 gru 2019 o 03:15 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Restore the external behavior of gpio-mockup to what it was prior to the
> > change to using GPIO_LINE_DIRECTION.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >
> > Fix a regression introduced in v5.5-rc1.
> >
> > The change to GPIO_LINE_DIRECTION reversed the polarity of the
> > dir field within gpio-mockup.c, but overlooked inverting the value on
> > initialization and when returned by gpio_mockup_get_direction.
> > The latter is a bug.
> > The former is a problem for tests which assume initial conditions,
> > specifically the mockup used to initialize chips with all lines as inputs.
> > That superficially appeared to be the case after the previous patch due
> > to the bug in gpio_mockup_get_direction.
> >
> >  drivers/gpio/gpio-mockup.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> > index 56d647a30e3e..c4fdc192ea4e 100644
> > --- a/drivers/gpio/gpio-mockup.c
> > +++ b/drivers/gpio/gpio-mockup.c
> > @@ -226,7 +226,7 @@ static int gpio_mockup_get_direction(struct gpio_chip *gc, unsigned int offset)
> >         int direction;
> >
> >         mutex_lock(&chip->lock);
> > -       direction = !chip->lines[offset].dir;
> > +       direction = chip->lines[offset].dir;
> >         mutex_unlock(&chip->lock);
> >
> >         return direction;
> > @@ -395,7 +395,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
> >         struct gpio_chip *gc;
> >         struct device *dev;
> >         const char *name;
> > -       int rv, base;
> > +       int rv, base, i;
> >         u16 ngpio;
> >
> >         dev = &pdev->dev;
> > @@ -447,6 +447,9 @@ static int gpio_mockup_probe(struct platform_device *pdev)
> >         if (!chip->lines)
> >                 return -ENOMEM;
> >
> > +       for (i = 0; i < gc->ngpio; i++)
> > +               chip->lines[i].dir = GPIO_LINE_DIRECTION_IN;
> > +
> >         if (device_property_read_bool(dev, "named-gpio-lines")) {
> >                 rv = gpio_mockup_name_lines(dev, chip);
> >                 if (rv)
> > --
> > 2.24.0
> >
> 
> Hi Kent,
> 
> I was applying and testing your libgpiod series and noticed that the
> gpio-tools tests fail after applying patches 16 & 17 (with linux
> v5.5-rc1). Is this fix related to this?
> 

I don't think so.  I've only been able to trip this problem with a
couple of corner cases in my Go uapi test suite.
I have been unable to reproduce it with the tools as it requires
multiple requests with the same chip fd, including an as-is, to trip.

And running the libgpiod tests against v5.5-rc1 works for me.
Can you provide more details as to the errors you are seeing?

Btw, I was writing tests for your LINEINFO_WATCH patch v2, which I was
applying to v5.5-rc1, when I ran across this.  That works ok if I
__packed the changed struct.
And I can confirm that patch v2 doesn't isolate watches on different
chip fds.

Kent.
