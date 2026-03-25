Return-Path: <linux-gpio+bounces-34171-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNRGOKRCxGlHxwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34171-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 21:16:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8401532BB9E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 21:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 205DB305260A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 20:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39663371041;
	Wed, 25 Mar 2026 20:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tkz39/YI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E682430AAB8;
	Wed, 25 Mar 2026 20:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469603; cv=none; b=GjVhdeR2BeLqRRxTld0UwIHSFG42p4FdOZ2FtjkKYU6JwjUsRSHRd0OAurSTVQ4P9IUnUI5m+nt36qXdR2ppVEIPR70ekMyYI9skRylRsz3qAYnMrl/A85I0xKqCzJgPBbsBqnwziZpjOVlJk8/vmzEirdMClA0t+TW9g+z3968=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469603; c=relaxed/simple;
	bh=jSl4cR/M8opltn/7URZzvWelml/MUa8MCbVkBC5H/7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qgevVwaaTobrMFsconOqqgZk00nddbSy7VzK3zCYLufblSAyGV1Bsrj78G1b9dZzU1y3Fno2Owu2TH4JtUxSBCUtfwN30GNWnTkP2BF7+ePrL/1d5ZBkrs7XnYyseNAEvjaBv1dKlS74INB0qNBH1NYro0WZV9KStro3EAzbfcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tkz39/YI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2F0C4CEF7;
	Wed, 25 Mar 2026 20:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774469602;
	bh=jSl4cR/M8opltn/7URZzvWelml/MUa8MCbVkBC5H/7Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Tkz39/YIGOURtW2ow6h0sqScd2hCTpyVv9CGSZY9qtGWrSrjMUV5SL+I7z/kx260/
	 0+RE2w69mycl2mfgjzZeSRZQBe+mUZ/l9N951dkmLGzxXGu2Q+zr+qjLBYDIV894R5
	 2WaGAo+2zazNInal2SK6bs14ktm3stdXhU8IlYkwfgW/K5P8YQkf0skh5OzwK3roy5
	 vRmlJoGDLRnR2uIJMFV7MxtEwL5cJ+oG7yYhXF5yvbEn1eKlvMOUZn0ScMRRHyyhmC
	 dRG/71EX8DgaOGRpoya2j4xfZeZht+iT2MH99TCE6FYC/om6X7Ujq96H5hBTgb+7n+
	 osAPLMTcZT91g==
Date: Wed, 25 Mar 2026 15:13:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 12/27] PCI: of: Set fwnode device of newly created PCI
 device nodes
Message-ID: <20260325201321.GA1291474@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325143555.451852-13-herve.codina@bootlin.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34171-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,glider.be,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,microchip.com,bootlin.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 8401532BB9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 03:35:39PM +0100, Herve Codina wrote:
> Device-tree node can be created when CONFIG_PCI_DYNAMIC_OF_NODES. Those
> node are created and filled based on PCI core information but the
> fwnode device field is not set.

s/Those node are/Those nodes are/

> When later an overlay is applied, this confuses fw_devlink. Indeed,
> without any device attached to the node, fw_devlink considers that this
> node will never become a device. When this node is pointed as a
> supplier, devlink looks at its ancestors in order to find a node with a
> device that could be used as the supplier.
> 
> In the PCI use case, this leads to links that wrongly use the PCI root
> bridge device as the supplier instead of the expected PCI device.
> 
> Setting the fwnode device to the device of the PCI device allows devlink
> to use this device as a supplier and so, correct links are created.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/of.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 5fb7f501fd35..b694fcda16b1 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -709,6 +709,13 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
>  	if (ret)
>  		goto out_free_node;
>  
> +	/*
> +	 * Set the fwnode device in order to have fw_devlink creating links
> +	 * pointing to this PCI device instead of walking up to the PCI host
> +	 * bridge.
> +	 */
> +	fw_devlink_set_device(&np->fwnode, &pdev->dev);
> +
>  	ret = of_changeset_apply(cset);
>  	if (ret)
>  		goto out_free_node;
> -- 
> 2.53.0
> 

