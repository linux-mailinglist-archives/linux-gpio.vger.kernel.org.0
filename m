Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B39E1AF5FB
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2020 02:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgDSATk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Apr 2020 20:19:40 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.115]:44796 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725804AbgDSATk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 18 Apr 2020 20:19:40 -0400
Received: from [100.112.6.108] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-c.us-east-1.aws.symcld.net id 57/03-23081-9199B9E5; Sun, 19 Apr 2020 00:19:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRWlGSWpSXmKPExsXi5LtOQFdi5uw
  4g7kzTC2m/FnOZLF5/h9Gi8u75rA5MHvcubaHzePzJrkApijWzLyk/IoE1ow1bx4xFnwTqHiw
  4xpbA+NZvi5GLg4hgVWMEqvObmLpYuQEctYwSrybkgdiswnoSWy6f5odxBYRYJZYMPU8YxcjB
  wezQLbEoz2JIGFhAVOJr1O3grWyCKhKbP/Uxwhi8wrYSmyc3wUWlxCQl1i94QAzRFxQ4uTMJ2
  BxZgEJiYMvXjCDjBQSUJE4950RolxBYv3Vc6wTGHlnIemYhaRjASPTKkbTpKLM9IyS3MTMHF1
  DAwNdQ0MjXVNdYzO9xCrdZL3SYt3UxOISXUO9xPJiveLK3OScFL281JJNjMCASylgVdnBeHjt
  e71DjJIcTEqivGXds+OE+JLyUyozEosz4otKc1KLDzHKcHAoSfAumg6UEyxKTU+tSMvMAQY/T
  FqCg0dJhHctSJq3uCAxtzgzHSJ1ilFRSpx3KkhCACSRUZoH1waLuEuMslLCvIwMDAxCPAWpRb
  mZJajyrxjFORiVhHl7QKbwZOaVwE1/BbSYCWhxvinY4pJEhJRUA1PjFoavTTZy/54zW6g9ti0
  wT2+o2fLXJW5CzsVMLc9uhSbX1TeYbVbo+j8UWhPwz376reVry1eG7bl6ir1n74ae2cdzr4kf
  UmAt3ZrqFCt+7+7yRtOF19ZZrvhwQlVAMLHz1/kzls/cL116ozZJ/84eOQ0+pb79j/nXzz6w4
  7FUfTOHbB375+sT2q+Ff7Ryf2DYpGaXIVtQdaZdfZ7dm74qyeuJNVsduWZrHv3OyXoi+F7Q2z
  eHOvp7O03WP/1uddNAYc71uYXKSw69+6a1eeXPS1v996xiWcjFI/KK13TrzzMSvg6CvRLCVvP
  LmZPzrVY8VChbu33PlX29S60yNf5YbLxoyZKRZP1G8t7fU1FKLMUZiYZazEXFiQBZLoT4MwMA
  AA==
X-Env-Sender: Hector.Bujanda@digi.com
X-Msg-Ref: server-3.tower-414.messagelabs.com!1587255576!1658909!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19104 invoked from network); 19 Apr 2020 00:19:36 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-3.tower-414.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 19 Apr 2020 00:19:36 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
 (10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.468.0; Sat, 18 Apr 2020
 19:19:36 -0500
Received: from localhost.localdomain (172.27.2.183) by dor-sms-xch01.digi.com
 (10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.468.0; Sun, 19 Apr 2020
 02:19:30 +0200
From:   Hector Bujanda <hector.bujanda@digi.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
Date:   Sat, 18 Apr 2020 17:18:57 -0700
Message-ID: <20200419001858.105281-1-hector.bujanda@digi.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.27.2.183]
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This allows calling gpiod_set_debounce function through char device ioctl.

Signed-off-by: Hector Bujanda <hector.bujanda@digi.com>
---
 drivers/gpio/gpiolib.c    | 12 ++++++++++++
 include/uapi/linux/gpio.h | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 70f0dedca59f..c959c2962f15 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1073,6 +1073,18 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
 		return 0;
+	} else if (cmd == GPIO_SET_DEBOUNCE_IOCTL) {
+		struct gpioline_debounce linedebounce;
+		struct gpio_desc *desc;
+
+		if (copy_from_user(&linedebounce, ip, sizeof(linedebounce)))
+			return -EFAULT;
+		if (linedebounce.line_offset >= gdev->ngpio)
+			return -EINVAL;
+
+		desc = &gdev->descs[linedebounce.line_offset];
+
+		return gpiod_set_debounce(desc, linedebounce.debounce_usec);
 	} else if (cmd == GPIO_GET_LINEHANDLE_IOCTL) {
 		return linehandle_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 1bf6e6df084b..4b092990d4c8 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -53,6 +53,17 @@ struct gpioline_info {
 	char consumer[32];
 };
 
+/**
+ * struct gpioline_debounce - GPIO line debounce
+ * @line_offset: the local offset on this GPIO device, fill this in when
+ * requesting the line information from the kernel
+ * @debounce_usec: debounce in uSeconds to set for this line
+ */
+struct gpioline_debounce {
+	__u32 line_offset;
+	__u32 debounce_usec;
+};
+
 /* Maximum number of requested handles */
 #define GPIOHANDLES_MAX 64
 
@@ -154,5 +165,6 @@ struct gpioevent_data {
 #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
 #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
 #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_request)
+#define GPIO_SET_DEBOUNCE_IOCTL _IOW(0xB4, 0x05, struct gpioline_debounce)
 
 #endif /* _UAPI_GPIO_H_ */
-- 
2.17.1

