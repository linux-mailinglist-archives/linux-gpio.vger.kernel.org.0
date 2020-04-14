Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0FF11A8907
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 20:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503744AbgDNSQw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 14:16:52 -0400
Received: from mga17.intel.com ([192.55.52.151]:37743 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503741AbgDNSQu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 14:16:50 -0400
IronPort-SDR: N+/RFgr1MukL5Uk8Dd86ZhQKqw7i3pnpuLByiv+NdAt1RqUlCRzMJYUsBgs3RrRZHX50oEYMRk
 L0tT8qd2WB/Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 11:16:49 -0700
IronPort-SDR: /zzOMGLyZlN9FAnCZYZ6we8qJCwRUlhg2Zfn/adASU2GUBV2fVkkGPRd4QbB+J+bkdZJKOGUjR
 vs07wIwlJtGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="253272874"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40]) ([10.212.190.40])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 11:16:46 -0700
Subject: Re: [RFC PATCH 03/16] ASoC: Intel: sof-pcm512x: use gpiod for LED
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-4-pierre-louis.bossart@linux.intel.com>
 <20200414171752.GC34613@smile.fi.intel.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <92636c24-32d5-3ec6-23db-e7f9e22f66dc@linux.intel.com>
Date:   Tue, 14 Apr 2020 12:57:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414171752.GC34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


>> +static struct gpiod_lookup_table pcm512x_gpios_table = {
>> +	/* .dev_id set during probe */
>> +	.table = {
> 
>> +		GPIO_LOOKUP("pcm512x-gpio", 3, "PCM512x-GPIO4", GPIO_ACTIVE_HIGH),
> 
> It says GPIO 4 and here is number 3.
> Does this 4 come from hardware documentation?

Yes TI count from 1 to 6 in their documentation. The initial HifiBerry 
DAC+ also counts from 1 to 6. I can add a comment here.

> 
>> +		{ },
> 
> No comma for terminator entries.

ok

> 
>> +	},
>> +};
> 
> ...
> 
>> +	gpiod_add_lookup_table(&pcm512x_gpios_table);
> 
> Where is the counterpart gpiod_remove_lookup_table() call?

Ah that's a miss, thanks for flagging this. I remember looking but 
obviously needed a coffee at the time.

>> +	ctx->gpio_4 = devm_gpiod_get(&pdev->dev, "PCM512x-GPIO4",
>> +				     GPIOD_OUT_LOW);
> 
> Can driver work without this GPIO? If so, perhaps devm_gpiod_get_optional().

that part yes, it's only for the LED, but if this fails then probably 
the rest of the code will also fail.
> 
>> +	if (IS_ERR(ctx->gpio_4)) {
>> +		dev_err(&pdev->dev, "gpio4 not found\n");
>> +		ret = PTR_ERR(ctx->gpio_4);
>> +		return ret;
>> +	}
> 
