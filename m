Return-Path: <linux-gpio+bounces-36325-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDsXEAel+2kNewMAu9opvQ
	(envelope-from <linux-gpio+bounces-36325-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 22:31:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D704E0365
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 22:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BAAE301D06B
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 20:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DF738F626;
	Wed,  6 May 2026 20:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="P6Hvk6+A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9353876BF;
	Wed,  6 May 2026 20:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778099435; cv=none; b=LMhbBnzxNkosMX5wn/CNXw9ZhIzwRVLTnNr4P/2rmIosmiw7iqPca7AqvTqk2gsHL+6/Pe8GylwXm2AMc4JVxiOsWwWeg4AyoJ6qvFzN+SR5w0gy3T9Q9K4sSkpAviP+x1b8oeKBcg1mHOjQVG0nya0KdjfBtzpaZWK2BfK+S3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778099435; c=relaxed/simple;
	bh=ElJosHTYLcI9BgvAkBOdPtaYbxUdlkp93c6ZPh+hIQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oh+zZ91cJdaqqm3Hn44tWu3DWdauSjNGYP7nSWNn7JWxhX1SNdU9cMqpl7eAZoQ5/7w95G3S0RRz/uRkHwcqqj6dCDZLHvYFKmMK4FD55QqTYGDvcTfRePQcggddC5Yk67kR8SEgiDUGg2oXXhTvTy2Nm7PssBqtOfN92r8kwdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=P6Hvk6+A; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6E250C5DC52;
	Wed,  6 May 2026 20:31:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9AF660558;
	Wed,  6 May 2026 20:30:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 879BB107F1E2B;
	Wed,  6 May 2026 22:30:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778099425; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vrqq7dyzDgCl+FqaMvTiuXKBdsOhTj/wqsPWsAfCeVU=;
	b=P6Hvk6+A9KAGIiXMc5ppzQ8YnInesNyobJwlVOScdEn3BK6ZEG23RDVXqJ6UhXoJCZ/ClQ
	IUaW5ffmO1GB5JT6pTn4JtgmuSK+cRR3G1OcUYmDqGuh+VBCxuJ5HSm/LVFRPC4a7eFPCK
	lYEJgLQ08RS58hm0mDonItlSHMq4n57ZfMggV7q1BtmhvLggvm/45yz/tuzkuo9gCOFf+u
	3K5HNHEI5PY46RtLY6F5VEi1OqnYZRWCqhL897NXI0JaUY6wU9HQsCRvqSXESwzhM7jo2T
	za6fvFc/XcHv7AFGlUDrBhtbj3FxDismo+IFvtdNJhuaoK/yerA+Brrcvr3ndA==
Date: Wed, 6 May 2026 22:30:15 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
 <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, Linus
 Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Mark
 Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, Andy Shevchenko
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
Subject: Re: [PATCH v6 13/27] PCI: of: Remove fwnode_dev_initialized() call
 for a PCI root bridge node
Message-ID: <20260506222846.68963c71@bootlin.com>
In-Reply-To: <20260325202037.GA1291636@bhelgaas>
References: <20260325143555.451852-14-herve.codina@bootlin.com>
	<20260325202037.GA1291636@bhelgaas>
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
X-Rspamd-Queue-Id: D1D704E0365
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,glider.be,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,microchip.com,bootlin.com];
	TAGGED_FROM(0.00)[bounces-36325-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:email,bootlin.com:dkim,bootlin.com:url]

Hi Bjorn,

On Wed, 25 Mar 2026 15:20:37 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> On Wed, Mar 25, 2026 at 03:35:40PM +0100, Herve Codina wrote:
> > During the instantiation of devices described by a device-tree overlay
> > applied on a PCI device, devlink displays the following kind of debug
> > messages instead of creating the expected links:
> >    'Not linking xxxx - might never become dev'
> > 
> > Without those expected links, the device removal order cannot be
> > correct.
> > 
> > Those debug traces are printed by fw_devlink_create_devlink(). In our
> > use case, they are all printed because the supplier of the link has at
> > least one of its ancestor with its fwnode flag FWNODE_FLAG_INITIALIZED
> > set.
> > 
> > The culprit ancestor is the PCI root bridge.
> > 
> > The fwnode related to the PCI root bridge is created dynamically by the
> > of_pci_make_host_bridge_node() function. During this creation
> > fwnode_dev_initialized() is called which set the FWNODE_FLAG_INITIALIZED
> > flag.
> > 
> > Calling fwnode_dev_initialized() tells devlink that the device related
> > to this node is handled out of the driver core. This is not correct in
> > our case. Indeed the device related to this firmware node is handled
> > using driver core mechanisms and is fully compliant devlink
> > expectations.
> > 
> > Simply remove the fwnode_dev_initialized() call. With that done, the
> > devlink debug messages are no more displayed and links that were missing
> > are correctly created.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> I would ordinarily make sure the person who added
> fwnode_dev_initialized() here was ok with its removal, but it looks
> like you added this with 1f340724419e ("PCI: of: Create device tree
> PCI host bridge node"), so I assume you're ok with removing it :)

Yes, I am really ok to remove it :)

> 
> I suppose there could be a "Fixes: 1f340724419e" tag, but maybe
> there's no need to backport this anywhere?

Yes, I will add the Fixes tag.

Also the previous patch ("PCI: of: Set fwnode device of newly created PCI
device nodes") fixes 407d1a51921e ("PCI: Create device tree node for bridge")

I plan to add "Fixes: 407d1a51921e" to the previous patch to make things
consistent.

To ease backports and avoid conflicts, I plan to add 'Cc: stable' in 4
patches:
 - patch 13 "PCI: of: Remove fwnode_dev_initialized() call for a PCI root
   bridge node"
   This current patch with Fixes added

 - patch 12 "PCI: of: Set fwnode device of newly created PCI device nodes"
   The previous patch with Fixes added

 - patch 11 "PCI: of: Use fw_devlink_set_device()"
   Avoid conflict when patch 13 is applied

 - patch 6  "driver core: fw_devlink: Introduce fw_devlink_set_device()"
   Needed for patch 11 and 12

Do you think it makes sense ?

Best regards,
Hervé

> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> > ---
> >  drivers/pci/of.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> > index b694fcda16b1..0993257fe025 100644
> > --- a/drivers/pci/of.c
> > +++ b/drivers/pci/of.c
> > @@ -811,7 +811,6 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
> >  	 */
> >  	of_node_set_flag(np, OF_POPULATED);
> >  	fw_devlink_set_device(&np->fwnode, &bridge->dev);
> > -	fwnode_dev_initialized(&np->fwnode, true);
> >  
> >  	ret = of_changeset_apply(cset);
> >  	if (ret)
> > -- 
> > 2.53.0
> >   



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

