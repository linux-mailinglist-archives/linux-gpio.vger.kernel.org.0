Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7D6C393D36
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 08:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhE1Gja (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 02:39:30 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:58649 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbhE1GjX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 02:39:23 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 24B7422239;
        Fri, 28 May 2021 08:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622183821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TJWapB+0tUo0q37LUjS90NZA75MbdZkL3wrO0Uynr+g=;
        b=hXMUBc4CyuHgNf7W98vimOnGYFcF8Msy0XzII8uC8OIfxyczy25ilJTmFj12I6fHUl206b
        bDkzkm02Uk42a+JpzGN/wT7MEhBo2KUS1eLY2VEHZmpc+4BIjE4215yMEoQN15DwHb3SXj
        m9B5O++FKmuZDm9zazAkdHpI99HdZ9A=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 28 May 2021 08:37:00 +0200
From:   Michael Walle <michael@walle.cc>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
In-Reply-To: <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
References: <cover.1620735871.git.sander@svanheule.net>
 <cover.1621809029.git.sander@svanheule.net> <YKr9G3EfrM34gCsL@lunn.ch>
 <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-24 13:41, schrieb Sander Vanheule:
> Hi Andy, Andrew,
> 
> On Mon, 2021-05-24 at 10:53 +0300, Andy Shevchenko wrote:
>> On Mon, May 24, 2021 at 4:11 AM Andrew Lunn <andrew@lunn.ch> wrote:
>> >
>> > > Changes since v2:
>> > >   - MDIO regmap support was merged, so patch is dropped here
>> >
>> > Do you have any idea how this will get merged. It sounds like one of
>> > the Maintainers will need a stable branch of regmap.
>> 
>> This is not a problem if Mark provides an immutable branch to pull 
>> from.
> 
> Mark has a tag (regmap-mdio) for this patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/tag/?h=regmap-mdio
> 
>> 
>> > >   - Introduce GPIO regmap quirks to set output direction first
>> >
>> > I thought you had determined it was possible to set output before
>> > direction?
>> 
>> Same thoughts when I saw an updated version of that patch. My
>> anticipation was to not see it at all.
> 
> The two devices I've been trying to test the behaviour on are:
>  * Netgear GS110TPP: has an RTL8231 with three LEDs, each driven via a 
> pin
>    configured as (active-low) GPIO. The LEDs are easy for a quick 
> visual check.
>  * Zyxel GS1900-8: RTL8231 used for the front panel button, and an 
> active-low
>    GPIO used to hard reset the main SoC (an RTL8380). I've modified 
> this board
>    to change some of the strapping pin values, but testing with the 
> jumpers and
>    pull-up/down resistors is a bit more tedious.
> 
> On the Netgear, I tested the following with and without the quirk:
> 
>    # Set as OUT-LOW twice, to avoid the quirk. Always turns the LED on
>    gpioset 1 32=0; gpioset 1 32=0
>    # Get value to change to input, turns the LED off (high impedance)
>    # Will return 1 due to (weak) internal pull-up
>    gpioget 1 32
>    # Set as OUT-HIGH, should result in LED off
>    # When the quirk is disabled, the LED turns on (i.e. old OUT-LOW 
> value)
>    # When the quirk is enabled, the LED remains off (i.e. correct
> OUT-HIGH value)
>    gpioset 1 32=1
> 
> Now, what's confusing (to me) is that the inverse doesn't depend on the 
> quirk:
> 
>    # Set as OUT-HIGH twice
>    gpioset 1 32=1; gpioset 1 32=1
>    # Change to high-Z
>    gpioget 1 32
>    # Set to OUT-LOW, always results in LED on, with or without quirk
>    gpioset 1 32=0
> 
> Any idea why this would be (or appear) broken on the former case, but 
> not on the
> latter?

Before reading this, I'd have guessed that they switch the internal 
register
depending on the GPIO direction; I mean there is only one register 
address
for both the input and the output register. Hm.

Did you try playing around with raw register accesses and see if the 
value
of the GPIO data register is changing when you switch GPIOs to 
input/output.

Eg. you could try https://github.com/kontron/miitool to access the 
registers
from userspace (your ethernet controller has to have support for the 
ioctl's
though, see commit a613bafec516 ("enetc: add ioctl() support for 
PHY-related
ops") for an example).

-michael
