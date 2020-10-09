Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 778CB288A33
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 16:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731379AbgJIOBk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 10:01:40 -0400
Received: from mga17.intel.com ([192.55.52.151]:3031 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729935AbgJIOBj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Oct 2020 10:01:39 -0400
IronPort-SDR: IMv4+jSI7D5oTSJg6MnOQYhXzaA4dlGm3CP2ob8Rf0V5QvxYcoNBZBVlFDQy6+nvoF4uhS3bdU
 v3+5LbjOdN2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="145351282"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="145351282"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 07:01:34 -0700
IronPort-SDR: 0XYEuOMRu1BeposmnK8bVLoxvt5kDmDvLToFURqi2hIeEGF1kiHS2ZR5FC5Zj9NBj9tixRI7b+
 ykTu2ZXa19vw==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="519730960"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 07:01:33 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kQsyi-002eKr-1Z; Fri, 09 Oct 2020 17:02:36 +0300
Date:   Fri, 9 Oct 2020 17:02:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: Re: [PATCH v1 1/9] pinctrl: mcp23s08: Get rid of legacy platform
 data
Message-ID: <20201009140236.GG4077@smile.fi.intel.com>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdY6_EChELrKGtcvsBvDqEQ9QD1=+PWWZuyBZV_CpLvUyA@mail.gmail.com>
 <c82ef50e-8f5c-39cd-6032-b4797a49e0e1@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c82ef50e-8f5c-39cd-6032-b4797a49e0e1@geanix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 09, 2020 at 11:15:57AM +0200, Martin Hundebøll wrote:
> On 16/04/2020 12.35, Linus Walleij wrote:
> > On Tue, Apr 7, 2020 at 7:38 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:

...

> This series caused probing of my PiFace2 to fail:

Thanks for report!

> > [    1.019604] mcp23s08: probe of spi0.0 failed with error -22

I suppose you are trying this on v5.9-rc8 with the same result?

This case without any error message and with -EINVAL points me to the only
possible call that may fail, i.e.

	ret = mcp23s08_spi_regmap_init(data->mcp[addr], dev, addr, type);
	if (ret)
		return ret;

Can you confirm this by adding a dev_info() call in between?

	ret = mcp23s08_spi_regmap_init(data->mcp[addr], dev, addr, type);
	if (ret) {
		dev_info(dev, "regmap init failed for %d@%u\n", type, addr);
		return ret;
	}

and share what it prints, please?

EINVAL can be returned either by wrong type (see switch-case inside that
function) or by devm_regmap_init().

> I tried to bisect, but some of the commits failed to compile:
> 
> > drivers/pinctrl/pinctrl-mcp23s08.c:959:39: error: 'mcp23s08_spi_of_match'
> undeclared (first use in this function); did you mean
> 'mcp23s08_i2c_of_match'?
> 
> >  959 |  match = of_match_device(of_match_ptr(mcp23s08_spi_of_match),
> &spi->dev);

At which patch this happens?

I compiled them individually but it might be slipped during rebase in between
of versions of the patch series.

> However, bisecting did narrow it down to a few commits:

You meant that revert of all of them helps?

Can you rather try to revert all patches against this driver until the one
which starts the series and bisect again? (Should be like 4-5 iterations only).

> > * 1ac30db20be2 - (refs/bisect/bad) pinctrl: mcp23s08: Make use of device
> properties (6 months ago) <Andy Shevchenko>
> 
> > * 88af89b52a1b -
> (refs/bisect/skip-88af89b52a1b7493f1e5ec165856b4c6767cf654) pinctrl:
> mcp23s08: Propagate error code from device_property_read_u32() (6 months
> ago) <Andy Shevchenko>
> 
> > * 0874758ecb2b -
> (refs/bisect/skip-0874758ecb2b3faa200a86dda45dbc29335f883e) pinctrl:
> mcp23s08: Refactor mcp23s08_spi_regmap_init() (6 months ago) <Andy
> Shevchenko>
> 
> > * 0521701c8d10 -
> (refs/bisect/skip-0521701c8d10f832a401cc7ebfa92bb73782d792) pinctrl:
> mcp23s08: Drop unused parameter in mcp23s08_probe_one() (6 months ago) <Andy
> Shevchenko>
> 
> > * d3da29b628a8 -
> (refs/bisect/skip-d3da29b628a86777d25c741c44b8af35f10020a0) pinctrl:
> mcp23s08: Consolidate SPI and I²C code (6 months ago) <Andy Shevchenko>
> 
> > * 84d02e785d34 -
> (refs/bisect/good-84d02e785d34be9363a825d696cca1f07fac2634) pinctrl:
> mcp23s08: Deduplicate IRQ chip filling (6 months ago) <Andy Shevchenko>
> 
> I'm using the rpi3 device tree (broadcom/bcm2837-rpi-3-b.dtb) overlayed with
> a configuration for the mcp23s08:

> /dts-v1/;
> /plugin/;
> / {
>         fragment@0 {
>                 target-path = "/soc/spi@7e204000";
>                 __overlay__ {
>                         pinctrl-names = "default";
>                         pinctrl-0 = <&spi0_gpio7>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         status = "okay";
>                         gpio@0 {
>                                 compatible = "microchip,mcp23s17";
>                                 reg = <0>;
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>                                 microchip,spi-present-mask = <0x01>;
>                                 spi-max-frequency = <1000000>;
>                         };
>                 };
>         };

Okay, there is no IRQ chip here... But this should be fine I think.

> };

> I looked around the code a bit, and tried to compare it with v5.7, but
> didn't see any obvious candidates.

-- 
With Best Regards,
Andy Shevchenko


