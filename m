Return-Path: <linux-gpio+bounces-16915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F39A4BF22
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 12:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8395F1655D6
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 11:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1043F202F71;
	Mon,  3 Mar 2025 11:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLLL9oNX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F8420298E;
	Mon,  3 Mar 2025 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002299; cv=none; b=QvlR43OHiAqiLKjnlam/VD2q5EvEzfvcs41wY610TLurIhPQtx3dnwK1+eAo92p8vGKTLVdgE1X9ptPxqeFc1OJzgKO5fd8zQvKVbzp2W8ITrknxfIHgAiev6nJqWVWG9UNvmpruHfDTan1pLVgvyhVmrY2Lla9NPk9DRlAjQ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002299; c=relaxed/simple;
	bh=1maSE+kUTWA+bVS1KajCs69ArJinbHlmPKr/lt7y6go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcRjSCqjO7NvrLYTO9N9I00XOgNnku/mL3c9GwwuvV/KQYfAMNH4LwoUpgrKG9PeiH89PgZc/nPtxQIBE/eFhX0zjAacSbYlKPzSG5QCOdu8Fq5gBZ4UzO/h3tsCwCfd6SKLZ6rF8D77xV4a17tE+ECSa+9cNxmPoK5FijyPDBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLLL9oNX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741002298; x=1772538298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1maSE+kUTWA+bVS1KajCs69ArJinbHlmPKr/lt7y6go=;
  b=LLLL9oNX4Wdm/Us1RHylDFxSMFaEzzQb6qLXTRiAzAoORWdEa65ggBen
   a0cRC68dDNQz9GxZwF9cUjOK4o5K2bObtsEwYq4PanYVuMy5CyA0eVcmG
   UpL+Z+5YqtQn/vMrYwwKIzY0g/x3ZLV9fV4EQQEyCiSXFmwV0Zg5FjLrK
   5PBi1WWd/gBE1SVQeAToToCeBSLCeZGarSDMOgSOLjs91hqYqOzb8zqFG
   RUS6nFKdN+gLyR2stZpIp0cx8DM/h1q3AZweuwVzbqVjFBUW1rmJHPlWq
   TCjdaq3y9ChXX0nT8Ze/dKe4SvPfa+2Hf6ok3Ow/tQGpzd8P7LGB+5uGx
   A==;
X-CSE-ConnectionGUID: cpIg2zTQSiGHVgtWBVItBw==
X-CSE-MsgGUID: RKgh4lU9TOKe1GNz91Ngng==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41786032"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41786032"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:44:57 -0800
X-CSE-ConnectionGUID: mVxkZxHCSrmOiw2tXeWIoQ==
X-CSE-MsgGUID: e7qvUo8xR3y10T2vViV7eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123202698"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:44:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp4E8-0000000Gnkx-3Cjx;
	Mon, 03 Mar 2025 13:44:52 +0200
Date: Mon, 3 Mar 2025 13:44:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8WWNHL1rZKV4c4o@smile.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-3-raag.jadav@intel.com>
 <Z8VmebNcrH6CjHp6@smile.fi.intel.com>
 <Z8WUpzDHbhp0aMoN@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8WUpzDHbhp0aMoN@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 03, 2025 at 01:38:15PM +0200, Raag Jadav wrote:
> On Mon, Mar 03, 2025 at 10:21:13AM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 03, 2025 at 10:17:42AM +0530, Raag Jadav wrote:

...

> > >  config GPIO_ELKHARTLAKE
> > >  	tristate "Intel Elkhart Lake PSE GPIO support"
> > > -	depends on X86 || COMPILE_TEST
> > > +	depends on (X86 && MFD_INTEL_EHL_PSE_GPIO) || COMPILE_TEST
> > >  	select GPIO_TANGIER
> > 
> > Looking on how GPIO PMIC drivers are written, I would redo this as
> > 
> > 	depends on (X86 || COMPILE_TEST) && MFD_INTEL_EHL_PSE_GPIO
> 
> True, but perhaps allow independent COMPILE_TEST where possible?

It will be tested in all-or-none way. Or you think it has to be tested
individually? If so, why is it needed?

-- 
With Best Regards,
Andy Shevchenko



