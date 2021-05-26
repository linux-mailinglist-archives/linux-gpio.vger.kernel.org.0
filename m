Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB4739135D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 11:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233121AbhEZJJ0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 05:09:26 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:50537 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbhEZJJZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 05:09:25 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 2A4E5221E6;
        Wed, 26 May 2021 11:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622020071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kuVX0EwFHRdzvCBkWg0tk/7hpgmavGGOvX+eVtdhON8=;
        b=pkJNP85yCQI5tC6fyhHAjzAcvcryRDIJqKelW3XVGwRXLvTDoBbqFB2NYZd2n18RiGjaoR
        TAcANc4s4f1Hib1slhyHeMxUG7qxr4+P9XsQT+a3T/Qm7K2igcb1nfDV+OsThCLVqjaBLY
        XV6vp2sA6/+geCgypOd8U2bKxMzI4X8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 26 May 2021 11:07:51 +0200
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
In-Reply-To: <CAHp75VeHZg1DC76sg1F-=49SfVLNhf4pG7ArcXHxjU0nXZOpWw@mail.gmail.com>
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VeHZg1DC76sg1F-=49SfVLNhf4pG7ArcXHxjU0nXZOpWw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <2e201aabd9b42da9a2bdcb2f7504ec12@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-26 10:42, schrieb Andy Shevchenko:
> On Wed, May 26, 2021 at 9:02 AM Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
>> 
>> Support providing some IC specific operations at gpio_regmap 
>> registration.
>> 
>> Implementation of few GPIO related functionalities are likely to be
>> very IC specific. For example the pin-configuration registers and the
>> pin validity checks. Allow IC driver to provide IC specific functions
>> which gpio-regmap can utilize for these IC specific configurations.
>> This should help broaden the gpio-regmap IC coverage without the need
>> of exposing the registered gpio_chip or struct gpio_regmap to IC 
>> drivers.
>> 
>> The set_config and init_valid_mask are used by ROHM BD71815 GPIO 
>> driver.
>> Convert the BD71815 GPIO driver to use gpio-regmap and get rid of some
>> code. Rest of the ROHM GPIO drivers are to be reworked after the
>> mechanism of adding IC specific functions is settled.
>> 
>> Some preliminary discussion can be seen here:
>> https://lore.kernel.org/linux-gpio/c4faac648d3e0c7f3dcb50f7e24c8b322e8c6974.camel@fi.rohmeurope.com/
>> 
>> I did also prepare change where the getters for drvdata and regmap
>> are used. It can also work - but it does not scale quite as well
>> if (when) IC drivers need some register information to do custom
>> operations. Interested people can see the:
>> https://github.com/M-Vaittinen/linux/commits/gpio-regmap-getters
>> for comparison.
> 
> Entire series looks good to me,

Sorry, for being late to this. I got sidetracked.

TBH, I don't like the we have the config struct in the callbacks. Why
would you need all this information in the callback? And it doesn't
help you to call back into gpio-regmap once there are further methods
provided by gpio-regmap.

Either we hide away the internals completely (which I still prefer!) or
we open up the gpio_regmap struct. But this is somewhere in between. As
the user, you could already attach the config to the opaque data pointer
and get the same result.

I don't see how the following is an overhead:

int gpio_regmap_callback(struct gpio_regmap *gpio, ..)
{
     struct regmap *regmap = gpio_regmap_get_regmap(gpio);
     struct driver_priv *data = gpio_regmap_get_drvdata(gpio);
     ...
}

It doesn't clutter anything, there is just a small runtime overhead (is
it?). Again this let you keep adding stuff in the future without
changing any users. So what are the drawbacks of this?

Also I'd like to keep the duplication of the "struct gpio_regmap" 
members
and the config members. The gpio_regmap_config is just a struct so
the _register won't get cluttered with arguments.

I'm still not opposed to convert gpio-regmap into helpers as mentioned
earlier. But until then, I'd really keep the "struct gpio_regmap *gpio"
opaque pointer.

-michael
