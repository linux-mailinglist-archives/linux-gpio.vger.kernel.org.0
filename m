Return-Path: <linux-gpio+bounces-16916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B42A4BF25
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 12:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9689B188C152
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 11:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87652205E00;
	Mon,  3 Mar 2025 11:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VX99lk7n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C39205AAC;
	Mon,  3 Mar 2025 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002342; cv=none; b=EZavdt/6xwM0gJdL1uNyjdLXI7aMEyGCFPybVKenDkNP4XmZoUoRobGsx1XiVfLV8SNY+E20gaqufsNIB3DT1+mIZDk8pmwsl+bOGcnITpGNIOMScQtCP/NHpUtj4sk1ZJvpiTHUeSU41pVM9288QpgCf3QWbrYPI+yY9/jhwX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002342; c=relaxed/simple;
	bh=pBRptPsgiKXiStO3qASpvzyPhwpRZnzbFyK6PCcQnXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8p47QJAqTUziydSjF8gFyu8ipRzc2dAvRwff4zkiVKRINSmV8OjlfHG3m1pQP99KYi4SxU0Wr9PiH9CGVP5xcq6FN/HDP8FMS3AyZCXjLtoYyzMy6SZwjpeJPjbwDLfgkUB4R0UnBF2SqVS8sXhypSEZsfUN3dEcNMMetMTtkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VX99lk7n; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741002341; x=1772538341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pBRptPsgiKXiStO3qASpvzyPhwpRZnzbFyK6PCcQnXI=;
  b=VX99lk7n6hnZ0MPQDimqE9uicYuQ0qTrRcVPTJlfsFQoLSqIhNBDJTkj
   M/OrNi/lW//KuhKhbnnermoFCAG2OyovrfeIu2YEd3AJVf8dcJ641f4r6
   JZNEiP6us7psCa/vEdTAgE79eunuM1bJC0zAA/Feyu2fTnz0dbxy1Widq
   SzkEqx1RQD015L+Lk+8vTbDqT40ag451jZhtON38LnbDidoQw2g+4/ua/
   qgv9RWcHP3x7XZO/iPtNv9IgyyTVY/PYh5u8qr7HurPPXJ+QIJhqrN6rG
   hJwurb3bGQN53uGQIlse9bSStXUob0foe7wwNhPSQaxBh17jO20OEsCgA
   w==;
X-CSE-ConnectionGUID: X8Tqy8e2Tlq318Adceyx7w==
X-CSE-MsgGUID: /EA4D4WgR/mVUNpnAnTdxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41760362"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41760362"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:45:40 -0800
X-CSE-ConnectionGUID: 300zfOgdSYSxoV2GxwtyPw==
X-CSE-MsgGUID: ZwWqxxlLQsilRPACZtqXVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="117784523"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:45:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp4Ep-0000000Gnls-3Dm0;
	Mon, 03 Mar 2025 13:45:35 +0200
Date: Mon, 3 Mar 2025 13:45:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z8WWXxTrd1e5V3qb@smile.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-2-raag.jadav@intel.com>
 <Z8VnSyH_DBuJpW2o@smile.fi.intel.com>
 <Z8WU5NiIsu34Gz-Z@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8WU5NiIsu34Gz-Z@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 03, 2025 at 01:39:16PM +0200, Raag Jadav wrote:
> On Mon, Mar 03, 2025 at 10:24:43AM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 03, 2025 at 10:17:41AM +0530, Raag Jadav wrote:

...

> > > +INTEL GPIO MFD DRIVER
> > 
> > This also needs to be more precise and follow the name. We have more Intel GPIO
> > drivers, and MFD doesn't ring any bell about the platform or so. Are you going
> > to support all of them (existing and comining)?
> 
> Not that it is planned as of now but I wouldn't mind :)

It sounds like solving the problem that even might never appear :-)

> > > +M:	Raag Jadav <raag.jadav@intel.com>
> > > +S:	Supported
> > > +F:	drivers/mfd/intel_ehl_pse_gpio.c

-- 
With Best Regards,
Andy Shevchenko



