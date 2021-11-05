Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA62446B28
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Nov 2021 00:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhKEXWd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 19:22:33 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:43731 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbhKEXWd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Nov 2021 19:22:33 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 5402222247;
        Sat,  6 Nov 2021 00:19:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1636154391;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+ukrhMc54po+ZfQV2fTWAEE2CL/83wEHkoyByYstNRw=;
        b=GisVo0g7LTEr/fa44vtS/Dv/YWGkBQ2o2qKsZwez0J11m8tPhzWRtbGVS85ABgDizYpDQY
        ovorPpoYHafmxmL+W+GA7bkx5xJ4vria+Dt34veOqhppgp+hOlXMzSrL7xSt9LZU3pA2n5
        /VOURDLKkTvuL7h7WIOPVtDvqoEzR0w=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 06 Nov 2021 00:19:51 +0100
From:   Michael Walle <michael@walle.cc>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/6] gpio: Add Delta TN48M CPLD GPIO driver
In-Reply-To: <CA+HBbNEEPHLbJSdWPdxWb5gASha_NavJrEBBRkbvzEW2aDSjmQ@mail.gmail.com>
References: <20211102165657.3428995-1-robert.marko@sartura.hr>
 <20211102165657.3428995-2-robert.marko@sartura.hr>
 <CAHp75VdnQq76f5Xeo5LCq83sr4TbcXY_mtZ4x_rFzUkS01BYZg@mail.gmail.com>
 <CA+HBbNEEPHLbJSdWPdxWb5gASha_NavJrEBBRkbvzEW2aDSjmQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <cd0b876b5a043de21179eea01ca0344c@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-11-05 12:34, schrieb Robert Marko:
> On Tue, Nov 2, 2021 at 8:28 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> 
>> On Tue, Nov 2, 2021 at 6:57 PM Robert Marko <robert.marko@sartura.hr> 
>> wrote:
>> >
>> > Delta TN48M switch has an onboard Lattice CPLD that is used as a GPIO
>> > expander.
>> >
>> > The CPLD provides 12 pins in total on the TN48M, but on more advanced
>> > switch models it provides up to 192 pins, so the driver is extendable
>> > to support more switches.
>> 
>> ...
>> 
>> > +static int tn48m_gpio_probe(struct platform_device *pdev)
>> > +{
>> 
>> > +       const struct tn48m_gpio_config *gpio_config = NULL;
>> > +       struct gpio_regmap_config config = {0};
>> 
>> I don't see a point in assigning these variables.
> 
> Hi,
> The NULL one isn't required, but the regmap one is, otherwise the
> devm_gpio_regmap_register call will
> return -EINVAL.
> 
> It will fail here:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpio-regmap.c#L209
> 
> I see that Michael Walle who did the GPIO regmap uses it as well in
> the Kontron CPLD driver.
> Michael, can you shed some light on this?

I guess this was already clarified? Because you don't set
all the properties of the config you have to initialize it.
Otherwise anything could happen.

-michael
