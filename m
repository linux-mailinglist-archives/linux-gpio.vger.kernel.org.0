Return-Path: <linux-gpio+bounces-24728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D03AB2F45F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 11:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA2DA17C0E6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 09:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D17E2EF648;
	Thu, 21 Aug 2025 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyosodKO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E585A2E62A7;
	Thu, 21 Aug 2025 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769480; cv=none; b=gdTRNL0rpNFNKxXkx/ksc/jjOBhI+mkc8RIRaY/1mOYgCjn6XK2qtTq41u3qksu696agp/FgWCx7TCvhZ0dnoNjciW2G5Ry/LWrnfOQs/f+h2LsHmOzeb/851l+gzbqsOQa4c+Cmu+nlatQvVAMKB8RcEl7jK37kOAK47u8qY64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769480; c=relaxed/simple;
	bh=vytwFqxKnCRxgYzo4eKIZdOx8l1zNVAVX40pAo1qThg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGqQo7VR5akHRutRtqRySPVxkUhvN/ozD0Z84Qui0uvj4GcqkuTz7pHHbtsKxLZLWhFGZveyF79UtTBppcWhosw8r25+uFSaTE4isMc8DMfmZFH1KxMIhWr8Ls0w4tGFrFPDFzTIQDcM8kONOs6482TWOQ+qhafQT+Th9hd7kps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyosodKO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755769479; x=1787305479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vytwFqxKnCRxgYzo4eKIZdOx8l1zNVAVX40pAo1qThg=;
  b=fyosodKOBQHkPUIPi2Y7GDGXo/OB3PdtXqe0rEtyajtreW5vLESwoNLz
   VFCIXiw3vPsN8sih/UQtMDf3SmkKkbSCSgTnDwzF+kO+VHJXsSGNBBjKr
   RXdAjp27PZqPutOUD2Nc3tQf/Cfw28V44ZZPTGnTshbTVTjfvhsALCehl
   TxIN8CenBuAKSpAbnq3kHuOfV/Vp/UXf2hkS12wPVPL0q0dZVHOpqKkz2
   yR0wpnpyzgn98uiA2aSg0izFtY3dMJABISVg7MCg+KIeGOBcZuv14sBDW
   1ESZtjB+d4itHG3wDjXzFdab1WyKdzzD3Rp1RJyUu2OUrMGoOO6BsbkA7
   A==;
X-CSE-ConnectionGUID: 37c0XM8FS2uj5BqXqIuZXQ==
X-CSE-MsgGUID: Xs8ZlFHtQ7mCxdlde3Ht1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57980083"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57980083"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:44:35 -0700
X-CSE-ConnectionGUID: SOjbcfa2QW67fvvs8GPzoQ==
X-CSE-MsgGUID: UK3ONSrgQiKcjyuJGJj2/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="205551755"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:44:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1up1qQ-00000007BlC-29YV;
	Thu, 21 Aug 2025 12:44:30 +0300
Date: Thu, 21 Aug 2025 12:44:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Marcos Del Sol Vives <marcos@orca.pet>, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: vortex: add new GPIO device driver
Message-ID: <aKbqfmpDvsUg1i-1@smile.fi.intel.com>
References: <aHD40TD8MLug0C6b@black.fi.intel.com>
 <20250820120101.254206-1-wbg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820120101.254206-1-wbg@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 20, 2025 at 09:00:48PM +0900, William Breathitt Gray wrote:
> On Fri, Jul 11, 2025 at 02:43:13PM +0300, Andy Shevchenko wrote:
> > +Cc: William,
> > who is an expert in embedded industrial x86 platforms and might help with this.
> 
> Just a heads-up that this is on my radar and I do have some general
> comments about ISA drivers (in particular, this reminds me of the
> gpio-ws16c48 driver which you may use as a rough guide). I'm currently
> catching up on a backlog of emails so I should have a response for you
> some time this weekend; but if you already have a v3 feel free to submit
> it and I'll reply to that instead.

+1 here, as I'm also piled with a huge backlog after long leave. Perhaps
a clean fresh start will help here.

-- 
With Best Regards,
Andy Shevchenko



