Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280FF38C479
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 12:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbhEUKVA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 06:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbhEUKU6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 06:20:58 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD40C061574;
        Fri, 21 May 2021 03:19:32 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 0297D2224A;
        Fri, 21 May 2021 12:19:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1621592370;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8gCxWpqH7S6/JrTXskJUWMEZe31GUIU4AaQGJjfXmbM=;
        b=ep4QJlmbs0+gBfXsbHINRRQAmmjRnfz29yI8nFzGHFIL4BqV/NkEPJzOi2lTEkFCIe7v7r
        MSr66pl8jMBpswzNGb5WtIGEglZ+PzmnC+WeQBfipzgP6TO1djBsnB8twrWS8uGNUUBGiZ
        Le2Gg8nY/Z2PTVIInqWU/TI/sb0YEPk=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 21 May 2021 12:19:29 +0200
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Subject: Re: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
In-Reply-To: <CAHp75VcZwYdA5R=peC+8jHVT6UDsAT9msSs=W6C7rgfyjGPtXA@mail.gmail.com>
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
 <6e319c22b41747e3911c7a5cad877134cabc9231.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VcZwYdA5R=peC+8jHVT6UDsAT9msSs=W6C7rgfyjGPtXA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8c048bda0ace591d7e91c07ed9155338@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-21 12:09, schrieb Andy Shevchenko:
> On Fri, May 21, 2021 at 12:53 PM Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
>> Changelog v2: (based on suggestions by Michael Walle)
>>   - drop gpio_regmap_set_drvdata()
> 
> But why do we have gpio_regmap_get_drvdata() and why is it different
> now to the new member handling?

Eg. the reg_mask_xlate() callback is just passed a "struct 
gpio_regmap*".
If someone needs to access private data there, gpio_regmap_get_drvdata()
is used. At least that was its intention.

Thus I was also suggesting to use "struct gpio_regmap*" in the newer
callbacks.

I don't get what you mean by "different to the new member handling"?

-michael
