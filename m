Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83CC23FE6C
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 15:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgHIN0C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 09:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgHIN0A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 09:26:00 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4A9C061756;
        Sun,  9 Aug 2020 06:26:00 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 74so3695278pfx.13;
        Sun, 09 Aug 2020 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s4z3c80rW1f77SHZ1DJfS7Y59f6hWqfux6WtIWEmMvU=;
        b=c+fxjbMA/pmrjTOQrFBi7BTLmu8JzE+FNwqn84lltstF5Ox9UCTtTgEeEAlG8PxGWk
         v6+hjrsUwPWrIuBGU9coDdvfAEhXl9TbbKj71e5NRApNw5s+zfkDe5FEc6V68ATEIphk
         2NIB/Jm5BAfBIFUlzr/20eyZmlNZKsPl1JrtvnzBvGFD7vrOmuPkcllGOiWOAW7S8RrQ
         EunZ/F8uxWfRJLGgPfaLvDuagoC/F18UZHezPBo2tJ/Mv0GnN2pn+GSWbldRZy167Vk6
         XZ86iW07Co8rKTTGnpJlzZIjy3g0mKoKzNX6+RsIrMIJwyKECn3hoVinNqqQ6h/AKp1F
         J+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s4z3c80rW1f77SHZ1DJfS7Y59f6hWqfux6WtIWEmMvU=;
        b=rEaF4bgAp9ZRUKBAK2DX1Y7YijQ9JMYJNldn4Zp1e4ZyjWKXmKOHrQjHmWhztNYR0V
         Cx+GCdZ3TzXW+fz8EMapZ2zJ6zP7SE3Bd/TjYIlpGgNUM7bLKPEeV1POkhWb08jJKJlh
         yWYV56DsCWt0gNWuN0JSFg3zzBnBjvaQRQxeGYQDBIODAn5uM1vZyKnzce71wLNMd/7W
         KDS7u5xjj5Y64PX5kYTPt9I9giiaoo6CrVO0sSij9+jYNUUCdW/8VYFrfpC1DQmARyEr
         05KhBW8/n6gV2dTJSXJMiToMZwQIU8dffrrcSqpcdUjknhRN/4NpCXUIMrcpOZDAH3tF
         IsKA==
X-Gm-Message-State: AOAM532tkC1ldUAiMcUzcKWXOV0Leh72AiO2ugkOHTyE2kwc6cjP7VEe
        3dvAW5bI0P75yRG7i70KrA1Dhtmr
X-Google-Smtp-Source: ABdhPJzvnpT2RatQvrLksoUAFlmp4+JNUKIUsYMkAtTY6ssd5n9t0GLMxIMxCZ6cR+XdQ/ALWLs+qQ==
X-Received: by 2002:a65:60cb:: with SMTP id r11mr18873502pgv.131.1596979559381;
        Sun, 09 Aug 2020 06:25:59 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id j10sm9127414pff.171.2020.08.09.06.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 06:25:58 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 01/18] gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
Date:   Sun,  9 Aug 2020 21:25:12 +0800
Message-Id: <20200809132529.264312-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809132529.264312-1-warthog618@gmail.com>
References: <20200809132529.264312-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace constant array sizes with a macro constant to clarify the source
of array sizes, provide a place to document any constraints on the size,
and to simplify array sizing in userspace if constructing structs
from their composite fields.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/uapi/linux/gpio.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 9c27cecf406f..285cc10355b2 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -14,6 +14,11 @@
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
+/*
+ * The maximum size of name and label arrays.
+ */
+#define GPIO_MAX_NAME_SIZE 32
+
 /**
  * struct gpiochip_info - Information about a certain GPIO chip
  * @name: the Linux kernel name of this GPIO chip
@@ -22,8 +27,8 @@
  * @lines: number of GPIO lines on this chip
  */
 struct gpiochip_info {
-	char name[32];
-	char label[32];
+	char name[GPIO_MAX_NAME_SIZE];
+	char label[GPIO_MAX_NAME_SIZE];
 	__u32 lines;
 };
 
@@ -52,8 +57,8 @@ struct gpiochip_info {
 struct gpioline_info {
 	__u32 line_offset;
 	__u32 flags;
-	char name[32];
-	char consumer[32];
+	char name[GPIO_MAX_NAME_SIZE];
+	char consumer[GPIO_MAX_NAME_SIZE];
 };
 
 /* Maximum number of requested handles */
@@ -123,7 +128,7 @@ struct gpiohandle_request {
 	__u32 lineoffsets[GPIOHANDLES_MAX];
 	__u32 flags;
 	__u8 default_values[GPIOHANDLES_MAX];
-	char consumer_label[32];
+	char consumer_label[GPIO_MAX_NAME_SIZE];
 	__u32 lines;
 	int fd;
 };
@@ -182,7 +187,7 @@ struct gpioevent_request {
 	__u32 lineoffset;
 	__u32 handleflags;
 	__u32 eventflags;
-	char consumer_label[32];
+	char consumer_label[GPIO_MAX_NAME_SIZE];
 	int fd;
 };
 
-- 
2.28.0

