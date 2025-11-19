Return-Path: <linux-gpio+bounces-28745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 071DAC6E383
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 12:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id B1D582DCFB
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 11:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EED34CFD5;
	Wed, 19 Nov 2025 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JlNhu3i8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9F234321B;
	Wed, 19 Nov 2025 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763551664; cv=none; b=P55SU8dfucsOe2/zNhQxtzPs40Tl/XLXFMSSukEmKpq9k1JDwgOSregjX4ZjyOV14l0lv8KtwdmeGfxtiBa0YqXjE7JcSnFBevsXxmySVOMU3KuxUArbO3Ix0fAv741Ay2qDjfeJm+I+0W3fE+hqRYMQ0KOTfC9GrbSR2R1eLic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763551664; c=relaxed/simple;
	bh=QVLShkHsFfRemQFPwBOFKm/bopMuYitFNwB2ooYxjmI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GBFqEDgob4bXx60gO9iWlNTOE1ddDmdKaLpL5Z2rqgOA1CbAW5AU12ExqYxun+QLifxl2jfoVjrHo8f894gmpzZShdjSXbxFrJHQ6PmVUX8x/y2xfqu4Ccj5jwHNGY1bzZ9gQkSkEbetbe7ep0Yuktb+3CzrdFJzEkmDObXSRzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JlNhu3i8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763551662; x=1795087662;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QVLShkHsFfRemQFPwBOFKm/bopMuYitFNwB2ooYxjmI=;
  b=JlNhu3i85kL4Uj2lewBfX/V6YzxZofKmDdK55LZdLALR7nWRmJ5RThll
   j81/XYFGvy1elel20mRA2EFp2gxR0Drv3kRUfyRxYcvAcDqYM0E5e9rUD
   uhSsAqy+yAh4YR9Dpd67IuC5pewAU9UaAyF/kAu4eDV0Fatu+5KwCHdGw
   vQcCXMFSvO2VurCcE8ZYx/dQreF/TUxRlfKD3N9X/Z3plEEhragNrK1Ek
   fIeWyP0amUUNLIJY7F/7hgpHmL8aMsenOHzMLYnlUEY2bcvMjJFsAMhVT
   Y+SjOGYLVEGlWUL7y+TJBXPqvN8aUNjHHE6IB0M1FoJ4FUX0Cb+7gFq5V
   A==;
X-CSE-ConnectionGUID: PHXJtBNORhGlXGkom4h4Kw==
X-CSE-MsgGUID: XbwWwl6OTta4ujHYem6k5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="53159884"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="53159884"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 03:27:41 -0800
X-CSE-ConnectionGUID: Hu6H7NwaRMqG5nEESrlHqA==
X-CSE-MsgGUID: +fsHfnH8Ra6m9XrJaJyyWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="195149226"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 03:27:38 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 19 Nov 2025 13:27:34 +0200 (EET)
To: Raag Jadav <raag.jadav@intel.com>
cc: Hans de Goede <hansg@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    linus.walleij@linaro.org, brgl@bgdev.pl, 
    platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] platform/x86/intel: Introduce Intel Elkhart Lake
 PSE I/O
In-Reply-To: <20251112034040.457801-2-raag.jadav@intel.com>
Message-ID: <cf5442ed-ccbf-03ea-b885-93ef654a5aee@linux.intel.com>
References: <20251112034040.457801-1-raag.jadav@intel.com> <20251112034040.457801-2-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1208371135-1763551654=:970"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1208371135-1763551654=:970
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 12 Nov 2025, Raag Jadav wrote:

> Intel Elkhart Lake Programmable Service Engine (PSE) includes two PCI
> devices that expose two different capabilities of GPIO and Timed I/O
> as a single PCI function through shared MMIO with below layout.
>=20
> GPIO: 0x0000 - 0x1000
> TIO:  0x1000 - 0x2000
>=20
> This driver enumerates the PCI parent device and creates auxiliary child
> devices for these capabilities. The actual functionalities are provided
> by their respective auxiliary drivers.
>=20
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--
 i.

> ---
>  MAINTAINERS                             |  7 ++
>  drivers/platform/x86/intel/Kconfig      | 13 ++++
>  drivers/platform/x86/intel/Makefile     |  1 +
>  drivers/platform/x86/intel/ehl_pse_io.c | 86 +++++++++++++++++++++++++
>  include/linux/ehl_pse_io_aux.h          | 24 +++++++
>  5 files changed, 131 insertions(+)
>  create mode 100644 drivers/platform/x86/intel/ehl_pse_io.c
>  create mode 100644 include/linux/ehl_pse_io_aux.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46126ce2f968..bd2a009d73c6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12499,6 +12499,13 @@ F:=09drivers/gpu/drm/xe/
>  F:=09include/drm/intel/
>  F:=09include/uapi/drm/xe_drm.h
> =20
> +INTEL ELKHART LAKE PSE I/O DRIVER
> +M:=09Raag Jadav <raag.jadav@intel.com>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Supported
> +F:=09drivers/platform/x86/intel/ehl_pse_io.c
> +F:=09include/linux/ehl_pse_io_aux.h
> +
>  INTEL ETHERNET DRIVERS
>  M:=09Tony Nguyen <anthony.l.nguyen@intel.com>
>  M:=09Przemek Kitszel <przemyslaw.kitszel@intel.com>
> diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/in=
tel/Kconfig
> index 19a2246f2770..2900407d6095 100644
> --- a/drivers/platform/x86/intel/Kconfig
> +++ b/drivers/platform/x86/intel/Kconfig
> @@ -41,6 +41,19 @@ config INTEL_VBTN
>  =09  To compile this driver as a module, choose M here: the module will
>  =09  be called intel_vbtn.
> =20
> +config INTEL_EHL_PSE_IO
> +=09tristate "Intel Elkhart Lake PSE I/O driver"
> +=09depends on PCI
> +=09select AUXILIARY_BUS
> +=09help
> +=09  Select this option to enable Intel Elkhart Lake PSE GPIO and Timed
> +=09  I/O support. This driver enumerates the PCI parent device and
> +=09  creates auxiliary child devices for these capabilities. The actual
> +=09  functionalities are provided by their respective auxiliary drivers.
> +
> +=09  To compile this driver as a module, choose M here: the module will
> +=09  be called intel_ehl_pse_io.
> +
>  config INTEL_INT0002_VGPIO
>  =09tristate "Intel ACPI INT0002 Virtual GPIO driver"
>  =09depends on GPIOLIB && ACPI && PM_SLEEP
> diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/i=
ntel/Makefile
> index 78acb414e154..138b13756158 100644
> --- a/drivers/platform/x86/intel/Makefile
> +++ b/drivers/platform/x86/intel/Makefile
> @@ -21,6 +21,7 @@ intel-target-$(CONFIG_INTEL_HID_EVENT)=09=09+=3D hid.o
>  intel-target-$(CONFIG_INTEL_VBTN)=09=09+=3D vbtn.o
> =20
>  # Intel miscellaneous drivers
> +intel-target-$(CONFIG_INTEL_EHL_PSE_IO)=09=09+=3D ehl_pse_io.o
>  intel-target-$(CONFIG_INTEL_INT0002_VGPIO)=09+=3D int0002_vgpio.o
>  intel-target-$(CONFIG_INTEL_ISHTP_ECLITE)=09+=3D ishtp_eclite.o
>  intel-target-$(CONFIG_INTEL_OAKTRAIL)=09=09+=3D oaktrail.o
> diff --git a/drivers/platform/x86/intel/ehl_pse_io.c b/drivers/platform/x=
86/intel/ehl_pse_io.c
> new file mode 100644
> index 000000000000..861e14808b35
> --- /dev/null
> +++ b/drivers/platform/x86/intel/ehl_pse_io.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Intel Elkhart Lake Programmable Service Engine (PSE) I/O
> + *
> + * Copyright (c) 2025 Intel Corporation.
> + *
> + * Author: Raag Jadav <raag.jadav@intel.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device/devres.h>
> +#include <linux/errno.h>
> +#include <linux/gfp_types.h>
> +#include <linux/ioport.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/sizes.h>
> +#include <linux/types.h>
> +
> +#include <linux/ehl_pse_io_aux.h>
> +
> +#define EHL_PSE_IO_DEV_SIZE=09SZ_4K
> +
> +static int ehl_pse_io_dev_create(struct pci_dev *pci, const char *name, =
int idx)
> +{
> +=09struct device *dev =3D &pci->dev;
> +=09struct auxiliary_device *adev;
> +=09struct ehl_pse_io_data *data;
> +=09resource_size_t start, offset;
> +=09u32 id;
> +
> +=09data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +=09if (!data)
> +=09=09return -ENOMEM;
> +
> +=09id =3D (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
> +=09start =3D pci_resource_start(pci, 0);
> +=09offset =3D EHL_PSE_IO_DEV_SIZE * idx;
> +
> +=09data->mem =3D DEFINE_RES_MEM(start + offset, EHL_PSE_IO_DEV_SIZE);
> +=09data->irq =3D pci_irq_vector(pci, idx);
> +
> +=09adev =3D __devm_auxiliary_device_create(dev, EHL_PSE_IO_NAME, name, d=
ata, id);
> +
> +=09return adev ? 0 : -ENODEV;
> +}
> +
> +static int ehl_pse_io_probe(struct pci_dev *pci, const struct pci_device=
_id *id)
> +{
> +=09int ret;
> +
> +=09ret =3D pcim_enable_device(pci);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09pci_set_master(pci);
> +
> +=09ret =3D pci_alloc_irq_vectors(pci, 2, 2, PCI_IRQ_MSI);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D ehl_pse_io_dev_create(pci, EHL_PSE_GPIO_NAME, 0);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return ehl_pse_io_dev_create(pci, EHL_PSE_TIO_NAME, 1);
> +}
> +
> +static const struct pci_device_id ehl_pse_io_ids[] =3D {
> +=09{ PCI_VDEVICE(INTEL, 0x4b88) },
> +=09{ PCI_VDEVICE(INTEL, 0x4b89) },
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(pci, ehl_pse_io_ids);
> +
> +static struct pci_driver ehl_pse_io_driver =3D {
> +=09.name=09=09=3D EHL_PSE_IO_NAME,
> +=09.id_table=09=3D ehl_pse_io_ids,
> +=09.probe=09=09=3D ehl_pse_io_probe,
> +};
> +module_pci_driver(ehl_pse_io_driver);
> +
> +MODULE_AUTHOR("Raag Jadav <raag.jadav@intel.com>");
> +MODULE_DESCRIPTION("Intel Elkhart Lake PSE I/O driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/ehl_pse_io_aux.h b/include/linux/ehl_pse_io_au=
x.h
> new file mode 100644
> index 000000000000..afb8587ee5fb
> --- /dev/null
> +++ b/include/linux/ehl_pse_io_aux.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Intel Elkhart Lake PSE I/O Auxiliary Device
> + *
> + * Copyright (c) 2025 Intel Corporation.
> + *
> + * Author: Raag Jadav <raag.jadav@intel.com>
> + */
> +
> +#ifndef _EHL_PSE_IO_AUX_H_
> +#define _EHL_PSE_IO_AUX_H_
> +
> +#include <linux/ioport.h>
> +
> +#define EHL_PSE_IO_NAME=09=09"ehl_pse_io"
> +#define EHL_PSE_GPIO_NAME=09"gpio"
> +#define EHL_PSE_TIO_NAME=09"pps_tio"
> +
> +struct ehl_pse_io_data {
> +=09struct resource mem;
> +=09int irq;
> +};
> +
> +#endif /* _EHL_PSE_IO_AUX_H_ */
>=20
--8323328-1208371135-1763551654=:970--

