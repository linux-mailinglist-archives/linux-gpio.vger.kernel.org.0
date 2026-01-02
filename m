Return-Path: <linux-gpio+bounces-30072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F14CEE637
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 12:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C9863006F69
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 11:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224F62F5308;
	Fri,  2 Jan 2026 11:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlmdF7l4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C492F0C68;
	Fri,  2 Jan 2026 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353979; cv=none; b=CjZQKD8agJ5MMsaJ5Jjw2JaIEAB4seA6FHQQcjq2lXaeT0CeXIIqkVHwd5k/R3mlG+OYxPEUROjQ/hhaL12kmQlBttnq1CMXeIivpMhFLNpUr5/y9xBBgFjV7mVqtAzTKULzTwlcO1u2OiWHkWwVtE7vOeyJIS3tFv5koPcY/2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353979; c=relaxed/simple;
	bh=V+mvrspCEr1ENDWePx7PDCH5nlDayDVhNhZiHlQO9j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOKL5Y2n9iovFquEsmz3kF4dy4m66OHVTRfonrZOkX+q9OtsZQXfwMCgvpbwaxEubP6v4R7uAVeLkg/fr/3RK3VT2r+3LA9dUB1b7CpxgJ89nFEBc0VYsepp848wkaVJGAo/yxHUvgUWLEaIxVGkyx/cA42YOipxdK+QeVeySgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlmdF7l4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767353978; x=1798889978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V+mvrspCEr1ENDWePx7PDCH5nlDayDVhNhZiHlQO9j4=;
  b=jlmdF7l4epHcHOOu0cRRASUbjALmv6M3CDhwSkh+/EHaQoN09Mlg1ytK
   +EWpC2UskQZ0CFIjF0c27A7zFQtI7dV9TgyC92MhcEmcR1Q8ZYq00/Kpo
   ejNlxbNxL5bUaQ3aIvtlScrDUPuXyMetSOrONEYi1hLL1wJhpa3mAhjMK
   yAVgnNDFqMfSy2U9WlAyR/qlwPeaRTO+ybeJsrbIZ6HV8WPFCagMuKttr
   UAoDCuoPC+1UUaMHDLysLTxx3jTTWtUFKJ133gwKGAHrdriAcQ1QU8C/v
   JvuNz51/gg4lFacb4YhsNx9CJIdVP8cXPPAvLchK6d2FzSpvagFqRUaLh
   w==;
X-CSE-ConnectionGUID: l9tztG+WTHW1H3fP4h/7HQ==
X-CSE-MsgGUID: /qSH4/nDQk2ce5xKypep5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68044563"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="68044563"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 03:39:37 -0800
X-CSE-ConnectionGUID: X/omDzugRRytI/p+4hZ+8Q==
X-CSE-MsgGUID: 2kplrY42TluwkgHPpb3/BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="201431537"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.46])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 03:39:35 -0800
Date: Fri, 2 Jan 2026 13:39:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: swnode: restore the name of the undefined software
 node
Message-ID: <aVeudcz_Am5VDQHT@smile.fi.intel.com>
References: <20260102093349.17822-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102093349.17822-1-bartosz.golaszewski@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jan 02, 2026 at 10:33:49AM +0100, Bartosz Golaszewski wrote:
> Commit 6774a66d0e10 ("gpio: swnode: compare the "undefined" swnode by
> its address, not name") switched to comparing the software nodes by
> address instead of names but it's still useful to keep the name of the
> node to expose the relevant information over sysfs. Restore the
> human-readable name.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



