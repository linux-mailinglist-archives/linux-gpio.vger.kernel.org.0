Return-Path: <linux-gpio+bounces-14794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB15CA110F6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 20:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9F7F169B47
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 19:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05261FCD0B;
	Tue, 14 Jan 2025 19:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K8W8VpTI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571621FAC29
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 19:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736882088; cv=none; b=lRmHbEGeq2RInOGtHZJDeVpRsevjybVRQBEoLZI6eRahaq2/hZN3zY2H2BCkxtWhrn/LN8denUQHclg6k//3g+civt1HAQdydXgAIZ2dDpVybLdtaiF+aVNeM83WhtI92iG6zmmCSJ/Ii2Zz6u7Y8Kx0sRUnoBToQGJXdEv0460=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736882088; c=relaxed/simple;
	bh=WobRk9G+jzoYeDi9BvlQAf+Z+kwUm1ZqcHZtiyky5Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dyKo6J9p/r2gjMmSEshLqymfvHu72RdTUIuDE8A4qQGCQAzwKNdGBjSp4HIhKSD1O9DVM+rhlPomV6gH6BHB0zGZx1KCbmpBOleloyHdbBHUk7ZTYCSLdG7SNdmEyKhFutZnUBZXqfDI8TGrWLcqMAJ8eOfiDa1GOjTwy1vjEXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K8W8VpTI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e0d47720so433564f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 11:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736882085; x=1737486885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ6kl1euqxUXFmiD96nPxmfZ3b58EO9sP3qhQv0QOX0=;
        b=K8W8VpTIu70Kult+qkd4T88tfhplrW6U6Bo5lRXsaGIJq6z50J32rqmyqYwrUfab2p
         fDjR5es7UqPCmTturauhtWbv7qnVsjRKdrFNLV1wrKrHQ2YYkx3Oaj/P2eOZZypfSiJ0
         xSSHKkpOf93Z8MLaOUGEo0soSBzDawL7bUd3brPEwE2LCgWtiQgOXaRkk1HWsKfUU2XR
         0X2X6F43mwU7t58J/MkqJ527aKHlfJQ7giABEL/EH/Y7yVfaM/MctvhntQRlTqqeDm7T
         SQDyhAHY8iKPCvdLUHl/gL7TCuzAkVkKzAbPRX4itwJ+aXGmUjq3Spe2Ijj70pE4jLFl
         jy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736882085; x=1737486885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQ6kl1euqxUXFmiD96nPxmfZ3b58EO9sP3qhQv0QOX0=;
        b=h6zwepSMmMmxs75HCvURA4KiTe5rtTUlTyxaLm2UHoDwdOHH/2Ic8NdWX1+sDe4Hfs
         b2kI1nV+/6PkHhoqtghyiEKNrglMIGQ+GGQRX/gCzGKq5kCNvJBd6Sp/1vH9SEIp7sCz
         /3dLfD8i2kMCD3SR2cHzo7P4BghYK+D+ABoCyp00Pi0PokCCnuFarbxSLpTBIc8ZxyqI
         T+pLtvJptTLLeQsC6rPuXuIMRn+/FYewmM3I1rUSMH73Gw59RaX2YnBOgqZNfmpRZc7Z
         IQq2ypGrr2BrzE5cBmQcX6SxL0a5hAz1fr1VZy0sDl7z2QjJQti2NVlodH7KdV+shJHG
         JBPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW7xkHk47Or5v4k81ySrh7Ss7mdw3sKldOzJYdDvtB4XZjQipVUy94lyFBI8hXYibrPJkzhUSBMXmy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5/EpErw4D+Gk2MsNSMHX9Z3hNcvpwbjD0uiiXceC7hIW9cYTa
	aWIWUzkw8ZK4eWmulIMMxm6Lk29lTsZR115SmPDpiOGMTgWOMFAkI+PxdzuPCJY=
X-Gm-Gg: ASbGncvSrpsno6CvdVul1+G/n854+rgPJS2AvdCs923+9cmfL9De2VtamsYjMhUZq+U
	7yJbdoCh8YVnUj+Iwh1vQaI2cD3Q0j75p2VmpGrbBT8CAClzDGvvxa3TwyxXa01ciH0K3oNYQCi
	N2KZha35VpxI5Of68wK16YbTAJHym0i0mYv0Xx8UyWSjHg3dBqTr8rEHkMLOErNVvhK30jq3lYI
	o0/elQ7XAqwERWQEYz7hA9h4Jjj5z9XoLv1lpgvq3f12e6ygJGf768WXB0TFOvJz4xN/hI=
X-Google-Smtp-Source: AGHT+IH1zV4TdpuGEzXlmDKzlhTZeOglE/e6Vh0NhLYPgPb3r+w0Yshbz4UIzt3sqXZwggicjeJV+A==
X-Received: by 2002:a05:6000:18a3:b0:38a:615c:8266 with SMTP id ffacd0b85a97d-38a872d2e1cmr9347396f8f.1.1736882084522;
        Tue, 14 Jan 2025 11:14:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm15415992f8f.80.2025.01.14.11.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:14:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Nandor Han <nandor.han@ge.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] gpio: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 20:14:38 +0100
Message-ID: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
1. Many more files changed.
---
 drivers/gpio/gpio-brcmstb.c     | 3 ++-
 drivers/gpio/gpio-crystalcove.c | 3 ++-
 drivers/gpio/gpio-grgpio.c      | 3 ++-
 drivers/gpio/gpio-mvebu.c       | 7 ++++---
 drivers/gpio/gpio-nomadik.c     | 3 ++-
 drivers/gpio/gpio-stmpe.c       | 6 +++---
 drivers/gpio/gpio-wcove.c       | 3 ++-
 drivers/gpio/gpio-wm831x.c      | 3 ++-
 drivers/gpio/gpio-xra1403.c     | 3 ++-
 drivers/gpio/gpiolib.c          | 3 ++-
 10 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 491b529d25f8..ca3472977431 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -9,6 +9,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 
 enum gio_reg_index {
 	GIO_REG_ODEN = 0,
@@ -224,7 +225,7 @@ static int brcmstb_gpio_priv_set_wake(struct brcmstb_gpio_priv *priv,
 		ret = disable_irq_wake(priv->parent_wake_irq);
 	if (ret)
 		dev_err(&priv->pdev->dev, "failed to %s wake-up interrupt\n",
-				enable ? "enable" : "disable");
+			str_enable_disable(enable));
 	return ret;
 }
 
diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 25db014494a4..56effd0f50c7 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 
 #define CRYSTALCOVE_GPIO_NUM	16
@@ -317,7 +318,7 @@ static void crystalcove_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip
 		offset = gpio % 8;
 		seq_printf(s, " gpio-%-2d %s %s %s %s ctlo=%2x,%s %s %s\n",
 			   gpio, ctlo & CTLO_DIR_OUT ? "out" : "in ",
-			   ctli & 0x1 ? "hi" : "lo",
+			   str_hi_lo(ctli & 0x1),
 			   ctli & CTLI_INTCNT_NE ? "fall" : "    ",
 			   ctli & CTLI_INTCNT_PE ? "rise" : "    ",
 			   ctlo,
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 169f33c41c59..30a0522ae735 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -30,6 +30,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 
 #define GRGPIO_MAX_NGPIO 32
 
@@ -438,7 +439,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 	}
 
 	dev_info(dev, "regs=0x%p, base=%d, ngpio=%d, irqs=%s\n",
-		 priv->regs, gc->base, gc->ngpio, priv->domain ? "on" : "off");
+		 priv->regs, gc->base, gc->ngpio, str_on_off(priv->domain));
 
 	return 0;
 }
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 5ffb332e9849..363bad286c32 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -49,6 +49,7 @@
 #include <linux/pwm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 /*
  * GPIO unit register offsets.
@@ -907,14 +908,14 @@ static void mvebu_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		if (is_out) {
 			seq_printf(s, " out %s %s\n",
-				   out & msk ? "hi" : "lo",
+				   str_hi_lo(out & msk),
 				   blink & msk ? "(blink )" : "");
 			continue;
 		}
 
 		seq_printf(s, " in  %s (act %s) - IRQ",
-			   (data_in ^ in_pol) & msk  ? "hi" : "lo",
-			   in_pol & msk ? "lo" : "hi");
+			   str_hi_lo((data_in ^ in_pol) & msk),
+			   str_lo_hi(in_pol & msk));
 		if (!((edg_msk | lvl_msk) & msk)) {
 			seq_puts(s, " disabled\n");
 			continue;
diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 836f1cc760c2..fa19a44943fd 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -30,6 +30,7 @@
 #include <linux/reset.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 
 #include <linux/gpio/gpio-nomadik.h>
@@ -430,7 +431,7 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 		seq_printf(s, " gpio-%-3d (%-20.20s) out %s           %s",
 			   gpio,
 			   label ?: "(none)",
-			   data_out ? "hi" : "lo",
+			   str_hi_lo(data_out),
 			   (mode < 0) ? "unknown" : modes[mode]);
 	} else {
 		int irq = chip->to_irq(chip, offset);
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 75a3633ceddb..2e22e1eb7495 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 /*
  * These registers are modified under the irq bus lock and cached to avoid
@@ -273,8 +274,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 
 	if (dir) {
 		seq_printf(s, " gpio-%-3d (%-20.20s) out %s",
-			   gpio, label ?: "(none)",
-			   val ? "hi" : "lo");
+			   gpio, label ?: "(none)", str_hi_lo(val));
 	} else {
 		u8 edge_det_reg;
 		u8 rise_reg;
@@ -343,7 +343,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %13s %13s %25s %25s",
 			   gpio, label ?: "(none)",
-			   val ? "hi" : "lo",
+			   str_hi_lo(val),
 			   edge_det_values[edge_det],
 			   irqen ? "IRQ-enabled" : "IRQ-disabled",
 			   rise_values[rise],
diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 94ca9d03c094..1ec24f6f9300 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
+#include <linux/string_choices.h>
 
 /*
  * Whiskey Cove PMIC has 13 physical GPIO pins divided into 3 banks:
@@ -393,7 +394,7 @@ static void wcove_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		seq_printf(s, " gpio-%-2d %s %s %s %s ctlo=%2x,%s %s\n",
 			   gpio, ctlo & CTLO_DIR_OUT ? "out" : "in ",
-			   ctli & 0x1 ? "hi" : "lo",
+			   str_hi_lo(ctli & 0x1),
 			   ctli & CTLI_INTCNT_NE ? "fall" : "    ",
 			   ctli & CTLI_INTCNT_PE ? "rise" : "    ",
 			   ctlo,
diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index f7d5120ff8f1..61bb83a1e8ae 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -16,6 +16,7 @@
 #include <linux/mfd/core.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
+#include <linux/string_choices.h>
 
 #include <linux/mfd/wm831x/core.h>
 #include <linux/mfd/wm831x/pdata.h>
@@ -234,7 +235,7 @@ static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		seq_printf(s, " %s %s %s %s%s\n"
 			   "                                  %s%s (0x%4x)\n",
 			   reg & WM831X_GPN_DIR ? "in" : "out",
-			   wm831x_gpio_get(chip, i) ? "high" : "low",
+			   str_high_low(wm831x_gpio_get(chip, i)),
 			   pull,
 			   powerdomain,
 			   reg & WM831X_GPN_POL ? "" : " inverted",
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index dc2710c21c50..842cf875bb92 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -13,6 +13,7 @@
 #include <linux/mutex.h>
 #include <linux/seq_file.h>
 #include <linux/spi/spi.h>
+#include <linux/string_choices.h>
 #include <linux/regmap.h>
 
 /* XRA1403 registers */
@@ -140,7 +141,7 @@ static void xra1403_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		seq_printf(s, " gpio-%-3d (%-12s) %s %s\n",
 			   chip->base + i, label,
 			   (gcr & BIT(i)) ? "in" : "out",
-			   (gsr & BIT(i)) ? "hi" : "lo");
+			   str_hi_lo(gsr & BIT(i)));
 	}
 }
 #else
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 679ed764cb14..be3351583508 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -26,6 +26,7 @@
 #include <linux/slab.h>
 #include <linux/srcu.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 
 #include <linux/gpio.h>
 #include <linux/gpio/driver.h>
@@ -5007,7 +5008,7 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 			seq_printf(s, " gpio-%-3u (%-20.20s|%-20.20s) %s %s %s%s\n",
 				   gpio, desc->name ?: "", gpiod_get_label(desc),
 				   is_out ? "out" : "in ",
-				   value >= 0 ? (value ? "hi" : "lo") : "?  ",
+				   value >= 0 ? str_hi_lo(value) : "?  ",
 				   is_irq ? "IRQ " : "",
 				   active_low ? "ACTIVE LOW" : "");
 		} else if (desc->name) {
-- 
2.43.0


