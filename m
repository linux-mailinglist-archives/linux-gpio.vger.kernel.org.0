Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4530E1B3BAF
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 11:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgDVJra (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 05:47:30 -0400
Received: from mga07.intel.com ([134.134.136.100]:27723 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725994AbgDVJr3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 05:47:29 -0400
IronPort-SDR: QLN/jondOn7rUpGVekkWjsWWIP930hNONMRoF5BwKJIuGti7bgzM7wjGO1vxW2a82ZvDLD1357
 SrQ7/fG4eXaA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 02:47:28 -0700
IronPort-SDR: 3aN7PojsIhZcUS0QDEfAJyxsjD1t1zD6WtaWFaWz45joO8ATB/Jbbakkgv8rZUN3zxRGc+3uB0
 QjpKwd1cSl2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,413,1580803200"; 
   d="scan'208";a="402489946"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 22 Apr 2020 02:47:24 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jRByZ-002PzX-07; Wed, 22 Apr 2020 12:47:27 +0300
Date:   Wed, 22 Apr 2020 12:47:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 12/16] clk: hifiberry-dacpro: add ACPI support
Message-ID: <20200422094726.GZ185537@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-13-pierre-louis.bossart@linux.intel.com>
 <158754793532.132238.9824423478783177623@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158754793532.132238.9824423478783177623@swboyd.mtv.corp.google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 22, 2020 at 02:32:15AM -0700, Stephen Boyd wrote:
> Quoting Pierre-Louis Bossart (2020-04-09 12:58:37)
> > On ACPI platforms the of_ functions are irrelevant, conditionally
> > compile them out and add devm_clk_hw_register_clkdev() call instead.

...

> Use if (!IS_ENABLED(CONFIG_ACPI)) instead?
> 
> >         ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
> >                                      &proclk->hw);

I'm rather wondering if we have OF stuff integrated properly to CLK framework
to avoid first branch completely.

> > +#else
> > +       ret = devm_clk_hw_register_clkdev(dev, &proclk->hw,
> > +                                         init.name, NULL);
> > +#endif

-- 
With Best Regards,
Andy Shevchenko


