Return-Path: <linux-gpio+bounces-16917-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F2DA4BFFD
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51A75188F52D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 12:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EAA20E32A;
	Mon,  3 Mar 2025 12:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJk0mEmA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9507B20DD4E;
	Mon,  3 Mar 2025 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741004024; cv=none; b=Ho7gsujvf19lxO7DH/cjkqgxOa5r5JYR24jTJSrnvF9MZ22kbv/VOz/EkJFstunuQzPqtz/s9b9kZmnmP7ChMd8GvBeVWsxQnoZkzuUIDFdOFU4shS7DX5An0YDDqiGgyrSg8Zd6TrZJsDweDvgFoQBwz9y2DVXSk591g6Lq8+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741004024; c=relaxed/simple;
	bh=zcoHmJVRGCzEOjTFHAk4AIfKSp+4rU6AGhfegvpY+Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qh61JTUyhkPN7pZPKqMBeluvTEX7kW9H/wksSxbEoEPVVMrH2o1dSm9b7mEtVbUFBS2VNr2Qa40GbpTMHgeKKbXOeu7m8eSiEe7H3YxvxUOGIARiFmkyIAZushZQTPzotSLc+I2fSaww4ReybQaAL5az/tgiq9TYpeLZMOPrQts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJk0mEmA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741004022; x=1772540022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zcoHmJVRGCzEOjTFHAk4AIfKSp+4rU6AGhfegvpY+Bw=;
  b=LJk0mEmASEscG661onOdN0aAyI0Ff2WD8SE+NK/g3aBr7RzRHNI+H3p8
   rG3lx3PE4559nLWyYg8e9ArwcfDmKoF3vONRDrtgDQw0eui3Q2EZdIVk2
   1+segbmL4hVobU6VeNbsLt1J4TZTQr2eSzitWjCVIxkgkxgFDkPizP2jC
   A0JTRCIhjONgd2D/4smO7lWw5IFoUuF53phQEn8YhQ3goTU/fo5V/NMjF
   xS4FPAdKolGrlz1CRc3HkKiODvsleGBYUAgGPggqWcTlKvJFTQNfy0jfg
   BRsFqv1AZq/URJlWKSdLlaHwFoRvfSVUEN+nkhk4C+FQs+561V2wYoDpp
   g==;
X-CSE-ConnectionGUID: MfqF+tK7QGGKKDOGX5Bq9w==
X-CSE-MsgGUID: TVSvww9TSYOWaEEtpV35Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59421570"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="59421570"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:13:41 -0800
X-CSE-ConnectionGUID: rf0or1z3RQObM8edw1S0sQ==
X-CSE-MsgGUID: /Yub0qJ3TaSaacINLyK07g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="148802489"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:13:39 -0800
Date: Mon, 3 Mar 2025 14:13:35 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8Wc73OytMx3khP_@black.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-3-raag.jadav@intel.com>
 <Z8VmebNcrH6CjHp6@smile.fi.intel.com>
 <Z8WUpzDHbhp0aMoN@black.fi.intel.com>
 <Z8WWNHL1rZKV4c4o@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8WWNHL1rZKV4c4o@smile.fi.intel.com>

On Mon, Mar 03, 2025 at 01:44:52PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 03, 2025 at 01:38:15PM +0200, Raag Jadav wrote:
> > On Mon, Mar 03, 2025 at 10:21:13AM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 03, 2025 at 10:17:42AM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > >  config GPIO_ELKHARTLAKE
> > > >  	tristate "Intel Elkhart Lake PSE GPIO support"
> > > > -	depends on X86 || COMPILE_TEST
> > > > +	depends on (X86 && MFD_INTEL_EHL_PSE_GPIO) || COMPILE_TEST
> > > >  	select GPIO_TANGIER
> > > 
> > > Looking on how GPIO PMIC drivers are written, I would redo this as
> > > 
> > > 	depends on (X86 || COMPILE_TEST) && MFD_INTEL_EHL_PSE_GPIO
> > 
> > True, but perhaps allow independent COMPILE_TEST where possible?
> 
> It will be tested in all-or-none way. Or you think it has to be tested
> individually? If so, why is it needed?

Better CI coverage? We also have it for Intel pinctrl drivers.

Raag

