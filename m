Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE985323FB1
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Feb 2021 16:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbhBXORC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Feb 2021 09:17:02 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:37341 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233093AbhBXNC6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Feb 2021 08:02:58 -0500
Received: from [192.168.1.155] ([77.2.19.91]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MDyoW-1l51sv2CX6-009v7T; Wed, 24 Feb 2021 14:00:13 +0100
Subject: Re: RFC: oftree based setup of composite board devices
To:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20210208222203.22335-1-info@metux.net>
 <CAL_JsqJ-bz35mUM3agYjq5x+Y+u9rL1RwesCaA-x=MW8uv5CrA@mail.gmail.com>
 <76bf0f7c-9477-f370-8fbd-ce8ef15188b1@gmail.com>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <44b9b561-5e0d-6a1c-ca5d-4e9f6000884c@metux.net>
Date:   Wed, 24 Feb 2021 14:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <76bf0f7c-9477-f370-8fbd-ce8ef15188b1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:S4Magus5iVB7A/3HjqzU9h7iO3+zDZz8Fom6lDp95WYIGBug4nN
 75Z+K0t6EoVgSE03r91wssD5swxiLRIKp4nL0Tvcv58a8NfUURZO48IDwJA5TpPanVEBY6U
 lqRSvOBRVGYQHeUmlNJ7jf9x2yYLgD+CJbXOwCQCUx+bNTd6jBj3ubFPcouJw0X8NLOzgKC
 Vl1v5LqB0Q1afibhnuR7g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YUfW6Jymwu0=:mWF+wApwLToD13uqyydVmw
 yz0tjJoinmtzo4QIhnPsrrVq/xqVc9A+HNCgOLzb2LqtYsgzgc704Kj0XH8O3FCJblYa0A7BN
 FMrWWjo/v76RpnKOd/RRNnjISy7mK3SIG3XEkHB4GaOdIPYrwVd8ar4+xLgoz/Ssoyx+1fMqQ
 9+aFLozd/3oApFaARTLL72FHJoW1mp7rDch9R4ua9Kg/6gPKgnyyvq+WZJj9YjKscLqrqZBaP
 H98QtUMaAK3Yd7hMGH5NCndv6IDa2T/nxorz5RdTrLAP1aLE+sQMbq2u2OH5OBmcGf4Pq1CUB
 1bbpIqWno1/TNZ1+EkLTwYWhRc99d2QaLE0p8cPymTJWEdbhAtajlHRFGVo5BfJRhWRt8KhDc
 KCJwjx8dlOLNmS36mvZPRs58+Clg9yyCDhcMBbWc1JQMQhAZK7CYIMy0TaaliYArvfPCnv04h
 cAM9BcRwKI50mRc/sWfAkJgE0mOhtmYSlT4/+v/uVOlgfLqGwK4f
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15.02.21 02:12, Frank Rowand wrote:

> Why not compile in ACPI data (tables?) instead of devicetree description?

The problem is a bit more complex than it might seem.

Let's take the APU2/37/4 boards as an example. They've got some aux
devices, eg. some gpio controller, and some things (leds, keys, reset
lines, etc) attached to it.

Now we've got lots of different bios versions in the field,
enumerating only some of the devices. For example, older ones didn't
even contain the gpio, later ones added just gpio, other ones just
added LEDs (with different names than the Linux driver already mainlined
and field-deployed at that time), but still other lines unhandled, etc, 
etc. etc.

A big mess :( And I can't ask everybody to do bios uprade on devices far
out in the field (litterally open field, sometimes offshore, ...). So, I
need a usable solution, that's also maintainable, w/o testing each
single combination of board, bios, etc. IOW: without relying on bios
(except for board identification)

OTOH, I'm also looking for a solution get rid writing those kind of
relatively huge board drivers, that pretty are much like old fashioned
board files from pre-DT times - just made up of lots of tables and
a few trivial register-something calls. Sounds pretty much like the
original use case of oftree.

The primary difference between classic oftree and this scanario:
* this is additional to existing platform information, which is
   incomplete or even incorrect (and that can't be fixed)
* extra carrier boards that are detected by other means, but no
   enumeration of the devices on it.

>> This is something I've wanted to see for a while. There's use cases
>> for DT based systems too. The example I'd like to see supported are
>> USB serial adapters with downstream serdev, GPIO, I2C, SPI, etc. Then
>> plug more than one of those in.
> 
> My understanding from the past is that the experts (those who understand both
> devicetree and ACPI) regard trying to mix devicetree and ACPI in a single
> running Linux kernel image is insanity, or at least likely to be confusing,
> difficult, and problematic.

Well, mixing different, overlapping data sources tends to be tricky. The
same problem exists with the classic approach of hand-written board
drivers. So there have to be clear border lines.

In my case (eg. apu2+ boards), the overlap is only that some bios
versions enumerate the gpio chip, others even some of the gpio-based
devices. I'm attempting to solve this by just kicking out those
duplicate devices, if they exist. The alternative could be leaving them
in an trying to bind the missing ones to them. But that would be really
complicatd and needs to be well crafted for lots of different board and
bios versions - a kind of complexity we wanna avoid.

My use cases are actually a bit easier than the average dt overlay
cases, as I have almost no interactions with already existing devices
(except that some specific devices have to be moved out of the way)

The original DT overlay use case, arbitrary expansion boards (eg. on
raspi), are trickier, if the overlays shall be generic over a wider
range of base boards (eg. same overlay for any raspi or odroid).
This is something calling for an own (pseudo-)bus type that handles
the correct probing ... I've hacked up something similar for the APU2+'s
combined msata/usb/mpcie ports.

BTW: I've already been thinking of ways for internally transforming ACPI
tables into DT data structures (struct device_node) at an early point,
before probing. But that would be another research project with unknown
outcome, and most likely a HUGE change. Not what I'm talking about now.

> From the devicetree side, I expect nightmares for me if devicetree and ACPI
> are mixed in a single running kernel image.

Note that I'm not talking about arbitrary configurations. Just re-using
existing device tree code to express things that are currently open
coded C into DT.

It's NOT trying to boot an ACPI-based machine with DT. (which would be
yet another research project)

> Multiple root nodes and disjoint trees both seem problematic.  Existing
> subsystems and drivers expect a single cohesive tree.  Changing that
> architecture looks to me to be a painful exercise.

Yes, it's not entirely trivial, but managable. My experiments seemed to
work so far, and I couldn't see general blockers yet. Drivers usually
expect certain sub-nodes, but haven't found any that expect their node
being embedded in some other one. (maybe there really are some, but the
likehood that they're applicable in these use cases looks pretty low).


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
