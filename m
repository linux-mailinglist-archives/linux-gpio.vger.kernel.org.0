Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272BB383D4F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 21:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233801AbhEQT34 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 15:29:56 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:57362 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbhEQT3x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 15:29:53 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:404a:340a:91cb:c07b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id EB4441FFBF7;
        Mon, 17 May 2021 21:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621279716;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sCTcUHfrMYU4IbYJ3Pim5sRRRlNd4hzoqkJqPSWFtA0=;
        b=4x8+Ta/x511RUhSXyHEnwL0IZUKRrFnlurF0qanRl1NHj82/q4FJEajvxGhF9LgkwyHVnM
        WXwcpC8ofjZJ710mRYrdd40nkq7niDdYLo2Lhxo/mz0AIuFnC2FgpwtQnMxwKNtB8Ee3zd
        gWKXKmWGyHg/5BZJauFJiEqCoFDfjsHq0uWOUpgVhsehhVd68sg3CVUZeswt1iSgKaa+yw
        Su8MYRzTRyWYGquz8ghBvslWwBJIB5fnJbSD6fI7VCVgnETEB+trRfH0pzD3zAZ2d9Y8k+
        cNh9NghjwAYWPxsnjtVFdq2blhCSQgfVk+U3N5ZqvNavBj87F1J6yRE6dEtsSg==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v2 1/7] regmap: Add MDIO bus support
Date:   Mon, 17 May 2021 21:28:03 +0200
Message-Id: <63b99a2fec2c4ea3c461d59d451af8d675ecf312.1621279162.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621279162.git.sander@svanheule.net>
References: <cover.1621279162.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Basic support for MDIO bus access. Support only includes clause-22
register access, with 5-bit addresses, and 16-bit wide registers.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/base/regmap/Kconfig       |  6 +++-
 drivers/base/regmap/Makefile      |  1 +
 drivers/base/regmap/regmap-mdio.c | 57 +++++++++++++++++++++++++++++++
 include/linux/regmap.h            | 36 +++++++++++++++++++
 4 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 drivers/base/regmap/regmap-mdio.c

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index 50b1e2d06a25..159bac6c5046 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -4,8 +4,9 @@
 # subsystems should select the appropriate symbols.
 
 config REGMAP
-	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SOUNDWIRE_MBQ || REGMAP_SCCB || REGMAP_I3C || REGMAP_SPI_AVMM)
+	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SOUNDWIRE_MBQ || REGMAP_SCCB || REGMAP_I3C || REGMAP_SPI_AVMM || REGMAP_MDIO)
 	select IRQ_DOMAIN if REGMAP_IRQ
+	select MDIO_BUS if REGMAP_MDIO
 	bool
 
 config REGCACHE_COMPRESSED
@@ -36,6 +37,9 @@ config REGMAP_W1
 	tristate
 	depends on W1
 
+config REGMAP_MDIO
+	tristate
+
 config REGMAP_MMIO
 	tristate
 
diff --git a/drivers/base/regmap/Makefile b/drivers/base/regmap/Makefile
index 33f63adb5b3d..11facb32a027 100644
--- a/drivers/base/regmap/Makefile
+++ b/drivers/base/regmap/Makefile
@@ -19,3 +19,4 @@ obj-$(CONFIG_REGMAP_SOUNDWIRE_MBQ) += regmap-sdw-mbq.o
 obj-$(CONFIG_REGMAP_SCCB) += regmap-sccb.o
 obj-$(CONFIG_REGMAP_I3C) += regmap-i3c.o
 obj-$(CONFIG_REGMAP_SPI_AVMM) += regmap-spi-avmm.o
+obj-$(CONFIG_REGMAP_MDIO) += regmap-mdio.o
diff --git a/drivers/base/regmap/regmap-mdio.c b/drivers/base/regmap/regmap-mdio.c
new file mode 100644
index 000000000000..5f18fe409f56
--- /dev/null
+++ b/drivers/base/regmap/regmap-mdio.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/errno.h>
+#include <linux/mdio.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+static int regmap_mdio_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct mdio_device *mdio_dev = context;
+	int ret;
+
+	ret = mdiobus_read(mdio_dev->bus, mdio_dev->addr, reg);
+	*val = ret & 0xffff;
+
+	return ret < 0 ? ret : 0;
+}
+
+static int regmap_mdio_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct mdio_device *mdio_dev = context;
+
+	return mdiobus_write(mdio_dev->bus, mdio_dev->addr, reg, val);
+}
+
+static const struct regmap_bus regmap_mdio_bus = {
+	.reg_write = regmap_mdio_write,
+	.reg_read = regmap_mdio_read,
+};
+
+struct regmap *__regmap_init_mdio(struct mdio_device *mdio_dev,
+	const struct regmap_config *config, struct lock_class_key *lock_key,
+	const char *lock_name)
+{
+	if (config->reg_bits != 5 || config->val_bits != 16)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	return __regmap_init(&mdio_dev->dev, &regmap_mdio_bus, mdio_dev, config,
+		lock_key, lock_name);
+}
+EXPORT_SYMBOL_GPL(__regmap_init_mdio);
+
+struct regmap *__devm_regmap_init_mdio(struct mdio_device *mdio_dev,
+	const struct regmap_config *config, struct lock_class_key *lock_key,
+	const char *lock_name)
+{
+	if (config->reg_bits != 5 || config->val_bits != 16)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	return __devm_regmap_init(&mdio_dev->dev, &regmap_mdio_bus, mdio_dev,
+		config, lock_key, lock_name);
+}
+EXPORT_SYMBOL_GPL(__devm_regmap_init_mdio);
+
+MODULE_AUTHOR("Sander Vanheule <sander@svanheule.net>");
+MODULE_DESCRIPTION("Regmap MDIO Module");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index f87a11a5cc4a..e97dd05f7cdb 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -27,6 +27,7 @@ struct device_node;
 struct i2c_client;
 struct i3c_device;
 struct irq_domain;
+struct mdio_device;
 struct slim_device;
 struct spi_device;
 struct spmi_device;
@@ -538,6 +539,10 @@ struct regmap *__regmap_init_i2c(struct i2c_client *i2c,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name);
+struct regmap *__regmap_init_mdio(struct mdio_device *mdio_dev,
+				 const struct regmap_config *config,
+				 struct lock_class_key *lock_key,
+				 const char *lock_name);
 struct regmap *__regmap_init_sccb(struct i2c_client *i2c,
 				  const struct regmap_config *config,
 				  struct lock_class_key *lock_key,
@@ -594,6 +599,10 @@ struct regmap *__devm_regmap_init_i2c(struct i2c_client *i2c,
 				      const struct regmap_config *config,
 				      struct lock_class_key *lock_key,
 				      const char *lock_name);
+struct regmap *__devm_regmap_init_mdio(struct mdio_device *mdio_dev,
+				      const struct regmap_config *config,
+				      struct lock_class_key *lock_key,
+				      const char *lock_name);
 struct regmap *__devm_regmap_init_sccb(struct i2c_client *i2c,
 				       const struct regmap_config *config,
 				       struct lock_class_key *lock_key,
@@ -697,6 +706,19 @@ int regmap_attach_dev(struct device *dev, struct regmap *map,
 	__regmap_lockdep_wrapper(__regmap_init_i2c, #config,		\
 				i2c, config)
 
+/**
+ * regmap_init_mdio() - Initialise register map
+ *
+ * @mdio_dev: Device that will be interacted with
+ * @config: Configuration for register map
+ *
+ * The return value will be an ERR_PTR() on error or a valid pointer to
+ * a struct regmap.
+ */
+#define regmap_init_mdio(mdio_dev, config)				\
+	__regmap_lockdep_wrapper(__regmap_init_mdio, #config,		\
+				mdio_dev, config)
+
 /**
  * regmap_init_sccb() - Initialise register map
  *
@@ -888,6 +910,20 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
 	__regmap_lockdep_wrapper(__devm_regmap_init_i2c, #config,	\
 				i2c, config)
 
+/**
+ * devm_regmap_init_mdio() - Initialise managed register map
+ *
+ * @mdio_dev: Device that will be interacted with
+ * @config: Configuration for register map
+ *
+ * The return value will be an ERR_PTR() on error or a valid pointer
+ * to a struct regmap.  The regmap will be automatically freed by the
+ * device management code.
+ */
+#define devm_regmap_init_mdio(mdio_dev, config)				\
+	__regmap_lockdep_wrapper(__devm_regmap_init_mdio, #config,	\
+				mdio_dev, config)
+
 /**
  * devm_regmap_init_sccb() - Initialise managed register map
  *
-- 
2.31.1

