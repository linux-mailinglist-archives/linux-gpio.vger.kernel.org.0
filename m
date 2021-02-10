Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1D031731D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 23:16:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbhBJWQL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 17:16:11 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:47467 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbhBJWQC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 17:16:02 -0500
Received: from [192.168.1.155] ([77.2.178.237]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M2wXK-1lB3fM1E7g-003Jg0; Wed, 10 Feb 2021 23:13:24 +0100
Subject: Re: RFC: oftree based setup of composite board devices
To:     Rob Herring <robh+dt@kernel.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20210208222203.22335-1-info@metux.net>
 <CAL_JsqJ-bz35mUM3agYjq5x+Y+u9rL1RwesCaA-x=MW8uv5CrA@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <2cadfb9a-58d2-ebd9-2992-90efea1fc132@metux.net>
Date:   Wed, 10 Feb 2021 23:13:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ-bz35mUM3agYjq5x+Y+u9rL1RwesCaA-x=MW8uv5CrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lV+1hlvUI0I6cuKSofVaILejnrBvHrh8arutmvhdPogsj0zM3S3
 +WZVJW7wwOFyWxHPd6OqBD5vY9glex0Zi2mS1qkDGMmmEazdfqXsr7LEoCA2HaqLwCV7URP
 zt0OAR7cp3XZ0cMEG9z2RyDtfGvBQsQjg3BR+06hyXyN6JMXFA1GHbTplK9/oL827Bamvuy
 UGwDoyPzmmgaO/JBMyz0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:l0wPzfodjyQ=:1Ur+xQTitLNUyftQb8OfH9
 SRMTHhvTNaDeM5JLX07sWKxC3gkRAAICFY1KkDfpsfjhY+o5yK+3XsxFVWEWJiPoGoqJ6md9k
 xRcqC7RCJvRDks0MxOd/Qqs/9miSYtH7rb8gxl4RNBzWzqCJiynWDgZEgxOKNXhIvkmMEdokt
 CL22wu8I6BnJB22Wo+gfqMw5s7wx28jK0v8Gjx9roJMHNOguy6D8Sf5d0NL6ZXPW2aiksf8KX
 xYTtguy816SnZItyYhvdLJ2RCTDOrbNRuzo8rmMwc/LzVvClKKI5ArbZwHSUT+xzPv5aVnO2W
 zhmxmxiRl5kiTJBw9AiQlolQM8GM5OjksmCwDMhvpV8gMj4jjtGJsHbOWBirg+5HBHhVV3LgK
 skJ5sKvLEmKRnPwyMN7wx6YNuL6xeS47hC4z+axN7fQklvGFguNnR+xuIiv+K
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09.02.21 00:48, Rob Herring wrote:

Hi,

>> here's an RFC for using compiled-in dtb's for initializing board devices
>> that can't be probed via bus'es or firmware.
> 
> I'm not convinced compiled in is the mechanism we want.

To make it clear, I'm talking of DTBs compiled into the ofboard driver
(which itself can be a module). And yes, that's pretty much what I want.
It's meant for drop-in replacement of composite board drivers, in cases
where this driver doesn't do more than initializing other drivers.

Therefore, it should work without any special userland actions, and it
should put all board specific stuff into dtb.

>> Use cases are boards with non-oftree firmware (ACPI, etc) where certain
>> platform devices can't be directly enumerated via firmware. Traditionally
>> we had to write board specific drivers that check for board identification
>> (DMI strings, etc), then initialize the actual devices and their links
>> (eg. gpio<->leds/buttons, ...). Often this can be expressed just by DT.
> 
> This is something I've wanted to see for a while. There's use cases
> for DT based systems too. The example I'd like to see supported are
> USB serial adapters with downstream serdev, GPIO, I2C, SPI, etc. Then
> plug more than one of those in.

Yes, that's also on my 2do list (eg. adcs behind some usb-i2c dongle)

> I think there's a couple of approaches we could take. Either support
> multiple root nodes as you have done or keep a single root and add
> child nodes to them. I think the latter would be less invasive. In the
> non-DT cases, we'd just always create an empty skeleton DT. A 3rd
> variation on a DT system is we could want to create parent nodes if
> they don't exist to attach this DT to so we have a full hierarchy.

I'm already investigating this idea.

Actually, I'm also thinking a bit further, whether for the future it
could make sense converting the acpi tables into oftree at runtime.
Not sure whether it's good idea, but maybe we could consolidate the
platform driver probing into one, more generic mechanism.

>> Yet some drawbacks of the current implementation:
>>
>>   * individual FDT's can't be modularized yet (IMHO, we don't have DMI-based
>>     modprobing anyways)
> 
> I think we need to use either firmware loading or udev mechanisms to
> load the FDTs.

In my usecase neither would not be a good idea, because:

a) on common machines (eg. pc's) we can't touch firmware easily
    (if we could, we wouldn't need those board drivers in the first
     place - we'd just fix the firmware :p)
b) I'd like to have my new mechanism as a drop-in replacement for
    existing drivers, reduce the init boilerplace to just a piece of dt.
    Don't wanna force users to do userland changes on a kernel upgrade.

Userland-driven approach IMHO makes sense for extra devices behind some
interfaces, that itself is probed otherwise, and we don't know hat the
user has attached to it (eg. USB->SPI adapter).

>>   * can't reconfigure or attach to devices outside the individual DT's
>>     (eg. probed by PCI, etc)
> 
> Not sure I follow.

Let's take an example:

I've got a PCI card with a bunch of generic chips, where we already have
drivers for. A traditional driver would be probed the usual pci way, and
then instantiate sub-devices directly.

That's lots of boilerplace code, whose semantics could be described
entirely via DT. In order to make that work, I need two things:

1. create a pci device instance (when the card is found)
2. instantiate all sub-devices with the card device as parent

Another problem:

I've got extra devices behind an interface that itself already is
enumerated by firmware or some bus, but the extra devices aren't.
(eg. acpi already enumerates some gpio's, but not what's connected
to them, eg. leds, keys, ...). In this case, I somehow need to get
these parent devices into my DT's scope, so the additional devices
can refer to them.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
