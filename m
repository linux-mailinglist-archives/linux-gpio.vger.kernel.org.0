Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C963877D4
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 13:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243261AbhERLkf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 07:40:35 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:46662 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241908AbhERLke (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 07:40:34 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:6102:7bbd:c7da:85a4] (unknown [IPv6:2a02:a03f:eafb:ee01:6102:7bbd:c7da:85a4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 075CB200155;
        Tue, 18 May 2021 13:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621337955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uwmdW801vRB3PpGUwtnmy412PKt6fejTaQGhH97dxaI=;
        b=imcG4dei6UyHr6SFf4F0c1hXxbKSIYueqDyCAEL6DmGi6QLXqliwyNb1JJNNfBl6mJSlfS
        qVltN5tq7OFNwOi9jF4V1GE2FyHOldZzf+OzNxW8BWL1yOy2Hq4BOZjIVQ5j8k2BzFseRH
        5aMb1AYhrH9qSJo2HGU+l/Pk3H4D7BMx23a2RnlfoOUGsiKEqahAQmLL7vGHZHPep59Ljs
        43xZLHZwCK33fKKvAhVx5zRruPkqsGtbTMCtBKns6tk4Caahdb+z2OpElDa2b6V+qxp6Lk
        Z7AWze8mtSLPjIyTCxnDiD7jvoTKovM20Dpz6RtFx8+/JISHB80d0LQBa6NBrg==
Message-ID: <1fcbaf8029f3b9f79a138d423413f625886c8415.camel@svanheule.net>
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
        linux-kernel@vger.kernel.org,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Date:   Tue, 18 May 2021 13:39:12 +0200
In-Reply-To: <YKMbF3Ow8IrBBlXW@lunn.ch>
References: <cover.1621279162.git.sander@svanheule.net>
         <d5f294489d31a80b69169f358da89bb7f70d1328.1621279162.git.sander@svanheule.net>
         <YKMbF3Ow8IrBBlXW@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andrew,

On Tue, 2021-05-18 at 03:40 +0200, Andrew Lunn wrote:
> On Mon, May 17, 2021 at 09:28:04PM +0200, Sander Vanheule wrote:
> > GPIO chips may not support setting the output value when a pin is
> > configured as an input
> 
> Could you describe what happens with the hardware you are playing
> with. Not being able to do this means you will get glitches when
> enabling the output so you should not use these GPIOs with bit banging
> busses like i2c.

As I was testing this driver, I noticed that output settings for GPIO LEDs,
connected to the RTL8231, weren't being properly set. The actual LED brightness
didn't correspond to the one reported by sysfs. Changing the operation order
fixed this.

However, the vendor code uses I2C bitbanging quite extensively on these chips,
so I decided to have another look.

From u-boot on my device, I can manipulate the RTL8231 registeres relatively
easily. I performed the following short tests:
 * Set pin to input, pull pin high, write output low, change direction: pin
   output changes to low value
 * Set pin to input pull pin low, write output high, change direction: pin
   output changes to high value

Which seems to indicate that I _can_ set output values on input pins... I'll
need to look into this in more detail when I have a bit more time, later this
week.


Best,
Sander

