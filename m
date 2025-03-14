Return-Path: <linux-gpio+bounces-17632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EDCA618E9
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 19:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B536A1B64348
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 18:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC8B204C32;
	Fri, 14 Mar 2025 18:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6BB3a9J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AA320487F;
	Fri, 14 Mar 2025 18:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741975285; cv=none; b=f0AKWrPXlsjsM4PpjscqgTc62AYsu/ioJ2BjHwyu+hTh1DPjj3ujasxpJAQEraE80cqP3M6dkXW2v7/Rd7XuSwuJzdWKXtFpZSJGl1nLM46XWa3tEw+E9Oajil75GyDApYd29Rk9NQCNHViro3zGdOi4Rha2I2NKMkS/0TG8kjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741975285; c=relaxed/simple;
	bh=Mj9qUmLdTwKbyk2T4rHE7N4/Kk0Xg4D7AQ1z41AYH1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CumJ31SuSM2Uboi4sruF2bf6X7F71yo8ZEqupA+iGI8c99gY8NfkhT4kxx+B1S+KyTIkHmQ/m/O9Q9tAD1/zdTrQ+ITPTSZzE+SS4PeYdiIw4bChDJ8dpQue45eZNY2qju/rb3qIF96qIQ8iIWhQrMMV90fiPPrVGssbOMYItU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6BB3a9J; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741975284; x=1773511284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mj9qUmLdTwKbyk2T4rHE7N4/Kk0Xg4D7AQ1z41AYH1s=;
  b=C6BB3a9Jf8M72jFVJF4FRLe3TuS/YCS28h1C1VZCekd6lCHv2ojfLdSi
   wdgLBbPBKp8VWzNfHuX1rvC+bgJua+HgAHKRoJT+np9XHXsoChTz6TlKR
   3jeT24Te477jboBovzxRWkiK1prEozQIhByYKyCAlfMVj0skS/LdKgAz6
   UBDr02NxU63+q0DpA5J6ntcI+FiRj0MSoVBoPeM95LusfmHwcIUzSX2JN
   y4HBhmubZRWs296bCd47AotI52R97gEoAferX5aVdwAfZSrHp2XX1sMMO
   kKLAH9s2HBTyy1EsgWVOyvkkSfNIRddlCjKFuKs1eC/vzSuUyA9TpGxJO
   Q==;
X-CSE-ConnectionGUID: 8mG20rwFTXK3IBhBZ/c1bw==
X-CSE-MsgGUID: vOdDbJ1VSWqHc25V8rINow==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="46787351"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="46787351"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 11:01:23 -0700
X-CSE-ConnectionGUID: vcuAt9B4Q+S37vnK4TIgnA==
X-CSE-MsgGUID: cTJxXrQ8TUixLi+0VRb14w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126554866"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 11:01:20 -0700
Date: Fri, 14 Mar 2025 20:01:17 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, giometti@enneenne.com,
	gregkh@linuxfoundation.org, raymond.tan@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z9Ru7VHP9K7Brod4@black.fi.intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-2-raag.jadav@intel.com>
 <20250314124450.GP3890718@google.com>
 <Z9QxqH3DJvyW3sjo@smile.fi.intel.com>
 <20250314135735.GQ3890718@google.com>
 <Z9Q7M1Cw8X0p9eXP@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9Q7M1Cw8X0p9eXP@smile.fi.intel.com>

On Fri, Mar 14, 2025 at 04:20:35PM +0200, Andy Shevchenko wrote:
> On Fri, Mar 14, 2025 at 01:57:35PM +0000, Lee Jones wrote:
> > On Fri, 14 Mar 2025, Andy Shevchenko wrote:
> > > On Fri, Mar 14, 2025 at 12:44:50PM +0000, Lee Jones wrote:
> > > > On Fri, 07 Mar 2025, Raag Jadav wrote:
> 
> ...
> 
> > > > > +	ret = pci_alloc_irq_vectors(pci, 2, 2, PCI_IRQ_ALL_TYPES);
> > > > > +	if (ret < 0)
> > > > > +		return ret;
> > > > > +
> > > > > +	ret = mfd_add_devices(&pci->dev, PLATFORM_DEVID_AUTO, ehl_pse_gpio_devs,
> > > > 
> > > > dev_*?
> > > 
> > > devm_* ?
> > 
> > Yes, typo.
> > 
> > > > > +			      ARRAY_SIZE(ehl_pse_gpio_devs), pci_resource_n(pci, 0),
> > > > > +			      pci_irq_vector(pci, 0), NULL);
> > > > > +	if (ret)
> > > > > +		pci_free_irq_vectors(pci);
> > > 
> > > Anyway, the choice as far as I understood it is motivated by usage of
> > > pci_*_irq_vector() APIs, which are officially not manageable (however
> > > in practice they are).

Are you referring to pcim_setup_msi_release()? I saw it but wasn't confident
it is in the call path, so went with manual release instead.

Now that you mentioned it, will update.

> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static void ehl_pse_gpio_remove(struct pci_dev *pdev)
> > > > > +{
> > > > > +	mfd_remove_devices(&pdev->dev);
> > > > > +	pci_free_irq_vectors(pdev);
> > > > > +}
> > > 
> > > Same here.
> > 
> > Also, Greg has been quite vocal about converting PCI devices to Platform
> > ones in the past.  We may wish to run this past him before continuing.
> 
> What do you refer to? Any links to read?

Could be about faux_device, but I could be wrong since here we do use
platform resources.

Raag

