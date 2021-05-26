Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7473915A7
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 13:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234172AbhEZLCi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 07:02:38 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:38447 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234194AbhEZLCh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 07:02:37 -0400
Received: by mail-lj1-f176.google.com with SMTP id a4so1074555ljd.5;
        Wed, 26 May 2021 04:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=F826GOd9QGmKvrhkP83r2/l/seUVLTQcgvWy/YKrtHA=;
        b=b0u/i9X0UTQwVPYxbhbI4vE5qiG9BVfFtcI/59h5orFY67FhsEoxm8JWVzMjWd5PUO
         T2fJn9Zx6P9D+zmtkQ9wceE75Dq4ZCFUMzXGw8Wrw6NJOekVcF9olxN53jMu7NY/n+7i
         8X3LDVNk6k2HjcDh/AKqmlSXqqmI6zl+5FCHePWKnbNseR0sPTpsynl+cMSZM4v4DqdI
         VVNN4WfNdrp8Q0mCmxHK/VIx/oZQJQMuSge25EPHWSaIgJI48pBDwhoZnaH1fuKvGBny
         r7yBCkGRDR9jJaxV0nVARdw1T7SgE5nRhDyyecgHev4akFBjOBreFvghnZ1+S5riadGn
         +UIA==
X-Gm-Message-State: AOAM531gaAFksrEPHeCwV2RhRaSmXGHcK47HZyVlJmuNXLWj9IsQ55Db
        EDeobLl9lGeUS0uHC8fDhMk=
X-Google-Smtp-Source: ABdhPJwClqx3mJbr1a0yTw4+Y9GPE4h89AEnfCc4PGuHLcTQIkuXi37XYegIWJne0Vo0kc0aqXT91A==
X-Received: by 2002:a2e:9787:: with SMTP id y7mr1765788lji.65.1622026864665;
        Wed, 26 May 2021 04:01:04 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id z38sm1469378lfu.142.2021.05.26.04.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:01:04 -0700 (PDT)
Message-ID: <6e90e8d28a086bf07eef79d32c318e31f1fb11ab.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Michael Walle <michael@walle.cc>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <836b633b5cfaec4c01bd75a21369ac39@walle.cc>
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VeHZg1DC76sg1F-=49SfVLNhf4pG7ArcXHxjU0nXZOpWw@mail.gmail.com>
         <2e201aabd9b42da9a2bdcb2f7504ec12@walle.cc>
         <a3b770f49d8e55dbda56a7c32a2667f669c362bc.camel@fi.rohmeurope.com>
         <836b633b5cfaec4c01bd75a21369ac39@walle.cc>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Wed, 26 May 2021 14:00:57 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-05-26 at 12:27 +0200, Michael Walle wrote:
> Am 2021-05-26 11:44, schrieb Matti Vaittinen:
> > On Wed, 2021-05-26 at 11:07 +0200, Michael Walle wrote:
> > > Am 2021-05-26 10:42, schrieb Andy Shevchenko:
> > > > On Wed, May 26, 2021 at 9:02 AM Matti Vaittinen
> > > > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > > > Support providing some IC specific operations at gpio_regmap
> > > > > registration.
> > > > > 
> > > > > Implementation of few GPIO related functionalities are likely
> > > > > to
> > > > > be
> > > > > very IC specific. For example the pin-configuration registers
> > > > > and
> > > > > the
> > > > > pin validity checks. Allow IC driver to provide IC specific
> > > > > functions
> > > > > which gpio-regmap can utilize for these IC specific
> > > > > configurations.
> > > > > This should help broaden the gpio-regmap IC coverage without
> > > > > the
> > > > > need
> > > > > of exposing the registered gpio_chip or struct gpio_regmap to
> > > > > IC
> > > > > drivers.
> > > > > 
> > > > > The set_config and init_valid_mask are used by ROHM BD71815
> > > > > GPIO
> > > > > driver.
> > > > > Convert the BD71815 GPIO driver to use gpio-regmap and get
> > > > > rid of
> > > > > some
> > > > > code. Rest of the ROHM GPIO drivers are to be reworked after
> > > > > the
> > > > > mechanism of adding IC specific functions is settled.
> > > > > 
> > > > > Some preliminary discussion can be seen here:
> > > > > https://lore.kernel.org/linux-gpio/c4faac648d3e0c7f3dcb50f7e24c8b322e8c6974.camel@fi.rohmeurope.com/
> > > > > 
> > > > > I did also prepare change where the getters for drvdata and
> > > > > regmap
> > > > > are used. It can also work - but it does not scale quite as
> > > > > well
> > > > > if (when) IC drivers need some register information to do
> > > > > custom
> > > > > operations. Interested people can see the:
> > > > > https://github.com/M-Vaittinen/linux/commits/gpio-regmap-getters
> > > > > for comparison.
> > > > 
> > > > Entire series looks good to me,
> > > 
> > > Sorry, for being late to this. I got sidetracked.
> > > 
> > > TBH, I don't like the we have the config struct in the callbacks.
> > > Why
> > > would you need all this information in the callback?
> > 
> > I believe there will be cases when the register information is
> > needed
> > in callbacks. I don't know the GPIO controllers in details so that
> > I
> > could give you an real-word example. I guess other people on the
> > list
> > know the usual GPIO quirks far better than I do. I however have
> > seen
> > bunch of hardware - and usually each IC has _some_ strange stuff. I
> > would be surprized if there weren't any cases where the one
> > operation
> > "toggle X" would not require access to another register which is
> > used
> > to control "feature Y" - and usually only once in a blue moon.
> > Purely
> > imaginatory example could be that in order to change direction to
> > input, one would need to ensure some bit in a output configuration
> > register is cleared. Then it would be beneficial to have the
> > register
> > description in call-back.
> 
> Doing something depening on the offsets of some registers sounds like
> a hack to me.

Hm. I an unsure I understood your comment. If the hardware requires
setting a bit - then we must do it using the bit offset. What we win
here is that we can get the register address from config w/o allocating
driver data.

> > Or, if we look at the pinctrl-bcm63xx.c - another imaginatory case
> > - we
> > would get another HW variant with different BCM63XX_BANK_GPIOS
> > value.
> > Now the IC would not need to store the correct BCM63XX_BANK_GPIOS
> > in
> > driver data for the xlate-callback - it could directly read the
> > ngpio_per_reg from config.
> 
> which also sounds like a hack, where one really should provide a
> driver priv to distiguish between different variant.

I disagree here. Storing a IC type flag in private data does not scale
well when we have many variants and many 'entities' that depend on the
variant. If we just have the IC type passed to call-back, then the
call-back must have all variant details hard-coded. It scales better if
we can just provide the correct value for the variant - not the variant
type.

> > As I said, these cases are imaginatory - I don't know the GPIO
> > controllers well enough to give real-world examples - but I am
> > positive
> > there are such.
> > 
> > 
> > >  And it doesn't
> > > help you to call back into gpio-regmap once there are further
> > > methods
> > > provided by gpio-regmap.
> > 
> > If we later need this we can use container_of(), right?
> 
> Of course, but isn't your argument to have less boilerplate? ;)

Yes. We can provide the function "gpio_regmap_get_from_config()" which
returns the pointer to struct gpio_regmap - _if ever needed_ instead of
providing bunch of getter functions. (That would be driver_data, regmap
and firmware node already now just to fulfill the needs to the bd71815
- which probably is one of the simplest controllers). So one
potentially needed function vs three that would be needed already now.

>  And
> again, I don't thing the config is the correct first parameter here
> for the callback. And it would be different from all the other
> subsystems in linux (as far as I know, please correct me if I'm
> wrong),
> which have "their" (sometimes opaque, sometimes not) pointer as the
> first argument.

I only know handful of subsystems - and most of those expose the
internals. That's why I suggested it at first. Andy and you both
thought exposing the gpio_regmap or gpio_chip to gpio_regmap users was
a bad idea - hence I suggested this solution - which actually looks
good to me :)

> 
> > > Either we hide away the internals completely (which I still
> > > prefer!)
> > > or
> > > we open up the gpio_regmap struct. But this is somewhere in
> > > between.
> > 
> > Yes. And I think this is the simplest and cleanest solution which
> > still
> > provides decent amount of protection, while cuts off the
> > boilerplate.
> 
> I really don't find this solution "clean".
> 
> > Additionally this does not add any extra structures because IC
> > drivers
> > already know the config. Some gpio_regmap internals (like
> > gpio_chip)
> > can still be kept internal - while config (which in any case is
> > populated by the IC driver) is public.
> > 
> > > As
> > > the user, you could already attach the config to the opaque data
> > > pointer
> > > and get the same result.
> > 
> > Actually no. This would require user to permanently store the
> > config in
> > memory which would either duplicate the config or give IC driver a
> > pointer to gpio_regmap internals. This solution still gives pointer
> > to
> > gpio_regmap config - but at least we can set it const in function
> > parameters.
> 
> Of course, your caller has to make sure it will allocate the memory
> and doesn't just allocate it on the stack. You're doing the same,
> just in gpio-regmap.

Point was that this way we are not necessarily permanently allocating
the memory both in the gpio_regmap _and_ the IC driver. We are also not
allowing IC driver to change config stored in gpio_regmap (well,
without some tricks anyways).

> 
> > > I don't see how the following is an overhead:
> > > 
> > > int gpio_regmap_callback(struct gpio_regmap *gpio, ..)
> > > {
> > >      struct regmap *regmap = gpio_regmap_get_regmap(gpio);
> > >      struct driver_priv *data = gpio_regmap_get_drvdata(gpio);
> > >      ...
> > > }
> > > It doesn't clutter anything, there is just a small runtime
> > > overhead
> > > (is
> > > it?). Again this let you keep adding stuff in the future without
> > > changing any users. So what are the drawbacks of this?
> > > 
> > 
> > It still is overhead. Additionally, I dislike mixing function calls
> > with declarations - I know that's probably just my personal
> > preference
> > though.
> 
> Well yes, thats just a matter of taste. Everyone is doing
> platform_get_drvdata(), for example. If you want to keep something
> internal you'd need accessor methods.
> 
> > And what is not shown here is the need to declare, define and
> > export these functions from gpio_regmap. And this is really just
> > unnecessary boilerplate to me.
> 
> Exporting the functions is just adding two lines in gpio/regmap.h.
> How 
> can
> this be an argument for an overhead on the users?
> 
> > > Also I'd like to keep the duplication of the "struct gpio_regmap"
> > > members
> > > and the config members. The gpio_regmap_config is just a struct
> > > so
> > > the _register won't get cluttered with arguments.
> > 
> > The config (as passed from IC driver at register) is dublication.
> > We
> > do:
> > gpio->config = *config;
> 
> Yes and I actually had that during my initial development, but
> decided
> against it, to decouple the information you'll need later and some
> you might just discard after probe.
> 
> I'm afraid, but I really don't like having the gpio_regmap_config as
> the first parameter on callbacks, just because I think this is the
> wrong approach, so I vote against this change. I guess it is up
> to Linus to decide on this.
> 
> Don't get me wrong, I'm all open for change, but there seems to be
> two
> equal approaches to your problem, which just depends on personal
> taste.

No problem Michael - we are all allowed to have our own opinions - even
the wrong ones ;) Nah, really, the discussion is good. It rarely hurts
the outcome. I think I've explained my view now too. Let's see what
other think :)

Best Regards
	Matti Vaittinen


--
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~

Simon says - in Latin please.
"non cogito me" dixit Rene Descarte, deinde evanescavit

(Thanks for the translation Simon)

