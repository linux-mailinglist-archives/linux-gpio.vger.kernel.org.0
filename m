Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6C7319DC1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 12:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhBLL7L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 06:59:11 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:49311 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbhBLL5p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 06:57:45 -0500
Received: from [192.168.1.155] ([77.9.136.38]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MtfRp-1m2DDQ1vWp-00v86A; Fri, 12 Feb 2021 12:54:51 +0100
Subject: Re: [RFC PATCH 11/12] platform/x86: skeleton for oftree based board
 device initialization
To:     Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
References: <20210208222203.22335-1-info@metux.net>
 <20210208222203.22335-12-info@metux.net>
 <CACRpkdYbOX_RDqwxaiugtYB4vSpSKChvKsPjcB_vv3Q74QeG2Q@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <c5ed2b27-21a2-5a07-8dd9-e080f9a6cd98@metux.net>
Date:   Fri, 12 Feb 2021 12:54:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYbOX_RDqwxaiugtYB4vSpSKChvKsPjcB_vv3Q74QeG2Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Npo/PU7UdIpTpagqXDvQYHTvyeYgYpL3AhZrbNJI23XzTyfeuFE
 THes8swi8Le3F2P/ubGpPoYak7vaedItBxpsgGCM0TeLONNoEft33fPoSTjC5S3Zcq3S5c/
 YLZVZ48IvmJV02Z4TIQNduQuz6fm+S8pRAqf22GzYLstAbXK6cap/ZWVZTrZhBSvBSa8MDt
 TciwW/8TStMGki1KwecmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WDiPXQt54Es=:9IYQdYBamq+Xb6JVydt0yX
 ngDglnl/G7B9zcWXfFAYw3vIA+SYhpAr2lxBW7g5cG5tQtTd3mc8u3HXqIrk0iUvPal14pbfB
 h9eMjHvayGDcI9KYyoDTK6S2rprl0pV3qFdh9mfIaregLKrA0+RkxP/IXezCXOB3EXp0Hp28f
 RfXg5/bDBpcbQL/V9U6F2q24m44Icp76OfMcbuAlny2mN/QqVIjgLQ1cXBpOtlYbG/1U0vKEG
 mqTm+rEE0/61L7v0aZM+TsiBw0XrFcqs3ygd8CB+ZIpoi9Y7jnzsWWthpqc5abnrnAa6pJclz
 oEWC0b1dYVOzcFv/jyWL4F338dIL3WZmUNLaKq8+k1omHiWVK9DqW0VsrWBj8YC6dom4kphZT
 QKJpbqxlbi8LQlkgvXKiZvYukbTH3R04OhMt/ostar8OWMbL7jbMdc0M7FE2A
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12.02.21 10:58, Linus Walleij wrote:

Hi,

> I think Intel people often take the stance that the ACPI DSDT (or whatever)
> needs to be fixed.

It should, actually board/firmware vendors should think more carefully
and do it right in the first place. But reality is different. And
firmware upgrade often is anything but easy (as soon as we leave the
field of average Joh Doe's home PC)

> If the usecase is to explicitly work around deployed firmware that cannot
> and will not be upgraded/fixed by describing the hardware using DT
> instead, based on just the DMI ID then we should spell that out
> explicitly.

Okay, maybe I should have stated this more clearly.

OTOH, the scope is also a little bit greater: certain external cards
that don't need much special handling for the card itself, just
enumerate devices (and connections between them) using existing drivers.

That's a pretty common scenario in industrial backplane systems, where
we have lots of different (even application specific) cards, usually
composed of standard chips, that can be identified by some ID, but
cannot describe themselves. We have to write lots of specific drivers
for them, usually just for instantiating existing drivers. (we rarely
see such code going towards mainline).

A similar case (mainlined) seems to be the RCAR display unit - they're
using dt overlays that are built into the driver and applied by it
based on the detected DU at runtime. RCAR seems to be a pure DT
platform, so that's an obvious move. APU2/3/4 is ACPI based, so I went
in a different direction - but I'm now investigating how to make DT
overlays work on an ACPI platform (eg. needs some initial nodes, ...)
In case that's successful, I'll rework my RFC to use overlays, and
it will become much smaller (my oftree core changes then won't be
necessary anymore).

> It feels a bit like fixing a problem using a different hardware description
> just because we can. Look in drivers/gpio/gpiolib-acpi.c
> table gpiolib_acpi_quirks[]. It's just an example how this is fixed using
> fine granular ACPI-specific mechanisms at several places in the kernel
> instead of just tossing out the whole description and redoing it in
> device tree.

I'm quite reluctant to put everything in there. Theoretically, for apu
case, I could prevent enumerating the incomplete gpios there, but the
actual driver setup still remains (certainly don't wanna put that into
such a global place). But the original problem of having to write so
much code for just instantiating generic drivers remains. And
distributing knowledge of certain devices over several places doesn't
feel like a good idea to me.


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
