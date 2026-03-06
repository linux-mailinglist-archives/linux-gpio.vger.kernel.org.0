Return-Path: <linux-gpio+bounces-32625-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFDcB49RqmlNPQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32625-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 05:01:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A17221B5AF
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 05:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12C3B307AA33
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 04:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C855F36C594;
	Fri,  6 Mar 2026 04:00:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BBC36CDE8;
	Fri,  6 Mar 2026 04:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772769637; cv=none; b=oKagUo0sBLIeW/7pwGA7PD7TjwGm0OMY301n9Gsin/gRIY7TCbVRc1s4eNYj3IDlgfGTEsJdsdXEhPo63RLHGxVdJJ3a3Ukrdhr81vWmBMGCJr810cacyYuZwR7vHQ43Rf25gz2PXebUHw0jtzwAy4WqXfm2vY+u2pj6TTISaeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772769637; c=relaxed/simple;
	bh=L25gbdqO4EIyeFfbP7Ndz4vjAj3Benv3OagOxYWI82Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qrq/gJg8/nddlkcZ0XDYPB9+KGPkhVoThiDgMH6msZ1FO6HN0QAjVvu1oNOXE4UB5sv9S+u1nMoP4QrDhMFojHrbRzeQ4v3hdIbpgLS39088dPxr7zd8M8ih2MIpoIV7xqS2oN9rhhFHh54SjJ07cY5HqVmPESrwqeFmSAlgchc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: esmtpsz19t1772769621t644cb599
X-QQ-Originating-IP: Kj0+tNddUFM2kEotjm27sffUVu2bj6SOp3bGFiUH8MI=
Received: from localhost.localdomain ( [119.167.27.18])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Mar 2026 12:00:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11925164406285336032
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
Subject: [PATCH v3 2/3] nfc: nfcmrvl: convert to gpio descriptors
Date: Fri,  6 Mar 2026 11:59:11 +0800
Message-ID: <A3CB5E4EB1A5B1D5+20260306035909.2447844-5-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <D5F95320CE72E20A+20260306035539.2443355-2-xujialu@vimux.org>
References: <D5F95320CE72E20A+20260306035539.2443355-2-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MkzgycXnWlOXfoCrf3vxMfivI6JVmON551quIaGMMEjXwe4FyrU/x28O
	a9BbIuxTYXwhliEb+BrmYKqkpi8Ump8blLVAb9sjxCyKAGroQnTukp8AZr732rres1zfRsq
	O/MrMabCT1NWPCv5Y4eX0VlE8iBZeiFeIwj8nfm0ye0OhIwo95JwVJKFJ6zvNqkLlt5mqLM
	1omTyuwezZei1oai8lE/h+2xjPlW75LpbDGQm4LWwzdU+5GBCX1W7aOUytSsfOKl+PUN6er
	jXe+YFagTJEz1S+rJNZzrIND/gUAS9gEYNV8wYBNMy14Qc+OV9hyipRiN7BojGZE4PNNoz4
	F4ID4waorLPtHMFOtV4OLQCKvY3RS5ySYHtNL8bZbfVz2pl3jMVtD06+V22/IN9s17UWvPE
	4/5Yd2W68OiYW2OJgBtz1f/zBKceG5lp7/JJPm4GqkbMO1/oTuEvyUKue7mZyxWY4+rNEFm
	43SNPGKZkOm0D25/ycfnhsxMBhUEw1qNYrHe83vCv61ky3vz1iZiEW+yNzaZap7pSMK/+05
	I5VYKPs/SxqJXjqLl2ohLk7PU1InPxotgLYUeH9CV2LAq+WUso8ljMOVAhJpkumzgSUt9xJ
	l3cTTg8DWPYXlNXtI3yZTDB7j46QvptJ/oXxAt7DJ2BtREayNV84Z8Y1LXR8n3vNOgTopRu
	SxFRlPbHbEKfEp5ambDSlPIV565IEr+6gQC4U6HZpiSYei41S6lAcZUoa5foqX9FEXv6Wq0
	HVWmPJ8JL2wkrF8rcPJN4jPIYs9aNgH/b8tYQAbfzCfPPpExvhKnWf64dczmBaRFwOfKu0m
	eoyc/A0y4Yv+k9RW5aPhu2StsALRlGLwnqLi0oYKsaMDeEXSh4lIkMsDQD1nZMS0cb2gEHP
	lg4yZ1QU24b2tnw458IaAi8sJjLS0P6cM35/lm2nPaEQByj0LLdaMOO1HhrQxEHdYdFhGGT
	yZqMj0FiQbeqdOnUfVOic9VAWKP6toljuxPL73yNM3WiOvkFvDgYyHQO+JKLEml5fEkz/ZQ
	INU+o9lClPEDcVihmENSd1beaQhKzUoeqWPzwrX/ky5pgQaYmM
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 7A17221B5AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.992];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-32625-lists,linux-gpio=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Replace the legacy of_get_named_gpio() / gpio_request_one() /
gpio_set_value() API with the descriptor-based devm_gpiod_get_optional() /
gpiod_set_value() API from <linux/gpio/consumer.h>, removing the
dependency on <linux/of_gpio.h>.

The "reset-n-io" property rename quirk already exists in gpiolib-of.c
(added in commit 9c2cc7171e08), so no additional quirk is needed.

Signed-off-by: Jialu Xu <xujialu@vimux.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
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


