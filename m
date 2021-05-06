Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B999A3754CE
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 15:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233461AbhEFNg0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 09:36:26 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:52663 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbhEFNg0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 May 2021 09:36:26 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id DB2ED2224B;
        Thu,  6 May 2021 15:35:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1620308127;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CmDntFODvjLgdXN3wFi4anvzO+7I/PTtPR0QlpBa/lc=;
        b=ZB3ENoRhzOZBXkOrrv0FWa5XdDbCE1JABsyK3NBQohAb4Hkt7HYk/4p0oKveXP8ef5EhKP
        WfKsvr8t+8tYFrtPmX7Xh5fWeVwK+2MoPvdogJzl6ZtRAJKjEI4cGdYm9X0X5a4lgRzlK0
        sTkSBedifHMKadgDGkMuuKG4fc2owas=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 06 May 2021 15:35:26 +0200
From:   Michael Walle <michael@walle.cc>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] regmap: add regmap_might_sleep()
In-Reply-To: <20210506124342.GC4642@sirena.org.uk>
References: <20210430130645.31562-1-michael@walle.cc>
 <20210430151908.GC5981@sirena.org.uk>
 <df27a6508e9edcd8b56058ac4834fd56@walle.cc>
 <20210430172603.GE5981@sirena.org.uk>
 <128a6d51af1b7c9ed24a5848347c66b9@walle.cc>
 <20210506124342.GC4642@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <5921b32058d00a1bffda82b72286db09@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-06 14:43, schrieb Mark Brown:
> On Sat, May 01, 2021 at 12:10:16AM +0200, Michael Walle wrote:
>> Am 2021-04-30 19:26, schrieb Mark Brown:
> 
>> > But that's a driver for a specific device AFAICT which looks like it's
>> > only got an I2C binding on the MFD so the driver knows that it's for a
>> > device that's on a bus that's going to sleep and doesn't need to infer
>> > anything?  This looks like the common case I'd expect where there's no
>> > variation.
> 
>> You are right, at the moment this driver only has an I2C binding. But
>> the idea was that this IP block and driver can be reused behind any
>> kind of bridge; I2C, SPI or MMIO. Actually, I had the impression
> 
> Is this actually a way people are building hardware though?

Granted, this might be a special case because the driver is for an
IP inside CPLD/FPGA, thus you could easily switch the bridge.

>> that all you need to do to convert it to MMIO is to replace the
>> "kontron,sl28cpld" compatible with a "syscon" compatible. But it isn't
>> that easy. Anyway, the idea is that you don't need to change anything
>> in the gpio-sl28cpld driver, just change the parent. But if we can't
>> ask the regmap what type it is, then we'll have to modify the
>> gpio-sl28cpld driver and we will have to figure it out by some other
>> means.
> 
> Well, you don't need to change anything at all - the driver will work
> perfectly fine if it's flagging up the GPIOs as potentially sleeping
> even if they end up not actually sleeping.

Unless you need the non-sleeping version for a gpio.

>> > If users happen to end up with a map flagged as fast they can work on
>> > the whatever driver uses this stuff and not realise they're breaking
>> > other users of the same driver that end up with slow I/O.  The whole
>> > point of the flag in GPIO is AIUI warnings to help with that case.
> 
>> Hm, but as of now, the only thing which makes the gpio-regmap driver
>> slow i/o is the regmap itself.
> 
> Surely it's just a case of the device that's creating the gpio regmap
> setting a flag when it instantiates it?  It's just one more thing that
> the parent knows about the device.  This doesn't seem insurmountable.

No its not. It just seemed like it is way easier to just ask the regmap.

-michael
