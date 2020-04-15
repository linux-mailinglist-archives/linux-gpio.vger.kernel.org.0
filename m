Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D231AAB7B
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 17:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393128AbgDOPKo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 11:10:44 -0400
Received: from mga03.intel.com ([134.134.136.65]:43072 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393081AbgDOPKn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 11:10:43 -0400
IronPort-SDR: pfoGCxGLVDZgdUCyf8tb/rHDvEy0RWp58LFU1Jbn4jz1Lq4MpeRLZJoDiB4lhbY2hPd1I6zTNI
 k5Cd/1JwFw+w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 08:10:43 -0700
IronPort-SDR: A9e9OyYKXg5fzBSY5uySqqjAa199d8r4pqrr6x3TGL0zJeGVoWdu/D9Ag/O8Nj5Om7sWXdb4f7
 jitJ7LFk805g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="253550057"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 15 Apr 2020 08:10:39 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOjgY-000oRQ-2E; Wed, 15 Apr 2020 18:10:42 +0300
Date:   Wed, 15 Apr 2020 18:10:42 +0300
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
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
Message-ID: <20200415151042.GO185537@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414171125.GB34613@smile.fi.intel.com>
 <7c0e7f81-cb1c-9c59-4421-baf41b8d015b@linux.intel.com>
 <20200415095228.GO34613@smile.fi.intel.com>
 <84cfd063-55d4-2e07-89ba-c03cbe856b6d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84cfd063-55d4-2e07-89ba-c03cbe856b6d@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 09:19:10AM -0500, Pierre-Louis Bossart wrote:
> On 4/15/20 4:52 AM, Andy Shevchenko wrote:
> > On Tue, Apr 14, 2020 at 12:54:25PM -0500, Pierre-Louis Bossart wrote:
> > > On 4/14/20 12:11 PM, Andy Shevchenko wrote:
> > > > On Thu, Apr 09, 2020 at 02:58:27PM -0500, Pierre-Louis Bossart wrote:
> > > > > Using devm_clk_get() with a NULL string fails on ACPI platforms, use
> > > > > the "sclk" string as a fallback.
> > > > 
> > > > This is fishy a bit.
> > > 
> > > I didn't find a single example where we use a NULL string in ACPI cases?
> > 
> > ...
> > 
> > > > If no, why not simple switch to devm_clk_get_optional()?
> > > 
> > > Not sure what that would change?
> > 
> > Hmm... Who is the provider of this clock?
> 
> Well, at the hardware level, the clock is provided by two local oscillators
> controlled by the codec GPIOs. So you could consider that the codec is both
> the provider and consumer of the clock.

Is it internal component to the codec or discrete (outside of codec chip)?
I bet it is the latter. Thus, codec is not provider. Board, where this
configuration is used, *is* provider of the clock(s).

> In the Linux world, the PCM512x codec driver creates a gpiochip. And the clk
> driver uses the gpios to expose a clk used by the PCM512x codec driver.

Yeah, hardware cyclic dependency :-)

> I am not fully happy with this design because it creates a double dependency
> which makes it impossible to remove modules. But I don't know how to model
> it otherwise.

I guess it should be clock provider which uses GPIO as a parameter to switch
clock rates, and codec driver, which provides GPIO chip and instantiates
(after) the clock provider instance. One module or several, is an
implementation detail.

> But to go back to your question, the two parts are really joined at the hip
> since the same gpios exposed by one is used by the other.

I got it, thanks for explanation.

-- 
With Best Regards,
Andy Shevchenko


