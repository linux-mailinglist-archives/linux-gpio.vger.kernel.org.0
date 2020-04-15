Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5251A9953
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 11:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895856AbgDOJtO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 05:49:14 -0400
Received: from mga07.intel.com ([134.134.136.100]:41202 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895851AbgDOJtK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 05:49:10 -0400
IronPort-SDR: lwbmYmsr1PmZX7cyUdyY0HpHQHHS87uEb2fftfPYePfBvHNsjzw5k2fzhPI1TiHmNZ8xczNkM6
 gkva2JmWfycw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 02:49:09 -0700
IronPort-SDR: jcQ5vxXjAjoXIVhKj5SRTEUrBbrXcc8h9EFEM7+dPbqDFMhP1PNKmxF9aNNg1C7wmz3L8Jcw3r
 eI8t7yfcq44A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; 
   d="scan'208";a="245651676"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 15 Apr 2020 02:49:06 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOefM-000k9K-J0; Wed, 15 Apr 2020 12:49:08 +0300
Date:   Wed, 15 Apr 2020 12:49:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Subject: Re: [RFC PATCH 01/16] ASoC: pcm512x: expose 6 GPIOs
Message-ID: <20200415094908.GM34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-2-pierre-louis.bossart@linux.intel.com>
 <20200414170934.GA34613@smile.fi.intel.com>
 <31e956de-8f62-1857-5153-b163ff7d56e1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31e956de-8f62-1857-5153-b163ff7d56e1@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 12:52:07PM -0500, Pierre-Louis Bossart wrote:

...

> > > +static int pcm512x_gpio_direction_output(struct gpio_chip *chip,
> > > +					 unsigned int offset,
> > > +					 int value)
> > > +{
> > > +	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
> > > +	unsigned int reg;
> > > +	int ret;
> > > +
> > > +	/* select Register GPIOx output for OUTPUT_x (1..6) */
> > > +	reg = PCM512x_GPIO_OUTPUT_1 + offset;
> > 
> > > +	ret = regmap_update_bits(pcm512x->regmap, reg, 0x0f, 0x02);
> > 
> > Magic numbers detected.
> > 
> > > +	if (ret < 0)
> > 
> > Drop unnecessary ' < 0' parts where it makes sense, like here.
> 
> did you mean use  if (ret) or drop the test altogether?

Do you see 'ret' part in my phrase above?

> There's no standard style for regmap functions so I used what was used in
> the rest of this driver.

I see. May be than to drop it from the rest and do not add more?

> > > +		return ret;

...

> > > +	return (val >> offset) & 1;
> > 
> > Don't forget to use BIT() macro.
> > 
> > 	return !!(val & BIT(offset));
> 
> There's a point where this becomes less readable IMHO, but fine.
> The !! gives me a headache...

You can check assembly if it gives better result in code generation.
But at least new drivers in GPIO are using it.

...

> > > +		pr_debug("%s: regmap_update_bits failed: %d\n", __func__, ret);
> > 
> > No __func__ in debug messages.
> > Use dev_dbg() when we have struct device available.
> 
> Not sure we do, will look into this.

I didn't get you in the first part. Are you talking about struct device?
It's there, just needs to be de-referenced from GPIO chip.

-- 
With Best Regards,
Andy Shevchenko


