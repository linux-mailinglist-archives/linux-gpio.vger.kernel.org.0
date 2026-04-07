Return-Path: <linux-gpio+bounces-34835-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCyGKQtJ1Wk44AcAu9opvQ
	(envelope-from <linux-gpio+bounces-34835-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:12:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9053B2D1C
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1170305A428
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 18:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6023D1CD1;
	Tue,  7 Apr 2026 18:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggWzSJFT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257AA1F4CA9;
	Tue,  7 Apr 2026 18:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775585374; cv=none; b=m6xdbRhc0Pz9A3IhRqDEq7Qu9p7i4fyTQtdjvSj5tt3FisJ3pN8XSaoo710eifcFE2buNNnY0DEfZQvd29Orz5iR1hQ0RkN7TFIIfUuoPg9W3ukRkIrXZyvq7M/wV1qfmHSP9bDWFSZ0VbU76MkRMU/uPh3rGZ0DSJPFJumw0lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775585374; c=relaxed/simple;
	bh=6+TXhFe1ZLkWZlJdqPKfzqrTGxVXq539FFUaAib5kcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIOYBhSfpeF9eqfOMlt9LffRKzjs+zLsEYXz08hGOsRuZcKZ7ibyBiAKqG0yHnK7zCfdAkwNuKo+hqGvKzHdwAsirLe9Jpj6YmHoHwvEQJbty2n0D0mzMMkbj2E8KkkEgux1dm4nf8ynhN9R7PcpfHuDHOAw06eJvFtDpxPUJsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggWzSJFT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E86C116C6;
	Tue,  7 Apr 2026 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775585374;
	bh=6+TXhFe1ZLkWZlJdqPKfzqrTGxVXq539FFUaAib5kcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ggWzSJFTesIwd2YhKNu1ymWX+Ta4kTPTPY/3h9dlBpdCpYSbEFsbI0H7e9rSlT5gs
	 Dao5q1Oa7o6HCCAUXtV9dfxMsY+RSsuhceg6FMyGrDJkgcPprSBxYixpt2oL06fUXR
	 fjuRo2v5yqgnbv1bCJBrEFqu7JP6qlhp1w4VGWAoJt/7Hrhhki1cVd9WNdne4rtWTB
	 tyuXA6AzboaLz0+HNY0y87qaeiqnHvvfAcNZ1m6C4p2aarv/pooDxIA23mF/3H/an3
	 YzUeOAvZpqtqjMW5M1jIqPurebCAO7fqtckQaFMzzFVE4qnEZeH025Kb6A4AATN2Kk
	 V0UFuhMW9MWcQ==
Date: Tue, 7 Apr 2026 13:09:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-acpi@vger.kernel.org,
	Daniel Scally <djrscally@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Fabio Estevam <festevam@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Linus Walleij <linusw@kernel.org>, imx@lists.linux.dev,
	linux-gpio@vger.kernel.org, patches@opensource.cirrus.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>, linux-pm@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>, Len Brown <lenb@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	driver-core@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Kalle Niemi <kaleposti@gmail.com>, linux-cxl@vger.kernel.org,
	Alison Schofield <alison.schofield@intel.com>,
	linux-clk@vger.kernel.org, linux-pci@vger.kernel.org,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v6 17/27] of: property: Allow fw_devlink device-tree on
 x86
Message-ID: <177558537013.3212080.6337028648731238779.robh@kernel.org>
References: <20260325143555.451852-1-herve.codina@bootlin.com>
 <20260325143555.451852-18-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325143555.451852-18-herve.codina@bootlin.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arndb.de,vger.kernel.org,gmail.com,opensource.cirrus.com,linux.intel.com,huawei.com,intel.com,bootlin.com,kernel.org,linaro.org,microchip.com,lists.linux.dev,lunn.ch,glider.be,lists.infradead.org,linuxfoundation.org,cirrus.com,google.com,stgolabs.net,pengutronix.de,baylibre.com,nxp.com,sang-engineering.com,axentia.se];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34835-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 1E9053B2D1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 15:35:44 +0100, Herve Codina wrote:
> PCI drivers can use a device-tree overlay to describe the hardware
> available on the PCI board. This is the case, for instance, of the
> LAN966x PCI device driver.
> 
> Adding some more nodes in the device-tree overlay adds some more
> consumer/supplier relationship between devices instantiated from this
> overlay.
> 
> Those fw_node consumer/supplier relationships are handled by fw_devlink
> and are created based on the device-tree parsing done by the
> of_fwnode_add_links() function.
> 
> Those consumer/supplier links are needed in order to ensure a correct PM
> runtime management and a correct removal order between devices.
> 
> For instance, without those links a supplier can be removed before its
> consumers is removed leading to all kind of issue if this consumer still
> want the use the already removed supplier.
> 
> The support for the usage of an overlay from a PCI driver has been added
> on x86 systems in commit 1f340724419ed ("PCI: of: Create device tree PCI
> host bridge node").
> 
> In the past, support for fw_devlink on x86 had been tried but this
> support has been removed in commit 4a48b66b3f52 ("of: property: Disable
> fw_devlink DT support for X86"). Indeed, this support was breaking some
> x86 systems such as OLPC system and the regression was reported in [0].
> 
> Instead of disabling this support for all x86 system, use a finer grain
> and disable this support only for the possible problematic subset of x86
> systems (at least OLPC and CE4100).
> 
> Those systems use a device-tree to describe their hardware. Identify
> those systems using key properties in the device-tree.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Link: https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/ [0]
> ---
>  drivers/of/property.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 

Applied, thanks!


