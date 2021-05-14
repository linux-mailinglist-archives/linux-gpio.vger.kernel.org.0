Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF52D3811DE
	for <lists+linux-gpio@lfdr.de>; Fri, 14 May 2021 22:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhENUf2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 May 2021 16:35:28 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:34821 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbhENUf1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 May 2021 16:35:27 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 426302224B;
        Fri, 14 May 2021 22:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1621024453;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O1L0/pKoSlcjKl/U7hViIGd8coggHl6+ZnqIjPBzihY=;
        b=QPTMDS/nulVFrzybOahN50u8fETwnpHPmGqo5muR3NL9h/c7BHbwGiBlZci6b+3fCKt+++
        5hytbK7nM0QVi0tNYKv8ZhJDwOLAsAyoUeFbQfHwTyzz6gErDERKt8/Sh5/WWTq0wP2e6u
        W4CW1fbsfWs4UNX91z+45xD1e7Va7js=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 14 May 2021 22:34:13 +0200
From:   Michael Walle <michael@walle.cc>
To:     matti.vaittinen@fi.rohmeurope.com
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?=C3=81lvaro_Fer?= =?UTF-8?Q?n=C3=A1ndez_Rojas?= 
        <noltari@gmail.com>
Subject: Re: regmap-gpio: Support set_config and other not quite so standard
 ICs?
In-Reply-To: <3a8c418bc40a736f44ab19a549a58d6bdecc59be.camel@fi.rohmeurope.com>
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
 <b2164e5965218f270e17bf29e00ad5c5a0b54bcf.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
 <CACRpkdZnrkiYGaOTZLvCnp72WYiV0+YhCe+TbMjN_3CLyJHvgA@mail.gmail.com>
 <c5a4ef7341b5b0b56d1ad950867828463cfdb7fc.camel@fi.rohmeurope.com>
 <c4faac648d3e0c7f3dcb50f7e24c8b322e8c6974.camel@fi.rohmeurope.com>
 <CAHp75VcUva-1cv6xaU0-RADVS=GR1VMk50cqR5NPU1LCFX2N5A@mail.gmail.com>
 <3a8c418bc40a736f44ab19a549a58d6bdecc59be.camel@fi.rohmeurope.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <5ddf313b915da284211fc961971ced37@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-11 05:59, schrieb Matti Vaittinen:
> Morning Andy,
> 
> On Mon, 2021-05-10 at 19:54 +0300, Andy Shevchenko wrote:
>> On Mon, May 10, 2021 at 4:41 PM Matti Vaittinen
>> <matti.vaittinen@fi.rohmeurope.com> wrote:
>> > Hi Linus, All,
>> >
>> > On Thu, 2021-03-25 at 12:32 +0200, Matti Vaittinen wrote:
>> > > On Thu, 2021-03-25 at 10:35 +0100, Linus Walleij wrote:
>> >
>> > snip
>> >
>> > > > It could potentially (like the other Rohm GPIO MFD PMIC
>> > > > drivers)
>> > > > make some use of the gpio regmap library, but we have some
>> > > > pending changes for that so look into it after the next merge
>> > > > window.
>> > > >
>> > > > I.e. for your TODO: look at the GPIO_REGMAP helper.
>> > >
>> > > I just took a quick peek at gpio_regmap and it looks pretty good
>> > > to
>> > > me!
>> > >
>> > > Any particular reason why gpio_regmap is not just part of
>> > > gpio_chip?
>> > > I
>> > > guess providing the 'gpio_regmap_direction_*()',
>> > > 'gpio_regmap_get()',
>> > > 'gpio_regmap_set()' as exported helpers and leaving calling the
>> > > (devm_)gpiochip_add_data() to IC driver would have allowed more
>> > > flexibility. Drivers could then use the gpio_regamap features
>> > > which
>> > > fit
>> > > the IC (by providing pointers to helper functions in gpio_chip) -
>> > > and
>> > > handle potential oddball-features by using pointers to some
>> > > customized
>> > > functions in gpio_chip.
>> >
>> > So, v5.13-rc1 is out. I started wondering the gpio_regamap - and
>> > same
>> > question persists. Why hiding the gpio_chip from gpio_regmap users?
>> 
>> In general to me this sounds like opening a window for
>> non-controllable changes vs. controllable. Besides that, struct
>> gpio_chip has more than a few callbacks. On top of that, opening this
>> wide window means you won't be able to stop or refactoring become a
>> burden. I would be on the stricter side here.

I tend to agree with Andy. Keep in mind that gpio-regmap was intended
to catch all the simple and similar controllers.

That being said, I'd still like to see new users. I've had a look
at existing drivers myself some time ago and determined that there
are quirks here and there which prevent porting that driver to
gpio-regmap, see for example gpio-mpc8xxx.c, there is a workaround
for some specific SoC which caches some values in the driver.

If we make this gpio-regmap more like a library where users can
just pick the functions they need, I fear that in the end it is
nearly impossible to change such a function because you'll always
break one or another user. But that is just a gut feeling.

> I kind of fail to see your point Andy. Or yes, I know exposing the
> gpio_chip to user allows much more flexibility. But what are the
> options? What would a driver developer do when his HW does almost fir
> the standard regmap_gpio - but not just quite? Say that for example the
> changing of gpio direction requires some odd additional register access
> - but other than that the regmap_gpio operations like setting/getting
> the value, IRQ options etc. fitted the regmap_gpio logic.
> 
> If he can not override this one function - then he will need to write
> wholly new GPIO driver without re-using any of the regmap-gpio stuff.
> You know, if one can't use regmap-gpio, he's likely to use the already
> exposed gpio_chip anyways. I'd say this is much more of a pain to
> maintain. Or maybe you add another work-around option in the
> gpio_regmap_config to indicate this (and every other) oddball HW -
> which eventually leads to a mess.

Agreed, if possible, I'd not like to see options just for one
obscure HW.

> But this is all just my thinking - I'm kind of a "bystander" here and
> that's why I asked for opinions. Thanks for sharing yours, Andy. I do
> appreciate all the help and discussion.
> 
>> > 3) The last option would be adding pointer to regmap_gpio to
>> > gpio_chip
>> > - and exporting the regmap_gpio functions as helpers - leaving the
>> > gpio
>> > registration to be done by the IC driver. That would allow IC
>> > driver to
>> > use the regmap_gpio helpers which suit the IC and write own
>> > functions
>> > for rest of the stuff.
> 
> I was trying to describe here the approach that has been taken in use
> at the regulator subsystem - which has used the regmap helpers for
> quite a while. I think that approach is scaling quite Ok even for
> strange HW.

Do you have any pointers?

-michael
