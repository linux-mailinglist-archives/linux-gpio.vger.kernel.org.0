Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728E51E54E1
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 06:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbgE1EHE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 00:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgE1EHE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 00:07:04 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30459C05BD1E;
        Wed, 27 May 2020 21:07:04 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 8BCEB22FB3;
        Thu, 28 May 2020 06:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1590638822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rP/kD6XYOuzcQV7m9i+yyBmNxwXR7ezLBzXdA5CrG0A=;
        b=Uxp1IEw9dzZEY2Cpv1whwF4Rc6RpbWmkhCpJsdiqMoNX8zl9m+vQzeKzuoiCJNWjxumixK
        vew4n+U9W1nhXW7b3u7Ra4vyuP4FoMd4aTjkSy24OIQsyfjTTJRrZvpt/rn/Qnnikmt95v
        4JN36LCZ7eeKCYzlyI3tRKQ2pdDliC0=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 28 May 2020 06:07:02 +0200
From:   Michael Walle <michael@walle.cc>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 2/2] gpio: add a reusable generic gpio_chip using
 regmap
In-Reply-To: <fe44039a-4fa9-dab3-cd14-04967b729158@linux.intel.com>
References: <20200525160741.21729-1-michael@walle.cc>
 <20200525160741.21729-3-michael@walle.cc>
 <d245b4f5-065f-4c82-ef8e-d906b363fdcf@linux.intel.com>
 <6d08ebbfbc9f656cb5650ede988cf36d@walle.cc>
 <fe44039a-4fa9-dab3-cd14-04967b729158@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <143ec2f44c881706db9744465328329f@walle.cc>
X-Sender: michael@walle.cc
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am 2020-05-28 02:31, schrieb Pierre-Louis Bossart:
> Hi Michael,
> 
>>>> +struct gpio_regmap_config {
>>>> +    struct device *parent;
>>>> +    struct regmap *regmap;
>>>> +
>>>> +    const char *label;
>>>> +    int ngpio;
>>> 
>>> could we add a .names field for the gpio_chip, I found this useful 
>>> for
>>> PCM512x GPIO support, e.g.
>> 
>> Sure, I have the names in the device tree.
>> 
>> But I'd prefer that you'd do a patch on top of this (assuming it is
>> applied soon), because you can actually test it and there might be
>> missing more.
> 
> I am happy to report that this gpio-regmap worked like a charm for me,
> after I applied the minor diff below (complete code at
> https://github.com/plbossart/sound/tree/fix/regmap-gpios).
> 
> I worked around my previous comments by forcing the GPIO internal
> routing directly in regmap, and that allowed me to only play with the
> _set and _dir bases. I see the LEDs and clock selected as before,
> quite nice indeed.
> 
> The chip->label test is probably wrong, since the gpio_chip structure
> is zeroed out if(!chip->label) is always true so the label is always
> set to the device name. I don't know what the intent was so just
> removed that test - maybe the correct test should be if
> (!config->label) ?

yes, that was a typo. should have been if (!config->label).

I've send a v5 with that fix and your names property.

> I added the names support as well, and btw I don't understand how one
> would get them through device tree?

gpio-line-names property, see
Documentation/devicetree/bindings/gpio/gpio.txt.

> I still have a series of odd warnings I didn't have before:
> 
> [  101.400263] WARNING: CPU: 3 PID: 1129 at
> drivers/gpio/gpiolib.c:4084 gpiod_set_value+0x3f/0x50
> 
> This seems to come from
> 	/* Should be using gpiod_set_value_cansleep() */
> 	WARN_ON(desc->gdev->chip->can_sleep);

Right now, gpio-regmap hardcodes can_sleep to true. But the only regmap
which don't sleep is regmap-mmio. The PCM512x seems to be either I2C or
SPI, which can both sleep. So this warning is actually correct and
wherever this gpio is set should do it by calling the _cansleep()
version.

> so maybe we need an option here as well? Or use a different function?
> 
> Anyways, that gpio-regmap does simplify my code a great deal so thanks
> for this work, much appreciated.

Glad to see that there are more users for it ;)

-michael
