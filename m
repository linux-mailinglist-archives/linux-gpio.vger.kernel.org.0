Return-Path: <linux-gpio+bounces-5663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A298A998E
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 14:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CEFAB21085
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 12:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD73D15F3EA;
	Thu, 18 Apr 2024 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQfO5rx7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DF015AAAD;
	Thu, 18 Apr 2024 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713442292; cv=none; b=ZnlrweNQL6Yif2nqoWTsFq+SqbNPGlktPkfjJCIlGMnUJ7cEVZcdKf2xHSMAxKP3RmBWNHJ6tFIS37CH3EJBHllhyPyAMm0ZAD1ZSYyKSDPcPKGaA2GqGpFFW7chuUar3GbZdbWIaNmp8hVlupYEDRd/U6SqVXyE/xeoFTq5O3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713442292; c=relaxed/simple;
	bh=c/MT+AMhCQIXSyAtBVoTFqA8p2WB+lbPLHiOYATO+AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TI50Sm/arz+yFggS93NL4TFCnB++2P910DB4MX9s/I6DU9B5NtbDETO/B+fihsNJrk7BV9j32wbeEE+zkORR1KP7MZuNYU6TzMqH2SBTMTIeHObK0dm6pjlqsFb4E1/V82i2v81Hy+YsZx07kFKIbNqWUhgSibcMAOJOtndxtNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQfO5rx7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1E1C3277B;
	Thu, 18 Apr 2024 12:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713442292;
	bh=c/MT+AMhCQIXSyAtBVoTFqA8p2WB+lbPLHiOYATO+AA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQfO5rx7eRRfuFT3FlKxQD+K+Uj9UKytMNA+y16ouFH0SQdNMr1X3b/u1/YgRwdJx
	 rdXhiJSlpcrBA8ylUBtEfj/LgeoiW7CwTND65ltBn+nxDQy8LXHgwae2VR+o8O3kXq
	 CCw6KnMwiChB7zm0uON/KKD5ec0gPmHQRjZ8oA0VYYJ3YJw0YFcvu3CaOL4Te5rVqJ
	 S4pKHYqyQX6bvyaRJiA2OP8TeVR9y38Lp13ogzP7Aa/+udYEQ9GWdx29oJCX04+/S+
	 b92eg6oUQfqBtMaeWzU82hSlCkng2+SBjQvGZ9UZ0o+DtMbsVlNXJmjdX9/HgoSr8F
	 l6w1GlXs9/ZqA==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Cc: arm@kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v6 02/11] platform: cznic: Add preliminary support for Turris Omnia MCU
Date: Thu, 18 Apr 2024 14:11:07 +0200
Message-ID: <20240418121116.22184-3-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240418121116.22184-1-kabel@kernel.org>
References: <20240418121116.22184-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the basic skeleton for a new platform driver for the microcontroller
found on the Turris Omnia board.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  81 ++++
 MAINTAINERS                                   |   3 +
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/cznic/Kconfig                |  26 ++
 drivers/platform/cznic/Makefile               |   4 +
 .../platform/cznic/turris-omnia-mcu-base.c    | 376 ++++++++++++++++++
 drivers/platform/cznic/turris-omnia-mcu.h     |  50 +++
 include/linux/turris-omnia-mcu-interface.h    | 249 ++++++++++++
 9 files changed, 792 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
 create mode 100644 drivers/platform/cznic/Kconfig
 create mode 100644 drivers/platform/cznic/Makefile
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-base.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu.h
 create mode 100644 include/linux/turris-omnia-mcu-interface.h

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
new file mode 100644
index 000000000000..ff5e7cb00206
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
@@ -0,0 +1,81 @@
+What:		/sys/bus/i2c/devices/<mcu_device>/board_revision
+Date:		July 2024
+KernelVersion:	6.10
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains board revision number.
+
+		Only available if board information is burned in the MCU (older
+		revisions have board information burned in the ATSHA204-A chip).
+
+		Format: %u.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/first_mac_address
+Date:		July 2024
+KernelVersion:	6.10
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains device first MAC address. Each Turris Omnia is
+		allocated 3 MAC addresses. The two additional addresses are
+		computed from the first one by incrementing it.
+
+		Only available if board information is burned in the MCU (older
+		revisions have board information burned in the ATSHA204-A chip).
+
+		Format: %pM.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/fw_features
+Date:		July 2024
+KernelVersion:	6.10
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Newer versions of the microcontroller firmware report the
+		features they support. These can be read from this file. If the
+		MCU firmware is too old, this file reads 0x0.
+
+		Format: 0x%x.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/fw_version_hash_application
+Date:		July 2024
+KernelVersion:	6.10
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the version hash (commit hash) of the application
+		part of the microcontroller firmware.
+
+		Format: %s.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/fw_version_hash_bootloader
+Date:		July 2024
+KernelVersion:	6.10
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the version hash (commit hash) of the bootloader
+		part of the microcontroller firmware.
+
+		Format: %s.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/mcu_type
+Date:		July 2024
+KernelVersion:	6.10
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the microcontroller type (STM32, GD32, MKL).
+
+		Format: %s.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/reset_selector
+Date:		July 2024
+KernelVersion:	6.10
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the selected factory reset level, determined by
+		how long the rear reset button was held by the user during board
+		reset.
+
+		Format: %i.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/serial_number
+Date:		July 2024
+KernelVersion:	6.10
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the 64 bit long board serial number in hexadecimal
+		format.
+
+		Only available if board information is burned in the MCU (older
+		revisions have board information burned in the ATSHA204-A chip).
+
+		Format: %016X.
diff --git a/MAINTAINERS b/MAINTAINERS
index 23637ff1e0bc..b37f7ca81785 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2139,6 +2139,7 @@ M:	Marek Behún <kabel@kernel.org>
 S:	Maintained
 W:	https://www.turris.cz/
 F:	Documentation/ABI/testing/debugfs-moxtet
+F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
 F:	Documentation/ABI/testing/sysfs-bus-moxtet-devices
 F:	Documentation/ABI/testing/sysfs-firmware-turris-mox-rwtm
 F:	Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml
@@ -2152,10 +2153,12 @@ F:	drivers/firmware/turris-mox-rwtm.c
 F:	drivers/gpio/gpio-moxtet.c
 F:	drivers/leds/leds-turris-omnia.c
 F:	drivers/mailbox/armada-37xx-rwtm-mailbox.c
+F:	drivers/platform/cznic/
 F:	drivers/watchdog/armada_37xx_wdt.c
 F:	include/dt-bindings/bus/moxtet.h
 F:	include/linux/armada-37xx-rwtm-mailbox.h
 F:	include/linux/moxtet.h
+F:	include/linux/turris-omnia-mcu-interface.h
 
 ARM/FARADAY FA526 PORT
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 868b20361769..fef907a94001 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -7,6 +7,8 @@ source "drivers/platform/goldfish/Kconfig"
 
 source "drivers/platform/chrome/Kconfig"
 
+source "drivers/platform/cznic/Kconfig"
+
 source "drivers/platform/mellanox/Kconfig"
 
 source "drivers/platform/olpc/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index 41640172975a..8bf189264374 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -10,4 +10,5 @@ obj-$(CONFIG_MIPS)		+= mips/
 obj-$(CONFIG_OLPC_EC)		+= olpc/
 obj-$(CONFIG_GOLDFISH)		+= goldfish/
 obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
+obj-$(CONFIG_CZNIC_PLATFORMS)	+= cznic/
 obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
new file mode 100644
index 000000000000..f8560ff9c1af
--- /dev/null
+++ b/drivers/platform/cznic/Kconfig
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# For a description of the syntax of this configuration file,
+# see Documentation/kbuild/kconfig-language.rst.
+#
+
+menuconfig CZNIC_PLATFORMS
+	bool "Platform support for CZ.NIC's Turris hardware"
+	depends on MACH_ARMADA_38X || COMPILE_TEST
+	help
+	  Say Y here to be able to choose driver support for CZ.NIC's Turris
+	  devices. This option alone does not add any kernel code.
+
+if CZNIC_PLATFORMS
+
+config TURRIS_OMNIA_MCU
+	tristate "Turris Omnia MCU driver"
+	depends on MACH_ARMADA_38X || COMPILE_TEST
+	depends on I2C
+	help
+	  Say Y here to add support for the features implemented by the
+	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
+	  To compile this driver as a module, choose M here; the module will be
+	  called turris-omnia-mcu.
+
+endif # CZNIC_PLATFORMS
diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
new file mode 100644
index 000000000000..31adca73bb94
--- /dev/null
+++ b/drivers/platform/cznic/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
+turris-omnia-mcu-y		:= turris-omnia-mcu-base.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
new file mode 100644
index 000000000000..8893c990853a
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CZ.NIC's Turris Omnia MCU driver
+ *
+ * 2024 by Marek Behún <kabel@kernel.org>
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/hex.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/turris-omnia-mcu-interface.h>
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+
+#include "turris-omnia-mcu.h"
+
+#define OMNIA_FW_VERSION_LEN		20
+#define OMNIA_FW_VERSION_HEX_LEN	(2 * OMNIA_FW_VERSION_LEN + 1)
+#define OMNIA_BOARD_INFO_LEN		16
+
+int omnia_cmd_read(const struct i2c_client *client, u8 cmd, void *reply,
+		   unsigned int len)
+{
+	struct i2c_msg msgs[2];
+	int ret;
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = 0;
+	msgs[0].len = 1;
+	msgs[0].buf = &cmd;
+	msgs[1].addr = client->addr;
+	msgs[1].flags = I2C_M_RD;
+	msgs[1].len = len;
+	msgs[1].buf = reply;
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret < 0)
+		return ret;
+	if (ret != ARRAY_SIZE(msgs))
+		return -EIO;
+
+	return 0;
+}
+
+static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bootloader,
+				  u8 version[static OMNIA_FW_VERSION_HEX_LEN])
+{
+	u8 reply[OMNIA_FW_VERSION_LEN];
+	int err;
+
+	err = omnia_cmd_read(mcu->client,
+			     bootloader ? CMD_GET_FW_VERSION_BOOT
+					: CMD_GET_FW_VERSION_APP,
+			     reply, sizeof(reply));
+	if (err)
+		return err;
+
+	version[OMNIA_FW_VERSION_HEX_LEN - 1] = '\0';
+	bin2hex(version, reply, OMNIA_FW_VERSION_LEN);
+
+	return 0;
+}
+
+static ssize_t fw_version_hash_show(struct device *dev, char *buf,
+				    bool bootloader)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+	u8 version[OMNIA_FW_VERSION_HEX_LEN];
+	int err;
+
+	err = omnia_get_version_hash(mcu, bootloader, version);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%s\n", version);
+}
+
+static ssize_t fw_version_hash_application_show(struct device *dev,
+						struct device_attribute *a,
+						char *buf)
+{
+	return fw_version_hash_show(dev, buf, false);
+}
+static DEVICE_ATTR_RO(fw_version_hash_application);
+
+static ssize_t fw_version_hash_bootloader_show(struct device *dev,
+					       struct device_attribute *a,
+					       char *buf)
+{
+	return fw_version_hash_show(dev, buf, true);
+}
+static DEVICE_ATTR_RO(fw_version_hash_bootloader);
+
+static ssize_t fw_features_show(struct device *dev, struct device_attribute *a,
+				char *buf)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "0x%x\n", mcu->features);
+}
+static DEVICE_ATTR_RO(fw_features);
+
+static ssize_t mcu_type_show(struct device *dev, struct device_attribute *a,
+			     char *buf)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", mcu->type);
+}
+static DEVICE_ATTR_RO(mcu_type);
+
+static ssize_t reset_selector_show(struct device *dev,
+				   struct device_attribute *a, char *buf)
+{
+	int ret;
+
+	ret = omnia_cmd_read_u8(to_i2c_client(dev), CMD_GET_RESET);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", ret);
+}
+static DEVICE_ATTR_RO(reset_selector);
+
+static ssize_t serial_number_show(struct device *dev,
+				  struct device_attribute *a, char *buf)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%016llX\n", mcu->board_serial_number);
+}
+static DEVICE_ATTR_RO(serial_number);
+
+static ssize_t first_mac_address_show(struct device *dev,
+				      struct device_attribute *a, char *buf)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%pM\n", mcu->board_first_mac);
+}
+static DEVICE_ATTR_RO(first_mac_address);
+
+static ssize_t board_revision_show(struct device *dev,
+				   struct device_attribute *a, char *buf)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", mcu->board_revision);
+}
+static DEVICE_ATTR_RO(board_revision);
+
+static struct attribute *omnia_mcu_base_attrs[] = {
+	&dev_attr_fw_version_hash_application.attr,
+	&dev_attr_fw_version_hash_bootloader.attr,
+	&dev_attr_fw_features.attr,
+	&dev_attr_mcu_type.attr,
+	&dev_attr_reset_selector.attr,
+	&dev_attr_serial_number.attr,
+	&dev_attr_first_mac_address.attr,
+	&dev_attr_board_revision.attr,
+	NULL
+};
+
+static umode_t omnia_mcu_base_attrs_visible(struct kobject *kobj,
+					    struct attribute *a, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+	umode_t mode = a->mode;
+
+	if ((a == &dev_attr_serial_number.attr ||
+	     a == &dev_attr_first_mac_address.attr ||
+	     a == &dev_attr_board_revision.attr) &&
+	    !(mcu->features & FEAT_BOARD_INFO))
+		mode = 0;
+
+	return mode;
+}
+
+static const struct attribute_group omnia_mcu_base_group = {
+	.attrs = omnia_mcu_base_attrs,
+	.is_visible = omnia_mcu_base_attrs_visible,
+};
+
+static const struct attribute_group *omnia_mcu_groups[] = {
+	&omnia_mcu_base_group,
+	NULL
+};
+
+static void omnia_mcu_print_version_hash(struct omnia_mcu *mcu, bool bootloader)
+{
+	const char *type = bootloader ? "bootloader" : "application";
+	struct device *dev = &mcu->client->dev;
+	u8 version[OMNIA_FW_VERSION_HEX_LEN];
+	int err;
+
+	err = omnia_get_version_hash(mcu, bootloader, version);
+	if (err) {
+		dev_err(dev, "Cannot read MCU %s firmware version: %d\n", type,
+			err);
+		return;
+	}
+
+	dev_info(dev, "MCU %s firmware version hash: %s\n", type, version);
+}
+
+static const char *omnia_status_to_mcu_type(uint16_t status)
+{
+	switch (status & STS_MCU_TYPE_MASK) {
+	case STS_MCU_TYPE_STM32:
+		return "STM32";
+	case STS_MCU_TYPE_GD32:
+		return "GD32";
+	case STS_MCU_TYPE_MKL:
+		return "MKL";
+	default:
+		return "unknown";
+	}
+}
+
+static void omnia_info_missing_feature(struct device *dev, const char *feature)
+{
+	dev_info(dev,
+		 "Your board's MCU firmware does not support the %s feature.\n",
+		 feature);
+}
+
+static int omnia_mcu_read_features(struct omnia_mcu *mcu)
+{
+	static const struct {
+		uint16_t mask;
+		const char *name;
+	} features[] = {
+		{ FEAT_EXT_CMDS,	   "extended control and status" },
+		{ FEAT_WDT_PING,	   "watchdog pinging" },
+		{ FEAT_LED_STATE_EXT_MASK, "peripheral LED pins reading" },
+		{ FEAT_NEW_INT_API,	   "new interrupt API" },
+		{ FEAT_POWEROFF_WAKEUP,	   "poweroff and wakeup" },
+		{ FEAT_TRNG,		   "true random number generator" },
+	};
+	struct device *dev = &mcu->client->dev;
+	bool suggest_fw_upgrade = false;
+	int status;
+
+	/* status word holds MCU type, which we need below */
+	status = omnia_cmd_read_u16(mcu->client, CMD_GET_STATUS_WORD);
+	if (status < 0)
+		return status;
+
+	/* check whether MCU firmware supports the CMD_GET_FEAUTRES command */
+	if (status & STS_FEATURES_SUPPORTED) {
+		__le32 reply;
+		int ret;
+
+		/* try read 32-bit features */
+		ret = omnia_cmd_read(mcu->client, CMD_GET_FEATURES, &reply,
+				     sizeof(reply));
+		if (ret) {
+			/* try read 16-bit features */
+			ret = omnia_cmd_read_u16(mcu->client, CMD_GET_FEATURES);
+			if (ret < 0)
+				return ret;
+
+			mcu->features = ret;
+		} else {
+			mcu->features = le32_to_cpu(reply);
+
+			if (mcu->features & FEAT_FROM_BIT_16_INVALID)
+				mcu->features &= GENMASK(15, 0);
+		}
+	} else {
+		omnia_info_missing_feature(dev, "feature reading");
+		suggest_fw_upgrade = true;
+	}
+
+	mcu->type = omnia_status_to_mcu_type(status);
+	dev_info(dev, "MCU type %s%s\n", mcu->type,
+		 (mcu->features & FEAT_PERIPH_MCU) ?
+			", with peripheral resets wired" : "");
+
+	omnia_mcu_print_version_hash(mcu, true);
+
+	if (mcu->features & FEAT_BOOTLOADER)
+		dev_warn(dev,
+			 "MCU is running bootloader firmware. Was firmware upgrade interrupted?\n");
+	else
+		omnia_mcu_print_version_hash(mcu, false);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(features); i++) {
+		if (mcu->features & features[i].mask)
+			continue;
+
+		omnia_info_missing_feature(dev, features[i].name);
+		suggest_fw_upgrade = true;
+	}
+
+	if (suggest_fw_upgrade)
+		dev_info(dev,
+			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
+
+	return 0;
+}
+
+static int omnia_mcu_read_board_info(struct omnia_mcu *mcu)
+{
+	u8 reply[1 + OMNIA_BOARD_INFO_LEN];
+	int err;
+
+	err = omnia_cmd_read(mcu->client, CMD_BOARD_INFO_GET, reply,
+			     sizeof(reply));
+	if (err)
+		return err;
+
+	if (reply[0] != OMNIA_BOARD_INFO_LEN)
+		return -EIO;
+
+	mcu->board_serial_number = get_unaligned_le64(&reply[1]);
+	memcpy(mcu->board_first_mac, &reply[9], ETH_ALEN);
+	mcu->board_revision = reply[15];
+
+	return 0;
+}
+
+static int omnia_mcu_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct omnia_mcu *mcu;
+	int err;
+
+	if (!client->irq)
+		return dev_err_probe(dev, -EINVAL, "IRQ resource not found\n");
+
+	mcu = devm_kzalloc(dev, sizeof(*mcu), GFP_KERNEL);
+	if (!mcu)
+		return -ENOMEM;
+
+	mcu->client = client;
+	i2c_set_clientdata(client, mcu);
+
+	err = omnia_mcu_read_features(mcu);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "Cannot determine MCU supported features\n");
+
+	if (mcu->features & FEAT_BOARD_INFO) {
+		err = omnia_mcu_read_board_info(mcu);
+		if (err)
+			return dev_err_probe(dev, err,
+					     "Cannot read board info\n");
+	}
+
+	return 0;
+}
+
+static const struct of_device_id of_omnia_mcu_match[] = {
+	{ .compatible = "cznic,turris-omnia-mcu" },
+	{}
+};
+
+static struct i2c_driver omnia_mcu_driver = {
+	.probe		= omnia_mcu_probe,
+	.driver		= {
+		.name	= "turris-omnia-mcu",
+		.of_match_table = of_omnia_mcu_match,
+		.dev_groups = omnia_mcu_groups,
+	},
+};
+module_i2c_driver(omnia_mcu_driver);
+
+MODULE_AUTHOR("Marek Behun <kabel@kernel.org>");
+MODULE_DESCRIPTION("CZ.NIC's Turris Omnia MCU");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
new file mode 100644
index 000000000000..5b21fbca8fe1
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * CZ.NIC's Turris Omnia MCU driver
+ *
+ * 2024 by Marek Behún <kabel@kernel.org>
+ */
+
+#ifndef __TURRIS_OMNIA_MCU_H
+#define __TURRIS_OMNIA_MCU_H
+
+#include <linux/i2c.h>
+#include <linux/if_ether.h>
+#include <linux/types.h>
+#include <asm/byteorder.h>
+
+struct omnia_mcu {
+	struct i2c_client *client;
+	const char *type;
+	u32 features;
+
+	/* board information */
+	u64 board_serial_number;
+	u8 board_first_mac[ETH_ALEN];
+	u8 board_revision;
+};
+
+int omnia_cmd_read(const struct i2c_client *client, u8 cmd, void *reply,
+		   unsigned int len);
+
+static inline int omnia_cmd_read_u16(const struct i2c_client *client, u8 cmd)
+{
+	__le16 reply;
+	int err;
+
+	err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
+
+	return err ?: le16_to_cpu(reply);
+}
+
+static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd)
+{
+	u8 reply;
+	int err;
+
+	err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
+
+	return err ?: reply;
+}
+
+#endif /* __TURRIS_OMNIA_MCU_H */
diff --git a/include/linux/turris-omnia-mcu-interface.h b/include/linux/turris-omnia-mcu-interface.h
new file mode 100644
index 000000000000..88f8490b5897
--- /dev/null
+++ b/include/linux/turris-omnia-mcu-interface.h
@@ -0,0 +1,249 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * CZ.NIC's Turris Omnia MCU I2C interface commands definitions
+ *
+ * 2024 by Marek Behún <kabel@kernel.org>
+ */
+
+#ifndef __TURRIS_OMNIA_MCU_INTERFACE_H
+#define __TURRIS_OMNIA_MCU_INTERFACE_H
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
+enum omnia_commands_e {
+	CMD_GET_STATUS_WORD		= 0x01, /* slave sends status word back */
+	CMD_GENERAL_CONTROL		= 0x02,
+	CMD_LED_MODE			= 0x03, /* default/user */
+	CMD_LED_STATE			= 0x04, /* LED on/off */
+	CMD_LED_COLOR			= 0x05, /* LED number + RED + GREEN + BLUE */
+	CMD_USER_VOLTAGE		= 0x06,
+	CMD_SET_BRIGHTNESS		= 0x07,
+	CMD_GET_BRIGHTNESS		= 0x08,
+	CMD_GET_RESET			= 0x09,
+	CMD_GET_FW_VERSION_APP		= 0x0A, /* 20B git hash number */
+	CMD_SET_WATCHDOG_STATE		= 0x0B, /* 0 - disable
+						 * 1 - enable / ping
+						 * after boot watchdog is started
+						 * with 2 minutes timeout
+						 */
+
+	/* CMD_WATCHDOG_STATUS		= 0x0C, not implemented anymore */
+
+	CMD_GET_WATCHDOG_STATE		= 0x0D,
+	CMD_GET_FW_VERSION_BOOT		= 0x0E, /* 20B git hash number */
+	CMD_GET_FW_CHECKSUM		= 0x0F, /* 4B length, 4B checksum */
+
+	/* available if FEATURES_SUPPORTED bit set in status word */
+	CMD_GET_FEATURES		= 0x10,
+
+	/* available if EXT_CMD bit set in features */
+	CMD_GET_EXT_STATUS_DWORD	= 0x11,
+	CMD_EXT_CONTROL			= 0x12,
+	CMD_GET_EXT_CONTROL_STATUS	= 0x13,
+
+	/* available if NEW_INT_API bit set in features */
+	CMD_GET_INT_AND_CLEAR		= 0x14,
+	CMD_GET_INT_MASK		= 0x15,
+	CMD_SET_INT_MASK		= 0x16,
+
+	/* available if FLASHING bit set in features */
+	CMD_FLASH			= 0x19,
+
+	/* available if WDT_PING bit set in features */
+	CMD_SET_WDT_TIMEOUT		= 0x20,
+	CMD_GET_WDT_TIMELEFT		= 0x21,
+
+	/* available if POWEROFF_WAKEUP bit set in features */
+	CMD_SET_WAKEUP			= 0x22,
+	CMD_GET_UPTIME_AND_WAKEUP	= 0x23,
+	CMD_POWER_OFF			= 0x24,
+
+	/* available if USB_OVC_PROT_SETTING bit set in features */
+	CMD_SET_USB_OVC_PROT		= 0x25,
+	CMD_GET_USB_OVC_PROT		= 0x26,
+
+	/* available if TRNG bit set in features */
+	CMD_TRNG_COLLECT_ENTROPY	= 0x28,
+
+	/* available if CRYPTO bit set in features */
+	CMD_CRYPTO_GET_PUBLIC_KEY	= 0x29,
+	CMD_CRYPTO_SIGN_MESSAGE		= 0x2A,
+	CMD_CRYPTO_COLLECT_SIGNATURE	= 0x2B,
+
+	/* available if BOARD_INFO it set in features */
+	CMD_BOARD_INFO_GET		= 0x2C,
+	CMD_BOARD_INFO_BURN		= 0x2D,
+
+	/* available only at address 0x2b (led-controller) */
+	/* available only if LED_GAMMA_CORRECTION bit set in features */
+	CMD_SET_GAMMA_CORRECTION	= 0x30,
+	CMD_GET_GAMMA_CORRECTION	= 0x31,
+
+	/* available only at address 0x2b (led-controller) */
+	/* available only if PER_LED_CORRECTION bit set in features */
+	/* available only if FROM_BIT_16_INVALID bit NOT set in features */
+	CMD_SET_LED_CORRECTIONS		= 0x32,
+	CMD_GET_LED_CORRECTIONS		= 0x33,
+};
+
+enum omnia_flashing_commands_e {
+	FLASH_CMD_UNLOCK		= 0x01,
+	FLASH_CMD_SIZE_AND_CSUM		= 0x02,
+	FLASH_CMD_PROGRAM		= 0x03,
+	FLASH_CMD_RESET			= 0x04,
+};
+
+enum omnia_sts_word_e {
+	STS_MCU_TYPE_MASK			= GENMASK(1, 0),
+	STS_MCU_TYPE_STM32			= 0 << 0,
+	STS_MCU_TYPE_GD32			= 1 << 0,
+	STS_MCU_TYPE_MKL			= 2 << 0,
+	STS_FEATURES_SUPPORTED			= BIT(2),
+	STS_USER_REGULATOR_NOT_SUPPORTED	= BIT(3),
+	STS_CARD_DET				= BIT(4),
+	STS_MSATA_IND				= BIT(5),
+	STS_USB30_OVC				= BIT(6),
+	STS_USB31_OVC				= BIT(7),
+	STS_USB30_PWRON				= BIT(8),
+	STS_USB31_PWRON				= BIT(9),
+	STS_ENABLE_4V5				= BIT(10),
+	STS_BUTTON_MODE				= BIT(11),
+	STS_BUTTON_PRESSED			= BIT(12),
+	STS_BUTTON_COUNTER_MASK			= GENMASK(15, 13)
+};
+
+enum omnia_ctl_byte_e {
+	CTL_LIGHT_RST		= BIT(0),
+	CTL_HARD_RST		= BIT(1),
+	/* BIT(2) is currently reserved */
+	CTL_USB30_PWRON		= BIT(3),
+	CTL_USB31_PWRON		= BIT(4),
+	CTL_ENABLE_4V5		= BIT(5),
+	CTL_BUTTON_MODE		= BIT(6),
+	CTL_BOOTLOADER		= BIT(7)
+};
+
+enum omnia_features_e {
+	FEAT_PERIPH_MCU			= BIT(0),
+	FEAT_EXT_CMDS			= BIT(1),
+	FEAT_WDT_PING			= BIT(2),
+	FEAT_LED_STATE_EXT_MASK		= GENMASK(4, 3),
+	FEAT_LED_STATE_EXT		= 1 << 3,
+	FEAT_LED_STATE_EXT_V32		= 2 << 3,
+	FEAT_LED_GAMMA_CORRECTION	= BIT(5),
+	FEAT_NEW_INT_API		= BIT(6),
+	FEAT_BOOTLOADER			= BIT(7),
+	FEAT_FLASHING			= BIT(8),
+	FEAT_NEW_MESSAGE_API		= BIT(9),
+	FEAT_BRIGHTNESS_INT		= BIT(10),
+	FEAT_POWEROFF_WAKEUP		= BIT(11),
+	FEAT_CAN_OLD_MESSAGE_API	= BIT(12),
+	FEAT_TRNG			= BIT(13),
+	FEAT_CRYPTO			= BIT(14),
+	FEAT_BOARD_INFO			= BIT(15),
+
+	/*
+	 * Orginally the features command replied only 16 bits. If more were
+	 * read, either the I2C transaction failed or 0xff bytes were sent.
+	 * Therefore to consider bits 16 - 31 valid, one bit (20) was reserved
+	 * to be zero.
+	 */
+
+	/* Bits 16 - 19 correspond to bits 0 - 3 of status word */
+	FEAT_MCU_TYPE_MASK		= GENMASK(17, 16),
+	FEAT_MCU_TYPE_STM32		= 0 << 16,
+	FEAT_MCU_TYPE_GD32		= 1 << 16,
+	FEAT_MCU_TYPE_MKL		= 2 << 16,
+	FEAT_FEATURES_SUPPORTED		= BIT(18),
+	FEAT_USER_REGULATOR_NOT_SUPPORTED = BIT(19),
+
+	/* must not be set */
+	FEAT_FROM_BIT_16_INVALID	= BIT(20),
+
+	FEAT_PER_LED_CORRECTION		= BIT(21),
+	FEAT_USB_OVC_PROT_SETTING	= BIT(22),
+};
+
+enum omnia_ext_sts_dword_e {
+	EXT_STS_SFP_nDET		= BIT(0),
+	EXT_STS_LED_STATES_MASK		= GENMASK(31, 12),
+	EXT_STS_WLAN0_MSATA_LED		= BIT(12),
+	EXT_STS_WLAN1_LED		= BIT(13),
+	EXT_STS_WLAN2_LED		= BIT(14),
+	EXT_STS_WPAN0_LED		= BIT(15),
+	EXT_STS_WPAN1_LED		= BIT(16),
+	EXT_STS_WPAN2_LED		= BIT(17),
+	EXT_STS_WAN_LED0		= BIT(18),
+	EXT_STS_WAN_LED1		= BIT(19),
+	EXT_STS_LAN0_LED0		= BIT(20),
+	EXT_STS_LAN0_LED1		= BIT(21),
+	EXT_STS_LAN1_LED0		= BIT(22),
+	EXT_STS_LAN1_LED1		= BIT(23),
+	EXT_STS_LAN2_LED0		= BIT(24),
+	EXT_STS_LAN2_LED1		= BIT(25),
+	EXT_STS_LAN3_LED0		= BIT(26),
+	EXT_STS_LAN3_LED1		= BIT(27),
+	EXT_STS_LAN4_LED0		= BIT(28),
+	EXT_STS_LAN4_LED1		= BIT(29),
+	EXT_STS_LAN5_LED0		= BIT(30),
+	EXT_STS_LAN5_LED1		= BIT(31),
+};
+
+enum omnia_ext_ctl_e {
+	EXT_CTL_nRES_MMC		= BIT(0),
+	EXT_CTL_nRES_LAN		= BIT(1),
+	EXT_CTL_nRES_PHY		= BIT(2),
+	EXT_CTL_nPERST0			= BIT(3),
+	EXT_CTL_nPERST1			= BIT(4),
+	EXT_CTL_nPERST2			= BIT(5),
+	EXT_CTL_PHY_SFP			= BIT(6),
+	EXT_CTL_PHY_SFP_AUTO		= BIT(7),
+	EXT_CTL_nVHV_CTRL		= BIT(8),
+};
+
+enum omnia_int_e {
+	INT_CARD_DET		= BIT(0),
+	INT_MSATA_IND		= BIT(1),
+	INT_USB30_OVC		= BIT(2),
+	INT_USB31_OVC		= BIT(3),
+	INT_BUTTON_PRESSED	= BIT(4),
+	INT_SFP_nDET		= BIT(5),
+	INT_BRIGHTNESS_CHANGED	= BIT(6),
+	INT_TRNG		= BIT(7),
+	INT_MESSAGE_SIGNED	= BIT(8),
+
+	INT_LED_STATES_MASK	= GENMASK(31, 12),
+	INT_WLAN0_MSATA_LED	= BIT(12),
+	INT_WLAN1_LED		= BIT(13),
+	INT_WLAN2_LED		= BIT(14),
+	INT_WPAN0_LED		= BIT(15),
+	INT_WPAN1_LED		= BIT(16),
+	INT_WPAN2_LED		= BIT(17),
+	INT_WAN_LED0		= BIT(18),
+	INT_WAN_LED1		= BIT(19),
+	INT_LAN0_LED0		= BIT(20),
+	INT_LAN0_LED1		= BIT(21),
+	INT_LAN1_LED0		= BIT(22),
+	INT_LAN1_LED1		= BIT(23),
+	INT_LAN2_LED0		= BIT(24),
+	INT_LAN2_LED1		= BIT(25),
+	INT_LAN3_LED0		= BIT(26),
+	INT_LAN3_LED1		= BIT(27),
+	INT_LAN4_LED0		= BIT(28),
+	INT_LAN4_LED1		= BIT(29),
+	INT_LAN5_LED0		= BIT(30),
+	INT_LAN5_LED1		= BIT(31),
+};
+
+enum omnia_cmd_poweroff_e {
+	CMD_POWER_OFF_POWERON_BUTTON	= BIT(0),
+	CMD_POWER_OFF_MAGIC		= 0xdead,
+};
+
+enum cmd_usb_ovc_prot_e {
+	CMD_xET_USB_OVC_PROT_PORT_MASK	= GENMASK(3, 0),
+	CMD_xET_USB_OVC_PROT_ENABLE	= BIT(4),
+};
+
+#endif /* __TURRIS_OMNIA_MCU_INTERFACE_H */
-- 
2.43.2


