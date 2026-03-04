Return-Path: <linux-gpio+bounces-32442-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPFBBkfyp2mGmgAAu9opvQ
	(envelope-from <linux-gpio+bounces-32442-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 09:50:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F22501FCE7F
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 09:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 892D53035433
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 08:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905B037EFEE;
	Wed,  4 Mar 2026 08:49:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AC137C107;
	Wed,  4 Mar 2026 08:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614147; cv=none; b=a/SXUndPmo3K2pvL2IgtwVigPHQCJoBJeR10Kbu9JakZ8nSDSEiT3Oo6z82yY3AIFVIz/PP4RH9viSAoujRQSsmSj9z+BuGSx5jUY0JreRc5wejCu4CS8f1wj7bi457558Jv0etYxCUVQiWRkNERaqkaFInTXr2F+6G1lQvIZQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614147; c=relaxed/simple;
	bh=tcV49X/JAb34urSmnDTKf/4IDOMPf5hDp28Mv3t7iK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Th9BYoZmkARk/y1FoE4J86KRKjXpU5O50ACrQwUaiUD01evmqXx9YPJ10NHq8ObN/S6b89XH2QnvvOF08OkTuiv4Tyn1LiZiKfK9minMUmPVo6/7XbXMfJRuyuQdGx8Wh/XZSnK4Ub365vLTTS9aRNwVTRluHLjQebr8PYs5Jn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: esmtpgz14t1772614121t30463b50
X-QQ-Originating-IP: UWSUaDzx7RgRqUe9RAikLyaCo4+eP42IlSSRBg+2Rg8=
Received: from localhost.localdomain ( [119.167.27.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 16:48:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3445775976997814441
EX-QQ-RecipientCnt: 8
From: Jialu Xu <xujialu@vimux.org>
To: linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	krzk@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	Jialu Xu <xujialu@vimux.org>
Subject: [PATCH 2/3] nfc: nfcmrvl: convert to gpio descriptors
Date: Wed,  4 Mar 2026 16:47:03 +0800
Message-ID: <4C2D1422EF70337D+20260304084808.440955-3-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304084808.440955-1-xujialu@vimux.org>
References: <20260304084808.440955-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NmLSSBvc6ehkSPs452R9zTfVujBUT9XXpmol4qyhkuzT3i6vtgry3aFC
	fWgiNDrMeasiSsu1xpDiTplAf/mwD8MNkof3zlxtD/U0LBarOF2jZvWi8fcr/NCzf3N1+/W
	KNYxkI7AXtFpHseXoFP/VqsKqFlxScO6KORZ685Ec7CHn0jZpJcxj36HhOQ1uOsvktO/ajq
	X3ZzXpd+iGE9JkG59cY/Aod65Rn6Y3OgrUUg/fIY84aU/zD/GMwpFd2oEhncrbe1UnpOur4
	P30QBDWDf9GJL15sqiy9RZkLalvJztOhbZnDIvCpX9JHGmEolm3oyYhZ4/lV0trVYZodr2M
	d/c6XelArg3mIS97DqUr2dY+BIYWFTzK10vKADeT0M1R+SVDQyuh3tbGM5r4fnOJcdUljrD
	BQLfhFXjhnCAeBJGUaPOLNe1MDEzzJ/3iq7cp/DmpUDzMDMXkegsSbV3sXnzkxRHodRjThb
	i6MCiUVhkF5JMKGi5V6uAZi7ih/IG5fI2yv2SPtkqFd4PIGCbj43MzxL0XY1y09liuGv+cB
	P47oWEEWMjBsc8hQtR2STSC2pmnxzpLLtvLfJ152cyLL5IWJTedpOYWnv8RPh16Bo5aH4kD
	QrgzKujrk3TyJKLGM/J53XmtdUB9LItM6ePcfWl/uO6a7wuqsWgjCQ5ybP/Tt0F0J5+9oD2
	MOW+JolmtY0Z4fKtH9B5Iln79nxzRcXuqKnpP4bfl51dygn0Yt+KseteH8yOkdktpfXn6IQ
	meHP1HMIzSyOb0uu2se7OJ07fAU4+/sXdH0chR+yGWm9B9Tr4hT1UdPtk3iNBHZWKvDOZnt
	cQUsYI7BFFN4TzOc+FRn7TEFtGR7UK28A9g+HRxcQ92Ogy7vbqEAx8CXXa84Az5bOUfm8cL
	Qh3TQXTPfCL3hlNqYlI8Tg1OH9nhpQ/g5/GdspGi46YIQc0vSmb1sVj/tutvA5qv+LZujeF
	OO5IgHf+MrBch2YiMYZ2fgZEIELNconIlI3OpXfr6oa9ZNSidNp5hHWHGZegDFLpnjjHsQ6
	dyXPBAlGqmQxECt5ZVLHpthh4ZoebituY5+1x1F/sbyzXGxZhz9NaMAPHP6knfagOzeufUl
	bdePXWHHsMTlkj548LoAUg=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: F22501FCE7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32442-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
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


