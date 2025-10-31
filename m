Return-Path: <linux-gpio+bounces-27886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C97B1C242F0
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 10:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 334FD4E80C3
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 09:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E807329E72;
	Fri, 31 Oct 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxenNpof"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19B72EDD6C;
	Fri, 31 Oct 2025 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761903279; cv=none; b=aJAQzmC8S0g0XmHL0odxfm6ACogxwsIeByuVJwjoki5mvI4nrCmBChsk2ZtlJbbn2BNaDy7EAsqefNVpdJ2ziJ99Kr1Vha+4PECjW4pjbRE7psKW4TUNkoDzfwH9ehXJOhOFIaRHoG5M8nfrbDjwX62y/0VTkqvfE8KavaKj1Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761903279; c=relaxed/simple;
	bh=fplWNQM+nEHUuRwf47LqYBcModH+iInvHdt/56pXO6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbVKOnMX6ceSFv30vw3wpL5qyYMdVjY8W7hPJtjiIz+oLcp/urWbesM51JcWV7fgLHxgiuatmco1Lui09Sl5m/1Xyu+C/TNtI6AFlJpNsZZItdPh4hE1pK7TzkqbTOjsvVp/hfs4EokOO2+T2Zk+uv9FIZ8ouXx9dfoqKpqYW78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxenNpof; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761903278; x=1793439278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fplWNQM+nEHUuRwf47LqYBcModH+iInvHdt/56pXO6M=;
  b=fxenNpofEgI4CvG56Y1wUYWmBn4i0EX5LQKiPBsS6Px/W5/NbxWw/E/o
   an8Zgjyh7WBPMLNwA05qdXX1J3f90CZggISxIU0NW3pgMe6a2exDavLHm
   poMu3CM8Ulc2vQ0gVJPMZMF7pS7B27Be51besTr6Bhfvq1UYtByuRUdxD
   ZeSlIU27N5pXY3vcOBPv5Def5wZPDXsWsVknRDwkg8smWJqkvUwoyTcWq
   ABIKvh8/OihSY5MC8PSZPEg4Wy7HuLgeo1Z57OJALc54izl+iQMheSmxj
   eMBOZhj6Naz7bqb3Oy5tASCW1e5hoXCUWDSJ0XaisUxa/pjBRdFef4sby
   g==;
X-CSE-ConnectionGUID: viATyxmNTduBe8Hc8bpE7Q==
X-CSE-MsgGUID: T8pCofUnRCKmDI9oXwhSAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63948818"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="63948818"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:34:34 -0700
X-CSE-ConnectionGUID: UX/N6EEXTjK+qtkm7WMGNQ==
X-CSE-MsgGUID: 7BJGvyzfQoulIJN7fVarYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186526656"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:34:31 -0700
Date: Fri, 31 Oct 2025 10:34:28 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] platform/x86/intel: Introduce Intel Elkhart Lake
 PSE I/O
Message-ID: <aQSCpF8aR1lskaPy@black.igk.intel.com>
References: <20251029062050.4160517-1-raag.jadav@intel.com>
 <20251029062050.4160517-2-raag.jadav@intel.com>
 <aQHSA6TtCAVGDRNo@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQHSA6TtCAVGDRNo@smile.fi.intel.com>

On Wed, Oct 29, 2025 at 10:36:19AM +0200, Andy Shevchenko wrote:
> On Wed, Oct 29, 2025 at 11:50:49AM +0530, Raag Jadav wrote:
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
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/device/devres.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/gfp_types.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/pci.h>
> > +#include <linux/sizes.h>
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> 
> > +#define EHL_PSE_IO_DEV_OFFSET	SZ_4K
> > +#define EHL_PSE_IO_DEV_SIZE	SZ_4K
> 
> Not sure if SZ_4K is a good idea for the _OFFSET, the _SIZE is fine. Also why
> do we need two? If the devices are of the same size, we don't need to have a
> separate offset.

Yes but they're semantically different, atleast as per DEFINE_RES_MEM().
Either way works for me.

...

> > +static int ehl_pse_io_dev_add(struct pci_dev *pci, const char *name, int idx)
> > +{
> > +	struct auxiliary_device *aux_dev;
> > +	struct device *dev = &pci->dev;
> > +	struct ehl_pse_io_dev *io_dev;
> > +	resource_size_t start;
> > +	int ret;
> > +
> > +	io_dev = kzalloc(sizeof(*io_dev), GFP_KERNEL);
> > +	if (!io_dev)
> > +		return -ENOMEM;
> 
> Why devm_kzalloc() can't be used? I don't see if the device lifetime is anyhow
> different to this object. Am I wrong?

Looks like it but I don't know the code well enough to tell if there're
corner cases, so just following the documented rules. Your call.

> > +	start = pci_resource_start(pci, 0);
> > +	io_dev->irq = pci_irq_vector(pci, idx);
> > +	io_dev->mem = DEFINE_RES_MEM(start + (EHL_PSE_IO_DEV_OFFSET * idx), EHL_PSE_IO_DEV_SIZE);
> > +
> > +	aux_dev = &io_dev->aux_dev;
> > +	aux_dev->name = name;
> > +	aux_dev->id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
> > +	aux_dev->dev.parent = dev;
> > +	aux_dev->dev.release = ehl_pse_io_dev_release;
> > +
> > +	ret = auxiliary_device_init(aux_dev);
> > +	if (ret)
> > +		goto free_io_dev;
> > +
> > +	ret = __auxiliary_device_add(aux_dev, dev->driver->name);
> 
> Hmm... Is it okay to use double underscored variant? Only a single driver uses
> this so far... Care to elaborate?

The regular variant uses KBUILD_MODNAME which comes with 'intel' prefix
after commit df7f9acd8646, and with that we overshoot the max id string
length for leaf drivers.

> > +	if (ret)
> > +		goto uninit_aux_dev;
> > +
> > +	return 0;
> > +
> > +uninit_aux_dev:
> > +	/* io_dev will be freed with the put_device() and .release sequence */
> 
> Right...
> 
> > +	auxiliary_device_uninit(aux_dev);
> > +free_io_dev:
> > +	kfree(io_dev);
> 
> ...and this is a double free, correct?

Yeah, my sheer incompetence at stealing code :(

Raag

