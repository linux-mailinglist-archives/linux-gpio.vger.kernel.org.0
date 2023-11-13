Return-Path: <linux-gpio+bounces-56-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AEF7E9C73
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 13:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E648B1C2089B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 12:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C300E1D6A4;
	Mon, 13 Nov 2023 12:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzcBtBfr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BC61D694
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 12:53:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A662D7E;
	Mon, 13 Nov 2023 04:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699880018; x=1731416018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gBQ3rqlQpRh7qgsxRECw0OU/rnWQCddI4JFcR8EXNRU=;
  b=LzcBtBfrPF6W6GsalUYBYl1Adzbr/EkMlY+xqO6Pi4eaTanVrDVwSTh6
   oGNcogRCekk5l1H0gvU51iZshV9dSncT28JYcY0e1xjNRXJXxE6qN1IFM
   k45hJT9iSo5Ke2tqp3XHLVirKGzhdQj3JzKCmjS5nPj0ICKt0fwLy6Fcb
   B/oSog18GfnD1gbiacVJBrSqAm+mp8AJbF/QPRDX46CSK3tFGGBoS1NJC
   +jscobfOiS4zcYFnQoqUwg1gZeOabTVLuAb2e3SeEhK+UbgCxCM5YgWlF
   8y1TTG23O2/vuL5Zcyoc1t+f/Z12j3Gf//FBT3sW/tedJLnChWgtwuQDy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="3513668"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3513668"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 04:53:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="757793492"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="757793492"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 13 Nov 2023 04:53:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 3FA3664A; Mon, 13 Nov 2023 14:53:34 +0200 (EET)
Date: Mon, 13 Nov 2023 14:53:34 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/3] pinctrl: intel: Add a generic Intel pin control
 platform driver
Message-ID: <20231113125334.GQ17433@black.fi.intel.com>
References: <20231030141034.3241674-1-andriy.shevchenko@linux.intel.com>
 <20231030141034.3241674-3-andriy.shevchenko@linux.intel.com>
 <20231103055738.GO17433@black.fi.intel.com>
 <ZVISwHwoLpy3nGDT@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZVISwHwoLpy3nGDT@smile.fi.intel.com>

On Mon, Nov 13, 2023 at 02:12:48PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 03, 2023 at 07:57:38AM +0200, Mika Westerberg wrote:
> > On Mon, Oct 30, 2023 at 04:10:33PM +0200, Andy Shevchenko wrote:
> 
> ...
> 
> > > +config PINCTRL_INTEL_PLATFORM
> > > +	tristate "Intel pinctrl and GPIO platform driver"
> > > +	depends on ACPI
> > > +	select PINCTRL_INTEL
> > > +	help
> > > +	  This pinctrl driver provides an interface that allows configuring
> > > +	  of Intel PCH pins and using them as GPIOs.
> > 
> > Add here some description that explains why this needs to be enabled,
> > for example for Lunar Lake. Now it is all too generic for distro folks
> > to understand if this is needed or not.
> 
> OK!
> 
> ...
> 
> > > + * Copyright (C) 2021-2023, Intel Corporation
> > 
> > That's 2023
> 
> As-is it is still valid and reflects the history.
> 
> ...
> 
> > > +	ngpps = device_get_child_node_count(dev);
> > > +	if (ngpps == 0)
> > 
> > if (!nggps)
> 
> 0 is a plain number here (as count) and explicit comparison makes sense.
> But I'm okay with another form.
> 
> 
> > > +		return -ENODEV;
> 
> ...
> 
> > > +	ncommunities = 1,
> > 
> > Why this is 1? Can't we have more communities?
> 
> As for now (version 1.0 of the specification) it's assumed that it's one
> community per device node in the ACPI, so I would leave this as is (we have
> also drivers with single community per device node, hence this is kinda
> pattern. Should I add a comment?
> 

Yes, I think it warrants a comment.

> ...
> 
> > > +	struct device *dev = &pdev->dev;
> > > +	struct intel_pinctrl_soc_data *data;
> > 
> > 
> > Change the ordering of the above:
> > 
> > 	struct intel_pinctrl_soc_data *data;
> > 	struct device *dev = &pdev->dev;
> 
> Sure.
> 
> ...
> 
> > > +static const struct acpi_device_id intel_platform_pinctrl_acpi_match[] = {
> > > +	{ }
> > 
> > And add the _CID here in this patch as I commented in the last patch.
> 
> OK! I'll squash the next patch into this one.
> 
> > > +};
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 

