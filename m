Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 397E8FFF35
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 08:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfKRHDS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 02:03:18 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34470 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfKRHDS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 02:03:18 -0500
Received: by mail-lf1-f66.google.com with SMTP id l28so3384685lfj.1;
        Sun, 17 Nov 2019 23:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Zs4dT8d72/GxsSUZCRPfiegePgeNAdbPXK/pjmHD7ks=;
        b=har5CXUTceEhFa6Q+DkI4dKsvg+K4lPBCmyzXo7Dc/T2Da+G7qbkIPUx1p5igxcF3f
         riZX/rMv9SzgBSrZ/c/uWodwaBuBfbJNIW4Hu7qjm3UYHOMRLSm0esz/rHmH30WWUbbi
         AvNRsGLgpRu6unDXsO+64n8ZQ+JKcAlc/0W5l05ZDvzSgSCjcnICidfVKZUttYuBllyH
         tjBPOco863vie7cZ83JhlqNhhn+2tdTmY5WNiJmuvu+E3JnMcjPB67tp21sl3EpJs9fR
         h38N1wCfk+6ex7G7enMHP47oYE04XZ9JH5JE8NcSwGUZMWiEtjmI2rJqILrxCaR7I4p3
         W9EA==
X-Gm-Message-State: APjAAAVcWS7j8qiqNYtcRILZKdzYC7M3LqoMIEtVD1jNwVpSJd9826AF
        KGx/X9UZXkuvuerzAxDaALU=
X-Google-Smtp-Source: APXvYqxeF7ocjShrFm540n6Vi5GlY6x2VhLITyocVX/kze2UChShcqKfIqpNuHY+7MBepKrM8241dg==
X-Received: by 2002:ac2:46f7:: with SMTP id q23mr119310lfo.68.1574060593483;
        Sun, 17 Nov 2019 23:03:13 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id n19sm8207322lfl.85.2019.11.17.23.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 23:03:12 -0800 (PST)
Date:   Mon, 18 Nov 2019 09:03:07 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v5 15/16] leds: Add common LED binding parsing support to LED
 class/core
Message-ID: <258b5c9934e2b31a5f433a7dbb908dfe5da3d30c.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
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

Changes from v4:
Fixed issues reported by Dan Carpenter and kbuild-bot.
(leftover kfree and uninitialized return value)

 drivers/leds/led-class.c |  88 ++++++++++++--
 drivers/leds/led-core.c  | 246 +++++++++++++++++++++++++++++++--------
 include/linux/leds.h     |  90 ++++++++++++--
 3 files changed, 359 insertions(+), 65 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 647b1263c579..98173b64a597 100644
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
@@ -251,22 +274,58 @@ int led_classdev_register_ext(struct device *parent,
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
+		if (!fw) {
+			dev_err(parent, "No fwnode found\n");
+			return -ENOENT;
+		}
+		/*
+		 * We did increase refcount for fwnode. Let's set a flag so we
+		 * can decrease it during deregistration
+		 */
+		led_cdev->fwnode_owned = true;
+
+		ret = led_parse_fwnode_props(parent, fw, &props);
+		if (ret)
+			goto err_out;
+
+		if (init_data->of_parse_cb)
+			ret = init_data->of_parse_cb(led_cdev, fw, &props);
 		if (ret < 0)
-			return ret;
+			goto err_out;
+
+		led_add_props(led_cdev, &props);
+
+		ret = led_compose_name(parent, init_data, &props,
+				       composed_name);
+		if (ret < 0)
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
@@ -274,22 +333,28 @@ int led_classdev_register_ext(struct device *parent,
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
 
@@ -322,6 +387,10 @@ int led_classdev_register_ext(struct device *parent,
 			led_cdev->name);
 
 	return 0;
+err_out:
+	if (led_cdev->fwnode_owned)
+		fwnode_handle_put(fw);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(led_classdev_register_ext);
 
@@ -355,6 +424,9 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED)
 		led_remove_brightness_hw_changed(led_cdev);
 
+	if (led_cdev->fwnode_owned)
+		fwnode_handle_put(led_cdev->dev->fwnode);
+
 	device_unregister(led_cdev->dev);
 
 	down_write(&leds_list_lock);
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f1f718dbe0f8..9369f03ee540 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -365,70 +365,214 @@ void led_sysfs_enable(struct led_classdev *led_cdev)
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
+	else
+		fw = fwnode_handle_get(fw);
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
@@ -436,23 +580,23 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
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
@@ -468,11 +612,19 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
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
index efb309dba914..aea7d6bc7294 100644
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
@@ -53,9 +94,17 @@ struct led_init_data {
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
 };
 
 struct led_classdev {
+	struct led_init_data	*init_data;
 	const char		*name;
 	enum led_brightness	 brightness;
 	enum led_brightness	 max_brightness;
@@ -148,6 +197,7 @@ struct led_classdev {
 
 	/* Ensures consistent access to the LED Flash Class device */
 	struct mutex		led_access;
+	bool			fwnode_owned;
 };
 
 /**
@@ -302,6 +352,7 @@ extern void led_sysfs_enable(struct led_classdev *led_cdev);
  * led_compose_name - compose LED class device name
  * @dev: LED controller device object
  * @init_data: the LED class device initialization data
+ * @props: LED properties as parsed from fwnode.
  * @led_classdev_name: composed LED class device name
  *
  * Create LED class device name basing on the provided init_data argument.
@@ -311,6 +362,7 @@ extern void led_sysfs_enable(struct led_classdev *led_cdev);
  * Returns: 0 on success or negative error value on failure
  */
 extern int led_compose_name(struct device *dev, struct led_init_data *init_data,
+			    struct led_properties *props,
 			    char *led_classdev_name);
 
 /**
@@ -324,6 +376,33 @@ static inline bool led_sysfs_is_disabled(struct led_classdev *led_cdev)
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
@@ -490,15 +569,6 @@ struct led_platform_data {
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
