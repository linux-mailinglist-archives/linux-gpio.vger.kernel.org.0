Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74ED3142D2
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 23:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhBHWYz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 17:24:55 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:53771 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbhBHWYv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 17:24:51 -0500
Received: from orion.localdomain ([95.115.15.83]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MXYAj-1lQ1n51B5b-00YxKI; Mon, 08 Feb 2021 23:22:16 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        frowand.list@gmail.com, pantelis.antoniou@konsulko.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 08/12] drivers: base: introduce bus_remove_device_by_name()
Date:   Mon,  8 Feb 2021 23:21:59 +0100
Message-Id: <20210208222203.22335-9-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210208222203.22335-1-info@metux.net>
References: <20210208222203.22335-1-info@metux.net>
X-Provags-ID: V03:K1:0n2fIG2Rpu9ZJwXMl4tBwZ/3tnXlDtOxKiwWjJGncmHiDEu2Ots
 MuE3bpBi/A7oy19oFifjuPlJ6PNuFqxEZlQ/OaPdyABbvLmebIgN3ERFOzOA6iFdymsd52C
 1/TbShxjwoGJfc3mL3HyEkwSdtnG8/xXUt3AxYt/GCiULEReqjGbTGBW1rVF6omosnLrzVx
 EHcfI++g4pju0RSD5/vjQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:umiqnbUS6cI=:6mZcagxU2YcHIT1ZeFWN0x
 ITMc0hS8D155f0MQv+OVwVUKXQT61SVKLu4HN3Z07T+lLzrKDunN87SkmokuFQFlu63oYqhhz
 kbQ28pJ5cvmCwOsgQvOXdmfZbmPgJcoXnVD5YytCPpf6SsYXovqatWtFv3hTLVOez2HBuV9Pk
 Tl2YeWF3q8QJ96tjYPJu0YMSVoUx3CzLOeBI0jpaHJPf9xYeAvB8sTJ4NbPBC2W/qO0vTcPBd
 ybhArh6Zlr5poXM1V1P6AKCYi2aeUFuC8su6oiHrYC39wkIOhwRATcJbzsITWPksn/k1ZYZdg
 kWZMVMi6QPKWy6qs83fwEm4V7NEBa0fSdNB/4+kq0xRSCcutLLZ0rJGNnx1HU/XCvsLf187WQ
 kjCnQUfA/kA5RbPqyL3Km1K3SJQ6Wyz/qEJ6oMttNvI1knDnRrTC8l8blHtD8
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce a helper for detaching a named device from bus and
unregistering it. This is helpful eg. if some board specific driver
needs to remove an unwanted device that had been probed via firmware,
but should be handled differently.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/base/bus.c         | 16 ++++++++++++++++
 include/linux/device/bus.h |  9 +++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index a9c23ecebc7c..450d3ed6cf1f 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -178,6 +178,22 @@ static const struct kset_uevent_ops bus_uevent_ops = {
 
 static struct kset *bus_kset;
 
+int bus_unregister_device_by_name(struct bus_type *bus, const char *name)
+{
+	struct device *dev;
+
+	dev = bus_find_device_by_name(bus, NULL, name);
+	if (!dev)
+		return -ENOENT;
+
+	device_driver_detach(dev);
+	device_unregister(dev);
+	put_device(dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(bus_unregister_device_by_name);
+
 /* Manually detach a device from its associated driver. */
 static ssize_t unbind_store(struct device_driver *drv, const char *buf,
 			    size_t count)
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index 1ea5e1d1545b..36a1dae26c95 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -253,6 +253,15 @@ int bus_for_each_drv(struct bus_type *bus, struct device_driver *start,
 void bus_sort_breadthfirst(struct bus_type *bus,
 			   int (*compare)(const struct device *a,
 					  const struct device *b));
+
+/**
+ * bus_unregister_device_by_name - remove device by bus id from specific bus
+ *                                 and unregister it from device core
+ * @bus: bus type
+ * @name: name of the device to remove
+ */
+int bus_unregister_device_by_name(struct bus_type *bus, const char *name);
+
 /*
  * Bus notifiers: Get notified of addition/removal of devices
  * and binding/unbinding of drivers to devices.
-- 
2.11.0

