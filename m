Return-Path: <linux-gpio+bounces-31570-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SxJ9LnNvi2mRUQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31570-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:48:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C3111E185
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 18:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 213A43016EF7
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA27372B21;
	Tue, 10 Feb 2026 17:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="qNlPD0ot"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F870632;
	Tue, 10 Feb 2026 17:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770745710; cv=none; b=NTbE9VClDi5yTUi1RYVvlfOpMrzW4pc84aBkP78GES22OIwDX0X70ApqQ6KmFRUnj/5C4FTBZqTJjf84XITgV43qTtk874pbFmieNkDA0FlIrDCd16OLabOPKaMxt6vXV8+8uMtLBry2Rz2EtBJq4eV50/P7bb7sM871tbLlQL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770745710; c=relaxed/simple;
	bh=lUjwjU7r/37mGB1+K3bxHipqn9HWgCfuZbF3Cr+c9Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRzcVvTYsk3fMsFBwjpy2IINQixcg9jeV9J1CATfEGOXsIEs2Mrd/xMv4rEj9cssnlJU1jzbbys7eQgJkeKlBpMcu51Eyv4ZT96X6q+YX4kyU5VLz/oT+txhbkoWB91qRDl04TXNscV3rHOFTGFVcT2QOcbnoRC5XS7HSXo3gbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=qNlPD0ot; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xeAOkTtRwcO+e2SaV7ZKu57U0Jz6k1k1CcRryqfUgcg=; b=qNlPD0otkehOoYaEKrGge/jrak
	QhJ1Myw82gCtw3rwilHqO7HwFPMgrDuVbaMpqGraieid4jHrDHaUeF2i/7O9IGC+6t5AL9dVshJwH
	4V7CqdUWghEvACsybzINdoBvcaJ54Nsfh+fDk9ahh2do62/DUDTdHqQDpf/e8xAeMRTQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vprqS-006ruL-NJ; Tue, 10 Feb 2026 18:48:16 +0100
Date: Tue, 10 Feb 2026 18:48:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-imx@nxp.com,
	arnaud.pouliquen@foss.st.com, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v7 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <5158fda4-6bf6-45b8-bbe0-8b469066d0ef@lunn.ch>
References: <20260210170814.406883-1-shenwei.wang@nxp.com>
 <20260210170814.406883-4-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210170814.406883-4-shenwei.wang@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31570-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,pengutronix.de,lwn.net,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,foss.st.com,bgdev.pl];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 57C3111E185
X-Rspamd-Action: no action

> +#define GPIOS_PER_PORT		32

Maybe this should be from DT, using "ngpios". The Documentation says:

  Optionally, a GPIO controller may have a "ngpios" property. This
  property indicates the number of in-use slots of available slots for
  GPIOs. The typical example is something like this: the hardware
  register is 32 bits wide, but only 18 of the bits have a physical
  counterpart. The driver is generally written so that all 32 bits can
  be used, but the IP block is reused in a lot of designs, some using
  all 32 bits, some using 18 and some using 12. In this case, setting
  "ngpios = <18>;" informs the driver that only the first 18 GPIOs, at
  local offset 0 .. 17, are in use.

Just because your hardware has 32 does not mean every vendor does.

> +struct gpio_rpmsg_head {
> +	u8 id;		/* Message ID Code */
> +	u8 vendor;	/* Vendor ID number */
> +	u8 version;	/* Vendor-specific version number */
> +	u8 type;	/* Message type */
> +	u8 cmd;		/* Command code */
> +	u8 reserved[5];
> +} __packed;

I still think this should be a clean design from scratch, and you
modify your firmware.

This data structure is 10 bytes. Are these all needed for a generic
GPIO controller? version, type, command and one reserved byte seems
like enough, and it is then 4 bytes, so there is no need for __packed.

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

This then becomes 8 bytes, so there is no need for __packed or
__aligned(8).

I don't want to force this, it is something i think which should be
discussed. Do we adopt your design, which is not so nice, but at least
has one working implementation, or do we do a clean design?

> +static int gpio_send_message(struct rpmsg_gpio_port *port,
> +			     struct gpio_rpmsg_packet *msg,
> +			     bool sync)
> +{
> +	struct gpio_rpmsg_info *info = &port->info;
> +	int err;
> +
> +	reinit_completion(&info->cmd_complete);
> +	err = rpmsg_send(info->rpdev->ept, msg, sizeof(struct gpio_rpmsg_packet));
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

I _think_ you need to handle negative values of err. It looks like
do_wait_for_common() can return -ERESTARTSYS;

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

Why is a function called gpio_setup_msg_header() setting things
outside of the header?

> +static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_packet *msg;
> +	int ret;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_GET);
> +
> +	ret = gpio_send_message(port, msg, true);

If gpio_setup_msg_header() does what it sounds like it should do, what
is setting up the message body before you send the message?

	Andrew

