Return-Path: <linux-gpio+bounces-16325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E821A3DF5D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E641817A240
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEBB1FECA3;
	Thu, 20 Feb 2025 15:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yz5qjoGR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D8B1E5B78;
	Thu, 20 Feb 2025 15:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066670; cv=none; b=fBn97+9hHjFF/fWmzSLn1+khus6DfKqPJJC7tLfyqyq/x+A3DSlp+PflBe283XkSqq5RKzmyOnzEmJmAXVn7GjNYSe93JEwB1BxOgMbDtGFUr16tsmQePc8UUbO+sfyQOHWz2e9Hv5CWPnsgS9hj6EtmjqJuJpRozFRQPf8bGQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066670; c=relaxed/simple;
	bh=+2MUjbCa+6/uP+xBk14uglQoYufUxL/uj8e1kmFQ0D4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crOmhccxxa62SMLrqvEDj8GUOOaTw4xBAc2E9SiWm5qxqO/3UeFLYAR8rUwx1TuLecu+u/SydRHUXFwEj7SLRIirjyu3pNNkiipP56AAgnBNWfAextGqxk3cWUozqQCH4WTpWYNNzH0rdM5HPWuPMBZygYPsi5o9XE+Tu79JIKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yz5qjoGR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740066669; x=1771602669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+2MUjbCa+6/uP+xBk14uglQoYufUxL/uj8e1kmFQ0D4=;
  b=Yz5qjoGR1dTN+WnOAJBkTKmZcA7Iwh2eCmyn6iWTsTj55ESMILgRf6uO
   COusTDhVweCz7tc9NmBoT4cbyQKJFuPdgGSmVDSi8cIR1GVr2X+gXdrNd
   wnHf9dfjKfvi+Q7RVH77eQYqZzdQUPUcsTwEE/khIkdT2LgKLBx3Aw7wB
   x96Q1dFat7W0joC4c87TZMbAdZlWMBe4hWW5fckJbHXThfkLqaKvilYaA
   u3fVhyk3Xrehsaq/SLbZu7ZH5/Q0kF3PSlJc4+rKp+Lg3JgLSK4SIOvtM
   Oh+c6bGwLhMvl/mmXOakM+alYoSbfGlPv+p97RFBG5x7bl/qb8MT9TF7U
   w==;
X-CSE-ConnectionGUID: TfDVpFYCTrKp35nAE2K6gg==
X-CSE-MsgGUID: EHL9W0a2SLquPujTN/30ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40988498"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40988498"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:51:08 -0800
X-CSE-ConnectionGUID: ppWrqNqSQwCOThS6X1+cQw==
X-CSE-MsgGUID: Q+75E4/ASASw5LvrslftUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="115745550"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:51:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl8pM-0000000DNdi-25Xo;
	Thu, 20 Feb 2025 17:51:04 +0200
Date: Thu, 20 Feb 2025 17:51:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: : Switch to use for_each_gpiochip_node()
 helper
Message-ID: <Z7dPaDdM6wSY9U4a@smile.fi.intel.com>
References: <20250213193152.3120396-1-andriy.shevchenko@linux.intel.com>
 <Z65O_SaoSUcAY-rt@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z65O_SaoSUcAY-rt@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 13, 2025 at 09:58:53PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 13, 2025 at 09:31:52PM +0200, Andy Shevchenko wrote:
> > Switch the code to use for_each_gpiochip_node() helper.
> > 
> > While at it, correct header inclusion as device property APIs
> > are provided in property.h.
> 
> Linus, I forgot to update prefix. So, I will wait for other comments, etc.
> If no problems appear, can you fix that when applying, please?

Nevermind, I just sent a v2:
20250220155036.2734838-1-andriy.shevchenko@linux.intel.com

-- 
With Best Regards,
Andy Shevchenko



