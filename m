Return-Path: <linux-gpio+bounces-17860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE8A6BBAC
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 14:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 065F57A4CF2
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 13:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A732C22A7F4;
	Fri, 21 Mar 2025 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0HJmnM5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1319B1DFF7;
	Fri, 21 Mar 2025 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742563363; cv=none; b=EvLDXYWuy72Md/xIN6OmX2zIuurfm9+UdhWd745DzRcNxjD3ebZoU4vXaRdweKuyuRKdI48Ra7J+21ojBdMcMCfV60XjzhdMen56h2vOGEDLbpv9aawdaSTEOJbLbyHV3vlQQrBeG6tbOSw6iKc8nXSSSTdfWMoG3CRuI52EqBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742563363; c=relaxed/simple;
	bh=cUsg8Wa/PpL9JmY8Y/dmKT8tlFCy6iKHRU18BFHKJpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSq0fSf+T+fXzEYVeiruWn6XjP0nWoCnP7e7XomhCV2zMbJDqumczFIt/6cUNKlVTYCW76msKefsW9BkDKcaODRbZLJZ7Ltj7uBxbuVk7Jrtt3UdLS/YLDDsscexPqwBSh1k73D/au5yrH7VA+eLvvkANQQqLvouFN0Hb1J9SkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0HJmnM5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742563362; x=1774099362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cUsg8Wa/PpL9JmY8Y/dmKT8tlFCy6iKHRU18BFHKJpc=;
  b=j0HJmnM5PevYlofZnzXLJxeasx5K4Ut3RNr1W82PGTfM+D52ZKyn3UXa
   EM1NQFXlyVxb4FJ6aKJbqwAH5wnBLgJKKy/Xc6zYJd6znP6YY8wYOiXKG
   46wYo4ASFgr83p4MV6hGk/fNwmSx9zzQay7IndsxRxecfMjrFg2SK/tpp
   f6wQAezGMwnRcmhb/AGn82yos6CF9096HinDOXH9uN8Lk/OsBdON/nWFE
   OmYLh8/UunNH9WIDf1tSEJhIeA+Fl9C+gol76W0oZh9g2DAaCxF6wTXlX
   z/8kUnaSIkn9+rg6yA5jwuBW3vIFFy4oWsdYibbY216r6RImiwoN9wzHP
   A==;
X-CSE-ConnectionGUID: 8p8VmrBMTTiiXT3DN5z6dw==
X-CSE-MsgGUID: zaJyLfY7QlmBSZ0B680Pkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="55212052"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="55212052"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 06:22:41 -0700
X-CSE-ConnectionGUID: TUPN8X8ETeGjJn6DcPWV6A==
X-CSE-MsgGUID: iM5eLvNwR12DMvpwbYyoXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="123860821"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 06:22:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tvcKa-00000004WQp-1AAK;
	Fri, 21 Mar 2025 15:22:36 +0200
Date: Fri, 21 Mar 2025 15:22:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Raag Jadav <raag.jadav@intel.com>, Lee Jones <lee@kernel.org>,
	giometti@enneenne.com, raymond.tan@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z91oHCpfOkvgJmzP@smile.fi.intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-2-raag.jadav@intel.com>
 <20250314124450.GP3890718@google.com>
 <Z9QxqH3DJvyW3sjo@smile.fi.intel.com>
 <20250314135735.GQ3890718@google.com>
 <Z9z49lfWV6LjUnaI@black.fi.intel.com>
 <2025032115-gloomily-cubbyhole-dd8e@gregkh>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025032115-gloomily-cubbyhole-dd8e@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Mar 21, 2025 at 06:04:38AM -0700, Greg KH wrote:
> On Fri, Mar 21, 2025 at 07:28:22AM +0200, Raag Jadav wrote:
> > On Fri, Mar 14, 2025 at 01:57:35PM +0000, Lee Jones wrote:
> > > On Fri, 14 Mar 2025, Andy Shevchenko wrote:

...

> > > Also, Greg has been quite vocal about converting PCI devices to Platform
> > > ones in the past.  We may wish to run this past him before continuing.
> > 
> > Greg, any objections on moving forward with platform device?
> 
> I have no context here at all, why would a PCI device EVER be a platform
> device?  That feels wrong on so many levels...

It's a multi-functional device, in other words that device provides a set of
(dependent or independent) subdevices. But do you have other suggestion?
The auxiliary bus?

-- 
With Best Regards,
Andy Shevchenko



