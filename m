Return-Path: <linux-gpio+bounces-31790-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGaQLJqVlWk1SgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31790-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 11:34:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C0C1557FC
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 11:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 459A830872D0
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 10:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81623009DA;
	Wed, 18 Feb 2026 10:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="piRPMPq1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A6D30101F
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 10:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410014; cv=none; b=C/74LstzVBR4MZKTC5W/bgySDG1lA8MBXf5bQnwgpdppCCGwx9xAbhyHBk0VYhL5TRv3NHEdPYJsduD7a0C5HBqgPcCu6uiK2mmi2HsLLA7vfIvUwKoa8dOKqSdOOiMbvRr/1hEkhUXrNwuAcT0UqiWM9U6oZZJ2WTA+2yswKk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410014; c=relaxed/simple;
	bh=KMRhh6W9t1S/zQ6NhQbrvFLYqyEEu7IaIcL7BGCP9Fc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kE7K4uCTSaO0Yd/W3fdl0vJa9vRBoHhTCABvjLy4KdeaoH4sagxdbtt2U5Fz0CWIY6IApTRmD+rbD12OoknlE+lhbJl5GJ0MB6hLcOTe4gSE51X2ryyG5i6z5UUH94LNXRLtZUFvtzt1ksnLzHa8KF7lUWR1bc4Ss0t876m5vkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=piRPMPq1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AE9C19423
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771410014;
	bh=KMRhh6W9t1S/zQ6NhQbrvFLYqyEEu7IaIcL7BGCP9Fc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=piRPMPq1JdjrH5xmr6Qs/V+e9vEf3hRMW+F2zhIxb+JEaCgt21TeynmqDUItYAqvj
	 zYyoLeS+gb7ygloju8kp4NxNqF5TQ3NMLMRk/t0fqkqldGDQ7m0vqHWi+6IFfcWiAv
	 X86dUvgMK4t/Zsqb6VwdbgZXtPuDAZDoAvup3XmWtdD/3lSXBQkzPwWr0Z6xjV7Ssu
	 oj23Io1n0JHIuuduhHCevY/zSElk6DjImynbCNHYHZocQSD61gxjy3CyGv0NgADguI
	 N6sUEZ2A9/5ktY7u5fr9UPqBlOYH0sB2xuhgr0y2Wp+ZrcbJ6CdfdOJfFndlq/Csu1
	 WnOreDr8/ltUQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59de66fda55so5290959e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 02:20:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXocDI+14MgUPkYnYUA1/94X8A1Ipe+M9M79Ss1WlOStKKDM+8Yo6BSt/EamToXmWHO03YP2Y4ZuMI9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvn7H1aj4cmPR09cEFWMuAz+E8NtcOITOkhIPqmZM6tw1pcV59
	jvhUYiE1nSp/j0e9CCKf6sV+TTTV87E3svQyocX8pm/svfetsMr8kf3hcMTpYPr22MjxMSBDi8k
	W4drU5iC+u7Ca+HXuszpvzBYkLlv8jYWKzSs+x16PHg==
X-Received: by 2002:a05:6512:685:b0:59e:38e2:7b60 with SMTP id
 2adb3069b0e04-59f6d485901mr4374992e87.53.1771410012913; Wed, 18 Feb 2026
 02:20:12 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Feb 2026 04:20:11 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Feb 2026 04:20:11 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260212213656.662437-4-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212213656.662437-1-shenwei.wang@nxp.com> <20260212213656.662437-4-shenwei.wang@nxp.com>
Date: Wed, 18 Feb 2026 04:20:11 -0600
X-Gmail-Original-Message-ID: <CAMRc=MfM7Wc6ae+thPnqBdJUKhLVkrgZYYD_9EjAzxbE5mtSgg@mail.gmail.com>
X-Gm-Features: AaiRm50s4fsP3Hfe2L_u48xMA8NYIISGBNrR-9MdGdJEdOmmMFh9mEr9DdPOsIQ
Message-ID: <CAMRc=MfM7Wc6ae+thPnqBdJUKhLVkrgZYYD_9EjAzxbE5mtSgg@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	arnaud.pouliquen@foss.st.com, Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31790-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com,bgdev.pl,lunn.ch,kernel.org,lwn.net,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,lunn.ch:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9C0C1557FC
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 22:36:55 +0100, Shenwei Wang <shenwei.wang@nxp.com> said:
> On an AMP platform, the system may include two processors:
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
>  drivers/gpio/Kconfig      |  17 ++
>  drivers/gpio/Makefile     |   1 +
>  drivers/gpio/gpio-rpmsg.c | 588 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 606 insertions(+)
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b45fb799e36c..3179a54f0634 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1892,6 +1892,23 @@ config GPIO_SODAVILLE
>
>  endmenu
>
> +menu "RPMSG GPIO drivers"
> +	depends on RPMSG
> +
> +config GPIO_RPMSG
> +	tristate "Generic RPMSG GPIO support"
> +	depends on REMOTEPROC
> +	select GPIOLIB_IRQCHIP
> +	default REMOTEPROC

You're using a lot of OF-centric APIs here, don't you need to depend on OF?
Alternatively, it seems that only rpmsg_get_channel_ofnode() really requires
OF-nodes and everything else could just use firmware node API.

> +	help
> +	  Say yes here to support the generic GPIO functions over the RPMSG
> +	  bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x, and
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
> index c05f7d795c43..501aba56ad68 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -158,6 +158,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
>  obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
>  obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
>  obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
> +obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
>  obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
>  obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
>  obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
> diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
> new file mode 100644
> index 000000000000..163f51fd45b5
> --- /dev/null
> +++ b/drivers/gpio/gpio-rpmsg.c
> @@ -0,0 +1,588 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2026 NXP
> + *
> + * The driver exports a standard gpiochip interface to control
> + * the GPIO controllers via RPMSG on a remote processor.
> + */

Add newline here.

[snip]

> +
> +static struct device_node *
> +rpmsg_get_channel_ofnode(struct rpmsg_device *rpdev, char *chan_name)
> +{
> +	struct device_node *np_chan = NULL, *np;
> +	struct rproc *rproc;
> +
> +	rproc = rproc_get_by_child(&rpdev->dev);
> +	if (!rproc)
> +		return NULL;
> +
> +	np = of_node_get(rproc->dev.of_node);
> +	if (!np && rproc->dev.parent)
> +		np = of_node_get(rproc->dev.parent->of_node);
> +
> +	if (np) {
> +		/* Balance the of_node_put() performed by of_find_node_by_name(). */
> +		of_node_get(np);
> +		np_chan = of_find_node_by_name(np, chan_name);
> +		of_node_put(np);

If you put np here, why even bother with "balancing". If you don't do
of_node_get() before calling of_find_node_by_name(), you'll be in the
same place, no?

> +	}
> +
> +	return np_chan;
> +}
> +
> +static int
> +rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
> +			    int len, void *priv, u32 src)
> +{
> +	struct gpio_rpmsg_packet *msg = data;
> +	struct rpmsg_gpio_port *port = NULL;
> +	struct rpdev_drvdata *drvdata;
> +
> +	drvdata = dev_get_drvdata(&rpdev->dev);
> +	if (drvdata && msg && msg->port_idx < MAX_PORT_PER_CHANNEL)
> +		port = drvdata->channel_devices[msg->port_idx];
> +
> +	if (!port)
> +		return -ENODEV;
> +
> +	if (msg->header.type == GPIO_RPMSG_REPLY) {
> +		*port->info.reply_msg = *msg;
> +		complete(&port->info.cmd_complete);
> +	} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
> +		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->pin_idx);
> +	} else
> +		dev_err(&rpdev->dev, "wrong command type!\n");
> +
> +	return 0;
> +}
> +
> +static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev)
> +{
> +	struct device *dev = &rpdev->dev;
> +	struct rpdev_drvdata *drvdata;
> +	struct device_node *np;
> +	int ret;
> +
> +	if (!dev->of_node) {
> +		np = rpmsg_get_channel_ofnode(rpdev, rpdev->id.name);
> +		if (np) {
> +			dev->of_node = np;
> +			set_primary_fwnode(dev, of_fwnode_handle(np));
> +		}
> +		return -EPROBE_DEFER;
> +	}
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->rproc_name = rpmsg_get_rproc_node_name(rpdev);
> +	dev_set_drvdata(dev, drvdata);
> +
> +	for_each_child_of_node_scoped(dev->of_node, child) {

Like mentioned above: this could be:

device_for_each_child_node() {
	fwnode_device_is_available();
	...
}

> +		if (!of_device_is_available(child))
> +			continue;
> +
> +		if (!of_match_node(dev->driver->of_match_table, child))
> +			continue;
> +
> +		ret = rpmsg_gpiochip_register(rpdev, child);
> +		if (ret < 0)
> +			dev_err(dev, "Failed to register: %pOF\n", child);
> +	}
> +
> +	return 0;
> +}
> +
> +static void rpmsg_gpio_channel_remove(struct rpmsg_device *rpdev)
> +{
> +	dev_info(&rpdev->dev, "rpmsg gpio channel driver is removed\n");
> +}

Please drop this, no need to log it,

> +
> +static const struct of_device_id rpmsg_gpio_dt_ids[] = {
> +	{ .compatible = "rpmsg-gpio" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> +	{ .name	= "rpmsg-io-channel" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
> +
> +static struct rpmsg_driver rpmsg_gpio_channel_client = {
> +	.drv.name	= KBUILD_MODNAME,
> +	.drv.of_match_table = rpmsg_gpio_dt_ids,

Can you please do:

	.drv = {
		.name = "open-coded-name",
		.of_match_table = ...
	};

?

Bartosz

> +	.id_table	= rpmsg_gpio_channel_id_table,
> +	.probe		= rpmsg_gpio_channel_probe,
> +	.callback	= rpmsg_gpio_channel_callback,
> +	.remove		= rpmsg_gpio_channel_remove,
> +};
> +module_rpmsg_driver(rpmsg_gpio_channel_client);
> +
> +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
> +MODULE_DESCRIPTION("generic rpmsg gpio driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>
>

