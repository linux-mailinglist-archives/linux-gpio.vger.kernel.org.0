Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2651E3AF86F
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jun 2021 00:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhFUWbl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 18:31:41 -0400
Received: from linux.microsoft.com ([13.77.154.182]:44188 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhFUWbk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 18:31:40 -0400
Received: by linux.microsoft.com (Postfix, from userid 1101)
        id 0703C20B7178; Mon, 21 Jun 2021 15:29:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0703C20B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1624314566;
        bh=w4cpZciMJ+Hr0lMIKj61KeolPWCnI1wrN4jxQEIL8zQ=;
        h=From:To:Cc:Subject:Date:From;
        b=lFtIjGfnBPdq8ioVgA7nMwXsUKtbSUiBciabFcGE7rX0JxaVVfGuxemenByPVwiQy
         j5e4U7B80hVx76tVW7mYj5WpEofKAXFT7t+yjvJ1XmUOBBM+SL50Onu72jBV+ZBOCT
         StRJ3EaJ8qtzkFsJFQvh3e1EikETOCTEC0SmhUmk=
From:   Gabriel Knezek <gabeknez@linux.microsoft.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        joe.reviewer@hotmail.com
Cc:     Gabriel Knezek <gabeknez@linux.microsoft.com>
Subject: [PATCH v3] gpiolib: cdev: zero padding during conversion to gpioline_info_changed
Date:   Mon, 21 Jun 2021 15:28:59 -0700
Message-Id: <1624314539-17396-1-git-send-email-gabeknez@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When userspace requests a GPIO v1 line info changed event,
lineinfo_watch_read() populates and returns the gpioline_info_changed
structure. It contains 5 words of padding at the end which are not
initialized before being returned to userspace.

Zero the structure in gpio_v2_line_info_change_to_v1() before populating
its contents.

Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and
GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
Signed-off-by: Gabriel Knezek <gabeknez@linux.microsoft.com>
---
Changes in v3:
  - Include the Fixes tag referencing the code being fixed and properly
    version the patch.

Changes in v2:
  - Update commit message and subject with suggestions about clarity.
  - Patch series at https://www.spinics.net/lists/linux-gpio/msg62163.html

v1:
  - Initial patch
  - Patch series at https://www.spinics.net/lists/linux-gpio/msg62084.html

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

