Return-Path: <linux-gpio+bounces-27784-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55717C19298
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 09:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FFE3406BB3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 08:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CCB3101A2;
	Wed, 29 Oct 2025 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsbg2gGK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5452C1917F1;
	Wed, 29 Oct 2025 08:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761726987; cv=none; b=Ou2b/G5Skei4vqyJavxkK8pyBqLqc2dfrEeKU0XHYMOFUcpp0uBcw7a7y7b48qWD1mPeMJim/g8Byx3paNL9hWC/jne/fXtVsJMPe+VsI0xEADcLT7Fj7lqdbjYdNPoO6tAYXtijfF7LJp8jXDjtY+tCId535AO1SP+oKv7jhp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761726987; c=relaxed/simple;
	bh=huIK+iwaXtZ6g/UnJVOko6NspswsXyUtdXvuesD5DJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OoPw84/tNiBIkaSWnjQA5nD9nQtP0VwjQyxFok4hKRJvydWkAzVeI0rnXgyDYx1IOGXVebqiNT3PbJC1IodX1xdh/TuDD/Oix8ksooJXkDevaNI7oHJwWCIAbg8SrqnGb3T+eeXk7keeQRCXH30vcoXk5QHgHBTqWM8Q6BhmEx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsbg2gGK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761726986; x=1793262986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=huIK+iwaXtZ6g/UnJVOko6NspswsXyUtdXvuesD5DJg=;
  b=dsbg2gGKhimEjq8sQfsG+2X8lpdR8ZEjRg34y+5v57bQ9YyxpBwR9j9N
   5Hubb5mkZqh+u/6HlDzSQ9Y/Ri48IxAIXIWUmjg42UCdr8tOCjG+h7H0D
   17DnC/+1eMp44ajmHVihA5rYD7Lez7x34X4Zdl9vKxgEb3vh2JllWvYZE
   vw8sPEJmNm9zp46Wk9usKFJ7Z+r+r1NfaUkpu6dinGi/vlAHI0hO38Z2a
   /RzO698UJFju114QmenbdLFZ6tpTjWxYgpvvR6/qlNkHkGCr9VH0HuTqA
   9Qq4spcj80f6d4lZybO+FUabaEpoxB7xKQcQ0RUGfrkl1lukg4KU1yBC7
   w==;
X-CSE-ConnectionGUID: gfG9RZSnRDiXyhzcpyMrSg==
X-CSE-MsgGUID: Q62JaQshRPm8Hscvn5tLtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63744528"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63744528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 01:36:25 -0700
X-CSE-ConnectionGUID: X//ub2ABSbWSUni2qFujxA==
X-CSE-MsgGUID: Xa64sinjQyWcXJJhfXNm9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185291251"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 01:36:23 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vE1fI-00000003YWb-08DS;
	Wed, 29 Oct 2025 10:36:20 +0200
Date: Wed, 29 Oct 2025 10:36:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] platform/x86/intel: Introduce Intel Elkhart Lake
 PSE I/O
Message-ID: <aQHSA6TtCAVGDRNo@smile.fi.intel.com>
References: <20251029062050.4160517-1-raag.jadav@intel.com>
 <20251029062050.4160517-2-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029062050.4160517-2-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 29, 2025 at 11:50:49AM +0530, Raag Jadav wrote:
> Intel Elkhart Lake Programmable Service Engine (PSE) includes two PCI
> devices that expose two different capabilities of GPIO and Timed I/O
> as a single PCI function through shared MMIO with below layout.
> 
> GPIO: 0x0000 - 0x1000
> TIO:  0x1000 - 0x2000
> 
> This driver enumerates the PCI parent device and creates auxiliary child
> devices for these capabilities. The actual functionalities are provided
> by their respective auxiliary drivers.

...

> +#include <linux/auxiliary_bus.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device/devres.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gfp_types.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/sizes.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>

> +#define EHL_PSE_IO_DEV_OFFSET	SZ_4K
> +#define EHL_PSE_IO_DEV_SIZE	SZ_4K

Not sure if SZ_4K is a good idea for the _OFFSET, the _SIZE is fine. Also why
do we need two? If the devices are of the same size, we don't need to have a
separate offset.

...

> +static int ehl_pse_io_dev_add(struct pci_dev *pci, const char *name, int idx)
> +{
> +	struct auxiliary_device *aux_dev;
> +	struct device *dev = &pci->dev;
> +	struct ehl_pse_io_dev *io_dev;
> +	resource_size_t start;
> +	int ret;
> +
> +	io_dev = kzalloc(sizeof(*io_dev), GFP_KERNEL);
> +	if (!io_dev)
> +		return -ENOMEM;

Why devm_kzalloc() can't be used? I don't see if the device lifetime is anyhow
different to this object. Am I wrong?

> +	start = pci_resource_start(pci, 0);
> +	io_dev->irq = pci_irq_vector(pci, idx);
> +	io_dev->mem = DEFINE_RES_MEM(start + (EHL_PSE_IO_DEV_OFFSET * idx), EHL_PSE_IO_DEV_SIZE);
> +
> +	aux_dev = &io_dev->aux_dev;
> +	aux_dev->name = name;
> +	aux_dev->id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
> +	aux_dev->dev.parent = dev;
> +	aux_dev->dev.release = ehl_pse_io_dev_release;
> +
> +	ret = auxiliary_device_init(aux_dev);
> +	if (ret)
> +		goto free_io_dev;
> +
> +	ret = __auxiliary_device_add(aux_dev, dev->driver->name);

Hmm... Is it okay to use double underscored variant? Only a single driver uses
this so far... Care to elaborate?

> +	if (ret)
> +		goto uninit_aux_dev;
> +
> +	return 0;
> +
> +uninit_aux_dev:
> +	/* io_dev will be freed with the put_device() and .release sequence */

Right...

> +	auxiliary_device_uninit(aux_dev);
> +free_io_dev:
> +	kfree(io_dev);

...and this is a double free, correct?

> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko



