Return-Path: <linux-gpio+bounces-16329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B6FA3DFFD
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 17:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E2617AFF05
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F43220485B;
	Thu, 20 Feb 2025 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAyPfnQp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6683A200B9F;
	Thu, 20 Feb 2025 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740067384; cv=none; b=azlhos3OTdrUEZecnYBUm9hPERz/PQpE9p0DDa9w8xALZiiCAgALhmc4BXw4+tW7iX2qyprLyfnuZ9bbEK/rWpwbzmQNSwFWiDEBsbMVaJNf6vsb47BiqbnojNS4SOViv3E/qTAL1k/nRY07NKVjUxiEQ6dc8E5V2UfWPzBaN5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740067384; c=relaxed/simple;
	bh=DXh6ZOpLAsk+gnzEns7JS9itYOjku5L7H4Wx35b1dNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGPHKuHosx8h1M0naQ2dGNo0cvxvyKhxawY8wkq7/Vl5kvcqmPXFjbgid4IoyPrvBVyh4IS4ZHVAPrD1vTlGUOExq4Dh1T5tgRKnBYstUMLLx2kGevEzNmlsv/ndp7+X/toJFynNDUdaRq/IAs3swmCrVPt8wdDhaY1/zeY5Mt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAyPfnQp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740067382; x=1771603382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DXh6ZOpLAsk+gnzEns7JS9itYOjku5L7H4Wx35b1dNw=;
  b=BAyPfnQpLHcZWeEWsxjo7zQkfPLNfLdOfNccJh0M8ix/QeK5NdfDGCkj
   Sf+PoHMymzbMuGNBJfvu6Q1IjEsPNAPwHFNXmhZCt/NnOuDiBqTfV7vZU
   PPPUPsAnP2jt5xQkCFddD9YMuR34d4eYkBr+ts7hfRg/U/sDHC99AQITL
   /P9j7m24ADZ4Vg+/c0ODiuKzImzgxkNjcQq/Emhesmy8WosfOWC8XP0Bu
   bHrowaNFpldz4ElgLj2aL3bY/AY6o5T0Mf4t/4+TRMU9MzSYn8vTJPjJZ
   PHg0FqlRLkTC8Oh1RhDxlXY+GWx+YLDXIhy4MqUpNmOqoL3Ax36/PtKlF
   g==;
X-CSE-ConnectionGUID: QqOdCpU4R4CVB0P+OZVu4A==
X-CSE-MsgGUID: utI27JtuQKuy2TAcXtA79w==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40990649"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40990649"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 08:03:02 -0800
X-CSE-ConnectionGUID: cVUGvr2UTRanblOXTiNY9Q==
X-CSE-MsgGUID: +cNwrbWMT9y7Acj3Ue2+7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="120179048"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 08:02:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl90q-0000000DNpn-2W4z;
	Thu, 20 Feb 2025 18:02:56 +0200
Date: Thu, 20 Feb 2025 18:02:56 +0200
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
Message-ID: <Z7dSMK3tHC0Aq-GT@smile.fi.intel.com>
References: <20250220141645.2694039-1-andriy.shevchenko@linux.intel.com>
 <20250220141645.2694039-4-andriy.shevchenko@linux.intel.com>
 <Z7dKfwOrAuhuZvQt@black.fi.intel.com>
 <Z7dM6B-SFQ5Q77zy@smile.fi.intel.com>
 <Z7dPjp4t0MrhulSt@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7dPjp4t0MrhulSt@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 05:51:42PM +0200, Raag Jadav wrote:
> On Thu, Feb 20, 2025 at 05:40:24PM +0200, Andy Shevchenko wrote:
> > On Thu, Feb 20, 2025 at 05:30:07PM +0200, Raag Jadav wrote:
> > > On Thu, Feb 20, 2025 at 03:44:59PM +0200, Andy Shevchenko wrote:

...

> > > > +/* Same as devm_remove_action(), but doesn't WARN() if action wasn't added before */
> > > > +static inline
> > > > +void devm_remove_action_optional(struct device *dev, void (*action)(void *), void *data)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret = devm_remove_action_nowarn(dev, action, data);
> > > > +	if (ret == -ENOENT)
> > > > +		return;
> > > > +
> > > > +	WARN_ON(ret);
> > > > +}
> > > 
> > > Trying to wrap my head around this one, can't the user simply do
> > > 
> > > 	if (devm_is_action_added())
> > > 		devm_remove_action/_nowarn();
> > 
> > Hmm... Actually it sounds like a good point. I will check
> > (and I like the idea of dropping this patch).
> 
> And perhaps
> 
> s/devm_is_action_added/devm_action_is_added
> 
> But whichever you think _is best_ ;)

I thought about that and that's why I would like to stick to the my variant.

Thanks for the review!

-- 
With Best Regards,
Andy Shevchenko



