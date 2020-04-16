Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B321ACE0B
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 18:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgDPQv1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 12:51:27 -0400
Received: from mga04.intel.com ([192.55.52.120]:50923 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728285AbgDPQvZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 12:51:25 -0400
IronPort-SDR: xhHJx65bGA7K8ejB6lFFQrI4tT4y201pn8T5dwpA6qwEj/k2Zgt4Oy8fvvYJqHVNb9m/wtElF2
 ZhuH2/9Z95lQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 09:51:24 -0700
IronPort-SDR: BFJewqmLyHxlwPPIzbmpaDcWq2/78eGWBs6jbDpOcKLssIPLdS5UDrylMxYYckHIXKF9clIUA+
 2JGaJL3drs4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,391,1580803200"; 
   d="scan'208";a="278060214"
Received: from ernestom-mobl.amr.corp.intel.com (HELO [10.251.128.102]) ([10.251.128.102])
  by fmsmga004.fm.intel.com with ESMTP; 16 Apr 2020 09:51:23 -0700
Subject: Re: [RFC PATCH 01/16] ASoC: pcm512x: expose 6 GPIOs
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Walle <michael@walle.cc>
Cc:     "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
        Mark Brown <broonie@kernel.org>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-2-pierre-louis.bossart@linux.intel.com>
 <20200414170934.GA34613@smile.fi.intel.com>
 <CACRpkdZRnSUhmVPKjJ6dWnSfhnvrAKUrBY6tWLkxPgT28CzbHw@mail.gmail.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2cd8d540-8bd0-4a42-4d11-7dea0fb03c22@linux.intel.com>
Date:   Thu, 16 Apr 2020 09:25:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZRnSUhmVPKjJ6dWnSfhnvrAKUrBY6tWLkxPgT28CzbHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 4/16/20 6:42 AM, Linus Walleij wrote:
> On Tue, Apr 14, 2020 at 7:09 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>> On Thu, Apr 09, 2020 at 02:58:26PM -0500, Pierre-Louis Bossart wrote:
>>> The GPIOs are used e.g. on HifiBerry DAC+ HATs to control the LED
>>> (GPIO3) and the choice of the 44.1 (GPIO6) or 48 (GPIO3) kHz
>>> oscillator (when present).
>>>
>>> Enable basic gpio_chip to get/set values and get/set
>>> directions. Tested with GPIO_LIB from sys/class/gpio, the LED turns
>>> on/off as desired.
>>
>>
>> One question, can this use existing GPIO infrastructure, like bgpio_init()?
>> Ah, I see, that one operates over MMIO, while we would need something based on
>> regmap API.
>>
>> Bartosz, do we have plans to have bgpio_regmap_init() or alike?
> 
> Michael Walle is working on that:
> https://lore.kernel.org/linux-gpio/20200402203656.27047-11-michael@walle.cc/
> 
> I think we should try to merge it sooner rather than later.
> I can provide an ib-* branch for ASoC whenever we agreed
> on a basic generic driver.

Thanks for the pointer, I will give it a try.
