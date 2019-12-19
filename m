Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D02B125E51
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 10:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfLSJyb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 04:54:31 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36492 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfLSJyb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 04:54:31 -0500
Received: by mail-lf1-f65.google.com with SMTP id n12so3897483lfe.3;
        Thu, 19 Dec 2019 01:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=myEo0UV715T/+/3HpUNFGJIDrNPp+qqvkMFzsaFr0PM=;
        b=QMUl0KNQ62YLm4L2GMopzqZnlZ389oaav7YoOaXAkBxBvMkmCyNbiHctYupRFM7VUd
         9FazMY+pZmu8r1wvIheQ1c7bwlrE6Vw7H5U/hle/tFSfXRhOT/sw+p2bNYK6hC8Jy2hU
         4eZPEHfblt4T7UIQUW1PNQ9nC266hZVJIpmA1/KoaPR405RpqvWKtQn8/pke6xHXp0Y0
         mAHIgzRq0JphkvWZlJkhIuX1+mZahyN4NrRhC6f66yUPO2HHg3Xj1FhqMnsED/SzCURy
         Z1QgHIkv3GZgLryoljU7OCxKGLLjSKrLUEJ3QMyZJ+IR1VTNS7nzpcJdcSdQoIBtwQ5R
         pixg==
X-Gm-Message-State: APjAAAV1ptfm5CTosJ4r2xw+vmCMVdJp5XjN12BS9tf7XpoJGaXq8Weh
        MW1pcGqBHyy/JMc5npZ5DbS+EwOV
X-Google-Smtp-Source: APXvYqxazlGN82HnIYud1AqUNzWRxTp4WhXEd61FUU8ZIQz1nEM2xrtW1HdNG3J1GCv5yEXK/BAALg==
X-Received: by 2002:ac2:5e9b:: with SMTP id b27mr4810294lfq.147.1576749266751;
        Thu, 19 Dec 2019 01:54:26 -0800 (PST)
Received: from localhost.localdomain (dyt4gctb359myxd0pkwmt-4.rev.dnainternet.fi. [2001:14bb:430:5140:37cf:5409:8fcc:4495])
        by smtp.gmail.com with ESMTPSA id z13sm2538723ljh.21.2019.12.19.01.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 01:54:26 -0800 (PST)
Date:   Thu, 19 Dec 2019 11:54:18 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v7 11/12] leds: Add common LED binding parsing support to LED
 class/core
Message-ID: <c7abf8d15ea54fee504fbec5666d013c26d3b62a.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Qucik grep for 'for_each' or 'linux,default-trigger' or
'default-state' under drivers/leds can tell quite a lot. It seems
multiple LED controller drivers implement the very similar looping
through the child nodes in order to locate the LED nodes and read
and support the common LED dt bindings. Implementing this same
stuff for all LED controllers gets old pretty fast.

This commit adds support for locating the LED node (based on known
node names - or linux,led-compatible property) and handling of
few common LED properties.

linux,default-trigger,
default-state (with the exception of keep),

(in addition to already handled
function-enumerator,
function,
color
and label).

Regarding the node look-up: If no init_data is given, then no
node-lookup is done and cdev name is used as such.

If init_data is goven but no starting point for node lookup - then
(parent) device's own DT node is used. If no led-compatible is given,
then of_match is searched for. If neither led-compatible not of_match
is given then device's own node or passed starting point are used as
such.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

No changes since v6

 drivers/leds/led-class.c |  99 +++++++++++++--
 drivers/leds/led-core.c  | 258 ++++++++++++++++++++++++++++++++-------
 include/linux/leds.h     |  94 ++++++++++++--
 3 files changed, 385 insertions(+), 66 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 438774315e6c..edf641cec0be 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -235,6 +235,29 @@ static int led_classdev_next_name(const char *init_name, char *name,
 	return i;
 }
 
+static void led_add_props(struct led_classdev *ld, struct led_properties *props)
+{
+	if (props->default_trigger)
+		ld->default_trigger = props->default_trigger;
+	/*
+	 * According to binding docs the LED is by-default turned OFF unless
+	 * default_state is used to indicate it should be ON or that state
+	 * should be kept as is
+	 */
+	if (props->default_state) {
+		ld->brightness = LED_OFF;
+		if (!strcmp(props->default_state, "on"))
+			ld->brightness = LED_FULL;
+	/*
+	 * We probably should not call the brightness_get prior calling
+	 * the of_parse_cb if one is provided.
+	 * Add a flag to advertice that state should be queried and kept as-is.
+	 */
+		else if (!strcmp(props->default_state, "keep"))
+			props->brightness_keep = true;
+	}
+}
+
 /**
  * led_classdev_register_ext - register a new object of led_classdev class
  *			       with init data.
@@ -251,22 +274,69 @@ int led_classdev_register_ext(struct device *parent,
 	char final_name[LED_MAX_NAME_SIZE];
 	const char *proposed_name = composed_name;
 	int ret;
-
+	struct led_properties props = {0};
+	struct fwnode_handle *fw;
+
+	/*
+	 * We don't try getting the name based on DT node if init-data is not
+	 * given. We could see if we find LED properties from the device's node
+	 * but that might change LED names for old users of
+	 * led_classdev_register who have been providing the LED name in
+	 * cdev->name. So we seek fwnode for names only if init_data is given
+	 */
 	if (init_data) {
+		led_cdev->init_data = init_data;
 		if (init_data->devname_mandatory && !init_data->devicename) {
 			dev_err(parent, "Mandatory device name is missing");
 			return -EINVAL;
 		}
-		ret = led_compose_name(parent, init_data, composed_name);
+
+		fw = led_find_fwnode(parent, init_data);
+		if (IS_ERR(fw))
+			return PTR_ERR(fw);
+
+		if (fw) {
+			/*
+			 * We did increase refcount for fwnode. Let's set a flag
+			 * so we can decrease it during deregistration
+			 */
+			led_cdev->fwnode_owned = true;
+
+			ret = led_parse_fwnode_props(parent, fw, &props);
+			if (ret)
+				goto err_out;
+
+			if (init_data->of_parse_cb)
+				ret = init_data->of_parse_cb(led_cdev, fw,
+							     &props);
+			if (ret < 0)
+				goto err_out;
+
+			/*
+			 * Handle the common LED properties only for drivers
+			 * that explicitly request it. This allows us to test
+			 * and convert drivers to utilize common LED parsing one
+			 * by one.
+			 */
+			if (init_data->parse_fwnode)
+				led_add_props(led_cdev, &props);
+
+		} else {
+			led_cdev->fwnode_owned = false;
+		}
+		ret = led_compose_name(parent, init_data, &props,
+				       composed_name);
 		if (ret < 0)
-			return ret;
+			goto err_out;
 	} else {
 		proposed_name = led_cdev->name;
+		led_cdev->fwnode_owned = false;
+		fw = NULL;
 	}
 
 	ret = led_classdev_next_name(proposed_name, final_name, sizeof(final_name));
 	if (ret < 0)
-		return ret;
+		goto err_out;
 
 	mutex_init(&led_cdev->led_access);
 	mutex_lock(&led_cdev->led_access);
@@ -274,22 +344,28 @@ int led_classdev_register_ext(struct device *parent,
 				led_cdev, led_cdev->groups, "%s", final_name);
 	if (IS_ERR(led_cdev->dev)) {
 		mutex_unlock(&led_cdev->led_access);
-		return PTR_ERR(led_cdev->dev);
+		ret = PTR_ERR(led_cdev->dev);
+		goto err_out;
 	}
-	if (init_data && init_data->fwnode)
-		led_cdev->dev->fwnode = init_data->fwnode;
+	if (fw)
+		led_cdev->dev->fwnode = fw;
 
 	if (ret)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
 				led_cdev->name, dev_name(led_cdev->dev));
 
+	if (props.brightness_keep)
+		if (led_cdev->brightness_get)
+			led_cdev->brightness =
+				 led_cdev->brightness_get(led_cdev);
+
 	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
 		ret = led_add_brightness_hw_changed(led_cdev);
 		if (ret) {
 			device_unregister(led_cdev->dev);
 			led_cdev->dev = NULL;
 			mutex_unlock(&led_cdev->led_access);
-			return ret;
+			goto err_out;
 		}
 	}
 
@@ -322,6 +398,10 @@ int led_classdev_register_ext(struct device *parent,
 			led_cdev->name);
 
 	return 0;
+err_out:
+	if (led_cdev->fwnode_owned)
+		fwnode_handle_put(fw);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(led_classdev_register_ext);
 
@@ -355,6 +435,9 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED)
 		led_remove_brightness_hw_changed(led_cdev);
 
+	if (led_cdev->fwnode_owned)
+		fwnode_handle_put(led_cdev->dev->fwnode);
+
 	device_unregister(led_cdev->dev);
 
 	down_write(&leds_list_lock);
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f1f718dbe0f8..529354bc4e8a 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -365,70 +365,226 @@ void led_sysfs_enable(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_sysfs_enable);
 
-static void led_parse_fwnode_props(struct device *dev,
-				   struct fwnode_handle *fwnode,
-				   struct led_properties *props)
+static int fw_is_match(struct fwnode_handle *fw,
+		       struct led_fw_match_property *mp, void *val)
 {
-	int ret;
+	void *cmp = mp->raw_val;
+	int ret = -EINVAL;
+
+	if (mp->raw_val) {
+		ret = fwnode_property_read_u8_array(fw, mp->name, val,
+						    mp->size);
+	} else if (mp->intval) {
+		cmp = mp->intval;
+		switch (mp->size) {
+		case 1:
+			ret = fwnode_property_read_u8_array(fw, mp->name, val,
+						    mp->size);
+			break;
+		case 2:
+			ret = fwnode_property_read_u16_array(fw, mp->name, val,
+						    mp->size);
+			break;
+		case 4:
+			ret = fwnode_property_read_u32_array(fw, mp->name, val,
+						    mp->size);
+			break;
+		case 8:
+			ret = fwnode_property_read_u64_array(fw, mp->name, val,
+						    mp->size);
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+	if (!ret && cmp)
+		if (!memcmp(val, cmp, mp->size))
+			return 1;
+
+	return 0;
+}
+/**
+ * led_find_fwnode - find fwnode for led
+ * @parent	LED controller device
+ * @init_data	led init data with match information
+ *
+ * Scans the firmware nodes and returns node matching the given init_data.
+ * NOTE: Function increases refcount for found node. Caller must decrease
+ * refcount using fwnode_handle_put when finished with node.
+ */
+struct fwnode_handle *led_find_fwnode(struct device *parent,
+				      struct led_init_data *init_data)
+{
+	struct fwnode_handle *fw;
+
+	/*
+	 * This should never be called W/O init data. We could always return
+	 * dev_fwnode() - but then we should pump-up the refcount
+	 */
+	if (!init_data)
+		return NULL;
+
+	/*
+	 * For now we do only do node look-up for drivers which populate
+	 * the new match properties. We could and perhaps should do
+	 * fw = dev_fwnode(parent); if given fwnode is NULL. But in order to
+	 * not break existing setups we keep the old behaviour and just directly
+	 * use the given init_data->fwnode no matter if it is NULL or not.
+	 */
+
+	if ((!init_data->match_property.name ||
+	     !init_data->match_property.size) && !init_data->of_match)
+		return fwnode_handle_get(init_data->fwnode);
+
+	/* match information was given - do node look-up */
+
+	if (!init_data->fwnode)
+		fw = dev_fwnode(parent);
+	else
+		fw = init_data->fwnode;
+
+	if (!fw)
+		return NULL;
+
+	/*
+	 * Simple things are pretty. I think simplest is to use DT node-name
+	 * for matching the node with LED - same way regulators use the node
+	 * name to match with desc.
+	 *
+	 * This may not work with existing LED DT entries if the node name has
+	 * been freely selectible. In order to this to work the binding doc
+	 * for LED driver should define usable node names.
+	 *
+	 * If this is not working we can define specific match property which
+	 * value we scan and use for matching for LEDs connected to the
+	 * controller.
+	 */
+	if (init_data->match_property.name && init_data->match_property.size) {
+		u8 *val;
+		int ret;
+		struct fwnode_handle *child;
+		struct led_fw_match_property *mp;
+
+		mp = &init_data->match_property;
+
+		val = kzalloc(mp->size, GFP_KERNEL);
+		if (!val)
+			return ERR_PTR(-ENOMEM);
+
+		fwnode_for_each_child_node(fw, child) {
+			ret = fw_is_match(child, mp, val);
+			if (ret > 0) {
+				kfree(val);
+				return child;
+			}
+			if (ret < 0) {
+				dev_err(parent,
+					"invalid fw match. Use raw_val?\n");
+				fwnode_handle_put(child);
+				break;
+			}
+		}
+		kfree(val);
+	}
+	if (init_data->of_match)
+		fw = fwnode_get_named_child_node(fw, init_data->of_match);
+
+	return fw;
+}
+EXPORT_SYMBOL(led_find_fwnode);
+
+int led_parse_fwnode_props(struct device *dev, struct fwnode_handle *fwnode,
+			   struct led_properties *props)
+{
+	int ret = 0;
 
 	if (!fwnode)
-		return;
+		return 0;
 
 	if (fwnode_property_present(fwnode, "label")) {
 		ret = fwnode_property_read_string(fwnode, "label", &props->label);
 		if (ret)
 			dev_err(dev, "Error parsing 'label' property (%d)\n", ret);
-		return;
+		return ret;
 	}
 
+	/**
+	 * Please note, logic changed - if invalid property is found we bail
+	 * early out without parsing the rest of the properties. Originally
+	 * this was the case only for 'label' property. I don't know the
+	 * rationale behind original logic allowing invalid properties to be
+	 * given. If there is a reason then we should reconsider this.
+	 * Intuitively it feels correct to just yell and quit if we hit value we
+	 * don't understand - but intuition may be wrong at times :)
+	 */
 	if (fwnode_property_present(fwnode, "color")) {
 		ret = fwnode_property_read_u32(fwnode, "color", &props->color);
-		if (ret)
+		if (ret) {
 			dev_err(dev, "Error parsing 'color' property (%d)\n", ret);
-		else if (props->color >= LED_COLOR_ID_MAX)
+			return ret;
+		} else if (props->color >= LED_COLOR_ID_MAX) {
 			dev_err(dev, "LED color identifier out of range\n");
-		else
-			props->color_present = true;
+			return ret;
+		}
+		props->color_present = true;
 	}
 
+	if (fwnode_property_present(fwnode, "function")) {
+		ret = fwnode_property_read_string(fwnode, "function",
+						  &props->function);
+		if (ret) {
+			dev_err(dev,
+				"Error parsing 'function' property (%d)\n",
+				ret);
+			return ret;
+		}
+	}
 
-	if (!fwnode_property_present(fwnode, "function"))
-		return;
-
-	ret = fwnode_property_read_string(fwnode, "function", &props->function);
-	if (ret) {
-		dev_err(dev,
-			"Error parsing 'function' property (%d)\n",
-			ret);
+	if (fwnode_property_present(fwnode, "function-enumerator")) {
+		ret = fwnode_property_read_u32(fwnode, "function-enumerator",
+					       &props->func_enum);
+		if (ret) {
+			dev_err(dev,
+				"Error parsing 'function-enumerator' property (%d)\n",
+				ret);
+			return ret;
+		}
+		props->func_enum_present = true;
 	}
 
-	if (!fwnode_property_present(fwnode, "function-enumerator"))
-		return;
+	if (fwnode_property_present(fwnode, "default-state")) {
+		ret = fwnode_property_read_string(fwnode, "default-state",
+						  &props->default_state);
+		if (ret) {
+			dev_err(dev,
+				"Error parsing 'default-state' property (%d)\n",
+				ret);
+			return ret;
+		}
+	}
 
-	ret = fwnode_property_read_u32(fwnode, "function-enumerator",
-				       &props->func_enum);
-	if (ret) {
-		dev_err(dev,
-			"Error parsing 'function-enumerator' property (%d)\n",
-			ret);
-	} else {
-		props->func_enum_present = true;
+	if (fwnode_property_present(fwnode, "linux,default-trigger")) {
+		ret = fwnode_property_read_string(fwnode,
+						  "linux,default-trigger",
+						  &props->default_trigger);
+		if (ret)
+			dev_err(dev,
+				"Error parsing 'linux,default-trigger' property (%d)\n",
+				ret);
 	}
+	return ret;
 }
+EXPORT_SYMBOL_GPL(led_parse_fwnode_props);
 
 int led_compose_name(struct device *dev, struct led_init_data *init_data,
-		     char *led_classdev_name)
+		     struct led_properties *props, char *led_classdev_name)
 {
-	struct led_properties props = {};
-	struct fwnode_handle *fwnode = init_data->fwnode;
 	const char *devicename = init_data->devicename;
 
 	if (!led_classdev_name)
 		return -EINVAL;
 
-	led_parse_fwnode_props(dev, fwnode, &props);
-
-	if (props.label) {
+	if (props->label) {
 		/*
 		 * If init_data.devicename is NULL, then it indicates that
 		 * DT label should be used as-is for LED class device name.
@@ -436,23 +592,23 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 		 * the final LED class device name.
 		 */
 		if (!devicename) {
-			strscpy(led_classdev_name, props.label,
+			strscpy(led_classdev_name, props->label,
 				LED_MAX_NAME_SIZE);
 		} else {
 			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
-				 devicename, props.label);
+				 devicename, props->label);
 		}
-	} else if (props.function || props.color_present) {
+	} else if (props->function || props->color_present) {
 		char tmp_buf[LED_MAX_NAME_SIZE];
 
-		if (props.func_enum_present) {
+		if (props->func_enum_present) {
 			snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d",
-				 props.color_present ? led_colors[props.color] : "",
-				 props.function ?: "", props.func_enum);
+				 props->color_present ? led_colors[props->color] : "",
+				 props->function ?: "", props->func_enum);
 		} else {
 			snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s",
-				 props.color_present ? led_colors[props.color] : "",
-				 props.function ?: "");
+				 props->color_present ? led_colors[props->color] : "",
+				 props->function ?: "");
 		}
 		if (init_data->devname_mandatory) {
 			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
@@ -468,11 +624,19 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 		}
 		snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
 			 devicename, init_data->default_label);
-	} else if (is_of_node(fwnode)) {
-		strscpy(led_classdev_name, to_of_node(fwnode)->name,
-			LED_MAX_NAME_SIZE);
-	} else
-		return -EINVAL;
+	} else {
+		struct fwnode_handle *fwnode = led_find_fwnode(dev, init_data);
+		int ret = -EINVAL;
+
+		if (is_of_node(fwnode)) {
+			ret = 0;
+			strscpy(led_classdev_name, to_of_node(fwnode)->name,
+				LED_MAX_NAME_SIZE);
+		}
+		fwnode_handle_put(fwnode);
+
+		return ret;
+	}
 
 	return 0;
 }
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 242258f7d837..c7eef8367211 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -13,6 +13,7 @@
 #include <linux/kernfs.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/rwsem.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -20,6 +21,7 @@
 
 struct device;
 struct led_pattern;
+struct led_classdev;
 /*
  * LED Core
  */
@@ -31,8 +33,47 @@ enum led_brightness {
 	LED_FULL	= 255,
 };
 
+struct led_properties {
+	u32		color;
+	bool		color_present;
+	const char	*function;
+	u32		func_enum;
+	bool		func_enum_present;
+	const char	*label;
+	const char	*default_trigger;
+	const char	*default_state;
+	bool		brightness_keep;
+};
+
+struct led_fw_match_property {
+	const char *name;	/* Name of the property to match */
+	void *raw_val;		/* Raw property value as present in fwnode */
+	void *intval;		/* Property value if 8,16,32 or 64bit integer */
+	size_t size;		/* Size of value in bytes */
+};
+
 struct led_init_data {
-	/* device fwnode handle */
+	/*
+	 * If DT binding dictates the node name the driver can fill of_match
+	 * corresponding to node name describing this LED. If fwnode is given
+	 * the match is searched from it's child nodes. If not, the match is
+	 * searched from device's own child nodes.
+	 */
+	const char *of_match;
+	/*
+	 * If fwnode contains property with known value the driver can specify
+	 * correct propertty-value pair here to do the matching. This has higher
+	 * priority than of_match. If fwnode is given the match is searched
+	 * from it's child nodes. If not match is searched from device's
+	 * own child nodes.
+	 */
+	struct led_fw_match_property match_property;
+	/*
+	 * device fwnode handle. If of_match or led_compatible are not given
+	 * this is used for LED as given. If of_match or led_compatible are
+	 * given then this is used as a parent node whose child nodes are
+	 * scanned for given match.
+	 */
 	struct fwnode_handle *fwnode;
 	/*
 	 * default <color:function> tuple, for backward compatibility
@@ -53,9 +94,19 @@ struct led_init_data {
 	 * set it to true
 	 */
 	bool devname_mandatory;
+	/*
+	 * Callback which a LED driver can register if it has own non-standard
+	 * DT properties. Core calls this with the located DT node during
+	 * class_device registration
+	 */
+	int (*of_parse_cb)(struct led_classdev *ld, struct fwnode_handle *fw,
+			    struct led_properties *props);
+	 /* LED core should parse and handle the common firmware properties */
+	bool parse_fwnode;
 };
 
 struct led_classdev {
+	struct led_init_data	*init_data;
 	const char		*name;
 	enum led_brightness	 brightness;
 	enum led_brightness	 max_brightness;
@@ -148,6 +199,7 @@ struct led_classdev {
 
 	/* Ensures consistent access to the LED Flash Class device */
 	struct mutex		led_access;
+	bool			fwnode_owned;
 };
 
 /**
@@ -299,6 +351,7 @@ void led_sysfs_enable(struct led_classdev *led_cdev);
  * led_compose_name - compose LED class device name
  * @dev: LED controller device object
  * @init_data: the LED class device initialization data
+ * @props: LED properties as parsed from fwnode.
  * @led_classdev_name: composed LED class device name
  *
  * Create LED class device name basing on the provided init_data argument.
@@ -308,7 +361,8 @@ void led_sysfs_enable(struct led_classdev *led_cdev);
  * Returns: 0 on success or negative error value on failure
  */
 int led_compose_name(struct device *dev, struct led_init_data *init_data,
-		     char *led_classdev_name);
+			    struct led_properties *props,
+			    char *led_classdev_name);
 
 /**
  * led_sysfs_is_disabled - check if LED sysfs interface is disabled
@@ -321,6 +375,33 @@ static inline bool led_sysfs_is_disabled(struct led_classdev *led_cdev)
 	return led_cdev->flags & LED_SYSFS_DISABLE;
 }
 
+/**
+ * led_find_fwnode - find fwnode matching given LED init data
+ * @parent: LED controller device this LED is driven by
+ * @init_data: the LED class device initialization data
+ *
+ * Find the fw node matching given LED init data.
+ * NOTE: Function increases refcount for found node. Caller must decrease
+ * refcount using fwnode_handle_put when finished with node.
+ *
+ * Returns: node handle or NULL if matching fw node was not found
+ */
+struct fwnode_handle *led_find_fwnode(struct device *parent,
+				      struct led_init_data *init_data);
+
+/**
+ * led_parse_fwnode_props - parse LED common properties from fwnode
+ * @dev: pointer to LED device.
+ * @fwnode: LED node containing the properties
+ * @props: structure where found property data is stored.
+ *
+ * Parse the common LED properties from fwnode.
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+int led_parse_fwnode_props(struct device *dev, struct fwnode_handle *fwnode,
+			   struct led_properties *props);
+
 /*
  * LED Triggers
  */
@@ -478,15 +559,6 @@ struct led_platform_data {
 	struct led_info	*leds;
 };
 
-struct led_properties {
-	u32		color;
-	bool		color_present;
-	const char	*function;
-	u32		func_enum;
-	bool		func_enum_present;
-	const char	*label;
-};
-
 struct gpio_desc;
 typedef int (*gpio_blink_set_t)(struct gpio_desc *desc, int state,
 				unsigned long *delay_on,
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
