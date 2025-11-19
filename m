Return-Path: <linux-gpio+bounces-28746-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C3CC6E49D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 12:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id A11682E472
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 11:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E7A3538A1;
	Wed, 19 Nov 2025 11:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6V5B1SG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5270F3502B1;
	Wed, 19 Nov 2025 11:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552533; cv=none; b=i8gk5RTSXYqEhdEJVrlP8I9ZF1NFd/4O9pPBNcQiorzNBIQhl0dij18ohprEA/AZ+QJwEOQqZU9aurIGaYvPf7N1pcex7tZbCkBwiiYYIgEKtxViVcpHAeMaeJMlB1EXWiVirHJu7DqPhLQ08RdT3zOaL0KxddkWaWyQvQdCzdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552533; c=relaxed/simple;
	bh=/QoFRTPuWSjuX21l4IUv1WRbz8iyh2LR5fIlaAgOXx4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fBEYmXDCNVVzXmT2JDiHt5PtYDTla+K3SeeulaEBiOA4ztlrNx0aKEkVQrQEf4EyQFEKElf59XMKHNav/yva+2W+rkaciAtVWkOnLxzerNSG5PELrz/a9KhhiLfGgGDWRvyHcbqfCGv4PzlghNBkFl9KAZRWr0Jf/opdaS8v1Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6V5B1SG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763552531; x=1795088531;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/QoFRTPuWSjuX21l4IUv1WRbz8iyh2LR5fIlaAgOXx4=;
  b=D6V5B1SG15bTPnwkOMPPdg0l61gaHJTEqelAq2n3cjpXqVQgsfEfuVun
   sOn1Enuk8d9wZfssbALjF2MaGCt6DgNM3rTD2OlAzlcV0sDoIeN0YtBId
   P6V4flqpScT35fzSu+wsrAngxL8H4oGbi3MUErTm1RSVYzJKLb4Q0yrR1
   4DKdyAOnoFXXeNktU2Rgg+4YUP8vZopT4taCfn4yp91w7Fkwyr3KXbHaX
   6Jq+owAm4IJkw5OALK/dGHILf37LckpCCpiIVBJMbekPHRnsIexlT5vib
   xJ5fJOlRXWGUphCvF7e+ZXsZuOYGX6a4S7Gf0n8asQRm2f0Pb/8lC76jd
   w==;
X-CSE-ConnectionGUID: OcShErxXSsO+ZS/6ylTeeQ==
X-CSE-MsgGUID: OQNqwTb8Q16N4qyHsdY0qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76270100"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76270100"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 03:42:09 -0800
X-CSE-ConnectionGUID: pT26XIruS3GpxCllH3AfaQ==
X-CSE-MsgGUID: NexPGw0TTomqSROX5dTF9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190693589"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 03:42:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 19 Nov 2025 13:42:02 +0200 (EET)
To: Raag Jadav <raag.jadav@intel.com>
cc: Hans de Goede <hansg@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    linus.walleij@linaro.org, brgl@bgdev.pl, 
    platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 2/2] gpio: elkhartlake: Convert to auxiliary driver
In-Reply-To: <20251112034040.457801-3-raag.jadav@intel.com>
Message-ID: <d6aa3721-0425-49e7-e5dd-8fdc8e7cb1d5@linux.intel.com>
References: <20251112034040.457801-1-raag.jadav@intel.com> <20251112034040.457801-3-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-348302690-1763552522=:970"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-348302690-1763552522=:970
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 12 Nov 2025, Raag Jadav wrote:

> Since PCI device should not be abusing platform device, MFD parent to
> platform child path is no longer being pursued for this driver. Convert
> it to auxiliary driver, which will be used by EHL PSE auxiliary device.
>=20
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/Kconfig            |  2 +-
>  drivers/gpio/gpio-elkhartlake.c | 36 +++++++++++++++++----------------
>  2 files changed, 20 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 7ee3afbc2b05..d4b4451b4696 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1413,7 +1413,7 @@ config HTC_EGPIO
> =20
>  config GPIO_ELKHARTLAKE
>  =09tristate "Intel Elkhart Lake PSE GPIO support"
> -=09depends on X86 || COMPILE_TEST
> +=09depends on INTEL_EHL_PSE_IO
>  =09select GPIO_TANGIER
>  =09help
>  =09  Select this option to enable GPIO support for Intel Elkhart Lake
> diff --git a/drivers/gpio/gpio-elkhartlake.c b/drivers/gpio/gpio-elkhartl=
ake.c
> index 95de52d2cc63..b96e7928b6e5 100644
> --- a/drivers/gpio/gpio-elkhartlake.c
> +++ b/drivers/gpio/gpio-elkhartlake.c
> @@ -2,43 +2,46 @@
>  /*
>   * Intel Elkhart Lake PSE GPIO driver
>   *
> - * Copyright (c) 2023 Intel Corporation.
> + * Copyright (c) 2023, 2025 Intel Corporation.
>   *
>   * Authors: Pandith N <pandith.n@intel.com>
>   *          Raag Jadav <raag.jadav@intel.com>
>   */
> =20
> +#include <linux/auxiliary_bus.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/module.h>
> -#include <linux/platform_device.h>
>  #include <linux/pm.h>
> =20
> +#include <linux/ehl_pse_io_aux.h>
> +
>  #include "gpio-tangier.h"
> =20
>  /* Each Intel EHL PSE GPIO Controller has 30 GPIO pins */
>  #define EHL_PSE_NGPIO=09=0930
> =20
> -static int ehl_gpio_probe(struct platform_device *pdev)
> +static int ehl_gpio_probe(struct auxiliary_device *adev, const struct au=
xiliary_device_id *id)
>  {
> -=09struct device *dev =3D &pdev->dev;
> +=09struct device *dev =3D &adev->dev;
> +=09struct ehl_pse_io_data *data;
>  =09struct tng_gpio *priv;
> -=09int irq, ret;
> +=09int ret;
> =20
> -=09irq =3D platform_get_irq(pdev, 0);
> -=09if (irq < 0)
> -=09=09return irq;
> +=09data =3D dev_get_platdata(dev);
> +=09if (!data)
> +=09=09return -ENODATA;
> =20
>  =09priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  =09if (!priv)
>  =09=09return -ENOMEM;
> =20
> -=09priv->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> +=09priv->reg_base =3D devm_ioremap_resource(dev, &data->mem);
>  =09if (IS_ERR(priv->reg_base))
>  =09=09return PTR_ERR(priv->reg_base);
> =20
>  =09priv->dev =3D dev;
> -=09priv->irq =3D irq;
> +=09priv->irq =3D data->irq;
> =20
>  =09priv->info.base =3D -1;
>  =09priv->info.ngpio =3D EHL_PSE_NGPIO;
> @@ -51,25 +54,24 @@ static int ehl_gpio_probe(struct platform_device *pde=
v)
>  =09if (ret)
>  =09=09return dev_err_probe(dev, ret, "tng_gpio_probe error\n");
> =20
> -=09platform_set_drvdata(pdev, priv);
> +=09auxiliary_set_drvdata(adev, priv);
>  =09return 0;
>  }
> =20
> -static const struct platform_device_id ehl_gpio_ids[] =3D {
> -=09{ "gpio-elkhartlake" },
> +static const struct auxiliary_device_id ehl_gpio_ids[] =3D {
> +=09{ EHL_PSE_IO_NAME "." EHL_PSE_GPIO_NAME },
>  =09{ }
>  };
> -MODULE_DEVICE_TABLE(platform, ehl_gpio_ids);
> +MODULE_DEVICE_TABLE(auxiliary, ehl_gpio_ids);
> =20
> -static struct platform_driver ehl_gpio_driver =3D {
> +static struct auxiliary_driver ehl_gpio_driver =3D {
>  =09.driver=09=3D {
> -=09=09.name=09=3D "gpio-elkhartlake",
>  =09=09.pm=09=3D pm_sleep_ptr(&tng_gpio_pm_ops),
>  =09},
>  =09.probe=09=09=3D ehl_gpio_probe,
>  =09.id_table=09=3D ehl_gpio_ids,
>  };
> -module_platform_driver(ehl_gpio_driver);
> +module_auxiliary_driver(ehl_gpio_driver);
> =20
>  MODULE_AUTHOR("Pandith N <pandith.n@intel.com>");
>  MODULE_AUTHOR("Raag Jadav <raag.jadav@intel.com>");
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-348302690-1763552522=:970--

