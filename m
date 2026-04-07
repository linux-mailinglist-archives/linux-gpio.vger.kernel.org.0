Return-Path: <linux-gpio+bounces-34834-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNwZNJZI1Wk44AcAu9opvQ
	(envelope-from <linux-gpio+bounces-34834-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:10:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 459133B2CC4
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17D3230807AE
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 18:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75AB83BAD98;
	Tue,  7 Apr 2026 18:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jjj+5nNZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8A13CF03B;
	Tue,  7 Apr 2026 18:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775585193; cv=none; b=O80f/U1kBp8uzWs4PhV6LOpVjHEvRs3iARgZokQm7tM17iHUgW1fzDISVhjQcHUSGj2avTbmzIHiyUDzRgWSAEA0c8NgmRWfz0JSMfaG1+w0Wiqh3b80VtNYGOwFvzJWSaO+IBpn/U3PmQXcZkjK8wCLrb39kcNb7Mby7+9VCJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775585193; c=relaxed/simple;
	bh=rE/S8sXacEZvPrxZTF9QP8OJ12EbZTJXA+T9P3zUtIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Er0BQUiDyEz9IX1g8WitzPaFgAJ+PDFlMkFg9rIfdzXvUeV0gs70lCxPJcIrUvG88BkigtpVCVwqd+QU9Nkcp1YwfSyLW4CjgNLHgfANiM0Exz4yLqDhs+DKdwGJ1PcSvDf+LKR8vndNN/DprzOe3pLKZ/KT772Q8EwpwEZc97E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jjj+5nNZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7912CC116C6;
	Tue,  7 Apr 2026 18:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775585192;
	bh=rE/S8sXacEZvPrxZTF9QP8OJ12EbZTJXA+T9P3zUtIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jjj+5nNZeVO6S/izZL6Hm/LvTGb/DIf7KcD5DEbkT9djs0v3EgNthYfp1MPeI8J8X
	 pkGnv8wxDoY4F7s+XjbQUPTQPi9C7fmzAKEft7MpBX27UBLACrKZ2EWIHd6E14frHZ
	 0s5Dq1xfyZHj/hMBBJcwqohAtRvfRFeC74YU5kOAoLmuHB4rzBD+6T0PAL2JxhREEW
	 DmV1grH/t06uIFol7CdbzFASJUXuH9fZQyg3c3YVM6wNdU9tWmCQV+0zrAJ8vWTbQV
	 lKR2lOdBAEgAceUpp4zmEtwCfKMWbJFfPnkZWfSnluSR1fzFm26eNaDbC0taoPxqs6
	 muUxCwHktAJ0w==
Date: Tue, 7 Apr 2026 13:06:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Daniel Scally <djrscally@gmail.com>, Mark Brown <broonie@kernel.org>,
	linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	David Rhodes <david.rhodes@cirrus.com>,
	Michael Turquette <mturquette@baylibre.com>, imx@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ira Weiny <ira.weiny@intel.com>, Dave Jiang <dave.jiang@intel.com>,
	Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alison Schofield <alison.schofield@intel.com>,
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-cxl@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-spi@vger.kernel.org, patches@opensource.cirrus.com,
	Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Fabio Estevam <festevam@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	Steen Hegelund <steen.hegelund@microchip.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Frank Li <Frank.Li@nxp.com>, Wolfram Sang <wsa@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Andi Shyti <andi.shyti@kernel.org>, linux-gpio@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Peter Rosin <peda@axentia.se>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v6 02/27] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
Message-ID: <177558519048.3200719.13441877339906679105.robh@kernel.org>
References: <20260325143555.451852-1-herve.codina@bootlin.com>
 <20260325143555.451852-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325143555.451852-3-herve.codina@bootlin.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,pengutronix.de,cirrus.com,baylibre.com,lists.linux.dev,arndb.de,bootlin.com,linux.intel.com,lists.infradead.org,google.com,intel.com,lunn.ch,linaro.org,opensource.cirrus.com,sang-engineering.com,glider.be,microchip.com,huawei.com,linuxfoundation.org,nxp.com,stgolabs.net,axentia.se];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34834-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 459133B2CC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 15:35:29 +0100, Herve Codina wrote:
> From: Saravana Kannan <saravanak@google.com>
> 
> When an overlay is applied, if the target device has already probed
> successfully and bound to a device, then some of the fw_devlink logic
> that ran when the device was probed needs to be rerun. This allows newly
> created dangling consumers of the overlayed device tree nodes to be
> moved to become consumers of the target device.
> 
> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Link: https://lore.kernel.org/lkml/20240411235623.1260061-3-saravanak@google.com/
> [Herve: Rebase on top of recent kernel]
> [Herve: Add the call to driver_deferred_probe_trigger()]
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Tested-by: Kalle Niemi <kaleposti@gmail.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/base/core.c    | 83 +++++++++++++++++++++++++++++++++++++-----
>  drivers/of/overlay.c   | 15 ++++++++
>  include/linux/fwnode.h |  1 +
>  3 files changed, 90 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


