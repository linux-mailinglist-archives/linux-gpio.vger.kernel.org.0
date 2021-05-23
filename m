Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F040038DD6A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 00:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbhEWWXC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 May 2021 18:23:02 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:44404 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbhEWWXB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 May 2021 18:23:01 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:bd37:7535:eb00:6fa] (unknown [IPv6:2a02:a03f:eafb:ee01:bd37:7535:eb00:6fa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 08A33202A44;
        Mon, 24 May 2021 00:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621808493;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jBeGHDP0Tz5eoqu47A7M4vJJjH5RoK+PyK940cMviYU=;
        b=IUDJSVE1BeBfPkWGNB/a/KeGc0ZKZoSeTrKZ782c9nTSun9G+D/R/rqpTQqcZ25m2+qbCF
        GBW4ptVnHawMdA80G6vXGXiCL6tk4CfTKE/p2rYA5wHke+2UCUiiQbS3NinC6ZnO29lWUU
        k/srPeIaRJQn04OwlA5FfcptgMgwLdp2ZJOZPZBMHaq8SwRVFnhuV9pJWab2jUIArYN6uu
        EhDByWCunGJ0wI9jbAQcjm6UcsMGdM2qfgfTsfV6MzJRE8af/wcmWH3BkktZV7rpqH7FED
        S/UxVKqVVTVMWHIZj6HaWEm3CK0nWuXg43ECZNj++1m/DBb5tjb1NzVcOfabog==
Message-ID: <7536875f01b0420acb88de1ea3a48c31fdb26962.camel@svanheule.net>
Subject: Re: [PATCH v2 2/7] gpio: regmap: Add configurable dir/value order
From:   Sander Vanheule <sander@svanheule.net>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org
Date:   Mon, 24 May 2021 00:21:29 +0200
In-Reply-To: <YKMbF3Ow8IrBBlXW@lunn.ch>
References: <cover.1621279162.git.sander@svanheule.net>
         <d5f294489d31a80b69169f358da89bb7f70d1328.1621279162.git.sander@svanheule.net>
         <YKMbF3Ow8IrBBlXW@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Adrew,

On Tue, 2021-05-18 at 03:40 +0200, Andrew Lunn wrote:
> On Mon, May 17, 2021 at 09:28:04PM +0200, Sander Vanheule wrote:
> > GPIO chips may not support setting the output value when a pin is
> > configured as an input
> 
> Could you describe what happens with the hardware you are playing
> with. Not being able to do this means you will get glitches when
> enabling the output so you should not use these GPIOs with bit banging
> busses like i2c.

As I reported earlier, using value-before-direction breaks the GPIO driven LEDs
on one of my devices.

I've tried to use another device to test if I could reproduce this. Using the
gpioset and gpioget utilities, I can't seem to reproduce this however. Whether I
enable the (new) quirk or not, doesn't seem to make any difference.

The documentation we have on this chip is quite scarce, so I'm unaware of
different chip revisions, or how I would distinguish between revisions. As far
as I can see, Realtek's code (present in the GPL archives we got from some
vendors) set the pin direction before setting the value.

For now, I've made the implementation so that the quirk is always applied. Like
the behaviour that is implicit in the origal code. If prefered, I could also
supply a separate devicetree compatible or extra devictree flag.

Regarding bit banged I2C, glitches may not actually be an issue. If a pull-up
resistor is used for HIGH values, and an open drain for LOW values, the GPIO pin
doesn't actually have to change value, only direction (IN for HIGH, OUT for
LOW). A configuration like this would perhaps glitch once on the initial OUT-LOW
configuration. Like I mentioned, bit banged I2C is frequently used in ethernet
switches with these chips to talk to SFP modules.


Best,
Sander

