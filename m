Return-Path: <linux-gpio+bounces-12436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D80D9B8CC0
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 09:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E29DB22288
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCAB1527A7;
	Fri,  1 Nov 2024 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMZ0gtoh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D45B839F4;
	Fri,  1 Nov 2024 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730448951; cv=none; b=hLzooscjsbWClnE21LQQSs8Ao4EHAQ9ycqG1MO7RRT7na7GTkgzIJM/GJ0u4yoPVD1C0wOixYsKO60YLM+fSEbqA3HIPnnp19KrGmWNGINGd1I5YLqIYknQ4MFp19UxvcIqvib74vdUllILSY5jLg47T8W48TqhxlI4L2NpNlU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730448951; c=relaxed/simple;
	bh=IPEP5kYFF9OzNn1aHg9bXlSlE3OJQwyKnGdCTX+V12w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecvxI9mKDkMRMFn9CwejfI6Qc0TcNHQ8pyPszWjK324amDO1rVZiIcaAOjYBmoL4ZnE9IExAGtjNVfejxIFODQqrydE4eDnYQjH4NLYUDmUHA5I3g6poOsSQaeSPIK6rlmHzE8hkwuyCIxA2IlKn8eNjo7D13gSbOmJoJQqbZY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMZ0gtoh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730448950; x=1761984950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IPEP5kYFF9OzNn1aHg9bXlSlE3OJQwyKnGdCTX+V12w=;
  b=KMZ0gtohbAm07ZfV2ZsGhmYeyHHtYmH+mBvQYggkHz47UdoTZgg39Zgc
   xMuJ2VVMIDva+OEJ/PNmmVR5/enmKzD03Mb5PNH9Qr5+XqSfDhcOPJ+FI
   Sh25jBZy2DZxNCdBh75EorImngCs/JEh34BRPErwxUj3HuYiVGSBmmdvm
   /utwG0x0M+PPyD+FxSpkhnv7WBfrvwZAGA9MRPfOeCZoBbAW4qVwjN0ar
   zjJP3AXPovit5rEIAjUiUGQxP/R/bsIPHZ9HqXccfrSF7Gk7fayok6cng
   cbWiZiG5IEDJC0HscOUh+PSYr1xRA7nnMXtR+91nNcRdRjLXqBBdU6pbl
   Q==;
X-CSE-ConnectionGUID: LTgR1UlbTXGC0rpL/tCjdQ==
X-CSE-MsgGUID: 4zavligLQaSD76UIwPb3lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="34147736"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="34147736"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:15:50 -0700
X-CSE-ConnectionGUID: QfWCztjgT5CdkqVtmSn44Q==
X-CSE-MsgGUID: pEJlpEinTCyDRVv/ULZhqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="113688799"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:15:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t6mor-00000009xXO-12u0;
	Fri, 01 Nov 2024 10:15:45 +0200
Date: Fri, 1 Nov 2024 10:15:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate
 gpiod_direction_input_nonotify() call
Message-ID: <ZySOMUs4URLBevtx@smile.fi.intel.com>
References: <20241031092154.2244728-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MeiZ_U0UoU1atWxyWxEhcKwUcCK_cbYu_p-DQar27Fw+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeiZ_U0UoU1atWxyWxEhcKwUcCK_cbYu_p-DQar27Fw+A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 31, 2024 at 08:14:56PM +0100, Bartosz Golaszewski wrote:
> On Thu, Oct 31, 2024 at 10:22 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> >  set_output_flag:
> 
> Ok, I'll take it but please change this label to "emulate_output" or
> something similar that's more indicative on what the goal here is.

It's out of scope of this patch.

-- 
With Best Regards,
Andy Shevchenko



