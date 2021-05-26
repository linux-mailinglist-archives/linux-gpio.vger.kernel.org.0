Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68FA3913F1
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 11:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbhEZJq1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 05:46:27 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:33564 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233424AbhEZJq1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 05:46:27 -0400
Received: by mail-lf1-f47.google.com with SMTP id a5so890189lfm.0;
        Wed, 26 May 2021 02:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=gYKKPT5j4jeYaDP5rslIaWX8PG2qc702teYFeislBwM=;
        b=NyV59HiPXXNUEf9JNP2mnlbYeYnJDVabyAL9NjDjiwA4gMrdJtU56/OwLdzsGlslC9
         Y/xNxGKqudXC5gPYFqGNfcmQ+1pk7a9dH1tfjf8HDMbFyHoD5cdbUvvrY6rU3Sk0/gd+
         Ib5E6mjS8M0nhCWfNiC9hrpu/3NrbMRcueDiXvWeqZiu8Y49dA9q83DhGxukMN5YvGR/
         vi0c3S3NKIhoulFEjoqjHq8wxVdtG3PAJKZTIBwRF2iXHtkpKM0JSxTvOGvkSyr5HWBo
         1U1IzcEZQSmhEaE39j9YhHNIqLG9uYZkV/iHQ1wBqNoWv9hY5W47nivLTlA9r+RtDmqY
         +/WQ==
X-Gm-Message-State: AOAM531AotgOMuXmiXdRXS71sTo5SSyVZ4vmSly1zGGu/eeY0ozJpJAH
        nSaNAP+1BLLE4rCjVgjXTVd+GSvLRlI=
X-Google-Smtp-Source: ABdhPJzf0RekRRXK39PiDMVK63YPh4UgfLIdYug1cqMUVTN34ssy5hQNJxY052doLRs5RnLbyOMJ5Q==
X-Received: by 2002:ac2:5213:: with SMTP id a19mr1583146lfl.105.1622022294845;
        Wed, 26 May 2021 02:44:54 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id o6sm1277940lfi.256.2021.05.26.02.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 02:44:54 -0700 (PDT)
Message-ID: <a3b770f49d8e55dbda56a7c32a2667f669c362bc.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Michael Walle <michael@walle.cc>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <2e201aabd9b42da9a2bdcb2f7504ec12@walle.cc>
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VeHZg1DC76sg1F-=49SfVLNhf4pG7ArcXHxjU0nXZOpWw@mail.gmail.com>
         <2e201aabd9b42da9a2bdcb2f7504ec12@walle.cc>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Wed, 26 May 2021 12:44:47 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Wed, 2021-05-26 at 11:07 +0200, Michael Walle wrote:
> Am 2021-05-26 10:42, schrieb Andy Shevchenko:
> > On Wed, May 26, 2021 at 9:02 AM Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > Support providing some IC specific operations at gpio_regmap 
> > > registration.
> > > 
> > > Implementation of few GPIO related functionalities are likely to
> > > be
> > > very IC specific. For example the pin-configuration registers and
> > > the
> > > pin validity checks. Allow IC driver to provide IC specific
> > > functions
> > > which gpio-regmap can utilize for these IC specific
> > > configurations.
> > > This should help broaden the gpio-regmap IC coverage without the
> > > need
> > > of exposing the registered gpio_chip or struct gpio_regmap to IC 
> > > drivers.
> > > 
> > > The set_config and init_valid_mask are used by ROHM BD71815 GPIO 
> > > driver.
> > > Convert the BD71815 GPIO driver to use gpio-regmap and get rid of
> > > some
> > > code. Rest of the ROHM GPIO drivers are to be reworked after the
> > > mechanism of adding IC specific functions is settled.
> > > 
> > > Some preliminary discussion can be seen here:
> > > https://lore.kernel.org/linux-gpio/c4faac648d3e0c7f3dcb50f7e24c8b322e8c6974.camel@fi.rohmeurope.com/
> > > 
> > > I did also prepare change where the getters for drvdata and
> > > regmap
> > > are used. It can also work - but it does not scale quite as well
> > > if (when) IC drivers need some register information to do custom
> > > operations. Interested people can see the:
> > > https://github.com/M-Vaittinen/linux/commits/gpio-regmap-getters
> > > for comparison.
> > 
> > Entire series looks good to me,
> 
> Sorry, for being late to this. I got sidetracked.
> 
> TBH, I don't like the we have the config struct in the callbacks. Why
> would you need all this information in the callback?

I believe there will be cases when the register information is needed
in callbacks. I don't know the GPIO controllers in details so that I
could give you an real-word example. I guess other people on the list
know the usual GPIO quirks far better than I do. I however have seen
bunch of hardware - and usually each IC has _some_ strange stuff. I
would be surprized if there weren't any cases where the one operation
"toggle X" would not require access to another register which is used
to control "feature Y" - and usually only once in a blue moon. Purely
imaginatory example could be that in order to change direction to
input, one would need to ensure some bit in a output configuration
register is cleared. Then it would be beneficial to have the register
description in call-back.

Or, if we look at the pinctrl-bcm63xx.c - another imaginatory case - we
would get another HW variant with different BCM63XX_BANK_GPIOS value.
Now the IC would not need to store the correct BCM63XX_BANK_GPIOS in
driver data for the xlate-callback - it could directly read the
ngpio_per_reg from config.

As I said, these cases are imaginatory - I don't know the GPIO
controllers well enough to give real-world examples - but I am positive
there are such.


>  And it doesn't
> help you to call back into gpio-regmap once there are further methods
> provided by gpio-regmap.

If we later need this we can use container_of(), right?

> Either we hide away the internals completely (which I still prefer!)
> or
> we open up the gpio_regmap struct. But this is somewhere in between. 

Yes. And I think this is the simplest and cleanest solution which still
provides decent amount of protection, while cuts off the boilerplate.
Additionally this does not add any extra structures because IC drivers
already know the config. Some gpio_regmap internals (like gpio_chip)
can still be kept internal - while config (which in any case is
populated by the IC driver) is public.

> As
> the user, you could already attach the config to the opaque data
> pointer
> and get the same result.

Actually no. This would require user to permanently store the config in
memory which would either duplicate the config or give IC driver a
pointer to gpio_regmap internals. This solution still gives pointer to
gpio_regmap config - but at least we can set it const in function
parameters.

> 
> I don't see how the following is an overhead:
> 
> int gpio_regmap_callback(struct gpio_regmap *gpio, ..)
> {
>      struct regmap *regmap = gpio_regmap_get_regmap(gpio);
>      struct driver_priv *data = gpio_regmap_get_drvdata(gpio);
>      ...
> }

> It doesn't clutter anything, there is just a small runtime overhead
> (is
> it?). Again this let you keep adding stuff in the future without
> changing any users. So what are the drawbacks of this?
> 

It still is overhead. Additionally, I dislike mixing function calls
with declarations - I know that's probably just my personal preference
though. And what is not shown here is the need to declare, define and
export these functions from gpio_regmap. And this is really just
unnecessary boilerplate to me.

> 
> Also I'd like to keep the duplication of the "struct gpio_regmap" 
> members
> and the config members. The gpio_regmap_config is just a struct so
> the _register won't get cluttered with arguments.

The config (as passed from IC driver at register) is dublication. We
do:
gpio->config = *config;

It's just not all meld in the same level.

Best Regards
	Matti Vaittinen



