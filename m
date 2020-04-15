Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A357A1A998F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 11:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896032AbgDOJw1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 05:52:27 -0400
Received: from mga01.intel.com ([192.55.52.88]:24511 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895992AbgDOJvk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 05:51:40 -0400
IronPort-SDR: rEhkbUhdoJyPeHydtjujrF5huAynRU6Y5cHDE1qoi2SmGA+W1tbWPFsIQzbxBE25c+gGJ//gsO
 UBu/fbHgqgyQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 02:51:38 -0700
IronPort-SDR: UnN5cCxPNTxvHGxBYKHw55LozRjz4wqIOdvsn5Q5o6Ua8P40BR8xduL2AKeOtoTkp+MxZbc4GK
 uqtL5ElcoFYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; 
   d="scan'208";a="454856974"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 15 Apr 2020 02:51:35 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOehl-000kBB-BD; Wed, 15 Apr 2020 12:51:37 +0300
Date:   Wed, 15 Apr 2020 12:51:37 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Subject: Re: [RFC PATCH 03/16] ASoC: Intel: sof-pcm512x: use gpiod for LED
Message-ID: <20200415095137.GN34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-4-pierre-louis.bossart@linux.intel.com>
 <20200414171752.GC34613@smile.fi.intel.com>
 <92636c24-32d5-3ec6-23db-e7f9e22f66dc@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92636c24-32d5-3ec6-23db-e7f9e22f66dc@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 12:57:35PM -0500, Pierre-Louis Bossart wrote:

...

> > > +		GPIO_LOOKUP("pcm512x-gpio", 3, "PCM512x-GPIO4", GPIO_ACTIVE_HIGH),
> > 
> > It says GPIO 4 and here is number 3.
> > Does this 4 come from hardware documentation?
> 
> Yes TI count from 1 to 6 in their documentation. The initial HifiBerry DAC+
> also counts from 1 to 6. I can add a comment here.

Okay!

...

> > > +	ctx->gpio_4 = devm_gpiod_get(&pdev->dev, "PCM512x-GPIO4",
> > > +				     GPIOD_OUT_LOW);
> > 
> > Can driver work without this GPIO? If so, perhaps devm_gpiod_get_optional().
> 
> that part yes, it's only for the LED, but if this fails then probably the
> rest of the code will also fail.

The problem with above code that it's setting the hard dependency to a LED
gpio. Is it crucial to get codec working? I bet no. In case
gpiod_get_optional() fails, it will be correct to bail out, because it will
mean other kind of errors not related to optionality of the GPIO (rather it's
present, but something went wrong).

> > > +	if (IS_ERR(ctx->gpio_4)) {
> > > +		dev_err(&pdev->dev, "gpio4 not found\n");
> > > +		ret = PTR_ERR(ctx->gpio_4);
> > > +		return ret;
> > > +	}

-- 
With Best Regards,
Andy Shevchenko


