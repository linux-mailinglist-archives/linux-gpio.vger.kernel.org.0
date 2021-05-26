Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B766391280
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 10:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbhEZIoD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 04:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbhEZIoC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 04:44:02 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5D4C061574;
        Wed, 26 May 2021 01:42:29 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso7167pjb.5;
        Wed, 26 May 2021 01:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OUwq2bgUtD2vFnjhA9RtxuArSTkiXWylCRiYJbyEpxw=;
        b=lYQGcQ98eSYfG8QYN1o0ZBVQAKc6Fion6TCO7Bn7+0WF+MucqwoPvBY2QdgkNrkL3p
         om6YUNib7W7IUvzVW0Zck2u5+UoTbarKarfN+4m+xBn/u1WtIYDYFPoC4SDkrNI55GWT
         P3T5fke3h6m7lKX/S9BbNoY3v0TP9TkhDzkJ5PoE72Y3vHLrij7PjV1fkee4HK2U5Gyn
         V6BvR9inOQjwOhyQb8BubLm/cblJHzPh2mQ/GcydxtdJPTQAapfNjkXXAWGl23MDqJ5r
         O7grwJ4VVK6WvwRC0sC1EXhpfsJ0DjkOi61bQo3oK9yEjeGlkxnUA6BDNPg2YzKECl0u
         7WCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OUwq2bgUtD2vFnjhA9RtxuArSTkiXWylCRiYJbyEpxw=;
        b=FQrdr4VOzdHn2VCr2XzQPRnIluwXU45mS8gKjvqoz4Z2K8AHz6+P1V2CahlW+TcgCK
         75ug6pp7pqA84JFHEEtMHLodLQMLltjjsT40L70x1NH2HW76DdhvRCKsByjUtR6KPSnI
         jFwi+OWe5EsDfQsF8fQGHO/Jd8U/Gx2qNfV+MCIg94RSb0K5x/9moxRhVogmNP9kTDUb
         +p4HkkYCAcCzCBA19M1hMIWCXmn25nz2nk6HQ8WmHN8wsQZGEnJkaboGy0Pomh0hRcPi
         fp9qH7KO+dW6GQEuaX5QVyflnVoD4qU8fnT2oESwPckW2MFfbOWHDyNx3KSZmQn82v6F
         zErw==
X-Gm-Message-State: AOAM531yx6FS1nF9K0e+MOI1CF2pH6MN/DEKbPb6da4L0mgf1YlcykbW
        GeyHSnUlJatGielnjxVqmoAbQ4QrXtY+pDM3tKRfgMro5LY=
X-Google-Smtp-Source: ABdhPJwMmsvrPqCqHrvrvFCPUCPiaNObxiZ1bZNQkE6kHp22zBYHB7yM1+gJCMbsf607/SMSw+vHYG7HwGxXl5bSYfE=
X-Received: by 2002:a17:902:b18c:b029:f4:67e6:67af with SMTP id
 s12-20020a170902b18cb02900f467e667afmr34814920plr.17.1622018547863; Wed, 26
 May 2021 01:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 26 May 2021 11:42:11 +0300
Message-ID: <CAHp75VeHZg1DC76sg1F-=49SfVLNhf4pG7ArcXHxjU0nXZOpWw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 26, 2021 at 9:02 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Support providing some IC specific operations at gpio_regmap registration.
>
> Implementation of few GPIO related functionalities are likely to be
> very IC specific. For example the pin-configuration registers and the
> pin validity checks. Allow IC driver to provide IC specific functions
> which gpio-regmap can utilize for these IC specific configurations.
> This should help broaden the gpio-regmap IC coverage without the need
> of exposing the registered gpio_chip or struct gpio_regmap to IC drivers.
>
> The set_config and init_valid_mask are used by ROHM BD71815 GPIO driver.
> Convert the BD71815 GPIO driver to use gpio-regmap and get rid of some
> code. Rest of the ROHM GPIO drivers are to be reworked after the
> mechanism of adding IC specific functions is settled.
>
> Some preliminary discussion can be seen here:
> https://lore.kernel.org/linux-gpio/c4faac648d3e0c7f3dcb50f7e24c8b322e8c6974.camel@fi.rohmeurope.com/
>
> I did also prepare change where the getters for drvdata and regmap
> are used. It can also work - but it does not scale quite as well
> if (when) IC drivers need some register information to do custom
> operations. Interested people can see the:
> https://github.com/M-Vaittinen/linux/commits/gpio-regmap-getters
> for comparison.

Entire series looks good to me,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Changelog v4:
>  - Convert also the existing users.
>
> Changelog v3:
>  - divide gpio_regmap into private part and part which contains
>    user-visible configurations. This should allow keeping the internal
>    data internal to gpio_regmap - while allowing the IC driver to re-use
>    configurations it has provided to gpio-regmap without a need of
>    storing them to private-data. Furthermore avoid implementing dummy
>    'getter-functions' for regmap, driver-data, register details,
>    firmware node etc.
>  - change devm_add_action() to devm_add_action_or_reset()
>  - the bd71815 GPIO driver, completely drop private-data.
>
> Changelog v2:
>  - Add cover-letter
>  - Drop unnecessary checks for callback function validity
>  - drop driver_data setting function as it is likely to be a
>    race-condition-by-design
>
> ---
>
> Matti Vaittinen (3):
>   gpio: regmap: Support few IC specific operations
>   gpio: gpio-regmap: Use devm_add_action_or_reset()
>   gpio: bd71815: Use gpio-regmap
>
>  drivers/gpio/Kconfig                  |   1 +
>  drivers/gpio/gpio-bd71815.c           | 121 ++++-----------
>  drivers/gpio/gpio-regmap.c            | 212 +++++++++++++++-----------
>  drivers/gpio/gpio-sl28cpld.c          |   3 +-
>  drivers/pinctrl/bcm/pinctrl-bcm63xx.c |   8 +-
>  include/linux/gpio/regmap.h           |  51 +++++--
>  6 files changed, 194 insertions(+), 202 deletions(-)
>
>
> base-commit: c4681547bcce777daf576925a966ffa824edd09d
> --
> 2.25.4
>
>
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =]



-- 
With Best Regards,
Andy Shevchenko
