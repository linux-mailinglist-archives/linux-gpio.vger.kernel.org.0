Return-Path: <linux-gpio+bounces-34160-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ONhNpQBxGm0vQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34160-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 16:39:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B11332835D
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 16:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F11B531385B8
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 14:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA433FE67A;
	Wed, 25 Mar 2026 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eJ4BmFcA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CFD3E63A0;
	Wed, 25 Mar 2026 14:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449809; cv=none; b=Kv4HcHjZl8pX6ynGcyiZM54kZdvJPz6dZl5Gwj5O4dsm2qzLHj9wgzHRWZiWjOAcs2QZDFHKxTbNxKdPlVTGQq0ylZk8Czmyz8BbCZX+pTSBMEBT6kJ6VSJ6WLKt9mzjXlPB+ubj4qjHwY3gb/ESkHJq/UNWgzHGuEitY1TgoWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449809; c=relaxed/simple;
	bh=NTK3i5tT9QWPEOEZ2JcdNqTuIHC5BhBkEo4P1dG/bNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2bDfLdkW3ctjJSYDlpu1pIL+Gd8kJ2oAVFc/JnZIX3bX9d6HiwyFob4zeETnJPt/CoLsYukVqj0HduaAvGxfIhwNA0bU2kdSfdYZ36YqptZQb4iGEfDfrkxwTtS7RaSUGLae9TUr6KkYwBFWMmnLoftjE3vn+3WYX3yZ7qIdzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eJ4BmFcA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E9BB01A2F95;
	Wed, 25 Mar 2026 14:43:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F3A3601FA;
	Wed, 25 Mar 2026 14:43:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A1EE10451522;
	Wed, 25 Mar 2026 15:43:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774449800; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dyU2PMsXAmj3EbT2+UZQ+YSlvbKU0N9ZIMJJlxdw490=;
	b=eJ4BmFcAjAHO1RljChWdOyoj3omI/HuwZmTpXXHQa1umyn9qPlvXMX0qFWHX41OtrKkEA1
	GvBSGgfM4yrx92BviPWee8JItzhEODZaOjL49ET1ZPQJiTDPdWu67AmxZcwfgAM7RHexh8
	BBfjF9gNBx3YobP5vg27CSbfUTTHQgebXMzwb/Y9URTy9Fp70//V99F42kh0Q7vhs0OoVB
	ZvGI2Rl+HJieKsxTPvtA4ZlBtkBHUg3o5akZuVa9XdzJTMNomY3mmyUIb3q7OOjh9BmaDO
	wfp9AO3ccuHOnRdShguOtsQSJoF8butGZEl8ck8Nswog14Pj0jSZOuIP7WrmCw==
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
Subject: [PATCH v6 24/27] misc: lan966x_pci: Introduce board specific data
Date: Wed, 25 Mar 2026 15:35:51 +0100
Message-ID: <20260325143555.451852-25-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325143555.451852-1-herve.codina@bootlin.com>
References: <20260325143555.451852-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,kernel.org,glider.be,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,bootlin.com,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com];
	TAGGED_FROM(0.00)[bounces-34160-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lunn.ch:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 9B11332835D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
and this overlay is directly referenced in lan966x_pci_load_overlay().

This avoid to use the code for an other board.

In order to be more generic and to allow support for other boards (PCI
Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
it to PCI Vendor/Device IDs handled by the driver.

This structure contains information related to the PCI board such as
information related to the dtbo describing the board we have to load.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/misc/lan966x_pci.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/lan966x_pci.c b/drivers/misc/lan966x_pci.c
index e6d1fce0b116..041e92f924c4 100644
--- a/drivers/misc/lan966x_pci.c
+++ b/drivers/misc/lan966x_pci.c
@@ -18,10 +18,6 @@
 #include <linux/pci_ids.h>
 #include <linux/slab.h>
 
-/* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
-extern char __dtbo_lan966x_evb_lan9662_nic_begin[];
-extern char __dtbo_lan966x_evb_lan9662_nic_end[];
-
 struct pci_dev_intr_ctrl {
 	struct pci_dev *pci_dev;
 	struct irq_domain *irq_domain;
@@ -118,17 +114,23 @@ static int devm_pci_dev_create_intr_ctrl(struct pci_dev *pdev)
 	return devm_add_action_or_reset(&pdev->dev, devm_pci_dev_remove_intr_ctrl, intr_ctrl);
 }
 
+struct lan966x_pci_info {
+	void *dtbo_begin;
+	void *dtbo_end;
+};
+
 struct lan966x_pci {
 	struct device *dev;
 	int ovcs_id;
+	const struct lan966x_pci_info *info;
 };
 
 static int lan966x_pci_load_overlay(struct lan966x_pci *data)
 {
-	u32 dtbo_size = __dtbo_lan966x_evb_lan9662_nic_end - __dtbo_lan966x_evb_lan9662_nic_begin;
-	void *dtbo_start = __dtbo_lan966x_evb_lan9662_nic_begin;
+	const struct lan966x_pci_info *info = data->info;
 
-	return of_overlay_fdt_apply(dtbo_start, dtbo_size, &data->ovcs_id, dev_of_node(data->dev));
+	return of_overlay_fdt_apply(info->dtbo_begin, info->dtbo_end - info->dtbo_begin,
+				    &data->ovcs_id, dev_of_node(data->dev));
 }
 
 static void lan966x_pci_unload_overlay(struct lan966x_pci *data)
@@ -169,6 +171,9 @@ static int lan966x_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	pci_set_drvdata(pdev, data);
 	data->dev = dev;
+	data->info = (const struct lan966x_pci_info *)id->driver_data;
+	if (!data->info)
+		return -EINVAL;
 
 	ret = lan966x_pci_load_overlay(data);
 	if (ret)
@@ -196,8 +201,17 @@ static void lan966x_pci_remove(struct pci_dev *pdev)
 	lan966x_pci_unload_overlay(data);
 }
 
+/* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
+extern char __dtbo_lan966x_evb_lan9662_nic_begin[];
+extern char __dtbo_lan966x_evb_lan9662_nic_end[];
+
+static struct lan966x_pci_info evb_lan9662_nic_info = {
+	.dtbo_begin = __dtbo_lan966x_evb_lan9662_nic_begin,
+	.dtbo_end = __dtbo_lan966x_evb_lan9662_nic_end,
+};
+
 static struct pci_device_id lan966x_pci_ids[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_EFAR, PCI_DEVICE_ID_EFAR_LAN9662) },
+	{ PCI_DEVICE_DATA(EFAR, LAN9662, &evb_lan9662_nic_info) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, lan966x_pci_ids);
-- 
2.53.0


