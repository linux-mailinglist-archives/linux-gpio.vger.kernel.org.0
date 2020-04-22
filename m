Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B91F1B42D4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 13:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgDVLJj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 07:09:39 -0400
Received: from mga01.intel.com ([192.55.52.88]:12656 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbgDVLJj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 07:09:39 -0400
IronPort-SDR: 4lqwUABa6GduU6jxawJAUHxNAYgAjPusCLlvizn5biuUZeNr/VV3ujFLBDIrLZA9Ujg95l99RX
 EPkcDzNNA3lw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 04:09:39 -0700
IronPort-SDR: zrx63v+4Ld9sS5yeRI5wicoe4XOKrd5S577ODD2pZGoLaTNDF/hU0/7MBEwNcSL1UmBQ4IwfPj
 a7MhtA4R0pHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; 
   d="scan'208";a="457108286"
Received: from ajavier-mobl1.amr.corp.intel.com (HELO [10.255.68.153]) ([10.255.68.153])
  by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2020 04:09:37 -0700
Subject: Re: [RFC PATCH 12/16] clk: hifiberry-dacpro: add ACPI support
To:     Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org
Cc:     Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        tiwai@suse.de, Linus Walleij <linus.walleij@linaro.org>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Hui Wang <hui.wang@canonical.com>,
        Matthias Reichl <hias@horus.com>, broonie@kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-13-pierre-louis.bossart@linux.intel.com>
 <158754793532.132238.9824423478783177623@swboyd.mtv.corp.google.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <60402718-f36c-cab3-2766-9ae180dd7504@linux.intel.com>
Date:   Wed, 22 Apr 2020 04:54:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158754793532.132238.9824423478783177623@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 4/22/20 4:32 AM, Stephen Boyd wrote:
> Quoting Pierre-Louis Bossart (2020-04-09 12:58:37)
>> On ACPI platforms the of_ functions are irrelevant, conditionally
>> compile them out and add devm_clk_hw_register_clkdev() call instead.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/clk/clk-hifiberry-dacpro.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
>> index bf0616c959da..d01a90fed51b 100644
>> --- a/drivers/clk/clk-hifiberry-dacpro.c
>> +++ b/drivers/clk/clk-hifiberry-dacpro.c
>> @@ -114,15 +114,22 @@ static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
>>                  return ret;
>>          }
>>   
>> +#ifndef CONFIG_ACPI
> 
> Use if (!IS_ENABLED(CONFIG_ACPI)) instead?

git grep CONFIG_ACPI shows most of the kernel code uses #if(n)def 
CONFIG_ACPI. It's equivalent, it's a boolean.
