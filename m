Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 516B54EBBB
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2019 17:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfFUPRa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jun 2019 11:17:30 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39021 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfFUPRa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jun 2019 11:17:30 -0400
Received: by mail-wr1-f68.google.com with SMTP id x4so6964076wrt.6;
        Fri, 21 Jun 2019 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vmx+2GFLMAsA432KVJXtcDMRhH5Mno8/FuACZ/3GzGo=;
        b=odT98Dgne9Uzv+xFYtLoQF5GTMblC2dA/dCA4S/Yrw0pnNZyUgJv3/RYFkBEQkaWTw
         U1QHx0ieircZqCg6+aKvAfFwYf945evUDrJ/xSg3C009lTM0vR8QdEq9RMHybJS4052l
         816nJP1zCNWTxC5k/qzJzpdK7nsfZ/IndYxQ4OBaZSbigIQ7CelADJvkL3i9qjl4Bk0q
         jyFQ7IEB39fcxEoPOPId5V0bFXakMJGjczWiap4dibTCyPtidwJBDdl4lm5cCa4STKKJ
         VsbIa8E/3Nucv7CIj2De1v/qAMlbK+V7lfSf0OWJZ4uWtQUjJhyO25cenbGXBCL4MdEY
         iOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vmx+2GFLMAsA432KVJXtcDMRhH5Mno8/FuACZ/3GzGo=;
        b=fJGVp71MCgkOnUYe2UdTvqCJTuWie+adxdNGYxXWuHAGGpTrSNKutl1yhHqq3YqPPI
         1sPxi6FmE9iB6lYXcAySOaviNAf4DLdfNKv6FuO6qLwzAr2rxpvJC5wOskpTAu9K5kDe
         +w7dtolCiv65AUE+n/D1fvN5SksqFm034PPoSpQqK4JQI6WxirkS9jisJ2cfv4JyCGkh
         7Xn+hESkA6VVkA+dqDagUq0y+/MOC+34l3kJ+OJjGXR1Zprm7eIb/yPA5Y6HeqkBkrbk
         EdCo2KXhMRWGx6P5+zEFuQWXp+NtNGP5z40hmV/hHBAXvaUHDMXVZKtNsk5UosYo2CQc
         ehcw==
X-Gm-Message-State: APjAAAV2vEK58JgcGHyx10xlI5fDSczBVK+XkJES9sbaGOw5dX1gSquI
        SnP4gk7l37gxcfGteSdwJiY=
X-Google-Smtp-Source: APXvYqyYuimOJ+hROIq6i6pA0D5ptM0cX1BI2ymgE0mn6AkI2YFt0cWS3efhpzRqWwY9NM6lbrAImA==
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr41748392wrt.233.1561130247399;
        Fri, 21 Jun 2019 08:17:27 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id d201sm2281141wmd.19.2019.06.21.08.17.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 08:17:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] driver: core: Allow subsystems to continue deferring probe
Date:   Fri, 21 Jun 2019 17:17:25 +0200
Message-Id: <20190621151725.20414-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Some subsystems, such as pinctrl, allow continuing to defer probe
indefinitely. This is useful for devices that depend on resources
provided by devices that are only probed after the init stage.

One example of this can be seen on Tegra, where the DPAUX hardware
contains pinmuxing controls for pins that it shares with an I2C
controller. The I2C controller is typically used for communication
with a monitor over HDMI (DDC). However, other instances of the I2C
controller are used to access system critical components, such as a
PMIC. The I2C controller driver will therefore usually be a builtin
driver, whereas the DPAUX driver is part of the display driver that
is loaded from a module to avoid bloating the kernel image with all
of the DRM/KMS subsystem.

In this particular case the pins used by this I2C/DDC controller
become accessible very late in the boot process. However, since the
controller is only used in conjunction with display, that's not an
issue.

Unfortunately the driver core currently outputs a warning message
when a device fails to get the pinctrl before the end of the init
stage. That can be confusing for the user because it may sound like
an unwanted error occurred, whereas it's really an expected and
harmless situation.

In order to eliminate this warning, this patch allows callers of the
driver_deferred_probe_check_state() helper to specify that they want
to continue deferring probe, regardless of whether we're past the
init stage or not. All of the callers of that function are updated
for the new signature, but only the pinctrl subsystem passes a true
value in the new persist parameter if appropriate.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- add new function rather than extend the existing function with flags

Changes in v2:
- pass persist flag via flags parameter to make the function call easier
  to understand

 drivers/base/dd.c            | 55 ++++++++++++++++++++++++++++++------
 drivers/pinctrl/devicetree.c |  7 ++---
 include/linux/device.h       |  1 +
 3 files changed, 51 insertions(+), 12 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 0df9b4461766..994a90747420 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -235,6 +235,19 @@ static int __init deferred_probe_timeout_setup(char *str)
 }
 __setup("deferred_probe_timeout=", deferred_probe_timeout_setup);
 
+static int __driver_deferred_probe_check_state(struct device *dev)
+{
+	if (!initcalls_done)
+		return -EPROBE_DEFER;
+
+	if (!deferred_probe_timeout) {
+		dev_WARN(dev, "deferred probe timeout, ignoring dependency");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 /**
  * driver_deferred_probe_check_state() - Check deferred probe state
  * @dev: device to check
@@ -248,14 +261,40 @@ __setup("deferred_probe_timeout=", deferred_probe_timeout_setup);
  */
 int driver_deferred_probe_check_state(struct device *dev)
 {
-	if (initcalls_done) {
-		if (!deferred_probe_timeout) {
-			dev_WARN(dev, "deferred probe timeout, ignoring dependency");
-			return -ETIMEDOUT;
-		}
-		dev_warn(dev, "ignoring dependency for device, assuming no driver");
-		return -ENODEV;
-	}
+	int ret;
+
+	ret = __driver_deferred_probe_check_state(dev);
+	if (ret < 0)
+		return ret;
+
+	dev_warn(dev, "ignoring dependency for device, assuming no driver");
+
+	return -ENODEV;
+}
+
+/**
+ * driver_deferred_probe_check_state_continue() - check deferred probe state
+ * @dev: device to check
+ *
+ * Returns -ETIMEDOUT if deferred probe debug timeout has expired, or
+ * -EPROBE_DEFER otherwise.
+ *
+ * Drivers or subsystems can opt-in to calling this function instead of
+ * directly returning -EPROBE_DEFER.
+ *
+ * This is similar to driver_deferred_probe_check_state(), but it allows the
+ * subsystem to keep deferring probe after built-in drivers have had a chance
+ * to probe. One scenario where that is useful is if built-in drivers rely on
+ * resources that are provided by modular drivers.
+ */
+int driver_deferred_probe_check_state_continue(struct device *dev)
+{
+	int ret;
+
+	ret = __driver_deferred_probe_check_state(dev);
+	if (ret < 0)
+		return ret;
+
 	return -EPROBE_DEFER;
 }
 
diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index f7e354f85518..88ddbb2e30de 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -112,12 +112,11 @@ static int dt_to_map_one_config(struct pinctrl *p,
 		np_pctldev = of_get_next_parent(np_pctldev);
 		if (!np_pctldev || of_node_is_root(np_pctldev)) {
 			of_node_put(np_pctldev);
-			ret = driver_deferred_probe_check_state(p->dev);
 			/* keep deferring if modules are enabled unless we've timed out */
-			if (IS_ENABLED(CONFIG_MODULES) && !allow_default && ret == -ENODEV)
-				ret = -EPROBE_DEFER;
+			if (IS_ENABLED(CONFIG_MODULES) && !allow_default)
+				return driver_deferred_probe_check_state_continue(p->dev);
 
-			return ret;
+			return driver_deferred_probe_check_state(p->dev);
 		}
 		/* If we're creating a hog we can use the passed pctldev */
 		if (hog_pctldev && (np_pctldev == p->dev->of_node)) {
diff --git a/include/linux/device.h b/include/linux/device.h
index e138baabe01e..ae7626e24225 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -342,6 +342,7 @@ struct device *driver_find_device(struct device_driver *drv,
 
 void driver_deferred_probe_add(struct device *dev);
 int driver_deferred_probe_check_state(struct device *dev);
+int driver_deferred_probe_check_state_continue(struct device *dev);
 
 /**
  * struct subsys_interface - interfaces to device functions
-- 
2.21.0

