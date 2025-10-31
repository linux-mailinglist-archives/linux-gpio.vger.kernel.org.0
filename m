Return-Path: <linux-gpio+bounces-27889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84714C24566
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 11:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D69A4F4B39
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 10:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB52283124;
	Fri, 31 Oct 2025 10:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkUCZON7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EEB34D3A0;
	Fri, 31 Oct 2025 10:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904944; cv=none; b=rqvu0h86ouxJkJETq5E5ISHpOC9/6LHYoxOSxKkqClGLIt77zJZgdvGVSZxYsbQ3KlADnf5eXXXZCaeN4XA/wiOZzZJqjzMPJssZSM8u9oFXoM79ZkHyTSkzW+p4oXjSgtRAsE4E/Gu5ebylPZ7TBDu5aKorVzGaDRqM1Cm92DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904944; c=relaxed/simple;
	bh=z1LbJRPFeYAFx8meASEpNkY5QQB3glxhYrD1NH6XGwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=koP/hazskUGEr+rb4aRJ7WODRxFD/irOjMXBbwjISUdVxJRtj5SMD9LkSalNbu9aY67cQWKW8j8NtXVGj9fu3OuOdHz76SIbxSXOjJ4DVXPzotxl/Z5J51f2j2DMGsXLjG6JP2FN22hnl3Q+oIk07MfD+1+JYHfgvckIHyLWK0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkUCZON7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761904943; x=1793440943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z1LbJRPFeYAFx8meASEpNkY5QQB3glxhYrD1NH6XGwI=;
  b=nkUCZON7cgPRgdKAm9oJ2my1peycvax459scje8AbeMkzBm9H/yQtAgA
   HZQ0fxtCep8UUYgcuG4nw25g+14ib9/rQ5eCCzTrjUwb+ugtN6OWHAko5
   aMTPflgbHJ1taS8TUqtGl7mzLkLCHTdhwSDdzxRViy7XGGj/JtORdWiPy
   AaSTJoBcWNm36MdwNSeZ1CZlQp5A9f1BLowo5euwnp+lirKQ5+m/rsCIO
   heG6MtXNgPH9iEv8/VTt1j6Hq1e/UyclRyGX6o6n0vKncm3tAVoi2PgBm
   Ym+GPoFaSPwTU/t7zpgdBMtG1yc0lHohMZ937IiKrSasoSNi75mkZRSB6
   Q==;
X-CSE-ConnectionGUID: Av5kYZu9QgilHcypaiVUmw==
X-CSE-MsgGUID: x2BjQBs2SVuiQ1Fu2Gw6bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75413466"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="75413466"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 03:02:22 -0700
X-CSE-ConnectionGUID: x75/c39GReioovO7rGN65A==
X-CSE-MsgGUID: zEUFpYxLSpGQPgs6cu3vrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="191347175"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.66])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 03:02:20 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vElxX-00000004EM8-1q4D;
	Fri, 31 Oct 2025 12:02:15 +0200
Date: Fri, 31 Oct 2025 12:02:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] platform/x86/intel: Introduce Intel Elkhart Lake
 PSE I/O
Message-ID: <aQSJJv7d2hllsObY@smile.fi.intel.com>
References: <20251029062050.4160517-1-raag.jadav@intel.com>
 <20251029062050.4160517-2-raag.jadav@intel.com>
 <aQHSA6TtCAVGDRNo@smile.fi.intel.com>
 <aQSCpF8aR1lskaPy@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQSCpF8aR1lskaPy@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 31, 2025 at 10:34:28AM +0100, Raag Jadav wrote:
> On Wed, Oct 29, 2025 at 10:36:19AM +0200, Andy Shevchenko wrote:
> > On Wed, Oct 29, 2025 at 11:50:49AM +0530, Raag Jadav wrote:

...

> > > +#define EHL_PSE_IO_DEV_OFFSET	SZ_4K
> > > +#define EHL_PSE_IO_DEV_SIZE	SZ_4K
> > 
> > Not sure if SZ_4K is a good idea for the _OFFSET, the _SIZE is fine. Also why
> > do we need two? If the devices are of the same size, we don't need to have a
> > separate offset.
> 
> Yes but they're semantically different, atleast as per DEFINE_RES_MEM().
> Either way works for me.

They are "slices" in the HW, see also my "if the devices..." passage.

If you want to use SZ_* in _OFFSET, I would write it as (1 * SZ_4K) to point
out that size constant here is the _unit_ and not the size semantically.
Currently the definitions have the same values semantically, but you pointed
out that they should not be.

...

> > > +	io_dev = kzalloc(sizeof(*io_dev), GFP_KERNEL);
> > > +	if (!io_dev)
> > > +		return -ENOMEM;
> > 
> > Why devm_kzalloc() can't be used? I don't see if the device lifetime is anyhow
> > different to this object. Am I wrong?
> 
> Looks like it but I don't know the code well enough to tell if there're
> corner cases, so just following the documented rules. Your call.

Do you expect this to be called in non-probe() contexts? If no --> devm.
Otherwise some comments are needed.

...

> > > +	ret = __auxiliary_device_add(aux_dev, dev->driver->name);
> > 
> > Hmm... Is it okay to use double underscored variant? Only a single driver uses
> > this so far... Care to elaborate?
> 
> The regular variant uses KBUILD_MODNAME which comes with 'intel' prefix
> after commit df7f9acd8646, and with that we overshoot the max id string
> length for leaf drivers.

At bare minimum this needs a comment, but I think ideally we need to bump the
limit by factor of 2.

> > > +	if (ret)
> > > +		goto uninit_aux_dev;

-- 
With Best Regards,
Andy Shevchenko



