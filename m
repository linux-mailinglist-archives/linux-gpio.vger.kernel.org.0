Return-Path: <linux-gpio+bounces-20422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F14ABF15C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 12:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B484716A6D1
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 10:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E9525C823;
	Wed, 21 May 2025 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMS0uO99"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F6A25B695
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822775; cv=none; b=RQPRJShNABrWNVaxwMkVM0AspbBr/o3Xgi3pjnny2G9jNxwk+Bae7/TECfmqnzqyD+muoaJGuuCvUIqB5j1Sk7DHphKBYMC5ZYZlw6czQT8qjAbMe/au9TEhtzqhL34RGMQ9WmYv/kju08XI9soulwD/ZmJ7P80TO2PoHS7Zz90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822775; c=relaxed/simple;
	bh=uLwna10GX7VtssLEB0pkIhAKMByA5j1CZ/wjZ8ozTaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1vh9I8mUnstdgq9d2GfsZeBR6EkUMmzzFWfzFTIj1tovLbnaNl27GrDyVEPNS+aKK7/WlKJ3bAZ6t5t2ic1SBPBffj0sl09IZMTKp9HwtWUrlp7MHn13weYVJ94djpMlcu9llXhOh7jy4vK40hHMLOm8Q24vhXciSgnmyOnLgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMS0uO99; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747822774; x=1779358774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uLwna10GX7VtssLEB0pkIhAKMByA5j1CZ/wjZ8ozTaQ=;
  b=IMS0uO99pWyW6cKMz6p+gVvuNXllEpM6ArgufiEsQdt0ZRvCc3Zd6cVu
   ZwiD15G8SM/ZMMqNspoJuU8HlXOAwO13JYYnMciD+j2uc8JRrdmrB74PG
   uXDTogrtHTDmoysnXD1k1l+VwLhY432r+260liWTDpHc8l39HIprRM29H
   xa/kPGNPZ2JkFJQM5e6y8clJQY4t2fDucwguUVx5iQHYDwBf0RtFVG+G0
   eJKNL/RNb0Ocar6VohxkyJ/hxMJDQoLEXORR6HljzmNmuys3dc6TNg6c5
   FSRBKMuWUjPrdPpaKLtmzdoZZB3e1DPvLPVZTeDJdjtiFGNmLXtUatPGm
   Q==;
X-CSE-ConnectionGUID: 45G6b/dDTFq7FmICy1O0Ng==
X-CSE-MsgGUID: s/ZHL5NsTvq3tpfiria/Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49853067"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49853067"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:19:33 -0700
X-CSE-ConnectionGUID: ZMOrAsA3SESWmoFylbcs3w==
X-CSE-MsgGUID: LUmrkcDGSvGsODDg612taA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140423075"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:19:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uHgXp-00000003aJv-1cTD;
	Wed, 21 May 2025 13:19:29 +0300
Date: Wed, 21 May 2025 13:19:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] intel-gpio for 6.16-1 (take 2)
Message-ID: <aC2osWHPV7JRh8K-@smile.fi.intel.com>
References: <aC2gABILEj1yRCxF@black.fi.intel.com>
 <CAMRc=Mcf3gAN-XoudVWBEQSMefbCH10Xci+AXz6-tJdaYRJH3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcf3gAN-XoudVWBEQSMefbCH10Xci+AXz6-tJdaYRJH3g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 21, 2025 at 12:04:59PM +0200, Bartosz Golaszewski wrote:
> On Wed, May 21, 2025 at 11:42 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Hi Linux GPIO  maintainers,
> >
> > The GPIO ACPI code rework is in this PR. The patches are in Linux Next
> > for at least a few days. However, one regression was reported and fixed
> > immediately, which becomes the last patch in the PR. It wasn't in Linux Next
> > since there was no Linux Next on this week. Nonetheless, Randy Dunlap tested
> > it independently, that's why I include it into PR (without this the checkpatch
> > and make htmldocs warn).
> >
> > Please, pull for v6.16-rc1.
> 
> Pulled, thanks!

Thank you!

-- 
With Best Regards,
Andy Shevchenko



