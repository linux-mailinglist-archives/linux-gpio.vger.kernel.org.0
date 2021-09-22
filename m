Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942A44141FC
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 08:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbhIVGiF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 02:38:05 -0400
Received: from mga02.intel.com ([134.134.136.20]:64657 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232630AbhIVGiC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Sep 2021 02:38:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="210764291"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; 
   d="scan'208";a="210764291"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 23:36:25 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; 
   d="scan'208";a="702084673"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 23:36:24 -0700
Received: from andy by smile with local (Exim 4.95-RC2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mSvrh-0048nl-OV;
        Wed, 22 Sep 2021 09:36:21 +0300
Date:   Wed, 22 Sep 2021 09:36:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Florian Eckert <fe@dev.tdt.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-gpio-owner@vger.kernel.org
Subject: Re: [PATCH v1 1/9] pinctrl: mcp23s08: Get rid of legacy platform data
Message-ID: <YUrO5ajlS9wS6xYU@smile.fi.intel.com>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
 <290741faab199d3e43b6255bf2282075@dev.tdt.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <290741faab199d3e43b6255bf2282075@dev.tdt.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 16, 2021 at 02:51:23PM +0200, Florian Eckert wrote:
> Hello Andy,
> 
> I just wanted to port my target an APU3 (x86_64) to kernel version 5.10 in
> OpenWrt.
> This is the next stable LTS kernel version in OpenWrt.
> 
> On my board I have this device as an I2c bus IO-expander with which I
> control additional LEDs.
> For this purpose I have a platform driver. Which registers these additional
> LEDs.
> I have now discovered that the platform driver no longer compiles due to
> this change, as the platform data for the mcp23017 have been removed by this
> change in kernel version 5.8.
> 
> I don't have control over the BIOS (coreboot)

It's open source.

> and I can't adjust the ACPI
> tables.

Actually you can (to some extend) even for closed sourced firmwares (either
with rewriting DSDT as Hackintosh project does, or via SSDT overlays, I gave a
talk on Linaro Connect about this).

> Since this is an x86 platform, I can't work with a device tree, can I?

Ideally you need to fix the ACPI tables, but this won't fix older firmwares
anyway. As a workaround you may convert platform data to use software nodes.

See the example (in v5.15-rc1):

	drivers/mfd/intel_quark_i2c_gpio.c
	drivers/gpio/gpio-dwapb.c
	drivers/i2c/busses/i2c-designware-platdrv.c

of such conversion.

> On 2020-04-07 19:38, Andy Shevchenko wrote:
> > Platform data is a legacy interface to supply device properties
> > to the driver. In this case we even don't have in-kernel users
> > for it. Just remove it for good.

-- 
With Best Regards,
Andy Shevchenko


