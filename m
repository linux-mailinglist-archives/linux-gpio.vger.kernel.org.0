Return-Path: <linux-gpio+bounces-27896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 802CCC24E50
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 12:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8B701A22518
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 12:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD5F34844F;
	Fri, 31 Oct 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TE3YZzT/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F718348445;
	Fri, 31 Oct 2025 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911971; cv=none; b=q4UzlR6PLYFyigmGAlHQRuOJdGvDbxqFwyMOKwlMTM65qjBdK+R685gKaPHSdmE8ft8RyFUQV0RMUajOLvJ+bcf+uM6tJyCdcQOO7lH6ZCxa6PF4yxAxRZ/qhPk+nuOcNvb10O4BBYCGzYx8gs8p/YC4Va1Lq+jhD7WtRBRF1t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911971; c=relaxed/simple;
	bh=5UoaEdpVLL2NdA+CQijxmw2u67i+mScHjsVkMhIYhCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niMg8lAPxIDyZ/RY7+ho00WYLlZR0fcE85l/T+6ayZMlXm4zZEcokV/V9AHICKx5tGGEvBp+5zlPC26lWH1abrJaEUBD3TyQn3KA/0GpnaFY6XaXh5X8xQ3B5+6FPSWeRrdOmJGidgTtMD5IrB886vgSCUfVdEtkAHH9l0bh7Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TE3YZzT/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761911970; x=1793447970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5UoaEdpVLL2NdA+CQijxmw2u67i+mScHjsVkMhIYhCg=;
  b=TE3YZzT/CCwUFWt0np9TlRsLBwgSXdkejuoWH1GnWx1X0amP4rdwXLMr
   PKA6t1Wh1kgGE2i8Whs2ZMGCDOavBqIAjUtyQcWVdYEIrTZTW+uPSUcnK
   6xJGpRz5qCXQvHxdpyx9NAL+rXbZ+204WDkxsYmWSOob5ULvFaNZyYcXm
   AgL38hHS557HvBLWIdyXCplyYq+EyjeNKvLEbNTEs+3ET+rbkRoXYOGJG
   UAnMhD+l0rVXFaxp6lpO7ojxhyCxZLVnQUZUrdOcyI+Wsb2EEkYFOqXGR
   2z8HUspEKF+/nkMpCL0fOfDTT+SLwrvjiQvtx6mrXN+EyO2AkPBQ7er1t
   A==;
X-CSE-ConnectionGUID: pp9hEsglQDWHRwCf3IBZ5Q==
X-CSE-MsgGUID: NVM/QxTPRnCSbQYIkRD5Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64170104"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="64170104"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 04:59:29 -0700
X-CSE-ConnectionGUID: I7fU5kdvSxu/0BY7bP+Iag==
X-CSE-MsgGUID: DMmdcyxFQAeGVXU6xmQtlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="190302969"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 04:59:26 -0700
Date: Fri, 31 Oct 2025 12:59:24 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] platform/x86/intel: Introduce Intel Elkhart Lake
 PSE I/O
Message-ID: <aQSknEvFB_HRjwd-@black.igk.intel.com>
References: <20251029062050.4160517-1-raag.jadav@intel.com>
 <20251029062050.4160517-2-raag.jadav@intel.com>
 <aQHSA6TtCAVGDRNo@smile.fi.intel.com>
 <aQSCpF8aR1lskaPy@black.igk.intel.com>
 <aQSJJv7d2hllsObY@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQSJJv7d2hllsObY@smile.fi.intel.com>

On Fri, Oct 31, 2025 at 12:02:14PM +0200, Andy Shevchenko wrote:
> On Fri, Oct 31, 2025 at 10:34:28AM +0100, Raag Jadav wrote:
> > On Wed, Oct 29, 2025 at 10:36:19AM +0200, Andy Shevchenko wrote:
> > > On Wed, Oct 29, 2025 at 11:50:49AM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > +#define EHL_PSE_IO_DEV_OFFSET	SZ_4K
> > > > +#define EHL_PSE_IO_DEV_SIZE	SZ_4K
> > > 
> > > Not sure if SZ_4K is a good idea for the _OFFSET, the _SIZE is fine. Also why
> > > do we need two? If the devices are of the same size, we don't need to have a
> > > separate offset.
> > 
> > Yes but they're semantically different, atleast as per DEFINE_RES_MEM().
> > Either way works for me.
> 
> They are "slices" in the HW, see also my "if the devices..." passage.
> 
> If you want to use SZ_* in _OFFSET, I would write it as (1 * SZ_4K) to point
> out that size constant here is the _unit_ and not the size semantically.
> Currently the definitions have the same values semantically, but you pointed
> out that they should not be.

Fair. Will consolidate.

> > > > +	io_dev = kzalloc(sizeof(*io_dev), GFP_KERNEL);
> > > > +	if (!io_dev)
> > > > +		return -ENOMEM;
> > > 
> > > Why devm_kzalloc() can't be used? I don't see if the device lifetime is anyhow
> > > different to this object. Am I wrong?
> > 
> > Looks like it but I don't know the code well enough to tell if there're
> > corner cases, so just following the documented rules. Your call.
> 
> Do you expect this to be called in non-probe() contexts? If no --> devm.
> Otherwise some comments are needed.

Sure.

> > > > +	ret = __auxiliary_device_add(aux_dev, dev->driver->name);
> > > 
> > > Hmm... Is it okay to use double underscored variant? Only a single driver uses
> > > this so far... Care to elaborate?
> > 
> > The regular variant uses KBUILD_MODNAME which comes with 'intel' prefix
> > after commit df7f9acd8646, and with that we overshoot the max id string
> > length for leaf drivers.
> 
> At bare minimum this needs a comment, but I think ideally we need to bump the
> limit by factor of 2.

Which will probably require a wider discussion, so perhaps let's pursue it
separately?

Raag

