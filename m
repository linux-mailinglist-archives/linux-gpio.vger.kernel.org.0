Return-Path: <linux-gpio+bounces-36361-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eP/aFshc/GlPOwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36361-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 11:35:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFE04E6095
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 11:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAB1C3055E81
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 09:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E863C1977;
	Thu,  7 May 2026 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0rprqbA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F803C13E0
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146052; cv=none; b=sZ8sz+TCISvF9lxhoCKvMszRNtqev5r1Fzk0vPvgAPAcJvIrh0PLNED1I/epoSRXKFdlO0GUcHRaUkzSATrthvujY1Bl/GBbYcvlT/aXbEPcv67lbTtmhs+/VJNbzwjZThxRAJA5AdYq+D6GSUe377nGg9EcSTATvOnBo+qYsQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146052; c=relaxed/simple;
	bh=x/JAxKHI7Ael5G6MScPlk2H+HssAyXfZZlY70tK9iiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UalR6bs06IVoU2K+Dra8PvmrIjcYZJD0sO8pkSS6kBG98SlNBlYR5FjMbgAiPmGeNPvfPZkJK7Y6T9o/SwmQVAwucXXGUzGdFUIInIAb+g+MUhhFR1WJZ5blzY5ZHZOahw6pxLEvzOjPPxb7C9RfGPyMnaphIO50VyWys31iIdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0rprqbA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87005C2BD00
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 09:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778146052;
	bh=x/JAxKHI7Ael5G6MScPlk2H+HssAyXfZZlY70tK9iiU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M0rprqbASG9AzM5L1LoCdxk36ssdaXCyannccq+gQqgcNbj1cx719RJBDVV3bb4dG
	 oLT/r6JTAbAuNB26XMU7HHp6cDkKBiYx3jN993WhWhZ6kfi+qMGLgO0G8fQGJpRJia
	 Rpu5solDUtB9CV0evm1gwu3/GX6cqyKIjJLF2YlSZ1CIvL2LYruBuBV/6ZzR29YVmN
	 +UmK6BCu/NQKuvEQmqLRV3a3ZVy4l6WAo9/EUUwrLIfYVgY5x/TaIglHYErxlJS+l8
	 4Ec1tWvIAlyKoFjj01NnecWNOa/mexcdaTbvHwmLzL86VJeL087WfJaJMARbT1XVU7
	 jhVz9zWSmDrhQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59dea72099eso578174e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 02:27:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Tf92MTR3GsJMyXPW1TQxZ46BK+u9fpeIO/wAshvjVbEuBdZKnxkxoF0KyvbnNvkCCO2Bf59iavEh1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw35a4K4iz7a6EgVEYYDkvifamUBrTlgRDSSdjCZKRtbwwcPCG/
	EKvKo1sJg6TBrKMKzEGw4no588jN9TIoJwSLMbp6Bih6vYgWWH+HTzD1CQbRFnaEg2EfgNX3bDh
	D+8d8GwdjrW+KsuxoUAhRH/YV8KgsQ1Y=
X-Received: by 2002:a05:6512:3ba7:b0:5a4:d34:5b38 with SMTP id
 2adb3069b0e04-5a887ada944mr2206033e87.2.1778146051005; Thu, 07 May 2026
 02:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325143555.451852-1-herve.codina@bootlin.com>
 <20260325143555.451852-21-herve.codina@bootlin.com> <CAD++jLkFu+Z22QBFiaa9S+Epeh=RJZOYX8BOLVDFw4bhEoYF1Q@mail.gmail.com>
 <20260507092326.2f8e3b47@bootlin.com>
In-Reply-To: <20260507092326.2f8e3b47@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 7 May 2026 11:27:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLmsaddK4MLYhfK+1OkK263QqJfMZ3HF=L0Y7QdDsgX4XQ@mail.gmail.com>
X-Gm-Features: AVHnY4J4kpHKlWyF60L1gEgZ_kRiVmUaWPxnRdg2mF7S7on9qK93oGWvqiVfuCU
Message-ID: <CAD++jLmsaddK4MLYhfK+1OkK263QqJfMZ3HF=L0Y7QdDsgX4XQ@mail.gmail.com>
Subject: Re: [PATCH v6 20/27] misc: lan966x_pci: Fix dtso nodes ordering
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kalle Niemi <kaleposti@gmail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BEFE04E6095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,glider.be,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,microchip.com,bootlin.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36361-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 9:23=E2=80=AFAM Herve Codina <herve.codina@bootlin.c=
om> wrote:

> > Recommended practice is:
> >
> > ethernet-switch@...
(...)
> > Recommended practice is:
> > ethernet-port@...
>
> Yes, it should be but the DT binding [0] says "switch" and "port".
(...)
> Those node names have to follow the DT binding even if this binding doesn=
't
> follow recommended practice.

Aha this binding is not referencing the standard ethernet-switch.yaml,
that's why I got confused.

OK let's just fix it then, I sent a patch.

Yours,
Linus Walleij

