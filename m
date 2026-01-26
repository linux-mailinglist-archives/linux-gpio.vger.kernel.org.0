Return-Path: <linux-gpio+bounces-31079-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNDaMmF6d2n7ggEAu9opvQ
	(envelope-from <linux-gpio+bounces-31079-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:29:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 345D88976F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8D5D3029E54
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 14:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3302433DEE6;
	Mon, 26 Jan 2026 14:28:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09D33D6FC
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437700; cv=none; b=gv1xdguZV3banV29Sc8sxmH7IR5GKFdlC3nv+2s+nJ7HlYo+2nwe0KHCLcwIE0wsH/z5Z2VdcSmj5mAwrNe6Jmo5QqUQA9BNwcOB/dhtJCDitmI2O9eRiOFTQM7suL6QIvpjZGINU78q5e3ETYSII3x4P3gBoYwttNrUBgVA4qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437700; c=relaxed/simple;
	bh=hed4B1IJGogoL4LdQBPX/Dy5Ad4DXbOkUc2K2kShzGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BECQyY3eMMgC/LgKSrmJjdyq3Mfghmv8X4Qumkt84USm1sDGlbshLFoeB3Mcnwm73DEsmroyHh0z8J8n4qNb726woTUICnxEbnmRjzwnf+Bo8Q1T38r9gntv7ckzDN1cUUhQ9ndzRc9Gu0l6ricDAoptqcOmf0I9oke9IRvqefA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vkNZe-0008IN-AG; Mon, 26 Jan 2026 15:28:14 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Mon, 26 Jan 2026 15:27:47 +0100
Subject: [PATCH v2 1/2] gpiolib: introduce devm_fwnode_gpiod_get_optional()
 wrapper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-1-ec34f8e35077@pengutronix.de>
References: <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-0-ec34f8e35077@pengutronix.de>
In-Reply-To: <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-0-ec34f8e35077@pengutronix.de>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Stefan Kerkmann <s.kerkmann@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31079-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 345D88976F
X-Rspamd-Action: no action

From: Stefan Kerkmann <s.kerkmann@pengutronix.de>

The helper makes it easier to handle optional GPIOs and simplifies the
error handling code.

Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- Add kerneldoc for devm_fwnode_gpiod_get_optional
---
 include/linux/gpio/consumer.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index cafeb7a40ad1..0d8408582918 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -607,6 +607,42 @@ struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					   flags, label);
 }
 
+/**
+ * devm_fwnode_gpiod_get_optional - obtain an optional GPIO from firmware node
+ * @dev:	GPIO consumer
+ * @fwnode:	handle of the firmware node
+ * @con_id:	function within the GPIO consumer
+ * @flags:	GPIO initialization flags
+ * @label:	label to attach to the requested GPIO
+ *
+ * This function can be used for drivers that get their configuration
+ * from opaque firmware.
+ *
+ * GPIO descriptors returned from this function are automatically disposed on
+ * driver detach.
+ *
+ * Returns:
+ * The GPIO descriptor corresponding to the optional function @con_id of device
+ * dev, NULL if no GPIO has been assigned to the requested function, or
+ * another IS_ERR() code if an error occurred while trying to acquire the GPIO.
+ */
+static inline
+struct gpio_desc *devm_fwnode_gpiod_get_optional(struct device *dev,
+						 struct fwnode_handle *fwnode,
+						 const char *con_id,
+						 enum gpiod_flags flags,
+						 const char *label)
+{
+	struct gpio_desc *desc;
+
+	desc = devm_fwnode_gpiod_get_index(dev, fwnode, con_id, 0,
+					   flags, label);
+	if (IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
+		return NULL;
+
+	return desc;
+}
+
 struct acpi_gpio_params {
 	unsigned int crs_entry_index;
 	unsigned short line_index;

-- 
2.47.3


