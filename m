Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4884C624A64
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 20:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbiKJTNc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 14:13:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbiKJTN3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 14:13:29 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26A2B32
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 11:13:26 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id bs21so3660407wrb.4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 11:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OM+j53l8lOw0VZ1te5JEjZPh0UB/GNO/YpCFsM8fnsc=;
        b=jbiYFq4SOo03FkvaOwDMzdyTSyoVWrDDiwWvQOMj58dgNjyaClzi9ZgpiBng5bOIJw
         BrR2HqD4w09F+jSMWRvO2dUGHI3JfX8nb8f8FyCJFTxUsWtEX2VF/0deXOgxUCqEl+Sj
         SffdQN/yIj13dvUSC9wnQHkGafiwVIfVIEab+BBh/M78L6RAqe5fy3lpmiT+SbeiHqN9
         q3pBsYKAsgvjtQdTiqJmOKKm1o+Snjx/tQxVegZjEWNmMp4P3lOxz/bnojB/Ms/T6dfX
         wvXxnPwFj2edj/cWh0w7iD0pWH1A3aUqscQA7sH4fel9WFb23N8NS+mgm+5TZ1pmanY+
         +OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OM+j53l8lOw0VZ1te5JEjZPh0UB/GNO/YpCFsM8fnsc=;
        b=0KovJ0244yt9Aoi/s+tI/kToTqsp3Hc+u3yz20biQCHmsERP+PrMVinzrG9AVxZMD3
         OZ5J4DHLzjEKER7kWI3HZjSWmeB85/NamPXh564BS6ilsvDrKqgAVVjlf8pQY2x52abR
         rxCBV7h1fG1DBiTExwSDppiWEeSewaDuXUAI9TET1a0ucKeNsb4xrX9IrdOzTBLapYql
         1fIlrrjVA16lr3GY0Fo2Iv18ACbMMCQXBsMqBARyLdTRQeliA8gzTNLOd/1f4eG+okZr
         qcoI3qaf8BBSlzCUTmxph/SpdcduVM2DaJKDQH5kW47lrcHQS+Lpocn9Tpjttw6sL0ZH
         25uw==
X-Gm-Message-State: ACrzQf2ZGXKWLleKFMHRfJiCxm7awf3ZW20OXGso2KNsZTuGyDBZkT0A
        XvcPoBS1xaAp3XGzjJGvQH8dlOawW3Wb0w==
X-Google-Smtp-Source: AMsMyM5LiLwvVQ6IbiiIPjcBXE+MXm+Gh/HAoSLg2iFVblfoo0QsJ8oTyZPiJsU4zPUSO0cOVrwKWg==
X-Received: by 2002:adf:db0c:0:b0:236:c23f:c15c with SMTP id s12-20020adfdb0c000000b00236c23fc15cmr39308020wri.90.1668107604890;
        Thu, 10 Nov 2022 11:13:24 -0800 (PST)
Received: from localhost.localdomain ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id bk28-20020a0560001d9c00b002365b759b65sm17025102wrb.86.2022.11.10.11.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:13:24 -0800 (PST)
From:   Niyas Sait <niyas.sait@linaro.org>
To:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org,
        linus.walleij@linaro.org
Cc:     Niyas Sait <niyas.sait@linaro.org>
Subject: [PATCH RFC 3/3] pinctrl: add support for acpi pin function and config resources
Date:   Thu, 10 Nov 2022 19:12:58 +0000
Message-Id: <20221110191258.1134378-4-niyas.sait@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110191258.1134378-1-niyas.sait@linaro.org>
References: <20221110191258.1134378-1-niyas.sait@linaro.org>
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

Add support for following acpi pin resources

- PinFunction
- PinConfig
- PinGroupFunction
- PinGroupConfig

Pinctrl-acpi parses the acpi table and generates list of pin
descriptors that can be used by pin controller to set and config pin.

Descriptors are grouped by pin number or group name and contains list
of functions or configs to apply.

Pin config types from acpi are converted to generic pin config types
and passed through the descriptor.

Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
---
 drivers/pinctrl/core.c          |  19 +-
 drivers/pinctrl/core.h          |   3 +
 drivers/pinctrl/pinctrl-acpi.c  | 391 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-acpi.h  |  28 +++
 include/linux/pinctrl/pinctrl.h |  15 ++
 5 files changed, 452 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index ffe39336fcac..03770ac66d48 100644
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
+	if (!ACPI_COMPANION(dev)) {
+		INIT_LIST_HEAD(&p->dt_maps);
+		ret = pinctrl_dt_to_map(p, pctldev);
+	} else {
+		INIT_LIST_HEAD(&p->acpi_maps);
+		ret = pinctrl_acpi_to_map(p);
+	}
+
 	if (ret < 0) {
 		kfree(p);
 		return ERR_PTR(ret);
@@ -1168,7 +1175,11 @@ static void pinctrl_free(struct pinctrl *p, bool inlist)
 		kfree(state);
 	}
 
-	pinctrl_dt_free_maps(p);
+	if (!ACPI_COMPANION(p->dev)) {
+		pinctrl_dt_free_maps(p);
+	} else {
+		pinctrl_acpi_free_maps(p);
+	}
 
 	if (inlist)
 		list_del(&p->node);
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 840103c40c14..28f2f9d518d4 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -72,6 +72,8 @@ struct pinctrl_dev {
  * @state: the current state
  * @dt_maps: the mapping table chunks dynamically parsed from device tree for
  *	this device, if any
+ * @acpi_maps: the mapping table chunks dynamically parsed from acpi for this
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
index 75e59fe22387..9777577aefd6 100644
--- a/drivers/pinctrl/pinctrl-acpi.c
+++ b/drivers/pinctrl/pinctrl-acpi.c
@@ -10,6 +10,397 @@
 #include <linux/list.h>
 
 #include "pinctrl-acpi.h"
+#include "core.h"
+
+/**
+ * struct pinctrl_acpi_map - mapping table chunk parsed from device tree
+ * @node: list node for struct pinctrl's @acpi_maps field
+ * @pctldev: the pin controller that allocated this struct, and will free it
+ * @map: the mapping table entries
+ * @num_maps: number of mapping table entries
+ */
+struct pinctrl_acpi_map {
+	struct list_head node;
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_map *map;
+	unsigned int num_maps;
+};
+
+static void acpi_free_map(struct pinctrl_dev *pctldev,
+			 struct pinctrl_map *map, unsigned int num_maps)
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
+
+	} else {
+		/* There is no pctldev for PIN_MAP_TYPE_DUMMY_STATE */
+		kfree(map);
+	}
+}
+
+void pinctrl_acpi_free_maps(struct pinctrl *p)
+{
+	struct pinctrl_acpi_map *acpi_map, *n1;
+
+	list_for_each_entry_safe(acpi_map, n1, &p->acpi_maps, node) {
+		pinctrl_unregister_mappings(acpi_map->map);
+		list_del(&acpi_map->node);
+		acpi_free_map(acpi_map->pctldev, acpi_map->map,
+				acpi_map->num_maps);
+		kfree(acpi_map);
+	}
+}
+
+static int acpi_remember_or_free_map(struct pinctrl *p, const char *statename,
+				   struct pinctrl_dev *pctldev,
+				   struct pinctrl_map *map, unsigned num_maps)
+{
+	int i;
+	struct pinctrl_acpi_map *acpi_map;
+
+	/* Initialize common mapping table entry fields */
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
+	/* Remember the converted mapping table entries */
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
+/* Convert raw acpi device references to device name */
+static const char *acpi_node_to_device_name(char *acpi_node)
+{
+	acpi_status status;
+	acpi_handle handle;
+	struct acpi_device *controller_device;
+
+	status = acpi_get_handle(NULL, acpi_node, &handle);
+
+	if (ACPI_FAILURE(status))
+		return NULL;
+
+	controller_device = acpi_bus_get_acpi_device(handle);
+
+	if (!controller_device)
+		return NULL;
+
+	return acpi_dev_name(controller_device);
+}
+
+/* Map acpi pin configuration types to pinctrl general configuration type */
+static unsigned map_acpi_conf_to_general_conf(unsigned param, unsigned value)
+{
+	switch (param) {
+	case ACPI_PIN_CONFIG_DEFAULT:
+		return pinconf_to_config_packed(ACPI_PIN_CONFIG_DEFAULT, 0);
+	case ACPI_PIN_CONFIG_BIAS_PULL_UP:
+		return pinconf_to_config_packed(PIN_CONFIG_BIAS_PULL_UP_OHMS, value);
+	case ACPI_PIN_CONFIG_BIAS_PULL_DOWN:
+		return pinconf_to_config_packed(PIN_CONFIG_BIAS_PULL_DOWN_OHMS, value);
+	case ACPI_PIN_CONFIG_BIAS_DEFAULT:
+		return pinconf_to_config_packed(PIN_CONFIG_BIAS_PULL_PIN_DEFAULT, 0);
+	case ACPI_PIN_CONFIG_BIAS_DISABLE:
+		return pinconf_to_config_packed(PIN_CONFIG_BIAS_DISABLE, 0);
+	case ACPI_PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+		return pinconf_to_config_packed(PIN_CONFIG_BIAS_HIGH_IMPEDANCE, 0);
+	case ACPI_PIN_CONFIG_BIAS_BUS_HOLD:
+		return pinconf_to_config_packed(PIN_CONFIG_BIAS_BUS_HOLD, 0);
+	case ACPI_PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		return pinconf_to_config_packed(PIN_CONFIG_DRIVE_OPEN_DRAIN, 0);
+	case ACPI_PIN_CONFIG_DRIVE_OPEN_SOURCE:
+		return pinconf_to_config_packed(PIN_CONFIG_DRIVE_OPEN_SOURCE, 0);
+	case ACPI_PIN_CONFIG_DRIVE_PUSH_PULL:
+		return pinconf_to_config_packed(PIN_CONFIG_DRIVE_PUSH_PULL, 0);
+	case ACPI_PIN_CONFIG_DRIVE_STRENGTH:
+		return pinconf_to_config_packed(PIN_CONFIG_DRIVE_STRENGTH, value);
+	case ACPI_PIN_CONFIG_SLEW_RATE:
+		return pinconf_to_config_packed(PIN_CONFIG_SLEW_RATE, value);
+	case ACPI_PIN_CONFIG_INPUT_DEBOUNCE:
+		return pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE, value);
+	case ACPI_PIN_CONFIG_INPUT_SCHMITT_TRIGGER:
+		return pinconf_to_config_packed(PIN_CONFIG_INPUT_SCHMITT_ENABLE, value);
+	default:
+		pr_warn("PINCTRL: ACPI pin configuration type (%d) not handled\n", param);
+		return pinconf_to_config_packed(ACPI_PIN_CONFIG_DEFAULT, 0);
+	}
+}
+
+struct pinctrl_acpi_controller_map {
+	char *pinctrl_dev;
+	struct list_head list;
+	struct list_head pin_group_maps;
+};
+
+/* Add pin/group function and configuration descriptor to internal map */
+static int add_pin_group_node(struct list_head *acpi_map_head,
+							char *pinctrl_dev,
+							char *group,
+							unsigned pin,
+							bool is_config,
+							unsigned config_func,
+							void *vendor_data)
+{
+	struct pinctrl_acpi_controller_map *acpi_controller_map = NULL;
+	struct pinctrl_acpi_controller_map *acpi_controller_map_iter = NULL;
+	struct pinctrl_acpi_pin_group_map *pin_group_map = NULL;
+	struct pinctrl_acpi_pin_group_map *pin_group_map_iter = NULL;
+	struct pinctrl_acpi_pin_group_info *info = NULL;
+	bool group_pin_match;
+
+	/* Find the pin controller specific list to use to add the descriptor */
+	list_for_each_entry(acpi_controller_map_iter, acpi_map_head, list) {
+		if (!strcmp(acpi_controller_map_iter->pinctrl_dev, pinctrl_dev)) {
+			acpi_controller_map = acpi_controller_map_iter;
+			break;
+		}
+	}
+
+	/* If this is the first entry for the pin controller, allocate an entry */
+	if (!acpi_controller_map) {
+		acpi_controller_map = kzalloc(sizeof(struct pinctrl_acpi_controller_map), GFP_KERNEL);
+
+		if (!acpi_controller_map)
+			return -ENOMEM;
+
+		acpi_controller_map->pinctrl_dev = pinctrl_dev;
+		INIT_LIST_HEAD(&acpi_controller_map->list);
+		INIT_LIST_HEAD(&acpi_controller_map->pin_group_maps);
+		list_add(&acpi_controller_map->list, acpi_map_head);
+	}
+
+	/* Find the group/pin specific node from the descriptor list */
+	list_for_each_entry(pin_group_map_iter, &acpi_controller_map->pin_group_maps, list) {
+		if (group)
+			group_pin_match = !strcmp(pin_group_map_iter->group, group);
+		else
+			group_pin_match = (pin == pin_group_map_iter->pin);
+		if (pin_group_map_iter->is_config == is_config && group_pin_match) {
+			pin_group_map = pin_group_map_iter;
+			break;
+		}
+	}
+
+	if (!pin_group_map) {
+		pin_group_map = kzalloc(sizeof(struct pinctrl_acpi_pin_group_map), GFP_KERNEL);
+
+		if (!pin_group_map)
+			return -ENOMEM;
+
+		pin_group_map->group = group;
+		pin_group_map->pin = pin;
+		pin_group_map->is_config = is_config;
+		INIT_LIST_HEAD(&pin_group_map->list);
+		INIT_LIST_HEAD(&pin_group_map->info);
+		list_add(&pin_group_map->list, &acpi_controller_map->pin_group_maps);
+	}
+
+	/* Allocate descriptor and add the pin configuration/function info */
+	info = kzalloc(sizeof(struct pinctrl_acpi_pin_group_info), GFP_KERNEL);
+
+	if (!info)
+		return -ENOMEM;
+
+	info->config_func = config_func;
+	info->vendor_data = vendor_data;
+	INIT_LIST_HEAD(&info->list);
+	list_add(&info->list, &pin_group_map->info);
+
+	return 0;
+}
+
+static int pinctrl_acpi_populate_pin_group_map(struct acpi_resource *ares, void *data)
+{
+	struct acpi_resource_pin_function *ares_pin_function;
+	struct acpi_resource_pin_config *ares_pin_config;
+	struct acpi_resource_pin_group_function *ares_pin_group_function;
+	struct acpi_resource_pin_group_config *ares_pin_group_config;
+	struct list_head *acpi_map_head = data;
+	int i;
+	int ret;
+	unsigned int config;
+	char *pinctrl_dev;
+	char *group;
+	unsigned int pin;
+	void *vendor_data;
+	unsigned int func;
+
+	switch (ares->type) {
+	case ACPI_RESOURCE_TYPE_PIN_FUNCTION:
+		ares_pin_function = &ares->data.pin_function;
+		vendor_data = ares_pin_function->vendor_data;
+		pinctrl_dev = ares_pin_function->resource_source.string_ptr;
+		group = NULL;
+		func = ares_pin_function->function_number;
+		config = map_acpi_conf_to_general_conf(ares_pin_function->pin_config, 0);
+
+		for (i = 0; i < ares_pin_function->pin_table_length; i++) {
+
+			ret = add_pin_group_node(acpi_map_head, pinctrl_dev, group,
+					ares_pin_function->pin_table[i], false, func, vendor_data);
+
+			if (ret < 0)
+				return ret;
+
+			ret = add_pin_group_node(acpi_map_head, pinctrl_dev, group,
+					ares_pin_function->pin_table[i], true, config, vendor_data);
+
+			if (ret < 0)
+				return ret;
+		}
+		break;
+	case ACPI_RESOURCE_TYPE_PIN_CONFIG:
+		ares_pin_config = &ares->data.pin_config;
+		pinctrl_dev = ares_pin_config->resource_source.string_ptr;
+		group = NULL;
+		func = 0;
+
+		config = map_acpi_conf_to_general_conf(
+			ares_pin_config->pin_config_type,
+			ares_pin_config->pin_config_value);
+
+		vendor_data = ares_pin_config->vendor_data;
+
+		for (i = 0; i < ares_pin_function->pin_table_length; i++) {
+			pin = ares_pin_config->pin_table[i];
+
+			ret = add_pin_group_node(acpi_map_head, pinctrl_dev,
+						group, pin, true, config, vendor_data);
+			if (ret < 0)
+				return ret;
+		}
+		break;
+	case ACPI_RESOURCE_TYPE_PIN_GROUP_FUNCTION:
+		ares_pin_group_function = &ares->data.pin_group_function;
+		vendor_data = ares_pin_group_function->vendor_data;
+		pinctrl_dev = ares_pin_group_function->resource_source.string_ptr;
+		group = ares_pin_group_function->resource_source_label.string_ptr;
+		pin = 0;
+		func = ares_pin_group_function->function_number;
+		ret = add_pin_group_node(acpi_map_head, pinctrl_dev,
+					group, pin, false, func, vendor_data);
+		if (ret < 0)
+			return ret;
+
+		break;
+	case ACPI_RESOURCE_TYPE_PIN_GROUP_CONFIG:
+		ares_pin_group_config = &ares->data.pin_group_config;
+		vendor_data = ares_pin_group_config->vendor_data;
+		pinctrl_dev = ares_pin_group_config->resource_source.string_ptr;
+		group = ares_pin_group_config->resource_source_label.string_ptr;
+		pin = 0;
+
+		config = map_acpi_conf_to_general_conf(
+					ares_pin_group_config->pin_config_type,
+					ares_pin_group_config->pin_config_value);
+
+		ret = add_pin_group_node(acpi_map_head, pinctrl_dev, group,
+					pin, true, config, vendor_data);
+		if (ret < 0)
+			return ret;
+
+		break;
+	}
+	return 1;
+}
+
+static int pinctrl_acpi_get_pin_group_map(struct acpi_device *adev, struct list_head *pin_group_root)
+{
+	struct list_head res_list;
+	int ret;
+
+	INIT_LIST_HEAD(&res_list);
+
+	ret = acpi_dev_get_resources(adev, &res_list,
+								 pinctrl_acpi_populate_pin_group_map,
+								 pin_group_root);
+
+	acpi_dev_free_resource_list(&res_list);
+
+	return ret;
+}
+
+/* Decode and register acpi pinctrl related properties to pinctrl system */
+int pinctrl_acpi_to_map(struct pinctrl *p)
+{
+	int num_maps;
+	int ret;
+	struct acpi_device *adev;
+	struct list_head pin_group_list;
+	struct pinctrl_map *new_map;
+	struct pinctrl_dev *pctldev;
+	const struct pinctrl_ops *ops;
+	struct pinctrl_acpi_controller_map *controller_map;
+
+	adev = ACPI_COMPANION(p->dev);
+	if (!adev)
+		return -ENODEV;
+
+	/* list to hold the pin/group descriptors generated, grouped by pin controller, pin/group name*/
+	INIT_LIST_HEAD(&pin_group_list);
+
+	ret = pinctrl_acpi_get_pin_group_map(adev, &pin_group_list);
+	if (ret < 0)
+		return ret;
+
+	/* Iterate over descriptor for each pin controller and invoke the driver function */
+	list_for_each_entry(controller_map, &pin_group_list, list) {
+		const char *pinctrl_dev_name = acpi_node_to_device_name(controller_map->pinctrl_dev);
+
+		pctldev = get_pinctrl_dev_from_devname(pinctrl_dev_name);
+		ops = pctldev->desc->pctlops;
+		if (!ops->acpi_node_to_map) {
+			dev_err(p->dev, "pctldev %s doesn't support ACPI\n",
+				dev_name(pctldev->dev));
+			return -ENODEV;
+		}
+		ret = ops->acpi_node_to_map(pctldev, &controller_map->pin_group_maps, &new_map, &num_maps);
+		if (ret < 0) {
+			return ret;
+		} else if (num_maps == 0) {
+			dev_info(p->dev, "there is not valid maps for pin controller %s\n", pinctrl_dev_name);
+			return 0;
+		}
+
+		ret = acpi_remember_or_free_map(p, "default", pctldev, new_map, num_maps);
+		if (ret < 0) {
+			dev_info(p->dev, "Failed to register maps\n");
+			return ret;
+		}
+	}
+	return 0;
+}
 
 static int pinctrl_acpi_populate_group_desc(struct acpi_resource *ares, void *data)
 {
diff --git a/drivers/pinctrl/pinctrl-acpi.h b/drivers/pinctrl/pinctrl-acpi.h
index 1a0c751a7594..4ed45b22257c 100644
--- a/drivers/pinctrl/pinctrl-acpi.h
+++ b/drivers/pinctrl/pinctrl-acpi.h
@@ -12,11 +12,39 @@ struct pinctrl_acpi_group_desc {
 	struct list_head list;
 };
 
+struct pinctrl_acpi_pin_group_map {
+	const char *group;
+	unsigned int pin;
+	bool is_config;
+    struct list_head info;
+	struct list_head list;
+};
+
+struct pinctrl_acpi_pin_group_info {
+	unsigned config_func;
+	void *vendor_data;
+    struct list_head list;
+};
+
 #ifdef CONFIG_ACPI
 int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list);
+
+int pinctrl_acpi_to_map(struct pinctrl *p);
+
+void pinctrl_acpi_free_maps(struct pinctrl *p);
 #else
 int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list)
 {
 	return -ENODEV;
 }
+
+int pinctrl_acpi_to_map(struct pinctrl *p)
+{
+	return -ENODEV;
+}
+
+void pinctrl_acpi_free_maps(struct pinctrl *p)
+{
+
+}
 #endif
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 70b45d28e7a9..99a087888c0d 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -84,6 +84,15 @@ struct pinctrl_gpio_range {
  *	allocated members of the mapping table entries themselves. This
  *	function is optional, and may be omitted for pinctrl drivers that do
  *	not support device tree.
+ * @acpi_node_to_map: process acpi pin related properties, and create
+ *	mapping table entries for it. These are returned through the @map and
+ *	@num_maps output parameters. This function is optional, and may be
+ *	omitted for pinctrl drivers that do not support acpi.
+ * @acpi_free_map: free mapping table entries created via @dt_node_to_map. The
+ *	top-level @map pointer must be freed, along with any dynamically
+ *	allocated members of the mapping table entries themselves. This
+ *	function is optional, and may be omitted for pinctrl drivers that do
+ *	not support acpi.
  */
 struct pinctrl_ops {
 	int (*get_groups_count) (struct pinctrl_dev *pctldev);
@@ -100,6 +109,12 @@ struct pinctrl_ops {
 			       struct pinctrl_map **map, unsigned *num_maps);
 	void (*dt_free_map) (struct pinctrl_dev *pctldev,
 			     struct pinctrl_map *map, unsigned num_maps);
+	int (*acpi_node_to_map) (struct pinctrl_dev *pctldev,
+			       struct list_head *info_list,
+			       struct pinctrl_map **map, unsigned *num_maps);
+	void (*acpi_free_map) (struct pinctrl_dev *pctldev,
+				   struct pinctrl_map *map, unsigned num_maps);
+
 };
 
 /**
-- 
2.25.1

