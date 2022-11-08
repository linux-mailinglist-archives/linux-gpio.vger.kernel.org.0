Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46950621977
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 17:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbiKHQdX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 11:33:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233654AbiKHQdW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 11:33:22 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC69B5801B;
        Tue,  8 Nov 2022 08:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RF0leUyVshth3zAQrknp45yF53nvgoOUlbMKsjrD26g=; b=pHCgK/T28563kYh0hvPFXDBb5x
        dMnEDoJRtdnwL8BzE6Lo3qHaqpznc5RBo1MstbIl5K5p/vn4rda9e2BXITr2qyal3QJrV0sl0cgvx
        r32GSkJz4JuQNxzigjZ9I7wnTq/qIAsIBo3Hi3R0U9kIdSfJCkfhPFfFXqE6XaAj/R+Y0txpSgE4e
        fkUW6Qn7RB97Gi66HcOzbK/vmUc8EKrSqBsHc8D9UZ7ty16ll0s97sxcM40XSo1p6nfGHQIppYEEX
        tVa4/CM9vrJHoWqZrFkLyY4zogr/shNMUd5NM1Yolpu9kntoG6L6Zputq+eWsQp3rbZeX1OVfVA92
        SoMdFLSw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57192 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1osRXJ-0003RN-VH; Tue, 08 Nov 2022 16:33:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1osRXJ-002mvq-Bg; Tue, 08 Nov 2022 16:33:17 +0000
In-Reply-To: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
From:   Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: [PATCH v3 1/7] mfd: Add core Apple Mac SMC driver
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1osRXJ-002mvq-Bg@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 08 Nov 2022 16:33:17 +0000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Hector Martin <marcan@marcan.st>

This driver implements support for the SMC (System Management
Controller) in Apple Macs. In contrast to the existing applesmc driver,
it uses pluggable backends that allow it to support different SMC
implementations, and uses the MFD subsystem to expose the core SMC
functionality so that specific features (gpio, hwmon, battery, etc.) can
be implemented by separate drivers in their respective downstream
subsystems.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/mfd/Kconfig        |   4 +
 drivers/mfd/Makefile       |   1 +
 drivers/mfd/macsmc.c       | 239 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/macsmc.h | 104 ++++++++++++++++
 4 files changed, 348 insertions(+)
 create mode 100644 drivers/mfd/macsmc.c
 create mode 100644 include/linux/mfd/macsmc.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 8b93856de432..f73e098b7228 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -224,6 +224,10 @@ config MFD_CROS_EC_DEV
 	  To compile this driver as a module, choose M here: the module will be
 	  called cros-ec-dev.
 
+config MFD_MACSMC
+	tristate
+	select MFD_CORE
+
 config MFD_MADERA
 	tristate "Cirrus Logic Madera codecs"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 7ed3ef4a698c..a5271b578d31 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
 obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
 obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
 obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
+obj-$(CONFIG_MFD_MACSMC)	+= macsmc.o
 
 obj-$(CONFIG_HTC_PASIC3)	+= htc-pasic3.o
 obj-$(CONFIG_HTC_I2CPLD)	+= htc-i2cpld.o
diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
new file mode 100644
index 000000000000..e5c3957efea4
--- /dev/null
+++ b/drivers/mfd/macsmc.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC core framework
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include <linux/device.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/macsmc.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+
+struct apple_smc {
+	struct device *dev;
+
+	void *be_cookie;
+	const struct apple_smc_backend_ops *be;
+
+	struct mutex mutex;
+
+	u32 key_count;
+	smc_key first_key;
+	smc_key last_key;
+
+	struct blocking_notifier_head event_handlers;
+};
+
+static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_NAME("macsmc-hid"),
+	MFD_CELL_NAME("macsmc-power"),
+	MFD_CELL_NAME("macsmc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
+};
+
+int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->read_key(smc->be_cookie, key, buf, size);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(apple_smc_read);
+
+int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->write_key(smc->be_cookie, key, buf, size);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(apple_smc_write);
+
+int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size)
+{
+	int ret;
+
+	/*
+	 * Will fail if SMC is busy. This is only used by SMC reboot/poweroff
+	 * final calls, so it doesn't really matter at that point.
+	 */
+	if (!mutex_trylock(&smc->mutex))
+		return -EBUSY;
+
+	ret = smc->be->write_key_atomic(smc->be_cookie, key, buf, size);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(apple_smc_write_atomic);
+
+int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
+		 void *rbuf, size_t rsize)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->rw_key(smc->be_cookie, key, wbuf, wsize, rbuf, rsize);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(apple_smc_rw);
+
+int apple_smc_get_key_by_index(struct apple_smc *smc, int index, smc_key *key)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->get_key_by_index(smc->be_cookie, index, key);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(apple_smc_get_key_by_index);
+
+int apple_smc_get_key_info(struct apple_smc *smc, smc_key key, struct apple_smc_key_info *info)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->get_key_info(smc->be_cookie, key, info);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(apple_smc_get_key_info);
+
+int apple_smc_find_first_key_index(struct apple_smc *smc, smc_key key)
+{
+	int start = 0, count = smc->key_count;
+	int ret;
+
+	if (key <= smc->first_key)
+		return 0;
+	if (key > smc->last_key)
+		return smc->key_count;
+
+	while (count > 1) {
+		int pivot = start + ((count - 1) >> 1);
+		smc_key pkey;
+
+		ret = apple_smc_get_key_by_index(smc, pivot, &pkey);
+		if (ret < 0)
+			return ret;
+
+		if (pkey == key)
+			return pivot;
+
+		pivot++;
+
+		if (pkey < key) {
+			count -= pivot - start;
+			start = pivot;
+		} else {
+			count = pivot - start;
+		}
+	}
+
+	return start;
+}
+EXPORT_SYMBOL(apple_smc_find_first_key_index);
+
+int apple_smc_get_key_count(struct apple_smc *smc)
+{
+	return smc->key_count;
+}
+EXPORT_SYMBOL(apple_smc_get_key_count);
+
+void apple_smc_event_received(struct apple_smc *smc, uint32_t event)
+{
+	dev_dbg(smc->dev, "Event: 0x%08x\n", event);
+	blocking_notifier_call_chain(&smc->event_handlers, event, NULL);
+}
+EXPORT_SYMBOL(apple_smc_event_received);
+
+int apple_smc_register_notifier(struct apple_smc *smc, struct notifier_block *n)
+{
+	return blocking_notifier_chain_register(&smc->event_handlers, n);
+}
+EXPORT_SYMBOL(apple_smc_register_notifier);
+
+int apple_smc_unregister_notifier(struct apple_smc *smc, struct notifier_block *n)
+{
+	return blocking_notifier_chain_unregister(&smc->event_handlers, n);
+}
+EXPORT_SYMBOL(apple_smc_unregister_notifier);
+
+void *apple_smc_get_cookie(struct apple_smc *smc)
+{
+	return smc->be_cookie;
+}
+EXPORT_SYMBOL(apple_smc_get_cookie);
+
+struct apple_smc *apple_smc_probe(struct device *dev, const struct apple_smc_backend_ops *ops, void *cookie)
+{
+	struct apple_smc *smc;
+	u32 count;
+	int ret;
+
+	smc = devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
+	if (!smc)
+		return ERR_PTR(-ENOMEM);
+
+	smc->dev = dev;
+	smc->be_cookie = cookie;
+	smc->be = ops;
+	mutex_init(&smc->mutex);
+	BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handlers);
+
+	ret = apple_smc_read_u32(smc, SMC_KEY(#KEY), &count);
+	if (ret)
+		return ERR_PTR(dev_err_probe(dev, ret, "Failed to get key count"));
+	smc->key_count = be32_to_cpu(count);
+
+	ret = apple_smc_get_key_by_index(smc, 0, &smc->first_key);
+	if (ret)
+		return ERR_PTR(dev_err_probe(dev, ret, "Failed to get first key"));
+
+	ret = apple_smc_get_key_by_index(smc, smc->key_count - 1, &smc->last_key);
+	if (ret)
+		return ERR_PTR(dev_err_probe(dev, ret, "Failed to get last key"));
+
+	/* Enable notifications */
+	apple_smc_write_flag(smc, SMC_KEY(NTAP), 1);
+
+	dev_info(dev, "Initialized (%d keys %p4ch..%p4ch)\n",
+		 smc->key_count, &smc->first_key, &smc->last_key);
+
+	dev_set_drvdata(dev, smc);
+
+	ret = mfd_add_devices(dev, -1, apple_smc_devs, ARRAY_SIZE(apple_smc_devs), NULL, 0, NULL);
+	if (ret)
+		return ERR_PTR(dev_err_probe(dev, ret, "Subdevice initialization failed"));
+
+	return smc;
+}
+EXPORT_SYMBOL(apple_smc_probe);
+
+int apple_smc_remove(struct apple_smc *smc)
+{
+	mfd_remove_devices(smc->dev);
+
+	/* Disable notifications */
+	apple_smc_write_flag(smc, SMC_KEY(NTAP), 1);
+
+	return 0;
+}
+EXPORT_SYMBOL(apple_smc_remove);
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC core");
diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
new file mode 100644
index 000000000000..99cfa23f27bd
--- /dev/null
+++ b/include/linux/mfd/macsmc.h
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC core definitions
+ * Copyright (C) The Asahi Linux Contributors
+ */
+
+#ifndef _LINUX_MFD_MACSMC_H
+#define _LINUX_MFD_MACSMC_H
+
+struct apple_smc;
+
+typedef u32 smc_key;
+
+#define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
+#define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
+
+#define APPLE_SMC_READABLE BIT(7)
+#define APPLE_SMC_WRITABLE BIT(6)
+#define APPLE_SMC_FUNCTION BIT(4)
+
+struct apple_smc_key_info {
+	u8 size;
+	u32 type_code;
+	u8 flags;
+};
+
+int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size);
+int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size);
+int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size);
+int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
+		 void *rbuf, size_t rsize);
+
+int apple_smc_get_key_count(struct apple_smc *smc);
+int apple_smc_find_first_key_index(struct apple_smc *smc, smc_key key);
+int apple_smc_get_key_by_index(struct apple_smc *smc, int index, smc_key *key);
+int apple_smc_get_key_info(struct apple_smc *smc, smc_key key, struct apple_smc_key_info *info);
+
+static inline bool apple_smc_key_exists(struct apple_smc *smc, smc_key key)
+{
+	return apple_smc_get_key_info(smc, key, NULL) >= 0;
+}
+
+#define APPLE_SMC_TYPE_OPS(type) \
+	static inline int apple_smc_read_##type(struct apple_smc *smc, smc_key key, type *p) \
+	{ \
+		int ret = apple_smc_read(smc, key, p, sizeof(*p)); \
+		return (ret < 0) ? ret : ((ret != sizeof(*p)) ? -EINVAL : 0); \
+	} \
+	static inline int apple_smc_write_##type(struct apple_smc *smc, smc_key key, type p) \
+	{ \
+		return apple_smc_write(smc, key, &p, sizeof(p)); \
+	} \
+	static inline int apple_smc_write_##type##_atomic(struct apple_smc *smc, smc_key key, type p) \
+	{ \
+		return apple_smc_write_atomic(smc, key, &p, sizeof(p)); \
+	} \
+	static inline int apple_smc_rw_##type(struct apple_smc *smc, smc_key key, \
+					      type w, type *r) \
+	{ \
+		int ret = apple_smc_rw(smc, key, &w, sizeof(w), r, sizeof(*r)); \
+		return (ret < 0) ? ret : ((ret != sizeof(*r)) ? -EINVAL : 0); \
+	}
+
+APPLE_SMC_TYPE_OPS(u64)
+APPLE_SMC_TYPE_OPS(u32)
+APPLE_SMC_TYPE_OPS(u16)
+APPLE_SMC_TYPE_OPS(u8)
+APPLE_SMC_TYPE_OPS(s64)
+APPLE_SMC_TYPE_OPS(s32)
+APPLE_SMC_TYPE_OPS(s16)
+APPLE_SMC_TYPE_OPS(s8)
+
+static inline int apple_smc_read_flag(struct apple_smc *smc, smc_key key)
+{
+	u8 val;
+	int ret = apple_smc_read_u8(smc, key, &val);
+	if (ret < 0)
+		return ret;
+	return val ? 1 : 0;
+}
+#define apple_smc_write_flag apple_smc_write_u8
+
+int apple_smc_register_notifier(struct apple_smc *smc, struct notifier_block *n);
+int apple_smc_unregister_notifier(struct apple_smc *smc, struct notifier_block *n);
+
+/* backend interface */
+
+struct apple_smc_backend_ops {
+	int (*read_key)(void *cookie, smc_key key, void *buf, size_t size);
+	int (*write_key)(void *cookie, smc_key key, void *buf, size_t size);
+	int (*write_key_atomic)(void *cookie, smc_key key, void *buf, size_t size);
+	int (*rw_key)(void *cookie, smc_key key, void *wbuf, size_t wsize,
+		      void *rbuf, size_t rsize);
+	int (*get_key_by_index)(void *cookie, int index, smc_key *key);
+	int (*get_key_info)(void *cookie, smc_key key, struct apple_smc_key_info *info);
+};
+
+struct apple_smc *apple_smc_probe(struct device *dev, const struct apple_smc_backend_ops *ops,
+				  void *cookie);
+void *apple_smc_get_cookie(struct apple_smc *smc);
+int apple_smc_remove(struct apple_smc *smc);
+void apple_smc_event_received(struct apple_smc *smc, uint32_t event);
+
+#endif
-- 
2.30.2

