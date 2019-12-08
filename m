Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E616116195
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2019 14:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfLHNDJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Dec 2019 08:03:09 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:45396 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfLHNDJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Dec 2019 08:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ocTmk1w9ViYDwmAOdTp/xKY+UGk+Yz1cN5h4SkoGPpE=; b=G90iVPxje+hg0a9HcojWUrCdL
        QhgTHEcQSBspCgvrJhhVtE9rSrAQfwhZ4t0AmnZ2EDbS+7XNWvKwcnWSz2nIUt5VRbn3Ph0P44PFo
        6Fevk0/GIcr9JoOpQP32BiZ8vswsmBNduAHiSpUwZaTlOVJnwOBVvSGsaU6HfH2adDURhbgSkQO7Z
        GnaMPzV/l1/lkJvrWWm0SvIGKyEeFMrMtwib/n1Fqu6d/GaB00I3HP+5shMgqcTAAFAg9BmkcHnJH
        sMvfOnoMBdAqgqlnOjLOFRwPnjhbU5O802GpwX2qRK+2oYTstwgTrb7LeYqeLbX9pj+WpbdlYAydY
        itrfkQHEw==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:38502)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1idwDD-0004cS-Sz; Sun, 08 Dec 2019 13:03:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1idwDA-0002ZA-Ky; Sun, 08 Dec 2019 13:02:56 +0000
Date:   Sun, 8 Dec 2019 13:02:56 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix up emulated open drain outputs
Message-ID: <20191208130256.GA25745@shell.armlinux.org.uk>
References: <E1idcoc-0004ni-4f@rmk-PC.armlinux.org.uk>
 <20191208034340.GA9333@sol>
 <20191208071823.GZ25745@shell.armlinux.org.uk>
 <20191208075143.GA13664@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191208075143.GA13664@sol>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 08, 2019 at 03:51:43PM +0800, Kent Gibson wrote:
> On Sun, Dec 08, 2019 at 07:18:23AM +0000, Russell King - ARM Linux admin wrote:
> > On Sun, Dec 08, 2019 at 11:43:40AM +0800, Kent Gibson wrote:
> > > On Sat, Dec 07, 2019 at 04:20:18PM +0000, Russell King wrote:
> > > > gpiolib has a corner case with open drain outputs that are emulated.
> > > > When such outputs are outputting a logic 1, emulation will set the
> > > > hardware to input mode, which will cause gpiod_get_direction() to
> > > > report that it is in input mode. This is different from the behaviour
> > > > with a true open-drain output.
> > > > 
> > > > Unify the semantics here.
> > > > 
> > > > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > > > ---
> > > >  drivers/gpio/gpiolib.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > index 32c2048deb8c..70c60aac41cc 100644
> > > > --- a/drivers/gpio/gpiolib.c
> > > > +++ b/drivers/gpio/gpiolib.c
> > > > @@ -220,6 +220,14 @@ int gpiod_get_direction(struct gpio_desc *desc)
> > > >  	chip = gpiod_to_chip(desc);
> > > >  	offset = gpio_chip_hwgpio(desc);
> > > >  
> > > > +	/*
> > > > +	 * Open drain emulation using input mode may incorrectly report
> > > > +	 * input here, fix that up.
> > > > +	 */
> > > > +	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags) &&
> > > > +	    test_bit(FLAG_IS_OUT, &desc->flags))
> > > > +		return 0;
> > > > +
> > > 
> > > What about the FLAG_OPEN_SOURCE case?
> > 
> > do you have a scenario you can test?
> > 
> 
> No I don't - if I had a scenario that had tripped over this problem
> then I would've submitted a patch already ;-).
> 
> I'm simply pointing out that the logic that applies to
> emulating OPEN_DRAIN also applies to emulating OPEN_SOURCE.
> IMHO if you are fixing this for one then it should be fixed for both.

That would be nice, but it would also be nice to be sure that the fix
works there _and_ it doesn't break anything by fixing it.

I regard this as a risky change: with open drain/open source "outputs"
it is quite obvious when the pin is being driven, it is in output mode.
When the driver is off though, it is debatable whether it should be
regarded as in input or output mode.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
