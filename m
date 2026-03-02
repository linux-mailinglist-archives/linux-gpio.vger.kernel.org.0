Return-Path: <linux-gpio+bounces-32366-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMeBJHpQpWms8gUAu9opvQ
	(envelope-from <linux-gpio+bounces-32366-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 09:55:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 978B51D5018
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 09:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 919453002505
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 08:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B47E38B7AD;
	Mon,  2 Mar 2026 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JHGl83/E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354001E1DE5
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 08:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441714; cv=none; b=ReWz4TFvBR8KaruKRDQzOVr4eZm0lUqtKeUt+4rJNq+5DfGqIu7IprA9KdMt64Jwi4u6Nb6DKZgY4COUdc97LXUSOe0T0vBngkb6PXZKTo/vF6CTzygC8W0tds4EP42ZxsplBidfeDRfa8MS0KWKcVodvFzkBtTnWlglh8vOF0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441714; c=relaxed/simple;
	bh=fWKHZnhM2AFgK2NZeDXJFryewoq1HSjdJbh/M57qUy0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SU7oKdGw5e8r9x3cn7j8eutFJ1fYnARejllA03VRBVVbIiBz6nf+c5+AfIPQF/L5I3/98qgl3ZU5dPNMg5WT2boJ2N0Ov+jBHQsAkAPRSXMD470SUuVFnY1l40Wjvk8ixX0hVUct5989N5TQcn4b3ftf+jBEUoPEgGFE734THQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JHGl83/E; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B95B21A2117;
	Mon,  2 Mar 2026 08:55:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A7635FE89;
	Mon,  2 Mar 2026 08:55:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A417410369514;
	Mon,  2 Mar 2026 09:55:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772441709; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GolTPQTz/JkLYWONicK1ZiOMxmW8WOdbYREGhj5V2VE=;
	b=JHGl83/EukVWIZ/SFdAWt9yhzJriahQdYX09JxyQMGmtBSCskhZN7xckRr17bc2Vw62UfB
	qcGKw/ehj38y6m8ranUWNvyq3NRat6jfinq37P9NycrZiU/fSo6zR+MAJiG9AhmJ7KC/l4
	pBFI+KMgG5bhtUnvQCPWwENae2cpXhV2+vViIDxFpYE7xo882EU8nRvBOjJ0gdwpsXhLqI
	sRiEnHGjGE2s52NWpuK1u5OwsdRnqI2clKShjvkoUZcd+o/kBWHnQdvFWe0ePY9nwbq5ui
	iQ6Wugpy3aHWjvYrs8kRkNbHf2N86vXCFfVQ/+D6u5JeWKdfRBxrq2xPO8mA1Q==
Date: Mon, 2 Mar 2026 09:55:01 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thomas Gleixner <tglx@linutronix.de>, Daire McNamara
 <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v11 1/4] gpio: mpfs: Add interrupt support
Message-ID: <20260302095501.3104146f@bootlin.com>
In-Reply-To: <20260227-divinely-drift-93307c6763d8@spud>
References: <20260227-ajar-wolverine-7ce1ebd79821@spud>
	<20260227-divinely-drift-93307c6763d8@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32366-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 978B51D5018
X-Rspamd-Action: no action

Hi Conor,

On Fri, 27 Feb 2026 14:52:27 +0000
Conor Dooley <conor@kernel.org> wrote:

> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add support for interrupts to the PolarFire SoC GPIO driver. Each GPIO
> has an independent interrupt that is wired to an interrupt mux that sits
> between the controllers and the PLIC. The SoC has more GPIO lines than
> connections from the mux to the PLIC, so some GPIOs must share PLIC
> interrupts. The configuration is not static and is set at runtime,
> conventionally by the platform's firmware. CoreGPIO, the version
> intended for use in the FPGA fabric has two interrupt output ports, one
> is IO_NUM bits wide, as is used in the hardened cores, and the other is
> a single bit with all lines ORed together.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Doing the chained thing kinda covers all the bases at the expense of the
> "direct" mode interrupts that have a dedicated connection to the PLIC.


Seems ok on my side.

Just a nitpick in probe().

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

...
>  static int mpfs_gpio_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct device_node *node = pdev->dev.of_node;

dev->of_node instead of pdev->dev.of_node.

or move 'struct device_node *node = pdev->dev.of_node;' at first position
(reverse Xmas tree).

>  	struct mpfs_gpio_chip *mpfs_gpio;
> +	struct gpio_irq_chip *girq;

Best regards,
Hervé

