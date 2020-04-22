Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAF1E1B42D2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 13:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgDVLJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 07:09:37 -0400
Received: from mga01.intel.com ([192.55.52.88]:12656 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgDVLJh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 07:09:37 -0400
IronPort-SDR: ekUo6i82p9hH7RS1jH1EaSunQC3qds07G5RlC74mRAdLGnmSCjfguw0hllKYqzntIjiNLn6djz
 u59BmNzMVulQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 04:09:37 -0700
IronPort-SDR: C8gBEMh74DJeDpXbU7qrvhRVlQBYlnTsVVaUFYIoZGnnyDwZ/+ZG2r1FEdHQ7lc4xpWXXlpWMu
 NJKRArDDUW6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; 
   d="scan'208";a="457108260"
Received: from ajavier-mobl1.amr.corp.intel.com (HELO [10.255.68.153]) ([10.255.68.153])
  by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2020 04:09:36 -0700
Subject: Re: [RFC PATCH 13/16] clk: hifiberry-dacpro: add "sclk" lookup
To:     Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org
Cc:     tiwai@suse.de, broonie@kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-14-pierre-louis.bossart@linux.intel.com>
 <158754810745.132238.7647643247125302962@swboyd.mtv.corp.google.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c52e0f7d-1eaf-a89b-ff5d-b2a02ad56021@linux.intel.com>
Date:   Wed, 22 Apr 2020 04:51:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158754810745.132238.7647643247125302962@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



>> +       proclk->sclk_lookup = clkdev_hw_create(&proclk->hw, "sclk", NULL);
>> +       if (!proclk->sclk_lookup) {
>> +#ifndef CONFIG_ACPI
> 
> Is it to save code space? Otherwise the ifdefs are pretty ugly and I'd
> prefer we just call of_clk APIs and rely on the inline stubs when
> CONFIG_OF isn't enabled to be optimized out.

CONFIG_OF was added as a dependency (see patch 10/16) so that we can use 
the 'compatible' string to probe w/ the PRP0001 device.

I must admit I don't know what these functions do so I just filtered 
them out in the ACPI case.

>> +               of_clk_del_provider(dev->of_node);
>> +#endif
>> +               return -ENOMEM;
>> +       }
>> +
