Return-Path: <linux-gpio+bounces-17526-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E40A5EF6C
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 10:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E2201897A30
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 09:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3806F263C7C;
	Thu, 13 Mar 2025 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fm+FYXMG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E922C80;
	Thu, 13 Mar 2025 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741857576; cv=none; b=cdxvLuC+uxgrjuXw5i9PKbRJa/mpFAFKiTFJJGIUd+T9gZMR93NoY4w9CMN8daEXDbnWyOar/hrZNLOT3+BFeMLEdWaBvz2AU35vDd1fAAHDf8MWpa+j5cpdOmfFITCTVZmjecftc0zhgF9fHreMgw49teE8ieP/lBINrTNIZuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741857576; c=relaxed/simple;
	bh=5buOl5HRVkX0rlEUW5blnF61KqXtRuzagl4PFP8Z7lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpFgDMhe/N/F7bwNaesYQu24ZRd6eU4oIkuwZ05qa8XzU938Yxgy48xDqzGFuUCpZHxqFa5spr8ttkaIsA/gqPIjsYMwiRcQyQGlL/KmsY9hwqf1BhxUfrWhrYocKQ7OGC5IfHG5BUYdd03/P7pCw9L2vorS74hleCRna0nC8+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fm+FYXMG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741857574; x=1773393574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5buOl5HRVkX0rlEUW5blnF61KqXtRuzagl4PFP8Z7lg=;
  b=fm+FYXMGwv7c4b3BPRdg0ugym8ih/IHO7VtNHNLatguDh32AQG17P8Ps
   FMu+8DWJ0yOIoSLFc8t0yW4O78aSXm3fyK3oy34PfogfZo1aq0wYN2Llm
   hU8S2m1mTi1oeGgcLs2OfkgE1iQ3qEHOLPr9dQv7u8JHDStg3ek5cG5/x
   m+BC2Kxfl5npMVoMB1hNU2WC3vcZ5pMXGdgUidhcSr5IkPRct3Te+CSuF
   3nSe3DRlylb5hOfqZJchWEd70VyVYPZGwm4iebOmQ/XBNCQQuwLtGPBIh
   OEWKrnd9su5IZpeFeIocuzsl/z+l2JsWm5h/p91wn9sQz4AD32o8tL2uS
   Q==;
X-CSE-ConnectionGUID: DZL3+Zq+Rn2qPS94PHY5zA==
X-CSE-MsgGUID: 6eOrnNxDSv6A85u7cx5PmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42843965"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="42843965"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 02:19:33 -0700
X-CSE-ConnectionGUID: /McIbDYgRE2AHQ6LGYM7bA==
X-CSE-MsgGUID: tBR3Hcn+QQiQesms5Vxg+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="125061786"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 02:19:31 -0700
Date: Thu, 13 Mar 2025 11:19:28 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z9KjIAMfRIegA2vI@black.fi.intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-3-raag.jadav@intel.com>
 <Z8_aJqNKK9AgBnK8@black.fi.intel.com>
 <Z9FpU0Ik_4yCU9XB@smile.fi.intel.com>
 <Z9G-RSfcRmALtgJe@black.fi.intel.com>
 <Z9HTU2BlXIa95S0V@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9HTU2BlXIa95S0V@smile.fi.intel.com>

On Wed, Mar 12, 2025 at 08:32:51PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 12, 2025 at 07:03:01PM +0200, Raag Jadav wrote:
> > On Wed, Mar 12, 2025 at 01:00:35PM +0200, Andy Shevchenko wrote:
> > > On Tue, Mar 11, 2025 at 08:37:26AM +0200, Raag Jadav wrote:
> > > > On Fri, Mar 07, 2025 at 10:52:28AM +0530, Raag Jadav wrote:
> > > > > Now that we have Intel MFD driver for PSE GPIO, depend on it.
> > > 
> > > > Andy, any guidance on GPIO?
> > > 
> > > I'm not sure what we are waiting here from me. Hadn't I reviewed your GPIO
> > > part already?
> > 
> > Ah, I added MFD dependency for leaf drivers after your v1 review.
> > So this one seems missing the tag. Can I add it?
> 
> I see, but this can be added later on.
> And on the second thought, do we accept the configurations
> when user wants to have GPIO on EHL, and doesn't care about TIO?

Yes, here we're making the leaf driver (GPIO) depend on MFD regardless
of what TIO config is.

> Maybe this patch is not needed after all?

My understanding is that GPIO should depend on MFD. Not much point in
adding a standalone leaf driver right?

Raag

