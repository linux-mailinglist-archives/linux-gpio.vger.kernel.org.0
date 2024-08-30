Return-Path: <linux-gpio+bounces-9420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DAA965692
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 06:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94A8A28568D
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 04:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9921C13B280;
	Fri, 30 Aug 2024 04:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKGDjTDK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80872481AB;
	Fri, 30 Aug 2024 04:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724993506; cv=none; b=eUyP+uXI3tB8GMHT8LXbMM1XmjzTZeVDGKOYjZRWPzjrlFm1B49Pf56rcHS3BAEd/Tqc5OL/qleSetFU1FaX7MN7P4eIm4WtYGBmtgtjaOH+mu6aukZZ2EfWssck3Cyp3067blSoZ6VjJBjrb+imTpBPViqfFzuXmpqNBDNbyAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724993506; c=relaxed/simple;
	bh=2wTGFT6AyIs95nsUriB/96AEDnUobdVcR+tW8y677sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atEKrTZoQFvKoXqRkQmhEpR3V5sEG9cEDWpMfZZabfiz4P624peo/1uog9wiechcp89Oime7WHuLCK2E1L9Wl7SvN4vcjqlPI59VIgGEPnmk/HPXsFg7ONukOpNAk37o1m4GoNUtMceX6Q4a8vbpGPEFQTtCn2/VRprKkGAi8fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKGDjTDK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724993505; x=1756529505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2wTGFT6AyIs95nsUriB/96AEDnUobdVcR+tW8y677sc=;
  b=nKGDjTDKcS86HEtXM+WijDDdByLZU1p1mgX9X0ADTYA6aP7ZazfAx3/U
   91tVZlV5eHQubfyyWcKD+bTVI1irt+goUp8V84MukMqhc6xjGOfLDvXua
   cXOPXceEtv1IOsLnZ5UEwm4aXSX/x5l352GHu0EHiWAgSndyZoEkR6LBi
   wieU5uMEI2IuqwpJ37Q/IOXYZemo2gXbGlZMoklOC1PiqAsr0Pasdr0Wz
   /Je4L5Lntwoao76LG1L3wUeauofCIGJ4nxA4HSSdwaxDZmxAOFs2wHX+Y
   hUW/S2LDdJCnZpUJpd4p+BwERES2rU1ADGiXN7RVqTIHQtYrzlIWmwJ8M
   Q==;
X-CSE-ConnectionGUID: VaEAYDALS9WpD4BLgTHWOg==
X-CSE-MsgGUID: qmEpNRLTQa6u/2fhdZo0dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27501153"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="27501153"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 21:51:44 -0700
X-CSE-ConnectionGUID: 1+yVm4H7Tg+x+2dg+4/gwA==
X-CSE-MsgGUID: YE4YbLKqRvW9Tx71ljbHrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="68452736"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 29 Aug 2024 21:51:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 74D57142; Fri, 30 Aug 2024 07:51:41 +0300 (EEST)
Date: Fri, 30 Aug 2024 07:51:41 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 0/6] pinctrl: intel: High impedance impl. and cleanups
Message-ID: <20240830045141.GV1532424@black.fi.intel.com>
References: <20240829140406.357612-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240829140406.357612-1-andriy.shevchenko@linux.intel.com>

On Thu, Aug 29, 2024 at 04:59:14PM +0300, Andy Shevchenko wrote:
> We would need a high impedance implementation for a quirk, so here it
> is. While doing this series I also noticed a couple of opportunities
> to clean up, hence a few more patches (1st, 5th, and 6th).
> 
> Series has been tested on Intel Meteor Lake-P.
> 
> v2:
> - fixed a bug in patch 1 when applying debounce value
> - updated enum style (Mika)
> - made intel_gpio_set_high_impedance return void (Mika)
> - new patch to constify intel_get_community()
> - resplit "absolutely grotesque" macro to four (Mika)
> - ...and update more users, this shrinks binary a lot
> 
> Andy Shevchenko (6):
>   pinctrl: intel: Move debounce validation out of the lock
>   pinctrl: intel: Refactor __intel_gpio_set_direction() to be more
>     useful
>   pinctrl: intel: Add __intel_gpio_get_direction() helper
>   pinctrl: intel: Implement high impedance support
>   pinctrl: intel: Constify intel_get_community() returned object
>   pinctrl: intel: Introduce for_each_intel_gpio_group() helper et al.

I sent one minor comment for the last patch. For the series,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

