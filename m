Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32E781A8747
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 19:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407581AbgDNRSF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 13:18:05 -0400
Received: from mga05.intel.com ([192.55.52.43]:5041 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407532AbgDNRSD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 13:18:03 -0400
IronPort-SDR: MwOkRpAphWPNBwgGCeRiSXOUH5i0wbRRGNaLxsyI/2l+hm41qbWNFoSQ4xDkYaYs5jh7FjnDjN
 cfRbGt5Eo9Hw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 10:17:54 -0700
IronPort-SDR: wSdXoXBWbtwb3E7Tm0mh49EdJASJhS4vvbnijD6FTeBStrc1NUUNKh844LrZnzhDD7+w5nbfAD
 Ad73pOsdtXRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="256582475"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 14 Apr 2020 10:17:50 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOPC4-000Zo4-PO; Tue, 14 Apr 2020 20:17:52 +0300
Date:   Tue, 14 Apr 2020 20:17:52 +0300
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
Message-ID: <20200414171752.GC34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409195841.18901-4-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 02:58:28PM -0500, Pierre-Louis Bossart wrote:
> Remove direct regmap access, use gpios exposed by PCM512x codec
> Keep the codec_init function, this will be used in following patches
> 
> The gpios handling is done with an explicit lookup table. We cannot
> use ACPI-based mappings since we don't have an ACPI device for the
> machine driver, and the gpiochip is created during the probe of the
> PCM512x driver.

...

> +#include <linux/gpio/machine.h>

Okay, it's a board code.

...

> +static struct gpiod_lookup_table pcm512x_gpios_table = {
> +	/* .dev_id set during probe */
> +	.table = {

> +		GPIO_LOOKUP("pcm512x-gpio", 3, "PCM512x-GPIO4", GPIO_ACTIVE_HIGH),

It says GPIO 4 and here is number 3.
Does this 4 come from hardware documentation?

> +		{ },

No comma for terminator entries.

> +	},
> +};

...

> +	gpiod_add_lookup_table(&pcm512x_gpios_table);

Where is the counterpart gpiod_remove_lookup_table() call?

> +	ctx->gpio_4 = devm_gpiod_get(&pdev->dev, "PCM512x-GPIO4",
> +				     GPIOD_OUT_LOW);

Can driver work without this GPIO? If so, perhaps devm_gpiod_get_optional().

> +	if (IS_ERR(ctx->gpio_4)) {
> +		dev_err(&pdev->dev, "gpio4 not found\n");
> +		ret = PTR_ERR(ctx->gpio_4);
> +		return ret;
> +	}

-- 
With Best Regards,
Andy Shevchenko


