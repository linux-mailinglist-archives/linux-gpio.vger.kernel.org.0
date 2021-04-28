Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1477936D938
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Apr 2021 16:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239147AbhD1OFU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Apr 2021 10:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhD1OFU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Apr 2021 10:05:20 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0DAC061573;
        Wed, 28 Apr 2021 07:04:34 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id B78632224D;
        Wed, 28 Apr 2021 16:04:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1619618672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=chFDx8DLygr7BeMNJ5Y2+mrFjaqKbsXAp4rGczBn/rQ=;
        b=vYlIDouezddpBiLL9zI0HYbdVdOoorgyNAHvd3xgiWorddQWsmAQftY2OkK7Tm2aItXHno
        u2l7DiS7sWl2GEWGf6RARulLv2uOQknl0R+q3bW4xxS1D9qhMPwaztPZJFOTysmFvir8TN
        PQvTfSfjlv2Lu8ZIJvEOMN/85Z4tsPA=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 28 Apr 2021 16:04:32 +0200
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] gpio: Add support for IDT 79RC3243x GPIO
 controller
In-Reply-To: <CAHp75VcXEu2YGOoL70zueEgARCe8D+Q=CFsN62-vFK5svjJAQA@mail.gmail.com>
References: <20210426095426.118356-1-tsbogend@alpha.franken.de>
 <CAHp75VdRfPPj2pu4GOBVG4+bGUsCRLXYPsFjMwFOYfUTZuvJaQ@mail.gmail.com>
 <6f6bce2f070998db49acca2f6611727b@walle.cc>
 <CAHp75VdmTxvQBU4X8s-6csYgwM8ACth9Ao0GYjUH7+0Q0tyFyg@mail.gmail.com>
 <ebbbe74fe638e1a6ab7c1547870f4b31@walle.cc>
 <CAHp75VcXEu2YGOoL70zueEgARCe8D+Q=CFsN62-vFK5svjJAQA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <880011ffd80ae7d1a32e7a17d405b987@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-04-28 15:44, schrieb Andy Shevchenko:
> On Wed, Apr 28, 2021 at 2:57 PM Michael Walle <michael@walle.cc> wrote:
>> 
>> Am 2021-04-28 13:07, schrieb Andy Shevchenko:
>> > On Wed, Apr 28, 2021 at 1:51 AM Michael Walle <michael@walle.cc> wrote:
>> >> Am 2021-04-26 12:29, schrieb Andy Shevchenko:
>> >> > On Mon, Apr 26, 2021 at 12:55 PM Thomas Bogendoerfer
>> >> > <tsbogend@alpha.franken.de> wrote:
>> >> >
>> >> > 2) there is gpio-regmap generic code, that may be worth
>> >> > considering.
>> >>
>> >> This driver uses memory mapped registers. While that is
>> >> also possible with gpio-regmap, there is one drawback:
>> >> it assumes gpiochip->can_sleep = true for now, see [1].
>> >> Unfortunately, there is no easy way to ask the regmap
>> >> if its mmio/fastio.
>> >
>> > I don't see how it is an impediment.
>> 
>> You'd have to use the *_cansleep() variants with the gpios,
>> which cannot be used everywhere, no?
> 
> *can* sleep means that it requires a sleeping context to run, if your
> controller is fine with that, there are no worries. OTOH if you want
> to run this in an atomic context, then consumers can't do with that
> kind of controller.

Ok, then we are on the same track.

> What I meant above (and you stripped it here) is
> to add a patch that will fix that and set it based on
> gpio_regmap_config.

Yes, but ideally, it would ask the regmap. Otherwise that
information is redundant and might mismatch, i.e. gpio_regmap_config
tell can_sleep=false but the regmap is an I2C type for example. Also
if a driver wants to support both regmap types, we are no step
further.

-michael
