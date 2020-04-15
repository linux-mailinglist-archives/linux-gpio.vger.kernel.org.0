Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5AF01A99B1
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 11:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405462AbgDOJzc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 05:55:32 -0400
Received: from mga18.intel.com ([134.134.136.126]:3720 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405394AbgDOJz3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 05:55:29 -0400
IronPort-SDR: wOG+PzgVYM07kM+tQPBhfYCVhXlh8XCuTrCNAAQeX9BuVVCZchXErYQuCdrOi0LOR1ujhEXBzy
 RYq6tcJr2LzQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 02:55:27 -0700
IronPort-SDR: WHPT8+Gg5iTH6yvnDF7OIqInGJCBbqX2ZmU9Aj1/G6YOQ5VMqOwBwaZzFkv4wFgLHdMGkgdFy7
 2YSOsbDPHF+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; 
   d="scan'208";a="427381313"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 15 Apr 2020 02:55:24 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOelS-000kEZ-F8; Wed, 15 Apr 2020 12:55:26 +0300
Date:   Wed, 15 Apr 2020 12:55:26 +0300
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
Subject: Re: [RFC PATCH 04/16] ASoC: Intel: sof-pcm512x: detect Hifiberry
 DAC+ PRO
Message-ID: <20200415095526.GP34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-5-pierre-louis.bossart@linux.intel.com>
 <20200414172002.GD34613@smile.fi.intel.com>
 <d3b154f4-fa8a-50a5-7246-51d31e18c4e6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3b154f4-fa8a-50a5-7246-51d31e18c4e6@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 01:02:12PM -0500, Pierre-Louis Bossart wrote:
> On 4/14/20 12:20 PM, Andy Shevchenko wrote:
> > On Thu, Apr 09, 2020 at 02:58:29PM -0500, Pierre-Louis Bossart wrote:

...

> > > +	ctx->sclk = devm_clk_get(rtd->card->dev, "sclk");
> > 
> > Is this in the bindings?
> 
> Not for now. the 'sclk' part is only used by me myself and I in an ACPI
> context. I can add this description if desired.

Unfortunately you need to add this to the bindings, because it's a part of it
and somebody may use it outside of your scope.

> > > +	if (IS_ERR(ctx->sclk)) {
> > 
> > > +		dev_info(dev, "Could not get SCLK, will operate in SOC master mode\n");
> > 
> > Sounds like devm_clk_get_optional().
> 
> I am not sure about the semantic here. This driver selects the one which
> implements this clock, so if we get a -ENOENT return it's a very bad sign.
> Not sure what suppressing the error and converting to NULL would do?

Same as per GPIO.
Can it work without this clock? How did it work before your change?

When you add any hard dependency always ask yourself above questions.

> > > +		goto skip_dacpro;
> > > +	}

-- 
With Best Regards,
Andy Shevchenko


