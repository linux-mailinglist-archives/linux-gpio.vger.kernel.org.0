Return-Path: <linux-gpio+bounces-51-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4357E9BF5
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 13:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A376B2098F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 12:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7FE1D68F;
	Mon, 13 Nov 2023 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrfotMyF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84651D53F
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 12:13:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B73D7D;
	Mon, 13 Nov 2023 04:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699877589; x=1731413589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KjFlVb/hpwo9JJSDz+au+1FquPh+IO2BdrfebCwPYaY=;
  b=DrfotMyFTDilamIjK8WRbjHsorfcOAiFq4L7atvKLO8rUB1fx7dOl40X
   OP61VTxy+T24nMSEWGCE6232riXpYPA8TVJhhMarLTptnI5pX1RRYz2TA
   ReMstcSwI5OaUppGcHpfbgfOjx97b2ReIqU4LpWtCjxD3FDO9hhHIBqrA
   VDT3cHjLUCntEr06pAB6xoUHvxfOu7VPTjaAs/DlNaupqQ6lapXI+/Pyg
   UekVnG3Lp385cDJBjOTSJe654n1Vy3zWfqSFiyonAtiAQdMn6FnXczbMg
   aI2Wy2jXaRpqJfYK2HtMg4ESRsJRYWX1AAZupWKkfdmQZCTjML4HT3c7m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="369761029"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="369761029"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 04:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="908031091"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="908031091"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 04:12:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2Vo8-0000000DYPW-2BjG;
	Mon, 13 Nov 2023 14:12:48 +0200
Date: Mon, 13 Nov 2023 14:12:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/3] pinctrl: intel: Add a generic Intel pin control
 platform driver
Message-ID: <ZVISwHwoLpy3nGDT@smile.fi.intel.com>
References: <20231030141034.3241674-1-andriy.shevchenko@linux.intel.com>
 <20231030141034.3241674-3-andriy.shevchenko@linux.intel.com>
 <20231103055738.GO17433@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103055738.GO17433@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 03, 2023 at 07:57:38AM +0200, Mika Westerberg wrote:
> On Mon, Oct 30, 2023 at 04:10:33PM +0200, Andy Shevchenko wrote:

...

> > +config PINCTRL_INTEL_PLATFORM
> > +	tristate "Intel pinctrl and GPIO platform driver"
> > +	depends on ACPI
> > +	select PINCTRL_INTEL
> > +	help
> > +	  This pinctrl driver provides an interface that allows configuring
> > +	  of Intel PCH pins and using them as GPIOs.
> 
> Add here some description that explains why this needs to be enabled,
> for example for Lunar Lake. Now it is all too generic for distro folks
> to understand if this is needed or not.

OK!

...

> > + * Copyright (C) 2021-2023, Intel Corporation
> 
> That's 2023

As-is it is still valid and reflects the history.

...

> > +	ngpps = device_get_child_node_count(dev);
> > +	if (ngpps == 0)
> 
> if (!nggps)

0 is a plain number here (as count) and explicit comparison makes sense.
But I'm okay with another form.


> > +		return -ENODEV;

...

> > +	ncommunities = 1,
> 
> Why this is 1? Can't we have more communities?

As for now (version 1.0 of the specification) it's assumed that it's one
community per device node in the ACPI, so I would leave this as is (we have
also drivers with single community per device node, hence this is kinda
pattern. Should I add a comment?

...

> > +	struct device *dev = &pdev->dev;
> > +	struct intel_pinctrl_soc_data *data;
> 
> 
> Change the ordering of the above:
> 
> 	struct intel_pinctrl_soc_data *data;
> 	struct device *dev = &pdev->dev;

Sure.

...

> > +static const struct acpi_device_id intel_platform_pinctrl_acpi_match[] = {
> > +	{ }
> 
> And add the _CID here in this patch as I commented in the last patch.

OK! I'll squash the next patch into this one.

> > +};

-- 
With Best Regards,
Andy Shevchenko



