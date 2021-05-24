Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97BB738E59C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 13:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbhEXLnY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 07:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232689AbhEXLnY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 07:43:24 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73380C06138B
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 04:41:56 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1] (unknown [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id B6F1E202EE1;
        Mon, 24 May 2021 13:41:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621856515;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7YduOA1ohs3jQ8WNX3WfkNmDVw+6tiE+hLHwmyz0Weg=;
        b=eM1O2D4P5WofRSvhvp9tlvkLj9sy7AkO4BGDRvI2GlyAn/ETiOk2ZZWna0wXH26mqK9vlW
        85AjkVeYTOY/U9lG5CbMcZkbJyqQo7K+uAaoLBt1jZ9jnrri3CZteH9dDtdtG0eJ3UbvKM
        +7xnxwHbl4uvmw1ATtv5ejskdc58iSW3fwHjSHtkhO/5A+s+LbL1NtZBunyltquYIXDpSk
        PGQg8WZzpCY5Ev6dQt1UVUbh+WsgLwgFj95jJ67IvsrntAADBOvFn72Urrwn6HWa0lzTk+
        NUX78/gsPNkR6HybpwYahB9qc6ho0tyrkzl8XQ9LqrPnx4nxjtrh0OXNbiGSZQ==
Message-ID: <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Mon, 24 May 2021 13:41:53 +0200
In-Reply-To: <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
References: <cover.1620735871.git.sander@svanheule.net>
         <cover.1621809029.git.sander@svanheule.net> <YKr9G3EfrM34gCsL@lunn.ch>
         <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy, Andrew,

On Mon, 2021-05-24 at 10:53 +0300, Andy Shevchenko wrote:
> On Mon, May 24, 2021 at 4:11 AM Andrew Lunn <andrew@lunn.ch> wrote:
> > 
> > > Changes since v2:
> > >   - MDIO regmap support was merged, so patch is dropped here
> > 
> > Do you have any idea how this will get merged. It sounds like one of
> > the Maintainers will need a stable branch of regmap.
> 
> This is not a problem if Mark provides an immutable branch to pull from.

Mark has a tag (regmap-mdio) for this patch:
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/tag/?h=regmap-mdio

> 
> > >   - Introduce GPIO regmap quirks to set output direction first
> > 
> > I thought you had determined it was possible to set output before
> > direction?
> 
> Same thoughts when I saw an updated version of that patch. My
> anticipation was to not see it at all.

The two devices I've been trying to test the behaviour on are:
 * Netgear GS110TPP: has an RTL8231 with three LEDs, each driven via a pin
   configured as (active-low) GPIO. The LEDs are easy for a quick visual check.
 * Zyxel GS1900-8: RTL8231 used for the front panel button, and an active-low
   GPIO used to hard reset the main SoC (an RTL8380). I've modified this board
   to change some of the strapping pin values, but testing with the jumpers and
   pull-up/down resistors is a bit more tedious.

On the Netgear, I tested the following with and without the quirk:
   
   # Set as OUT-LOW twice, to avoid the quirk. Always turns the LED on
   gpioset 1 32=0; gpioset 1 32=0
   # Get value to change to input, turns the LED off (high impedance)
   # Will return 1 due to (weak) internal pull-up
   gpioget 1 32
   # Set as OUT-HIGH, should result in LED off
   # When the quirk is disabled, the LED turns on (i.e. old OUT-LOW value)
   # When the quirk is enabled, the LED remains off (i.e. correct OUT-HIGH value)
   gpioset 1 32=1

Now, what's confusing (to me) is that the inverse doesn't depend on the quirk:
   
   # Set as OUT-HIGH twice
   gpioset 1 32=1; gpioset 1 32=1
   # Change to high-Z
   gpioget 1 32
   # Set to OUT-LOW, always results in LED on, with or without quirk
   gpioset 1 32=0

Any idea why this would be (or appear) broken on the former case, but not on the
latter?

I was trying to reproduce this behaviour on the Zyxel, but using the strapping
pins that are also used to configure the device's address. So perhaps the pull-
ups/-downs were confusing the results. Using a separate pin on the Zyxel's
RTL8231, I've now been able to confirm the same behaviour as on the Netgear,
including capturing the resulting glitch (with my simple logic analyser) when
enabling the quirk in the first test case.

I hope this explains why I've still included the quirk in this revision. If not,
please let me know what isn't clear.


Best,
Sander

