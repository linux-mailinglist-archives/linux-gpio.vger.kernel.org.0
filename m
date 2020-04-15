Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17E211AAB20
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 17:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392447AbgDOO5N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:57:13 -0400
Received: from mga17.intel.com ([192.55.52.151]:60655 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388734AbgDOO5M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:57:12 -0400
IronPort-SDR: BMORvE4BgYZit+B/3RvwuqA1PzRJFHJMqe/erW7JYmSmqcism566lhwAriEkh7+tLUng2C258r
 biMa/717Uekg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:57:11 -0700
IronPort-SDR: ZTf1Ulx5V/dhCiNQBZoSQhguP/8CLmmD+MQuGpC5BeFcndgopAga0aVvAua6NqY9WuQhzAV9rM
 KkVVM19xpvOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="400337204"
Received: from ccarey-mobl.amr.corp.intel.com (HELO [10.209.36.121]) ([10.209.36.121])
  by orsmga004.jf.intel.com with ESMTP; 15 Apr 2020 07:57:10 -0700
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
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
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414171125.GB34613@smile.fi.intel.com>
 <7c0e7f81-cb1c-9c59-4421-baf41b8d015b@linux.intel.com>
 <20200415095228.GO34613@smile.fi.intel.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <84cfd063-55d4-2e07-89ba-c03cbe856b6d@linux.intel.com>
Date:   Wed, 15 Apr 2020 09:19:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415095228.GO34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 4/15/20 4:52 AM, Andy Shevchenko wrote:
> On Tue, Apr 14, 2020 at 12:54:25PM -0500, Pierre-Louis Bossart wrote:
>> On 4/14/20 12:11 PM, Andy Shevchenko wrote:
>>> On Thu, Apr 09, 2020 at 02:58:27PM -0500, Pierre-Louis Bossart wrote:
>>>> Using devm_clk_get() with a NULL string fails on ACPI platforms, use
>>>> the "sclk" string as a fallback.
>>>
>>> This is fishy a bit.
>>
>> I didn't find a single example where we use a NULL string in ACPI cases?
> 
> ...
> 
>>> If no, why not simple switch to devm_clk_get_optional()?
>>
>> Not sure what that would change?
> 
> Hmm... Who is the provider of this clock?

Well, at the hardware level, the clock is provided by two local 
oscillators controlled by the codec GPIOs. So you could consider that 
the codec is both the provider and consumer of the clock.

In the Linux world, the PCM512x codec driver creates a gpiochip. And the 
clk driver uses the gpios to expose a clk used by the PCM512x codec driver.

I am not fully happy with this design because it creates a double 
dependency which makes it impossible to remove modules. But I don't know 
how to model it otherwise.

But to go back to your question, the two parts are really joined at the 
hip since the same gpios exposed by one is used by the other.

