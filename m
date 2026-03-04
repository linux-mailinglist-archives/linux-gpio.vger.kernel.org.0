Return-Path: <linux-gpio+bounces-32469-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJsvODgPqGk8ngAAu9opvQ
	(envelope-from <linux-gpio+bounces-32469-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 11:53:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB781FE939
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 11:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A879303BCF2
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 10:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F9C3A872B;
	Wed,  4 Mar 2026 10:53:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E4C327C13;
	Wed,  4 Mar 2026 10:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772621588; cv=none; b=j3jHsqUqOBAYxh7gJ6KG6vrezKEjMMneyS+l7wc0u4SknW2BRjzEJTBme/BirXDzpyKTuKk/RpC0F87RqYv5f84OEvIpzEixwxWBsOfxcspd53sJHuxcHk8tqBTUbfXUruk+yxPL7TCJDEEXMUBNF2v4YnGb19s3IlrfNYj9d20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772621588; c=relaxed/simple;
	bh=tcV49X/JAb34urSmnDTKf/4IDOMPf5hDp28Mv3t7iK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KmCZYprpZ7a7WmXObgY4kB1WVy8w/4E+U6sFPss0EYe01XcdUxxD0/gNV+55nGX7QSXz0XVpL+2LUkZZmVTpewZEgl25O7CvBMq8yAZTqNYqRGe4goBKYztKWYrLNXmB/1Gc813JtY0VGGmyab7Yd3YMpJSO7IblHdPyHbXo0lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: esmtpgz13t1772621574t43f1ba0e
X-QQ-Originating-IP: bF95SnyJPhpCU+vPEfPOX3r0ID2Gdk3VtDgP43UV918=
Received: from localhost.localdomain ( [219.147.0.82])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 18:52:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1907336305703571190
EX-QQ-RecipientCnt: 8
From: Jialu Xu <xujialu@vimux.org>
To: xujialu@vimux.org
Cc: brgl@kernel.org,
	kees@kernel.org,
	krzk@kernel.org,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 2/3] nfc: nfcmrvl: convert to gpio descriptors
Date: Wed,  4 Mar 2026 18:52:14 +0800
Message-ID: <CA580932FEA8793A+20260304105215.536399-3-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304105215.536399-1-xujialu@vimux.org>
References: <7187C401290C256B+20260304084808.440955-1-xujialu@vimux.org>
 <20260304105215.536399-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MHoF0S2/etBdG3LifaSEN9sNzl0kFaHr2TfLCB46PGojc6q47TG2k3cH
	vKrPYgX7YnQgDqGRPA4d8A222B5fgQSjbqs9i03mME8bRxnoOqJj7AOiitULwKPktyUJAz3
	V7MQaneB3HSPbnE0BS2ugo3J9gRXRds4+1TXXPRG3uJHB0smWOK60Ymi3dVmWInLiX2/bRe
	+BBxCim1KyQkAUVsbux2vLUcRmAuEWcDzwhobhQUa82tiGx0CKYB/VYal2nmur3hjs2l5Um
	LFpcOmS1h1O0A58D0qvxK42/iPIbvM9h4d2agG8xFV2U74T0YFoIZS/k193nr80T5bJRv7L
	maMw8R7AIDxf/ykXMuBHbhZDBy2KtBUGp/CnpezeU2v12KwT2aiTITvQsg9D6rtKoTJiXqQ
	PXOqb+V/Zjr4My5btco2sFr/id2KHB2lwOZIWQFztdZ8nQj09uY1y7IPuwn/f971NjgsNMe
	6cug1WmDsnVrEMZc2nlugnp7dJIQUohZsEiAiwleQ4kR+YfEVjVw1K/z2yMB+APhRLNtar7
	SCBbSVteVNTXm9VKN4Fznnp1qKr5LKPM5Y0MzN8MdD6cCIPOdKEQrsr0SyxuRkMbStalvk9
	jvW5xDq9YMEU1WAKSQ8hdqOd+QzqEieJgTn6u5MXBHXucvrnOB7T93bZeAiZ8DY2AGd5oEa
	NulA4bGbg69YwKOnKIxAdZSzryrDLby20vavInNp/0mQs5ilwVupNob/Ye9+SbxdwMKYmi0
	QrgfMyAt/bzlA9gZ5/H3PPVbv4yHtb6d8QingsjCBF7MR3A3VKQj11oWSjNW9AkYraGHYxl
	QkPsOGsVJLKG2h56bt/KA6O43MsQIK5Av9ZOF/v3+E8QuhMvQAeYZJdfqNOuVB7earz70dd
	t+3IYZxn6SjJX9sxKaXm22pMp8eFmtf4hg+9b6PIruZdwj/OSqLQCtz2+swzGP+4o7ky1bk
	3R0LCDKt17NvjRXF15mc1wQqYNJKOiPThCUmZGrx3jZE5Adtycw4J+NrQ/mzuD931/AzVzs
	1vknUM//atFU8jJA676s/eQVOkSMGfL7BxH+3dViJ39LiMoZMo77xdfkGYSOk=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 1AB781FE939
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32469-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vimux.org:mid,vimux.org:email]
X-Rspamd-Action: no action

Use <linux/gpio/consumer.h> instead of <linux/of_gpio.h>.

Signed-off-by: Jialu Xu <xujialu@vimux.org>
---
 drivers/nfc/nfcmrvl/main.c    | 46 ++++++++++++-----------------------
 drivers/nfc/nfcmrvl/nfcmrvl.h |  4 ++-
 drivers/nfc/nfcmrvl/uart.c    | 23 ++++++++++++------
 drivers/nfc/nfcmrvl/usb.c     |  2 +-
 4 files changed, 35 insertions(+), 40 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index c51d22e4579c1..46cc1386ad3bc 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -6,9 +6,9 @@
  */
 
 #include <linux/module.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
-#include <linux/of_gpio.h>
+#include <linux/of.h>
 #include <linux/nfc.h>
 #include <net/nfc/nci.h>
 #include <net/nfc/nci_core.h>
@@ -112,13 +112,12 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 
 	memcpy(&priv->config, pdata, sizeof(*pdata));
 
-	if (gpio_is_valid(priv->config.reset_n_io)) {
-		rc = gpio_request_one(priv->config.reset_n_io,
-				      GPIOF_OUT_INIT_LOW,
-				      "nfcmrvl_reset_n");
-		if (rc < 0) {
-			priv->config.reset_n_io = -EINVAL;
-			nfc_err(dev, "failed to request reset_n io\n");
+	if (!priv->config.reset_gpio) {
+		priv->config.reset_gpio =
+			devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+		if (IS_ERR(priv->config.reset_gpio)) {
+			priv->config.reset_gpio = NULL;
+			nfc_err(dev, "failed to get reset gpio\n");
 		}
 	}
 
@@ -144,7 +143,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 	if (!priv->ndev) {
 		nfc_err(dev, "nci_allocate_device failed\n");
 		rc = -ENOMEM;
-		goto error_free_gpio;
+		goto error_free;
 	}
 
 	rc = nfcmrvl_fw_dnld_init(priv);
@@ -171,9 +170,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 	nfcmrvl_fw_dnld_deinit(priv);
 error_free_dev:
 	nci_free_device(priv->ndev);
-error_free_gpio:
-	if (gpio_is_valid(priv->config.reset_n_io))
-		gpio_free(priv->config.reset_n_io);
+error_free:
 	kfree(priv);
 	return ERR_PTR(rc);
 }
@@ -189,9 +186,6 @@ void nfcmrvl_nci_unregister_dev(struct nfcmrvl_private *priv)
 
 	nfcmrvl_fw_dnld_deinit(priv);
 
-	if (gpio_is_valid(priv->config.reset_n_io))
-		gpio_free(priv->config.reset_n_io);
-
 	nci_free_device(ndev);
 	kfree(priv);
 }
@@ -233,34 +227,24 @@ void nfcmrvl_chip_reset(struct nfcmrvl_private *priv)
 	/* Reset possible fault of previous session */
 	clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);
 
-	if (gpio_is_valid(priv->config.reset_n_io)) {
+	if (priv->config.reset_gpio) {
 		nfc_info(priv->dev, "reset the chip\n");
-		gpio_set_value(priv->config.reset_n_io, 0);
+		gpiod_set_value(priv->config.reset_gpio, 0);
 		usleep_range(5000, 10000);
-		gpio_set_value(priv->config.reset_n_io, 1);
+		gpiod_set_value(priv->config.reset_gpio, 1);
 	} else
 		nfc_info(priv->dev, "no reset available on this interface\n");
 }
 
 void nfcmrvl_chip_halt(struct nfcmrvl_private *priv)
 {
-	if (gpio_is_valid(priv->config.reset_n_io))
-		gpio_set_value(priv->config.reset_n_io, 0);
+	if (priv->config.reset_gpio)
+		gpiod_set_value(priv->config.reset_gpio, 0);
 }
 
 int nfcmrvl_parse_dt(struct device_node *node,
 		     struct nfcmrvl_platform_data *pdata)
 {
-	int reset_n_io;
-
-	reset_n_io = of_get_named_gpio(node, "reset-n-io", 0);
-	if (reset_n_io < 0) {
-		pr_info("no reset-n-io config\n");
-	} else if (!gpio_is_valid(reset_n_io)) {
-		pr_err("invalid reset-n-io GPIO\n");
-		return reset_n_io;
-	}
-	pdata->reset_n_io = reset_n_io;
 	pdata->hci_muxed = of_property_read_bool(node, "hci-muxed");
 
 	return 0;
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index f61a99e553db0..62fa77d587b2b 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -10,6 +10,8 @@
 
 #include "fw_dnld.h"
 
+struct gpio_desc;
+
 /* Define private flags: */
 #define NFCMRVL_NCI_RUNNING			1
 #define NFCMRVL_PHY_ERROR			2
@@ -54,7 +56,7 @@ struct nfcmrvl_platform_data {
 	 */
 
 	/* GPIO that is wired to RESET_N signal */
-	int reset_n_io;
+	struct gpio_desc *reset_gpio;
 	/* Tell if transport is muxed in HCI one */
 	bool hci_muxed;
 
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 2037cd6d4f4f4..6ea28340bb58e 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/printk.h>
@@ -20,7 +21,6 @@
 static unsigned int hci_muxed;
 static unsigned int flow_control;
 static unsigned int break_control;
-static int reset_n_io = -EINVAL;
 
 /*
  * NFCMRVL NCI OPS
@@ -62,9 +62,11 @@ static const struct nfcmrvl_if_ops uart_ops = {
 };
 
 static int nfcmrvl_uart_parse_dt(struct device_node *node,
-				 struct nfcmrvl_platform_data *pdata)
+				 struct nfcmrvl_platform_data *pdata,
+				 struct device *dev)
 {
 	struct device_node *matched_node;
+	struct gpio_desc *reset_gpio;
 	int ret;
 
 	matched_node = of_get_compatible_child(node, "marvell,nfc-uart");
@@ -84,6 +86,16 @@ static int nfcmrvl_uart_parse_dt(struct device_node *node,
 	pdata->flow_control = of_property_read_bool(matched_node, "flow-control");
 	pdata->break_control = of_property_read_bool(matched_node, "break-control");
 
+	reset_gpio = devm_fwnode_gpiod_get_optional(dev,
+					of_fwnode_handle(matched_node),
+					"reset", GPIOD_OUT_LOW,
+					"nfcmrvl_reset_n");
+	if (IS_ERR(reset_gpio)) {
+		of_node_put(matched_node);
+		return PTR_ERR(reset_gpio);
+	}
+	pdata->reset_gpio = reset_gpio;
+
 	of_node_put(matched_node);
 
 	return 0;
@@ -107,13 +119,13 @@ static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 	 */
 
 	if (dev && dev->parent && dev->parent->of_node)
-		if (nfcmrvl_uart_parse_dt(dev->parent->of_node, &config) == 0)
+		if (nfcmrvl_uart_parse_dt(dev->parent->of_node, &config, dev) == 0)
 			pdata = &config;
 
 	if (!pdata) {
 		pr_info("No platform data / DT -> fallback to module params\n");
 		config.hci_muxed = hci_muxed;
-		config.reset_n_io = reset_n_io;
+		config.reset_gpio = NULL;
 		config.flow_control = flow_control;
 		config.break_control = break_control;
 		pdata = &config;
@@ -201,6 +213,3 @@ MODULE_PARM_DESC(break_control, "Tell if UART driver must drive break signal.");
 
 module_param(hci_muxed, uint, 0);
 MODULE_PARM_DESC(hci_muxed, "Tell if transport is muxed in HCI one.");
-
-module_param(reset_n_io, int, 0);
-MODULE_PARM_DESC(reset_n_io, "GPIO that is wired to RESET_N signal.");
diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index ea73094530968..ac62358445bf8 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -294,7 +294,7 @@ static int nfcmrvl_probe(struct usb_interface *intf,
 
 	/* No configuration for USB */
 	memset(&config, 0, sizeof(config));
-	config.reset_n_io = -EINVAL;
+	config.reset_gpio = NULL;
 
 	nfc_info(&udev->dev, "intf %p id %p\n", intf, id);
 
-- 
2.47.3


