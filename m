Return-Path: <linux-gpio+bounces-28283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A0EC4533E
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 08:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A087188EA52
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 07:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E73D2EBB81;
	Mon, 10 Nov 2025 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOwOJrBO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047AB1F4CB3;
	Mon, 10 Nov 2025 07:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762759518; cv=none; b=r+ceRTXpPzfgknrmPiTKsKGcaRfSJKVQeg0vOa42tNsVP+1cTPAAHXlveu19w9GYbE46/Pcucg+1xj8mc8UP8eKQ3tqaUUr6QGAo0feCM10xKbn/Aip0L/akIRKY64kn/8tvYioy2iHcU+FFpJQKstC7u8EYaNnz1z4kk23l6n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762759518; c=relaxed/simple;
	bh=c/bICPNIrKIsaGuPJ51BMM9KOXzYsygrAVCXDn392Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ikr3P9vdLkPfZclkLCaVlrp8kxu/rsPSpEW1kyontLG6uWIMIl0CHIZHWC/ZHTTtox+a6BNq7qzS2YtVzIv8Jv1+VXciAxJUEAO2NoaR1iw29jzfTRiFQexjo2auBkBs3cF7iNZw09/sZNbk3i92mmLpKFdT65P0ZRPgOPXZ3hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOwOJrBO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762759516; x=1794295516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c/bICPNIrKIsaGuPJ51BMM9KOXzYsygrAVCXDn392Z4=;
  b=ZOwOJrBOUguOffWw8rs4HuPPS6naQj4R+o6NS+hfjzwTt5iJgMlKPD0x
   7oELdRkrKVmZAgBIIOZo7psCSsrv+GJTHpbkOPg2PU3MTWjRGtTppoH81
   Z12H531NWZAY4jOnMplu8i17ck2xxXnl1FzSBpwtyp6KTn3EUkzEicTZ4
   ZhYOAJF3YBxPCGtK5AGfcF/ZbSc6WH4p5c+QcGXXLHjmj7ZHPDTKML6Ka
   X7xe+dbKjHOYOownd8HsPAOQPgiEPLJiHwgD2TGRBnu0grnEoNvJIXIiE
   4h/9PIq4bWS0lzKpzz7MjtHUhKrYoYQ1Z+egX4pMghh1z2duen7B08ZMG
   g==;
X-CSE-ConnectionGUID: FAmmRx7iQr6biIo1J1T56A==
X-CSE-MsgGUID: lxIyMJghThm9MZ/XIXzhCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="82203042"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="82203042"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 23:25:15 -0800
X-CSE-ConnectionGUID: fuKwWC63QiqVT31K8ZW59A==
X-CSE-MsgGUID: ckUc5Ax7TbygHM3AOyKOlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="193783537"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.185])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 23:25:13 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vIMH0-00000007NGo-2IKU;
	Mon, 10 Nov 2025 09:25:10 +0200
Date: Mon, 10 Nov 2025 09:25:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/x86/intel: Introduce Intel Elkhart Lake
 PSE I/O
Message-ID: <aRGTVguXqO2oNCCW@smile.fi.intel.com>
References: <20251110052728.383339-1-raag.jadav@intel.com>
 <20251110052728.383339-2-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110052728.383339-2-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 10, 2025 at 10:56:40AM +0530, Raag Jadav wrote:
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

> +static int ehl_pse_io_dev_add(struct pci_dev *pci, const char *name, int idx)
> +{
> +	struct auxiliary_device *aux_dev;
> +	struct device *dev = &pci->dev;
> +	struct ehl_pse_io_dev *io_dev;
> +	resource_size_t start, offset;
> +	int ret;
> +
> +	io_dev = devm_kzalloc(dev, sizeof(*io_dev), GFP_KERNEL);
> +	if (!io_dev)
> +		return -ENOMEM;
> +
> +	start = pci_resource_start(pci, 0);
> +	offset = EHL_PSE_IO_DEV_SIZE * idx;
> +
> +	io_dev->irq = pci_irq_vector(pci, idx);
> +	io_dev->mem = DEFINE_RES_MEM(start + offset, EHL_PSE_IO_DEV_SIZE);
> +
> +	aux_dev = &io_dev->aux_dev;
> +	aux_dev->name = name;
> +	aux_dev->id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
> +	aux_dev->dev.parent = dev;
> +	aux_dev->dev.release = ehl_pse_io_dev_release;
> +
> +	ret = auxiliary_device_init(aux_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = auxiliary_device_add(aux_dev);
> +	if (ret) {
> +		auxiliary_device_uninit(aux_dev);
> +		return ret;
> +	}

Can it be now auxiliary_device_create() ?

> +	return devm_add_action_or_reset(dev, ehl_pse_io_dev_destroy, aux_dev);
> +}

...

> +#define auxiliary_dev_to_ehl_pse_io_dev(auxiliary_dev) \
> +	container_of(auxiliary_dev, struct ehl_pse_io_dev, aux_dev)

Wondering if we may use container_of_const()

-- 
With Best Regards,
Andy Shevchenko



