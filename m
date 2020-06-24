Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F11F2074D8
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 15:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391029AbgFXNqv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 09:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390933AbgFXNqv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 09:46:51 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE99FC061573;
        Wed, 24 Jun 2020 06:46:50 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 662FE23076;
        Wed, 24 Jun 2020 15:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1593006407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nsHzBggZvOZK2UQRWliQHDUQLUPL8ZE+00z/UsJFn1I=;
        b=fql7ZIJvpyPIcpNqwoG5pY6sFGJK658EgHbzWK0YIAlaK9TEkqpuYPCdoauKRPR56giMlt
        qVabBRtud/4ohSpTJAkrqnqn5GZGZ0TUz1e6louNC/lwdU9KLHbXAbj6gMYACIVScWi5NE
        JYObZe1D+k5YUqy+6N3jAj48TJNTgog=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Jun 2020 15:46:47 +0200
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sungbo Eo <mans0n@gorani.run>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] gpio: add GPO driver for PCA9570
In-Reply-To: <CAHp75Vfc2udv2mLLJCFO6P+n8_kcO7OZKhH_XkOy7Cf4fnxgtA@mail.gmail.com>
References: <20200623060526.29922-1-mans0n@gorani.run>
 <80bbca9a625b2a0feb9b816906549b7c@walle.cc>
 <2291c01d-30df-518e-a952-644bd955f1f3@gorani.run>
 <69f5d1a1970838b8c4bd8d6e8dba6cac@walle.cc>
 <CAHp75Vfc2udv2mLLJCFO6P+n8_kcO7OZKhH_XkOy7Cf4fnxgtA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <9956439a3c887dde7b2b8fa48de20db2@walle.cc>
X-Sender: michael@walle.cc
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

Am 2020-06-24 15:33, schrieb Andy Shevchenko:
> On Tue, Jun 23, 2020 at 3:48 PM Michael Walle <michael@walle.cc> wrote:
>> Am 2020-06-23 14:22, schrieb Sungbo Eo:
>> > On 2020-06-23 17:31, Michael Walle wrote:
>> >> Am 2020-06-23 08:05, schrieb Sungbo Eo:
> 
> ...
> 
>> >> Did you have a look at drivers/gpio/gpio-regmap.c ? Your driver seems
>> >> to be simple enough to be easily integrated with that. If you need a
>> >> blueprint; because at the moment there is no driver in the kernel
>> >> using that, you could have a look at:
>> >> https://lore.kernel.org/linux-gpio/20200604211039.12689-7-michael@walle.cc/
>> >
>> > Thanks for your advice. I didn't really know what regmap is for...
>> > It seems gpio-regmap is for gpio controllers having val/dir registers.
>> > But pca9570 does not use port registers. The master only sends a data
>> > byte without reg address.
>> 
>> Ahh I missed that :(
>> 
>> > I'm not sure how to apply gpio-regmap or
>> > regmap-i2c here.
>> > I'll try to investigate if setting reg_size or reg_bits to zero is
>> > possible.
>> >
>> > Please correct me if I'm in the wrong direction.
>> 
>> That won't work because the underlying regmap expects the address bits
>> to be either 8 or 16. In this case I'd guess gpio-regmap, doesn't make
>> sense, because there is actually no real gain.
> 
> From the DS:
> "The device acknowledges and the master sends the data byte for P7 to
> P0 and is acknowledged by the device. Writes to P7 to P4 are ignored
> in the PCA9570 as only P3 through P0 are available. The 4-bit data is
> presented on the port lines after it has been acknowledged by the
> device. The number of data bytes that can be sent successively is not
> limited. The previous data is overwritten every time a data byte has
> been sent."
> 
> So, basically writing to the register the value of register can
> simulate register map, but the question is do we gain anything from
> that abstraction because it means that all 256 (or 16 for 4-bit
> variant) registers are possible?

Mh? I can't follow you. Port means a physical I/O port, if I
read the datasheet correctly. And because that is a 4 port IO
expander only the lower four bits are used. I'd guess if it is
a 8 port IO expander all bits would be used. (Actually, its
output only.)

So you just write one byte of data (or you might repeat it, but
that is just as if you start a new i2c transaction, just that
you save the i2c addressing).

-michael
