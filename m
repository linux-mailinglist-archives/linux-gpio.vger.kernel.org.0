Return-Path: <linux-gpio+bounces-21437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B9AD7078
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 14:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E35FB189D6C8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 12:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8E71E4A4;
	Thu, 12 Jun 2025 12:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qlr28VjV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CA62F432A;
	Thu, 12 Jun 2025 12:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731507; cv=none; b=ormSlg/7nZGBwaOMjq6YdlnbMWNqn/cmqh6rdv/w3sEVchVCmiKINONTKbogO0Bm2WISBnJ/0bDkVoG42x3a7Ip171mVTvaAnNWKcIXfAjI/ZTM0bxLNV2K0VKLnjfBNoSNNXcv4iFLNp5CCUPQ34YWesM0gx5G4UAaVe2Ux+qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731507; c=relaxed/simple;
	bh=q8t9IE1xat95XEHUqLu5tzXkvhvOsB1fDhOchG1+/Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8rEnjO80a8MN9EF5YHFHkp96tFWOamjyCMMIWkIHvf+51nNCMl5wOC686nyONbHOAm/rWVaGEZNzzdrCLIoLhbNL6eMQLoCgrl/l50qq5EugPI7nxQE1FJzpQAlpa3sXr0nDvFO79ct7AwE5Rv+tQVJYdPDLeh2GZKdB3442wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qlr28VjV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749731505; x=1781267505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q8t9IE1xat95XEHUqLu5tzXkvhvOsB1fDhOchG1+/Ug=;
  b=Qlr28VjV+WhiKlg359AELx7JSfwUh9clsmDJQCP7QlzNh36LESQJ0HTW
   r+S94QpYYYvWHVgzAImzWJNVrHWzhUegdgb/6zYS5djXXIK6k6NQ6AIsy
   kEl8ll4ix1Ycq+FAuKkKwz2RRyiysj+U2dyAzIPfg2A8Kyw3wzWXCn2A5
   8GCMgtxQASDDEp94VfB1XbFjSp5KrR1r/Sv2YHwD81wtv9EYOW7jzOSY8
   uoeS3SYgHsK+dRbiY0WSmP/4KvFJRY3yfiwfKIFYun3dRfI9RyQKPbi1N
   E+oFgtnH9HZGuBzv2q8Zdu/AL4gIeTmBX+9HC1CPXtvGuY/G0KgnKdGS3
   w==;
X-CSE-ConnectionGUID: ZsbSdjFFSy2VOnd1fwE/Mw==
X-CSE-MsgGUID: mGITkd7FT2W76QnDDrXLIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63252414"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="63252414"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:31:45 -0700
X-CSE-ConnectionGUID: /y8wygsjQ6Sxewy2Wxt2Cw==
X-CSE-MsgGUID: SjT3GP9MTB6DaVvHEkcFIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="147356647"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:31:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPh5n-00000005wqx-21Vy;
	Thu, 12 Jun 2025 15:31:39 +0300
Date: Thu, 12 Jun 2025 15:31:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: fix build warnings about export.h
Message-ID: <aErIqz1osBfLeNFH@smile.fi.intel.com>
References: <20250611180956.2780365-1-andriy.shevchenko@linux.intel.com>
 <20250612051258.GH2063270@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612051258.GH2063270@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 12, 2025 at 08:12:58AM +0300, Mika Westerberg wrote:
> On Wed, Jun 11, 2025 at 09:09:56PM +0300, Andy Shevchenko wrote:
> > After commit a934a57a42f64a4 ("scripts/misc-check: check missing #include
> > <linux/export.h> when W=1") and 7d95680d64ac8e836c ("scripts/misc-check:
> > check unnecessary #include <linux/export.h> when W=1"), we get some build
> > warnings with W=1:
> > 
> > pinctrl-intel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> > 
> > So fix these build warnings for the driver code.
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



