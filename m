Return-Path: <linux-gpio+bounces-34832-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJcjMS9I1Wk44AcAu9opvQ
	(envelope-from <linux-gpio+bounces-34832-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:08:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 537BA3B2C2C
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B024305E9B3
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 18:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F053CE492;
	Tue,  7 Apr 2026 18:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FT6o4QO5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F95138F92A;
	Tue,  7 Apr 2026 18:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775585149; cv=none; b=sCgX/xzJwcQqE5egDENszEOHH0ABgzU31axRuqJZ8z9JY96ceUbz/xtZ5eqOlaP48/m2s8CEd/5Mj7+2jl0cCxojod2UP//Lx9ePozyXns0dDGOMDywFvNnGxQa1eZnLMkEb8MdPvQt9sLYptbaFr7ef8SDInE9FTDW4bCP6qLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775585149; c=relaxed/simple;
	bh=xt6bQFaZkziKEja3cx5H6ul4Y+8lOIrHlDmaJw5Arbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScByvjJ7LjB/Oxg3c5DXs4jfVFdqUotyjOnqKPzpM0g3Ft4HTIY+DOJbvVyzqEm5W9dFVUjg2fk+fPnWFeXRPZklf2OIYAjMOW1mQWzaBtRF0/oYbDrJw3kHkmuKIpmDKExdDXDlxsWPoAQESOpuArcFZSuCwfXsEQt8ORuumnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FT6o4QO5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7486C116C6;
	Tue,  7 Apr 2026 18:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775585149;
	bh=xt6bQFaZkziKEja3cx5H6ul4Y+8lOIrHlDmaJw5Arbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FT6o4QO5wNrYII9rEoqg7nF9XMVQR2yTrSrAFuB0uCiAZ/yhCtlaLN7FDAhNeAwYl
	 9hfQ7kulLTJViuovijYyoHhv/xdOSUp/8+doDamMQqp+RBPczyV9D+HoUHk5WrdGZ0
	 DnOVdY2VO6NEHdAlUuQxZ3Agp9mI+YgL+BfINjSmLyiS3uM8uP4bBlryqR/WbeeQyo
	 rBY37K3qZJLwSvx+YE1/vOImxaunU5UxveyvbkH0XU1RwAyUnXbhmTz470RHu5rfcY
	 YPOUK5jubZDpFOEVh1lQ+4C/crI9pBJKzxMASTo/UfjCScCl/hdcUmZ3kcJug5cbRk
	 eLjVNU6E8VITw==
Date: Tue, 7 Apr 2026 13:05:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-cxl@vger.kernel.org, Kalle Niemi <kaleposti@gmail.com>,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	Len Brown <lenb@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>, imx@lists.linux.dev,
	linux-sound@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Stephen Boyd <sboyd@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Peter Rosin <peda@axentia.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Davidlohr Bueso <dave@stgolabs.net>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Frank Li <Frank.Li@nxp.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	driver-core@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-acpi@vger.kernel.org,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	patches@opensource.cirrus.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Saravana Kannan <saravanak@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v6 01/27] Revert "treewide: Fix probing of devices in DT
 overlays"
Message-ID: <177558507711.3193287.10314595512020403538.robh@kernel.org>
References: <20260325143555.451852-1-herve.codina@bootlin.com>
 <20260325143555.451852-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325143555.451852-2-herve.codina@bootlin.com>
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linaro.org,huawei.com,bootlin.com,gmail.com,intel.com,lists.linux.dev,google.com,pengutronix.de,opensource.cirrus.com,axentia.se,glider.be,stgolabs.net,microchip.com,nxp.com,sang-engineering.com,linux.intel.com,arndb.de,cirrus.com,baylibre.com,lists.infradead.org,lunn.ch,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34832-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 537BA3B2C2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 15:35:28 +0100, Herve Codina wrote:
> From: Saravana Kannan <saravanak@google.com>
> 
> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
> 
> While the commit fixed fw_devlink overlay handling for one case, it
> broke it for another case. So revert it and redo the fix in a separate
> patch.
> 
> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Link: https://lore.kernel.org/lkml/20240411235623.1260061-2-saravanak@google.com/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/bus/imx-weim.c    | 6 ------
>  drivers/i2c/i2c-core-of.c | 5 -----
>  drivers/of/dynamic.c      | 1 -
>  drivers/of/platform.c     | 5 -----
>  drivers/spi/spi.c         | 5 -----
>  5 files changed, 22 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


