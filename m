Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2C6C2FA163
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 14:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392134AbhARNYl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 08:24:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:38224 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391605AbhARMdk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Jan 2021 07:33:40 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E719EB941;
        Mon, 18 Jan 2021 12:32:56 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     u.kleine-koenig@pengutronix.de
Cc:     f.fainelli@gmail.com, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        wahrenst@gmx.net, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        devel@driverdev.osuosl.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-rpi-kernel@lists.infradead.org, bgolaszewski@baylibre.com,
        andy.shevchenko@gmail.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH v7 02/11] firmware: raspberrypi: Introduce devm_rpi_firmware_get()
Date:   Mon, 18 Jan 2021 13:32:35 +0100
Message-Id: <20210118123244.13669-3-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118123244.13669-1-nsaenzjulienne@suse.de>
References: <20210118123244.13669-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It'll simplify the firmware handling for most consumers.

Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

---
Changes since v4:
 - Rearrange function calls for clarity, same functionality

Changes since v2:
- Create devm_rpi_firmware_get()

 drivers/firmware/raspberrypi.c             | 29 ++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h |  8 ++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index b65e4c495772..250e01680742 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -243,6 +243,13 @@ void rpi_firmware_put(struct rpi_firmware *fw)
 }
 EXPORT_SYMBOL_GPL(rpi_firmware_put);
 
+static void devm_rpi_firmware_put(void *data)
+{
+	struct rpi_firmware *fw = data;
+
+	rpi_firmware_put(fw);
+}
+
 static int rpi_firmware_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -331,6 +338,28 @@ struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node)
 }
 EXPORT_SYMBOL_GPL(rpi_firmware_get);
 
+/**
+ * devm_rpi_firmware_get - Get pointer to rpi_firmware structure.
+ * @firmware_node:    Pointer to the firmware Device Tree node.
+ *
+ * Returns NULL is the firmware device is not ready.
+ */
+struct rpi_firmware *devm_rpi_firmware_get(struct device *dev,
+					   struct device_node *firmware_node)
+{
+	struct rpi_firmware *fw;
+
+	fw = rpi_firmware_get(firmware_node);
+	if (!fw)
+		return NULL;
+
+	if (devm_add_action_or_reset(dev, devm_rpi_firmware_put, fw))
+		return NULL;
+
+	return fw;
+}
+EXPORT_SYMBOL_GPL(devm_rpi_firmware_get);
+
 static const struct of_device_id rpi_firmware_of_match[] = {
 	{ .compatible = "raspberrypi,bcm2835-firmware", },
 	{},
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index fdfef7fe40df..73ad784fca96 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -142,6 +142,8 @@ int rpi_firmware_property_list(struct rpi_firmware *fw,
 			       void *data, size_t tag_size);
 void rpi_firmware_put(struct rpi_firmware *fw);
 struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node);
+struct rpi_firmware *devm_rpi_firmware_get(struct device *dev,
+					   struct device_node *firmware_node);
 #else
 static inline int rpi_firmware_property(struct rpi_firmware *fw, u32 tag,
 					void *data, size_t len)
@@ -160,6 +162,12 @@ static inline struct rpi_firmware *rpi_firmware_get(struct device_node *firmware
 {
 	return NULL;
 }
+
+static inline struct rpi_firmware *devm_rpi_firmware_get(struct device *dev,
+					struct device_node *firmware_node)
+{
+	return NULL;
+}
 #endif
 
 #endif /* __SOC_RASPBERRY_FIRMWARE_H__ */
-- 
2.29.2

