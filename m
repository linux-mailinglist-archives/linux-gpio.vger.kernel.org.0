Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCCB370356
	for <lists+linux-gpio@lfdr.de>; Sat,  1 May 2021 00:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbhD3WLH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 18:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbhD3WLH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 18:11:07 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B00C06174A;
        Fri, 30 Apr 2021 15:10:18 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 3997B22178;
        Sat,  1 May 2021 00:10:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1619820616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sx5P6k+8J/SUNrmoKJuM+QdjCHUJpgp7+KBx8Lr7+hc=;
        b=icmY8TemC3wby6JVli35xO2PTsPqnQCgT3Ietxq42FQF2sqTO4M/6k/w0Lxg5OCWDoLjh1
        ZMkyug9nzqlcGabpNdSg7sVUHhRAAYrQRbSSWVjtqmI1a1DSkO5O28j1yKLxQ1czDzTme+
        KIuYNTPeZQ3nVvHThUI+F8YKvl0J4Ac=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 01 May 2021 00:10:16 +0200
From:   Michael Walle <michael@walle.cc>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] regmap: add regmap_might_sleep()
In-Reply-To: <20210430172603.GE5981@sirena.org.uk>
References: <20210430130645.31562-1-michael@walle.cc>
 <20210430151908.GC5981@sirena.org.uk>
 <df27a6508e9edcd8b56058ac4834fd56@walle.cc>
 <20210430172603.GE5981@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <128a6d51af1b7c9ed24a5848347c66b9@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-04-30 19:26, schrieb Mark Brown:
> On Fri, Apr 30, 2021 at 06:01:49PM +0200, Michael Walle wrote:
>> Am 2021-04-30 17:19, schrieb Mark Brown:
> 
>> > Whatever is creating the regmap really ought to know what device it's
>> > dealing with...
> 
>> But creating and using the regmap are two seperate things, no? 
>> Consider
>> the gpio-sl28cpld. It will just use whatever regmap the parent has 
>> created.
>> How would it know what type of regmap it is?
> 
> But that's a driver for a specific device AFAICT which looks like it's
> only got an I2C binding on the MFD so the driver knows that it's for a
> device that's on a bus that's going to sleep and doesn't need to infer
> anything?  This looks like the common case I'd expect where there's no
> variation.

You are right, at the moment this driver only has an I2C binding. But
the idea was that this IP block and driver can be reused behind any
kind of bridge; I2C, SPI or MMIO. Actually, I had the impression
that all you need to do to convert it to MMIO is to replace the
"kontron,sl28cpld" compatible with a "syscon" compatible. But it isn't
that easy. Anyway, the idea is that you don't need to change anything
in the gpio-sl28cpld driver, just change the parent. But if we can't
ask the regmap what type it is, then we'll have to modify the
gpio-sl28cpld driver and we will have to figure it out by some other
means.

>> > > It might be possible to pass this information via the
>> > > gpio_regmap_config, but this has the following drawbacks. First, that
>> > > property is redundant and both places might contratict each other. And
>> > > secondly, the driver might not even know the type of the regmap
>> > > because
>> > > it just gets an opaque pointer by querying the device tree.
> 
>> > If it's a generic GPIO driver from a code correctness point of view it's
>> > always got a risk of sleeping...
> 
>> I can't follow you here.
> 
> If users happen to end up with a map flagged as fast they can work on
> the whatever driver uses this stuff and not realise they're breaking
> other users of the same driver that end up with slow I/O.  The whole
> point of the flag in GPIO is AIUI warnings to help with that case.

Hm, but as of now, the only thing which makes the gpio-regmap driver
slow i/o is the regmap itself.

-michael
