Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE23EE458
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbfKDP7f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:59:35 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35789 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbfKDP7f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:59:35 -0500
Received: by mail-pl1-f196.google.com with SMTP id x6so7737493pln.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=WsJg06RPzHjnH0r/Ra8/xyUR1sd0ZuW60KdZ5RgT15g=;
        b=f0rwsTvS4/cRPJdBiTRBzFlbcIB34+x+x3Yq9+GXooYv3v7YaWGmECYO6O87jlc5eA
         Quh7o4CFb46Y3txZFpXgO3JGANYg/pifh4EXj6UhCqWignIFO23snpWd+pY7hkObBbpt
         AAaKjFzZPpvrSwjC1kyEwXbbvU0pbTdvlBhkdLPhDYt/245wD64sEaxSx8rxWNwc3jq7
         JC7PAxkj9GESA27pIWxY3lc2GmeezT6xWjPeXbeCy7qiOqe7xLsp6W3mwbDuP6k2YVnH
         Fer8gma8oHz9wWQJ4pvypEh5HNpYYNOwZTlHz29taj/UHSVR4HY+ZoJ/HeRUmkEqJclJ
         YPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=WsJg06RPzHjnH0r/Ra8/xyUR1sd0ZuW60KdZ5RgT15g=;
        b=YtWjm3JlyF1L1XWnUa9pVpzvALCGgSSwzrqc1A/DK6fpneZDBixRz9+0fkm5tMj774
         f/1EGYoasQfHoryylEzA1KICBHtft3hHE2A27XThq9+8PMiPDMHLoC2ZfsErllCcDZlt
         AzXgbaTNoMSsGUubOUbmJTup68tafOAzoZJ2fyC/hr1M1yTdJyvCl7zjucgs4p6gMqJH
         Unqf9UHQRgnVocQsIyXB0jMCrWt5CJ7s09gBlE7tgE45OU3zJFoNbfc+3xUJFZE2WWpR
         zSgxULLgW1Lg59J8hZomq8uO5IzCq5lzyN+nlX9CeCAUsdfs2pfQoM4X7wYcALgHMr9c
         Y53Q==
X-Gm-Message-State: APjAAAUQkOfNMtV86fKQohxbTALygQ1Vj7mZI86OxIfahwEp6m3/lLp5
        R/zfJfSWdkez4bIRUlCCGQY=
X-Google-Smtp-Source: APXvYqyK1krrf+ARUXN8JpUFZx5nzjQjjcs2X0Ly5+8+QXgD6co1wca+9wOcV1mFG7a7gDsEBNP68Q==
X-Received: by 2002:a17:902:d88b:: with SMTP id b11mr11820237plz.17.1572883174076;
        Mon, 04 Nov 2019 07:59:34 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z25sm15745250pfa.88.2019.11.04.07.59.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 07:59:33 -0800 (PST)
Date:   Mon, 4 Nov 2019 23:59:27 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 4/7] gpiolib: add support for biasing output lines
Message-ID: <20191104155927.GA17106@sol>
References: <20191104153841.16911-1-warthog618@gmail.com>
 <20191104153841.16911-5-warthog618@gmail.com>
 <CAMpxmJUExXZ=ptMyRczvdujc7x9JP62Zy9m+WByYD4=w=1180w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJUExXZ=ptMyRczvdujc7x9JP62Zy9m+WByYD4=w=1180w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 04, 2019 at 04:50:30PM +0100, Bartosz Golaszewski wrote:
> pon., 4 lis 2019 o 16:39 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Allow pull up/down bias to be set on output lines.
> > Use case is for open source or open drain applications where
> > internal pull up/down may conflict with external biasing.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  drivers/gpio/gpiolib.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 7d8ff52ada42..de08d1a4a3fb 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -555,8 +555,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
> >              (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
> >                 return -EINVAL;
> >
> > -       /* Bias flags only allowed for input mode. */
> > -       if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
> > +       /* Bias flags only allowed for input or output mode. */
> > +       if (!((lflags & GPIOHANDLE_REQUEST_INPUT) ||
> > +             (lflags & GPIOHANDLE_REQUEST_OUTPUT)) &&
> >             ((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
> >              (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
> >              (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
> > @@ -3144,6 +3145,9 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
> >         }
> >
> >  set_output_value:
> > +       ret = gpio_set_bias(gc, desc);
> > +       if (ret)
> > +               return ret;
> >         return gpiod_direction_output_raw_commit(desc, value);
> 
> Ugh, I missed one thing here - my for-next branch doesn't contain the
> following commit e735244e2cf0 ("gpiolib: don't clear FLAG_IS_OUT when
> emulating open-drain/open-source") which happens to modify this
> function.
> 
> If I provided you with a branch containing it - would it be a lot of
> effort on your part to rebase it on top of it? If so - I can do it
> myself.
> 

I can do a rebase - though not until tomorrow (it is getting late here).
I would like that commit in as well - I suspect it being missing is
the reason a couple of the gpiod tests I was working on are failing.
I was in the process of tracking that down when I switched back to this.

Cheers,
Kent.


