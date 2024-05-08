Return-Path: <linux-gpio+bounces-6231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 774438BFACD
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 12:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C721B21E2E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 10:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CBC7BAEC;
	Wed,  8 May 2024 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QG1T/oej"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234042747B;
	Wed,  8 May 2024 10:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715163631; cv=none; b=QDbvAIh41ZzHmsF88ZOWCYTnlILvkSW8XqUCZkEW22kGy49GCvHBnXTl0aBUl5Pez5zS1wqDbhxy3PHTUuOcz8SwBG2w5jZBUT6BTEzY4PTThrSN5NGa7Jzo1kD3WSwAytfO2q1WOu9I47WKYNGWn2CnvKcPDletK1U1nnd6lG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715163631; c=relaxed/simple;
	bh=vcdcXaFyWGxuwDtLIvnaSE39W04Miy1n2iRI58rhOtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPMmnj1o2mMiZAeEFnkQclM8bv3iJaNX17f+BxeiB1ssMCuIJjVfCtQSIHA3Qh4MEOMLYbYJpKPV6Qq+RbPNWzexU2XVCU6xpCf0l3ynJwy/dyad/jcl9ou5jgC2nZOs/pAw+bmPahvwy7L/qzK3ajD0J0VCg/9JqL8UA74MwQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QG1T/oej; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715163630; x=1746699630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vcdcXaFyWGxuwDtLIvnaSE39W04Miy1n2iRI58rhOtY=;
  b=QG1T/oejmDMS1Mo8IWB7k66SsInsY9buWAopZW6Og4W9DmB7wPhdYwYX
   947JPaBV63VQPFqUVmQaSQeQlbDo0/BvZJMcRB8N/8shwSuKOcZsRw+lp
   spoVMEUya9wDjO0P8RFIj7aNLtOQu76T/Wq3EY1IussfsEmdAjBLAvFy6
   HGF1DR7e8Su6ilWWqYaRGXbO26lwVNjJ8Tk/udo8oNECSrQkudHBELKpa
   bj/FohBiWVejpDmqRVSNrFwLFQLWS0KU4yWRfZtQ/Zg6LsYdxxNLoitTo
   o7H6tjpNooxT9FSh7hGYQAP+KR4jkdFqRXxpm3oa1L2o8gExULI7vf5fO
   g==;
X-CSE-ConnectionGUID: 8XHHyQ7jQniBwTTadephRA==
X-CSE-MsgGUID: fyXLzqKaR3eWcm+2pNEmEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11138001"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="11138001"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 03:20:29 -0700
X-CSE-ConnectionGUID: /Qo5M/STR5ChhiwDEUUdOA==
X-CSE-MsgGUID: M+a5f/THQdyx99WEE7fNFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="29242370"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 03:20:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s4ePP-00000005OKO-2hNR;
	Wed, 08 May 2024 13:20:23 +0300
Date: Wed, 8 May 2024 13:20:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v1 1/1] gpio: Remove legacy API documentation
Message-ID: <ZjtR59UwQ3jcdOIB@smile.fi.intel.com>
References: <20240508101703.830066-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508101703.830066-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 08, 2024 at 01:17:01PM +0300, Andy Shevchenko wrote:
> In order to discourage people to use old and legacy GPIO APIs
> remove the respective documentation completely. It also helps
> further cleanups of the legacy GPIO API leftovers, which is
> ongoing task.

Motivation of this patch is a new code appeared with deprecated header:
https://lore.kernel.org/alsa-devel/CAHp75Vf36mOsHCMH2bPCew-7e75SjMQVqxKR4CU+BV1oQPiHmA@mail.gmail.com/

-- 
With Best Regards,
Andy Shevchenko



