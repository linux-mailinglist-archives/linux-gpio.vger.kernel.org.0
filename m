Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029881E6807
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 19:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405261AbgE1RDL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 13:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405249AbgE1RDG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 13:03:06 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82581C08C5C6;
        Thu, 28 May 2020 10:03:06 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 36CAE22F00;
        Thu, 28 May 2020 19:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1590685383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kRkWyHSLP+PL3/CxPz0W0cQ0NOZCetcZm+7o0UT7twM=;
        b=tbyE9CsEUfcgu9qiNTD4RRHyuT8jaCqXf8fhiMhYakyCflnyrP0+rzLBNxzepbyDYFU9CU
        QF4t94w/I1IbVDRB5XsmMo7TWtt02BuApwgCcqtFPGXslSpZp/RlloZPIkCUubSAGfWyAm
        1qI5UU0X5vczZ2464tBCKGymJPCVVeE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 28 May 2020 19:03:02 +0200
From:   Michael Walle <michael@walle.cc>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 2/3] gpio: add a reusable generic gpio_chip using
 regmap
In-Reply-To: <adb4eba6-c6c4-a403-dead-1951050eec26@linux.intel.com>
References: <20200528145845.31436-1-michael@walle.cc>
 <20200528145845.31436-3-michael@walle.cc>
 <adb4eba6-c6c4-a403-dead-1951050eec26@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <7d281a1e30ea40837ab1a156c561ca6b@walle.cc>
X-Sender: michael@walle.cc
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2020-05-28 17:55, schrieb Pierre-Louis Bossart:
>> +    /* if we have a direction register we need both input and
>> output */
>> +    if ((config->reg_dir_out_base || config->reg_dir_in_base) &&
>> +        (!config->reg_dat_base || !config->reg_set_base))
>> +        return ERR_PTR(-EINVAL);
>  This failed for me since I didn't have the 'dat' base assigned. I
> still can't figure out what 'dat' stands for...I just assigned it to
> the same offset as the 'set' base but really don't understand what
> this is supposed to do.

DAT is the data register, aka input register, if the GPIO is in input
mode.

If I read the datasheet correctly you should use the following:

PCM512x_GPIO_EN should be reg_dir_out_base
PCM512x_GPIO_CONTROL_1 should be reg_set_base
PCM512x_GPIN should be reg_dat_base

no custom xlate necessary. GPIN looks a bit fishy in that datasheet:
  http://www.ti.com/lit/ds/symlink/pcm5121.pdf?ts=1590684141147

PCM512x_GPIO_OUTPUT_1..6 is pinmux control and shouldn't be part of
the gpio-regmap. Your driver needs to take care of that.

>> +
>> +    /* we don't support having both registers simultaneously for
>> now */
>> +    if (config->reg_dir_out_base && config->reg_dir_in_base)
>> +        return ERR_PTR(-EINVAL);
> 
> and this second test seems to contradict the notion of 'both input and
> output' above?

dir_out_base is used if the register is high active to select an output.
dir_in_base is used for a low active register. Thus both bases are used
to switch a GPIO between input and output.

> re-adding comment from previous series:
>  >> I still have a series of odd warnings I didn't have before: >> >>
> [  101.400263] WARNING: CPU: 3 PID: 1129 at >>
> drivers/gpio/gpiolib.c:4084 gpiod_set_value+0x3f/0x50 >> >> This seems
> to come from >>     /* Should be using gpiod_set_value_cansleep() */
>>>     WARN_ON(desc->gdev->chip->can_sleep); > > Right now,
> gpio-regmap hardcodes can_sleep to true. But the only regmap > which
> don't sleep is regmap-mmio. The PCM512x seems to be either I2C or >
> SPI, which can both sleep. So this warning is actually correct and >
> wherever this gpio is set should do it by calling the _cansleep() >
> version.
> 
> I still have the warnings with this version, not sure if you wanted to
> fix it in the v6 or is this needs to be fixed in another piece of
> code/patch. How would we go about removing this warning?

There is no fix in gpio-regmap. wherever this GPIO is connected to must
not call gpiod_set_value() but have to use gpiod_set_value_cansleep().

-michael
