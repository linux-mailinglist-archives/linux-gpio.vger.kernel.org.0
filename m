Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A17C2116123
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2019 08:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbfLHHvu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Dec 2019 02:51:50 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41583 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbfLHHvu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Dec 2019 02:51:50 -0500
Received: by mail-pl1-f193.google.com with SMTP id bd4so4481690plb.8
        for <linux-gpio@vger.kernel.org>; Sat, 07 Dec 2019 23:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PD9Sm6cC5VzvabeQcY3aBHwfrL7SXq7oMtSbOLRxmcg=;
        b=tPwoNw+TjTrLkgr90KD8SYOgrlXj9cl/DOPAgsncqreCPmsJrjEA6RasG6SGZLVeGD
         53GlFDAxeX+jWgNcO4sVxJVk/jon8QX+mgpOJRD4s6M3rDVEu6N8c+zg6Vv01MX8XsF3
         Y2zKCrvf6gSsy/oLzGTAuIDQjF+LmTm4FyaSVLK24fe5Z7fP3O9aX/dND/LoWUFo9exl
         VN9u5gqPd3c16kv2LvgJeTZ9YU6fn/A+eIMjsSRBIp7XjlpmLhhLcwkA0MyC+NWz0jvn
         iij/qukBG8853R5agf/wehzgH4TqaR6/xJRYn/zsbhhFEgi+VjPjOIT5KGmk2YLMu6fp
         pYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PD9Sm6cC5VzvabeQcY3aBHwfrL7SXq7oMtSbOLRxmcg=;
        b=G9o+KP/yHiw0rL5JPAljOrcPAzSz1OcWduTRBG5kyiortCAjUrx/tlOfDTO1LBu7UI
         smgkbqUsBrTFFc4r3r4++DHDRDf0n+Lfrsw7kIYMZuIjGx55vAKr09Kjs2Z2r0RWE4IW
         xRfbolU5o6RzM5YdIhFyTzN9Ld+P2lrx9+2KnIzWYEWaPRkIL/mYoOBXSUgpHbzxdrD+
         xFmHHpT/h4kt/uMMf7ZMgq5n/U8R39NswkiYrltV+9xi1cEmdr3yZmzFCXmOzgxZT4IB
         j4LpLcE6xr/2SVblt2V90kYfXGt3Rxcs2FF54/4nPl/MpxOUf/3lT3CNrCYGJtCeWm5D
         AYfg==
X-Gm-Message-State: APjAAAU7kQt+yHTVBLTiSzzmuacYE+C/Lvl/PrrFR3YEx+NWZN/BeoMX
        PuGvwVlKPfAwup/mxIAoUYE=
X-Google-Smtp-Source: APXvYqyH9cyA4eSH7dMyc0xc7400WAcc5oPspekfal2/H0M6w8efwiSLWTsYRhjyoh6RoBH55QqAqg==
X-Received: by 2002:a17:902:ac90:: with SMTP id h16mr18161777plr.164.1575791509686;
        Sat, 07 Dec 2019 23:51:49 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id x11sm22036077pfn.53.2019.12.07.23.51.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Dec 2019 23:51:49 -0800 (PST)
Date:   Sun, 8 Dec 2019 15:51:43 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix up emulated open drain outputs
Message-ID: <20191208075143.GA13664@sol>
References: <E1idcoc-0004ni-4f@rmk-PC.armlinux.org.uk>
 <20191208034340.GA9333@sol>
 <20191208071823.GZ25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191208071823.GZ25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 08, 2019 at 07:18:23AM +0000, Russell King - ARM Linux admin wrote:
> On Sun, Dec 08, 2019 at 11:43:40AM +0800, Kent Gibson wrote:
> > On Sat, Dec 07, 2019 at 04:20:18PM +0000, Russell King wrote:
> > > gpiolib has a corner case with open drain outputs that are emulated.
> > > When such outputs are outputting a logic 1, emulation will set the
> > > hardware to input mode, which will cause gpiod_get_direction() to
> > > report that it is in input mode. This is different from the behaviour
> > > with a true open-drain output.
> > > 
> > > Unify the semantics here.
> > > 
> > > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  drivers/gpio/gpiolib.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index 32c2048deb8c..70c60aac41cc 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -220,6 +220,14 @@ int gpiod_get_direction(struct gpio_desc *desc)
> > >  	chip = gpiod_to_chip(desc);
> > >  	offset = gpio_chip_hwgpio(desc);
> > >  
> > > +	/*
> > > +	 * Open drain emulation using input mode may incorrectly report
> > > +	 * input here, fix that up.
> > > +	 */
> > > +	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags) &&
> > > +	    test_bit(FLAG_IS_OUT, &desc->flags))
> > > +		return 0;
> > > +
> > 
> > What about the FLAG_OPEN_SOURCE case?
> 
> do you have a scenario you can test?
> 

No I don't - if I had a scenario that had tripped over this problem
then I would've submitted a patch already ;-).

I'm simply pointing out that the logic that applies to
emulating OPEN_DRAIN also applies to emulating OPEN_SOURCE.
IMHO if you are fixing this for one then it should be fixed for both.

I'd love to see some test cases for the gpiolib driver-api, including
this function.
But I'm relatively new here, and am generally coming from the userspace
side, so will have to admit ignorance to anything related to testing
APIs within the kernel.

Kent.

> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> According to speedtest.net: 11.9Mbps down 500kbps up
