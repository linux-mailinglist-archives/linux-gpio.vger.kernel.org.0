Return-Path: <linux-gpio+bounces-28296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4242EC46310
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 12:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A42984EA2F4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 11:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA76A242D60;
	Mon, 10 Nov 2025 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVmxM9s2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ED030AACE;
	Mon, 10 Nov 2025 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762773485; cv=none; b=oo4JdF2RlU6hnVBqWkLBcW0UdBGjh67udB0G5oaTSVC9Ddnc3D9hCmoG7XWgXTdLXPVtQ1ZdSjxzwBaGNRFDFESf2SMUdy/kSDiSruOknKLZ6irFJ4KBGeOta4niNxIVnW5kna6reTOCXbhKEMIcDZKid3rzLEa8/nrerIbu4ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762773485; c=relaxed/simple;
	bh=yTNk15ujPUZN4tCu3ROJSJZtUjZoH00ykxCOtBE7gmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kA1oOCfHAXm4tgJ2uYkIKroUvOLRCaBsfIdVJCiCy+OgXunYH2XSWSeZE6S4l3SMIhAHmENSG0aYleSGnMCLME68PtxHehtdCv92pao8+S1TlF5ARGjXah86kWYzZ60ISz5qLgpJ58bv9ju7hL/ArKCxHlXvPzK8vY4y6V81e/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVmxM9s2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762773483; x=1794309483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yTNk15ujPUZN4tCu3ROJSJZtUjZoH00ykxCOtBE7gmA=;
  b=XVmxM9s2WQMB7z5mVjFMqasvzgUn9b5YKATOKGmqgx2p3/W6zUK/074K
   iy8oAEzzi7aC8w6uU7bCrV5JbztbZ4zfNeobuqdreUfSqo2Cy10ZDdcXt
   7FSl444YPOK3qrevtf28mSJ/OUfZDBDOpv2b6sc5qX5tF6SVnERZKJTfA
   1tjwOC96M7TjkkcpWuMKeQYjEZ/pwiz+AZFbXPaWKw+/tWc9ZP1g9544z
   zl1nLbq+5rTe81ZlN5wQImBvjzJG3BI1I4QecLbwGKkRTpSx05QyIANCq
   YyQGdHnnXCyL6vE0TC4a1pYyK9Ism+XjecaIx6M9T64l43pAeL+62VIrz
   w==;
X-CSE-ConnectionGUID: HLp32CkSS8qjbPpwlow59A==
X-CSE-MsgGUID: bKSDZADwTOuffJ1BQy7qgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="82448422"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="82448422"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 03:18:03 -0800
X-CSE-ConnectionGUID: wdIRu+1bT2e+/HoY4UdvvA==
X-CSE-MsgGUID: NUr6m8N+Tr+XXURuyaZPTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="212045271"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 03:18:01 -0800
Date: Mon, 10 Nov 2025 12:17:58 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/x86/intel: Introduce Intel Elkhart Lake
 PSE I/O
Message-ID: <aRHJ5gnMaWeJmQzc@black.igk.intel.com>
References: <20251110052728.383339-1-raag.jadav@intel.com>
 <20251110052728.383339-2-raag.jadav@intel.com>
 <aRGTVguXqO2oNCCW@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRGTVguXqO2oNCCW@smile.fi.intel.com>

On Mon, Nov 10, 2025 at 09:25:10AM +0200, Andy Shevchenko wrote:
> On Mon, Nov 10, 2025 at 10:56:40AM +0530, Raag Jadav wrote:
> > Intel Elkhart Lake Programmable Service Engine (PSE) includes two PCI
> > devices that expose two different capabilities of GPIO and Timed I/O
> > as a single PCI function through shared MMIO with below layout.
> > 
> > GPIO: 0x0000 - 0x1000
> > TIO:  0x1000 - 0x2000
> > 
> > This driver enumerates the PCI parent device and creates auxiliary child
> > devices for these capabilities. The actual functionalities are provided
> > by their respective auxiliary drivers.
> 
> ...
> 
> > +static int ehl_pse_io_dev_add(struct pci_dev *pci, const char *name, int idx)
> > +{
> > +	struct auxiliary_device *aux_dev;
> > +	struct device *dev = &pci->dev;
> > +	struct ehl_pse_io_dev *io_dev;
> > +	resource_size_t start, offset;
> > +	int ret;
> > +
> > +	io_dev = devm_kzalloc(dev, sizeof(*io_dev), GFP_KERNEL);
> > +	if (!io_dev)
> > +		return -ENOMEM;
> > +
> > +	start = pci_resource_start(pci, 0);
> > +	offset = EHL_PSE_IO_DEV_SIZE * idx;
> > +
> > +	io_dev->irq = pci_irq_vector(pci, idx);
> > +	io_dev->mem = DEFINE_RES_MEM(start + offset, EHL_PSE_IO_DEV_SIZE);
> > +
> > +	aux_dev = &io_dev->aux_dev;
> > +	aux_dev->name = name;
> > +	aux_dev->id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
> > +	aux_dev->dev.parent = dev;
> > +	aux_dev->dev.release = ehl_pse_io_dev_release;
> > +
> > +	ret = auxiliary_device_init(aux_dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = auxiliary_device_add(aux_dev);
> > +	if (ret) {
> > +		auxiliary_device_uninit(aux_dev);
> > +		return ret;
> > +	}
> 
> Can it be now auxiliary_device_create() ?

Could be. With that perhaps we won't even need the 'intel' prefix.

> > +	return devm_add_action_or_reset(dev, ehl_pse_io_dev_destroy, aux_dev);
> > +}
> 
> ...
> 
> > +#define auxiliary_dev_to_ehl_pse_io_dev(auxiliary_dev) \
> > +	container_of(auxiliary_dev, struct ehl_pse_io_dev, aux_dev)
> 
> Wondering if we may use container_of_const()

Or just use platdata instead? Let me send out a v3.

Raag

