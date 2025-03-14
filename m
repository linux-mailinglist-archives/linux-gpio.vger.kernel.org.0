Return-Path: <linux-gpio+bounces-17626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A95DA612E2
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 14:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3815881E56
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 13:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4501FF7DE;
	Fri, 14 Mar 2025 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+L/HE4u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CFF1FECA2;
	Fri, 14 Mar 2025 13:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741959598; cv=none; b=N+vWAb/+4QN/TPmuHZ11iekrC7jmueZI0zwi+JWHt3Wb2iDXnuFifVH8Afu77EMFJdgjztZxhzC5aRzDId2sqXLSANENpuuRBbLNDQO7nzVGRkMVeulweoZ+RhlM53TOcdg9nuHCx8/YChxqSrX5QCQS4deedfeP18BQUkgiI5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741959598; c=relaxed/simple;
	bh=SAXEOg96Mga7d7rdhRAloDCo8jhUtoSQKUQYAMvQSuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=af2Ws2iDdH9HXip/cuCKW+yN0hwtgkoImNnvu3v0YFmxKHTmaLgzckNPvdi4+fF1bum8Na6JsuvWl8zDMjm54xiI/1zCa21LbBrqWPO3vA+kYJjm0pPAsyx2z7hOUzcesfZYMY+jvp8g5BgMd2QAxjulrNwQx0d7lMtyUXxdDu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+L/HE4u; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741959597; x=1773495597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SAXEOg96Mga7d7rdhRAloDCo8jhUtoSQKUQYAMvQSuI=;
  b=C+L/HE4u7HFMReUTwm7XgJjoRLThaJTk+CyC+PXYazC68fTZiTR0zEb9
   waPqT/cwaCtDfzzIW0Jt8FzpXKl6VJTnPpqsSzlphdLz6m81o7dBY//mv
   Cwe7K1cr34Yc3SEtJW70QsfNFwL0/Ma3HLHc92iHwIVTZqH/a1406ulkE
   GgY7bUMoGaZiSkBOXrrqiwx6Sjm2+Z8uOZHYvE9hcgqo23XELKC6QfvUX
   axyAC2jOLk+3ENWrQTjO1neOR59nsCW+yx2FQd+Rb7XmIjCec5qX2DSMb
   E5sl/zovVKqcoirc7hdxYKBL2QGXli9wdem7ltOqS48WVWRnII/SReQuM
   g==;
X-CSE-ConnectionGUID: upHeWtNBRL+/6f/lluPQRA==
X-CSE-MsgGUID: yIRwLZJxRGSDGM8FDrTWtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43318961"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43318961"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 06:39:57 -0700
X-CSE-ConnectionGUID: FcwDeTBSTWKzT1QQ6QY+ZQ==
X-CSE-MsgGUID: A9Jbvv2HRaKcX8pj0hyLOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="125474143"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 06:39:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tt5GS-00000002TC8-154m;
	Fri, 14 Mar 2025 15:39:52 +0200
Date: Fri, 14 Mar 2025 15:39:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Raag Jadav <raag.jadav@intel.com>, giometti@enneenne.com,
	gregkh@linuxfoundation.org, raymond.tan@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z9QxqH3DJvyW3sjo@smile.fi.intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-2-raag.jadav@intel.com>
 <20250314124450.GP3890718@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314124450.GP3890718@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Mar 14, 2025 at 12:44:50PM +0000, Lee Jones wrote:
> On Fri, 07 Mar 2025, Raag Jadav wrote:
> 
> > Intel Elkhart Lake Programmable Service Engine (PSE) includes two PCI
> > devices that expose two different capabilities of GPIO and Timed I/O
> > as a single PCI function through shared MMIO.

...

> > +	ret = pci_alloc_irq_vectors(pci, 2, 2, PCI_IRQ_ALL_TYPES);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = mfd_add_devices(&pci->dev, PLATFORM_DEVID_AUTO, ehl_pse_gpio_devs,
> 
> dev_*?

devm_* ?


> > +			      ARRAY_SIZE(ehl_pse_gpio_devs), pci_resource_n(pci, 0),
> > +			      pci_irq_vector(pci, 0), NULL);
> > +	if (ret)
> > +		pci_free_irq_vectors(pci);

Anyway, the choice as far as I understood it is motivated by usage of
pci_*_irq_vector() APIs, which are officially not manageable (however
in practice they are).

> > +	return ret;
> > +}
> > +
> > +static void ehl_pse_gpio_remove(struct pci_dev *pdev)
> > +{
> > +	mfd_remove_devices(&pdev->dev);
> > +	pci_free_irq_vectors(pdev);
> > +}

Same here.

-- 
With Best Regards,
Andy Shevchenko



