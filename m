Return-Path: <linux-gpio+bounces-24096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 087E7B1EC02
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 549F3189CE0F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AAB28726C;
	Fri,  8 Aug 2025 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEifatNV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9796728469C;
	Fri,  8 Aug 2025 15:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666645; cv=none; b=Ig6zoEIkPjioL6fF2HVWwzxli2iB/dwvUxQns8TD7vVi5/OY9/OV1Mna4L/Y678SiUSC08Ku8exVzLsmKt0QeogEBpjiPDcoEw4oLf8fR9huXZ2eo6yPzQWs9ff3j+m0QxU3QWNeaqOE9yXi7hSmmLWGZxMK1q77MP61q4YDXmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666645; c=relaxed/simple;
	bh=OKtBXU0nNWNrwQXXB3tXCDTVM8U2MxpSOes2aJ6zmRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AXdO2N0GTAr6ERCMvWKmYkbJeYuZO1svVKVcOy/J4dL0ogqm3amHJ/mFHy4E/peYENgHXm7rl6Kdnf+jzglXbPIdVRNEbJzcIOAURP03c6QEM2Q+tgOhcCnDidZMzUr37Nl66i9mRldCUd6ohW8TQt3hyelW1e5iPjHmNeS1UPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEifatNV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D09CC4CEF7;
	Fri,  8 Aug 2025 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666645;
	bh=OKtBXU0nNWNrwQXXB3tXCDTVM8U2MxpSOes2aJ6zmRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TEifatNViLOS3YrW69LbPQxoLCMwCwzYH9OnnOX0WYM0GtSpRgiIfIQg/KsUxcWAP
	 IhicAru2V0LDRSooIPTCpC2Ko8rwY2DlZjNoM4Mei5w37vWC1+0nmXzDGNT8XWQYfr
	 7SLiZkXMzWdps6BDRr3TlzYFcVZxt9EjpQeLyb76S/s000zm5DWIKWH0XbMVpdpUT2
	 PQz/5zPq6I45fjpBGctM5h7NTHnqXM2RhVN/7tYfPV3I+t3v8T1SrzJO5l19y4vFJj
	 VPGjYfnNfIzflTOOHIWvh7PjbRmgeQtQRsea73kTamNQmb90eEVsgxSb7mna139pj3
	 JfDJ+AU+CaSRA==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/21] nfc: marvell: convert to gpio descriptors
Date: Fri,  8 Aug 2025 17:18:01 +0200
Message-Id: <20250808151822.536879-18-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The only reason this driver seems to still use the legacy gpio
numbers is for the module parameter that lets users pass a different
reset gpio.

Since the fixed numbers are on their way out, and none of the platforms
this driver is used on would have them any more, remove the module
parameter and instead just use the reset information from firmware.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/nfc/nfcmrvl/main.c    | 47 +++++++++++------------------------
 drivers/nfc/nfcmrvl/nfcmrvl.h |  5 ++--
 drivers/nfc/nfcmrvl/uart.c    |  5 ----
 drivers/nfc/nfcmrvl/usb.c     |  1 -
 4 files changed, 18 insertions(+), 40 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 141bc4b66dcb..1b465a19a262 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -6,7 +6,7 @@
  */
 
 #include <linux/module.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/of_gpio.h>
 #include <linux/nfc.h>
@@ -112,14 +112,10 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 
 	memcpy(&priv->config, pdata, sizeof(*pdata));
 
-	if (gpio_is_valid(priv->config.reset_n_io)) {
-		rc = gpio_request_one(priv->config.reset_n_io,
-				      GPIOF_OUT_INIT_LOW,
-				      "nfcmrvl_reset_n");
-		if (rc < 0) {
-			priv->config.reset_n_io = -EINVAL;
-			nfc_err(dev, "failed to request reset_n io\n");
-		}
+	priv->reset_n_io = gpiod_get_optional(dev, "reset-n-io", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->reset_n_io)) {
+		nfc_err(dev, "failed to get reset_n gpio\n");
+		return ERR_CAST(priv->reset_n_io);
 	}
 
 	if (phy == NFCMRVL_PHY_SPI) {
@@ -172,8 +168,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 error_free_dev:
 	nci_free_device(priv->ndev);
 error_free_gpio:
-	if (gpio_is_valid(priv->config.reset_n_io))
-		gpio_free(priv->config.reset_n_io);
+	gpiod_put(priv->reset_n_io);
 	kfree(priv);
 	return ERR_PTR(rc);
 }
@@ -189,8 +184,7 @@ void nfcmrvl_nci_unregister_dev(struct nfcmrvl_private *priv)
 
 	nfcmrvl_fw_dnld_deinit(priv);
 
-	if (gpio_is_valid(priv->config.reset_n_io))
-		gpio_free(priv->config.reset_n_io);
+	gpiod_put(priv->reset_n_io);
 
 	nci_free_device(ndev);
 	kfree(priv);
@@ -232,35 +226,24 @@ void nfcmrvl_chip_reset(struct nfcmrvl_private *priv)
 {
 	/* Reset possible fault of previous session */
 	clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);
+	if (!priv->reset_n_io)
+		return;
 
-	if (gpio_is_valid(priv->config.reset_n_io)) {
-		nfc_info(priv->dev, "reset the chip\n");
-		gpio_set_value(priv->config.reset_n_io, 0);
-		usleep_range(5000, 10000);
-		gpio_set_value(priv->config.reset_n_io, 1);
-	} else
-		nfc_info(priv->dev, "no reset available on this interface\n");
+	nfc_info(priv->dev, "reset the chip\n");
+	gpiod_set_value(priv->reset_n_io, 0);
+	usleep_range(5000, 10000);
+	gpiod_set_value(priv->reset_n_io, 1);
 }
 
 void nfcmrvl_chip_halt(struct nfcmrvl_private *priv)
 {
-	if (gpio_is_valid(priv->config.reset_n_io))
-		gpio_set_value(priv->config.reset_n_io, 0);
+	if (priv->reset_n_io)
+		gpiod_set_value(priv->reset_n_io, 0);
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
index f61a99e553db..156f46e1581f 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -53,8 +53,6 @@ struct nfcmrvl_platform_data {
 	 * Generic
 	 */
 
-	/* GPIO that is wired to RESET_N signal */
-	int reset_n_io;
 	/* Tell if transport is muxed in HCI one */
 	bool hci_muxed;
 
@@ -83,6 +81,9 @@ struct nfcmrvl_private {
 	/* Platform configuration */
 	struct nfcmrvl_platform_data config;
 
+	/* RESET_N GPIO line */
+	struct gpio_desc *reset_n_io;
+
 	/* Parent dev */
 	struct nci_dev *ndev;
 
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 2037cd6d4f4f..cb2da7a1d91f 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -20,7 +20,6 @@
 static unsigned int hci_muxed;
 static unsigned int flow_control;
 static unsigned int break_control;
-static int reset_n_io = -EINVAL;
 
 /*
  * NFCMRVL NCI OPS
@@ -113,7 +112,6 @@ static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 	if (!pdata) {
 		pr_info("No platform data / DT -> fallback to module params\n");
 		config.hci_muxed = hci_muxed;
-		config.reset_n_io = reset_n_io;
 		config.flow_control = flow_control;
 		config.break_control = break_control;
 		pdata = &config;
@@ -201,6 +199,3 @@ MODULE_PARM_DESC(break_control, "Tell if UART driver must drive break signal.");
 
 module_param(hci_muxed, uint, 0);
 MODULE_PARM_DESC(hci_muxed, "Tell if transport is muxed in HCI one.");
-
-module_param(reset_n_io, int, 0);
-MODULE_PARM_DESC(reset_n_io, "GPIO that is wired to RESET_N signal.");
diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index ea7309453096..4cf19433fde1 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -294,7 +294,6 @@ static int nfcmrvl_probe(struct usb_interface *intf,
 
 	/* No configuration for USB */
 	memset(&config, 0, sizeof(config));
-	config.reset_n_io = -EINVAL;
 
 	nfc_info(&udev->dev, "intf %p id %p\n", intf, id);
 
-- 
2.39.5


