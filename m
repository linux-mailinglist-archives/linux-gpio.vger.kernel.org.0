Return-Path: <linux-gpio+bounces-16922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0C6A4C0E3
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFA4B3AB2BC
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 12:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C071EB18D;
	Mon,  3 Mar 2025 12:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrxURQ35"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE45313B58A;
	Mon,  3 Mar 2025 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741005991; cv=none; b=gbYeAlbtKRfBW0rwxmFXo/raSphwnuwEy2Iw2sfia43aT2TV8ccxrGp4a2U2emNDeZ56unaPfak+3VrvULxEPz+17bhQAg7BpomynEa4Ovegsj2cg0DHV4HbeVy7mWBdf2g/XyL3tKFDBPUc3eLkNmk68ekeXwUK1ZV3KHD6d9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741005991; c=relaxed/simple;
	bh=TBMaAolBIofq75INIcE+jWJ6q6e9PQsYK6izjdNQww8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLlzvjgdcNYZsdM6XJ8ep/n+wNIZN29D1/VD8Oa0LJ7oygClTdb+7QU4jDpcYgOSyAUGFpE3+QF3fa25QSeG9P8dj3LKeIoydIYsENp+Rgc56L/4maI0E2bQ064fUk5NSDNvNn6lFz0xJetEYjONjoi8nwD7G+V6KUmnlNvGwNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrxURQ35; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741005990; x=1772541990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TBMaAolBIofq75INIcE+jWJ6q6e9PQsYK6izjdNQww8=;
  b=hrxURQ3568nhN04Yq3kUh0N0SWOYb9tp0XDKPZlYbzCUgiKOM5hB9+dH
   eDrnkn+bS970ogia3rxkx9oWUe/agRUOjpiIVU7S4VC7/9mYZU7jse/nG
   CAi2hnhEslHle+fDza8QxqoSlqeui2UY66MuZfnDBEViZbmmaC4tOWonO
   utuYSgu4b/Ze43f9GMJRPZCmRIum5uh5wz8auJ/LiY7YYFAsmrH7ArAPK
   dqtRM4f2rAcqKtHoV/Kzjm+lc+yYENjYjPbzqJvcBUxwCEXYiw+Tm+XVV
   fAmKP00v5F6wZ96jW0nQI8uvL6dPTF6t+DIr9QjobDNVNR+A4HiJhPjMG
   g==;
X-CSE-ConnectionGUID: 38FWDP4GTbSKPku5DBqOVA==
X-CSE-MsgGUID: F948avsfQJyZhfz5tcL0Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42071966"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="42071966"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:46:29 -0800
X-CSE-ConnectionGUID: y+m4kChvRniIkKPM8bo8Ng==
X-CSE-MsgGUID: V2xwT2GMRayuxHmUiMd91A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="155177534"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:46:28 -0800
Date: Mon, 3 Mar 2025 14:46:24 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8WkoPVk2SsSj5aR@black.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-3-raag.jadav@intel.com>
 <Z8VmebNcrH6CjHp6@smile.fi.intel.com>
 <Z8WUpzDHbhp0aMoN@black.fi.intel.com>
 <Z8WWNHL1rZKV4c4o@smile.fi.intel.com>
 <Z8Wc73OytMx3khP_@black.fi.intel.com>
 <Z8We4_FJvxTxegpN@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8We4_FJvxTxegpN@smile.fi.intel.com>

On Mon, Mar 03, 2025 at 02:21:55PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 03, 2025 at 02:13:35PM +0200, Raag Jadav wrote:
> > On Mon, Mar 03, 2025 at 01:44:52PM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 03, 2025 at 01:38:15PM +0200, Raag Jadav wrote:
> > > > On Mon, Mar 03, 2025 at 10:21:13AM +0200, Andy Shevchenko wrote:
> > > > > On Mon, Mar 03, 2025 at 10:17:42AM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > > >  config GPIO_ELKHARTLAKE
> > > > > >  	tristate "Intel Elkhart Lake PSE GPIO support"
> > > > > > -	depends on X86 || COMPILE_TEST
> > > > > > +	depends on (X86 && MFD_INTEL_EHL_PSE_GPIO) || COMPILE_TEST
> > > > > >  	select GPIO_TANGIER
> > > > > 
> > > > > Looking on how GPIO PMIC drivers are written, I would redo this as
> > > > > 
> > > > > 	depends on (X86 || COMPILE_TEST) && MFD_INTEL_EHL_PSE_GPIO
> > > > 
> > > > True, but perhaps allow independent COMPILE_TEST where possible?
> > > 
> > > It will be tested in all-or-none way. Or you think it has to be tested
> > > individually? If so, why is it needed?
> > 
> > Better CI coverage?
> 
> How? I do not see the difference, can you elaborate?
> (Assuming that CIs are using the merge_config.sh approach or alike)

That is my understanding of it.

config COMPILE_TEST
        bool "Compile also drivers which will not load"
        depends on HAS_IOMEM
        help
          Some drivers can be compiled on a different platform than they are
          intended to be run on. Despite they cannot be loaded there (or even
          when they load they cannot be used due to missing HW support),
          developers still, opposing to distributors, might want to build such
          drivers to compile-test them.

Raag

