Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439D62ED139
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 14:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728473AbhAGN4o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 08:56:44 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:36973 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbhAGN4o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 08:56:44 -0500
Received: by mail-oi1-f171.google.com with SMTP id l207so7441421oib.4
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 05:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x1e0WNL2sMMQ2ZL+0N5MeOWKVquIYgOlSUwbGEFP2y4=;
        b=MuURypB5F13IoiGcvLnST+yQHAZdqrQzb7CP0xeobgGb6hoXKKxBE3Q1L3CVAIuRi3
         rnJTrgv7D/OQMlPiHJh1B3DOd6EM42tegmSKs9SIXtUWHKVVsmaqdOEVpUqmEw2eAsgv
         VHLjZ/UiLzmYjfeh/YelPt5DYj5NIxAZwu0mQ786L835QI2Yb1Gf4JmZhQSVQD8zOVEC
         2UNOV5vWOK0fzyIunn+tA4y8q/2LEV5NnXJtaIolF/9n2NIiuJuzkVIqBUVE3ywublCj
         q7PY4bQCh7Q8I6mBKM8yB3hkoFUjtMAEKqivqvA1yDMkKTmQnkPu9vk7ppGIkG0XSVKF
         DjRQ==
X-Gm-Message-State: AOAM533VprTNsmHEt5UmrInCLmSouLTr3ivTs4+SOxqQEbZtOoSTMMq3
        zUBRtqUyTA/7rM2tSsAY8QRQPBok0rwpHjx2008=
X-Google-Smtp-Source: ABdhPJzhHT90woLzalGYLXytIeOG7bYU3YN6Qil916gRjj/ERGJMrUcbb/2hiowBSG/HtuFVi3h5CRMHd+vD+k1yEdo=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr1425058oia.54.1610027763424;
 Thu, 07 Jan 2021 05:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CACRpkdZVw53K26hOQMfqfC+3=wdqm8kUDPdWrz-KRj1rh9ijYQ@mail.gmail.com> <63d69976687846c6a50e904b913bd235@asem.it>
In-Reply-To: <63d69976687846c6a50e904b913bd235@asem.it>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Jan 2021 14:55:52 +0100
Message-ID: <CAMuHMdW=TMbBUYVd0XVT88F+wDZ09F_WTB=f50eyRSire7TWSg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Flavio,

On Thu, Jan 7, 2021 at 2:49 PM Flavio Suligoi <f.suligoi@asem.it> wrote:
> > On Wed, Jan 6, 2021 at 11:09 AM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > I can do it alright. But in the context of user-space I think this
> > > doesn't really change anything. DT users still can use non-unique
> > > names and libgpiod still has to account for that if the API is to be
> > > considered correct. Is this change really useful? How does it affect
> > > ACPI users that already define non-unique names?
> >
> > For hardware description instances the problem remains: device tree
> > line-names and device properties can be non-unique.
> >
> > What it solves is to enforce unique line names for gpio chips with
> > the struct gpio_chip .names array set to some names, that each
> > name in this array must be unique.
> >
> > This happens for example when two USB FTDI converters
> > with the same GPIO lines are plugged in. Each chip can have a
> > "TX" line but it can no longer have two "TX" lines.
> >
> > Yours,
> > Linus Walleij
>
> about the duplicate line names, what do you think
> about adding to the command "gpiofind" of libgpiod tools,
> the possibility to discover all the duplicate gpio lines?
>
> For example, something like the following:
>
> # gpiofind button_1
> gpiochip0 20
> gpiochip0 22 (duplicate)

This cannot happen, as the duplicate is on the same gpiochip.

> gpiochip2 12 (duplicate)
> #

I don't like the "(duplicate)" suffix.  It makes scripting harder (and
more unsafe).
What about outputting only the first one, unless "-a" is specified?

# gpiofind -a button_1
gpiochip0 20
gpiochip1 22
gpiochip2 12
#

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
