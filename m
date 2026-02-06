Return-Path: <linux-gpio+bounces-31486-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oALIIfSzhWmbFQQAu9opvQ
	(envelope-from <linux-gpio+bounces-31486-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 10:27:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A134FC037
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 10:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B9AE300DCC8
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 09:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348FB35D5E5;
	Fri,  6 Feb 2026 09:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDgmghiv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AF035CBC5;
	Fri,  6 Feb 2026 09:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770370032; cv=none; b=ANuFayBkNNhM1ZAoZtR9m57zChmnQse5Gp/75AGuDY2YzBCwCntiBDaAWlUCJLLIUcmRULW0ufmW4hXi++tGTunP3w0mFCv/Ql4GUG0SA2BeSLMO7sPfSVOCxxAMi17m6jk/4fgkeb2e6rGLxnGOOuHe0QZ2HGCdAIVGLaLyxIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770370032; c=relaxed/simple;
	bh=nToHAuWiyK+8sdjvOIHy9y1on5iGem4d1XUOM/KIjps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOzb+VYGr5bqVBxN2OtIz+dqhRh4/0JTY0M3mYVs6KYUNLBqSpUpvlRAYQdrbuG/IlmKMEGqzO2V30rt+2YGQ6zPqmgHXS/M0RHudMKYWJ6EnKt3nQW51impNRJWjDWBYgG+gx8WITGpYsk1ZjcyjqlaMe0KGzgbCHckbx6l2go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDgmghiv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA88C19421;
	Fri,  6 Feb 2026 09:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770370031;
	bh=nToHAuWiyK+8sdjvOIHy9y1on5iGem4d1XUOM/KIjps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GDgmghiv0jKW2w+oEn8vgHsjRlonoSg4PCYgpGRsCebLaGVcy+yVqFCXNBhxscIz6
	 7wO9vm4jwr6cD7n73ncwPAPc6ekqdgHN4LLjUvilZftMWfQMqkpU4d7mxaXCxobBc3
	 KwNZjTelX1t/+r9uLqiS9g/UTHKJ81gAvVazN4KvaTLZViD2Io75XEhQ/n2hhbN6sn
	 S6VV+MMp7896kndjOJSbUL5dm0cGBALedLQsny/1IYVPftCiPdj2gwswBE1JxOvw13
	 ToK4S26n7tq/zcgmOEsdnWa878fFgHhw7pkZaBQ7pWbLwNwqWglZWad+gtJfeYpW1O
	 hTz8wb5ERvKFA==
Date: Fri, 6 Feb 2026 10:27:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: 434779359@qq.com
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, xuchen <bright.xu@faiot.com>
Subject: Re: [PATCH] nfc: supply: Add PN7160 drivers =?utf-8?Q?=C2=A0_This?=
 =?utf-8?Q?_patch_adds_suppor?= =?utf-8?Q?t?= for the PN7160 ICs used in
 Qualcomm reference designs.
Message-ID: <20260206-bulky-aardwark-of-examination-b056ee@quoll>
References: <tencent_ACA99123220028D078B20189509FD204BC0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <tencent_ACA99123220028D078B20189509FD204BC0A@qq.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31486-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,faiot.com:email]
X-Rspamd-Queue-Id: 4A134FC037
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 01:31:10AM -0500, 434779359@qq.com wrote:
> From: xuchen <bright.xu@faiot.com>
>=20

This patch fails on so many levels that I am not going to provide any
deep review. If you followed basic guidelines, basic patch submission
guides (e.g. see Michael Opdenacker talk on this year FOSDEM), tutorials
or docs, you would solve all of the trivialities.

You did not read these basic docs, so do not be surprised if your
contributions will be entirely ignored.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patch=
es.html#i-for-patch-submitters

There is no "supply" here.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Please run standard kernel tools for static analysis, like coccinelle,
smatch and sparse, and fix reported warnings. Also please check for
warnings when building with W=3D1 for gcc and clang. Most of these
commands (checks or W=3D1 build) can build specific targets, like some
directory, to narrow the scope to only your code. The code here looks
like it needs a fix. Feel free to get in touch if the warning is not
clear.

> Signed-off-by: xuchen <434779359@qq.com>
> ---
>  drivers/nfc/pn7160/Kconfig    |  40 +++
>  drivers/nfc/pn7160/Makefile   |   6 +
>  drivers/nfc/pn7160/common.c   | 371 ++++++++++++++++++++++++
>  drivers/nfc/pn7160/common.h   |  36 +++
>  drivers/nfc/pn7160/i2c_drv.c  | 531 ++++++++++++++++++++++++++++++++++
>  drivers/nfc/pn7160/i2c_drv.h  |  26 ++
>  drivers/nfc/pn7160/platform.h | 164 +++++++++++
>  7 files changed, 1174 insertions(+)
>  create mode 100644 drivers/nfc/pn7160/Kconfig
>  create mode 100644 drivers/nfc/pn7160/Makefile
>  create mode 100644 drivers/nfc/pn7160/common.c
>  create mode 100644 drivers/nfc/pn7160/common.h
>  create mode 100644 drivers/nfc/pn7160/i2c_drv.c
>  create mode 100644 drivers/nfc/pn7160/i2c_drv.h
>  create mode 100644 drivers/nfc/pn7160/platform.h
>=20
> diff --git a/drivers/nfc/pn7160/Kconfig b/drivers/nfc/pn7160/Kconfig
> new file mode 100644
> index 000000000000..fb497bc33059
> --- /dev/null
> +++ b/drivers/nfc/pn7160/Kconfig
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# near field communication configuration
> +#
> +
> +config NXP_NFC_I2C
> +	tristate "NFC I2C Slave driver for NXP-NFCC"
> +	depends on I2C
> +	help
> +	  This enables the NFC driver for PN71xx based devices.
> +	  This is for I2C connected version. NCI protocol logic
> +	  resides in the usermode and it has no other NFC dependencies.
> +
> +	  If unsure, say N.
> +
> +config NXP_NFC_SPI
> +	tristate "NFC SPI Slave driver for NXP-NFCC"
> +	depends on SPI
> +	help
> +	  This enables the NFC driver for PN71xx based devices.
> +	  This is for SPI connected version. NCI protocol logic
> +	  resides in the usermode and it has no other NFC dependencies.
> +
> +	  If unsure, say N.
> +
> +config NXP_NFC_RECOVERY
> +	bool "NXP based NFC minimal FW update support"
> +	depends on NXP_NFC_I2C && I2C
> +	default y
> +	help
> +	  This enables NFC minimal FW update.
> +	  This feature allows updating the firmware of NXP NFC controllers
> +	  in recovery mode. It is required for field updates and bug fixes.
> +	  The driver will handle the download mode and firmware transfer
> +	  when this option is enabled.
> +
> +	  If unsure, say N.
> +
> +source "drivers/nfc/pn7160/Kconfig"
> +endif
> diff --git a/drivers/nfc/pn7160/Makefile b/drivers/nfc/pn7160/Makefile
> new file mode 100644
> index 000000000000..8c6f670eaa7a
> --- /dev/null
> +++ b/drivers/nfc/pn7160/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Makefile for nfc devices
> +#
> +obj-m			+=3D nxpnfc_i2c.o
> +nxpnfc_i2c-objs		:=3D common.o i2c_drv.o
> diff --git a/drivers/nfc/pn7160/common.c b/drivers/nfc/pn7160/common.c
> new file mode 100644
> index 000000000000..cd433912764b
> --- /dev/null
> +++ b/drivers/nfc/pn7160/common.c
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2015, The Linux Foundation. All rights reserved.
> + * Copyright (C) 2019-2021 NXP
> + */
> +
> +#include <linux/gpio.h>
> +#include <linux/of_gpio.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/fs.h>
> +
> +#include "common.h"
> +
> +int nfc_parse_dt(struct device *dev, struct platform_configs *nfc_config=
s,
> +		 uint8_t interface)
> +{
> +	struct device_node *np =3D dev->of_node;
> +	struct platform_gpio *nfc_gpio =3D &nfc_configs->gpio;
> +
> +	if (!np) {
> +		pr_err("%s: nfc of_node NULL\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	nfc_gpio->irq =3D -EINVAL;
> +	nfc_gpio->dwl_req =3D -EINVAL;
> +	nfc_gpio->ven =3D -EINVAL;
> +
> +	/* irq required for i2c based chips only */
> +	if (interface =3D=3D PLATFORM_IF_I2C || interface =3D=3D PLATFORM_IF_SP=
I) {
> +		nfc_gpio->irq =3D of_get_named_gpio(np, DTS_IRQ_GPIO_STR, 0);
> +		if ((!gpio_is_valid(nfc_gpio->irq))) {
> +			pr_err("%s: irq gpio invalid %d\n", __func__,
> +			       nfc_gpio->irq);
> +			return -EINVAL;
> +		}
> +		pr_info("%s: irq %d\n", __func__, nfc_gpio->irq);

Drivers use dev_xxx and there is no need to put __func__ everywhere.

There is even no need for this debug print. Read coding style.

This is such a poor code...

> +	}
> +	nfc_gpio->ven =3D of_get_named_gpio(np, DTS_VEN_GPIO_STR, 0);
> +	if ((!gpio_is_valid(nfc_gpio->ven))) {
> +		pr_err("%s: ven gpio invalid %d\n", __func__, nfc_gpio->ven);
> +		return -EINVAL;
> +	}
> +	/* some products like sn220 does not required fw dwl pin */
> +	nfc_gpio->dwl_req =3D of_get_named_gpio(np, DTS_FWDN_GPIO_STR, 0);
> +	if ((!gpio_is_valid(nfc_gpio->dwl_req)))
> +		pr_warn("%s: dwl_req gpio invalid %d\n", __func__,
> +			nfc_gpio->dwl_req);
> +
> +	pr_info("%s: %d, %d, %d\n", __func__, nfc_gpio->irq, nfc_gpio->ven,
> +		nfc_gpio->dwl_req);
> +	return 0;
> +}
> +EXPORT_SYMBOL(nfc_parse_dt);

No, why the heck you export internal functions? This is not even needed.

=2E..


> +void nfc_misc_unregister(struct nfc_dev *nfc_dev, int count)
> +{
> +	pr_debug("%s: entry\n", __func__);

No, this is not accepted since long time.

> +	device_destroy(nfc_dev->nfc_class, nfc_dev->devno);
> +	cdev_del(&nfc_dev->c_dev);
> +	class_destroy(nfc_dev->nfc_class);
> +	unregister_chrdev_region(nfc_dev->devno, count);
> +}
> +EXPORT_SYMBOL(nfc_misc_unregister);
> +
> +int nfc_misc_register(struct nfc_dev *nfc_dev,
> +		      const struct file_operations *nfc_fops, int count,
> +		      char *devname, char *classname)
> +{
> +	int ret =3D 0;
> +
> +	ret =3D alloc_chrdev_region(&nfc_dev->devno, 0, count, devname);

So you just added custom interface? No, NAK.


> +	if (ret < 0) {
> +		pr_err("%s: failed to alloc chrdev region ret %d\n", __func__,
> +		       ret);
> +		return ret;
> +	}
> +	nfc_dev->nfc_class =3D class_create(classname);
> +	if (IS_ERR(nfc_dev->nfc_class)) {
> +		ret =3D PTR_ERR(nfc_dev->nfc_class);
> +		pr_err("%s: failed to register device class ret %d\n", __func__,
> +		       ret);
> +		unregister_chrdev_region(nfc_dev->devno, count);
> +		return ret;
> +	}
> +	cdev_init(&nfc_dev->c_dev, nfc_fops);
> +	ret =3D cdev_add(&nfc_dev->c_dev, nfc_dev->devno, count);
> +	if (ret < 0) {
> +		pr_err("%s: failed to add cdev ret %d\n", __func__, ret);
> +		class_destroy(nfc_dev->nfc_class);
> +		unregister_chrdev_region(nfc_dev->devno, count);
> +		return ret;
> +	}
> +	nfc_dev->nfc_device =3D device_create(nfc_dev->nfc_class, NULL,
> +					    nfc_dev->devno, nfc_dev, devname);
> +	if (IS_ERR(nfc_dev->nfc_device)) {
> +		ret =3D PTR_ERR(nfc_dev->nfc_device);
> +		pr_err("%s: failed to create the device ret %d\n", __func__,
> +		       ret);
> +		cdev_del(&nfc_dev->c_dev);
> +		class_destroy(nfc_dev->nfc_class);
> +		unregister_chrdev_region(nfc_dev->devno, count);
> +		return ret;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL(nfc_misc_register);
> +
> +/**
> + * nfc_ioctl_power_states() - power control
> + * @nfc_dev:    nfc device data structure
> + * @arg:    mode that we want to move to
> + *
> + * Device power control. Depending on the arg value, device moves to
> + * different states, refer platform.h for args
> + *
> + * Return: -ENOIOCTLCMD if arg is not supported, 0 in any other case
> + */
> +static int nfc_ioctl_power_states(struct nfc_dev *nfc_dev, unsigned long=
 arg)
> +{
> +	int ret =3D 0;
> +	struct platform_gpio *nfc_gpio =3D &nfc_dev->configs.gpio;
> +
> +	if (arg =3D=3D NFC_POWER_OFF) {

No. Look at other drivers how this is handled.

NAK

=2E..

> diff --git a/drivers/nfc/pn7160/common.h b/drivers/nfc/pn7160/common.h
> new file mode 100644
> index 000000000000..2451db295fc8
> --- /dev/null
> +++ b/drivers/nfc/pn7160/common.h
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2015, The Linux Foundation. All rights reserved.
> + * Copyright (C) 2019-2021 NXP
> + */
> +
> +#ifndef _COMMON_H_
> +#define _COMMON_H_
> +
> +#include "platform.h"
> +
> +/* =E5=87=BD=E6=95=B0=E5=A3=B0=E6=98=8E */

Super, to teraz b=C4=99dziemy pisa=C4=87 w naszych w=C5=82asnych j=C4=99zyk=
ach? Uwa=C5=BCam to za
niedopuszczalne.


=2E..

> +static const struct i2c_device_id nfc_i2c_dev_id[] =3D {
> +	{ "nxpnfc", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, nfc_i2c_dev_id);
> +
> +static const struct of_device_id nfc_i2c_dev_match_table[] =3D {
> +	{ .compatible =3D "nxp,nxpnfc" },

Undocumented ABI. Really, you could have followed basic guidelines. This
is not really acceptable.

NAK

Best regards,
Krzysztof


