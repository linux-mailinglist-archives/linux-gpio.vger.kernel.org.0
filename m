Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE2EEEB31C
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 15:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbfJaOtE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 10:49:04 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40938 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbfJaOtE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 10:49:04 -0400
Received: by mail-pl1-f195.google.com with SMTP id e3so689777plt.7
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2019 07:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/KIWhZ+w5Vi6sDcWBegYkb0Odafz7JIkaIVtVTdkUHE=;
        b=VrL0tim7IuKEvKl8nNhQj2Zq24OaMBiotM3mhPE7+QITy0l0BIWz+1JVbucDKwRqjN
         SDrfcRYB3sh/IU4B9he+Snia+6O+eqbcCbIpatKNKT4RQ9ov1NG8/Wq47Onu5HTl8nbY
         VuxU6Pih+3mUBzVGxhm6G6xkmnnqAIEZZGfADi0vBcgyftjLXL2Q88p4PKx4hJAESnIQ
         +XfiIuow/D9X338Pr4AojOtz8YyrF3ethbZ5AQKdUWaPIaS0LChiEpDLOuVc9duV4ohq
         q79EsUrdDhah36I4EDvg0NGYlUwpBo51GuBTVFEA1/qi1oW5ghQGLM7/MxnPSPannJIe
         Eaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/KIWhZ+w5Vi6sDcWBegYkb0Odafz7JIkaIVtVTdkUHE=;
        b=ahS2EM3fiL3EN7LU87BEQSBfSNd454cO22jc679se0OBfqDCeiRwbai0sHxPnfznjz
         CY2l2yZJMkGnRcjoHG+zJP+WhPscacg5XO0IK0GiYbfglT3d7QHjhpzPNYgIATgUE8P3
         0mZr+VIpVCjYP34gY9bc6VsLf0+yxLPPTTJrDuzvKO9zfyaF9IArwJTXLIkTHUvFaQgH
         ju8JLcnJKQecerpy/atVm+kzvtS2fM+U8JHxjJdJwhDeUYoIVx2PEfmU2NYiwP4v4D54
         sYKun/1486XKSaffv3mmqnm8AHKnPT31wtewEoyWm2QJB+/QrA0gqn+5sEmn1dHQPSzM
         wNNg==
X-Gm-Message-State: APjAAAWI5oAI3ohhzhUlIjb+BO6lS9UUB5TIbVcYxuKr0a581oDj5Umm
        D87YkZs70o9JFyeP0qm8UGiaNwncNuyUjg==
X-Google-Smtp-Source: APXvYqznKml7dZKxqWa18qc60rHC7NAT/JVnR/qEL42uAMyu8GzZMBcSKF9oR8pknMgGIH4Jz2n4ng==
X-Received: by 2002:a17:902:7b98:: with SMTP id w24mr6502022pll.299.1572533343129;
        Thu, 31 Oct 2019 07:49:03 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y126sm4568456pfg.74.2019.10.31.07.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 07:49:02 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 2/2] gpio: add new SET_CONFIG ioctl() to gpio chardev
Date:   Thu, 31 Oct 2019 22:48:25 +0800
Message-Id: <20191031144825.32105-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191031144825.32105-1-warthog618@gmail.com>
References: <20191031144825.32105-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the GPIOHANDLE_SET_CONFIG_IOCTL to the gpio chardev.
The ioctl allows some of the configuration of a requested handle to be
changed without having to release the line.
The primary use case is the changing of direction for bi-directional 
lines.

Based on initial work by Bartosz Golaszewski <bgolaszewski@baylibre.com>

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c    | 68 +++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/gpio.h | 18 +++++++++++
 2 files changed, 86 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4e8fbd74a29c..7c026ee58917 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -475,6 +475,73 @@ static int linehandle_validate_flags(u32 flags)
 	return 0;
 }
 
+static void linehandle_configure_flag(unsigned long *flagsp,
+				      u32 bit, bool active)
+{
+	if (active)
+		set_bit(bit, flagsp);
+	else
+		clear_bit(bit, flagsp);
+}
+
+static long linehandle_set_config(struct linehandle_state *lh,
+				  void __user *ip)
+{
+	struct gpiohandle_config gcnf;
+	struct gpio_desc *desc;
+	int i, ret;
+	u32 lflags;
+	unsigned long *flagsp;
+
+	if (copy_from_user(&gcnf, ip, sizeof(gcnf)))
+		return -EFAULT;
+
+	lflags = gcnf.flags;
+	ret = linehandle_validate_flags(lflags);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < lh->numdescs; i++) {
+		desc = lh->descs[i];
+		flagsp = &desc->flags;
+
+		linehandle_configure_flag(flagsp, FLAG_ACTIVE_LOW,
+			lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
+
+		linehandle_configure_flag(flagsp, FLAG_OPEN_DRAIN,
+			lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
+
+		linehandle_configure_flag(flagsp, FLAG_OPEN_SOURCE,
+			lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
+
+		linehandle_configure_flag(flagsp, FLAG_PULL_UP,
+			lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
+
+		linehandle_configure_flag(flagsp, FLAG_PULL_DOWN,
+			lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
+
+		linehandle_configure_flag(flagsp, FLAG_BIAS_DISABLE,
+			lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
+
+		/*
+		 * Lines have to be requested explicitly for input
+		 * or output, else the line will be treated "as is".
+		 */
+		if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
+			int val = !!gcnf.default_values[i];
+
+			ret = gpiod_direction_output(desc, val);
+			if (ret)
+				return ret;
+		} else if (lflags & GPIOHANDLE_REQUEST_INPUT) {
+			ret = gpiod_direction_input(desc);
+			if (ret)
+				return ret;
+		}
+	}
+	return 0;
+}
+
 static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 			     unsigned long arg)
 {
@@ -525,6 +592,8 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 					      lh->descs,
 					      NULL,
 					      vals);
+	} else if (cmd == GPIOHANDLE_SET_CONFIG_IOCTL) {
+		return linehandle_set_config(lh, ip);
 	}
 	return -EINVAL;
 }
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 7cc21c3b0839..799cf823d493 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -100,6 +100,24 @@ struct gpiohandle_request {
 	int fd;
 };
 
+/**
+ * struct gpiohandle_config - Configuration for a GPIO handle request
+ * @flags: updated flags for the requested GPIO lines, such as
+ * GPIOHANDLE_REQUEST_OUTPUT, GPIOHANDLE_REQUEST_ACTIVE_LOW etc, OR:ed
+ * together
+ * @default_values: if the GPIOHANDLE_REQUEST_OUTPUT is set in flags,
+ * this specifies the default output value, should be 0 (low) or
+ * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
+ * @padding: reserved for future use and should be zero filled
+ */
+struct gpiohandle_config {
+	__u32 flags;
+	__u8 default_values[GPIOHANDLES_MAX];
+	__u32 padding[4]; /* padding for future use */
+};
+
+#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_config)
+
 /**
  * struct gpiohandle_data - Information of values on a GPIO handle
  * @values: when getting the state of lines this contains the current
-- 
2.23.0

