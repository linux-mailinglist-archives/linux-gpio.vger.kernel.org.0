Return-Path: <linux-gpio+bounces-15067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB85A1D434
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 11:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 116323A742B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 10:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48411FDA89;
	Mon, 27 Jan 2025 10:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJX2H0FJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A061FDA8A;
	Mon, 27 Jan 2025 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737972747; cv=none; b=CRCshUvvw+a51U4kAYbbf4f05jAccDEOcLOgp4s5TzSNGFu2gtDON0mKu0UmnqzwMct7NfuP9oVVVTVEEvDFwfB85/E1vV9Umszcyp3rZOKYQkRAS9NShXATsoCSogdYZOOTr0d14ROGA6bRnbp7U0+iygL+TglTC9qroOYZef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737972747; c=relaxed/simple;
	bh=btw8vAGwjLuPCEbGdCjtAaVzEucGkAjT2mzexRu5LZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIGiIVXVzEMnJbOOqBOo2XPytG8sjOSzNdZSnBsnjg4w+IbFNmm79CKLJ78JEKiSO5b68n4SSiYbHTPKh32HmglkMtxTufe54+H4LAlQWitXZf2AzYUvLsU3fhOT01HH2cWGyFvDmBqL5oJ5cZ1FBHvwJEXc7jCHdM3TG1exrMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJX2H0FJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737972746; x=1769508746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=btw8vAGwjLuPCEbGdCjtAaVzEucGkAjT2mzexRu5LZw=;
  b=iJX2H0FJF5ecOj0qtIPWGlQykYWypFsXqrhRSFsbJNaTZEqOYx9BtM9l
   CeaBP+La1Zq0JnfXvYvPz1j1VDvZqtHhg0wHUYh/is+RU2z5FQP/39fjy
   JpVDzkGIw5apEbYXm6oGJVyzpePcU/z0lbOef+NMcjqV0JU1d9b8SnxjF
   aaKek3jgefiO6VgPHdt19bGnoPgRxVSpt69kXljO1NREwRXFTmnhboSB7
   i8kgnniBfetbGXohHC0xuYERWO0W7nCBRdTMZlSbcTEuLRETX3AGsd47P
   YzpPfWwOt3e6RVeajpCDhArFg0R0vpqbLefM1fiw0DRQsSetMvv537W6C
   g==;
X-CSE-ConnectionGUID: h1eUW+sjQHe/p6W2h5F59A==
X-CSE-MsgGUID: k7N2ycLvR02MfgSh+SEObw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38528227"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38528227"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 02:12:26 -0800
X-CSE-ConnectionGUID: GszOZYpHTBShIDgh3n73MA==
X-CSE-MsgGUID: 0oppdaPzTGi0npaRdXrRbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="108501936"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 02:12:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tcM6P-00000005gft-0Zz1;
	Mon, 27 Jan 2025 12:12:21 +0200
Date: Mon, 27 Jan 2025 12:12:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: Improve interrupt support
Message-ID: <Z5dcBHtnegX2P9eg@smile.fi.intel.com>
References: <20240606033102.2271916-1-mark.tomlinson@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606033102.2271916-1-mark.tomlinson@alliedtelesis.co.nz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 06, 2024 at 03:31:02PM +1200, Mark Tomlinson wrote:
> The GPIO drivers with latch interrupt support (typically types starting
> with PCAL) have interrupt status registers to determine which particular
> inputs have caused an interrupt. Unfortunately there is no atomic
> operation to read these registers and clear the interrupt. Clearing the
> interrupt is done by reading the input registers.
> 
> The code was reading the interrupt status registers, and then reading
> the input registers. If an input changed between these two events it was
> lost.
> 
> The solution in this patch is to revert to the non-latch version of
> code, i.e. remembering the previous input status, and looking for the
> changes. This system results in no more I2C transfers, so is no slower.
> The latch property of the device still means interrupts will still be
> noticed if the input changes back to its initial state.

Sorry for such a delay. I think we are good to go with this and think
about any optimisations later on.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



