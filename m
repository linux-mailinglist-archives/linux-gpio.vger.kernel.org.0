Return-Path: <linux-gpio+bounces-27283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B667BEFC81
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 10:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 695093E5CCC
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 08:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571762E339B;
	Mon, 20 Oct 2025 08:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlB05f3T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6635E2DF3F2;
	Mon, 20 Oct 2025 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760947283; cv=none; b=Lg8twtK21PFBb0/UTB3eJ8oGAvOAhhT3bSTfUUwYv9ieRRzMn2ya4/F0iFDgCs6U0ZYQzo9bl3TIB9+kciBL263r04H27/jzFcsX1KVxwyPVMkZ7714sTqGvTQCI9EjhWxBWyQ1eOC5I1tPKacbRJZGem0mMdgC2nARJJnHt/Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760947283; c=relaxed/simple;
	bh=rvARsx1FvqF7ZCU1tvtDF8OIvF3pm9vCzu256wLxAdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWMY1JOCtZN3mZq0xT/zGFoxThfSjfDnW6ptkTP71zZV6rBigma290phJZzlOVMOVjOaADXcjiPkslFFY9hIIF1oOyCkVwzIwyu5i1998AaBGCeDz8LMfuVOVJ24DA4FePEhaUuKfsPEkBpLDYBjpSsCvEYqF0h/gQ5C1Fl4lqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlB05f3T; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760947281; x=1792483281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rvARsx1FvqF7ZCU1tvtDF8OIvF3pm9vCzu256wLxAdw=;
  b=VlB05f3TxiLJhhMhDzzzOGyJJD2rPIVCFHSNJIcw1I93OZv9tyscJKI9
   Z64Dz50mImb58UiRLbcXblUzIJqiMMHvvvN9oUx3EhZYYDVYrHb8DCs3V
   1mUiYAAIqT7WJkqGdbxqDXdY04pvz+vGBywTbegWV6BsZbMdo5hVctfGN
   NSVBxqSStyRm+de/+OvNmjxYyfQDZTENjcYII6L6HkBhjLvp+MPAukfV1
   mlYO7Q5I2XWAVjbS7vICxMSKqDB11o9b1Te1B4roeezru1Nu5AD7Dkz5+
   3PLfHpMaC+DagzNI/npm1xzpBynURgK/KJRc5upHRf09/p6kqQvOefCGR
   w==;
X-CSE-ConnectionGUID: vl586INmRKWRDwSyYv6LyQ==
X-CSE-MsgGUID: Zo/LCNLYRe6/qi5p3T5d8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62968347"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="62968347"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 01:01:21 -0700
X-CSE-ConnectionGUID: NHcq+J+oTMOWfTKUhnjRjw==
X-CSE-MsgGUID: bJK3Rl4cSTWRRrP4LJEkpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183287339"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.6])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 01:01:16 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vAkpM-00000001DwD-3dUV;
	Mon, 20 Oct 2025 11:01:12 +0300
Date: Mon, 20 Oct 2025 11:01:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] gpio: 104-idio-16: Define maximum valid register
 address offset
Message-ID: <aPXsSDrk--30p6YJ@ashevche-desk.local>
References: <aPPj22GL56sP1gOK@ashevche-desk.local>
 <20251018234411.34877-1-wbg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018234411.34877-1-wbg@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Oct 19, 2025 at 08:44:09AM +0900, William Breathitt Gray wrote:
> On Sat, Oct 18, 2025 at 10:00:43PM +0300, Andy Shevchenko wrote:
> > On Fri, Oct 17, 2025 at 09:58:01AM +0900, William Breathitt Gray wrote:
> > > Attempting to load the 104-idio-16 module fails during regmap
> > > initialization with a return error -EINVAL. This is a result of the
> > > regmap cache failing initialization. Set the idio_16_regmap_config
> > > max_register member to fix this failure.
> > 
> > > Fixes: 2c210c9a34a3 ("gpio: 104-idio-16: Migrate to the regmap API")
> > > Reported-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> > > Link: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com
> > 
> > Link --> Closes ?
> 
> So that link points to a report detailing multiple bugs, but this patch
> only fixes one of those bugs. Is it still appropriate to use Closes in
> this case?

I believe it works in m:n cases, at least I saw in practice several patches
(was a series) were closing the same report.

-- 
With Best Regards,
Andy Shevchenko



