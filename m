Return-Path: <linux-gpio+bounces-11857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 276F19ACD82
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 16:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95446B25011
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 14:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3DE1D1E77;
	Wed, 23 Oct 2024 14:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtJ7xwPd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280521CB51D;
	Wed, 23 Oct 2024 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729694334; cv=none; b=A3nMmYexkA3a16zji7IJoBEYUXP24QwGRJRhjgyMmMlWtilAe/YsXY8xf00IEJ+M4H7KYEEA87+VTMcdAqhyj6Qy5Jt75R/RKRAhf1r91hsZzOLFiiBK/KWpljdloWxsW6hiaSqntk5iu5UrB8aa4+tWgcPThpic5LiDWjXAZic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729694334; c=relaxed/simple;
	bh=Ba/t7XJhyfeWS4PSORJvFeGXTYFHtcYoD6mXrqEYwvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOnYfTFMHHnytJnRAUs0C7MrGERexBl+9QvE1azcNur7Kvnl6i8+dOUdxxbWAJjBHywooqLfdRRbJvrexO1GcgDGSLbLoAfjHijcTck+tmFSE9Xv+HbSJACxQWiUF/I+u2sIDVwNGZDejdIuN82pkZYQ+cb19lReqE9GKiRuCTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtJ7xwPd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729694333; x=1761230333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ba/t7XJhyfeWS4PSORJvFeGXTYFHtcYoD6mXrqEYwvE=;
  b=OtJ7xwPdlb/XHmFw1u/QmF/wF91K98teqX26QIBqnjyee1SSHJGcS+Do
   6laHylk7uKK5jGIEHDSQ9Moyx9s+LWUkZhh4EJnWxQHKr2lUzS2fBuYMo
   zJKeQNvf44RFpT20rhwHiEoLG63iaB+P+6/oBi/ZiQ6nkQ+5QnoFWUe3Z
   b4qU+NxNM7eLwBWRm0cwfJqfeSS6U1hWQSJY4aWI5V0GEu/5fLlr+g1Np
   TLH10FJvuv9HH9JKoNxT6AFxpvxVK5c9XIpVBJqiX+seB0cIcxpTDmuVN
   KWld8Dq8JvNE9s1BzCQp2A6zIKtF5tKER+wKLdwOQTC+A4IcZvVeFjEK8
   w==;
X-CSE-ConnectionGUID: rwLPETSgQh6K/ZBJgkvxPA==
X-CSE-MsgGUID: /7xhnxIdRSmDSC9rwvLEjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33093332"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="33093332"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 07:38:53 -0700
X-CSE-ConnectionGUID: 2hK0MmFnS/KJFVzgqrvDmA==
X-CSE-MsgGUID: NMRGm6uWRTSZQsz9Vv9kTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="80640965"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 07:38:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t3cVc-00000006Ev4-1qr1;
	Wed, 23 Oct 2024 17:38:48 +0300
Date: Wed, 23 Oct 2024 17:38:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] gpio: mb86s7x: remove some dead code in
 mb86s70_gpio_to_irq()
Message-ID: <ZxkKeOWPlPRLrZdY@smile.fi.intel.com>
References: <b7f3a78b-7163-42a0-bd09-8b3184f29661@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7f3a78b-7163-42a0-bd09-8b3184f29661@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 23, 2024 at 11:35:53AM +0300, Dan Carpenter wrote:
> The platform_get_irq() function never returns zero so delete this check.

Yes, effectively a dead code.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



