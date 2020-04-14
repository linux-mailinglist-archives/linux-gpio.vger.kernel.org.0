Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB86A1A8903
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 20:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503740AbgDNSQp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 14:16:45 -0400
Received: from mga03.intel.com ([134.134.136.65]:40953 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503713AbgDNSQn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 14:16:43 -0400
IronPort-SDR: qjORtmUYUziN2x/wWppQlws+D6uAZnySkmy0FVoFCykOdVmzMez3//8RMkxn3wbxEU8HjcVQ3W
 LHjBJ9FnBPYA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 11:16:40 -0700
IronPort-SDR: UTuFLX3YOUg8m9hrWrHUhi1cMN2h/wTqDRLz9NHdi6CPDlX7fPOuzVtWbxYKhaZV2FS9Ax5d7P
 ElkvrfUZ78EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="253272826"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40]) ([10.212.190.40])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 11:16:34 -0700
Subject: Re: [RFC PATCH 01/16] ASoC: pcm512x: expose 6 GPIOs
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org, tiwai@suse.de,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Hui Wang <hui.wang@canonical.com>,
        Matthias Reichl <hias@horus.com>, broonie@kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-2-pierre-louis.bossart@linux.intel.com>
 <20200414170934.GA34613@smile.fi.intel.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <31e956de-8f62-1857-5153-b163ff7d56e1@linux.intel.com>
Date:   Tue, 14 Apr 2020 12:52:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414170934.GA34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



>> +static int pcm512x_gpio_get_direction(struct gpio_chip *chip,
>> +				      unsigned int offset)
>> +{
>> +	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	ret = regmap_read(pcm512x->regmap, PCM512x_GPIO_EN, &val);
>> +	if (ret < 0)
>> +		return ret;
> 
>> +	val = (val >> offset) & 1;
>> +
>> +	/* val is 0 for input, 1 for output, return inverted */
>> +	return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> 
> This better to read as simple conditional, like
> 
> 	if (val & BIT(offset))
> 		return ..._OUT;
> 	return ..._IN;
> 
>> +}

ok

> 
> ...
> 
>> +static int pcm512x_gpio_direction_output(struct gpio_chip *chip,
>> +					 unsigned int offset,
>> +					 int value)
>> +{
>> +	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
>> +	unsigned int reg;
>> +	int ret;
>> +
>> +	/* select Register GPIOx output for OUTPUT_x (1..6) */
>> +	reg = PCM512x_GPIO_OUTPUT_1 + offset;
> 
>> +	ret = regmap_update_bits(pcm512x->regmap, reg, 0x0f, 0x02);
> 
> Magic numbers detected.
> 
>> +	if (ret < 0)
> 
> Drop unnecessary ' < 0' parts where it makes sense, like here.

did you mean use  if (ret) or drop the test altogether?

There's no standard style for regmap functions so I used what was used 
in the rest of this driver.

Mark?

> 
>> +		return ret;
>> +
> 
>> +	/* enable output x */
> 
> (1)
> 
>> +	ret = regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_EN,
>> +				 BIT(offset), BIT(offset));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* set value */
> 
> (2)
> 
> With this (1)->(2) ordering it may be a glitch. So, first set value (if
> hardware allows you, otherwise it seems like a broken one), and then switch
> it to output.

good suggestion, thanks.

> 
>> +	return regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_CONTROL_1,
>> +				  BIT(offset), value << offset);
> 
> You are using many times BIT(offset) mask above, perhaps
> 	int mask = BIT(offset);
> 
> Also, more robust is to use ternary here: 'value ? BIT(offset) : 0'.
> Rationale: think what happen with value != 1 (theoretical possibility in the
> future).

ok

> 
>> +}
> 
> ...
> 
>> +static int pcm512x_gpio_get(struct gpio_chip *chip, unsigned int offset)
>> +{
> 
>> +	return (val >> offset) & 1;
> 
> Don't forget to use BIT() macro.
> 
> 	return !!(val & BIT(offset));

There's a point where this becomes less readable IMHO, but fine.
The !! gives me a headache...

>> +static void pcm512x_gpio_set(struct gpio_chip *chip, unsigned int offset,
>> +			     int value)
>> +{
>> +	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
>> +	int ret;
>> +
>> +	ret = regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_CONTROL_1,
>> +				 BIT(offset), value << offset);
> 
> value ? BIT(offset) : 0

ok

> 
>> +	if (ret < 0)
> 
>> +		pr_debug("%s: regmap_update_bits failed: %d\n", __func__, ret);
> 
> No __func__ in debug messages.
> Use dev_dbg() when we have struct device available.

Not sure we do, will look into this.

>> +static const struct gpio_chip template_chip = {
> 
> Give better name, please. E.g. pcm512x_gpio_chip.

ok

>> +	/* expose 6 GPIO pins, numbered from 1 to 6 */
>> +	pcm512x->chip = template_chip;
>> +	pcm512x->chip.parent = dev;
>> +
>> +	ret = devm_gpiochip_add_data(dev, &pcm512x->chip, pcm512x);
> 
>> +	if (ret != 0) {
> 
> if (ret)

ok
