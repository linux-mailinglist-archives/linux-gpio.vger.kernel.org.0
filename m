Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B501D3972CC
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 13:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233741AbhFALvZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 07:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233064AbhFALvY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 07:51:24 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EAFC061574;
        Tue,  1 Jun 2021 04:49:43 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id A4D492224A;
        Tue,  1 Jun 2021 13:49:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622548178;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HwyHo5KmOS+wJ8+Zmtt3LzoQ8VbBO0PvA0b+B+ROgHE=;
        b=qmsy6VuDvoP/T3NCjWBNzLHxoXZ9hGk7/k/3Mjie29LAenUS6S91fKxxkIBGcY/BCll8w0
        FJIfq5GU9Nwk4XtQee5kHnouso9MdowOaPjJ4Pw34j0m+pvbDj7nj00yMplNQSbHhwY2xD
        fo+13GXbZWJRZp6LCwFuAEp1QjrDINk=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Jun 2021 13:49:38 +0200
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sander Vanheule <sander@svanheule.net>,
        Hans de Goede <hdegoede@redhat.com>,
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
Subject: Re: [PATCH 0/5] RTL8231 GPIO expander support
In-Reply-To: <CAHp75Vcb95HiYxvEzYr0QXcQmA_A+2M9M0uv6PAhPHtgTges8g@mail.gmail.com>
References: <cover.1620735871.git.sander@svanheule.net>
 <cover.1621809029.git.sander@svanheule.net> <YKr9G3EfrM34gCsL@lunn.ch>
 <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc>
 <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
 <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com>
 <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
 <c7239e0cbbc9748925410937a914bd8a@walle.cc>
 <7a9978881e9ec5d4b811fa6e5d355fb6bce6f6d8.camel@svanheule.net>
 <0047200eecbd7ee480258cc904d6b7ee@walle.cc>
 <CAHp75VfOrUBRQH1vrXEwHN4ZPojQfQju-_wp_3djZeozEaatug@mail.gmail.com>
 <272ac6af4a5ba5df4bb085617c9267e5ece61c19.camel@svanheule.net>
 <CAHp75Vcb95HiYxvEzYr0QXcQmA_A+2M9M0uv6PAhPHtgTges8g@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8df77f619730b9e7b5cdd7ddefb60a03@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-31 17:48, schrieb Andy Shevchenko:
> On Mon, May 31, 2021 at 6:33 PM Sander Vanheule <sander@svanheule.net> 
> wrote:
>> On Mon, 2021-05-31 at 14:16 +0300, Andy Shevchenko wrote:
>> > On Monday, May 31, 2021, Michael Walle <michael@walle.cc> wrote:
>> > > Am 2021-05-31 10:36, schrieb Sander Vanheule:
> 
>> Am I missing something here? It seems to me like the regmap interface 
>> can't
>> really accommodate what's required, unless maybe the rtl8231 regmap 
>> users
>> perform some manual locking. This all seems terribly complicated 
>> compared to
>> using an internal output-value cache inside regmap-gpio.
> 
> Have you had a chance to look into the PCA953x driver?
> Sounds to me that you are missing the APIs that regmap provides.

What would that be? The register cache? We need to cache the
value somehow, because (still assuming it is write only) we cannot
read it back. Thus the read of the RMW, would need get the
value from the cache. Thus the user of gpio-regmap would need
to make sure, to (a) use a cache for the regmap supplied to
gpio-regmap and (b) populate its initial values correctly. Is
that what you are suggesting? And hopefully, no other user
of the regmap will call regcache_mark_dirty() or something
like that.

I had a quick look at the PCA953x driver but it all its
registers are readable according to the comment on the top
of the file.

-michael
