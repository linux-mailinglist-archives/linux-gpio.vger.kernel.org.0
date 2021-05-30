Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0815395301
	for <lists+linux-gpio@lfdr.de>; Sun, 30 May 2021 23:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbhE3VYE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 May 2021 17:24:04 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:38027 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhE3VYD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 May 2021 17:24:03 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 375842224B;
        Sun, 30 May 2021 23:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622409743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yA+vglkZcruDrN8Ixqtp13fkcXxeIe17o4NSyFtzezA=;
        b=RZX9HjC1nRcSPnQAOG2p+rOfH/9lZkCAaD7pbPylpGEBiwSQSXR7UCBOt232meJDnbeEVN
        0svCo4pSwZQeLg4JjWANzMQA9IcQNYRsRNEh5Fv+IVvVlTOYQBDN0LxAvhrImt3HpY6R0O
        SI8AfujNrnVlF67N/i3BIh2SVwQQg6o=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 30 May 2021 23:22:21 +0200
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sander Vanheule <sander@svanheule.net>,
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
In-Reply-To: <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
References: <cover.1620735871.git.sander@svanheule.net>
 <cover.1621809029.git.sander@svanheule.net> <YKr9G3EfrM34gCsL@lunn.ch>
 <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc>
 <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
 <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com>
 <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <c7239e0cbbc9748925410937a914bd8a@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-30 20:16, schrieb Andy Shevchenko:
> On Sun, May 30, 2021 at 7:51 PM Hans de Goede <hdegoede@redhat.com> 
> wrote:
>> On 5/30/21 6:19 PM, Sander Vanheule wrote:
>> > On Fri, 2021-05-28 at 08:37 +0200, Michael Walle wrote:
> 
> ...
> 
>> > I think I found a solution!

nice!

>> > As Michael suggested, I tried raw register reads and writes, to eliminate any
>> > side effects of the intermediate code. I didn't use the ioctls (this isn't a
>> > netdev), but I found regmap's debugfs write functionality, which allowed me to
>> > do the same.
>> >
>> > I was trying to reproduce the behaviour I reported earlier, but couldn't. The
>> > output levels were always the intended ones. At some point I realised that the
>> > regmap_update_bits function does a read-modify-write, which might shadow the
>> > actual current output value.
>> > For example:
>> >  * Set output low: current out is low
>> >  * Change to input with pull-up: current out is still low, but DATAx reads high
>> >  * Set output high: RMW reads a high value (the input), so assumes a write is
>> >    not necessary, leaving the old output value (low).
>> >
>> > Currently, I see two options:
>> >  * Use regmap_update_bits_base to avoid the lazy RMW behaviour
>> >  * Add a cache for the output data values to the driver, and only use these
>> >    values to write to the output registers. This would allow keeping lazy RMW
>> >    behaviour, which may be a benefit on slow busses.
>> >
>> > With either of these implemented, if I set the output value before the
>> > direction, everything works! :-)
>> >
>> > Would you like this to be added to regmap-gpio, or should I revert back to a
>> > device-specific implementation?
>> 
>> Regmap allows you to mark certain ranges as volatile, so that they 
>> will not
>> be cached, these GPIO registers containing the current pin value seems 
>> like
>> a good candidate for this. This is also necessary to make reading the 
>> GPIO
>> work without getting back a stale, cached value.
> 
> After all it seems a simple missed proper register configuration in
> the driver for regmap.
> Oh, as usual something easy-to-solve requires tons of time to find it. 
> :-)
> 
> Sander, I think you may look at gpio-pca953x.c to understand how it
> works (volatility of registers).

But as far as I see is the regmap instantiated without a cache?

-michael
