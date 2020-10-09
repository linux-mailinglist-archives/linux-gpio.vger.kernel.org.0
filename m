Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29360288D94
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 18:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389451AbgJIQBO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 12:01:14 -0400
Received: from mga11.intel.com ([192.55.52.93]:20771 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388719AbgJIQBO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Oct 2020 12:01:14 -0400
IronPort-SDR: DNFQNWWhQTknNXHZNeHC8PdhYVDHmtmRN+ssJ4eZCXm9SGKjRbcxjS26hhlQ8gRaQcnJaaDh/6
 sjYlWJ58+/WQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="162040793"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="162040793"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 09:01:02 -0700
IronPort-SDR: 6tOyse5HNkuszbEn5xNpDEt/e10Z6KtAVdFtCmmPCFXQhLiHyQdY4ZXEoma7uTq3p3R+eo2/mV
 Z2KVxypk9hBA==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="328947070"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 09:01:00 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kQuqG-002iXf-Am; Fri, 09 Oct 2020 19:02:00 +0300
Date:   Fri, 9 Oct 2020 19:02:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: Re: [PATCH v1 1/9] pinctrl: mcp23s08: Get rid of legacy platform
 data
Message-ID: <20201009160200.GK4077@smile.fi.intel.com>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdY6_EChELrKGtcvsBvDqEQ9QD1=+PWWZuyBZV_CpLvUyA@mail.gmail.com>
 <c82ef50e-8f5c-39cd-6032-b4797a49e0e1@geanix.com>
 <20201009140236.GG4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201009140236.GG4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 09, 2020 at 05:02:36PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 09, 2020 at 11:15:57AM +0200, Martin Hundebøll wrote:
> > On 16/04/2020 12.35, Linus Walleij wrote:
> > > On Tue, Apr 7, 2020 at 7:38 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:

> > I tried to bisect, but some of the commits failed to compile:
> > 
> > > drivers/pinctrl/pinctrl-mcp23s08.c:959:39: error: 'mcp23s08_spi_of_match'
> > undeclared (first use in this function); did you mean
> > 'mcp23s08_i2c_of_match'?
> > 
> > >  959 |  match = of_match_device(of_match_ptr(mcp23s08_spi_of_match),
> > &spi->dev);
> 
> At which patch this happens?
> 
> I compiled them individually but it might be slipped during rebase in between
> of versions of the patch series.

JFYI: I have got Linux next and reverted all patches down to the one before my
series you complained about. Then I have compiled and reverted one-by-one.
Here is the log:

$ git reset --hard HEAD~1
HEAD is now at f018c29d2f05 Revert "pinctrl: mcp23s08: Deduplicate IRQ chip filling"
$ git reset --hard HEAD~1
HEAD is now at fd9a21af4720 Revert "pinctrl: mcp23s08: Consolidate SPI and I²C code"
$ git reset --hard HEAD~1
HEAD is now at efd1e6d2cdfe Revert "pinctrl: mcp23s08: Drop unused parameter in mcp23s08_probe_one()"
$ git reset --hard HEAD~1
HEAD is now at c0a36f9d6641 Revert "pinctrl: mcp23s08: Refactor mcp23s08_spi_regmap_init()"
$ git reset --hard HEAD~1
HEAD is now at b7cbbb8df01c Revert "pinctrl: mcp23s08: Propagate error code from device_property_read_u32()"
$ git reset --hard HEAD~1
HEAD is now at 819740665f29 Revert "pinctrl: mcp23s08: Make use of device properties"
$ git reset --hard HEAD~1
HEAD is now at 4a183ba59936 Revert "pinctrl: mcp23s08: Use for_each_set_bit() and hweight_long()"
$ git reset --hard HEAD~1
HEAD is now at 229eb0d949ee Revert "pinctrl: mcp23s08: Split to three parts: core, I²C, SPI"
$ git reset --hard HEAD~1
HEAD is now at 3d5db262b4cc Revert "pinctrl: mcp23s08: add module license"
$ git reset --hard HEAD~1
HEAD is now at 67d3e3edbab4 Revert "pinctrl: mcp23s08: Split to three parts: fix ptr_ret.cocci warnings"
$ git reset --hard HEAD~1
HEAD is now at d916cd9888b3 Revert "pinctrl: mcp23s08: Use irqchip template"
$ git reset --hard HEAD~1
HEAD is now at f0c94c7500ab Revert "pinctrl: mcp23s08: Improve error messaging in ->probe()"
$ git reset --hard HEAD~1
HEAD is now at 23593741ba99 Revert "pinctrl: mcp23s08: Fix mcp23x17_regmap initialiser"
$ git reset --hard HEAD~1
HEAD is now at 2f5dc6077839 Revert "pinctrl: mcp23s08: Fix mcp23x17 precious range"
$ git reset --hard HEAD~1
HEAD is now at ...

Every single patch is compiled perfectly. Are you sure you have clean tree?

Also I spent a bit of time to look again in the what may be possible of
breakage and found nothing alarming. Please, give more details about the issue.

-- 
With Best Regards,
Andy Shevchenko


