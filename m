Return-Path: <linux-gpio+bounces-12357-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C70449B785C
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 11:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B1DE2817DE
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 10:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF811991B8;
	Thu, 31 Oct 2024 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bb3tBctS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A93C1990B7;
	Thu, 31 Oct 2024 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730369283; cv=none; b=vEcBvBgQ7WIz70tJnDNXZ+bhkI8z/P/P4AX5eLl6SJo6O++C/BBoFZCAQQnRHIPyl19VADpkLKc0UP4gdi4V0aA84fflUCe3L1XSBrai9Cyenp4ielwkuOR+SbwvI2Hm505Co9RFgro42zecV1gns4KHSu2k93jq+3Ji+uogoG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730369283; c=relaxed/simple;
	bh=xnxIa7h+9xLmfUxdr0QYpkj9ql7Nv78tG+yBmVfcPeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTlMNrC5sQJB0bAnBNnmhycULbdvmjCe61gLNmilWBiRfidTrTdCDq+HXoU/aOf3QsdJ8cudIoYnq3oKfdjfNq3LJpqgJdCDA16YYuMTxwcFOeHoJaN/vlXRGkhFrQsgOBdaHP5zAUuH84nxefNwmRA2qu6GouzuupR/N7f0a2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bb3tBctS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730369281; x=1761905281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xnxIa7h+9xLmfUxdr0QYpkj9ql7Nv78tG+yBmVfcPeg=;
  b=Bb3tBctS1tKXtupzcCan0AioyJWw0+nOl1Dz1duT3/6QmQNa5gSKj0rh
   ZNkP0CB/cTBKYzKEzP7RR0aq1zH90SenRQ7qZ4TFAW/Piknt/xWfpaWs5
   rMQ4XnG0kEGdc/AXBjUPcOKEWoIAtzKhN6INraRawZx+NfIdjhWpAZ9pM
   I9vKJRjoL3jgQc3WrcBqAIPSVbnxCfk9AHwfQ4g5VVMASXoMehAsRiiwa
   n5ftdDnzSOkZXLM+wnf1XqMxImOknNj4HYLBBs0KKROCR/Rn2wMmORXuD
   W2BPCMQnO4X5vszLznX+bNVg3jONR0MyxlqawF3zrbdD21zqygxSqoin6
   w==;
X-CSE-ConnectionGUID: Ft6j4kyoR0iYS1j1UC6FGg==
X-CSE-MsgGUID: LTlV6xhwS6yjiZ84NZmwHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40646707"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40646707"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:08:01 -0700
X-CSE-ConnectionGUID: jHetEqXtRIaSdGFJgMr1tg==
X-CSE-MsgGUID: 3yyP+9U0T5ec0ij+QY8OUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82704658"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:07:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t6S5s-00000009bOI-3uPc;
	Thu, 31 Oct 2024 12:07:56 +0200
Date: Thu, 31 Oct 2024 12:07:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mun Yew Tham <mun.yew.tham@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/1] gpio: altera: Drop legacy-of-mm-gpiochip.h header
Message-ID: <ZyNW_A42ecbu3LAD@smile.fi.intel.com>
References: <20241031100608.2401209-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031100608.2401209-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 31, 2024 at 12:06:08PM +0200, Andy Shevchenko wrote:
> Remove legacy-of-mm-gpiochip.h header file, replace of_* functions
> and structs with appropriate alternatives.

It missed to drop selections in Kconfig, I'll send v2 soon.

-- 
With Best Regards,
Andy Shevchenko



