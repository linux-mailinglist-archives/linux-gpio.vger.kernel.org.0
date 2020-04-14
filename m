Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F991A8904
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 20:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503713AbgDNSQr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 14:16:47 -0400
Received: from mga17.intel.com ([192.55.52.151]:37743 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503741AbgDNSQq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 14:16:46 -0400
IronPort-SDR: 859Shm1ms95XpokYidlNbVP4RMsbySkrkHvtQns5HQ7LRPZvXQEROWZ4kfknj+0fxXpExVH2Zw
 miDNWFxlxstw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 11:16:45 -0700
IronPort-SDR: tGG9e0Hkk+UqgrOMXWDJoKlJl8otLYDgt6LpMezTRr9f76U/SJOF8Zszq4WMcKf/QOYFwssNCp
 /53NKdtdRnvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="253272855"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40]) ([10.212.190.40])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 11:16:41 -0700
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
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7c0e7f81-cb1c-9c59-4421-baf41b8d015b@linux.intel.com>
Date:   Tue, 14 Apr 2020 12:54:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414171125.GB34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 4/14/20 12:11 PM, Andy Shevchenko wrote:
> On Thu, Apr 09, 2020 at 02:58:27PM -0500, Pierre-Louis Bossart wrote:
>> Using devm_clk_get() with a NULL string fails on ACPI platforms, use
>> the "sclk" string as a fallback.
> 
> This is fishy a bit.

I didn't find a single example where we use a NULL string in ACPI cases?

> Do we have this name in the bindings?

No, that's probably a miss

> If no, why not simple switch to devm_clk_get_optional()?

Not sure what that would change?
