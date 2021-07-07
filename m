Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 145733BF117
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jul 2021 22:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhGGU4F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jul 2021 16:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232111AbhGGU4E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Jul 2021 16:56:04 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB61C061574
        for <linux-gpio@vger.kernel.org>; Wed,  7 Jul 2021 13:53:23 -0700 (PDT)
Received: from [192.168.1.109] (47.118-244-81.adsl-dyn.isp.belgacom.be [81.244.118.47])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id CC32522C733;
        Wed,  7 Jul 2021 22:53:20 +0200 (CEST)
Message-ID: <dee12a4f5dc1a37feb14e20074cf365dbb86bc05.camel@svanheule.net>
Subject: Re: [PATCH v5 2/8] gpio: regmap: Add quirk for aliased data
 registers
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Wed, 07 Jul 2021 22:53:19 +0200
In-Reply-To: <CAHp75VeOMb2xUJ+g2UQJnBybmehmYr0dGPEzDZObUGr=Q95+wA@mail.gmail.com>
References: <cover.1623532208.git.sander@svanheule.net>
         <5d8e5e8a29ecf39da48beb94c42003a5c686ec4e.1623532208.git.sander@svanheule.net>
         <CAHp75VeOMb2xUJ+g2UQJnBybmehmYr0dGPEzDZObUGr=Q95+wA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy, Mark,

My apologies for the delay in replying, work has been keeping me a bit busy.

On Sun, 2021-06-13 at 00:29 +0300, Andy Shevchenko wrote:
> On Sun, Jun 13, 2021 at 12:13 AM Sander Vanheule <sander@svanheule.net> wrote:
> > 
> > Some chips have the read-only input and write-only output data registers
> > aliased to the same offset. As a result it is not possible to perform
> > read-modify-writes on the output values, when a line is still configured
> > as input.
> > 
> > Add a quirk for aliased data registers, and document how the regmap
> > should be set up for correct operation.
> 
> I still believe that there is no issue with gpio-regmap and we don't
> need any quirk there.
> 
> The issue is in the regmap APIs (implementation) itself. Hardware with
> the concept of reading X / writing Y at the same offset is okay per
> se. regmaps doesn't support it properly and should be fixed (amended)
> in a way that you provide this kind of register description thru
> regmap configuration or so.

I've made an attempt at implementing a "regmap_aliased()", similar to
"regmap_volatile()". However, this meant I had to make _regmap_read() aware of
wether the read- or write-alias was being read (from cache), touching some parts
of the regmap code I'm not using myself. Furthermore, this "aliased" property
isn't really perpendicular to "volatile", since writes should never be volatile,
and non-volatile reads don't make much sense (to me) on a read-only register.

In addition to entire registers having different meanings on reads or writes,
individual bitfields could also have different properties. Some bits of a
register could be aliased, while other bits are just 'plain' volatile. This is
the case for the last register of the RTL8231, where the low bits are GPIO data
(so aliased), and the highest bit is a self-clearing "latch new data" command
bit (i.e. RW-volatile).

If a regmap_field could overwrite the specifiers of it's parent register, I
think this may provide quite a natural solution to the aliasing problem: just
create two regmap_field defintions. One definition would be 'write-only' (and
cached for RMW), the other 'volatile read-only'. All regmap_fields could still
rely on a single cached register value, I think. I didn't try to implement this
though, so maybe I'm missing some behaviour that would disqualify this solution.
Would you think this could be an acceptable way to move forward here?


> I expressed the idea of trying to implement regmap-8250 as an example
> of the support for such hardware. And OTOH that this kind of hardware
> is not unusual.

This implementation indeed requires the same aliasing support, in addition to
register paging even. I've never touched that subsystem before though, so I
would need some more time if I wanted to try this.

Best,
Sander

