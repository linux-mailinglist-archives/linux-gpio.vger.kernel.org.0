Return-Path: <linux-gpio+bounces-27269-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70CBED812
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 21:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F01A7188B56F
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 19:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E6D25D540;
	Sat, 18 Oct 2025 19:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxN4dqgS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D7523183A;
	Sat, 18 Oct 2025 19:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760814085; cv=none; b=s3V3Ea4PZsWDknV6I8+a3GAxkcAsy4dWaFaMkGNYcMk6Pl3AcSIKO6TVM/AW6XFy3Zigx27lBJgakDj/AK9mW8XLllz09ausZ/jv5EU/VL0ob5WRcgV8IQbuEfCq+vHG4keK0vna0SUXR2wP1+mbp2KTO+9JIyJrKtOg2uliGgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760814085; c=relaxed/simple;
	bh=cR4oJNEQAzKadEaDM2Jiqow08cnvoWVYm0XHIuroqGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cf6OV2jPbs2/kyiSAMgzPUJBwGtEtVNc0VqtoRiNEn0tqMhb51NBtWiOar111sC48hp7gJnnGT2ASQuACkXduZJYzDSr7i6KPPR0yBBNsk+Okmt7U+yGNOWW7DJzHEzODxMsFU8xj3yQWWJvgfq/LQjUx93dYCmdZIdmP9R7Thk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxN4dqgS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760814083; x=1792350083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cR4oJNEQAzKadEaDM2Jiqow08cnvoWVYm0XHIuroqGk=;
  b=MxN4dqgSanj2wmOg+GgxhE2GSRrVfKFb2pvhcHLH7ahc5kM2k7+SZiiS
   KbkAga3ZrOHIYYrAZf65G5Jh6yX4It+1YQn4FiGfHUxAYbrwJJ4/eV330
   rIb+y1vMGVKLyXNmTAtfYm3LcaULG6Au3U7L74jgUY6xhYp41rQ088Rak
   FpHQPMWgrP2N16I7TSn+qr6c1S/ldqxJzdDMhQePrFnowlQaWOQDCGims
   WWBXbCdvsBaVekDrT/XikBluzh0d4ToVjzN6iYvjctZLV2t6UpvG1u4XX
   BqFxIBHZ+BJVxxUOkSUJyLvx/p1bUIhMWPo2/NOfXajl0mGBsdUSTJrXo
   Q==;
X-CSE-ConnectionGUID: UcKUhnnZTjS2x2R24Vixuw==
X-CSE-MsgGUID: h8FY+yYBRQaSAALaYL0U4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62894010"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="62894010"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:01:22 -0700
X-CSE-ConnectionGUID: eIUbPiyiQLu2c6t6Zrqqxw==
X-CSE-MsgGUID: qHjfYgBNRe2GdP/lMsc0/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="182698676"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.194])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:01:20 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vACB3-00000000xAF-1SAk;
	Sat, 18 Oct 2025 22:01:17 +0300
Date: Sat, 18 Oct 2025 22:01:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] gpio: 104-idio-16: Define maximum valid register
 address offset
Message-ID: <aPPj_WfdUGPoeTKA@ashevche-desk.local>
References: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
 <20251017-fix-gpio-idio-16-regmap-v1-1-a7c71080f740@kernel.org>
 <aPPj22GL56sP1gOK@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPPj22GL56sP1gOK@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 18, 2025 at 10:00:44PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 17, 2025 at 09:58:01AM +0900, William Breathitt Gray wrote:
> > Attempting to load the 104-idio-16 module fails during regmap
> > initialization with a return error -EINVAL. This is a result of the
> > regmap cache failing initialization. Set the idio_16_regmap_config
> > max_register member to fix this failure.
> 
> > Fixes: 2c210c9a34a3 ("gpio: 104-idio-16: Migrate to the regmap API")
> > Reported-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> > Link: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com
> 
> Link --> Closes ?

Seems for all patches in the series :-)

-- 
With Best Regards,
Andy Shevchenko



