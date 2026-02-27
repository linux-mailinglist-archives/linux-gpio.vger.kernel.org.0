Return-Path: <linux-gpio+bounces-32293-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCDqJmKkoWl/vQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32293-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 15:04:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE891B84F9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 15:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B6A1312ECCD
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 13:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F82640B6EA;
	Fri, 27 Feb 2026 13:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sRsAUCuc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82903806A5
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 13:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772200752; cv=none; b=cmu4dCAGd6Yzqk60QgC0ryCGuvNFZzWBBBETXY5ZiG8HCxsbZLQyHIDX03eV8p4CW0kwjYqJIgUH3qHes8/djFB73aJOnshUodkBNTXUmxftP3E/IRnbs5wvbuacoH3td/9qjSPk4+6+j90Y21zqmPUwVr3075eRDZAwuxXXH38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772200752; c=relaxed/simple;
	bh=4h2yYuYVfm6Oq6yHMs3qtFJ1/EsJ3+lJviBvaZ2hC1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbRc6OS+3hGIMu83KmDmV0yYVlH/DM0t0WpWUbKi8Q5GnUU9vP6wHSJ8D5GOYB3psI8UTuULXlhJY6Cho2HHIljESUIUxbgDQIc9ggWVgpz9VMIa2p30BBk2bTXOmy74fLm4dqb0GkvJk8N4wN3J63Y9eGJG0IAP1OTyHeRPxnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sRsAUCuc; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B104B1A118A
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 13:59:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 803D45FE46;
	Fri, 27 Feb 2026 13:59:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFF1A10369456;
	Fri, 27 Feb 2026 14:58:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772200745; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=mvCVCaNxt5yWvSG+f0bAkdIRx8+iR7I3Ow45RsOxmKI=;
	b=sRsAUCucLArHhC5akY1MgM0rty4I4OOrOF40Zx6aMIFKT8TOp2kCKFJfKEERLxx+Et3k6g
	Uj0H1jU/AP5Tl2dJgQ8L0dKDSnrfPaQvztwHhevaPXWWVvmek3SxZ5hn2pB/WQz3+5XTNL
	F9PPlaEmiRcnhA9/9OfiIPfsaRpQTeZCgxYeZMU2mpSz7gBNaJ3MPLBjAWK2YI2g5JTthg
	MuHsaX9pp1lM9xaP+py25cCbImVVn8Wdjk7DhPRr4TK9h1LwWVCZ/rkPe+1nLlfO5X5DeF
	rpO29UkhLjN/kUjeUr9XFQFnn54MkbqzkLjLxh4BL2s0S6r3QPyuOA39XtaJyQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Len Brown <lenb@kernel.org>,
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
	Shawn Guo <shawnguo@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 14/28] PCI: of: Remove fwnode_dev_initialized() call for a PCI root bridge node
Date: Fri, 27 Feb 2026 14:54:11 +0100
Message-ID: <20260227135428.783983-15-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227135428.783983-1-herve.codina@bootlin.com>
References: <20260227135428.783983-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,kernel.org,glider.be,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,bootlin.com,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com];
	TAGGED_FROM(0.00)[bounces-32293-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[63];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email]
X-Rspamd-Queue-Id: 1CE891B84F9
X-Rspamd-Action: no action

During the instantiation of devices described by a device-tree overlay
applied on a PCI device, devlink displays the following kind of debug
messages instead of creating the expected links:
   'Not linking xxxx - might never become dev'

Without those expected links, the device removal order cannot be
correct.

Those debug traces are printed by fw_devlink_create_devlink(). In our
use case, they are all printed because the supplier of the link has at
least one of its ancestor with its fwnode flag FWNODE_FLAG_INITIALIZED
set.

The culprit ancestor is the PCI root bridge.

The fwnode related to the PCI root bridge is created dynamically by the
of_pci_make_host_bridge_node() function. During this creation
fwnode_dev_initialized() is called which set the FWNODE_FLAG_INITIALIZED
flag.

Calling fwnode_dev_initialized() tells devlink that the device related
to this node is handled out of the driver core. This is not correct in
our case. Indeed the device related to this firmware node is handled
using driver core mechanisms and is fully compliant devlink
expectations.

Simply remove the fwnode_dev_initialized() call. With that done, the
devlink debug messages are no more displayed and links that were missing
are correctly created.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/pci/of.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index b694fcda16b1..0993257fe025 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -811,7 +811,6 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
 	 */
 	of_node_set_flag(np, OF_POPULATED);
 	fw_devlink_set_device(&np->fwnode, &bridge->dev);
-	fwnode_dev_initialized(&np->fwnode, true);
 
 	ret = of_changeset_apply(cset);
 	if (ret)
-- 
2.53.0


