Return-Path: <linux-gpio+bounces-14910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 109ECA15294
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 16:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8466D7A45B7
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A0919258B;
	Fri, 17 Jan 2025 15:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjv6efLV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C501518D626;
	Fri, 17 Jan 2025 15:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737126822; cv=none; b=JE3VcmJeHHec3jQubN4dSCZ6XMdx04Xs6wOo6Tvc8VkwktehJGFSFRcrjnjHqIGcS0/WkzVLCDJ079X+djcOJ8AHm6cWXVJjHGeHfCjaYkOd/uk8Jgl1w1dXzHdz4fbyeGOYvcEoGmhJ6z1o3u4dq5cBd+6cMnUQgK6kO3NxG4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737126822; c=relaxed/simple;
	bh=kYNPaGb81JPvLDH9frMDzHZMWsfl2pkpZ5YGNIMpK+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4vaKDwgJtL+6ue20KHKBDo/W1w1SgPfc9PWIDqjmMSYZC202Pu95oWNlyYnttorNpfHAafxyx/c2yfXHx/aaiUNScD1dHblVmaMtQoOBYdOX0u6LnZ18mQK/VuKaMrRRScqwDdtZg/TGv4n5/wtTjpWnpi16bTznoWHAVNWkYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjv6efLV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737126821; x=1768662821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kYNPaGb81JPvLDH9frMDzHZMWsfl2pkpZ5YGNIMpK+I=;
  b=kjv6efLV2tkmVDfveWxQpKSkGuMwhgAlJ2RWumP66B6IzbxYtvB1mi/q
   XHVGn1i0A9Ven7s6HSVoUK0Q/p1jyFuO4PCShNvs4592I+I/zUfOvJ/ZS
   VjdA4u1ikR2mp87SHkcHlA4Ngjkl73mijz3uCjNJkhe/n/NpZIpGlde13
   m7eW50dUfCTa9SVv4rRV7t6b5vc6deibxFdtV9xcQppDw/4HKxlAWq2WX
   Hydp8U66kulZbFZwJ7CzxC1bi7b2wyu9nlkEqehSJl0Q2XE/xyrh0BQ4o
   4Q/HRDprP3PTFnMdZklq3K6yCgu2iRRX3wqps4DyrJ2g+GR4LMVheZppZ
   A==;
X-CSE-ConnectionGUID: hBClqDOfTS+gptAh4LF47Q==
X-CSE-MsgGUID: uxbjaSwWTOWGNg1ADWIQvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="40370601"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="40370601"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 07:13:40 -0800
X-CSE-ConnectionGUID: EXmfFCVJSKiCz6NrlCn5sQ==
X-CSE-MsgGUID: elswTs/pR2CxcVT19lry2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136714747"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 07:13:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tYo2S-000000026fj-37qa;
	Fri, 17 Jan 2025 17:13:36 +0200
Date: Fri, 17 Jan 2025 17:13:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 05/16] pinctrl: cy8c95x0: Remove incorrectly set
 fields in regmap configuration
Message-ID: <Z4pzoNInabOHWjK5@smile.fi.intel.com>
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
 <20250117142304.596106-6-andriy.shevchenko@linux.intel.com>
 <CALNFmy2qGCt8OTb3qx+0PsPivbfY89gWe74Moeeu7r7hCp_UaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALNFmy2qGCt8OTb3qx+0PsPivbfY89gWe74Moeeu7r7hCp_UaA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 17, 2025 at 04:01:43PM +0100, Patrick Rudolph wrote:
> Hi Andy,
> On Fri, Jan 17, 2025 at 3:23 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > We don't provide defaults for the regmap, we shouldn't provide
> > the number of them either.
> The intention is to read back the defaults from HW to initialize the
> regmap cache.
> The defaults are applied at each POR from the device's internal EEPROM.
> See regcache_hw_init() for details.

Yes, I was looking a lot and that code and it doesn't work as intended.
I can reproduce the issue, but it's real issue and I don't think we need
to read back anything from the HW forcibly. It will be done naturally, no?

-- 
With Best Regards,
Andy Shevchenko



