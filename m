Return-Path: <linux-gpio+bounces-35925-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHqdGhJV82mLzgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35925-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 15:11:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE67E4A3355
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 15:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C2BF30143D6
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 13:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE18F41324F;
	Thu, 30 Apr 2026 13:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ca7jZ949"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18A941325C;
	Thu, 30 Apr 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554664; cv=none; b=krMMk8l+DoT/sLm2mlWMu/JmKT17v0R772s10BAwhqhtlZU1BBJAsL83ztGh0mI7QjYEDIfiHBmbxOVDb/HcDzGKe+DoovvBGaZruGcj21dXTSFMA98YK7XOMr3OVimcGbFyy+c24zFDsaCp0Cr7z6BQGN90vc4m5Jhvnm3JRsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554664; c=relaxed/simple;
	bh=JuCRkvGOswoi3WGFkpI3D9SLSQcDha7ElNMRA+/rc48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4T+3D+nzcYlcIhVA0Lbh8EIbb0ciRjUJwzk82MJ8RMVh+fvjOe2+VfVKykEMZ0C3/rWKaXRtGNM+uHC9ulVUtqimYTaVNbbkzDv/d1PiaH1uc8Lq40M7tVAHf0ZsdXUOum2eAadcZ9xM18vh7qdMbdyvQIxDy9jAyhpFhiqwpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ca7jZ949; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A0BC2BCB3;
	Thu, 30 Apr 2026 13:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777554663;
	bh=JuCRkvGOswoi3WGFkpI3D9SLSQcDha7ElNMRA+/rc48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ca7jZ949NiRz9X456ga5edaX4HJ7N1rrUuhHNVXACgqn/B0U4P5qSwpjchzz7e2qc
	 hzCmqFwrB/h59jNtIGxLgFYVSyu7a7pp4Dn3EY5t/iRfW6df6X7Ox/BOFrdXYtYBYY
	 +0GS5MPD3Ghg+XX5SXqD19KUT4GeaBra5QUi6l3orMmEx3QLB5Zq/i0zYToDKaDZpV
	 62a/8qXkSbVQgTGeiEz/lvcg3SBCdoXVP02zVZJTA8Os+MI/ZzbWK0a3MwkYPk0UY8
	 mMY/BUXsFWd0vTwY00YNZQJh2wtnMfLcnPVH2Nj3ClvumCPyDuraBQmpJHmuKVaXJu
	 6TqKaHRoDvr+g==
Date: Thu, 30 Apr 2026 14:10:56 +0100
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
Subject: Re: [PATCH v5 3/5] mfd: aaeon: Add SRG-IMX8P MCU driver
Message-ID: <20260430131056.GI1806155@google.com>
References: <20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668@bootlin.com>
 <20260408-dev-b4-aaeon-mcu-driver-v5-3-ad98bd481668@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260408-dev-b4-aaeon-mcu-driver-v5-3-ad98bd481668@bootlin.com>
X-Rspamd-Queue-Id: EE67E4A3355
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35925-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email]

On Wed, 08 Apr 2026, Thomas Perrot (Schneider Electric) wrote:

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
> I2C transfers use heap-allocated DMA-safe buffers rather than
> stack-allocated ones, as required by I2C controllers that perform DMA.
> 
> Regmap caching is enabled (REGCACHE_MAPLE) with a volatile_reg
> callback that marks GPIO input read registers (opcode 0x72) and the
> watchdog status register (opcode 0x63, arg 0x02) as volatile. All
> other registers written by the driver (GPIO direction,
> GPO state, watchdog control) are stable and can be safely cached.
> 
> Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
> ---
>  MAINTAINERS                   |   2 +
>  drivers/mfd/Kconfig           |  10 +++
>  drivers/mfd/Makefile          |   1 +
>  drivers/mfd/aaeon-mcu.c       | 204 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/aaeon-mcu.h |  40 +++++++++
>  5 files changed, 257 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea9d55f76f35..f91b6a1826d0 100644
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
> index aace5766b38a..82ec1d8e7224 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1561,6 +1561,16 @@ config ABX500_CORE
>  	  remain unchanged when IC changes. Binding of the functions to
>  	  actual register access is done by the IC core driver.
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
>  config AB8500_CORE
>  	bool "ST-Ericsson AB8500 Mixed Signal Power Management chip"
>  	depends on ABX500_CORE && MFD_DB8500_PRCMU
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28a..34db5b033584 100644
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
> index 000000000000..3b4e2d891534
> --- /dev/null
> +++ b/drivers/mfd/aaeon-mcu.c
> @@ -0,0 +1,204 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU driver
> + *
> + * Copyright (C) 2026 Bootlin
> + * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/aaeon-mcu.h>
> +#include <linux/mfd/core.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +struct aaeon_mcu {
> +	struct i2c_client *client;
> +	u8 *cmd;      /* DMA-safe 3-byte write buffer [opcode, arg, value] */
> +	u8 *response; /* DMA-safe 1-byte read buffer for MCU acknowledgment */
> +};
> +
> +static const struct mfd_cell aaeon_mcu_devs[] = {
> +	MFD_CELL_BASIC("aaeon-mcu-wdt", NULL, NULL, 0, 0),
> +	MFD_CELL_BASIC("aaeon-mcu-gpio", NULL, NULL, 0, 0),
> +};
> +
> +/* Number of bytes in a MCU command: [opcode, arg, value] */
> +#define AAEON_MCU_CMD_LEN      3
> +
> +/*
> + * Custom regmap bus for the Aaeon MCU I2C protocol.
> + *
> + * The MCU uses a fixed 3-byte command format [opcode, arg, value] followed
> + * by a 1-byte response. It requires a STOP condition between the command
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
> +	struct aaeon_mcu *mcu = context;
> +	struct i2c_client *client = mcu->client;
> +	struct i2c_msg write_msg;
> +	/* The MCU always sends a response byte after each command; discard it. */
> +	struct i2c_msg response_msg;
> +	int ret;
> +
> +	memcpy(mcu->cmd, data, count);
> +
> +	write_msg.addr  = client->addr;
> +	write_msg.flags = 0;
> +	write_msg.buf   = mcu->cmd;
> +	write_msg.len   = count;
> +
> +	response_msg.addr  = client->addr;
> +	response_msg.flags = I2C_M_RD;
> +	response_msg.buf   = mcu->response;
> +	response_msg.len   = 1;
> +
> +	ret = i2c_transfer(client->adapter, &write_msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 1)
> +		return -EIO;
> +
> +	ret = i2c_transfer(client->adapter, &response_msg, 1);
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
> +	struct aaeon_mcu *mcu = context;
> +	struct i2c_client *client = mcu->client;
> +	struct i2c_msg write_msg;
> +	struct i2c_msg read_msg;
> +	int ret;
> +
> +	/*
> +	 * reg_buf holds the 2-byte big-endian register address [opcode, arg].
> +	 * Append a trailing 0x00 to form the full 3-byte MCU command.
> +	 */
> +	mcu->cmd[0] = ((u8 *)reg_buf)[0];
> +	mcu->cmd[1] = ((u8 *)reg_buf)[1];
> +	mcu->cmd[2] = 0x00;
> +
> +	write_msg.addr  = client->addr;
> +	write_msg.flags = 0;
> +	write_msg.buf   = mcu->cmd;
> +	write_msg.len   = AAEON_MCU_CMD_LEN;
> +
> +	read_msg.addr  = client->addr;
> +	read_msg.flags = I2C_M_RD;
> +	read_msg.buf   = val_buf;
> +	read_msg.len   = val_size;
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
> +static bool aaeon_mcu_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	/*
> +	 * GPIO input registers are driven by external signals and can change
> +	 * at any time without CPU involvement, always read from hardware.
> +	 *
> +	 * The watchdog status register reflects hardware state and can change
> +	 * autonomously.
> +	 *
> +	 * All other registers are written by the driver and their values are
> +	 * stable, so they can be safely cached.
> +	 */
> +	if ((reg >> 8) == AAEON_MCU_READ_GPIO_OPCODE)
> +		return true;
> +	if (reg == AAEON_MCU_REG(AAEON_MCU_CONTROL_WDT_OPCODE, 0x02))
> +		return true;
> +	return false;
> +}
> +
> +static const struct regmap_config aaeon_mcu_regmap_config = {
> +	.reg_bits          = 16,
> +	.val_bits          = 8,
> +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> +	.max_register      = AAEON_MCU_MAX_REGISTER,
> +	.volatile_reg      = aaeon_mcu_volatile_reg,
> +	.cache_type        = REGCACHE_MAPLE,
> +};
> +
> +static int aaeon_mcu_probe(struct i2c_client *client)
> +{
> +	struct aaeon_mcu *mcu;

Nit: We usually call this ddata, but it's not a blocker.

> +	struct regmap *regmap;
> +
> +	mcu = devm_kzalloc(&client->dev, sizeof(*mcu), GFP_KERNEL);
> +	if (!mcu)
> +		return -ENOMEM;
> +
> +	mcu->client = client;
> +
> +	mcu->cmd = devm_kzalloc(&client->dev, AAEON_MCU_CMD_LEN * sizeof(*mcu->cmd), GFP_KERNEL);
> +	if (!mcu->cmd)
> +		return -ENOMEM;
> +
> +	mcu->response = devm_kzalloc(&client->dev, sizeof(*mcu->response), GFP_KERNEL);
> +	if (!mcu->response)
> +		return -ENOMEM;
> +
> +	regmap = devm_regmap_init(&client->dev, &aaeon_mcu_regmap_bus,
> +				  mcu, &aaeon_mcu_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(regmap),
> +				     "failed to initialize regmap\n");
> +
> +	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> +				    aaeon_mcu_devs, ARRAY_SIZE(aaeon_mcu_devs),
> +				    NULL, 0, NULL);
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

Nit: This should be a '-'.

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
> index 000000000000..3a1aeec85d60
> --- /dev/null
> +++ b/include/linux/mfd/aaeon-mcu.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Aaeon MCU driver definitions
> + *
> + * Copyright (C) 2026 Bootlin
> + * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#ifndef __LINUX_MFD_AAEON_MCU_H
> +#define __LINUX_MFD_AAEON_MCU_H
> +
> +/*
> + * MCU register address: the high byte is the command opcode, the low
> + * byte is the argument.  This matches the 3-byte wire format
> + * [opcode, arg, value] used by the MCU I2C protocol.
> + */
> +#define AAEON_MCU_REG(op, arg)		(((op) << 8) | (arg))
> +
> +/*
> + * Opcode for GPIO input reads. These registers are volatile, their values
> + * are driven by external signals and can change without CPU involvement.
> + * Used by the MFD driver's volatile_reg callback to bypass the regmap cache.
> + */
> +#define AAEON_MCU_READ_GPIO_OPCODE	0x72
> +
> +/*
> + * Opcode for watchdog control and status commands.
> + * The status register (arg=0x02) reflects hardware state and is volatile.
> + */
> +#define AAEON_MCU_CONTROL_WDT_OPCODE	0x63
> +
> +/*
> + * Highest register address in the MCU register map.
> + * The WRITE_GPIO opcode (0x77) with the highest GPIO argument (0x0B = 11,
> + * i.e. MAX_GPIOS - 1) produces the largest encoded address.
> + */
> +#define AAEON_MCU_MAX_REGISTER		AAEON_MCU_REG(0x77, 0x0B)
> +
> +#endif /* __LINUX_MFD_AAEON_MCU_H */
> 
> -- 
> 2.53.0
> 

-- 
Lee Jones

