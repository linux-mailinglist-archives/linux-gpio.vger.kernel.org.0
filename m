Return-Path: <linux-gpio+bounces-29749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8E2CCD5E4
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 20:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EF91303525D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 19:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768D93612C5;
	Thu, 18 Dec 2025 15:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQaiFQaJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F54A35FF77;
	Thu, 18 Dec 2025 15:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073497; cv=none; b=CXvz26Y3a3oHrIac5J431sDrs/prFzMZYBiuwmlBj1en723u/V8bESgshOQFKpwO2n4kf/Avv3ePOCI0v6iuFPstgw5dm/8lBFgQoEbaikQB78QGLT9PhJeKFesMw5ISnIFLIIWAeV/JMZG6eRFZa0IsYLCkCaMcn0z9r2FsTJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073497; c=relaxed/simple;
	bh=eYLSjabc3lxrWUD3joy0AohRmvTtr+01/ZPVbcKGqeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnXQ0LwatQ7SlGVq0w4YOLU2z03/cGoH7f9tw+e1ZeyXmOoMy1Rikf2RRd67LVAfsXdRaTJNItsR/NdgwilylhMTTaWCHRWD4djvS3WBthTEsP1uvRuhy6NPkeXt/DeHOwvuS+FvcYtcR/OxXI+U57InxELVDzG7TBHqN7fNWA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQaiFQaJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D7CC116B1;
	Thu, 18 Dec 2025 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766073496;
	bh=eYLSjabc3lxrWUD3joy0AohRmvTtr+01/ZPVbcKGqeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQaiFQaJetA8F/PgWOXGZeYl5GEeUyt0kvPlUfbcu/m3Qc/DNev7yksxTp+ojj9xr
	 +4HsM4Du+dYJlRYawu6uzjM2PR5hSGJlPCIhD/30E/wcj2PpnhTzntWbBPZdQLkIHD
	 xpsG8Je758IPlXE4pc/7kYAcnFwaQGwiYwN4yx9F8afNXCxyzUiZGVS9HjvFP+s4g8
	 Zp4cbDfHWDNYjx9E8l9yuHOthbQEz/Su/uT17GuHGC/7QTpaAooN+kJGR/QGiuGTIy
	 UcDmiTnUMbZaZe1Ccez2NXJI0ejW0EGzWS2FKvh44vBiZGwZqvyjsA0ifvFkXaxes4
	 b9Ola+SshDnIQ==
Date: Thu, 18 Dec 2025 09:58:13 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-imx@nxp.com, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <mnpg4xanzl45lal72c6kgog7qmqgk2zcp734eqdpk3gsonq63f@vlewh6jgdjy4>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <20251212194341.966387-5-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212194341.966387-5-shenwei.wang@nxp.com>

On Fri, Dec 12, 2025 at 01:43:40PM -0600, Shenwei Wang wrote:
> On an AMP platform, the system may include two processors:

We have many examples where there's N systems and it's certainly not
unreasonable to have multiple remote processors expose GPIOs in this
fashion.

> 	- An MCU running an RTOS
> 	- An MPU running Linux
> 
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing
> the Linux side to control GPIO controllers which reside in
> the remote processor via RPMSG protocol.
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/gpio/Kconfig      |  16 ++
>  drivers/gpio/Makefile     |   1 +
>  drivers/gpio/gpio-rpmsg.c | 490 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 507 insertions(+)
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index bd185482a7fd..7a72b5dbd4a9 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1883,6 +1883,22 @@ config GPIO_SODAVILLE
>  
>  endmenu
>  
> +menu "RPMSG GPIO drivers"
> +	depends on RPMSG
> +
> +config GPIO_RPMSG
> +	tristate "Generic RPMSG GPIO support"
> +	select GPIOLIB_IRQCHIP
> +	default REMOTEPROC
> +	help
> +	  Say yes here to support the generic GPIO functions over the RPMSG
> +	  bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x,and
> +	  i.MX9x.
> +
> +	  If unsure, say N.
> +
> +endmenu
> +
>  menu "SPI GPIO expanders"
>  	depends on SPI_MASTER
>  
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 2421a8fd3733..b1373ec274c8 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -156,6 +156,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
>  obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
>  obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
>  obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
> +obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
>  obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
>  obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
>  obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
> diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
> new file mode 100644
> index 000000000000..cf10e2958374
> --- /dev/null
> +++ b/drivers/gpio/gpio-rpmsg.c
> @@ -0,0 +1,490 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2025 NXP
> + *
> + * The driver exports a standard gpiochip interface to control
> + * the GPIO controllers via RPMSG on a remote processor.
> + */
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/rpmsg.h>
> +#include <linux/rpmsg/rpdev_info.h>
> +
> +#define RPMSG_GPIO_ID		5
> +#define RPMSG_VENDOR		1
> +#define RPMSG_VERSION		0
> +
> +#define GPIOS_PER_PORT		32
> +#define RPMSG_TIMEOUT		1000
> +
> +enum gpio_input_trigger_type {
> +	GPIO_RPMSG_TRI_IGNORE,

These aren't enumerations, they are well defined constants of the
protocol. I think #define is better.

> +	GPIO_RPMSG_TRI_RISING,
> +	GPIO_RPMSG_TRI_FALLING,
> +	GPIO_RPMSG_TRI_BOTH_EDGE,
> +	GPIO_RPMSG_TRI_LOW_LEVEL,
> +	GPIO_RPMSG_TRI_HIGH_LEVEL,
> +};
> +
> +enum gpio_rpmsg_header_type {
> +	GPIO_RPMSG_SETUP,
> +	GPIO_RPMSG_REPLY,
> +	GPIO_RPMSG_NOTIFY,
> +};
> +
> +enum gpio_rpmsg_header_cmd {
> +	GPIO_RPMSG_INPUT_INIT,
> +	GPIO_RPMSG_OUTPUT_INIT,
> +	GPIO_RPMSG_INPUT_GET,
> +	GPIO_RPMSG_DIRECTION_GET,
> +};
> +
> +struct gpio_rpmsg_head {
> +	u8 id;		/* Message ID Code */
> +	u8 vendor;	/* Vendor ID number */
> +	u8 version;	/* Vendor-specific version number */
> +	u8 type;	/* Message type */
> +	u8 cmd;		/* Command code */
> +	u8 reserved[5];
> +} __packed;
> +
> +struct gpio_rpmsg_packet {
> +	struct gpio_rpmsg_head header;
> +	u8 pin_idx;
> +	u8 port_idx;
> +	union {
> +		u8 event;
> +		u8 retcode;
> +		u8 value;
> +	} out;
> +	union {
> +		u8 wakeup;
> +		u8 value;
> +	} in;
> +} __packed __aligned(8);
> +
> +struct gpio_rpmsg_pin {
> +	u8 irq_shutdown;
> +	u8 irq_unmask;
> +	u8 irq_mask;
> +	u32 irq_wake_enable;
> +	u32 irq_type;
> +	struct gpio_rpmsg_packet msg;
> +};
> +
> +struct gpio_rpmsg_info {
> +	struct rpmsg_device *rpdev;
> +	struct gpio_rpmsg_packet *notify_msg;
> +	struct gpio_rpmsg_packet *reply_msg;
> +	struct completion cmd_complete;
> +	struct mutex lock;
> +	void **port_store;
> +};
> +
> +struct rpmsg_gpio_port {
> +	struct gpio_chip gc;
> +	struct gpio_rpmsg_pin gpio_pins[GPIOS_PER_PORT];
> +	struct gpio_rpmsg_info info;
> +	int idx;
> +};
> +
> +static int gpio_send_message(struct rpmsg_gpio_port *port,
> +			     struct gpio_rpmsg_packet *msg,
> +			     bool sync)
> +{
> +	struct gpio_rpmsg_info *info = &port->info;
> +	int err;
> +
> +	if (!info->rpdev) {
> +		pr_err("rpmsg channel doesn't exist, is remote core ready?\n");

How is this possible? You're creating and destroying the platform_device
based on the presence of the rpmsg channel/endpoint, in what case would
you end up here without a valid rpdev?

And if this is to deal with the race during removal, I guess the error
message is wrong and rpdev might go away before you access it below?

> +		return -EINVAL;
> +	}
> +
> +	reinit_completion(&info->cmd_complete);
> +	err = rpmsg_send(info->rpdev->ept, (void *)msg,
> +			 sizeof(struct gpio_rpmsg_packet));
> +	if (err) {
> +		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err);
> +		return err;
> +	}
> +
> +	if (sync) {
> +		err = wait_for_completion_timeout(&info->cmd_complete,
> +						  msecs_to_jiffies(RPMSG_TIMEOUT));
> +		if (!err) {
> +			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
> +			return -ETIMEDOUT;
> +		}
> +
> +		if (info->reply_msg->out.retcode != 0) {
> +			dev_err(&info->rpdev->dev, "remote core replies an error: %d!\n",
> +				info->reply_msg->out.retcode);
> +			return -EINVAL;
> +		}
> +
> +		/* copy the reply message */
> +		memcpy(&port->gpio_pins[info->reply_msg->pin_idx].msg,
> +		       info->reply_msg, sizeof(*info->reply_msg));
> +	}
> +
> +	return 0;
> +}
> +
> +static struct gpio_rpmsg_packet *gpio_setup_msg_header(struct rpmsg_gpio_port *port,
> +						       unsigned int offset,
> +						       u8 cmd)
> +{
> +	struct gpio_rpmsg_packet *msg = &port->gpio_pins[offset].msg;
> +
> +	memset(msg, 0, sizeof(struct gpio_rpmsg_packet));
> +	msg->header.id = RPMSG_GPIO_ID;
> +	msg->header.vendor = RPMSG_VENDOR;
> +	msg->header.version = RPMSG_VERSION;
> +	msg->header.type = GPIO_RPMSG_SETUP;
> +	msg->header.cmd = cmd;
> +	msg->pin_idx = offset;
> +	msg->port_idx = port->idx;
> +
> +	return msg;
> +};
> +
> +static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_packet *msg = NULL;

There's no reason to initialize msg here, the first reference is an
assignment.

> +	int ret;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_GET);
> +
> +	ret = gpio_send_message(port, msg, true);
> +	if (!ret)
> +		ret = !!port->gpio_pins[gpio].msg.in.value;
> +
> +	return ret;
> +}
> +
> +static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_packet *msg = NULL;
> +	int ret;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_DIRECTION_GET);
> +
> +	ret = gpio_send_message(port, msg, true);
> +	if (!ret)
> +		ret = !!port->gpio_pins[gpio].msg.in.value;
> +
> +	return ret;
> +}
> +
> +static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_packet *msg = NULL;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_INIT);
> +
> +	return gpio_send_message(port, msg, true);
> +}
> +
> +static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_packet *msg = NULL;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_OUTPUT_INIT);
> +	msg->out.value = val;
> +
> +	return gpio_send_message(port, msg, true);
> +}
> +
> +static int rpmsg_gpio_direction_output(struct gpio_chip *gc,
> +				       unsigned int gpio,
> +				       int val)
> +{
> +
> +	return rpmsg_gpio_set(gc, gpio, val);
> +}
> +
> +static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +	int edge = 0;
> +	int ret = 0;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		edge = GPIO_RPMSG_TRI_RISING;
> +		irq_set_handler_locked(d, handle_simple_irq);
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		edge = GPIO_RPMSG_TRI_FALLING;
> +		irq_set_handler_locked(d, handle_simple_irq);
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		edge = GPIO_RPMSG_TRI_BOTH_EDGE;
> +		irq_set_handler_locked(d, handle_simple_irq);
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		edge = GPIO_RPMSG_TRI_LOW_LEVEL;
> +		irq_set_handler_locked(d, handle_level_irq);
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		edge = GPIO_RPMSG_TRI_HIGH_LEVEL;
> +		irq_set_handler_locked(d, handle_level_irq);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		irq_set_handler_locked(d, handle_bad_irq);
> +		break;
> +	}
> +
> +	port->gpio_pins[gpio_idx].irq_type = edge;
> +
> +	return ret;
> +}
> +
> +static int gpio_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +
> +	port->gpio_pins[gpio_idx].irq_wake_enable = enable;
> +
> +	return 0;
> +}
> +
> +/*
> + * This function will be called at:
> + *  - one interrupt setup.
> + *  - the end of one interrupt happened
> + * The gpio over rpmsg driver will not write the real register, so save
> + * all infos before this function and then send all infos to M core in this
> + * step.
> + */
> +static void gpio_rpmsg_unmask_irq(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +
> +	port->gpio_pins[gpio_idx].irq_unmask = 1;
> +}
> +
> +static void gpio_rpmsg_mask_irq(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +	/*
> +	 * No need to implement the callback at A core side.
> +	 * M core will mask interrupt after a interrupt occurred, and then
> +	 * sends a notify to A core.
> +	 * After A core dealt with the notify, A core will send a rpmsg to
> +	 * M core to unmask this interrupt again.

There's nothing in this scheme that dictates that we have A cores and M
cores, or that we have a single core system on both sides, or that they
are Arm cores, please describe things in terms of Linux system and
"remote system".

> +	 */
> +	port->gpio_pins[gpio_idx].irq_mask = 1;
> +}
> +
> +static void gpio_rpmsg_irq_shutdown(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +
> +	port->gpio_pins[gpio_idx].irq_shutdown = 1;
> +}
> +
> +static void gpio_rpmsg_irq_bus_lock(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +
> +	mutex_lock(&port->info.lock);
> +}
> +
> +static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	struct gpio_rpmsg_packet *msg = NULL;
> +	u32 gpio_idx = d->hwirq;
> +
> +	if (!port)
> +		return;
> +
> +	/*
> +	 * For mask irq, do nothing here.
> +	 * M core will mask interrupt after a interrupt occurred, and then
> +	 * sends a notify to A core.
> +	 * After A core dealt with the notify, A core will send a rpmsg to
> +	 * M core to unmask this interrupt again.
> +	 */
> +
> +	if (port->gpio_pins[gpio_idx].irq_mask && !port->gpio_pins[gpio_idx].irq_unmask) {
> +		port->gpio_pins[gpio_idx].irq_mask = 0;
> +		mutex_unlock(&port->info.lock);
> +		return;
> +	}
> +
> +	msg = gpio_setup_msg_header(port, gpio_idx, GPIO_RPMSG_INPUT_INIT);
> +
> +	if (port->gpio_pins[gpio_idx].irq_shutdown) {
> +		msg->out.event = GPIO_RPMSG_TRI_IGNORE;
> +		msg->in.wakeup = 0;
> +		port->gpio_pins[gpio_idx].irq_shutdown = 0;
> +	} else {
> +		 /* if not set irq type, then use low level as trigger type */
> +		msg->out.event = port->gpio_pins[gpio_idx].irq_type;
> +		if (!msg->out.event)
> +			msg->out.event = GPIO_RPMSG_TRI_LOW_LEVEL;
> +		if (port->gpio_pins[gpio_idx].irq_unmask) {
> +			msg->in.wakeup = 0;
> +			port->gpio_pins[gpio_idx].irq_unmask = 0;
> +		} else /* irq set wake */
> +			msg->in.wakeup = port->gpio_pins[gpio_idx].irq_wake_enable;
> +	}
> +
> +	gpio_send_message(port, msg, false);
> +	mutex_unlock(&port->info.lock);
> +}
> +
> +static const struct irq_chip gpio_rpmsg_irq_chip = {
> +	.irq_mask = gpio_rpmsg_mask_irq,
> +	.irq_unmask = gpio_rpmsg_unmask_irq,
> +	.irq_set_wake = gpio_rpmsg_irq_set_wake,
> +	.irq_set_type = gpio_rpmsg_irq_set_type,
> +	.irq_shutdown = gpio_rpmsg_irq_shutdown,
> +	.irq_bus_lock = gpio_rpmsg_irq_bus_lock,
> +	.irq_bus_sync_unlock = gpio_rpmsg_irq_bus_sync_unlock,
> +	.flags = IRQCHIP_IMMUTABLE,
> +};
> +
> +static int rpmsg_gpio_callback(struct rpmsg_device *rpdev,
> +			       void *data, int len, void *priv, u32 src)
> +{
> +	struct gpio_rpmsg_packet *msg = (struct gpio_rpmsg_packet *)data;
> +	struct rpmsg_gpio_port *port = NULL;
> +	struct rpdev_platform_info *drvdata;
> +
> +	drvdata = dev_get_drvdata(&rpdev->dev);
> +	if (msg)
> +		port = drvdata->channel_devices[msg->port_idx];
> +
> +	if (!port)
> +		return -ENODEV;
> +
> +	if (msg->header.type == GPIO_RPMSG_REPLY) {
> +		port->info.reply_msg = msg;

As soon as you return from this function, the msg buffer is put back
into the virtqueue, so you can't just stash a reference to it here and
hope that it's still available when gpio_send_message() tries to read
it.

> +		complete(&port->info.cmd_complete);
> +	} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
> +		port->info.notify_msg = msg;

Ditto.

Although notify_msg is assigned, but I never see any further access to
it.

> +		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->pin_idx);
> +	} else
> +		dev_err(&rpdev->dev, "wrong command type!\n");
> +
> +	return 0;
> +}
> +
> +static void rpmsg_gpio_remove_action(void *data)
> +{
> +	struct rpmsg_gpio_port *port = data;
> +
> +	port->info.port_store[port->idx] = NULL;
> +}
> +
> +static int rpmsg_gpio_probe(struct platform_device *pdev)
> +{
> +	struct rpdev_platform_info *pltdata = pdev->dev.platform_data;
> +	struct rpmsg_gpio_port *port;
> +	struct gpio_irq_chip *girq;
> +	struct gpio_chip *gc;
> +	int ret;
> +
> +	if (!pltdata)
> +		return -EPROBE_DEFER;

EPROBE_DEFER would imply that if we try again a bit later, platform_data
is suddenly non-NULL, that seems unlikely.

> +
> +	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	ret = device_property_read_u32(&pdev->dev, "reg", &port->idx);
> +	if (ret)
> +		return ret;
> +
> +	if (port->idx > MAX_DEV_PER_CHANNEL)
> +		return -EINVAL;
> +
> +	ret = devm_mutex_init(&pdev->dev, &port->info.lock);
> +	if (ret)
> +		return ret;
> +
> +	init_completion(&port->info.cmd_complete);
> +	port->info.rpdev = pltdata->rpdev;
> +	port->info.port_store = pltdata->channel_devices;
> +	port->info.port_store[port->idx] = port;
> +	if (!pltdata->rx_callback)
> +		pltdata->rx_callback = rpmsg_gpio_callback;

What happens if you rmmod your rpmsg gpio driver and then trigger an
interrupt?

> +
> +	gc = &port->gc;
> +	gc->owner = THIS_MODULE;
> +	gc->parent = &pdev->dev;
> +	gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
> +				   pltdata->rproc_name, port->idx);
> +	gc->ngpio = GPIOS_PER_PORT;
> +	gc->base = -1;
> +
> +	gc->direction_input = rpmsg_gpio_direction_input;
> +	gc->direction_output = rpmsg_gpio_direction_output;
> +	gc->get_direction = rpmsg_gpio_get_direction;
> +	gc->get = rpmsg_gpio_get;
> +	gc->set = rpmsg_gpio_set;
> +
> +	platform_set_drvdata(pdev, port);
> +	girq = &gc->irq;
> +	gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
> +	girq->parent_handler = NULL;
> +	girq->num_parents = 0;
> +	girq->parents = NULL;
> +	girq->chip->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
> +					  pltdata->rproc_name, port->idx);
> +
> +	ret = devm_add_action_or_reset(&pdev->dev, rpmsg_gpio_remove_action, port);
> +	if (ret)
> +		return ret;
> +
> +	return devm_gpiochip_add_data(&pdev->dev, gc, port);
> +}
> +
> +static const struct of_device_id rpmsg_gpio_dt_ids[] = {
> +	{ .compatible = "rpmsg-gpio" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver rpmsg_gpio_driver = {

It's an "rpmsg gpio driver", but it's a platform_driver...

I don't think this is the correct design, but if it is then this needs
to be well documented.

Same thing as platform_data forms a strong ABI between some other driver
and this platform_driver, this needs to be well documented (but should
be avoided).

Regards,
Bjorn

> +	.driver	= {
> +		.name = "gpio-rpmsg",
> +		.of_match_table = rpmsg_gpio_dt_ids,
> +	},
> +	.probe = rpmsg_gpio_probe,
> +};
> +
> +module_platform_driver(rpmsg_gpio_driver);
> +
> +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
> +MODULE_DESCRIPTION("generic rpmsg gpio driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 

