Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59A3B11A060
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 02:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfLKBQW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 20:16:22 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:38067 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbfLKBQW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 20:16:22 -0500
Received: by mail-pj1-f68.google.com with SMTP id l4so8218257pjt.5;
        Tue, 10 Dec 2019 17:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rCjmuwdX9VxfrJW96q0Pn6Kl1LaCaUN5yA+3sx0sci8=;
        b=Q7KS2OyjSso0tnnM+Jg97xqNHVBE/99Bs8Z5BKAHSMdmJHa3MvRRoQ16QGfSU1k3SX
         BPtUdztm2lPhGwHZaBvOfQyOk58AN4b4T0u8sMjapWdsWnK67belDEW37UaEZaoHg5jY
         A80/WkRFlESBtM4uB7Z0AubHXydxAVSz07klbYoWkfn6Z680Q5CuhQCGLeSAHfETo9CW
         uT3gYX3B5pOUhM/wqqrcKOJkZCJfPXMQACHws5ZMHK81ELS3dcrKzYXf66vN5K8fkhXy
         mxhcpD4iKteTmjNpP7apwqf30KPslU0iTdcXSRHnsc2gKTmfxqlNEmodoXdwAx/czxHn
         fptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=rCjmuwdX9VxfrJW96q0Pn6Kl1LaCaUN5yA+3sx0sci8=;
        b=sTaUUSgcCquaGccqIE1uo04+ghIhc6x7HAoMYxxC5anITVcB7NPCB+kjgVw5VgpdM5
         vsXGRFt9tktWH13+6aHVIHAf6us7np3V2QtXPHXjGeWj18PSIQL6jKHztwnCPcW/2JFG
         3Xf2tcVZrPj9+D+5KA+EKqc6bqdqjFbgl7Ki8F2I7ADN2YZO4LLehxSkDpFPZP4SLKio
         CuMPAhKwJJuTWYFFQN0c5asjvW1/5CQjYyRlRUTjCb/niBS6Ac8YU7YOKY4zrDoAnv33
         Bsy2cs3n+ulRzYb8alvlHv5Gh6KhfT6dPgXax1U1zhRzs7BHapS/c2OtrcrRLwWgbAuo
         JWaA==
X-Gm-Message-State: APjAAAV+WcCva+Xp4un+fFB7kb1/djBQ00IWPTwxjTGnzXAghW83aiOZ
        /pItP2uiyQEekR4jc5PhPWQ=
X-Google-Smtp-Source: APXvYqx7za/8a59lShrbf7a2PwFUPMXtSFvPyw+oBcUvd+rJ1W2+osFsfVw/fxoruwNDVMSchYzM8g==
X-Received: by 2002:a17:90a:a4cb:: with SMTP id l11mr478116pjw.47.1576026981243;
        Tue, 10 Dec 2019 17:16:21 -0800 (PST)
Received: from sol (220-235-124-2.dyn.iinet.net.au. [220.235.124.2])
        by smtp.gmail.com with ESMTPSA id o12sm265495pfg.152.2019.12.10.17.16.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 17:16:20 -0800 (PST)
Date:   Wed, 11 Dec 2019 09:16:15 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>
Subject: Re: [PATCH] gpio: gpio-mockup: Fix usage of new GPIO_LINE_DIRECTION
Message-ID: <20191211011615.GA9373@sol>
References: <20191210021525.13455-1-warthog618@gmail.com>
 <CAMRc=Md4PmbcGAKxP1LG08bREtWCtsXbt=ZgL50PrizF4F4pxg@mail.gmail.com>
 <20191210145515.GB3509@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191210145515.GB3509@sol>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 10, 2019 at 10:55:15PM +0800, Kent Gibson wrote:
> On Tue, Dec 10, 2019 at 03:11:12PM +0100, Bartosz Golaszewski wrote:
> > wt., 10 gru 2019 o 03:15 Kent Gibson <warthog618@gmail.com> napisał(a):
> > >
> > > Restore the external behavior of gpio-mockup to what it was prior to the
> > > change to using GPIO_LINE_DIRECTION.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> > >
> > > Fix a regression introduced in v5.5-rc1.
> > >
> > > The change to GPIO_LINE_DIRECTION reversed the polarity of the
> > > dir field within gpio-mockup.c, but overlooked inverting the value on
> > > initialization and when returned by gpio_mockup_get_direction.
> > > The latter is a bug.
> > > The former is a problem for tests which assume initial conditions,
> > > specifically the mockup used to initialize chips with all lines as inputs.
> > > That superficially appeared to be the case after the previous patch due
> > > to the bug in gpio_mockup_get_direction.
> > >
> > >  drivers/gpio/gpio-mockup.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> > > index 56d647a30e3e..c4fdc192ea4e 100644
> > > --- a/drivers/gpio/gpio-mockup.c
> > > +++ b/drivers/gpio/gpio-mockup.c
> > > @@ -226,7 +226,7 @@ static int gpio_mockup_get_direction(struct gpio_chip *gc, unsigned int offset)
> > >         int direction;
> > >
> > >         mutex_lock(&chip->lock);
> > > -       direction = !chip->lines[offset].dir;
> > > +       direction = chip->lines[offset].dir;
> > >         mutex_unlock(&chip->lock);
> > >
> > >         return direction;
> > > @@ -395,7 +395,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
> > >         struct gpio_chip *gc;
> > >         struct device *dev;
> > >         const char *name;
> > > -       int rv, base;
> > > +       int rv, base, i;
> > >         u16 ngpio;
> > >
> > >         dev = &pdev->dev;
> > > @@ -447,6 +447,9 @@ static int gpio_mockup_probe(struct platform_device *pdev)
> > >         if (!chip->lines)
> > >                 return -ENOMEM;
> > >
> > > +       for (i = 0; i < gc->ngpio; i++)
> > > +               chip->lines[i].dir = GPIO_LINE_DIRECTION_IN;
> > > +
> > >         if (device_property_read_bool(dev, "named-gpio-lines")) {
> > >                 rv = gpio_mockup_name_lines(dev, chip);
> > >                 if (rv)
> > > --
> > > 2.24.0
> > >
> > 
> > Hi Kent,
> > 
> > I was applying and testing your libgpiod series and noticed that the
> > gpio-tools tests fail after applying patches 16 & 17 (with linux
> > v5.5-rc1). Is this fix related to this?
> > 
> 
> I don't think so.  I've only been able to trip this problem with a
> couple of corner cases in my Go uapi test suite.
> I have been unable to reproduce it with the tools as it requires
> multiple requests with the same chip fd, including an as-is, to trip.
> 

It turns out that I can reproduce the bug with my gpiod tools:

root@firefly:/home/kent/gpiod/cmd/gpiodctl# uname -a
Linux firefly 5.5.0-rc1 #23 SMP Mon Dec 9 16:26:33 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
root@firefly:/home/kent/gpiod/cmd/gpiodctl# modprobe gpio-mockup gpio_mockup_ranges=-1,4
root@firefly:/home/kent/gpiod/cmd/gpiodctl# ./gpiodctl get gpiochip0 1
0
root@firefly:/home/kent/gpiod/cmd/gpiodctl# ./gpiodctl info
gpiochip0 - 4 lines:
	line   0:     unnamed      unused   input  active-high
	line   1:     unnamed      unused   input  active-high
	line   2:     unnamed      unused   input  active-high
	line   3:     unnamed      unused   input  active-high
root@firefly:/home/kent/gpiod/cmd/gpiodctl# ./gpiodctl get --as-is gpiochip0 1
0
root@firefly:/home/kent/gpiod/cmd/gpiodctl# ./gpiodctl info
gpiochip0 - 4 lines:
	line   0:     unnamed      unused   input  active-high
	line   1:     unnamed      unused  output  active-high
	line   2:     unnamed      unused   input  active-high
	line   3:     unnamed      unused   input  active-high

Note that the line 1 direction has flipped for no reason.

With the patched kernel that doesn't happen:

root@firefly:/home/kent/gpiod/cmd/gpiodctl# uname -a
Linux firefly 5.5.0-rc1+ #27 SMP Tue Dec 10 01:07:59 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
root@firefly:/home/kent/gpiod/cmd/gpiodctl# modprobe gpio-mockup gpio_mockup_ranges=-1,4
root@firefly:/home/kent/gpiod/cmd/gpiodctl# ./gpiodctl get gpiochip0 1
0
root@firefly:/home/kent/gpiod/cmd/gpiodctl# ./gpiodctl info
gpiochip0 - 4 lines:
	line   0:     unnamed      unused   input  active-high
	line   1:     unnamed      unused   input  active-high
	line   2:     unnamed      unused   input  active-high
	line   3:     unnamed      unused   input  active-high
root@firefly:/home/kent/gpiod/cmd/gpiodctl# ./gpiodctl get --as-is gpiochip0 1
0
root@firefly:/home/kent/gpiod/cmd/gpiodctl# ./gpiodctl info
gpiochip0 - 4 lines:
	line   0:     unnamed      unused   input  active-high
	line   1:     unnamed      unused   input  active-high
	line   2:     unnamed      unused   input  active-high
	line   3:     unnamed      unused   input  active-high


I would prefer to demonstrate this with the libgpiod tools, but they
don't support as-is on gets.  I recall suggesting adding it and you
asking why - who would need it.  This is a concrete example of my
response at the time - so you can exercise the full API for testing.

Cheers,
Kent.

