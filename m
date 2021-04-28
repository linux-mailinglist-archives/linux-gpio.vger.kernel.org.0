Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B54936D6DC
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Apr 2021 13:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhD1L6F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Apr 2021 07:58:05 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:57419 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhD1L6E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Apr 2021 07:58:04 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id BD3D02224D;
        Wed, 28 Apr 2021 13:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1619611037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LrQHlprmkD2xcUEnCaN568r9Gg08TWxdqim99Whappg=;
        b=pYBDcFwPltyIGPdBlApAfXgdLZzgOL7xj8nXFdWB8iswVXOAW1Hh/pTucxsqHZXbV4A8He
        X6r7rsFYtU70m0jfTZAoI066JzK6CHXlqXEMxcT+iUmr7EggOoTKSOJuNhy9BkW77+tHnP
        7PTah4JaE2a0O7UcSWQ8B7jc4siC2cQ=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 28 Apr 2021 13:57:17 +0200
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] gpio: Add support for IDT 79RC3243x GPIO
 controller
In-Reply-To: <CAHp75VdmTxvQBU4X8s-6csYgwM8ACth9Ao0GYjUH7+0Q0tyFyg@mail.gmail.com>
References: <20210426095426.118356-1-tsbogend@alpha.franken.de>
 <CAHp75VdRfPPj2pu4GOBVG4+bGUsCRLXYPsFjMwFOYfUTZuvJaQ@mail.gmail.com>
 <6f6bce2f070998db49acca2f6611727b@walle.cc>
 <CAHp75VdmTxvQBU4X8s-6csYgwM8ACth9Ao0GYjUH7+0Q0tyFyg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ebbbe74fe638e1a6ab7c1547870f4b31@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-04-28 13:07, schrieb Andy Shevchenko:
> On Wed, Apr 28, 2021 at 1:51 AM Michael Walle <michael@walle.cc> wrote:
>> Am 2021-04-26 12:29, schrieb Andy Shevchenko:
>> > On Mon, Apr 26, 2021 at 12:55 PM Thomas Bogendoerfer
>> > <tsbogend@alpha.franken.de> wrote:
>> >
>> > 2) there is gpio-regmap generic code, that may be worth
>> > considering.
>> 
>> This driver uses memory mapped registers. While that is
>> also possible with gpio-regmap, there is one drawback:
>> it assumes gpiochip->can_sleep = true for now, see [1].
>> Unfortunately, there is no easy way to ask the regmap
>> if its mmio/fastio.
> 
> I don't see how it is an impediment.

You'd have to use the *_cansleep() variants with the gpios,
which cannot be used everywhere, no?

-michael
