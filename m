Return-Path: <linux-gpio+bounces-35592-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHl9Dhtz72kcBgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35592-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:30:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9A3474651
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFE923026306
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1CB3D412C;
	Mon, 27 Apr 2026 14:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRXPpZlD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297C42F4A18;
	Mon, 27 Apr 2026 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300171; cv=none; b=bjr0xANaoD5E53zeeiXvr0h4zDh9Kz6ggpArfmThE0NGsMtlNx9LTzZXdr+n42uMSrUTmdsDler3x77O3M90jKxSZfaqW5W2DPBuFHCqTWLBqLiyu1kbSG5sTgqmCBR4br8ugUOzR3QZYxIo2ExkCpIN/94YUf3O9jtibI+tgXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300171; c=relaxed/simple;
	bh=Wl48KU7FFzY9tc+YJTHH50tO37f3gtqdY9BqM/ZabGA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A68dRmCaICB/lkHURMzdhDCj7ibY0DVkxHgi5aD1PsDnwR8yCezFOw4dE74j9O63trwjxM0Q+1kXlR2OFE5/SMkgY0BrmpJssFIaSlUFI1bL0hNPXa7EE552KKHT+6+0oxmMOqbocyHdCwu0gtH/2CDBwVRcQeA5iqvICd9WWAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRXPpZlD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8BDC2BCB4;
	Mon, 27 Apr 2026 14:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777300170;
	bh=Wl48KU7FFzY9tc+YJTHH50tO37f3gtqdY9BqM/ZabGA=;
	h=From:To:Cc:Subject:Date:From;
	b=FRXPpZlDCJPy1KTUYNDV/98kbRfznaGgF/hnO2PPhup9kUcOz6vqiKDmNFEaJ2E1o
	 3N8fhOGopOGljrRdlbBmhMyvq3IgmBGnXDvEBjEjjvFA8EA9mRuONzB5UBGGsDgYxD
	 cUu6ELVl41Ri5qlZff2NGV+CjpQqcaGgn69xKlAqfI3WQjvtuCdxS6QLu01jQuGUzf
	 lFRA+BpKIC+bFj9ysC4xPruzXQ0LsE0SWg9z0e81C7FOBTcnPvPvPUk0nX/0+HAnUr
	 rGZCo3mgNPySGdV53gLU++DqY3JD0v79IAVmQBdOizaPYuHQZwCEfmoCoVnZfONiOE
	 UcqCpq1uew7cA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] [v4] wiznet: convert to GPIO descriptors
Date: Mon, 27 Apr 2026 16:28:29 +0200
Message-Id: <20260427142924.2702598-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8E9A3474651
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-35592-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Arnd Bergmann <arnd@arndb.de>

The w5100/w5300 drivers only support probing with old platform data in
MMIO mode, or probing with DT in SPI mode. There are no users of this
platform data in tree, and from the git history it appears that the only
users of MMIO mode were on the (since removed) blackfin architecture.

Remove the platform data option, as it's unlikely to still be needed, and
change the internal operation to GPIO descriptors, making the behavior
the same for SPI and MMIO mode. The other data in the platform_data
structure is the MAC address, so make that also handled the same for both.

It would probably be possible to just remove the MMIO mode driver
completely, but it seems fine otherwise, and fixing it to use the modern
interface seems easy enough.

The CONFIG_WIZNET_BUS_SHIFT value was apparently meant to be set
at compile time to a machine specific value. This was always broken
for multiplatform configurations with conflicting requirements, and
in the mainline kernel it was set to 0 anyway. Leave it defined
locally as 0 but rename it to something without the CONFIG_ prefix.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/all/20230127095839.3266452-1-arnd@kernel.org/
---
v4: rebase to 7.1
v3: include linux/gpio/consumer.h to avoid build failure without GPIOLIB
v2: replace CONFIG_WIZNET_BUS_SHIFT with a constant
---
 .../devicetree/bindings/net/wiznet,w5x00.txt  |  4 +-
 drivers/net/ethernet/wiznet/w5100-spi.c       |  9 +--
 drivers/net/ethernet/wiznet/w5100.c           | 61 ++++++++++---------
 drivers/net/ethernet/wiznet/w5100.h           |  3 +-
 drivers/net/ethernet/wiznet/w5300.c           | 54 ++++++++--------
 include/linux/platform_data/wiznet.h          | 23 -------
 6 files changed, 67 insertions(+), 87 deletions(-)
 delete mode 100644 include/linux/platform_data/wiznet.h

diff --git a/Documentation/devicetree/bindings/net/wiznet,w5x00.txt b/Documentation/devicetree/bindings/net/wiznet,w5x00.txt
index e9665798c4be..e8a802d65817 100644
--- a/Documentation/devicetree/bindings/net/wiznet,w5x00.txt
+++ b/Documentation/devicetree/bindings/net/wiznet,w5x00.txt
@@ -1,6 +1,6 @@
 * Wiznet w5x00
 
-This is a standalone 10/100 MBit Ethernet controller with SPI interface.
+This is a standalone 10/100 MBit Ethernet controller with SPI or MMIO interface.
 
 For each device connected to a SPI bus, define a child node within
 the SPI master node.
@@ -9,6 +9,7 @@ Required properties:
 - compatible: Should be one of the following strings:
 	      "wiznet,w5100"
 	      "wiznet,w5200"
+	      "wiznet,w5300"
 	      "wiznet,w5500"
 - reg: Specify the SPI chip select the chip is wired to.
 - interrupts: Specify the interrupt index within the interrupt controller (referred
@@ -25,6 +26,7 @@ Optional properties:
   According to the w5500 datasheet, the chip allows a maximum of 80 MHz, however,
   board designs may need to limit this value.
 - local-mac-address: See ethernet.txt in the same directory.
+- link-gpios: a GPIO line used for the link detection interrupt
 
 
 Example (for Raspberry Pi with pin control stuff for GPIO irq):
diff --git a/drivers/net/ethernet/wiznet/w5100-spi.c b/drivers/net/ethernet/wiznet/w5100-spi.c
index 990a3cce8c0f..0626fcb8db5a 100644
--- a/drivers/net/ethernet/wiznet/w5100-spi.c
+++ b/drivers/net/ethernet/wiznet/w5100-spi.c
@@ -422,14 +422,7 @@ static int w5100_spi_probe(struct spi_device *spi)
 {
 	const struct w5100_ops *ops;
 	kernel_ulong_t driver_data;
-	const void *mac = NULL;
-	u8 tmpmac[ETH_ALEN];
 	int priv_size;
-	int ret;
-
-	ret = of_get_mac_address(spi->dev.of_node, tmpmac);
-	if (!ret)
-		mac = tmpmac;
 
 	driver_data = (uintptr_t)spi_get_device_match_data(spi);
 
@@ -450,7 +443,7 @@ static int w5100_spi_probe(struct spi_device *spi)
 		return -EINVAL;
 	}
 
-	return w5100_probe(&spi->dev, ops, priv_size, mac, spi->irq, -EINVAL);
+	return w5100_probe(&spi->dev, ops, priv_size, spi->irq);
 }
 
 static void w5100_spi_remove(struct spi_device *spi)
diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/wiznet/w5100.c
index c5424d882135..62b2f24106cd 100644
--- a/drivers/net/ethernet/wiznet/w5100.c
+++ b/drivers/net/ethernet/wiznet/w5100.c
@@ -11,7 +11,6 @@
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/wiznet.h>
 #include <linux/ethtool.h>
 #include <linux/skbuff.h>
 #include <linux/types.h>
@@ -23,7 +22,8 @@
 #include <linux/ioport.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/of_net.h>
 
 #include "w5100.h"
 
@@ -139,6 +139,10 @@ MODULE_LICENSE("GPL");
 #define W5500_RX_MEM_START	0x30000
 #define W5500_RX_MEM_SIZE	0x04000
 
+#define WIZNET_BUS_SHIFT 0	/* possibly machine specific */
+
+#define W5100_BUS_DIRECT_SIZE  (0x8000 << WIZNET_BUS_SHIFT)
+
 /*
  * Device driver private data structure
  */
@@ -157,7 +161,7 @@ struct w5100_priv {
 
 	int irq;
 	int link_irq;
-	int link_gpio;
+	struct gpio_desc *link_gpio;
 
 	struct napi_struct napi;
 	struct net_device *ndev;
@@ -204,13 +208,13 @@ static inline void __iomem *w5100_mmio(struct net_device *ndev)
  */
 static inline int w5100_read_direct(struct net_device *ndev, u32 addr)
 {
-	return ioread8(w5100_mmio(ndev) + (addr << CONFIG_WIZNET_BUS_SHIFT));
+	return ioread8(w5100_mmio(ndev) + (addr << WIZNET_BUS_SHIFT));
 }
 
 static inline int __w5100_write_direct(struct net_device *ndev, u32 addr,
 				       u8 data)
 {
-	iowrite8(data, w5100_mmio(ndev) + (addr << CONFIG_WIZNET_BUS_SHIFT));
+	iowrite8(data, w5100_mmio(ndev) + (addr << WIZNET_BUS_SHIFT));
 
 	return 0;
 }
@@ -729,8 +733,8 @@ static u32 w5100_get_link(struct net_device *ndev)
 {
 	struct w5100_priv *priv = netdev_priv(ndev);
 
-	if (gpio_is_valid(priv->link_gpio))
-		return !!gpio_get_value(priv->link_gpio);
+	if (priv->link_gpio)
+		return !!gpiod_get_value(priv->link_gpio);
 
 	return 1;
 }
@@ -943,7 +947,7 @@ static irqreturn_t w5100_detect_link(int irq, void *ndev_instance)
 	struct w5100_priv *priv = netdev_priv(ndev);
 
 	if (netif_running(ndev)) {
-		if (gpio_get_value(priv->link_gpio) != 0) {
+		if (gpiod_get_value(priv->link_gpio) != 0) {
 			netif_info(priv, link, ndev, "link is up\n");
 			netif_carrier_on(ndev);
 		} else {
@@ -998,8 +1002,8 @@ static int w5100_open(struct net_device *ndev)
 	w5100_hw_start(priv);
 	napi_enable(&priv->napi);
 	netif_start_queue(ndev);
-	if (!gpio_is_valid(priv->link_gpio) ||
-	    gpio_get_value(priv->link_gpio) != 0)
+	if (!priv->link_gpio ||
+	    gpiod_get_value(priv->link_gpio) != 0)
 		netif_carrier_on(ndev);
 	return 0;
 }
@@ -1037,15 +1041,10 @@ static const struct net_device_ops w5100_netdev_ops = {
 
 static int w5100_mmio_probe(struct platform_device *pdev)
 {
-	struct wiznet_platform_data *data = dev_get_platdata(&pdev->dev);
-	const void *mac_addr = NULL;
 	struct resource *mem;
 	const struct w5100_ops *ops;
 	int irq;
 
-	if (data && is_valid_ether_addr(data->mac_addr))
-		mac_addr = data->mac_addr;
-
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem)
 		return -EINVAL;
@@ -1058,8 +1057,7 @@ static int w5100_mmio_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	return w5100_probe(&pdev->dev, ops, sizeof(struct w5100_mmio_priv),
-			   mac_addr, irq, data ? data->link_gpio : -EINVAL);
+	return w5100_probe(&pdev->dev, ops, sizeof(struct w5100_mmio_priv), irq);
 }
 
 static void w5100_mmio_remove(struct platform_device *pdev)
@@ -1075,13 +1073,13 @@ void *w5100_ops_priv(const struct net_device *ndev)
 EXPORT_SYMBOL_GPL(w5100_ops_priv);
 
 int w5100_probe(struct device *dev, const struct w5100_ops *ops,
-		int sizeof_ops_priv, const void *mac_addr, int irq,
-		int link_gpio)
+		int sizeof_ops_priv, int irq)
 {
 	struct w5100_priv *priv;
 	struct net_device *ndev;
 	int err;
 	size_t alloc_size;
+	u8 tmpmac[ETH_ALEN];
 
 	alloc_size = sizeof(*priv);
 	if (sizeof_ops_priv) {
@@ -1127,7 +1125,9 @@ int w5100_probe(struct device *dev, const struct w5100_ops *ops,
 	priv->ndev = ndev;
 	priv->ops = ops;
 	priv->irq = irq;
-	priv->link_gpio = link_gpio;
+	priv->link_gpio = gpiod_get_optional(dev, "link", GPIOD_IN);
+	if (IS_ERR(priv->link_gpio))
+		return PTR_ERR(priv->link_gpio);
 
 	ndev->netdev_ops = &w5100_netdev_ops;
 	ndev->ethtool_ops = &w5100_ethtool_ops;
@@ -1154,8 +1154,9 @@ int w5100_probe(struct device *dev, const struct w5100_ops *ops,
 	INIT_WORK(&priv->setrx_work, w5100_setrx_work);
 	INIT_WORK(&priv->restart_work, w5100_restart_work);
 
-	if (mac_addr)
-		eth_hw_addr_set(ndev, mac_addr);
+	err = of_get_mac_address(dev->of_node, tmpmac);
+	if (!err)
+		eth_hw_addr_set(ndev, tmpmac);
 	else
 		eth_hw_addr_random(ndev);
 
@@ -1180,7 +1181,7 @@ int w5100_probe(struct device *dev, const struct w5100_ops *ops,
 	if (err)
 		goto err_hw;
 
-	if (gpio_is_valid(priv->link_gpio)) {
+	if (priv->link_gpio) {
 		char *link_name = devm_kzalloc(dev, 16, GFP_KERNEL);
 
 		if (!link_name) {
@@ -1188,12 +1189,14 @@ int w5100_probe(struct device *dev, const struct w5100_ops *ops,
 			goto err_gpio;
 		}
 		snprintf(link_name, 16, "%s-link", netdev_name(ndev));
-		priv->link_irq = gpio_to_irq(priv->link_gpio);
+		priv->link_irq = gpiod_to_irq(priv->link_gpio);
 		if (request_any_context_irq(priv->link_irq, w5100_detect_link,
 					    IRQF_TRIGGER_RISING |
 					    IRQF_TRIGGER_FALLING,
-					    link_name, priv->ndev) < 0)
-			priv->link_gpio = -EINVAL;
+					    link_name, priv->ndev) < 0) {
+			gpiod_put(priv->link_gpio);
+			priv->link_gpio = NULL;
+		}
 	}
 
 	return 0;
@@ -1217,7 +1220,7 @@ void w5100_remove(struct device *dev)
 
 	w5100_hw_reset(priv);
 	free_irq(priv->irq, ndev);
-	if (gpio_is_valid(priv->link_gpio))
+	if (priv->link_gpio)
 		free_irq(priv->link_irq, ndev);
 
 	flush_work(&priv->setrx_work);
@@ -1254,8 +1257,8 @@ static int w5100_resume(struct device *dev)
 		w5100_hw_start(priv);
 
 		netif_device_attach(ndev);
-		if (!gpio_is_valid(priv->link_gpio) ||
-		    gpio_get_value(priv->link_gpio) != 0)
+		if (!priv->link_gpio ||
+		    gpiod_get_value(priv->link_gpio) != 0)
 			netif_carrier_on(ndev);
 	}
 	return 0;
diff --git a/drivers/net/ethernet/wiznet/w5100.h b/drivers/net/ethernet/wiznet/w5100.h
index 481af3b6d9e8..013ef2835115 100644
--- a/drivers/net/ethernet/wiznet/w5100.h
+++ b/drivers/net/ethernet/wiznet/w5100.h
@@ -29,8 +29,7 @@ struct w5100_ops {
 void *w5100_ops_priv(const struct net_device *ndev);
 
 int w5100_probe(struct device *dev, const struct w5100_ops *ops,
-		int sizeof_ops_priv, const void *mac_addr, int irq,
-		int link_gpio);
+		int sizeof_ops_priv, int irq);
 void w5100_remove(struct device *dev);
 
 extern const struct dev_pm_ops w5100_pm_ops;
diff --git a/drivers/net/ethernet/wiznet/w5300.c b/drivers/net/ethernet/wiznet/w5300.c
index 3e711dea3b2c..303c04cb7fc4 100644
--- a/drivers/net/ethernet/wiznet/w5300.c
+++ b/drivers/net/ethernet/wiznet/w5300.c
@@ -12,7 +12,6 @@
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/wiznet.h>
 #include <linux/ethtool.h>
 #include <linux/skbuff.h>
 #include <linux/types.h>
@@ -24,7 +23,8 @@
 #include <linux/ioport.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/of_net.h>
 
 #define DRV_NAME	"w5300"
 #define DRV_VERSION	"2012-04-04"
@@ -80,6 +80,10 @@ MODULE_LICENSE("GPL");
 #define W5300_S0_RX_FIFO	0x0230	/* S0 Receive FIFO */
 #define W5300_REGS_LEN		0x0400
 
+#define WIZNET_BUS_SHIFT 0
+
+#define W5300_BUS_DIRECT_SIZE  (0x0400 << WIZNET_BUS_SHIFT)
+
 /*
  * Device driver private data structure
  */
@@ -91,7 +95,7 @@ struct w5300_priv {
 	void (*write)(struct w5300_priv *priv, u16 addr, u16 data);
 	int irq;
 	int link_irq;
-	int link_gpio;
+	struct gpio_desc *link_gpio;
 
 	struct napi_struct napi;
 	struct net_device *ndev;
@@ -113,13 +117,13 @@ struct w5300_priv {
  */
 static inline u16 w5300_read_direct(struct w5300_priv *priv, u16 addr)
 {
-	return ioread16(priv->base + (addr << CONFIG_WIZNET_BUS_SHIFT));
+	return ioread16(priv->base + (addr << WIZNET_BUS_SHIFT));
 }
 
 static inline void w5300_write_direct(struct w5300_priv *priv,
 				      u16 addr, u16 data)
 {
-	iowrite16(data, priv->base + (addr << CONFIG_WIZNET_BUS_SHIFT));
+	iowrite16(data, priv->base + (addr << WIZNET_BUS_SHIFT));
 }
 
 /*
@@ -292,8 +296,8 @@ static u32 w5300_get_link(struct net_device *ndev)
 {
 	struct w5300_priv *priv = netdev_priv(ndev);
 
-	if (gpio_is_valid(priv->link_gpio))
-		return !!gpio_get_value(priv->link_gpio);
+	if (priv->link_gpio)
+		return !!gpiod_get_value(priv->link_gpio);
 
 	return 1;
 }
@@ -442,7 +446,7 @@ static irqreturn_t w5300_detect_link(int irq, void *ndev_instance)
 	struct w5300_priv *priv = netdev_priv(ndev);
 
 	if (netif_running(ndev)) {
-		if (gpio_get_value(priv->link_gpio) != 0) {
+		if (gpiod_get_value(priv->link_gpio) != 0) {
 			netif_info(priv, link, ndev, "link is up\n");
 			netif_carrier_on(ndev);
 		} else {
@@ -485,8 +489,8 @@ static int w5300_open(struct net_device *ndev)
 	w5300_hw_start(priv);
 	napi_enable(&priv->napi);
 	netif_start_queue(ndev);
-	if (!gpio_is_valid(priv->link_gpio) ||
-	    gpio_get_value(priv->link_gpio) != 0)
+	if (!priv->link_gpio ||
+	    gpiod_get_value(priv->link_gpio) != 0)
 		netif_carrier_on(ndev);
 	return 0;
 }
@@ -524,7 +528,6 @@ static const struct net_device_ops w5300_netdev_ops = {
 
 static int w5300_hw_probe(struct platform_device *pdev)
 {
-	struct wiznet_platform_data *data = dev_get_platdata(&pdev->dev);
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct w5300_priv *priv = netdev_priv(ndev);
 	const char *name = netdev_name(ndev);
@@ -533,11 +536,9 @@ static int w5300_hw_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	if (data && is_valid_ether_addr(data->mac_addr)) {
-		eth_hw_addr_set(ndev, data->mac_addr);
-	} else {
-		eth_hw_addr_random(ndev);
-	}
+        ret = of_get_ethdev_address(pdev->dev.of_node, ndev);
+        if (ret)
+                eth_hw_addr_random(ndev);
 
 	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
 	if (IS_ERR(priv->base))
@@ -568,17 +569,22 @@ static int w5300_hw_probe(struct platform_device *pdev)
 		return ret;
 	priv->irq = irq;
 
-	priv->link_gpio = data ? data->link_gpio : -EINVAL;
-	if (gpio_is_valid(priv->link_gpio)) {
+	priv->link_gpio = gpiod_get_optional(&pdev->dev, "link", GPIOD_IN);
+	if (IS_ERR(priv->link_gpio))
+		return PTR_ERR(priv->link_gpio);
+
+	if (priv->link_gpio) {
 		char *link_name = devm_kzalloc(&pdev->dev, 16, GFP_KERNEL);
 		if (!link_name)
 			return -ENOMEM;
 		snprintf(link_name, 16, "%s-link", name);
-		priv->link_irq = gpio_to_irq(priv->link_gpio);
+		priv->link_irq = gpiod_to_irq(priv->link_gpio);
 		if (request_any_context_irq(priv->link_irq, w5300_detect_link,
 				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
-				link_name, priv->ndev) < 0)
-			priv->link_gpio = -EINVAL;
+				link_name, priv->ndev) < 0) {
+			priv->link_gpio = NULL;
+			gpiod_put(priv->link_gpio);
+		}
 	}
 
 	netdev_info(ndev, "at 0x%llx irq %d\n", (u64)mem->start, irq);
@@ -633,7 +639,7 @@ static void w5300_remove(struct platform_device *pdev)
 
 	w5300_hw_reset(priv);
 	free_irq(priv->irq, ndev);
-	if (gpio_is_valid(priv->link_gpio))
+	if (priv->link_gpio)
 		free_irq(priv->link_irq, ndev);
 
 	unregister_netdev(ndev);
@@ -665,8 +671,8 @@ static int w5300_resume(struct device *dev)
 		w5300_hw_start(priv);
 
 		netif_device_attach(ndev);
-		if (!gpio_is_valid(priv->link_gpio) ||
-		    gpio_get_value(priv->link_gpio) != 0)
+		if (!priv->link_gpio ||
+		    gpiod_get_value(priv->link_gpio) != 0)
 			netif_carrier_on(ndev);
 	}
 	return 0;
diff --git a/include/linux/platform_data/wiznet.h b/include/linux/platform_data/wiznet.h
deleted file mode 100644
index 1154c4db8a13..000000000000
--- a/include/linux/platform_data/wiznet.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Ethernet driver for the WIZnet W5x00 chip.
- */
-
-#ifndef PLATFORM_DATA_WIZNET_H
-#define PLATFORM_DATA_WIZNET_H
-
-#include <linux/if_ether.h>
-
-struct wiznet_platform_data {
-	int	link_gpio;
-	u8	mac_addr[ETH_ALEN];
-};
-
-#ifndef CONFIG_WIZNET_BUS_SHIFT
-#define CONFIG_WIZNET_BUS_SHIFT 0
-#endif
-
-#define W5100_BUS_DIRECT_SIZE	(0x8000 << CONFIG_WIZNET_BUS_SHIFT)
-#define W5300_BUS_DIRECT_SIZE	(0x0400 << CONFIG_WIZNET_BUS_SHIFT)
-
-#endif /* PLATFORM_DATA_WIZNET_H */
-- 
2.39.5


