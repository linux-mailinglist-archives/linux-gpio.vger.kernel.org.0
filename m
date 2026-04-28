Return-Path: <linux-gpio+bounces-35712-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCFlDxvW8GkSZQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35712-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 17:45:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C65488249
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 17:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26A27301179A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 15:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEA83BED23;
	Tue, 28 Apr 2026 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwnq/MNQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0B43A759E;
	Tue, 28 Apr 2026 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391128; cv=none; b=o4ie4IjkVcraBbfrihnpE4twbKQ7KSsGglpWOUJT7VfTXlzNJtRT0ZluiYTR1/NFpqEe7sdbG+jrElJEbTss4BlAmwzTNkB8cVSFaFCFrq2ngpA6P4ZjNh+IK6i4qdQSZ+HriZHGlpszrTuNiAAyu3mfJbkM/SfpDOM4NMXGxHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391128; c=relaxed/simple;
	bh=hmPJ64Sd/SEqVAqAVmJmhdxdN1kRSfmYPQdUQLgLAW8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h6K4g3DEXWqmMNlXP/Hr5TrkEzfCWsC1DnmoJPifp8q/8YNX/rtRbcVffw/KH5B6m/M75mm/cFrBtBKTqS+NhdbFvCJ7elrl3gB0n6sIJwlsuN9CHsEFuXQkzj0m6LujsLGLTBR83I5MZlj8Pbln5eGv2lmEJO9Ap2rQEpG0rxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rwnq/MNQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C014C2BCAF;
	Tue, 28 Apr 2026 15:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777391127;
	bh=hmPJ64Sd/SEqVAqAVmJmhdxdN1kRSfmYPQdUQLgLAW8=;
	h=From:To:Cc:Subject:Date:From;
	b=rwnq/MNQ1EUUvbPYk8rnxL2v3zppQJV2y66Id+glSD3RZjd2EiwtoWftI6693rJCl
	 szd9RvztimgtPjrBm66fL+PPogkRw9O14lLXem4OFlTBGBOdhfsbvz+crFzQr9I7pc
	 ErjVNkl+zvCK3qdx9fbL7O5cZD4FRBiWW0vjOxMqyrW9Ro3Vud4v3b+p1DW5E3bdfW
	 K3U6/5IMZAr9egzS6th64z3pzfBnHBUFrhm/mw0Tkmskvx88tDX/HYXRO/BjoRrqqY
	 QFIxZH3isYC4egKEEaJ1RvD4cmwxCmJuDXN64dF24uYcoYPfHWGtwdH1t2FQbfRyDU
	 nH93nrR3bGyUw==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpiolib: move legacy interface into linux/gpio/legacy.h
Date: Tue, 28 Apr 2026 17:45:07 +0200
Message-Id: <20260428154522.2861492-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 96C65488249
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,linux.intel.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35712-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arndb.de:email]

From: Arnd Bergmann <arnd@arndb.de>

Split the old contents from gpio.h for clarity. Ideally any driver
that still includes linux/gpio.h can now be ported over to use
either linux/gpio/legacy.h or linux/gpio/consumer.h, with the
original file getting removed once that is complete.

No functional changes intended for now.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/gpio.h        | 161 +--------------------------------
 include/linux/gpio/legacy.h | 172 ++++++++++++++++++++++++++++++++++++
 2 files changed, 175 insertions(+), 158 deletions(-)
 create mode 100644 include/linux/gpio/legacy.h

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 8f85ddb26429..149cf580d20b 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -2,12 +2,9 @@
 /*
  * NOTE: This header *must not* be included.
  *
- * This is the LEGACY GPIO bulk include file, including legacy APIs. It is
- * used for GPIO drivers still referencing the global GPIO numberspace,
- * and should not be included in new code.
- *
  * If you're implementing a GPIO driver, only include <linux/gpio/driver.h>
  * If you're implementing a GPIO consumer, only include <linux/gpio/consumer.h>
+ * If you're using the legacy interfaces, include <linux/gpio/legacy.h>
  */
 #ifndef __LINUX_GPIO_H
 #define __LINUX_GPIO_H
@@ -18,159 +15,7 @@
 #endif
 
 #ifdef CONFIG_GPIOLIB_LEGACY
-
-struct device;
-
-/* make these flag values available regardless of GPIO kconfig options */
-#define GPIOF_IN		((1 << 0))
-#define GPIOF_OUT_INIT_LOW	((0 << 0) | (0 << 1))
-#define GPIOF_OUT_INIT_HIGH	((0 << 0) | (1 << 1))
-
-#ifdef CONFIG_GPIOLIB
-/*
- * "valid" GPIO numbers are nonnegative and may be passed to
- * setup routines like gpio_request().  Only some valid numbers
- * can successfully be requested and used.
- *
- * Invalid GPIO numbers are useful for indicating no-such-GPIO in
- * platform data and other tables.
- */
-static inline bool gpio_is_valid(int number)
-{
-	/* only non-negative numbers are valid */
-	return number >= 0;
-}
-
-/*
- * Platforms may implement their GPIO interface with library code,
- * at a small performance cost for non-inlined operations and some
- * extra memory (for code and for per-GPIO table entries).
- */
-
-/* Always use the library code for GPIO management calls,
- * or when sleeping may be involved.
- */
-int gpio_request(unsigned gpio, const char *label);
-void gpio_free(unsigned gpio);
-
-static inline int gpio_direction_input(unsigned gpio)
-{
-	return gpiod_direction_input(gpio_to_desc(gpio));
-}
-static inline int gpio_direction_output(unsigned gpio, int value)
-{
-	return gpiod_direction_output_raw(gpio_to_desc(gpio), value);
-}
-
-static inline int gpio_get_value_cansleep(unsigned gpio)
-{
-	return gpiod_get_raw_value_cansleep(gpio_to_desc(gpio));
-}
-static inline void gpio_set_value_cansleep(unsigned gpio, int value)
-{
-	gpiod_set_raw_value_cansleep(gpio_to_desc(gpio), value);
-}
-
-static inline int gpio_get_value(unsigned gpio)
-{
-	return gpiod_get_raw_value(gpio_to_desc(gpio));
-}
-static inline void gpio_set_value(unsigned gpio, int value)
-{
-	gpiod_set_raw_value(gpio_to_desc(gpio), value);
-}
-
-static inline int gpio_to_irq(unsigned gpio)
-{
-	return gpiod_to_irq(gpio_to_desc(gpio));
-}
-
-int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
-
-int devm_gpio_request_one(struct device *dev, unsigned gpio,
-			  unsigned long flags, const char *label);
-
-#else /* ! CONFIG_GPIOLIB */
-
-#include <linux/kernel.h>
-
-#include <asm/bug.h>
-#include <asm/errno.h>
-
-static inline bool gpio_is_valid(int number)
-{
-	return false;
-}
-
-static inline int gpio_request(unsigned gpio, const char *label)
-{
-	return -ENOSYS;
-}
-
-static inline int gpio_request_one(unsigned gpio,
-					unsigned long flags, const char *label)
-{
-	return -ENOSYS;
-}
-
-static inline void gpio_free(unsigned gpio)
-{
-	might_sleep();
-
-	/* GPIO can never have been requested */
-	WARN_ON(1);
-}
-
-static inline int gpio_direction_input(unsigned gpio)
-{
-	return -ENOSYS;
-}
-
-static inline int gpio_direction_output(unsigned gpio, int value)
-{
-	return -ENOSYS;
-}
-
-static inline int gpio_get_value(unsigned gpio)
-{
-	/* GPIO can never have been requested or set as {in,out}put */
-	WARN_ON(1);
-	return 0;
-}
-
-static inline void gpio_set_value(unsigned gpio, int value)
-{
-	/* GPIO can never have been requested or set as output */
-	WARN_ON(1);
-}
-
-static inline int gpio_get_value_cansleep(unsigned gpio)
-{
-	/* GPIO can never have been requested or set as {in,out}put */
-	WARN_ON(1);
-	return 0;
-}
-
-static inline void gpio_set_value_cansleep(unsigned gpio, int value)
-{
-	/* GPIO can never have been requested or set as output */
-	WARN_ON(1);
-}
-
-static inline int gpio_to_irq(unsigned gpio)
-{
-	/* GPIO can never have been requested or set as input */
-	WARN_ON(1);
-	return -EINVAL;
-}
-
-static inline int devm_gpio_request_one(struct device *dev, unsigned gpio,
-					unsigned long flags, const char *label)
-{
-	WARN_ON(1);
-	return -EINVAL;
-}
-
-#endif /* ! CONFIG_GPIOLIB */
+#include <linux/gpio/legacy.h>
 #endif /* CONFIG_GPIOLIB_LEGACY */
+
 #endif /* __LINUX_GPIO_H */
diff --git a/include/linux/gpio/legacy.h b/include/linux/gpio/legacy.h
new file mode 100644
index 000000000000..da7308a69e8b
--- /dev/null
+++ b/include/linux/gpio/legacy.h
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This is the LEGACY GPIO include file, used only for legacy APIs.
+ *
+ * No new code should use this, but instead use the linux/gpio/consumer.h
+ * interfaces directly.
+ */
+#ifndef __LINUX_GPIO_LEGACY_H
+#define __LINUX_GPIO_LEGACY_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_GPIOLIB_LEGACY
+
+struct device;
+
+/* make these flag values available regardless of GPIO kconfig options */
+#define GPIOF_IN		((1 << 0))
+#define GPIOF_OUT_INIT_LOW	((0 << 0) | (0 << 1))
+#define GPIOF_OUT_INIT_HIGH	((0 << 0) | (1 << 1))
+
+#ifdef CONFIG_GPIOLIB
+
+#include <linux/gpio/consumer.h>
+
+/*
+ * "valid" GPIO numbers are nonnegative and may be passed to
+ * setup routines like gpio_request().  Only some valid numbers
+ * can successfully be requested and used.
+ *
+ * Invalid GPIO numbers are useful for indicating no-such-GPIO in
+ * platform data and other tables.
+ */
+static inline bool gpio_is_valid(int number)
+{
+	/* only non-negative numbers are valid */
+	return number >= 0;
+}
+
+/*
+ * Platforms may implement their GPIO interface with library code,
+ * at a small performance cost for non-inlined operations and some
+ * extra memory (for code and for per-GPIO table entries).
+ */
+
+/* Always use the library code for GPIO management calls,
+ * or when sleeping may be involved.
+ */
+int gpio_request(unsigned gpio, const char *label);
+void gpio_free(unsigned gpio);
+
+static inline int gpio_direction_input(unsigned gpio)
+{
+	return gpiod_direction_input(gpio_to_desc(gpio));
+}
+static inline int gpio_direction_output(unsigned gpio, int value)
+{
+	return gpiod_direction_output_raw(gpio_to_desc(gpio), value);
+}
+
+static inline int gpio_get_value_cansleep(unsigned gpio)
+{
+	return gpiod_get_raw_value_cansleep(gpio_to_desc(gpio));
+}
+static inline void gpio_set_value_cansleep(unsigned gpio, int value)
+{
+	gpiod_set_raw_value_cansleep(gpio_to_desc(gpio), value);
+}
+
+static inline int gpio_get_value(unsigned gpio)
+{
+	return gpiod_get_raw_value(gpio_to_desc(gpio));
+}
+static inline void gpio_set_value(unsigned gpio, int value)
+{
+	gpiod_set_raw_value(gpio_to_desc(gpio), value);
+}
+
+static inline int gpio_to_irq(unsigned gpio)
+{
+	return gpiod_to_irq(gpio_to_desc(gpio));
+}
+
+int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
+
+int devm_gpio_request_one(struct device *dev, unsigned gpio,
+			  unsigned long flags, const char *label);
+
+#else /* ! CONFIG_GPIOLIB */
+
+#include <linux/kernel.h>
+
+#include <asm/bug.h>
+#include <asm/errno.h>
+
+static inline bool gpio_is_valid(int number)
+{
+	return false;
+}
+
+static inline int gpio_request(unsigned gpio, const char *label)
+{
+	return -ENOSYS;
+}
+
+static inline int gpio_request_one(unsigned gpio,
+					unsigned long flags, const char *label)
+{
+	return -ENOSYS;
+}
+
+static inline void gpio_free(unsigned gpio)
+{
+	might_sleep();
+
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+}
+
+static inline int gpio_direction_input(unsigned gpio)
+{
+	return -ENOSYS;
+}
+
+static inline int gpio_direction_output(unsigned gpio, int value)
+{
+	return -ENOSYS;
+}
+
+static inline int gpio_get_value(unsigned gpio)
+{
+	/* GPIO can never have been requested or set as {in,out}put */
+	WARN_ON(1);
+	return 0;
+}
+
+static inline void gpio_set_value(unsigned gpio, int value)
+{
+	/* GPIO can never have been requested or set as output */
+	WARN_ON(1);
+}
+
+static inline int gpio_get_value_cansleep(unsigned gpio)
+{
+	/* GPIO can never have been requested or set as {in,out}put */
+	WARN_ON(1);
+	return 0;
+}
+
+static inline void gpio_set_value_cansleep(unsigned gpio, int value)
+{
+	/* GPIO can never have been requested or set as output */
+	WARN_ON(1);
+}
+
+static inline int gpio_to_irq(unsigned gpio)
+{
+	/* GPIO can never have been requested or set as input */
+	WARN_ON(1);
+	return -EINVAL;
+}
+
+static inline int devm_gpio_request_one(struct device *dev, unsigned gpio,
+					unsigned long flags, const char *label)
+{
+	WARN_ON(1);
+	return -EINVAL;
+}
+
+#endif /* ! CONFIG_GPIOLIB */
+#endif /* CONFIG_GPIOLIB_LEGACY */
+#endif /* __LINUX_GPIO_LEGAGY_H */
-- 
2.39.5


