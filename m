Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C623AD564
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jun 2021 00:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbhFRWuC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 18:50:02 -0400
Received: from linux.microsoft.com ([13.77.154.182]:34072 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbhFRWuC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 18:50:02 -0400
Received: by linux.microsoft.com (Postfix, from userid 1101)
        id 55B1420B7178; Fri, 18 Jun 2021 15:47:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 55B1420B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1624056472;
        bh=vwdE2ggYCg5b34n1LuqwziDJlDuCJH5dYBLv+IDSaYI=;
        h=From:To:Cc:Subject:Date:From;
        b=shn0rn5oUy0kxYxLc2BpIqE0JvIfW+veugzGyoIc2Ksl8a3lVbd8MvRg/5wJtzVgt
         XFAzgkbNBmS9dFNg+b9S+zXfBTR7mfHBsYnT6umU+ZXyObiVIrnxj/1QH56UWi6yuJ
         SFU/MmK4tBu10MMfW3hVRtp/g7YBhYTR7zvIUrKI=
From:   Gabriel Knezek <gabeknez@linux.microsoft.com>
To:     linux-gpio@vger.kernel.org
Cc:     Gabriel Knezek <gabeknez@microsoft.com>
Subject: [PATCH] gpiolib: cdev: zero padding during conversion to gpioline_info_changed
Date:   Fri, 18 Jun 2021 15:45:11 -0700
Message-Id: <1624056311-6836-1-git-send-email-gabeknez@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Gabriel Knezek <gabeknez@microsoft.com>

When userspace requests a GPIO v1 line info changed event, the kernel
populates and returns the gpioline_info_changed structure. That structure
contains 5 words of padding at the end of the structure that are not
initialized before being returned to usermode:

struct gpioline_info_changed {
                struct gpioline_info info;
                __u64 timestamp;
                __u32 event_type;
                __u32 padding[5]; /* for future use */
};

Which is used here in the lineinfo_watch_read routine:
} else {
                struct gpioline_info_changed event_v1;
                gpio_v2_line_info_changed_to_v1(&event, &event_v1);
                if (copy_to_user(buf + bytes_read, &event_v1,
                                                event_size))
                                return -EFAULT;

Fix this by zeroing the structure in gpio_v2_line_info_change_to_v1
before populating its contents.

Signed-off-by: Gabriel Knezek <gabeknez@microsoft.com>
---
 drivers/gpio/gpiolib-cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index ee5903aac497..af68532835fe 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1865,6 +1865,7 @@ static void gpio_v2_line_info_changed_to_v1(
 		struct gpio_v2_line_info_changed *lic_v2,
 		struct gpioline_info_changed *lic_v1)
 {
+	memset(lic_v1, 0, sizeof(*lic_v1));
 	gpio_v2_line_info_to_v1(&lic_v2->info, &lic_v1->info);
 	lic_v1->timestamp = lic_v2->timestamp_ns;
 	lic_v1->event_type = lic_v2->event_type;
-- 
2.25.1

