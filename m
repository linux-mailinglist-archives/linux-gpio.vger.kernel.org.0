Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DED191161B5
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2019 14:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfLHNen (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Dec 2019 08:34:43 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:34892 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726378AbfLHNen (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Dec 2019 08:34:43 -0500
Received: by mail-pj1-f68.google.com with SMTP id w23so4694890pjd.2
        for <linux-gpio@vger.kernel.org>; Sun, 08 Dec 2019 05:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hSzMY2/yVnbqQH0Hh4V5dBmLYHxyZ5VDx6G5dpWa9Uk=;
        b=uzThoYq0bTVAZABh2RmOi7lYUjEKb934FcOwI7E45MLwqlY/bFrXTXHO0xXfinPNfI
         Blph9A9PxwGpjqcTjhxz8yKZ4a0zdz6l0/wZ9IS1cE12GTnIJvvbqbzwoqZW8r30WJyY
         mtSZ9XiBa+JlIkGVNpanEgffGuh6B7Rojc7EJDulgYj7qFaXWhQa0r++FfQkYaJmlR4s
         4Y2AVSt4atXu4YOj/1/qouLmF8ZFRBuzmtZDSL2j+Z+LMth142RmCWtoKX2kQkJGh7fB
         WfMLq8NeV/bnp3sIuCAbWJ/n9laSpn7ruYIsyF3EUqrINwACGB7MJ11zHQG++uk572d0
         PL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hSzMY2/yVnbqQH0Hh4V5dBmLYHxyZ5VDx6G5dpWa9Uk=;
        b=lf+mr3JnnkcskRIYJ9dHkyUrtBm6ZL17REu/BJNju0apOWg+8/WxrQ8+L3mjxEYttc
         0b2IpLWL3nXwpSonBQYMLioe9cvqT2Jn/UuPSbnquRa2DAVVqAjz6PCxFX7kyJ2GIQxM
         Dwo71QT18EJlMM9s6gH9jgDLd+xH6l2DmPu5WHM4v8pdreKitjw20uSFwh+DzszqvGxd
         XijoXhSroYcOCUjMl0JAFj6cv+VERS/8+wcKbKoVrB0aHKBMGNxgS9ocl6RS8a6onCxg
         9sJGMI11hIhctcV7OOlKsNGo58fjc+J9+IiLYODARg7g8D702wrDq1njTa7DfBu4jelC
         W7SQ==
X-Gm-Message-State: APjAAAW2Qq5km6hEyu8l0DSThdXPgqTQtjQ0TvYwwXEoraJ7Cq2W/q3D
        F42gqsO13lRDMmR7qPomRS12p1yz
X-Google-Smtp-Source: APXvYqwbABqCpmjbSUOX9Igy7FRzL+sRG9FQHnTFojvU/ZlrFoRTzYlyyxKHFqNBWZvpQeekriL0cw==
X-Received: by 2002:a17:90a:e2ce:: with SMTP id fr14mr26155885pjb.99.1575812082222;
        Sun, 08 Dec 2019 05:34:42 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id g191sm23380546pfb.19.2019.12.08.05.34.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Dec 2019 05:34:41 -0800 (PST)
Date:   Sun, 8 Dec 2019 21:34:36 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix up emulated open drain outputs
Message-ID: <20191208133436.GA20748@sol>
References: <E1idcoc-0004ni-4f@rmk-PC.armlinux.org.uk>
 <20191208034340.GA9333@sol>
 <20191208071823.GZ25745@shell.armlinux.org.uk>
 <20191208075143.GA13664@sol>
 <20191208130256.GA25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191208130256.GA25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 08, 2019 at 01:02:56PM +0000, Russell King - ARM Linux admin wrote:
> On Sun, Dec 08, 2019 at 03:51:43PM +0800, Kent Gibson wrote:
> > On Sun, Dec 08, 2019 at 07:18:23AM +0000, Russell King - ARM Linux admin wrote:
> > > On Sun, Dec 08, 2019 at 11:43:40AM +0800, Kent Gibson wrote:
> > > > On Sat, Dec 07, 2019 at 04:20:18PM +0000, Russell King wrote:
> > > > > gpiolib has a corner case with open drain outputs that are emulated.
> > > > > When such outputs are outputting a logic 1, emulation will set the
> > > > > hardware to input mode, which will cause gpiod_get_direction() to
> > > > > report that it is in input mode. This is different from the behaviour
> > > > > with a true open-drain output.
> > > > > 
> > > > > Unify the semantics here.
> > > > > 
> > > > > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > > > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > > > > ---
> > > > >  drivers/gpio/gpiolib.c | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > > index 32c2048deb8c..70c60aac41cc 100644
> > > > > --- a/drivers/gpio/gpiolib.c
> > > > > +++ b/drivers/gpio/gpiolib.c
> > > > > @@ -220,6 +220,14 @@ int gpiod_get_direction(struct gpio_desc *desc)
> > > > >  	chip = gpiod_to_chip(desc);
> > > > >  	offset = gpio_chip_hwgpio(desc);
> > > > >  
> > > > > +	/*
> > > > > +	 * Open drain emulation using input mode may incorrectly report
> > > > > +	 * input here, fix that up.
> > > > > +	 */
> > > > > +	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags) &&
> > > > > +	    test_bit(FLAG_IS_OUT, &desc->flags))
> > > > > +		return 0;
> > > > > +
> > > > 
> > > > What about the FLAG_OPEN_SOURCE case?
> > > 
> > > do you have a scenario you can test?
> > > 
> > 
> > No I don't - if I had a scenario that had tripped over this problem
> > then I would've submitted a patch already ;-).
> > 
> > I'm simply pointing out that the logic that applies to
> > emulating OPEN_DRAIN also applies to emulating OPEN_SOURCE.
> > IMHO if you are fixing this for one then it should be fixed for both.
> 
> That would be nice, but it would also be nice to be sure that the fix
> works there _and_ it doesn't break anything by fixing it.
> 
> I regard this as a risky change: with open drain/open source "outputs"
> it is quite obvious when the pin is being driven, it is in output mode.
> When the driver is off though, it is debatable whether it should be
> regarded as in input or output mode.
> 

Higher powers can make the call on that.

I just wanted to point out that the fix only deals with one of the two
cases that need to be fixed - in case that slipped by.

Cheers,
Kent.

