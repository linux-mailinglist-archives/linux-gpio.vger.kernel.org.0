Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 295111CC068
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 12:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgEIKkY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 06:40:24 -0400
Received: from inva021.nxp.com ([92.121.34.21]:44350 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726877AbgEIKkX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 9 May 2020 06:40:23 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1FEE42002EE;
        Sat,  9 May 2020 12:40:21 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 700A1200102;
        Sat,  9 May 2020 12:40:17 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id CFBE640285;
        Sat,  9 May 2020 18:40:12 +0800 (SGT)
From:   Hui Song <hui.song_1@nxp.com>
To:     jagdish.gediya@nxp.com, priyanka.jain@nxp.com,
        pramod.kumar_1@nxp.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        "hui.song" <hui.song_1@nxp.com>
Subject: [PATCH v1 1/3] gpio: mpc8xxx: support fsl-layerscape platform.
Date:   Sat,  9 May 2020 18:35:35 +0800
Message-Id: <20200509103537.22865-1-hui.song_1@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "hui.song" <hui.song_1@nxp.com>

Make the MPC8XXX gpio driver to support the fsl-layerscape.

Signed-off-by: hui.song <hui.song_1@nxp.com>
---
 drivers/gpio/mpc8xxx_gpio.c | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/gpio/mpc8xxx_gpio.c b/drivers/gpio/mpc8xxx_gpio.c
index 1dfd22522c..466f5f50cf 100644
--- a/drivers/gpio/mpc8xxx_gpio.c
+++ b/drivers/gpio/mpc8xxx_gpio.c
@@ -12,6 +12,8 @@
 #include <dm.h>
 #include <mapmem.h>
 #include <asm/gpio.h>
+#include <asm/io.h>
+#include <dm/of_access.h>
 
 struct ccsr_gpio {
 	u32	gpdir;
@@ -20,6 +22,7 @@ struct ccsr_gpio {
 	u32	gpier;
 	u32	gpimr;
 	u32	gpicr;
+	u32	gpibe;
 };
 
 struct mpc8xxx_gpio_data {
@@ -49,31 +52,51 @@ inline u32 gpio_mask(uint gpio)
 
 static inline u32 mpc8xxx_gpio_get_val(struct ccsr_gpio *base, u32 mask)
 {
+#if CONFIG_ARM
+	return in_le32(&base->gpdat) & mask;
+#else
 	return in_be32(&base->gpdat) & mask;
+#endif
 }
 
 static inline u32 mpc8xxx_gpio_get_dir(struct ccsr_gpio *base, u32 mask)
 {
+#if CONFIG_ARM
+	return in_le32(&base->gpdir) & mask;
+#else
 	return in_be32(&base->gpdir) & mask;
+#endif
 }
 
 static inline int mpc8xxx_gpio_open_drain_val(struct ccsr_gpio *base, u32 mask)
 {
+#if CONFIG_ARM
+	return in_le32(&base->gpodr) & mask;
+#else
 	return in_be32(&base->gpodr) & mask;
+#endif
 }
 
 static inline void mpc8xxx_gpio_open_drain_on(struct ccsr_gpio *base, u32
 					      gpios)
 {
+#if CONFIG_ARM
+	setbits_le32(&base->gpodr, gpios);
+#else
 	/* GPODR register 1 -> open drain on */
 	setbits_be32(&base->gpodr, gpios);
+#endif
 }
 
 static inline void mpc8xxx_gpio_open_drain_off(struct ccsr_gpio *base,
 					       u32 gpios)
 {
+#if CONFIG_ARM
+	clrbits_le32(&base->gpodr, gpios);
+#else
 	/* GPODR register 0 -> open drain off (actively driven) */
 	clrbits_be32(&base->gpodr, gpios);
+#endif
 }
 
 static int mpc8xxx_gpio_direction_input(struct udevice *dev, uint gpio)
@@ -81,9 +104,13 @@ static int mpc8xxx_gpio_direction_input(struct udevice *dev, uint gpio)
 	struct mpc8xxx_gpio_data *data = dev_get_priv(dev);
 	u32 mask = gpio_mask(gpio);
 
+#if CONFIG_ARM
+	clrbits_le32(&data->base->gpdir, mask);
+#else
 	/* GPDIR register 0 -> input */
 	clrbits_be32(&data->base->gpdir, mask);
 
+#endif
 	return 0;
 }
 
@@ -100,10 +127,19 @@ static int mpc8xxx_gpio_set_value(struct udevice *dev, uint gpio, int value)
 		data->dat_shadow &= ~mask;
 	}
 
+#if CONFIG_ARM
+	gpdir = in_le32(&base->gpdir);
+#else
 	gpdir = in_be32(&base->gpdir);
+#endif
 	gpdir |= gpio_mask(gpio);
+#if CONFIG_ARM
+	out_le32(&base->gpdat, gpdir & data->dat_shadow);
+	out_le32(&base->gpdir, gpdir);
+#else
 	out_be32(&base->gpdat, gpdir & data->dat_shadow);
 	out_be32(&base->gpdir, gpdir);
+#endif
 
 	return 0;
 }
@@ -147,13 +183,29 @@ static int mpc8xxx_gpio_ofdata_to_platdata(struct udevice *dev)
 {
 	struct mpc8xxx_gpio_plat *plat = dev_get_platdata(dev);
 	fdt_addr_t addr;
+	u32 i;
+#if CONFIG_ARM
+	u32 reg[4];
+
+	dev_read_u32_array(dev, "reg", reg, 4);
+#else
 	u32 reg[2];
 
 	dev_read_u32_array(dev, "reg", reg, 2);
+#endif
+
+#if CONFIG_ARM
+	for (i = 0; i < 2; i++)
+		reg[i] = be32_to_cpu(reg[i]);
+#endif
 	addr = dev_translate_address(dev, reg);
 
 	plat->addr = addr;
+#if CONFIG_ARM
+	plat->size = reg[3];
+#else
 	plat->size = reg[1];
+#endif
 	plat->ngpios = dev_read_u32_default(dev, "ngpios", 32);
 
 	return 0;
@@ -187,6 +239,7 @@ static int mpc8xxx_gpio_platdata_to_priv(struct udevice *dev)
 static int mpc8xxx_gpio_probe(struct udevice *dev)
 {
 	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
+	struct device_node const  *np = dev->node.np;
 	struct mpc8xxx_gpio_data *data = dev_get_priv(dev);
 	char name[32], *str;
 
@@ -198,6 +251,12 @@ static int mpc8xxx_gpio_probe(struct udevice *dev)
 	if (!str)
 		return -ENOMEM;
 
+	if (of_device_is_compatible(np, "fsl,qoriq-gpio", NULL, NULL)) {
+		unsigned long gpibe = data->addr + sizeof(struct ccsr_gpio);
+
+		out_be32(gpibe, 0xffffffff);
+	}
+
 	uc_priv->bank_name = str;
 	uc_priv->gpio_count = data->gpio_count;
 
-- 
2.17.1

