Return-Path: <linux-gpio+bounces-17625-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D59A611AB
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 13:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11482462071
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 12:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DB91FECCC;
	Fri, 14 Mar 2025 12:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0QfVvsR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8461CD3F;
	Fri, 14 Mar 2025 12:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741956295; cv=none; b=kQNQuQyu9i5bnmp+BVjI3sWDDswBm2KAIkZeOTmQ5OMOmwhRWZ6hvHkdxEVEVs/GYob0QnSTkLGT4/wlwlcRgJ44XdsZ/yuqp+YWKjOcny8hfoAEOmJgoqGU8qfMkwVmO1KSHLS0ijmFXa/zV8ZiW1agEDKMLVVuTRo88ue7Sio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741956295; c=relaxed/simple;
	bh=La6DZY4wbnGcBiVMBa0k0r8J7SH1OiA+ze5JGrV4quM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rw7JGjobT1J9ON1hE5l2Ymxjv03M2/LLrlo+VHmqcVWB/W5pZ3In0uREM2urhHnQzYeRqKHXHWNn3MK7VaW5Bw4bMbGUup5Q4GDkY30GyT4TpXiGBuVFbXTWtMymq+WuPqIi9M68XD7WGCEaHZYS0foGd8oPXbOc0YKw32luFzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0QfVvsR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D50C4CEE3;
	Fri, 14 Mar 2025 12:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741956294;
	bh=La6DZY4wbnGcBiVMBa0k0r8J7SH1OiA+ze5JGrV4quM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0QfVvsRtcEwCo2I/kxPYbzf1oK4HUDvur8Nbp4vYklKQv7RIQUkGYWQleJr8C6Om
	 v7YfYzBYb3jKf9ASNZyUZyGtH9LcPuonu3AcUuqjoY2+XITyS9o5byQwaGzOpcmgZ2
	 I3d8mshiWOSx/jyElH4Ue8SNyG4XgdhQG/ZK9VPPwyCWGo1SQGlx4g5ryHIxo7X5cJ
	 ku3XkhWs8w/xSOQu/LKkZejbeDGiQpsKY+xZElt6qvu/HkGYIdEKOD9kUHB7jo3Y/w
	 s7jaH+0z44iBnzvtpo4xV3PEmBwYESJOc6FY+pJ766Rg0bGf28c9TmF5+Z/XZceFS5
	 Wow5k5SkwKd8w==
Date: Fri, 14 Mar 2025 12:44:50 +0000
From: Lee Jones <lee@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: giometti@enneenne.com, gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com, raymond.tan@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <20250314124450.GP3890718@google.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-2-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307052231.551737-2-raag.jadav@intel.com>

On Fri, 07 Mar 2025, Raag Jadav wrote:

> Intel Elkhart Lake Programmable Service Engine (PSE) includes two PCI
> devices that expose two different capabilities of GPIO and Timed I/O
> as a single PCI function through shared MMIO.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  MAINTAINERS                      |   5 ++
>  drivers/mfd/Kconfig              |  12 ++++
>  drivers/mfd/Makefile             |   1 +
>  drivers/mfd/intel_ehl_pse_gpio.c | 100 +++++++++++++++++++++++++++++++
>  4 files changed, 118 insertions(+)
>  create mode 100644 drivers/mfd/intel_ehl_pse_gpio.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d4280facbe51..eb216eebb3a6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11604,6 +11604,11 @@ F:	drivers/gpu/drm/xe/
>  F:	include/drm/intel/
>  F:	include/uapi/drm/xe_drm.h
>  
> +INTEL EHL PSE GPIO MFD DRIVER
> +M:	Raag Jadav <raag.jadav@intel.com>
> +S:	Supported
> +F:	drivers/mfd/intel_ehl_pse_gpio.c
> +
>  INTEL ETHERNET DRIVERS
>  M:	Tony Nguyen <anthony.l.nguyen@intel.com>
>  M:	Przemek Kitszel <przemyslaw.kitszel@intel.com>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6b0682af6e32..36eac5245179 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -597,6 +597,18 @@ config MFD_HI655X_PMIC
>  	help
>  	  Select this option to enable Hisilicon hi655x series pmic driver.
>  
> +config MFD_INTEL_EHL_PSE_GPIO
> +	tristate "Intel Elkhart Lake PSE GPIO MFD"
> +	depends on PCI && (X86 || COMPILE_TEST)
> +	select MFD_CORE
> +	help
> +	  This MFD provides support for GPIO and TIO that exist on Intel

Remove references to MFD.

> +	  Elkhart Lake PSE as a single PCI device. It splits the two I/O
> +	  devices to their respective I/O drivers.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called intel_ehl_pse_gpio.
> +
>  config MFD_INTEL_QUARK_I2C_GPIO
>  	tristate "Intel Quark MFD I2C GPIO"
>  	depends on PCI
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 9220eaf7cf12..8f7d257856db 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -196,6 +196,7 @@ obj-$(CONFIG_MFD_TIMBERDALE)    += timberdale.o
>  obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
>  obj-$(CONFIG_MFD_ADP5585)	+= adp5585.o
>  obj-$(CONFIG_MFD_KEMPLD)	+= kempld-core.o
> +obj-$(CONFIG_MFD_INTEL_EHL_PSE_GPIO)	+= intel_ehl_pse_gpio.o
>  obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+= intel_quark_i2c_gpio.o
>  obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o
>  obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
> diff --git a/drivers/mfd/intel_ehl_pse_gpio.c b/drivers/mfd/intel_ehl_pse_gpio.c
> new file mode 100644
> index 000000000000..6a6ad1390a7b
> --- /dev/null
> +++ b/drivers/mfd/intel_ehl_pse_gpio.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Intel MFD driver for Elkhart Lake - Programmable Service Engine

As above.

> + * (PSE) GPIO & TIO
> + *
> + * Copyright (c) 2025 Intel Corporation
> + *
> + * Intel Elkhart Lake PSE includes two PCI devices that expose two
> + * different capabilities of GPIO and Timed I/O as a single PCI
> + * function through shared MMIO.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/ioport.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/stddef.h>
> +
> +#define PSE_GPIO_OFFSET		0x0000
> +#define PSE_GPIO_SIZE		0x0134
> +
> +#define PSE_TIO_OFFSET		0x1000
> +#define PSE_TIO_SIZE		0x06B0
> +
> +static struct resource ehl_pse_gpio_resources[] = {
> +	DEFINE_RES_MEM(PSE_GPIO_OFFSET, PSE_GPIO_SIZE),
> +	DEFINE_RES_IRQ(0),
> +};
> +
> +static struct resource ehl_pse_tio_resources[] = {
> +	DEFINE_RES_MEM(PSE_TIO_OFFSET, PSE_TIO_SIZE),
> +	DEFINE_RES_IRQ(1),
> +};
> +
> +static struct mfd_cell ehl_pse_gpio_devs[] = {
> +	{
> +		.name = "gpio-elkhartlake",
> +		.num_resources = ARRAY_SIZE(ehl_pse_gpio_resources),
> +		.resources = ehl_pse_gpio_resources,
> +		.ignore_resource_conflicts = true,
> +	},
> +	{
> +		.name = "pps-gen-tio",
> +		.num_resources = ARRAY_SIZE(ehl_pse_tio_resources),
> +		.resources = ehl_pse_tio_resources,
> +		.ignore_resource_conflicts = true,
> +	},
> +};
> +
> +static int ehl_pse_gpio_probe(struct pci_dev *pci, const struct pci_device_id *id)
> +{
> +	int ret;
> +
> +	ret = pcim_enable_device(pci);
> +	if (ret)
> +		return ret;
> +
> +	pci_set_master(pci);
> +
> +	ret = pci_alloc_irq_vectors(pci, 2, 2, PCI_IRQ_ALL_TYPES);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = mfd_add_devices(&pci->dev, PLATFORM_DEVID_AUTO, ehl_pse_gpio_devs,

dev_*?

> +			      ARRAY_SIZE(ehl_pse_gpio_devs), pci_resource_n(pci, 0),
> +			      pci_irq_vector(pci, 0), NULL);
> +	if (ret)
> +		pci_free_irq_vectors(pci);
> +
> +	return ret;
> +}
> +
> +static void ehl_pse_gpio_remove(struct pci_dev *pdev)
> +{
> +	mfd_remove_devices(&pdev->dev);
> +	pci_free_irq_vectors(pdev);
> +}
> +
> +static const struct pci_device_id ehl_pse_gpio_ids[] = {
> +	{ PCI_VDEVICE(INTEL, 0x4b88) },
> +	{ PCI_VDEVICE(INTEL, 0x4b89) },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(pci, ehl_pse_gpio_ids);
> +
> +static struct pci_driver ehl_pse_gpio_driver = {
> +	.probe		= ehl_pse_gpio_probe,
> +	.remove		= ehl_pse_gpio_remove,
> +	.id_table	= ehl_pse_gpio_ids,
> +	.name		= "ehl_pse_gpio",
> +};
> +module_pci_driver(ehl_pse_gpio_driver);
> +
> +MODULE_AUTHOR("Raymond Tan <raymond.tan@intel.com>");
> +MODULE_AUTHOR("Raag Jadav <raag.jadav@intel.com>");
> +MODULE_DESCRIPTION("Intel MFD for Elkhart Lake PSE GPIO & TIO");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]

