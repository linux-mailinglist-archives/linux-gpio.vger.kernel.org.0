Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCD5116119
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2019 08:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbfLHHSd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Dec 2019 02:18:33 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:41768 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbfLHHSd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Dec 2019 02:18:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=+NxRPKvdE9kmNBf83MHnO8vs+MRuLjDUqn9Qy9s9iyk=; b=ahLqpHwic1WonZHoknDjihWxY
        HdoHvgnY3fXcS3L4PUqcvsVQIUVKeaykIUi99KGjDEKou/z4RbjylHwzfERZBj7B7hO2JKB4DyoH5
        mA7aXBmnLn1s1KpaKzwt6RF19JqkIf8wTuYeEj0/VLDQnYaDcHzu5Oe2mLOSHbsLtOj3EjvazWc58
        Kye2oU5TBCEpVEtZNCU0TqFo2mFzE6E8t85n/Cptu1iOFRih+dwtDF3Ie+0HsqqmWEZCnZjzJVAMa
        NDC8wVuE3kyif7u7WaG2PTSmju0Y/ciJ/K/F/TGx40stq4/KbqW12qTcr6r1T/co98aEJi+daGM9U
        czgOjPjmQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50062)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1idqpm-0003C0-9f; Sun, 08 Dec 2019 07:18:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1idqpj-0002NT-IP; Sun, 08 Dec 2019 07:18:23 +0000
Date:   Sun, 8 Dec 2019 07:18:23 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix up emulated open drain outputs
Message-ID: <20191208071823.GZ25745@shell.armlinux.org.uk>
References: <E1idcoc-0004ni-4f@rmk-PC.armlinux.org.uk>
 <20191208034340.GA9333@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191208034340.GA9333@sol>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 08, 2019 at 11:43:40AM +0800, Kent Gibson wrote:
> On Sat, Dec 07, 2019 at 04:20:18PM +0000, Russell King wrote:
> > gpiolib has a corner case with open drain outputs that are emulated.
> > When such outputs are outputting a logic 1, emulation will set the
> > hardware to input mode, which will cause gpiod_get_direction() to
> > report that it is in input mode. This is different from the behaviour
> > with a true open-drain output.
> > 
> > Unify the semantics here.
> > 
> > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/gpio/gpiolib.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 32c2048deb8c..70c60aac41cc 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -220,6 +220,14 @@ int gpiod_get_direction(struct gpio_desc *desc)
> >  	chip = gpiod_to_chip(desc);
> >  	offset = gpio_chip_hwgpio(desc);
> >  
> > +	/*
> > +	 * Open drain emulation using input mode may incorrectly report
> > +	 * input here, fix that up.
> > +	 */
> > +	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags) &&
> > +	    test_bit(FLAG_IS_OUT, &desc->flags))
> > +		return 0;
> > +
> 
> What about the FLAG_OPEN_SOURCE case?

do you have a scenario you can test?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
