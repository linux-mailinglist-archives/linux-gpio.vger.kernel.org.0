Return-Path: <linux-gpio+bounces-16323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64622A3DEF0
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C258F16940D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958201F8917;
	Thu, 20 Feb 2025 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAPNtAex"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D0B61FCE;
	Thu, 20 Feb 2025 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066032; cv=none; b=oEfKoDhV3E66/ZVz4Vj+hwQMfYEp4G4VB2qKEHapZd+TkkfkrTIwvW+A+yIM1MgRUbfVdlACgL0sp+BumsPM0y6yWHldxEu8PY092/hiS4odc+0pMNAy3OsPhTBijBxNjaNBwK9nm8NJ7AXxY+E8syGqbW0xGW+Asv/OP0jQdnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066032; c=relaxed/simple;
	bh=wSlx3nbyl+QUhdwR4/dmvY6S2qkZTDIv+jJEZGSpKk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNZdq37G130Y+JcAR/6AavEfD7ZzGb7hOBE7F9kWXnCjrCjBJhaMmAGMN5Bi1ml7/Sjua08V23PSE1rn9Xk4ueWDtor9q43RYlMBVjjvI4feBQGzcR5kaoqu946mQUqMGFzt7GVJmqOwf/egyKCukdLC6QiowPD6lzJeuLSJoeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAPNtAex; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740066031; x=1771602031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wSlx3nbyl+QUhdwR4/dmvY6S2qkZTDIv+jJEZGSpKk0=;
  b=SAPNtAexPi2wVdauxOlRLuWFZIIsVPdOHHU3SFmHzLazX6T60oiRg/h8
   bUiNXtttS8I7QFcTt9btLaLEuKjNKkI52XPXOf+OJnC74bI+nHfWOhM76
   mg7/qpOLpufDt1fWl6c+qcJSijxE/con6OPNMkBe48NP3q8WdrFYaERTl
   oWKzvLN1W9Ok/jge5RHwoo/qcsGn1SakF+T84K4esb1l+r474M8uOBdP7
   6c7OuCjXmKTOIQMx5+x8/txjyw6S7QjwKabzoUXFBzZtODTKXfc13GCR4
   YTLE9v/3sKPa7RJCTddINbApN/UdxAiSvH59RyUjLfEWIiRTZMi+gIhQM
   g==;
X-CSE-ConnectionGUID: rFAsKZE4QLujr+2wT7b9vQ==
X-CSE-MsgGUID: cdZrk7F2SJiNqEqwZ2mD6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52282085"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52282085"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:40:30 -0800
X-CSE-ConnectionGUID: VJ7ovDxMTBGNCdoNTzEQVA==
X-CSE-MsgGUID: OAYTIX8DQ/6sqsVgwcAaCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115563011"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:40:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl8f2-0000000DNU9-1vyN;
	Thu, 20 Feb 2025 17:40:24 +0200
Date: Thu, 20 Feb 2025 17:40:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 3/4] devres: Add devm_remove_action_optional() helper
Message-ID: <Z7dM6B-SFQ5Q77zy@smile.fi.intel.com>
References: <20250220141645.2694039-1-andriy.shevchenko@linux.intel.com>
 <20250220141645.2694039-4-andriy.shevchenko@linux.intel.com>
 <Z7dKfwOrAuhuZvQt@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7dKfwOrAuhuZvQt@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 05:30:07PM +0200, Raag Jadav wrote:
> On Thu, Feb 20, 2025 at 03:44:59PM +0200, Andy Shevchenko wrote:

...

> > +/* Same as devm_remove_action(), but doesn't WARN() if action wasn't added before */
> > +static inline
> > +void devm_remove_action_optional(struct device *dev, void (*action)(void *), void *data)
> > +{
> > +	int ret;
> > +
> > +	ret = devm_remove_action_nowarn(dev, action, data);
> > +	if (ret == -ENOENT)
> > +		return;
> > +
> > +	WARN_ON(ret);
> > +}
> 
> Trying to wrap my head around this one, can't the user simply do
> 
> 	if (devm_is_action_added())
> 		devm_remove_action/_nowarn();

Hmm... Actually it sounds like a good point. I will check
(and I like the idea of dropping this patch).

-- 
With Best Regards,
Andy Shevchenko



