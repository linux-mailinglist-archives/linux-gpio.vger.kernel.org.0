Return-Path: <linux-gpio+bounces-17999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDA9A71348
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 10:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD6463AE665
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 09:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A03019D8A2;
	Wed, 26 Mar 2025 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYEkHW6V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641D142E67;
	Wed, 26 Mar 2025 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742979719; cv=none; b=AaJrGL1NRM8yQm8k9eQihCjKM2M4gW8+2WWpbPa5KveBzuYQ1CBazUSa2fPDO0ztHkqi/4R4LDFmOYxc5Kp3tZu4xANs/Os4o5kmGs7dxeSN9eYMWSI21H+zEjaxDKegqj82GYb+1uJr3Ddq8f/GwOWuF7acf57Y/DIbNrI/s94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742979719; c=relaxed/simple;
	bh=2b7ZPn7TkWiDo8qXQCI9WFvZnqHvXoB8IqYreHMHXiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRdAxS/zxz0p2PnLcXRAdt1bjr9r/gueVX0lbajelVcnoXkCABHj0zfmqwZrrX6n6PM4VnuwDocqOnDCRIOmQehwAEfu6VX1hHpAVHHSgVeqFTAveCGIdNiNryb9Fed7LJtX6H4toolZPtt3CSzqWy6RGOeB+rNRNi+pfLkTr40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYEkHW6V; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742979718; x=1774515718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2b7ZPn7TkWiDo8qXQCI9WFvZnqHvXoB8IqYreHMHXiw=;
  b=kYEkHW6VwS2lqkY064AMVYzq6PGAaQQGPDjLc17t1sidD2dzfG38+aB7
   tuxaiuGpP+p6bAa89MG1mygCmJDaiUfcOf3Pt8+LwzZJr0gf5NVRNkn8j
   Ng4LTCeaR/42olv9d0lv2mt30DSqVwcxrs99YeyiozOsh4BzhwoWThcCk
   xsVvUlTcD8aK9FoMpiTijLPSezEaTrvaedQWZZJBlZdS+ZmkYuP3JgNMV
   vc5b8JzrVAFwLnPa/5ZlNSMm+yVKbSTreaqcJNDOB/6GkCZKCkbV0lx9d
   1eGYarCe7x42wxS/8qT8jxCgLiGkbekJTY8Y3uMzEDVwGpqfjeqGCTY7Y
   g==;
X-CSE-ConnectionGUID: 05C97YsxRfCYMxcP70RN+Q==
X-CSE-MsgGUID: vQIhDZN7SLiveYKXXEcPdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="69618799"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="69618799"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 02:01:57 -0700
X-CSE-ConnectionGUID: gjuPDlERRz6SYGcokLWDjg==
X-CSE-MsgGUID: DDKyhVFcQo6Yxl/zpHtrnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="124434914"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 02:01:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1txMe0-000000061LP-3JV1;
	Wed, 26 Mar 2025 11:01:52 +0200
Date: Wed, 26 Mar 2025 11:01:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Raag Jadav <raag.jadav@intel.com>, Lee Jones <lee@kernel.org>,
	giometti@enneenne.com, raymond.tan@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z-PCgJY8qBPBWKVN@smile.fi.intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-2-raag.jadav@intel.com>
 <20250314124450.GP3890718@google.com>
 <Z9QxqH3DJvyW3sjo@smile.fi.intel.com>
 <20250314135735.GQ3890718@google.com>
 <Z9z49lfWV6LjUnaI@black.fi.intel.com>
 <2025032115-gloomily-cubbyhole-dd8e@gregkh>
 <Z91oHCpfOkvgJmzP@smile.fi.intel.com>
 <2025032514-ipad-schilling-9928@gregkh>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025032514-ipad-schilling-9928@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 25, 2025 at 08:45:29PM -0400, Greg KH wrote:
> On Fri, Mar 21, 2025 at 03:22:36PM +0200, Andy Shevchenko wrote:
> > On Fri, Mar 21, 2025 at 06:04:38AM -0700, Greg KH wrote:
> > > On Fri, Mar 21, 2025 at 07:28:22AM +0200, Raag Jadav wrote:
> > > > On Fri, Mar 14, 2025 at 01:57:35PM +0000, Lee Jones wrote:
> > > > > On Fri, 14 Mar 2025, Andy Shevchenko wrote:

...

> > > > > Also, Greg has been quite vocal about converting PCI devices to Platform
> > > > > ones in the past.  We may wish to run this past him before continuing.
> > > > 
> > > > Greg, any objections on moving forward with platform device?
> > > 
> > > I have no context here at all, why would a PCI device EVER be a platform
> > > device?  That feels wrong on so many levels...
> > 
> > It's a multi-functional device, in other words that device provides a set of
> > (dependent or independent) subdevices. But do you have other suggestion?
> > The auxiliary bus?
> 
> Yes, that is exactly what the auxiliary bus code was designed and
> written for.

Lee, what do you think of extending mfd to cover this case, i.e. specifically
for the PCI devices? Or maybe it makes sense to go to the auxiliary bus
completely (I think this may break a lot of things on legacy systems, though).

-- 
With Best Regards,
Andy Shevchenko



