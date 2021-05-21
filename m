Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8434938C536
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 12:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhEUKr5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 06:47:57 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:52331 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbhEUKr4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 06:47:56 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 58F492224A;
        Fri, 21 May 2021 12:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1621593989;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=it9Lh4qTlHTGIG1OLO3qNDZWs9VfXzGs2bZWUH5AgQo=;
        b=SFkJistXQkn9Z58NhlcLjUhQmBnfbng/LoGIWWamCHGsu1Y6eIclIFbhQ9QblEznSmJFSL
        YsKSDPhwkD6h3/awcJ8rKjQUzckImCxl3SwY+gkfKVt8RcOrvrmXEdC1Byi38OFezAz2Fs
        Cyu/zaeO/lvZE6M/IOLcR+5x2CKJPl4=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 21 May 2021 12:46:29 +0200
From:   Michael Walle <michael@walle.cc>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     andy.shevchenko@gmail.com,
        linux-power <linux-power@fi.rohmeurope.com>,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
In-Reply-To: <ff905a32b736a0b03fb4c74b7e876c764a561106.camel@fi.rohmeurope.com>
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
 <6e319c22b41747e3911c7a5cad877134cabc9231.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VcZwYdA5R=peC+8jHVT6UDsAT9msSs=W6C7rgfyjGPtXA@mail.gmail.com>
 <8c048bda0ace591d7e91c07ed9155338@walle.cc>
 <ff905a32b736a0b03fb4c74b7e876c764a561106.camel@fi.rohmeurope.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <26eb6b95805840dca05e0135e0555b42@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-21 12:25, schrieb Vaittinen, Matti:
> On Fri, 2021-05-21 at 12:19 +0200, Michael Walle wrote:
>> Am 2021-05-21 12:09, schrieb Andy Shevchenko:
>> > On Fri, May 21, 2021 at 12:53 PM Matti Vaittinen
>> > <matti.vaittinen@fi.rohmeurope.com> wrote:
>> > > Changelog v2: (based on suggestions by Michael Walle)
>> > >   - drop gpio_regmap_set_drvdata()
>> >
>> > But why do we have gpio_regmap_get_drvdata() and why is it
>> > different
>> > now to the new member handling?
>> 
>> Eg. the reg_mask_xlate() callback is just passed a "struct
>> gpio_regmap*".
>> If someone needs to access private data there,
>> gpio_regmap_get_drvdata()
>> is used. At least that was its intention.
> 
> I would help the IC driver here too and just directly provide the
> drvdata pointer as argument. I don't see much value in providing the
> regmap_gpio pointer as IC driver can not dereference it.

What is it with the "it's useless if one cannot dereference it"? You're
also passing "struct regmap *" which you cannot dereference. It's an
opaque pointer you need to pass to gpio_regmap to call a function there.

What is the problem with letting gpio_regmap derefence its internal data
structure and return the value for you?

Adding the drvdata to reg_mask_xlate() highlights my former concern; you
need to keep chaning the users to add another parameter. What if xlate()
needs the regmap, too? Then you need to change it again. Granted this is
a silly example, but you should get my point. It is by far more easy to
just add another new gpio_regmap_*(struct gpio_regmap *) function and
you don't have to change existing users.

Also what if gpio_regmap provides some useful helper function in the
future, it will likely need its internal data struct.

-michael
