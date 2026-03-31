Return-Path: <linux-gpio+bounces-34480-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD2mMHHIy2mnLgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34480-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:13:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E8A36A025
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 21F48303A07B
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 13:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A103E3C61;
	Tue, 31 Mar 2026 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1b8yC8J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A665E346FB5;
	Tue, 31 Mar 2026 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962535; cv=none; b=emMlfxGOagOAyvB/pnIvTJyMPJ4v09uoJZvAP2UebaappX7FnaVRhtah+KJCfX5A/cNTycYF409Y1LNII39b18RA9B62zexf4KycNece0uovVtK61A3OQxV+y1zOIAPi+bbB1ePBwx9c9Af0RwWM0IYQArmz4L9a64LjnV5m504=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962535; c=relaxed/simple;
	bh=7G9vqJ4wgnpJpVy5WKsHllojY9IC+YZBWuAMWGOZ1wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCLipF71jNL6OIGFfVd6DGqEksWihZGXJLMZtws/W7KLpac/PHCHcuCtVY6zuGqnxnFqb6L9MhUXOA5swR1CdWmDYwFANVesDppZLktbf8gyKVUYKj9YW0qR7O3mfFJyFjdqHamQ9ZXu984amRmk7w08Nkr6GN/Ium1Xd7zxvxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1b8yC8J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F71C19423;
	Tue, 31 Mar 2026 13:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774962535;
	bh=7G9vqJ4wgnpJpVy5WKsHllojY9IC+YZBWuAMWGOZ1wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1b8yC8JyR4L1I+FqhRjqgpHUVOJKsajNu8+ZCU+ga9haoQ8sMrU9y/vwlj+fNd/P
	 cuZKWYbwf1c0KooGYpeeKVsv6qryybEchw769h8nrtclQAsQlC8rJ2RsUgYQJ0yohO
	 0qpnw62jqBV1rKGmhdSLRIx3vrWNJbbQPCw1IpfCMtz8WAp6IxiaTja0s1PO8Vx0H5
	 4uskdqK1cExqK7W9lBTARlkVbJQujCLGjnfz29NZ1okFh/Y+1DtFkFpUAe6iUC42gI
	 vfC6WE8XhxJPAgRA/eHlAu4cfsALbSGxD77OAgHjf7J6M1gvcJCViRq3RZMlKjPFWd
	 mMs1U3SpSnW7Q==
Date: Tue, 31 Mar 2026 14:08:48 +0100
From: Lee Jones <lee@kernel.org>
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 3/5] mfd: aaeon: Add SRG-IMX8P MCU driver
Message-ID: <20260331130848.GG3795166@google.com>
References: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
 <20260324-dev-b4-aaeon-mcu-driver-v4-3-afb011df4794@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324-dev-b4-aaeon-mcu-driver-v4-3-afb011df4794@bootlin.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34480-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: E2E8A36A025
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026, Thomas Perrot (Schneider Electric) wrote:

> Add Multi-Function Device (MFD) driver for the Aaeon SRG-IMX8P
> embedded controller. This driver provides the core I2C communication
> interface and registers child devices (GPIO and watchdog controllers).
> 
> The driver implements a custom regmap bus over I2C to match the MCU's
> fixed 3-byte command format [opcode, arg, value]. Register addresses
> are encoded as 16-bit values (opcode << 8 | arg) using the
> AAEON_MCU_REG() macro defined in the shared header. The regmap
> instance is shared with child drivers via dev_get_regmap(). Concurrent
> I2C accesses from child drivers are serialized by regmap's built-in
> locking.
> 
> Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
> ---
>  MAINTAINERS                   |   2 +
>  drivers/mfd/Kconfig           |  10 +++
>  drivers/mfd/Makefile          |   1 +
>  drivers/mfd/aaeon-mcu.c       | 155 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/aaeon-mcu.h |  20 ++++++
>  5 files changed, 188 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea9d55f76f3509c7f6ba6d1bc86ca2e2e71aa954..f91b6a1826d04bef8a0f88221f6c8e8a3652cd77 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -191,6 +191,8 @@ M:	Thomas Perrot <thomas.perrot@bootlin.com>
>  R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
> +F:	drivers/mfd/aaeon-mcu.c
> +F:	include/linux/mfd/aaeon-mcu.h
>  
>  AAEON UPBOARD FPGA MFD DRIVER
>  M:	Thomas Richard <thomas.richard@bootlin.com>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index aace5766b38aa5e46e32a8a7b42eea238159fbcf..7a1ceedece899faad7a03a1fe7b1c91b72253c05 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1574,6 +1574,16 @@ config AB8500_CORE
>  	  the irq_chip parts for handling the Mixed Signal chip events.
>  	  This chip embeds various other multimedia functionalities as well.
>  
> +config MFD_AAEON_MCU
> +	tristate "Aaeon SRG-IMX8P MCU Driver"
> +	depends on I2C || COMPILE_TEST
> +	select MFD_CORE
> +	help
> +	  Select this option to enable support for the Aaeon SRG-IMX8P
> +	  onboard microcontroller (MCU). This driver provides the core
> +	  functionality to communicate with the MCU over I2C. The MCU
> +	  provides GPIO and watchdog functionality.
> +
>  config MFD_DB8500_PRCMU
>  	bool "ST-Ericsson DB8500 Power Reset Control Management Unit"
>  	depends on UX500_SOC_DB8500
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28afae975ac61d282b3b85af5440119..34db5b033584368b7a269b1eef12528a74baf8f5 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_MFD_88PM860X)	+= 88pm860x.o
>  obj-$(CONFIG_MFD_88PM800)	+= 88pm800.o 88pm80x.o
>  obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
>  obj-$(CONFIG_MFD_88PM886_PMIC)	+= 88pm886.o
> +obj-$(CONFIG_MFD_AAEON_MCU)	+= aaeon-mcu.o
>  obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
>  obj-$(CONFIG_MFD_SM501)		+= sm501.o
>  obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
> diff --git a/drivers/mfd/aaeon-mcu.c b/drivers/mfd/aaeon-mcu.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..5a969890d201c027eb25c324b4d4d89b1f8c563e
> --- /dev/null
> +++ b/drivers/mfd/aaeon-mcu.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU driver
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */

Consider updating the Copyright date - we're pretty deep into 2026 at this point.

> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/core.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +static const struct mfd_cell aaeon_mcu_devs[] = {
> +	{
> +		.name = "aaeon-mcu-wdt",
> +	},
> +	{
> +		.name = "aaeon-mcu-gpio",
> +	},
> +};

MFD_CELL_BASIC()

> +/*
> + * Custom regmap bus for the Aaeon MCU I2C protocol.
> + *
> + * The MCU uses a fixed 3-byte command format [opcode, arg, value] followed
> + * by a 1-byte response.  It requires a STOP condition between the command
> + * write and the response read, so two separate i2c_transfer() calls are
> + * issued.  The regmap lock serialises concurrent accesses from the GPIO
> + * and watchdog child drivers.
> + *
> + * Register addresses are encoded as a 16-bit big-endian value where the
> + * high byte is the opcode and the low byte is the argument, matching the
> + * wire layout produced by regmap for reg_bits=16.
> + */
> +
> +static int aaeon_mcu_regmap_write(void *context, const void *data, size_t count)
> +{
> +	struct i2c_client *client = context;
> +	/* data = [opcode, arg, value] as formatted by regmap */
> +	struct i2c_msg write_msg = {
> +		.addr  = client->addr,
> +		.flags = 0,
> +		.buf   = (u8 *)data,
> +		.len   = count,
> +	};
> +	u8 rsp;
> +	/* The MCU always sends a response byte after each command; discard it. */
> +	struct i2c_msg rsp_msg = {

Assuming 'rsp' means response, let's just write that out in full.

Readability wins over brevity every time.

> +		.addr  = client->addr,
> +		.flags = I2C_M_RD,
> +		.buf   = &rsp,
> +		.len   = 1,
> +	};
> +	int ret;

Since some I2C host controllers might use DMA, should we ensure that the
'rsp' buffer is allocated in DMA-safe memory rather than on the stack to
prevent potential cache-line corruption?

Also allocation of structs during in declaration statements is rough!

And adding that u8 in the middle is just rubbing it in.

> +	ret = i2c_transfer(client->adapter, &write_msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 1)
> +		return -EIO;
> +
> +	ret = i2c_transfer(client->adapter, &rsp_msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 1)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int aaeon_mcu_regmap_read(void *context, const void *reg_buf,
> +				 size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	struct i2c_client *client = context;
> +	/*
> +	 * reg_buf holds the 2-byte big-endian register address [opcode, arg].
> +	 * Append a trailing 0x00 to form the full 3-byte MCU command.
> +	 */
> +	u8 cmd[3] = { ((u8 *)reg_buf)[0], ((u8 *)reg_buf)[1], 0x00 };
> +	struct i2c_msg write_msg = {
> +		.addr  = client->addr,
> +		.flags = 0,
> +		.buf   = cmd,
> +		.len   = sizeof(cmd),
> +	};
> +	struct i2c_msg read_msg = {
> +		.addr  = client->addr,
> +		.flags = I2C_M_RD,
> +		.buf   = val_buf,
> +		.len   = val_size,
> +	};
> +	int ret;
> +
> +	ret = i2c_transfer(client->adapter, &write_msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 1)
> +		return -EIO;
> +
> +	ret = i2c_transfer(client->adapter, &read_msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 1)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_bus aaeon_mcu_regmap_bus = {
> +	.write = aaeon_mcu_regmap_write,
> +	.read  = aaeon_mcu_regmap_read,
> +};
> +
> +static const struct regmap_config aaeon_mcu_regmap_config = {
> +	.reg_bits          = 16,
> +	.val_bits          = 8,
> +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> +	.cache_type        = REGCACHE_NONE,

Are you sure?  Why none?

> +};
> +
> +static int aaeon_mcu_probe(struct i2c_client *client)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init(&client->dev, &aaeon_mcu_regmap_bus,
> +				  client, &aaeon_mcu_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);

dev_err_probe()

> +
> +	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +				    aaeon_mcu_devs, ARRAY_SIZE(aaeon_mcu_devs),
> +				    NULL, 0, NULL);

Why PLATFORM_DEVID_NONE over AUTO here?

> +}
> +
> +static const struct of_device_id aaeon_mcu_of_match[] = {
> +	{ .compatible = "aaeon,srg-imx8p-mcu" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, aaeon_mcu_of_match);
> +
> +static struct i2c_driver aaeon_mcu_driver = {
> +	.driver = {
> +		.name = "aaeon_mcu",
> +		.of_match_table = aaeon_mcu_of_match,
> +	},
> +	.probe = aaeon_mcu_probe,
> +};
> +module_i2c_driver(aaeon_mcu_driver);
> +
> +MODULE_DESCRIPTION("Aaeon MCU Driver");
> +MODULE_AUTHOR("Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/aaeon-mcu.h b/include/linux/mfd/aaeon-mcu.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..861003f6dfd20424c3785008bd2cf89aaa1715b9
> --- /dev/null
> +++ b/include/linux/mfd/aaeon-mcu.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Aaeon MCU driver definitions
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */

As above.

> +
> +#ifndef __LINUX_MFD_AAEON_MCU_H
> +#define __LINUX_MFD_AAEON_MCU_H
> +
> +/*
> + * MCU register address: the high byte is the command opcode, the low
> + * byte is the argument.  This matches the 3-byte wire format
> + * [opcode, arg, value] used by the MCU I2C protocol.
> + */
> +#define AAEON_MCU_REG(op, arg)	(((op) << 8) | (arg))

Where else is this used?

> +#endif /* __LINUX_MFD_AAEON_MCU_H */
> 
> -- 
> 2.53.0
> 

-- 
Lee Jones [李琼斯]

