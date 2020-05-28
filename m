Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E661E69B4
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 20:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405942AbgE1Sq3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 14:46:29 -0400
Received: from mga04.intel.com ([192.55.52.120]:49491 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405901AbgE1Sq2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 May 2020 14:46:28 -0400
IronPort-SDR: ugP8DY17GIWoUQ94zsvGRMmbDmzzusr2+4uEaF8fndC81k6ckZPrNBrv6vFRaLQ9rsFBWvv7ba
 /CLyLYGEfaHA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 11:46:27 -0700
IronPort-SDR: x9hFq4CaKByj5b+UNBLppyjZw6vF0xYhQMH8mXwb2Dg3bCdhuKQaFb02Ic4S+hekwVV/QLt3Vh
 wDNBIei/GfJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,445,1583222400"; 
   d="scan'208";a="302570748"
Received: from jorycorx-mobl.amr.corp.intel.com (HELO [10.254.102.46]) ([10.254.102.46])
  by fmsmga002.fm.intel.com with ESMTP; 28 May 2020 11:46:27 -0700
Subject: Re: [PATCH v6 2/3] gpio: add a reusable generic gpio_chip using
 regmap
To:     Michael Walle <michael@walle.cc>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20200528145845.31436-1-michael@walle.cc>
 <20200528145845.31436-3-michael@walle.cc>
 <adb4eba6-c6c4-a403-dead-1951050eec26@linux.intel.com>
 <7d281a1e30ea40837ab1a156c561ca6b@walle.cc>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6cec4ed5-3a4a-62d8-5209-da3b0863dcd1@linux.intel.com>
Date:   Thu, 28 May 2020 13:15:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7d281a1e30ea40837ab1a156c561ca6b@walle.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



>>> +    /* if we have a direction register we need both input and
>>> output */
>>> +    if ((config->reg_dir_out_base || config->reg_dir_in_base) &&
>>> +        (!config->reg_dat_base || !config->reg_set_base))
>>> +        return ERR_PTR(-EINVAL);
>>  This failed for me since I didn't have the 'dat' base assigned. I
>> still can't figure out what 'dat' stands for...I just assigned it to
>> the same offset as the 'set' base but really don't understand what
>> this is supposed to do.
> 
> DAT is the data register, aka input register, if the GPIO is in input
> mode.
> 
> If I read the datasheet correctly you should use the following:
> 
> PCM512x_GPIO_EN should be reg_dir_out_base
> PCM512x_GPIO_CONTROL_1 should be reg_set_base
> PCM512x_GPIN should be reg_dat_base
> 
> no custom xlate necessary. GPIN looks a bit fishy in that datasheet:
>   http://www.ti.com/lit/ds/symlink/pcm5121.pdf?ts=1590684141147

ok, I updated that part - can't test it though with the boards I have, 
only output is supported.

> PCM512x_GPIO_OUTPUT_1..6 is pinmux control and shouldn't be part of
> the gpio-regmap. Your driver needs to take care of that.

yes, that's what I did.

>>> +
>>> +    /* we don't support having both registers simultaneously for
>>> now */
>>> +    if (config->reg_dir_out_base && config->reg_dir_in_base)
>>> +        return ERR_PTR(-EINVAL);
>>
>> and this second test seems to contradict the notion of 'both input and
>> output' above?
> 
> dir_out_base is used if the register is high active to select an output.
> dir_in_base is used for a low active register. Thus both bases are used
> to switch a GPIO between input and output.

ok, makes sense now, thanks for the explanations.

>> re-adding comment from previous series:
>>  >> I still have a series of odd warnings I didn't have before: >> >>
>> [  101.400263] WARNING: CPU: 3 PID: 1129 at >>
>> drivers/gpio/gpiolib.c:4084 gpiod_set_value+0x3f/0x50 >> >> This seems
>> to come from >>     /* Should be using gpiod_set_value_cansleep() */
>>>>     WARN_ON(desc->gdev->chip->can_sleep); > > Right now,
>> gpio-regmap hardcodes can_sleep to true. But the only regmap > which
>> don't sleep is regmap-mmio. The PCM512x seems to be either I2C or >
>> SPI, which can both sleep. So this warning is actually correct and >
>> wherever this gpio is set should do it by calling the _cansleep() >
>> version.
>>
>> I still have the warnings with this version, not sure if you wanted to
>> fix it in the v6 or is this needs to be fixed in another piece of
>> code/patch. How would we go about removing this warning?
> 
> There is no fix in gpio-regmap. wherever this GPIO is connected to must
> not call gpiod_set_value() but have to use gpiod_set_value_cansleep().

yes, I figured this out and corrected the drivers, works just fine now. 
My cleaned-up code is at 
https://github.com/thesofproject/linux/pull/1945, I'll resubmit the v2 
based on these patches when they are merged and available in Mark 
Brown's tree (and I need to address the clock-related feedback).

Thanks for your work Michael, really nice and useful, feel free to add 
the following tag:

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


