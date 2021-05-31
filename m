Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34FE93963DF
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 17:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbhEaPhN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 11:37:13 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:46256 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232906AbhEaPfV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 May 2021 11:35:21 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:86ad:a53c:2e83:dd76] (unknown [IPv6:2a02:a03f:eafb:ee01:86ad:a53c:2e83:dd76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id A9BDE206B6B;
        Mon, 31 May 2021 17:33:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1622475210;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xiXZatVAB++3a5E7nWSQIMIqvM2fRrnQrEqg5glz/i0=;
        b=ZIOw1e17uTXiLULKbQJOqFzrCYPbNaJnIwUMlVNBaZ1D7RKUE7EcW92eVBDgxZoO0OL+Gy
        2+LQe/2laJYBVX2JuBSWrZWEX/UIcWx9mv1myqK5w3ZLN/OY7HyaepuAB0Mjxid+PTyIa9
        hh4u0W1pFk7EUkyEFLRfLR1qI2JrNDwWc0Z8C5H7G8sMj/Z4lPihomUC4sGhGnUx7xUgEq
        dVY1aEcQyp+BY4HRBdexLehJcBJ2IGudwvWZfgrm0nirPXvAPo/lA7egj7grZHIz3I3681
        1baa/NkSeQz84/GSJUu+x8HeDNI+E8rwqSNFIfQX3ODZiauhBvU1313T2xI2kw==
Message-ID: <272ac6af4a5ba5df4bb085617c9267e5ece61c19.camel@svanheule.net>
Subject: Re: [PATCH 0/5] RTL8231 GPIO expander support
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>
Cc:     Hans de Goede <hdegoede@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
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
Date:   Mon, 31 May 2021 17:33:27 +0200
In-Reply-To: <CAHp75VfOrUBRQH1vrXEwHN4ZPojQfQju-_wp_3djZeozEaatug@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-05-31 at 14:16 +0300, Andy Shevchenko wrote:
> 
> 
> On Monday, May 31, 2021, Michael Walle <michael@walle.cc> wrote:
> > Am 2021-05-31 10:36, schrieb Sander Vanheule:

...

> > > The data register rather appears to be implemented as a read-only (pin
> > > inputs)
> > > register and a write-only (pin outputs) register, aliased on the same
> > > register
> > > address.
> > > 
> > 
> > Ahh so this makes more sense. If the data register is really write only
> > regardless of the direction mode, then RMW doesn't make any sense at all.
> > Please note, that even if regmap caches values, it might be marked as dirty
> > and it will re-read the values from hardware. So I don't know if that will
> > help you.
> > 
> > So a possible quirk could be
> >  GPIO_REGMAP_WRITE_ONLY_DATA_REG (or something like that)
> > 
> > 
> 
> Isn’t regmap property to do a such? I don’t think any quirks are needed since hw
> works as expected.

The HW works as expected, but it is regmap-gpio's assumption that values read
from reg_set_base reflect the current output value that fails.

I looked a bit more at the provided interface, to see if this can be done with
existing regmap functionality.

The data registers must not be marked volatile, to ensure cached reads. The pin
set function can wrap the RMW in regcache_cache_only + regcache_sync, but this
causes visible glitching on my device.

The pin input values can be read by wrapping the regmap_read in
regcache_cache_bypass guards.

If only the regmap's internal lock is used, the RMW cycle is no longer atomic.
Inside the cache_only guards you can't read the input data, and inside the
cache_bypass guards other register writes cannot be performed, or the cache may
get out of sync. regcache_sync_region could be used, but maybe we would then
miss other registers that were updated in the meantime.

Am I missing something here? It seems to me like the regmap interface can't
really accommodate what's required, unless maybe the rtl8231 regmap users
perform some manual locking. This all seems terribly complicated compared to
using an internal output-value cache inside regmap-gpio.


Best,
Sander

