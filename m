Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDEE1AAB4F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 17:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389624AbgDOPFi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 11:05:38 -0400
Received: from mga04.intel.com ([192.55.52.120]:33479 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388596AbgDOPFc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 11:05:32 -0400
IronPort-SDR: Quq6ODSbHLHSB4FM2kQJCpM912eRBwVcsBFYqxaCh37vqCYvC9LkLOhoUGrptYkzYZ5b7YDIKv
 90JtcTLgRXXA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 08:05:31 -0700
IronPort-SDR: DA5pbUVIM9dhuNIOm/c2PX9rXy+iuiumR0TT1Jl1n5jr026uTcRG8Lj5KVoWG3uzYc5UuCW1YI
 C6wjTkTQVWbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="242331814"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 15 Apr 2020 08:05:27 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOjbV-000oOJ-SM; Wed, 15 Apr 2020 18:05:29 +0300
Date:   Wed, 15 Apr 2020 18:05:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, Matthias Reichl <hias@horus.com>,
        tiwai@suse.de, Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Daniel Matuschek <daniel@hifiberry.com>,
        linux-clk@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        broonie@kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [RFC PATCH 04/16] ASoC: Intel: sof-pcm512x: detect Hifiberry
 DAC+ PRO
Message-ID: <20200415150529.GN185537@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-5-pierre-louis.bossart@linux.intel.com>
 <20200414172002.GD34613@smile.fi.intel.com>
 <d3b154f4-fa8a-50a5-7246-51d31e18c4e6@linux.intel.com>
 <20200415095526.GP34613@smile.fi.intel.com>
 <664999e7-f345-7296-feca-56cb53a27eb1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <664999e7-f345-7296-feca-56cb53a27eb1@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 09:07:20AM -0500, Pierre-Louis Bossart wrote:
> On 4/15/20 4:55 AM, Andy Shevchenko wrote:
> > On Tue, Apr 14, 2020 at 01:02:12PM -0500, Pierre-Louis Bossart wrote:
> > > On 4/14/20 12:20 PM, Andy Shevchenko wrote:
> > > > On Thu, Apr 09, 2020 at 02:58:29PM -0500, Pierre-Louis Bossart wrote:

...

> > > > > +	if (IS_ERR(ctx->sclk)) {
> > > > 
> > > > > +		dev_info(dev, "Could not get SCLK, will operate in SOC master mode\n");
> > > > 
> > > > Sounds like devm_clk_get_optional().
> > > 
> > > I am not sure about the semantic here. This driver selects the one which
> > > implements this clock, so if we get a -ENOENT return it's a very bad sign.
> > > Not sure what suppressing the error and converting to NULL would do?
> > 
> > Same as per GPIO.
> > Can it work without this clock? How did it work before your change?
> > 
> > When you add any hard dependency always ask yourself above questions.
> 
> The clock is not required in codec slave mode, it's provided by the SOC.
> 
> The clock is required when the codec is configured as master. Without these
> GPIO selection there will be no audio. So yes we could move this to
> devm_clk_get_optional() and change the test to IS_ERR_OR_NULL.

Hmm... I do not understand. If it's optional, why to check for NULL?

Perhaps you need to split code to show explicitly master / slave paths and for
the first one call everything w/o _optinal() suffix?

> > > > > +		goto skip_dacpro;
> > > > > +	}

-- 
With Best Regards,
Andy Shevchenko


