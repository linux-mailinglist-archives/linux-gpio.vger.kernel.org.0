Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5E963DAE3
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 17:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbiK3QlI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 11:41:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbiK3QlC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 11:41:02 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB00E8BD2E
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:40:53 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso1784960wmb.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7n6sJnsDWXwxE8ka1EUwoXigEBtrEI20/OVlaPZ1sM=;
        b=y0WCoh4hQrTsiaPrcfI0VtDBk7vDPjxx0k7MpKYHc3lBt7pR2qwXp4oo48u3MJgt/6
         S5eiSWkw1XWAozlE/KhchvqMJVRbyMNwl3/Iz0rcLBG24SDruQxu3sR3QGFKWC9R0Erj
         qouhATm6B+Em+KCZq+uZ3LBLFymyohwak4agWuSg2raHAt4+5UZ1Fytmcb7wzhPBd2Qj
         5CAjnUaaW6614XUNh43pZ7tWfo/f82+JwYlO+Wjj9OB0e50VleIWMTEsv0L60Ax7wPQH
         ARHPa0x7YuQG2SlqCnm9kfQK4VYMd/L4ywCdTel6C7qgSZSEUsd/hw87lV4kbnwpcsru
         VP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7n6sJnsDWXwxE8ka1EUwoXigEBtrEI20/OVlaPZ1sM=;
        b=DRDlhZA1Dszbt3U9hti6xB5BvBqV61wkTg9QcTcrfieXc9st92SwQbVbbBbrVCqQ63
         QZVpKD4bUWHMNygtaz6ZBky+0gaLRpI8Vp5WvtGomnj/kWBv2ulxd7+hKzsbCXlOIYh7
         tAr6FBx13/XXg+UAhbnDr97N7oDnBrnPnVsV/satBa+KSYTYYm+DYi185HbzS7Rv3CKA
         1psa2Vier4vzKoNP61HvA3xDZhHrRtq4ULT5rtMzDHS67O3dTd1zgjOmvEsbA4ZISDH3
         /yop36OB9DEvEPTYZ4CROphF8L4GSTx2yNb7hhsaU1Q38/EdYBw0WDLtHyNt7Xd2GhZf
         cZlQ==
X-Gm-Message-State: ANoB5pmQS7byBIR884W2eqKLho4rHth/P98eW+NYzvNVL5gE5SV6DcNJ
        LEZknPKIkuo5flXrUAE9dWO8HMwOEVJlGzKf
X-Google-Smtp-Source: AA0mqf4tnJomvsTdQU8640xjKi1ubiRnV4F4ENCitUDC/1q2oEQpoZOOpKZLJ6h0jHSV15xaGALpfQ==
X-Received: by 2002:a05:600c:a10:b0:3cf:75f4:794a with SMTP id z16-20020a05600c0a1000b003cf75f4794amr48927958wmp.16.1669826451789;
        Wed, 30 Nov 2022 08:40:51 -0800 (PST)
Received: from localhost.localdomain ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id k26-20020a05600c1c9a00b003b47b80cec3sm7003110wms.42.2022.11.30.08.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 08:40:51 -0800 (PST)
From:   Niyas Sait <niyas.sait@linaro.org>
To:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org,
        linus.walleij@linaro.org, fugang.duan@linaro.org
Cc:     Niyas Sait <niyas.sait@linaro.org>
Subject: [PATCH v3 1/2] pinctrl: add support for ACPI pin function and config resources
Date:   Wed, 30 Nov 2022 16:40:26 +0000
Message-Id: <20221130164027.682898-2-niyas.sait@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130164027.682898-1-niyas.sait@linaro.org>
References: <20221130164027.682898-1-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for following ACPI pin resources

- PinFunction
- PinConfig

Pinctrl-acpi parses the ACPI table and generates list of pin
descriptors that can be used by pin controller to set and config pin.

See Documentation/driver-acpi/pin-control-acpi.rst for details

Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
---
 Documentation/driver-api/index.rst            |   1 +
 Documentation/driver-api/pin-control-acpi.rst | 200 +++++++
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/core.c                        |  18 +-
 drivers/pinctrl/core.h                        |   3 +
 drivers/pinctrl/pinctrl-acpi.c                | 525 ++++++++++++++++++
 drivers/pinctrl/pinctrl-acpi.h                |  77 +++
 include/linux/pinctrl/pinctrl.h               |  15 +
 8 files changed, 836 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/driver-api/pin-control-acpi.rst
 create mode 100644 drivers/pinctrl/pinctrl-acpi.c
 create mode 100644 drivers/pinctrl/pinctrl-acpi.h

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index d3a58f77328e..8cb597db1a96 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -64,6 +64,7 @@ available subsections can be seen below.
    uio-howto
    firmware/index
    pin-control
+   pin-control-acpi
    gpio/index
    md/index
    media/index
diff --git a/Documentation/driver-api/pin-control-acpi.rst b/Documentation/driver-api/pin-control-acpi.rst
new file mode 100644
index 000000000000..5d179ba90e8f
--- /dev/null
+++ b/Documentation/driver-api/pin-control-acpi.rst
@@ -0,0 +1,200 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Introduction
+============
+
+This document is an extension of the pin control subsystem in Linux [1] and describes
+the pin control related ACPI properties supported in Linux kernel.
+
+On some platform, certains peripheral buses or devices could be connected to same
+external pin header with a different pin configuration requirement. A simple example of
+this would be a board where pins for I2C data and clock is multiplexed and shared with
+GPIO pins for a display controller. Pins would require different
+configuration in these two modes. For example, I2C functionality would require pin
+bias to be set to pull up with pull strength of 10K Ohms and for GPIO functionality
+pin bias needs to be set to pull down with pull strength of 20K Ohms,
+input Schmitt-trigger enabled and a slew rate of 3.
+
+ACPI 6.2 version [2] introduced following resources to be able to describe different
+pin functions and configurations required for devices.
+
+- PinFunction
+- PinConfig
+- PinGroup
+- PinGroupFunction
+- PinGroupConfig
+
+OSPM will have to handle the above resources and select the pin function and configuration
+through vendor specific interfaces (e.g: memory mapped registers) for the devices to be
+fully functional.
+
+Example 1 : I2C controller SDA/SCL muxed with display controller GPIO pin
+=========================================================================
+
+.. code-block:: text
+
+	//
+	// Description: GPIO
+	//
+	Device (GPI0)
+	{
+		Name (_HID, "PNPFFFE")
+		Name (_UID, 0x0)
+		Method (_STA)
+		{
+			Return(0xf)
+		}
+		Method (_CRS, 0x0, NotSerialized)
+		{
+			Name (RBUF, ResourceTemplate()
+			{
+				Memory32Fixed(ReadWrite, 0x4FE00000, 0x20)
+				Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) {0x54}
+			})
+			Return(RBUF)
+		}
+	}
+
+	//
+	// Description: I2C controller 1
+	//
+	Device (I2C1)
+	{
+		Name (_HID, "PNPFFFF")
+		Name (_UID, 0x0)
+		Method (_STA)
+		{
+			Return(0xf)
+		}
+		Method (_CRS, 0x0, NotSerialized)
+		{
+			Name (RBUF, ResourceTemplate()
+			{
+				Memory32Fixed(ReadWrite, 0x4F800000, 0x20)
+				Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) {0x55}
+				PinFunction(Exclusive, PullDefault, 0x5, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
+				// Configure 10k Pull up for I2C SDA/SCL pins
+				PinConfig(Exclusive, 0x01, 10000, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
+			})
+			Return(RBUF)
+		}
+	}
+
+	//
+	// Description: Physical display panel
+	//
+	Device (SDIO)
+	{
+		Name (_HID, "PNPFFFD")
+		Name (_UID, 0x0)
+		Method (_STA)
+		{
+			Return(0xf)
+		}
+		Method (_CRS, 0x0, NotSerialized)
+		{
+			Name (RBUF, ResourceTemplate()
+			{
+				Memory32Fixed(ReadWrite, 0x4F900000, 0x20)
+				Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) {0x57}
+				GpioIo(Shared, PullDefault, 0, 0, IoRestrictionNone, "\\_SB.GPI0",) {2, 3}
+				// Configure 20k Pull down
+				PinConfig(Exclusive, 0x02, 20000, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
+				// Enable Schmitt-trigger
+				PinConfig(Exclusive, 0x0D, 1, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
+				// Set slew rate to custom value 3
+				PinConfig(Exclusive, 0x0B, 3, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
+			})
+			Return(RBUF)
+		}
+	}
+
+Notes for pin controller device driver developers
+=================================================
+
+This section contains few examples and guidelines for device driver developers to
+add bindings to handle ACPI pin resources.
+
+Pin control devices can add callbacks for following pinctrl_ops to handle ACPI
+pin resources.
+
+.. code-block:: c
+
+	struct pinctrl_ops {
+		...
+		int (*acpi_node_to_map)(struct pinctrl_dev *pctldev,
+					struct pinctrl_acpi_resource *resource,
+					struct pinctrl_map **map, unsigned *num_maps);
+		void (*acpi_free_map)(struct pinctrl_dev *pctldev,
+					struct pinctrl_map *map, unsigned num_maps);
+		...
+	}
+
+Following example demonstrate how the pinctrl_acpi_resource struct can be mapped
+to generic pinctrl_map.
+
+.. code-block:: c
+
+	int example_acpi_node_to_map(struct pinctrl_dev *pctldev,
+					struct pinctrl_acpi_resource *resource,
+					struct pinctrl_map **map,
+					unsigned *num_maps_out)
+	{
+
+		...
+		new_map = devm_kzalloc(pctldev->dev, sizeof(struct pinctrl_map),
+				GFP_KERNEL);
+
+		switch (info->type) {
+		case PINCTRL_ACPI_PIN_FUNCTION:
+			new_map->type = PIN_MAP_TYPE_MUX_GROUP;
+			new_map->data.mux.group = example_pinctrl_find_pin_group(
+							info->function.function_number,
+							info->function.pins, info->function.npins);
+			new_map->data.mux.function = pinctrl_find_function(info->function.function_number);
+			break;
+		case PINCTRL_ACPI_PIN_CONFIG:
+			new_map->type = PIN_MAP_TYPE_CONFIGS_PIN;
+			new_map->data.configs.group_or_pin = pin_get_name(pctldev, info->config.pin);
+			new_map->data.configs.configs = devm_kcalloc(
+				pctldev->dev, info->config.nconfigs,
+				sizeof(unsigned long), GFP_KERNEL);
+			new_map->data.configs.num_configs = 0;
+			list_for_each_entry(config_node, info->config.configs, node)
+				new_map->data.configs.configs[new_map->data.configs.num_configs++] =
+					config_node->config;
+			break;
+		}
+
+		...
+	}
+
+Pin controller will have to map function numbers from ACPI to internal function numbers
+and select appropriate group for pin muxing. Multiple pinctrl_map might need to generated
+if more than one group needs to be activated. Above example just assumes all of the pins
+belongs to a single group.
+
+Multiple configurations might need to be applied for a pin and ACPI could have multiple
+resources to define them. E.g:
+
+.. code-block:: text
+
+	// Configure 20k Pull down
+	PinConfig(Exclusive, 0x02, 20000, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
+	// Enable Schmitt-trigger
+	PinConfig(Exclusive, 0x0D, 1, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
+	// Set slew rate to custom value 3
+	PinConfig(Exclusive, 0x0B, 3, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
+
+ACPI pin controller will combine the configurations at the pin level and will invoke
+acpi_node_to_map to map them to struct pinctrl_map. The above ACPI resources would
+generate two struct pinctrl_acpi_resource descriptors, one for each pin, with list
+of configs to apply for each pin.
+
+References
+==========
+
+[1] Documentation/driver-api/pin-control.rst
+
+[2] ACPI Specifications, Version 6.2 - Section 19.6.102 to 19.6.106
+	https://uefi.org/sites/default/files/resources/ACPI_6_2.pdf
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 89bfa01b5231..b5423465131f 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_PINMUX)		+= pinmux.o
 obj-$(CONFIG_PINCONF)		+= pinconf.o
 obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
 obj-$(CONFIG_OF)		+= devicetree.o
+obj-$(CONFIG_ACPI)		+= pinctrl-acpi.o
 
 obj-$(CONFIG_PINCTRL_AMD)	+= pinctrl-amd.o
 obj-$(CONFIG_PINCTRL_APPLE_GPIO) += pinctrl-apple-gpio.o
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 9e57f4c62e60..3ed11e38e995 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -25,6 +25,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/machine.h>
+#include <linux/acpi.h>
 
 #ifdef CONFIG_GPIOLIB
 #include "../gpio/gpiolib.h"
@@ -35,7 +36,7 @@
 #include "devicetree.h"
 #include "pinmux.h"
 #include "pinconf.h"
-
+#include "pinctrl-acpi.h"
 
 static bool pinctrl_dummy_state;
 
@@ -1042,9 +1043,15 @@ static struct pinctrl *create_pinctrl(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 	p->dev = dev;
 	INIT_LIST_HEAD(&p->states);
-	INIT_LIST_HEAD(&p->dt_maps);
 
-	ret = pinctrl_dt_to_map(p, pctldev);
+	if (has_acpi_companion(dev)) {
+		INIT_LIST_HEAD(&p->acpi_maps);
+		ret = pinctrl_acpi_to_map(p);
+	} else {
+		INIT_LIST_HEAD(&p->dt_maps);
+		ret = pinctrl_dt_to_map(p, pctldev);
+	}
+
 	if (ret < 0) {
 		kfree(p);
 		return ERR_PTR(ret);
@@ -1168,7 +1175,10 @@ static void pinctrl_free(struct pinctrl *p, bool inlist)
 		kfree(state);
 	}
 
-	pinctrl_dt_free_maps(p);
+	if (has_acpi_companion(p->dev))
+		pinctrl_acpi_free_maps(p);
+	else
+		pinctrl_dt_free_maps(p);
 
 	if (inlist)
 		list_del(&p->node);
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 840103c40c14..603e36e175c7 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -72,6 +72,8 @@ struct pinctrl_dev {
  * @state: the current state
  * @dt_maps: the mapping table chunks dynamically parsed from device tree for
  *	this device, if any
+ * @acpi_maps: the mapping table chunks dynamically parsed from ACPI for this
+ *  device, if any
  * @users: reference count
  */
 struct pinctrl {
@@ -80,6 +82,7 @@ struct pinctrl {
 	struct list_head states;
 	struct pinctrl_state *state;
 	struct list_head dt_maps;
+	struct list_head acpi_maps;
 	struct kref users;
 };
 
diff --git a/drivers/pinctrl/pinctrl-acpi.c b/drivers/pinctrl/pinctrl-acpi.c
new file mode 100644
index 000000000000..a510ff38c60d
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-acpi.c
@@ -0,0 +1,525 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ACPI helpers for PinCtrl API
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ * Author: Niyas Sait <niyas.sait@linaro.org>
+ */
+#include <linux/acpi.h>
+#include <linux/errno.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+#include <linux/list.h>
+
+#include "pinctrl-acpi.h"
+#include "core.h"
+
+/**
+ * struct pin_config_lookup_info - context to use for pin config look up
+ * @pctrl: pinctrl descriptor
+ * @config_maps: list of &struct config_map_info
+ */
+struct pin_config_lookup_info {
+	struct pinctrl *pctrl;
+	struct list_head config_maps;
+};
+
+/**
+ * struct config_map_info - context for config map
+ * @pin: pin for the configs
+ * @pinctrl_acpi: pin controller ACPI name
+ * @configs: list of &struct pinctrl_acpi_config_node
+ * @node: list node
+ * @nconfigs: number of configs
+ */
+struct config_map_info {
+	char *pinctrl_acpi;
+	unsigned int pin;
+	struct list_head configs;
+	struct list_head node;
+	size_t nconfigs;
+};
+
+/**
+ * struct pinctrl_acpi_map - mapping table chunk parsed from ACPI
+ * @node: list node for struct pinctrl's @acpi_maps field
+ * @pctldev: the pin controller that allocated this struct, and will free it
+ * @map: the mapping table entries
+ * @num_maps: number of mapping table entries
+ */
+struct pinctrl_acpi_map {
+	struct list_head node;
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_map *map;
+	size_t num_maps;
+};
+
+static void acpi_free_map(struct pinctrl_dev *pctldev, struct pinctrl_map *map,
+			  unsigned int num_maps)
+{
+	int i;
+
+	for (i = 0; i < num_maps; ++i) {
+		kfree_const(map[i].dev_name);
+		map[i].dev_name = NULL;
+	}
+
+	if (pctldev) {
+		const struct pinctrl_ops *ops = pctldev->desc->pctlops;
+
+		if (ops->acpi_free_map)
+			ops->acpi_free_map(pctldev, map, num_maps);
+	} else {
+		kfree(map);
+	}
+}
+
+/**
+ * pinctrl_acpi_free_maps() - free pinctrl ACPI maps
+ * @p: pinctrl descriptor for the device
+ */
+void pinctrl_acpi_free_maps(struct pinctrl *p)
+{
+	struct pinctrl_acpi_map *acpi_map, *tmp;
+
+	list_for_each_entry_safe(acpi_map, tmp, &p->acpi_maps, node) {
+		pinctrl_unregister_mappings(acpi_map->map);
+		list_del(&acpi_map->node);
+		acpi_free_map(acpi_map->pctldev, acpi_map->map,
+			      acpi_map->num_maps);
+		kfree(acpi_map);
+	}
+}
+
+static int acpi_remember_or_free_map(struct pinctrl *p, const char *statename,
+				     struct pinctrl_dev *pctldev,
+				     struct pinctrl_map *map,
+				     unsigned int num_maps)
+{
+	struct pinctrl_acpi_map *acpi_map;
+	int i;
+
+	for (i = 0; i < num_maps; i++) {
+		const char *devname;
+
+		devname = kstrdup_const(dev_name(p->dev), GFP_KERNEL);
+		if (!devname)
+			goto err_free_map;
+
+		map[i].dev_name = devname;
+		map[i].name = statename;
+		if (pctldev)
+			map[i].ctrl_dev_name = dev_name(pctldev->dev);
+	}
+
+	acpi_map = kzalloc(sizeof(*acpi_map), GFP_KERNEL);
+	if (!acpi_map)
+		goto err_free_map;
+
+	acpi_map->pctldev = pctldev;
+	acpi_map->map = map;
+	acpi_map->num_maps = num_maps;
+	list_add_tail(&acpi_map->node, &p->acpi_maps);
+
+	return pinctrl_register_mappings(map, num_maps);
+
+err_free_map:
+	acpi_free_map(pctldev, map, num_maps);
+	return -ENOMEM;
+}
+
+static struct pinctrl_dev *get_pinctrl_dev_from_acpi_name(char *pinctrl_acpi)
+{
+	struct acpi_device *adev;
+	const char *dev_name;
+	acpi_status status;
+	acpi_handle handle;
+
+	status = acpi_get_handle(NULL, pinctrl_acpi, &handle);
+	if (ACPI_FAILURE(status))
+		return NULL;
+
+	adev = acpi_get_acpi_dev(handle);
+	if (!adev)
+		return NULL;
+
+	dev_name = acpi_dev_name(adev);
+	if (!dev_name)
+		return NULL;
+
+	return get_pinctrl_dev_from_devname(dev_name);
+}
+
+static int acpi_to_generic_pin_config(unsigned int acpi_param,
+				      unsigned int acpi_value,
+				      unsigned int *pin_config)
+{
+	enum pin_config_param genconf_param;
+
+	switch (acpi_param) {
+	case ACPI_PIN_CONFIG_BIAS_PULL_UP:
+		genconf_param = PIN_CONFIG_BIAS_PULL_UP;
+		break;
+	case ACPI_PIN_CONFIG_BIAS_PULL_DOWN:
+		genconf_param = PIN_CONFIG_BIAS_PULL_DOWN;
+		break;
+	case ACPI_PIN_CONFIG_BIAS_DEFAULT:
+		genconf_param = PIN_CONFIG_BIAS_PULL_PIN_DEFAULT;
+		break;
+	case ACPI_PIN_CONFIG_BIAS_DISABLE:
+		genconf_param = PIN_CONFIG_BIAS_DISABLE;
+		break;
+	case ACPI_PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+		genconf_param = PIN_CONFIG_BIAS_HIGH_IMPEDANCE;
+		break;
+	case ACPI_PIN_CONFIG_BIAS_BUS_HOLD:
+		genconf_param = PIN_CONFIG_BIAS_BUS_HOLD;
+		break;
+	case ACPI_PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		genconf_param = PIN_CONFIG_DRIVE_OPEN_DRAIN;
+		break;
+	case ACPI_PIN_CONFIG_DRIVE_OPEN_SOURCE:
+		genconf_param = PIN_CONFIG_DRIVE_OPEN_SOURCE;
+		break;
+	case ACPI_PIN_CONFIG_DRIVE_PUSH_PULL:
+		genconf_param = PIN_CONFIG_DRIVE_PUSH_PULL;
+		break;
+	case ACPI_PIN_CONFIG_DRIVE_STRENGTH:
+		genconf_param = PIN_CONFIG_DRIVE_STRENGTH;
+		break;
+	case ACPI_PIN_CONFIG_SLEW_RATE:
+		genconf_param = PIN_CONFIG_SLEW_RATE;
+		break;
+	case ACPI_PIN_CONFIG_INPUT_DEBOUNCE:
+		genconf_param = PIN_CONFIG_INPUT_DEBOUNCE;
+		break;
+	case ACPI_PIN_CONFIG_INPUT_SCHMITT_TRIGGER:
+		genconf_param = PIN_CONFIG_INPUT_SCHMITT_ENABLE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	*pin_config = pinconf_to_config_packed(genconf_param, acpi_value);
+
+	return 0;
+}
+
+static int add_to_config_map(struct list_head *config_maps, char *pinctrl_acpi,
+			     unsigned int pin, unsigned long config)
+{
+	struct config_map_info *config_map;
+	struct pinctrl_acpi_config_node *config_node;
+
+	config_node =
+		kzalloc(sizeof(struct pinctrl_acpi_config_node), GFP_KERNEL);
+	if (!config_node)
+		return -ENOMEM;
+
+	config_node->config = config;
+	INIT_LIST_HEAD(&config_node->node);
+
+	list_for_each_entry(config_map, config_maps, node) {
+		if (strcmp(config_map->pinctrl_acpi, pinctrl_acpi) == 0 &&
+		    config_map->pin == pin) {
+			list_add(&config_node->node, &config_map->configs);
+			config_map->nconfigs++;
+			return 0;
+		}
+	}
+
+	config_map = kzalloc(sizeof(struct config_map_info), GFP_KERNEL);
+	if (!config_map)
+		goto err_free_config_node;
+
+	config_map->pin = pin;
+	config_map->pinctrl_acpi = pinctrl_acpi;
+	config_map->nconfigs = 1;
+	INIT_LIST_HEAD(&config_map->node);
+	INIT_LIST_HEAD(&config_map->configs);
+	list_add(&config_node->node, &config_map->configs);
+	list_add(&config_map->node, config_maps);
+
+	return 0;
+
+err_free_config_node:
+	kfree(config_node);
+	return -ENOMEM;
+}
+
+static int
+acpi_pin_resource_to_pinctrl_map(struct pinctrl *p, char *pinctrl_acpi,
+				 struct pinctrl_acpi_resource *resource)
+{
+	const struct pinctrl_ops *ops;
+	struct pinctrl_map *new_map;
+	struct pinctrl_dev *pctldev;
+	unsigned int num_maps;
+	int ret;
+
+	pctldev = get_pinctrl_dev_from_acpi_name(pinctrl_acpi);
+	if (!pctldev) {
+		dev_err(p->dev, "pctldev with ACPI name '%s' not found\n",
+			pinctrl_acpi);
+		return -ENXIO;
+	}
+
+	ops = pctldev->desc->pctlops;
+	if (!ops->acpi_node_to_map) {
+		dev_err(p->dev, "pctldev %s doesn't support ACPI\n",
+			dev_name(pctldev->dev));
+		return -ENXIO;
+	}
+
+	ret = ops->acpi_node_to_map(pctldev, resource, &new_map, &num_maps);
+	if (ret < 0)
+		return ret;
+
+	ret = acpi_remember_or_free_map(p, "default", pctldev, new_map,
+					num_maps);
+
+	return ret;
+}
+
+static int acpi_pin_function_to_pinctrl_map(struct pinctrl *p,
+					    char *pinctrl_acpi,
+					    unsigned int *pins, size_t npins,
+					    int function)
+{
+	struct pinctrl_acpi_resource resource = {
+		.type = PINCTRL_ACPI_PIN_FUNCTION,
+		.function.pins = pins,
+		.function.npins = npins,
+		.function.function_number = function
+	};
+
+	return acpi_pin_resource_to_pinctrl_map(p, pinctrl_acpi, &resource);
+}
+
+static int acpi_pin_config_to_pinctrl_map(struct pinctrl *p, char *pinctrl_acpi,
+					  unsigned int pin,
+					  struct list_head *configs,
+					  size_t nconfigs)
+{
+	struct pinctrl_acpi_resource resource = {
+		.type = PINCTRL_ACPI_PIN_CONFIG,
+		.config.pin = pin,
+		.config.configs = configs,
+		.config.nconfigs = nconfigs
+	};
+
+	return acpi_pin_resource_to_pinctrl_map(p, pinctrl_acpi, &resource);
+}
+
+static int
+process_pin_config_from_pin_function(struct pinctrl *p,
+				     struct acpi_resource_pin_function *ares)
+{
+	struct pinctrl_acpi_config_node config_node;
+	int i, ret;
+
+	INIT_LIST_HEAD(&config_node.node);
+
+	switch (ares->pin_config) {
+	case ACPI_PIN_CONFIG_PULLUP:
+		config_node.config = PIN_CONFIG_BIAS_PULL_UP;
+		break;
+	case ACPI_PIN_CONFIG_PULLDOWN:
+		config_node.config = PIN_CONFIG_BIAS_PULL_DOWN;
+		break;
+	default:
+		config_node.config = PIN_CONFIG_BIAS_PULL_PIN_DEFAULT;
+		break;
+	}
+
+	for (i = 0; i < ares->pin_table_length; i++) {
+		ret = acpi_pin_config_to_pinctrl_map(
+			p, ares->resource_source.string_ptr, ares->pin_table[i],
+			&config_node.node, 1);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int process_pin_function(struct pinctrl *p,
+				struct acpi_resource_pin_function *ares)
+{
+	unsigned int function;
+	char *pinctrl_acpi;
+	unsigned int *pins;
+	size_t npins;
+	int i, ret;
+
+	function = ares->function_number;
+	pinctrl_acpi = ares->resource_source.string_ptr;
+	npins = ares->pin_table_length;
+	pins = kcalloc(npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	for (i = 0; i < npins; i++)
+		pins[i] = ares->pin_table[i];
+
+	ret = acpi_pin_function_to_pinctrl_map(p, pinctrl_acpi, pins, npins,
+					       function);
+	if (ret >= 0)
+		ret = process_pin_config_from_pin_function(p, ares);
+
+	kfree(pins);
+
+	return ret;
+}
+
+static int process_pin_config(struct list_head *config_maps,
+			      struct acpi_resource_pin_config *ares)
+{
+	unsigned int config;
+	int i, ret;
+
+	ret = acpi_to_generic_pin_config(ares->pin_config_type,
+					 ares->pin_config_value, &config);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < ares->pin_table_length; i++) {
+		ret = add_to_config_map(config_maps,
+					ares->resource_source.string_ptr,
+					ares->pin_table[i], config);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+
+static int parse_acpi_pin_function_resources(struct acpi_resource *ares,
+					     void *data)
+{
+	struct pinctrl *p = data;
+	int ret;
+
+	switch (ares->type) {
+	case ACPI_RESOURCE_TYPE_PIN_FUNCTION:
+		ret = process_pin_function(p, &ares->data.pin_function);
+		if (ret < 0)
+			return ret;
+		break;
+	}
+
+	return 1;
+}
+
+static int parse_acpi_pin_config_resources(struct acpi_resource *ares,
+					   void *data)
+{
+	struct pin_config_lookup_info *info = data;
+	int ret;
+
+	switch (ares->type) {
+	case ACPI_RESOURCE_TYPE_PIN_CONFIG:
+		ret = process_pin_config(&info->config_maps,
+					 &ares->data.pin_config);
+		if (ret < 0)
+			return ret;
+		break;
+	}
+
+	return 1;
+}
+
+static int parse_acpi_pin_functions(struct pinctrl *p)
+{
+	struct list_head res_list;
+	struct acpi_device *adev;
+	int ret;
+
+	INIT_LIST_HEAD(&res_list);
+	adev = ACPI_COMPANION(p->dev);
+	ret = acpi_dev_get_resources(adev, &res_list,
+				     parse_acpi_pin_function_resources, p);
+	if (ret < 0)
+		return ret;
+
+	acpi_dev_free_resource_list(&res_list);
+
+	return 0;
+}
+
+static void free_config_nodes(struct list_head *config_nodes)
+{
+	struct pinctrl_acpi_config_node *config_node, *tmp;
+
+	list_for_each_entry_safe(config_node, tmp, config_nodes, node) {
+		list_del(&config_node->node);
+		kfree(config_node);
+	}
+}
+
+static void free_config_maps(struct list_head *config_maps)
+{
+	struct config_map_info *config_map, *tmp;
+
+	list_for_each_entry_safe(config_map, tmp, config_maps, node) {
+		list_del(&config_map->node);
+		free_config_nodes(&config_map->configs);
+		kfree(config_map);
+	}
+}
+
+static int parse_acpi_pin_configs(struct pinctrl *p)
+{
+	struct pin_config_lookup_info info = { .pctrl = p };
+	struct config_map_info *config_map;
+	struct list_head res_list;
+	int ret;
+
+	INIT_LIST_HEAD(&res_list);
+	INIT_LIST_HEAD(&info.config_maps);
+	ret = acpi_dev_get_resources(ACPI_COMPANION(p->dev), &res_list,
+				     parse_acpi_pin_config_resources, &info);
+	if (ret < 0)
+		return ret;
+
+	list_for_each_entry(config_map, &info.config_maps, node) {
+		ret = acpi_pin_config_to_pinctrl_map(
+			p, config_map->pinctrl_acpi, config_map->pin,
+			&config_map->configs, config_map->nconfigs);
+		if (ret < 0)
+			break;
+	}
+
+	free_config_maps(&info.config_maps);
+	acpi_dev_free_resource_list(&res_list);
+
+	return ret;
+}
+
+/**
+ * pinctrl_acpi_to_map() - pinctrl map from ACPI pin resources for given device
+ * @p: pinctrl descriptor for the device
+ *
+ * This will parse the ACPI pin resources for the device and creates pinctrl map.
+ *
+ * Return: Returns 0 on success, negative errno on failure.
+ */
+int pinctrl_acpi_to_map(struct pinctrl *p)
+{
+	int ret;
+
+	if (!has_acpi_companion(p->dev))
+		return -ENXIO;
+
+	ret = parse_acpi_pin_functions(p);
+	if (ret < 0)
+		return ret;
+
+	ret = parse_acpi_pin_configs(p);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/pinctrl/pinctrl-acpi.h b/drivers/pinctrl/pinctrl-acpi.h
new file mode 100644
index 000000000000..9f9495f5ec6e
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-acpi.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ACPI helpers for PinCtrl API
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+
+/**
+ * struct pinctrl_acpi_config_node - config node descriptor
+ * @config: generic pin config value
+ * @node: list node
+ */
+struct pinctrl_acpi_config_node {
+	unsigned long config;
+	struct list_head node;
+};
+
+/**
+ * struct pinctrl_acpi_pin_function - pin function descriptor
+ * @pins: pin array from ACPI resources
+ * @npins: number of entries in @pins
+ * @function_number: function number to apply for the pin
+ */
+struct pinctrl_acpi_pin_function {
+	unsigned int *pins;
+	size_t npins;
+	unsigned int function_number;
+};
+
+/**
+ * struct pinctrl_acpi_pin_group_config - pin config descriptor
+ * @pin: pin number
+ * @nconfigs: number of configs in @configs
+ * @configs: config list
+ */
+struct pinctrl_acpi_pin_config {
+	unsigned int pin;
+	size_t nconfigs;
+	struct list_head *configs;
+};
+
+/**
+ * enum pinctrl_acpi_resource_type - pinctrl acpi resource type
+ * @PINCTRL_ACPI_PIN_FUNCTION: pin function type
+ * @PINCTRL_ACPI_PIN_CONFIG: pin config type
+ */
+enum pinctrl_acpi_resource_type {
+	PINCTRL_ACPI_PIN_FUNCTION,
+	PINCTRL_ACPI_PIN_CONFIG,
+};
+
+/**
+ * struct pinctrl_acpi_resource - pinctrl acpi resource
+ * @type: resource type
+ * @function: pin function resource descriptor
+ * @config: pin config resource descriptor
+ */
+struct pinctrl_acpi_resource {
+	enum pinctrl_acpi_resource_type type;
+	union {
+		struct pinctrl_acpi_pin_function function;
+		struct pinctrl_acpi_pin_config config;
+	};
+};
+
+#ifdef CONFIG_ACPI
+int pinctrl_acpi_to_map(struct pinctrl *p);
+void pinctrl_acpi_free_maps(struct pinctrl *p);
+#else
+static inline int pinctrl_acpi_to_map(struct pinctrl *p)
+{
+	return -ENXIO;
+}
+static inline void pinctrl_acpi_free_maps(struct pinctrl *p)
+{
+}
+#endif
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 487117ccb1bc..a798351117e0 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -25,6 +25,7 @@ struct pinconf_ops;
 struct pin_config_item;
 struct gpio_chip;
 struct device_node;
+struct pinctrl_acpi_resource;
 
 /**
  * struct pingroup - provides information on pingroup
@@ -104,6 +105,15 @@ struct pinctrl_gpio_range {
  *	allocated members of the mapping table entries themselves. This
  *	function is optional, and may be omitted for pinctrl drivers that do
  *	not support device tree.
+ * @acpi_node_to_map: process ACPI pin related properties, and create
+ *	mapping table entries for it. These are returned through the @map and
+ *	@num_maps output parameters. This function is optional, and may be
+ *	omitted for pinctrl drivers that do not support ACPI.
+ * @acpi_free_map: free mapping table entries created via @acpi_node_to_map. The
+ *	top-level @map pointer must be freed, along with any dynamically
+ *	allocated members of the mapping table entries themselves. This
+ *	function is optional, and may be omitted for pinctrl drivers that do
+ *	not support ACPI.
  */
 struct pinctrl_ops {
 	int (*get_groups_count) (struct pinctrl_dev *pctldev);
@@ -120,6 +130,11 @@ struct pinctrl_ops {
 			       struct pinctrl_map **map, unsigned *num_maps);
 	void (*dt_free_map) (struct pinctrl_dev *pctldev,
 			     struct pinctrl_map *map, unsigned num_maps);
+	int (*acpi_node_to_map)(struct pinctrl_dev *pctldev,
+				struct pinctrl_acpi_resource *resource,
+				struct pinctrl_map **map, unsigned *num_maps);
+	void (*acpi_free_map)(struct pinctrl_dev *pctldev,
+			      struct pinctrl_map *map, unsigned num_maps);
 };
 
 /**
-- 
2.25.1

