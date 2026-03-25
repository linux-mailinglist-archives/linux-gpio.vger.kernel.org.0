Return-Path: <linux-gpio+bounces-34152-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPE7A1P2w2lZvAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34152-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 15:50:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD947327241
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 15:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FF05307CE1A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 14:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8433FA5E0;
	Wed, 25 Mar 2026 14:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x9aXYJt2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6853F880D;
	Wed, 25 Mar 2026 14:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449669; cv=none; b=TuX0341W1v9wC1/A5xtxpiKIvjB4we4hpYJUD18qevouA886U+iblQG/VSjPxk/gAExYDpWJ6OVDvnQxd7sJiaO613QLBE7F20jNbJ0HxTXFNc27YoC3gBY8hvUThvN8sk3V3zIVLem7AiLSnaP2Ym9NOrJGqoSA66aOebnKMvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449669; c=relaxed/simple;
	bh=uDuPgt2o/9oBQHh+Cpy7Gf83um6TASnvbhCiTbvCQdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vC5dYS6C44c08CXHiVn4h8xI68VPk4hJ/Kv7LSNTO7Ax/dpPQKAILKhwUo1gAanYIPO6k6P7mCUR9z0hw11NWS3Qy1HhUaTlLY6hIhDxdDofdIJ4bCcR0n9ZKExm9n8wQ9So+L/STUaAGyV+w2aRaukML9h+08yZPnXqXJBgGtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x9aXYJt2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 371411A2FE8;
	Wed, 25 Mar 2026 14:41:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 05245601FA;
	Wed, 25 Mar 2026 14:41:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F96E104513C1;
	Wed, 25 Mar 2026 15:40:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774449661; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EB2C+jRFMxDkKtJvrc3FzQhnrQCg9ZYzY6GBMb2A8G4=;
	b=x9aXYJt2Xgv4kB01GyPszWYFEN17VsPTuRWho3EM5oIObrs0bojHjDhISOKnG44m1DMxNq
	cKQJDZLmCapQChTQoa3OODYY+pV9TVmx+9r2a1wgUgaAXGCgOsYXiXVRNoih0o25MH/3Fc
	MGwNg9BPQmrmMvUjiRSJxCoactYMhwFr7lQUqyE9QjOGv6YC/kIA9QXZRIxrN+qsbAaGeQ
	aKwIxzVON7u5qPOVEvBm8Em5pWnL1+NdeOnjZHFydwFiUarG2Xc/wCG2XUwBwISErwUn2f
	ysLd8Zbxa66++hAPrjNqzamzw69xul/RiuxCwgrNipfI3j+0AvjiRJ2e4Ea7CQ==
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
Subject: [PATCH v6 16/27] i2c: mux: Create missing devlink between mux and adapter physical device
Date: Wed, 25 Mar 2026 15:35:43 +0100
Message-ID: <20260325143555.451852-17-herve.codina@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,kernel.org,glider.be,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,bootlin.com,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com];
	TAGGED_FROM(0.00)[bounces-34152-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: DD947327241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When removing an i2c controller device handling an i2c bus where an i2c
mux is connected to, the removal process hangs and is stuck in the
wait_completion() call done in i2c_del_adapter().

The i2c_del_adapter() tries to removed the i2c adapter related to the
i2c controller device and the wait_completion() is waiting for the i2c
adapter device release. This release is performed when the device is no
more used (i.e. refcount reaches zero).

When an i2c mux is involved in an i2c path, the struct dev topology is
the following:

    +----------------+                +-------------------+
    | i2c controller |                |      i2c mux      |
    |     device     |                |      device       |
    |       ^        |                |                   |
    |       |        |                |                   |
    |  dev's parent  |                |                   |
    |       |        |                |                   |
    |   i2c adapter  |                | i2c adapter chanX |
    |     device  <---- dev's parent ------  device       |
    |   (no driver)  |                |    (no driver)    |
    +----------------+                +-------------------+

When an i2c mux device creates an i2c adapter for its downstream
channel, a reference is taken to its adapter dev's parent. This parent
is the i2c mux upstream adapter device.

No relationship exists between the i2c mux device itself and the i2c
controller device (physical device) in order to have the i2c mux device
calling i2c_del_adapter() to remove its downstream adapters and so,
release references taken to the upstream adapter.

This consumer/supplier relationship is typically a devlink relationship.

Also, i2c muxes can be chained and so, the upstream adapter can be
supplied by either an i2c controller device or an other i2c mux device.

In order to get the physical device of the adapter a mux is connected
to, rely on the newly introduced i2c_adapter_get_physdev() and create
the missing devlink between the i2c mux device and the physical
device of the adapter the mux is connected to.

With that done, the i2c mux device is removed before the device
handling the upstream i2c adapter (i2c controller device or i2c mux
device). All references are released and the i2c_del_adapter() call
performed by driver handling the upstream adapter device is not blocking
anymore.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/i2c/i2c-mux.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index f4e73e7a0e33..26470a7c2eea 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -268,7 +268,9 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			u32 force_nr, u32 chan_id)
 {
 	struct i2c_adapter *parent = muxc->parent;
+	struct device *parent_physdev;
 	struct i2c_mux_priv *priv;
+	struct device_link *dl;
 	char symlink_name[20];
 	int ret;
 
@@ -375,6 +377,29 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 				      ACPI_COMPANION(muxc->dev),
 				      chan_id);
 
+	/*
+	 * There is no relationship set between the mux device and the physical
+	 * device handling the parent adapter. Create this missing relationship
+	 * in order to remove the i2c mux device (consumer) and so the dowstream
+	 * channel adapters before removing the physical device (supplier) which
+	 * handles the i2c mux upstream adapter.
+	 */
+	parent_physdev = i2c_get_adapter_physdev(parent);
+	if (!parent_physdev) {
+		dev_err(muxc->dev, "failed to get the parent physical device\n");
+		ret = -ENODEV;
+		goto err_free_priv;
+	}
+	dl = device_link_add(muxc->dev, parent_physdev, DL_FLAG_AUTOREMOVE_CONSUMER);
+	if (!dl) {
+		dev_err(muxc->dev, "failed to create device link to %s\n",
+			dev_name(parent_physdev));
+		put_device(parent_physdev);
+		ret = -EINVAL;
+		goto err_free_priv;
+	}
+	put_device(parent_physdev);
+
 	if (force_nr) {
 		priv->adap.nr = force_nr;
 		ret = i2c_add_numbered_adapter(&priv->adap);
-- 
2.53.0


