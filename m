Return-Path: <linux-gpio+bounces-34172-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFlvIwZGxGm1xwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34172-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 21:31:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AE932BDD0
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 21:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E54431043FC
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 20:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCDB371CFF;
	Wed, 25 Mar 2026 20:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/sHWhQC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EE83644D1;
	Wed, 25 Mar 2026 20:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774470039; cv=none; b=eybBcXhRxMxmPtn87BtN2tyZcMcdfxSZUt/3Vfh4OOjuGp65DIV2u0pfE6O8/JElhxGUPZWbN+VE+kgpMOocSSz+uj2NLdfs7/+hRyKUaLlNHBDZ48YuTqK1vet6nCutMXOs6JvvBjMhSR/1EDgQc3XpoF4m6mbAR1aOSS6hZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774470039; c=relaxed/simple;
	bh=EJf9EH03K048GnQyciGn9nJ/4njlCY8sY9h7aSYy5jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=d/hwnw7DXZ71R5AFbQeXXCrtvFgOKDmscmEvalotQF+3a31/4Ma6W+uZ9Qw+wCSvMBWMNpapeMzBt22kwDRMBsextEGh8G4w2MfQoWoEFcWtHyC2rZfeue+sMkjxFXxIAkj8x6on8EibsojxQ1FTYudKAy2gjaUoASKU56Lwwjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/sHWhQC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469B9C4CEF7;
	Wed, 25 Mar 2026 20:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774470038;
	bh=EJf9EH03K048GnQyciGn9nJ/4njlCY8sY9h7aSYy5jQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=R/sHWhQCzYd+ZF4ClNbFtPpjz3TwD6fZXZ1sS0wPW8AqP3rl0tovUYaWdonKVWaiJ
	 OwlrlLGPKyQJzjTcNTMD7KHdXAJOjy/Pgec4iK1sQUwsjoZifIZYI5uC0jTlzEGcLG
	 18viuyai68dZgzN8F87qzLT1SkxhJdMLTx9dm/6064TjKTmgnptwvlSI/XP/fcRtl4
	 giL0rQUFbbUETMdG05uXbW4WH5fvuqaOMDFtm2P7I5VMCeTlaQAU4irvLB2JumoxMH
	 16eIDSTM+Evjf3AQNa1cthVdIu/mws4vSuaCZCJQTTLQFydtFozsiRGP5ZJm2cF9Ry
	 tmA3OJZNW4eqw==
Date: Wed, 25 Mar 2026 15:20:37 -0500
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
Subject: Re: [PATCH v6 13/27] PCI: of: Remove fwnode_dev_initialized() call
 for a PCI root bridge node
Message-ID: <20260325202037.GA1291636@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325143555.451852-14-herve.codina@bootlin.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,glider.be,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,microchip.com,bootlin.com];
	TAGGED_FROM(0.00)[bounces-34172-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[63];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 31AE932BDD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 03:35:40PM +0100, Herve Codina wrote:
> During the instantiation of devices described by a device-tree overlay
> applied on a PCI device, devlink displays the following kind of debug
> messages instead of creating the expected links:
>    'Not linking xxxx - might never become dev'
> 
> Without those expected links, the device removal order cannot be
> correct.
> 
> Those debug traces are printed by fw_devlink_create_devlink(). In our
> use case, they are all printed because the supplier of the link has at
> least one of its ancestor with its fwnode flag FWNODE_FLAG_INITIALIZED
> set.
> 
> The culprit ancestor is the PCI root bridge.
> 
> The fwnode related to the PCI root bridge is created dynamically by the
> of_pci_make_host_bridge_node() function. During this creation
> fwnode_dev_initialized() is called which set the FWNODE_FLAG_INITIALIZED
> flag.
> 
> Calling fwnode_dev_initialized() tells devlink that the device related
> to this node is handled out of the driver core. This is not correct in
> our case. Indeed the device related to this firmware node is handled
> using driver core mechanisms and is fully compliant devlink
> expectations.
> 
> Simply remove the fwnode_dev_initialized() call. With that done, the
> devlink debug messages are no more displayed and links that were missing
> are correctly created.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

I would ordinarily make sure the person who added
fwnode_dev_initialized() here was ok with its removal, but it looks
like you added this with 1f340724419e ("PCI: of: Create device tree
PCI host bridge node"), so I assume you're ok with removing it :)

I suppose there could be a "Fixes: 1f340724419e" tag, but maybe
there's no need to backport this anywhere?

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/of.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index b694fcda16b1..0993257fe025 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -811,7 +811,6 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
>  	 */
>  	of_node_set_flag(np, OF_POPULATED);
>  	fw_devlink_set_device(&np->fwnode, &bridge->dev);
> -	fwnode_dev_initialized(&np->fwnode, true);
>  
>  	ret = of_changeset_apply(cset);
>  	if (ret)
> -- 
> 2.53.0
> 

