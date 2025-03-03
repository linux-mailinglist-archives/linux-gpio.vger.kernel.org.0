Return-Path: <linux-gpio+bounces-16914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B267A4BEF9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 12:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EAD57A7EE2
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 11:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0D120011B;
	Mon,  3 Mar 2025 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxclT3jd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482BA200106;
	Mon,  3 Mar 2025 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741001965; cv=none; b=qY5U1LnEBMVwm5/T5MqtwNLCXWQKhmzz8H+VKtjAnHlf3a4mPnFeFz7VAECfy6vwGXXuKrQRE34XnrsR5O3Mkyepv0mgx69SaUBYPZTc34LP0stdu0teyn8CuVLFBjWqwPZxeYp8y7XvvmgjuBEdDji7sPBIWajBFKAKf8NDR48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741001965; c=relaxed/simple;
	bh=C6fxWyObGgOxBCXo82lvH9o/i56NbqIQG5QaXgkKlzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggoMqhfCbzBSOOibzF50BgXY4u+kpczVOTvs5hVJWnkIxfmlu8f0fM4Zf7jmOsPXRxFpRr1LdfGCwkmmOm30e9Z7BIqS7hmtJMloOlT5q8qhEdaMMGkNIy/OVJCuztTBpj0Vm5J6dmRGPMAQ5pBrwZnHw1940sPONVd2gmHW5xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxclT3jd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741001964; x=1772537964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C6fxWyObGgOxBCXo82lvH9o/i56NbqIQG5QaXgkKlzg=;
  b=YxclT3jdceOqhUFiruNrN0VP4Jiyn0siGVCQQvhDoY4Oa8wkaMT0kaSH
   px21FCRrhZIWaTlqPiQ8OnHmgCTgRG2L5WvNe0WFx/UTyswInnX5G9UPo
   uKULCZyQ8nupCkNO/3lY/fSJB0mMqO6c/qQjlX/IsuYgozbJgdHcRn/KO
   OzggDaCdfgDLBbtczv/QBnkCePOyr/Qrn/HCFgCu5JtcbeDHclc8oObFu
   hZCVVOpt8vbL4eVy3DEAVC+IVjiVkPHE1wz1Ec4HP2mcvKobnGUV97xx1
   5SwJ/qqS7AzbgDJu4HrfjTnBGb6bS5WoR1TfPe3tVh//8lB22hJRJ2DGc
   g==;
X-CSE-ConnectionGUID: xcGgBrUrTrO1vQ3mUoivxA==
X-CSE-MsgGUID: 7/IXXA48SHO6jNSoJXFWEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="52511573"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="52511573"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:39:21 -0800
X-CSE-ConnectionGUID: GUnvnBbISUarGfzI0RnFjQ==
X-CSE-MsgGUID: 0U1IS4WDQFmpPERmh+hBKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118530789"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:39:20 -0800
Date: Mon, 3 Mar 2025 13:39:16 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z8WU5NiIsu34Gz-Z@black.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-2-raag.jadav@intel.com>
 <Z8VnSyH_DBuJpW2o@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8VnSyH_DBuJpW2o@smile.fi.intel.com>

On Mon, Mar 03, 2025 at 10:24:43AM +0200, Andy Shevchenko wrote:
> On Mon, Mar 03, 2025 at 10:17:41AM +0530, Raag Jadav wrote:
> > Intel Elkhart Lake Programmable Service Engine (PSE) includes two PCI
> > devices that expose two different capabilities of GPIO and Timed I/O
> > as a single PCI function through shared MMIO.
> 
> ...
> 
> > +INTEL GPIO MFD DRIVER
> 
> This also needs to be more precise and follow the name. We have more Intel GPIO
> drivers, and MFD doesn't ring any bell about the platform or so. Are you going
> to support all of them (existing and comining)?

Not that it is planned as of now but I wouldn't mind :)

> > +M:	Raag Jadav <raag.jadav@intel.com>
> > +S:	Supported
> > +F:	drivers/mfd/intel_ehl_pse_gpio.c

Raag

