Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1835B9290
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 04:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbiIOCN1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 22:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiIOCNZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 22:13:25 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978658FD48
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 19:13:24 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id 96D5B900448;
        Thu, 15 Sep 2022 10:13:22 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     jbx6244@gmail.com, heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/3] ACPI: utils: Add acpi_dev_uid_to_integer() helper to get _UID as integer
Date:   Thu, 15 Sep 2022 10:13:18 +0800
Message-Id: <20220915021320.80364-2-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915021320.80364-1-jay.xu@rock-chips.com>
References: <20220915021320.80364-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHx1CVktCS0kfQ0tNH00aSFUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBQ6CQw4KD0oDC1WFQsNMxIa
        ATQwCQJVSlVKTU1ISUtDS0tISUlMVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUhMTE83Bg++
X-HM-Tid: 0a833eec14eb2eafkusn96d5b900448
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Some users interpret _UID only as integer and for them it's easier to
have an integer representation of _UID. Add respective helper for that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/utils.c    | 24 ++++++++++++++++++++++++
 include/acpi/acpi_bus.h |  1 +
 include/linux/acpi.h    |  5 +++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
index 5a7b8065e77f..febf9b8da3a0 100644
--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -793,6 +793,30 @@ bool acpi_dev_hid_uid_match(struct acpi_device *adev,
 }
 EXPORT_SYMBOL(acpi_dev_hid_uid_match);
 
+/**
+ * acpi_dev_uid_to_integer - treat ACPI device _UID as integer
+ * @adev: ACPI device to get _UID from
+ * @integer: output buffer for integer
+ *
+ * Considers _UID as integer and converts it to @integer.
+ *
+ * Returns 0 on success, or negative error code otherwise.
+ */
+int acpi_dev_uid_to_integer(struct acpi_device *adev, u64 *integer)
+{
+	const char *uid;
+
+	if (!adev)
+		return -ENODEV;
+
+	uid = acpi_device_uid(adev);
+	if (!uid)
+		return -ENODATA;
+
+	return kstrtou64(uid, 0, integer);
+}
+EXPORT_SYMBOL(acpi_dev_uid_to_integer);
+
 /**
  * acpi_dev_found - Detect presence of a given ACPI device in the namespace.
  * @hid: Hardware ID of the device.
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index e7d27373ff71..bd0db916f330 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -733,6 +733,7 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
 }
 
 bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
+int acpi_dev_uid_to_integer(struct acpi_device *adev, u64 *integer);
 
 void acpi_dev_clear_dependencies(struct acpi_device *supplier);
 bool acpi_dev_ready_for_enumeration(const struct acpi_device *device);
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 6f64b2f3dc54..9434db02cb60 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -798,6 +798,11 @@ acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *u
 	return false;
 }
 
+static inline int acpi_dev_uid_to_integer(struct acpi_device *adev, u64 *integer)
+{
+	return -ENODEV;
+}
+
 static inline struct acpi_device *
 acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv)
 {
-- 
2.25.1

