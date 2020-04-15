Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88A21AAB1D
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 17:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387800AbgDOO5K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:57:10 -0400
Received: from mga17.intel.com ([192.55.52.151]:60655 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S371202AbgDOO5J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:57:09 -0400
IronPort-SDR: 2Gvm1dA03VSQvTUL2wyt+uIlhnJgx9WbJfj7E9h0Hh4JOhQ2y5BsgxIpWdn86k6g8kQd/ZHsxN
 /UpCVQ4T0mjg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:57:09 -0700
IronPort-SDR: vTZGDdDuMV+ybxPP4XZua6xk6dUN/yHLuEGjn3AQCYHjh1uACWaSCt7N6rt09jcVkdqBHiXq2/
 UTKYIoOEExpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="400337197"
Received: from ccarey-mobl.amr.corp.intel.com (HELO [10.209.36.121]) ([10.209.36.121])
  by orsmga004.jf.intel.com with ESMTP; 15 Apr 2020 07:57:07 -0700
Subject: Re: [RFC PATCH 04/16] ASoC: Intel: sof-pcm512x: detect Hifiberry DAC+
 PRO
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, Matthias Reichl <hias@horus.com>,
        tiwai@suse.de, Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Daniel Matuschek <daniel@hifiberry.com>,
        linux-clk@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        broonie@kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-5-pierre-louis.bossart@linux.intel.com>
 <20200414172002.GD34613@smile.fi.intel.com>
 <d3b154f4-fa8a-50a5-7246-51d31e18c4e6@linux.intel.com>
 <20200415095526.GP34613@smile.fi.intel.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <664999e7-f345-7296-feca-56cb53a27eb1@linux.intel.com>
Date:   Wed, 15 Apr 2020 09:07:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415095526.GP34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 4/15/20 4:55 AM, Andy Shevchenko wrote:
> On Tue, Apr 14, 2020 at 01:02:12PM -0500, Pierre-Louis Bossart wrote:
>> On 4/14/20 12:20 PM, Andy Shevchenko wrote:
>>> On Thu, Apr 09, 2020 at 02:58:29PM -0500, Pierre-Louis Bossart wrote:
> 
> ...
> 
>>>> +	ctx->sclk = devm_clk_get(rtd->card->dev, "sclk");
>>>
>>> Is this in the bindings?
>>
>> Not for now. the 'sclk' part is only used by me myself and I in an ACPI
>> context. I can add this description if desired.
> 
> Unfortunately you need to add this to the bindings, because it's a part of it
> and somebody may use it outside of your scope.

ok


>>>> +	if (IS_ERR(ctx->sclk)) {
>>>
>>>> +		dev_info(dev, "Could not get SCLK, will operate in SOC master mode\n");
>>>
>>> Sounds like devm_clk_get_optional().
>>
>> I am not sure about the semantic here. This driver selects the one which
>> implements this clock, so if we get a -ENOENT return it's a very bad sign.
>> Not sure what suppressing the error and converting to NULL would do?
> 
> Same as per GPIO.
> Can it work without this clock? How did it work before your change?
> 
> When you add any hard dependency always ask yourself above questions.

The clock is not required in codec slave mode, it's provided by the SOC.

The clock is required when the codec is configured as master. Without 
these GPIO selection there will be no audio. So yes we could move this 
to devm_clk_get_optional() and change the test to IS_ERR_OR_NULL.



>>>> +		goto skip_dacpro;
>>>> +	}
> 
