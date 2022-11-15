Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFAB962A0C6
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 18:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbiKORyi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 12:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbiKORyg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 12:54:36 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114572EF34
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 09:54:34 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso1649719wmb.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 09:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ipximvh0zSrB+UJI0LuDtadJkbgz20xOJzzq8Ku1jE=;
        b=g4ZnjQaZqHLk+YnSibhmnhjj1zZK2wwMkVr6k4ScNx9SqQd5K6W9Cvvj2npDCm6Q6v
         TiU++vLnNzWqN7mapfnll6Yv/W/c7n8RG4IOny3VP0YRNxjXhkqzoUmYmnHXYc4Ar6xW
         0pUrb4rjfgmHmZNMhfJzQ8kYPGuhWO5sHxkV+JQFnTg7Z3Tm3BfgFK4sV0J7vK1q9nXd
         gEOjxplDA0nFNvoIXfW2RufoV5VLpAz+tDDyCKoWTzDgPIjobAgiADBUOec2tO3aeROE
         xthjW/o0W1yw1/mFhE1gzkZJADo1h3Qhk1VjTj2EO03uw+OTWNnq9Ot7Y8GfdbeI+Wuf
         ERNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ipximvh0zSrB+UJI0LuDtadJkbgz20xOJzzq8Ku1jE=;
        b=bsfPeV3Zmelm0E8hv5lffIzG5bNVTaZT4V4ns89bC908OvIInS8TY7v9kLxbnN2cxm
         FDAiaLHhzdauwk4PZNCpGSqxZg3geBGNm4JK1egBCN94GgHyEUo9I98Ygbysq0cE62GJ
         4dG5KZYp6ikJPg4sV1mBo+gpYu/a8Q54RCNxDXPvasHcR9x0tbnWksd91cHbkmrsZnxX
         zqSTMCa73VxX2nBS1GvoaIDO938G+xtNh6gdAMES7L/09xJtniUOxzFIhWYK0JNXqDbK
         YMguJXnu0LZDtRUZe/5GYcCqJ1g5lzB3N06RHHRHwbMnPDn9mFAbCL10GWXipZaAHmZH
         RLVQ==
X-Gm-Message-State: ANoB5pnsG5qkNWZ1CAFf/SAALDgHcsW5FQKdacOxjhi39Pqj3gvInbHQ
        libr17bNoU6As1NRozHjwosJySEQNf5q0vWJ
X-Google-Smtp-Source: AA0mqf6W1me1Va85nEJdR9UzQdqYT2p/05UWzlyKivu+i9S21t6Cr8z6s7dL72KGAyBvc2Dc22+yEA==
X-Received: by 2002:a05:600c:21c8:b0:3c6:d811:6cff with SMTP id x8-20020a05600c21c800b003c6d8116cffmr1357799wmj.43.1668534872130;
        Tue, 15 Nov 2022 09:54:32 -0800 (PST)
Received: from localhost.localdomain ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id f20-20020a05600c155400b003c6f3e5ba42sm26599521wmg.46.2022.11.15.09.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 09:54:31 -0800 (PST)
From:   Niyas Sait <niyas.sait@linaro.org>
To:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org,
        linus.walleij@linaro.org
Cc:     Niyas Sait <niyas.sait@linaro.org>
Subject: [PATCH RFC v2 3/3] pinctrl: add support for ACPI pin function and config resources
Date:   Tue, 15 Nov 2022 17:54:15 +0000
Message-Id: <20221115175415.650690-4-niyas.sait@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115175415.650690-1-niyas.sait@linaro.org>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
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
- PinGroupFunction
- PinGroupConfig

Pinctrl-acpi parses the ACPI table and generates list of pin
descriptors that can be used by pin controller to set and config pin.

Descriptors are grouped by pin number or group name and contains list
of functions or configs to apply.

Pin config types from ACPI are converted to generic pin config types
and passed through the descriptor.

Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
---
 drivers/pinctrl/core.c          |  18 +-
 drivers/pinctrl/core.h          |   3 +
 drivers/pinctrl/pinctrl-acpi.c  | 443 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-acpi.h  |  44 ++++
 include/linux/pinctrl/pinctrl.h |  15 ++
 5 files changed, 519 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 9e57f4c62e60..00e5066c1087 100644
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
@@ -1168,7 +1175,10 @@ static void pinctrl_free(struct pinctrl *p, bool inlist)
 		kfree(state);
 	}
 
-	pinctrl_dt_free_maps(p);
+	if (!ACPI_COMPANION(p->dev))
+		pinctrl_dt_free_maps(p);
+	else
+		pinctrl_acpi_free_maps(p);
 
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
index cd0d4b2d8868..e337f83e6879 100644
--- a/drivers/pinctrl/pinctrl-acpi.c
+++ b/drivers/pinctrl/pinctrl-acpi.c
@@ -13,6 +13,449 @@
 #include <linux/list.h>
 
 #include "pinctrl-acpi.h"
+#include "core.h"
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
+		kfree(map);
+	}
+}
+
+void pinctrl_acpi_free_maps(struct pinctrl *p)
+{
+	struct pinctrl_acpi_map *acpi_map, *tmp;
+
+	list_for_each_entry_safe(acpi_map, tmp, &p->acpi_maps, node) {
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
+				   struct pinctrl_map *map, unsigned int num_maps)
+{
+	int i;
+	struct pinctrl_acpi_map *acpi_map;
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
+static const char *acpi_node_to_device_name(char *acpi_node)
+{
+	acpi_status status;
+	acpi_handle handle;
+	struct acpi_device *controller_device;
+
+	status = acpi_get_handle(NULL, acpi_node, &handle);
+	if (ACPI_FAILURE(status))
+		return NULL;
+
+	controller_device = acpi_get_acpi_dev(handle);
+	if (!controller_device)
+		return NULL;
+
+	return acpi_dev_name(controller_device);
+}
+
+static int map_acpi_conf_to_general_conf(unsigned int acpi_param,
+			unsigned int acpi_value, unsigned int *pin_config)
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
+/**
+ * struct pinctrl_acpi_controller_map - internal structure to group pin resources
+ * @pinctrl_dev: pin controller ACPI name
+ * @list: list head for the map
+ * @pin_group_maps: list head for the pin/group maps
+ */
+struct pinctrl_acpi_controller_map {
+	char *pinctrl_dev;
+	struct list_head list;
+	struct list_head pin_group_maps;
+};
+
+static int add_pin_group_node(struct list_head *acpi_map_head,
+							char *pinctrl_dev,
+							char *group,
+							unsigned int pin,
+							bool is_config,
+							unsigned int config_func,
+							void *vendor_data,
+							unsigned int vendor_length)
+{
+	struct pinctrl_acpi_controller_map *acpi_controller_map = NULL;
+	struct pinctrl_acpi_controller_map *acpi_controller_map_iter;
+	struct pinctrl_acpi_pin_group_map *pin_group_map = NULL;
+	struct pinctrl_acpi_pin_group_map *pin_group_map_iter;
+	struct pinctrl_acpi_pin_group_info *info;
+	bool group_pin_match;
+
+	list_for_each_entry(acpi_controller_map_iter, acpi_map_head, list) {
+		if (!strcmp(acpi_controller_map_iter->pinctrl_dev, pinctrl_dev)) {
+			acpi_controller_map = acpi_controller_map_iter;
+			break;
+		}
+	}
+
+	if (!acpi_controller_map) {
+		acpi_controller_map = kzalloc(sizeof(*acpi_controller_map), GFP_KERNEL);
+		if (!acpi_controller_map)
+			return -ENOMEM;
+
+		acpi_controller_map->pinctrl_dev = pinctrl_dev;
+		INIT_LIST_HEAD(&acpi_controller_map->list);
+		INIT_LIST_HEAD(&acpi_controller_map->pin_group_maps);
+		list_add(&acpi_controller_map->list, acpi_map_head);
+	}
+
+	list_for_each_entry(pin_group_map_iter, &acpi_controller_map->pin_group_maps, list) {
+		if (group)
+			group_pin_match = pin_group_map_iter->group &&
+					!strcmp(pin_group_map_iter->group, group);
+		else
+			group_pin_match = (pin == pin_group_map_iter->pin);
+
+		if (pin_group_map_iter->is_config == is_config && group_pin_match) {
+			pin_group_map = pin_group_map_iter;
+			break;
+		}
+	}
+
+	if (!pin_group_map) {
+		pin_group_map = kzalloc(sizeof(struct pinctrl_acpi_pin_group_map), GFP_KERNEL);
+		if (!pin_group_map)
+			return -ENOMEM;
+
+		pin_group_map->group = group;
+		pin_group_map->pin = pin;
+		pin_group_map->is_config = is_config;
+		INIT_LIST_HEAD(&pin_group_map->list);
+		INIT_LIST_HEAD(&pin_group_map->info_list);
+		list_add(&pin_group_map->list, &acpi_controller_map->pin_group_maps);
+	}
+
+	info = kzalloc(sizeof(struct pinctrl_acpi_pin_group_info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->config_func = config_func;
+	info->vendor_data = vendor_data;
+	info->vendor_length = vendor_length;
+	INIT_LIST_HEAD(&info->list);
+	list_add(&info->list, &pin_group_map->info_list);
+
+	return 0;
+}
+
+static int populate_pin_function(struct list_head *acpi_map_head,
+		struct acpi_resource_pin_function *ares_pin_function)
+{
+	int i;
+	int ret;
+	unsigned int config;
+
+	ret = map_acpi_conf_to_general_conf(ares_pin_function->pin_config, 1, &config);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < ares_pin_function->pin_table_length; i++) {
+		ret = add_pin_group_node(acpi_map_head,
+				ares_pin_function->resource_source.string_ptr,
+				NULL,
+				ares_pin_function->pin_table[i],
+				false,
+				ares_pin_function->function_number,
+				ares_pin_function->vendor_data,
+				ares_pin_function->vendor_length);
+		if (ret < 0)
+			return ret;
+
+		ret = add_pin_group_node(acpi_map_head,
+				ares_pin_function->resource_source.string_ptr,
+				NULL,
+				ares_pin_function->pin_table[i],
+				true,
+				config,
+				ares_pin_function->vendor_data,
+				ares_pin_function->vendor_length);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 1;
+}
+
+static int populate_pin_config(struct list_head *acpi_map_head,
+						struct acpi_resource_pin_config *ares_pin_config)
+{
+	int i;
+	int ret;
+	unsigned int config;
+
+	ret = map_acpi_conf_to_general_conf(ares_pin_config->pin_config_type,
+					ares_pin_config->pin_config_value, &config);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < ares_pin_config->pin_table_length; i++) {
+		ret = add_pin_group_node(acpi_map_head,
+				ares_pin_config->resource_source.string_ptr,
+				NULL,
+				ares_pin_config->pin_table[i],
+				true,
+				config,
+				ares_pin_config->vendor_data,
+				ares_pin_config->vendor_length);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 1;
+}
+
+static int populate_pin_group_function(struct list_head *acpi_map_head,
+		struct acpi_resource_pin_group_function *ares_pin_group_function)
+{
+	int ret;
+
+	ret = add_pin_group_node(acpi_map_head,
+			ares_pin_group_function->resource_source.string_ptr,
+			ares_pin_group_function->resource_source_label.string_ptr,
+			0,
+			false,
+			ares_pin_group_function->function_number,
+			ares_pin_group_function->vendor_data,
+			ares_pin_group_function->vendor_length);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int populate_pin_group_config(struct list_head *acpi_map_head,
+		struct acpi_resource_pin_group_config *ares_pin_group_config)
+{
+	unsigned int config;
+	int ret;
+
+	ret = map_acpi_conf_to_general_conf(
+			ares_pin_group_config->pin_config_type,
+			ares_pin_group_config->pin_config_value,
+			&config);
+	if (ret < 0)
+		return ret;
+
+	ret = add_pin_group_node(acpi_map_head,
+			ares_pin_group_config->resource_source.string_ptr,
+			ares_pin_group_config->resource_source_label.string_ptr,
+			0,
+			true,
+			config,
+			ares_pin_group_config->vendor_data,
+			ares_pin_group_config->vendor_length);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int pinctrl_acpi_populate_pin_group_map(struct acpi_resource *ares, void *data)
+{
+	struct list_head *acpi_map_head = data;
+
+	switch (ares->type) {
+	case ACPI_RESOURCE_TYPE_PIN_FUNCTION:
+		return populate_pin_function(acpi_map_head, &ares->data.pin_function);
+	case ACPI_RESOURCE_TYPE_PIN_CONFIG:
+		return populate_pin_config(acpi_map_head, &ares->data.pin_config);
+	case ACPI_RESOURCE_TYPE_PIN_GROUP_FUNCTION:
+		return populate_pin_group_function(acpi_map_head, &ares->data.pin_group_function);
+	case ACPI_RESOURCE_TYPE_PIN_GROUP_CONFIG:
+		return populate_pin_group_config(acpi_map_head, &ares->data.pin_group_config);
+	default:
+		return 1;
+	}
+}
+
+static int pinctrl_acpi_get_pin_group_map(struct acpi_device *adev,
+		struct list_head *pin_group_root)
+{
+	struct list_head res_list;
+	int ret;
+
+	INIT_LIST_HEAD(&res_list);
+	ret = acpi_dev_get_resources(adev, &res_list,
+								pinctrl_acpi_populate_pin_group_map,
+								pin_group_root);
+	acpi_dev_free_resource_list(&res_list);
+
+	return ret;
+}
+
+/**
+ * pinctrl_acpi_to_map() - pinctrl map from ACPI pin resources for device
+ * @p: pinctrl descriptor for the device
+ *
+ * This will parse the ACPI pin resources for the device and creates
+ * pinctrl map. This functions handles PinFunction, PinFunctionConfig,
+ * PinGroupFunction and PinGroupConfig resources.
+ */
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
+	INIT_LIST_HEAD(&pin_group_list);
+	ret = pinctrl_acpi_get_pin_group_map(adev, &pin_group_list);
+	if (ret < 0)
+		return ret;
+
+	list_for_each_entry(controller_map, &pin_group_list, list) {
+		const char *pctldev_name = acpi_node_to_device_name(controller_map->pinctrl_dev);
+
+		pctldev = get_pinctrl_dev_from_devname(pctldev_name);
+		ops = pctldev->desc->pctlops;
+		if (!ops->acpi_node_to_map) {
+			dev_err(p->dev, "pctldev %s doesn't support ACPI\n",
+				dev_name(pctldev->dev));
+			return -ENODEV;
+		}
+		ret = ops->acpi_node_to_map(pctldev,
+			&controller_map->pin_group_maps, &new_map, &num_maps);
+		if (ret < 0) {
+			return ret;
+		} else if (num_maps == 0) {
+			dev_info(p->dev, "there is not valid maps for pin controller %s\n",
+				pctldev_name);
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
index e3a6b61bea90..1b097edb43a8 100644
--- a/drivers/pinctrl/pinctrl-acpi.h
+++ b/drivers/pinctrl/pinctrl-acpi.h
@@ -23,12 +23,56 @@ struct pinctrl_acpi_group_desc {
 	struct list_head list;
 };
 
+/**
+ * struct pinctrl_acpi_pin_group_map - pin/group to config/functions map
+ * @group: name of the pin group. @group is NULL for pin types
+ * @pin: pin number. @pin is valid only if @group is NULL
+ * @is_config: set if @info contains config values
+ * @info_list: list of config or function for the pin/group
+ * @list: list head for the map
+ */
+struct pinctrl_acpi_pin_group_map {
+	const char *group;
+	unsigned int pin;
+	bool is_config;
+	struct list_head info_list;
+	struct list_head list;
+};
+
+/**
+ * struct pinctrl_acpi_pin_group_info - config or function to apply
+ * @config_func: packed config value or function number
+ * @vendor_data: vendor data from ACPI resource
+ * @vendor_length: length of vendor data
+ * @list: list head for the descriptor
+ */
+struct pinctrl_acpi_pin_group_info {
+	unsigned int config_func;
+	u8 *vendor_data;
+	unsigned int vendor_length;
+	struct list_head list;
+};
+
 #ifdef CONFIG_ACPI
 int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list);
+
+int pinctrl_acpi_to_map(struct pinctrl *p);
+
+void pinctrl_acpi_free_maps(struct pinctrl *p);
 #else
 static inline int pinctrl_acpi_get_pin_groups(struct acpi_device *adev,
 			struct list_head *group_desc_list)
 {
 	return -ENXIO;
 }
+
+static inline int pinctrl_acpi_to_map(struct pinctrl *p)
+{
+	return -ENXIO;
+}
+
+static inline void pinctrl_acpi_free_maps(struct pinctrl *p)
+{
+
+}
 #endif
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 487117ccb1bc..13d43a186df9 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -104,6 +104,15 @@ struct pinctrl_gpio_range {
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
@@ -120,6 +129,12 @@ struct pinctrl_ops {
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

