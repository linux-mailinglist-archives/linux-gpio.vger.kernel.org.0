Return-Path: <linux-gpio+bounces-36336-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELxVBq5A/GlMNgAAu9opvQ
	(envelope-from <linux-gpio+bounces-36336-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 09:35:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9CE4E41D2
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 09:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 253DA3029AFF
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 07:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD83735BDA0;
	Thu,  7 May 2026 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZLJf7HFo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D973537F1;
	Thu,  7 May 2026 07:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778138638; cv=none; b=d42dtdxyfajBuKMlL4kpG7YWqjFgvHhqeK1JH5oYf6MOr8O3xcWV3/odBcWGDigDkU9VVOOkoT1YSDj9xJjAT+1PaffH84n0ASGPkYG0CU5RYsbbThrxh6wGGEMJSW1lfAMcrtck2oSalHJUtFJEEJWGroWNRD3Vgk559azAP+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778138638; c=relaxed/simple;
	bh=ag2e4rubDHljcUbsB2BC/MHj9ZFXFOBLhTjLy6JSlhk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kjzk/66yqjtWd3q+3Oy03Ub3KoFO1lt39ivhrMzshUXwRIUHb+sGyoz3OIpqfhD5MVY6j2udwhY3xZB1Xyv086MfNaZm63QwVEjvNETFa9sAayuk+Oeml9zNDhjF54SjaKdLCqjMrhSI4gYWi26wuKDrD+jGwgU3nn6cKLFqwe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZLJf7HFo; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 48A98C5DC58;
	Thu,  7 May 2026 07:24:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90CF6605D0;
	Thu,  7 May 2026 07:23:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F651107F1B9F;
	Thu,  7 May 2026 09:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778138630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KuHg3bpGpRy0j8zZGsR4xMbCeq+40KQNwSqwL73wrxg=;
	b=ZLJf7HFoaWrA+QvjHT5Gh6TZeRPeQK7D9TRFNzAxGhp0EWNliZg4AwN/3MS8qxZ+WzAXXq
	T6wrHBfmoxlIOCE0LR6qB6nNclEBnM62oa0qHR1b3eIxeSfrgMTMIlcTQI7nqZge15D0l+
	sLj9R0qfJuv9VoGTvaYtmVXHcV/7jHrAKRNpo7q2YNgBW2BMI67agx51RlZqky+pM/DE/w
	2FWDjIij6E4LO6ldmdu10VRhQ1jdNnY1LWBRw2nfeTqWN3+DsPlyj7HsjlEMWCYQvoebbU
	LgYPnGZiAHv/HKhw9qbr3lFn7WqvriiVxW4qqE4OwbN85ifqMP1iikrTMszpLg==
Date: Thu, 7 May 2026 09:23:26 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Kalle Niemi <kaleposti@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Arnd
 Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>, Len
 Brown <lenb@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang
 <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 20/27] misc: lan966x_pci: Fix dtso nodes ordering
Message-ID: <20260507092326.2f8e3b47@bootlin.com>
In-Reply-To: <CAD++jLkFu+Z22QBFiaa9S+Epeh=RJZOYX8BOLVDFw4bhEoYF1Q@mail.gmail.com>
References: <20260325143555.451852-1-herve.codina@bootlin.com>
	<20260325143555.451852-21-herve.codina@bootlin.com>
	<CAD++jLkFu+Z22QBFiaa9S+Epeh=RJZOYX8BOLVDFw4bhEoYF1Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 9D9CE4E41D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36336-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,glider.be,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,microchip.com,bootlin.com];
	FROM_HAS_DN(0.00)[];
	R_DKIM_ALLOW(0.00)[bootlin.com:s=dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[bootlin.com,reject];
	HAS_ORG_HEADER(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_SPAM(0.00)[0.419];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Hi Linus,

On Thu, 26 Mar 2026 11:33:19 +0100
Linus Walleij <linusw@kernel.org> wrote:

> Hi Herve,
> 
> this is nitpicking, but if you respin the series consider the following:
> 
> On Wed, Mar 25, 2026 at 3:42 PM Herve Codina <herve.codina@bootlin.com> wrote:
> >
> > Nodes available in the dtso are not ordered by their unit address.
> >
> > Fix that re-ordering them according to their unit address.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> (...)
> > +                               switch: switch@e0000000 {  
> 
> Recommended practice is:
> 
> ethernet-switch@...
> 
> > +                                       compatible = "microchip,lan966x-switch";
> > +                                       reg = <0xe0000000 0x0100000>,
> > +                                             <0xe2000000 0x0800000>;
> > +                                       reg-names = "cpu", "gcb";
> > +
> > +                                       interrupt-parent = <&oic>;
> > +                                       interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
> > +                                                    <9 IRQ_TYPE_LEVEL_HIGH>;
> > +                                       interrupt-names = "xtr", "ana";
> > +
> > +                                       resets = <&reset 0>;
> > +                                       reset-names = "switch";
> > +
> > +                                       pinctrl-names = "default";
> > +                                       pinctrl-0 = <&tod_pins>;
> > +
> > +                                       ethernet-ports {
> > +                                               #address-cells = <1>;
> > +                                               #size-cells = <0>;
> > +
> > +                                               port0: port@0 {  
> 
> Recommended practice is:
> ethernet-port@...
> 

Yes, it should be but the DT binding [0] says "switch" and "port".

Those node names have to follow the DT binding even if this binding doesn't
follow recommended practice.

[0] https://elixir.bootlin.com/linux/v7.0/source/Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml

Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

