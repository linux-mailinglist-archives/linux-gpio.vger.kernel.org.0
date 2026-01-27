Return-Path: <linux-gpio+bounces-31141-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DvQCqeKeGn5qwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31141-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:51:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA0C92180
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 411273004D28
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEFE3385A0;
	Tue, 27 Jan 2026 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTTTZgsP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C4C337BAA
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507481; cv=none; b=bhMYT5DWMOgINDGrAmd3Vn2eNTekVvtOxYuj6kDDrn2vpE7R3z60LFcm3yTjUTXEivEKRWF1T3j2iVo4JDuPBfBGmucr/v5m2Trr6vGeFNYMnOpzUxNPbZKTAOwgLEYJDhYYRyhYWpPJL4OPy3fJxIysvf2E8Ybm6eJlL5uqHD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507481; c=relaxed/simple;
	bh=FGhVpDtMVZVm3tb6KxliGgMLN0Evi2bHotKWpU75YQM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5jQKpnbAJG5rrWz2x642wjOls/2tOH3gJwrhXAV350v7bZpPOCPDQ21KZYWhjLrZVzlA50o3PkHTA8wq9qMLsIcnYpmVg6Uad9VAnCltOZGOsMv+6HckkFSW0x2dszMSBqv2lqJ96zZB3cH0VNDoKaodO5Xwpwo7as4wSHUxZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTTTZgsP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1717CC19425
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507481;
	bh=FGhVpDtMVZVm3tb6KxliGgMLN0Evi2bHotKWpU75YQM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=TTTTZgsPRIOHFQSKDpAGDG4oaplDbO1l8xdmHLXajWLKrZQEa9BjEb3uyc/wlTV/7
	 GrzuwR8nXJIt/kC0eOK6mcrKqyucgNbT/xJGEW6MtSN921jFTFXLesgOkm9qDpoVrX
	 gw/MzXKa8sr5VlmVP1Blyu4YVruLkgasNVjOiE3Y8fbh3JCaVL2rvUgzwRsDlPJw9F
	 9YdSmsYRrPARFg2/JE/GYXytu1Nk5wmpm4+eBzHacPohrZjUzQxldLf+mKmkoc0nYM
	 rVivhUGF11aDcZdRdsJtTeuZl9Z3DVvlXOBpzD/CM0tnhV8pQ+Ykuc6CZjVWOVmV3K
	 jgD12cdVMSubw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59de77e2e30so4496735e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:51:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDZfDH43zYXZUABiqJ8b45/peYojHcnbEuoorylBz3BvSXYxLgyFHZ3VPrVlaDk1xkWTB2firsHb+m@vger.kernel.org
X-Gm-Message-State: AOJu0YxffNQ/sDosL64eTP+ejgXKa5B51EA7Zdxa4gOtgOS+jaYq9Jag
	hWnGaJ/K3BqzvEaV0rpzd9IH09whYUqO7X7cxX1xU5xNOBRic4/2L4V52bISmWe5x3WmR2390UP
	cwA4/2v6XaX1BdM9zcfqZpRQrvE0HYRoim+qaMHfLmg==
X-Received: by 2002:a05:6512:124e:b0:59d:cda0:8b70 with SMTP id
 2adb3069b0e04-59e0412dcb0mr548455e87.52.1769507479645; Tue, 27 Jan 2026
 01:51:19 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:51:17 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:51:17 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-3-9f4c00bfb5cb@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com> <20260123-dev-b4-aaeon-mcu-driver-v2-3-9f4c00bfb5cb@bootlin.com>
Date: Tue, 27 Jan 2026 01:51:17 -0800
X-Gmail-Original-Message-ID: <CAMRc=McYKZ8TY9wAhZ3sZtYRNJhoh2VfQ+6FA=+VRwstpWQOHg@mail.gmail.com>
X-Gm-Features: AZwV_QhnJ3-HaFivIkkQZJQTm3GV_7xh9A9lzaVebFHWLuaiyt9Faz2iUZq47wY
Message-ID: <CAMRc=McYKZ8TY9wAhZ3sZtYRNJhoh2VfQ+6FA=+VRwstpWQOHg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] mfd: aaeon: Add SRG-IMX8PL MCU driver
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31141-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,bootlin.com,kernel.org,pengutronix.de,gmail.com,linux-watchdog.org,roeck-us.net];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CDA0C92180
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 10:54:32 +0100, "Thomas Perrot (Schneider
Electric)" <thomas.perrot@bootlin.com> said:
> Add Multi-Function Device (MFD) driver for the Aaeon SRG-IMX8PL
> embedded controller. This driver provides the core I2C communication
> interface and registers child devices (GPIO and watchdog controllers).
>
> The MCU firmware version is queried during probe and logged for
> diagnostic purposes. All I2C transactions are serialized using a mutex
> to ensure proper communication with the microcontroller.
>
> Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>
> ---

[snip]

 +++ b/drivers/mfd/aaeon-mcu.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU driver
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.co=
m>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/aaeon-mcu.h>
> +#include <linux/mfd/core.h>
> +#include <linux/platform_device.h>
> +
> +#define AAEON_MCU_FW_VERSION	0x76
> +
> +static struct mfd_cell aaeon_mcu_devs[] =3D {

Can be const.

> +	{
> +		.name =3D "aaeon-mcu-wdt",
> +	},
> +	{
> +		.name =3D "aaeon-mcu-gpio",
> +	},
> +};
> +
> +static int aaeon_mcu_read_version(struct device *dev, u8 index, u8 *vers=
ion)
> +{
> +	u8 cmd[3] =3D { AAEON_MCU_FW_VERSION, index, 0x00 };
> +
> +	return aaeon_mcu_i2c_xfer(dev, cmd, sizeof(cmd), version, sizeof(*versi=
on));
> +}
> +
> +static int aaeon_mcu_print_fw_version(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	u8 major, minor;
> +	int ret;
> +
> +	ret =3D aaeon_mcu_read_version(dev, 0x00, &major);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D aaeon_mcu_read_version(dev, 0x01, &minor);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "firmware version: v%d.%d\n", major, minor);

I would drop this entirely or demote it to dev_dbg(), there's no reason for
a successfully probed device to yell about it.

> +
> +	return 0;
> +}
> +
> +int aaeon_mcu_i2c_xfer(struct device *dev,
> +		       const u8 *cmd, int cmd_len,
> +		       u8 *rsp, int rsp_len)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct aaeon_mcu_dev *mcu =3D i2c_get_clientdata(client);
> +	int ret;
> +
> +	mutex_lock(&mcu->i2c_lock);
> +
> +	ret =3D i2c_master_send(client, cmd, cmd_len);
> +	if (ret < 0)
> +		goto unlock;
> +
> +	ret =3D i2c_master_recv(client, rsp, rsp_len);
> +	if (ret < 0)
> +		goto unlock;
> +
> +	if (ret !=3D rsp_len) {
> +		dev_err(dev,
> +			"i2c recv count error (expected: %d, actual: %d)\n",
> +			rsp_len, ret);
> +		ret =3D -EIO;
> +		goto unlock;
> +	}
> +
> +	ret =3D 0;
> +
> +unlock:

Just use guard(mutex) from cleanup.h and drop the label.

> +	mutex_unlock(&mcu->i2c_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(aaeon_mcu_i2c_xfer);
> +
> +static int aaeon_mcu_probe(struct i2c_client *client)
> +{
> +	struct aaeon_mcu_dev *mcu;
> +	int ret;
> +
> +	mcu =3D devm_kzalloc(&client->dev, sizeof(*mcu), GFP_KERNEL);
> +	if (!mcu)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, mcu);
> +	mcu->dev =3D &client->dev;
> +	mutex_init(&mcu->i2c_lock);

For lock debugging purposes it's better to destroy the mutex too. Or use
devm_mutex_init().

> +
> +	ret =3D aaeon_mcu_print_fw_version(client);
> +	if (ret) {
> +		dev_err(&client->dev, "unable to read firmware version\n");
> +		return ret;
> +	}
> +
> +	return devm_mfd_add_devices(mcu->dev, PLATFORM_DEVID_NONE, aaeon_mcu_de=
vs,
> +				    ARRAY_SIZE(aaeon_mcu_devs), NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id aaeon_mcu_of_match[] =3D {
> +	{ .compatible =3D "aaeon,srg-imx8pl-mcu" },
> +	{},
> +};
> +

Unneeded newline.

> +MODULE_DEVICE_TABLE(of, aaeon_mcu_of_match);
> +
> +static struct i2c_driver aaeon_mcu_driver =3D {
> +	.driver =3D {
> +		.name =3D "aaeon_mcu",
> +		.of_match_table =3D aaeon_mcu_of_match,
> +	},
> +	.probe =3D aaeon_mcu_probe,
> +};
> +

Same here.

> +module_i2c_driver(aaeon_mcu_driver);
> +
> +MODULE_DESCRIPTION("Aaeon MCU Driver");
> +MODULE_AUTHOR("J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootli=
n.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/aaeon-mcu.h b/include/linux/mfd/aaeon-mcu.=
h
> new file mode 100644
> index 0000000000000000000000000000000000000000..c9dc7a9adbc86c489f03a550e=
7776d3b1da4e7b2
> --- /dev/null
> +++ b/include/linux/mfd/aaeon-mcu.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Aaeon MCU driver definitions
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.co=
m>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#ifndef __LINUX_MFD_AAEON_MCU_H
> +#define __LINUX_MFD_AAEON_MCU_H
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct aaeon_mcu_dev - Internal representation of the Aaeon MCU
> + * @dev: Pointer to kernel device structure
> + * @i2c_lock: Mutex to serialize I2C bus access
> + */
> +

Kerneldocs should be attached to the struct they describe. But...

> +struct aaeon_mcu_dev {
> +	struct device *dev;
> +	struct mutex i2c_lock;
> +};

... you don't seem to need to export this structure. You don't use it at al=
l
in the subsequent GPIO patch.

> +
> +int aaeon_mcu_i2c_xfer(struct device *dev,
> +		       const u8 *cmd, int cmd_len,
> +		       u8 *rsp, int rsp_len);
> +
> +#endif /*  __LINUX_MFD_AAEON_MCU_H */
>
> --
> 2.52.0
>
>

Bart

