Return-Path: <linux-gpio+bounces-17507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43EA5E227
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 18:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC9B16B624
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 17:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2752F1D5ACE;
	Wed, 12 Mar 2025 17:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwBa9o4W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766E4282F1;
	Wed, 12 Mar 2025 17:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741799003; cv=none; b=UW1UWHBkmHdQC/H42x7y8MhpSM/CIel7fbmqWOJmEKH/n/h1WIVp8+uVfrWpGvG6FVnBdAd1ApG4l3N/SVBd+uEe2XTvrny4eWQDqglPL67Y0iUP71rXBOS/2sm8wFfZqDxKa0gpMO0nBYRvjPquYVVPut3aRCuUsnydJ81JGmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741799003; c=relaxed/simple;
	bh=vFk1O2Xe2fkX6Vb05v8JRfNT6bxAsWK/zVtp0jStCCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVsqif7my0UVFzrMAN+AVMxSw0A0lDyOZsgwvUB1MhgqD2fIo0fZNT6GaMa9xT1jU9q7ydWN7e2vTrHVIGLLG694kYL0UpQfWl6TWfT9ta9qaqFWMefFh5Zc9UIIcqyQegfaemgDxFJTESj+X9+K+4CyCli9kOrZtnjGnCpU9+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwBa9o4W; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741799003; x=1773335003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vFk1O2Xe2fkX6Vb05v8JRfNT6bxAsWK/zVtp0jStCCw=;
  b=fwBa9o4W4OKbXHHFZDpcraTpcPyHcr2mX1+ba3wdzHr4h0HpY+JNY56n
   VSuo+ORAEoOyGpteDxV0W9hmd+jSChZLqDfmmztSDJhSSEA8u87P5nKsU
   2tuyxevkYClD4MRN4A1/PlPvIkLQmWFCLPHj9yyNh8qV8hUeXIxgA79Jr
   KKrDotANNCiARKHywvTOFKmRNfWq7OkpTFuy1czFixhsHZIQn7l24ATgk
   xF7AdQRgtObQIxNd98pFnBH+bSxXVPXELbHhuGBjWCx+rdgCgwgSlIb/7
   3Sfw32nC5AP3GqvLUtH1YeSa8kQAh6y8aoNReLI/ATgJWDMGHWFWScHuY
   w==;
X-CSE-ConnectionGUID: pJv/kOJMRjOuuihA204pOg==
X-CSE-MsgGUID: V3dzjLUXRt2TZD50NstqlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43022803"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="43022803"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 10:03:06 -0700
X-CSE-ConnectionGUID: jQD/AnpUQRueAhXcqkE3/w==
X-CSE-MsgGUID: zpRpi/IMTFmefblLWSUFJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="151659811"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 10:03:04 -0700
Date: Wed, 12 Mar 2025 19:03:01 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z9G-RSfcRmALtgJe@black.fi.intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-3-raag.jadav@intel.com>
 <Z8_aJqNKK9AgBnK8@black.fi.intel.com>
 <Z9FpU0Ik_4yCU9XB@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9FpU0Ik_4yCU9XB@smile.fi.intel.com>

On Wed, Mar 12, 2025 at 01:00:35PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 11, 2025 at 08:37:26AM +0200, Raag Jadav wrote:
> > On Fri, Mar 07, 2025 at 10:52:28AM +0530, Raag Jadav wrote:
> > > Now that we have Intel MFD driver for PSE GPIO, depend on it.
> 
> > Andy, any guidance on GPIO?
> 
> I'm not sure what we are waiting here from me. Hadn't I reviewed your GPIO
> part already?

Ah, I added MFD dependency for leaf drivers after your v1 review.
So this one seems missing the tag. Can I add it?

Raag

