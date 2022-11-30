Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8464163DAE4
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 17:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbiK3QlJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 11:41:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbiK3QlC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 11:41:02 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 402B88BD30
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:40:54 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id bs21so28011940wrb.4
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCyrV5gmhpBykhwhXDPaqe6Zi/uNYd+gCwFqOO2cmjI=;
        b=ziRxgC6qM7I7dCFUTKtE3irOb8R3/ndwyj27hMBeP9xC/TmEsN0QfAxpjA/DDzZnd2
         Qp2/M6ojTQnA3VFpRkZeHTu6fHqE2UVuzviqiInwtPVJUZcbIb1gb4QBWLzbgFex8IOv
         z/Gz9p6VMFIFqABOWye2q+u+WcdlHp20yMu8iih7q/p4Skx1KLaSb3yXkwah/pN0rgwJ
         DdcLWOVI2r7TxJ2rP8nnTmS9zrHO/S0q3JWkeNB25zxzJ141FvBbiByDiW+XVPlXlXon
         ZLjWYtq8rwgtzltRSh4tHbPRUyz7RAulXtbeDll9+qwn09xFbdEDXAgEUbMhm85NyWx4
         4rvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCyrV5gmhpBykhwhXDPaqe6Zi/uNYd+gCwFqOO2cmjI=;
        b=hVjc17J4Jd+5hSse4Oqv9SY84qduqxMVb+5F1x6CW/pVCoeuIEdFtwOBL6moDTwOl9
         vOwK7UaGOlwtdDuQjTOIjYW6DLUj0pmIKVHzwDdUb0Khfvo+N9W/ZClkVSbXtiDAkTB0
         gats1ymjtaxgZP7puUzkAeSXcHmj15eA2LYKwYFnzq6Hid8X9EvZJwc8A4GcbN0J+tBY
         Rt4gJJ0UVAVqY3YSyg4ULpiw3O9rYoWA89LSPsAiLVwPeV9GwEPLXzvTTQxXpHF/iao/
         Y0c4gbMDfZkhVRsy52KFkfAxn/6ovGIZALIY8lWg77NDfzqWuk7ZeUABYbt1Z+XH1mzF
         gmOw==
X-Gm-Message-State: ANoB5plfJNwrmjrwSYWup89aC2m9VHLv3BygaWBUDAoH/y4xTAgAtK1q
        kqrcX/dAVlgqtUwekcGMo5vVgUIA61rIkbf7
X-Google-Smtp-Source: AA0mqf4lBR0rLE2F1WCHt9w7LX859valX2hhBZFh0IMkyW3pZkDlcyz3Ypi5bur6/0gIsR7clStZ2A==
X-Received: by 2002:a5d:4d0b:0:b0:236:c206:fd6b with SMTP id z11-20020a5d4d0b000000b00236c206fd6bmr33146919wrt.56.1669826452493;
        Wed, 30 Nov 2022 08:40:52 -0800 (PST)
Received: from localhost.localdomain ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id k26-20020a05600c1c9a00b003b47b80cec3sm7003110wms.42.2022.11.30.08.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 08:40:52 -0800 (PST)
From:   Niyas Sait <niyas.sait@linaro.org>
To:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org,
        linus.walleij@linaro.org, fugang.duan@linaro.org
Cc:     Niyas Sait <niyas.sait@linaro.org>
Subject: [PATCH v3 2/2] pinctrl: add support for ACPI pin groups
Date:   Wed, 30 Nov 2022 16:40:27 +0000
Message-Id: <20221130164027.682898-3-niyas.sait@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130164027.682898-1-niyas.sait@linaro.org>
References: <20221130164027.682898-1-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

- PinGroups
- PinGroupFunction
- PinGroupConfig

PinGroupFunction and PinGroupConfig resources are processed by
pinctrl-acpi and maps the group to pins using PinGroups resources
before invoking the acpi_node_to_map callback to map the resources
to struct pinctrl_map.

Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
---
 Documentation/driver-api/pin-control-acpi.rst |  97 ++++++++++++
 drivers/pinctrl/pinctrl-acpi.c                | 147 ++++++++++++++++++
 2 files changed, 244 insertions(+)

diff --git a/Documentation/driver-api/pin-control-acpi.rst b/Documentation/driver-api/pin-control-acpi.rst
index 5d179ba90e8f..9a427d76a581 100644
--- a/Documentation/driver-api/pin-control-acpi.rst
+++ b/Documentation/driver-api/pin-control-acpi.rst
@@ -109,6 +109,99 @@ Example 1 : I2C controller SDA/SCL muxed with display controller GPIO pin
 		}
 	}
 
+
+Example 2 : Pin muxing and configuration described with pin groups
+==================================================================
+
+The configuration is similar to example 1 but described using pin group resources
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
+				PinGroup("group1", ResourceProducer) {2, 3}
+
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
+				// Set function I2C1 for SDA/SCL pins
+				PinGroupFunction(Exclusive, 0x5, "\\_SB.GPI0, 0, "group1", ResourceConsumer, )
+				// Configure 10k Pull up for SDA/SCL pins
+				PinGroupConfig(Exclusive, 0x01, 10000, "\\_SB.GPI0 ", 0, "group1", ResourceConsumer, )
+			})
+			Return(RBUF)
+		}
+	}
+
+	//
+	// Description: Physical display panel
+	//
+	Device (DISP)
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
+				// Set function GPIO for pin group group1
+				PinGroupFunction(Exclusive, 0x1, "\\_SB.GPI0 ", 0, "group1",
+				˓ResourceConsumer, )
+				// Configure 20k Pull down
+				PinGroupConfig (Exclusive, 0x02, 20000, "\\_SB.GPI0 ", 0, "group1",
+				˓ResourceConsumer, )
+				//Enable Schmitt-trigger
+				PinGroupConfig (Exclusive, 0x0D, 1, "\\_SB.GPI0 ", 0, "group1",
+				˓ResourceConsumer, )
+				//Set slew rate to custom value 3
+				PinGroupConfig (Exclusive, 0x0B, 3, "\\_SB.GPI0 ", 0, "group1",
+				˓ResourceConsumer, )
+			})
+			Return(RBUF)
+			}
+		}
+	}
+
 Notes for pin controller device driver developers
 =================================================
 
@@ -191,6 +284,10 @@ acpi_node_to_map to map them to struct pinctrl_map. The above ACPI resources wou
 generate two struct pinctrl_acpi_resource descriptors, one for each pin, with list
 of configs to apply for each pin.
 
+ACPI pin resources can be described at group level as described in example 2 above.
+There is no change to the internal pinctrl ACPI interface due to this. ACPI pinctrl
+subsystem will resolve all of the groups defined in AML to pins using PinGroup resources.
+
 References
 ==========
 
diff --git a/drivers/pinctrl/pinctrl-acpi.c b/drivers/pinctrl/pinctrl-acpi.c
index a510ff38c60d..bb1f05c96a65 100644
--- a/drivers/pinctrl/pinctrl-acpi.c
+++ b/drivers/pinctrl/pinctrl-acpi.c
@@ -55,6 +55,18 @@ struct pinctrl_acpi_map {
 	size_t num_maps;
 };
 
+/**
+ * struct pin_groups_lookup_info - context to use for pin group look up
+ * @group: group to use for look up
+ * @pins: populated pin array for the group
+ * @npins: number of pins found for the group
+ */
+struct pin_groups_lookup_info {
+	const char *group;
+	unsigned int *pins;
+	size_t npins;
+};
+
 static void acpi_free_map(struct pinctrl_dev *pctldev, struct pinctrl_map *map,
 			  unsigned int num_maps)
 {
@@ -395,6 +407,129 @@ static int process_pin_config(struct list_head *config_maps,
 	return 0;
 }
 
+static int find_pin_group_cb(struct acpi_resource *ares, void *data)
+{
+	struct acpi_resource_pin_group *ares_pin_group;
+	struct pin_groups_lookup_info *info = data;
+	int i;
+
+	ares_pin_group = &ares->data.pin_group;
+
+	if (ares->type != ACPI_RESOURCE_TYPE_PIN_GROUP)
+		return 1;
+
+	if (strcmp(ares_pin_group->resource_label.string_ptr, info->group))
+		return 1;
+
+	info->npins = ares_pin_group->pin_table_length;
+	info->pins = kcalloc(info->npins, sizeof(*info->pins), GFP_KERNEL);
+	if (!info->pins)
+		return -ENOMEM;
+
+	for (i = 0; i < ares_pin_group->pin_table_length; i++)
+		info->pins[i] = ares_pin_group->pin_table[i];
+
+	return 1;
+}
+
+static int get_pins_in_acpi_pin_group(struct acpi_device *adev,
+				      char *group_name, unsigned int **pins,
+				      size_t *npins)
+{
+	struct pin_groups_lookup_info info = { .group = group_name };
+	struct list_head res_list;
+	int ret;
+
+	INIT_LIST_HEAD(&res_list);
+	ret = acpi_dev_get_resources(adev, &res_list, find_pin_group_cb, &info);
+	if (ret < 0)
+		return ret;
+
+	acpi_dev_free_resource_list(&res_list);
+
+	*pins = info.pins;
+	*npins = info.npins;
+
+	return 0;
+}
+
+static int process_pin_group_config(struct pinctrl *p,
+				    struct list_head *config_maps,
+				    struct acpi_resource_pin_group_config *ares)
+{
+	struct acpi_device *adev;
+	struct pinctrl_dev *pctl_dev;
+	unsigned int config;
+	int ret;
+	size_t npins;
+	unsigned int *pins;
+	char *pinctrl_acpi;
+	char *group;
+
+	ret = acpi_to_generic_pin_config(ares->pin_config_type,
+					 ares->pin_config_value, &config);
+	if (ret < 0)
+		return ret;
+
+	pinctrl_acpi = ares->resource_source.string_ptr;
+	pctl_dev = get_pinctrl_dev_from_acpi_name(pinctrl_acpi);
+	if (!pctl_dev) {
+		dev_err(p->dev, "pctldev with ACPI name '%s' not found\n",
+			pinctrl_acpi);
+		return -ENXIO;
+	}
+
+	adev = ACPI_COMPANION(pctl_dev->dev);
+	group = ares->resource_source_label.string_ptr;
+	ret = get_pins_in_acpi_pin_group(adev, group, &pins, &npins);
+	if (ret < 0)
+		return ret;
+
+	for (int i = 0; i < npins; i++) {
+		ret = add_to_config_map(config_maps, pinctrl_acpi, pins[i],
+					config);
+		if (ret < 0)
+			break;
+	}
+
+	kfree(pins);
+
+	return ret;
+}
+
+static int
+process_pin_group_function(struct pinctrl *p,
+			   struct acpi_resource_pin_group_function *ares)
+{
+	struct pinctrl_dev *pctl_dev;
+	struct acpi_device *adev;
+	unsigned int *pins;
+	char *pinctrl_acpi;
+	char *group;
+	size_t npins;
+	int ret;
+
+	pinctrl_acpi = ares->resource_source.string_ptr;
+	pctl_dev = get_pinctrl_dev_from_acpi_name(pinctrl_acpi);
+	if (!pctl_dev) {
+		dev_err(p->dev, "pctldev with ACPI name '%s' not found\n",
+			pinctrl_acpi);
+		return -ENXIO;
+	}
+
+	adev = ACPI_COMPANION(pctl_dev->dev);
+	group = ares->resource_source_label.string_ptr;
+	ret = get_pins_in_acpi_pin_group(adev, group, &pins, &npins);
+	if (ret < 0)
+		return ret;
+
+	ret = acpi_pin_function_to_pinctrl_map(p, pinctrl_acpi, pins, npins,
+					       ares->function_number);
+
+	kfree(pins);
+
+	return ret;
+}
 
 static int parse_acpi_pin_function_resources(struct acpi_resource *ares,
 					     void *data)
@@ -408,6 +543,12 @@ static int parse_acpi_pin_function_resources(struct acpi_resource *ares,
 		if (ret < 0)
 			return ret;
 		break;
+	case ACPI_RESOURCE_TYPE_PIN_GROUP_FUNCTION:
+		ret = process_pin_group_function(
+			p, &ares->data.pin_group_function);
+		if (ret < 0)
+			return ret;
+		break;
 	}
 
 	return 1;
@@ -426,6 +567,12 @@ static int parse_acpi_pin_config_resources(struct acpi_resource *ares,
 		if (ret < 0)
 			return ret;
 		break;
+	case ACPI_RESOURCE_TYPE_PIN_GROUP_CONFIG:
+		ret = process_pin_group_config(info->pctrl, &info->config_maps,
+					       &ares->data.pin_group_config);
+		if (ret < 0)
+			return ret;
+		break;
 	}
 
 	return 1;
-- 
2.25.1

