Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0FD01B4391
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 13:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgDVLyS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 07:54:18 -0400
Received: from mga11.intel.com ([192.55.52.93]:37601 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726043AbgDVLyS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 07:54:18 -0400
IronPort-SDR: OA+DpJ4gmrhq85KPBRAX8B3OUGHcprNvXbvvXJMhaUKnPSazYTRQUFhtqIkllk1a+pa5qavQzM
 Q+dfO0aipHnQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 04:54:18 -0700
IronPort-SDR: O9CjOCHYmPwWZIqf6i+YiDP/7wq2CxiygWwU1a6RtXS81F0b1Jyas3sJgTJCR5gv1Gf/eIs2Gw
 Dw3hScIsZsvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; 
   d="scan'208";a="273860164"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 22 Apr 2020 04:54:14 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jRDxJ-002RAE-6g; Wed, 22 Apr 2020 14:54:17 +0300
Date:   Wed, 22 Apr 2020 14:54:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
        tiwai@suse.de, broonie@kernel.org,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 13/16] clk: hifiberry-dacpro: add "sclk" lookup
Message-ID: <20200422115417.GG185537@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-14-pierre-louis.bossart@linux.intel.com>
 <158754810745.132238.7647643247125302962@swboyd.mtv.corp.google.com>
 <c52e0f7d-1eaf-a89b-ff5d-b2a02ad56021@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c52e0f7d-1eaf-a89b-ff5d-b2a02ad56021@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 22, 2020 at 04:51:52AM -0500, Pierre-Louis Bossart wrote:
> > > +       proclk->sclk_lookup = clkdev_hw_create(&proclk->hw, "sclk", NULL);
> > > +       if (!proclk->sclk_lookup) {
> > > +#ifndef CONFIG_ACPI
> > 
> > Is it to save code space? Otherwise the ifdefs are pretty ugly and I'd
> > prefer we just call of_clk APIs and rely on the inline stubs when
> > CONFIG_OF isn't enabled to be optimized out.
> 
> CONFIG_OF was added as a dependency (see patch 10/16) so that we can use the
> 'compatible' string to probe w/ the PRP0001 device.

PRP0001 does not require CONFIG_OF to be set.

> I must admit I don't know what these functions do so I just filtered them
> out in the ACPI case.

I think you have to check if one is a superposition of the other.

> > > +               of_clk_del_provider(dev->of_node);
> > > +#endif
> > > +               return -ENOMEM;
> > > +       }

-- 
With Best Regards,
Andy Shevchenko


