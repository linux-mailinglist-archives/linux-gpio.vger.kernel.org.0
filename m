Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952531A8909
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 20:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503745AbgDNSRB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 14:17:01 -0400
Received: from mga17.intel.com ([192.55.52.151]:37754 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503741AbgDNSQ6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 14:16:58 -0400
IronPort-SDR: +V6BVVWEkeP5rZ51RFBkHSZ9rzPHRMLmaWeIJAKm1+2KaZYlNE5P210+xhKMs5aiuvkWC77fyS
 hX7ckLMRyZQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 11:16:57 -0700
IronPort-SDR: PSCQxYOBgG/KRnSVwz6t0T307zmoiAEV1+rS7DuMMYdAflRVrE4k7RQuT8DDDeP3LYxtQ8Ysh2
 IjarvwZ20lXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="253272925"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40]) ([10.212.190.40])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 11:16:53 -0700
Subject: Re: [RFC PATCH 04/16] ASoC: Intel: sof-pcm512x: detect Hifiberry DAC+
 PRO
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
 <20200409195841.18901-5-pierre-louis.bossart@linux.intel.com>
 <20200414172002.GD34613@smile.fi.intel.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d3b154f4-fa8a-50a5-7246-51d31e18c4e6@linux.intel.com>
Date:   Tue, 14 Apr 2020 13:02:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414172002.GD34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 4/14/20 12:20 PM, Andy Shevchenko wrote:
> On Thu, Apr 09, 2020 at 02:58:29PM -0500, Pierre-Louis Bossart wrote:
>> Try to detect HifiBerry 44.1 and 48kHz oscillators on codec init
> 
> ...
> 
>> +	ctx->sclk = devm_clk_get(rtd->card->dev, "sclk");
> 
> Is this in the bindings?

Not for now. the 'sclk' part is only used by me myself and I in an ACPI 
context. I can add this description if desired.
> 
>> +	if (IS_ERR(ctx->sclk)) {
> 
>> +		dev_info(dev, "Could not get SCLK, will operate in SOC master mode\n");
> 
> Sounds like devm_clk_get_optional().

I am not sure about the semantic here. This driver selects the one which 
implements this clock, so if we get a -ENOENT return it's a very bad 
sign. Not sure what suppressing the error and converting to NULL would do?

> 
>> +		goto skip_dacpro;
>> +	}
> 
