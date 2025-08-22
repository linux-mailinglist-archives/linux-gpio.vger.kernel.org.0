Return-Path: <linux-gpio+bounces-24811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D308B31ADA
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 16:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD04A16F6D6
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 14:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05C53054EB;
	Fri, 22 Aug 2025 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b="DDJTRhKr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout4.mo533.mail-out.ovh.net (4.mo533.mail-out.ovh.net [46.105.32.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A92FDC3B
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.32.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755871594; cv=none; b=hrFYKMrI3bkthVWLDSTAtCBqCqoGpVT1zejDa8ek7Ix9+cT4aes9NSGHI52mMdjiJsNVruEnHOaAafqgBVULyGGzaZrJiJUyvD6bVxLVts4DmYZanp2mN2Yga8vbco9hF5H+eR1urdzAiiugNRF99intEF7/w1Oh8VkDyZkje1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755871594; c=relaxed/simple;
	bh=mobexwaFEPKvRq4c5TjJBbvqTGgsSTcXHU8meTu5HVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CuCmgoVtSDRXMFllOwGunU8QLoHkbouYPPN00xj28gsb2PFne/R0LGf2i7vOh445U/Vk2fMHmU+HxLmdD1sANF9aenylf14xCAd5aB50/qcp9ZlU7zeNiBMCbgW4kjiGb3Wzd+yP7f+8YWrtaYwkBUCmYDAMrCZ8/02co1EQoSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet; spf=pass smtp.mailfrom=orca.pet; dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b=DDJTRhKr; arc=none smtp.client-ip=46.105.32.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orca.pet
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net [51.68.80.175])
	by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4c7hcD03b7z5wtK;
	Fri, 22 Aug 2025 13:58:35 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net. [127.0.0.1])
        by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <brgl@bgdev.pl>; Fri, 22 Aug 2025 13:58:35 +0000 (UTC)
Received: from mta2.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.96.172])
	by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4c7hcC4Vprz5wH3;
	Fri, 22 Aug 2025 13:58:35 +0000 (UTC)
Received: from orca.pet (unknown [10.1.6.4])
	by mta2.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 9340A3E32CF;
	Fri, 22 Aug 2025 13:58:34 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-95G001eea4ffed-c7f3-48b3-b59a-bca0aebd966c,
                    ADC0680FE15BB91110492B9A34CE42AA242C155A) smtp.auth=marcos@orca.pet
X-OVh-ClientIp:147.156.42.5
From: Marcos Del Sol Vives <marcos@orca.pet>
To: linux-kernel@vger.kernel.org
Cc: Marcos Del Sol Vives <marcos@orca.pet>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v4 1/3] gpio: gpio-regmap: add flag to set direction before value
Date: Fri, 22 Aug 2025 15:58:11 +0200
Message-Id: <20250822135816.739582-2-marcos@orca.pet>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822135816.739582-1-marcos@orca.pet>
References: <20250822135816.739582-1-marcos@orca.pet>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8613978715448366694
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieefleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhgtohhsucffvghlucfuohhlucggihhvvghsuceomhgrrhgtohhssehorhgtrgdrphgvtheqnecuggftrfgrthhtvghrnhepudffudeutdejudeffeeugeehveevgfefiefgueejueejheevtefgtdffvddukeelnecukfhppeduvdejrddtrddtrddupddugeejrdduheeirdegvddrheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepmhgrrhgtohhssehorhgtrgdrphgvthdpnhgspghrtghpthhtohepledprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhgrrhgtohhssehorhgtrgdrphgvthdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdroh
 hrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhptghisehvghgvrhdrkhgvrhhnvghlrdhorhhg
DKIM-Signature: a=rsa-sha256; bh=WB97LK5wYLYtJExCAYyxWF9h54DDMHBADVZKaBy4Blo=;
 c=relaxed/relaxed; d=orca.pet; h=From; s=ovhmo-selector-1; t=1755871116;
 v=1;
 b=DDJTRhKrm5FrqTz0tw0XqnuRdt10sI6bgEEagIH3DovTIhju9RaMVSt69Hn/QKpcJjJ5evIf
 r1chFJNf7OlCcCuHyQi3QZ2vvysQ7EelDLZqqaaDS7H4UGWX8mtGEoCxm3RSmAK9Js7oLf6nbkG
 4hH5+mn2MpvOy5RcZsoh+vX6dlM3l6AL603oQ62dXqZdnWXwl48xGxh6X6oDaRxN5E6CPGDyw1A
 ESjrgMEAWtWTs/LJMqIveAo5haoKddS4UjRrRSe0OcthvX1KP1jh81G7IxsFDdsDsZ/ZjaPpoTS
 IBRimZx0jnmJrgGGMH0OWNLw/E89MFYYEGxoYwzxhaCiQ==

When configuring a pin as an output, by default the gpio-regmap driver
writes first the value and then configures the direction.

The Vortex86 family of SoCs, however, need the direction set before the
value, else writes to the data ports are ignored.

This commit adds a new "flags" field plus a flag to reverse that order,
allowing the direction to be set before the value.

Also, added a missing error check in gpio_regmap_direction_output().

Signed-off-by: Marcos Del Sol Vives <marcos@orca.pet>
---
 drivers/gpio/gpio-regmap.c  | 17 ++++++++++++++++-
 include/linux/gpio/regmap.h | 18 ++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index e8a32dfebdcb..24cefbd57637 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -31,6 +31,7 @@ struct gpio_regmap {
 	unsigned int reg_clr_base;
 	unsigned int reg_dir_in_base;
 	unsigned int reg_dir_out_base;
+	unsigned int flags;
 
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
 			      unsigned int offset, unsigned int *reg,
@@ -196,7 +197,20 @@ static int gpio_regmap_direction_input(struct gpio_chip *chip,
 static int gpio_regmap_direction_output(struct gpio_chip *chip,
 					unsigned int offset, int value)
 {
-	gpio_regmap_set(chip, offset, value);
+	struct gpio_regmap *gpio = gpiochip_get_data(chip);
+	int ret;
+
+	if (gpio->flags & GPIO_REGMAP_DIR_BEFORE_SET) {
+		ret = gpio_regmap_set_direction(chip, offset, true);
+		if (ret)
+			return ret;
+
+		return gpio_regmap_set(chip, offset, value);
+	}
+
+	ret = gpio_regmap_set(chip, offset, value);
+	if (ret)
+		return ret;
 
 	return gpio_regmap_set_direction(chip, offset, true);
 }
@@ -247,6 +261,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	gpio->reg_clr_base = config->reg_clr_base;
 	gpio->reg_dir_in_base = config->reg_dir_in_base;
 	gpio->reg_dir_out_base = config->reg_dir_out_base;
+	gpio->flags = config->flags;
 
 	chip = &gpio->gpio_chip;
 	chip->parent = config->parent;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index c722c67668c6..a2257a1288a8 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -3,6 +3,8 @@
 #ifndef _LINUX_GPIO_REGMAP_H
 #define _LINUX_GPIO_REGMAP_H
 
+#include <linux/bits.h>
+
 struct device;
 struct fwnode_handle;
 struct gpio_regmap;
@@ -12,6 +14,19 @@ struct regmap;
 #define GPIO_REGMAP_ADDR_ZERO ((unsigned int)(-1))
 #define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
 
+/**
+ * enum gpio_regmap_flags - flags to control GPIO operation
+ */
+enum gpio_regmap_flags {
+	/**
+	 * @GPIO_REGMAP_DIR_BEFORE_SET: when setting a pin as an output, set
+	 * its direction before the value. The output value will be undefined
+	 * for a short time which may have unwanted side effects, but some
+	 * hardware requires this.
+	 */
+	GPIO_REGMAP_DIR_BEFORE_SET	= BIT(0),
+};
+
 /**
  * struct gpio_regmap_config - Description of a generic regmap gpio_chip.
  * @parent:		The parent device
@@ -23,6 +38,8 @@ struct regmap;
  *			If not given, the name of the device is used.
  * @ngpio:		(Optional) Number of GPIOs
  * @names:		(Optional) Array of names for gpios
+ * @flags:		(Optional) A bitmask of flags from
+ *			&enum gpio_regmap_flags
  * @reg_dat_base:	(Optional) (in) register base address
  * @reg_set_base:	(Optional) set register base address
  * @reg_clr_base:	(Optional) clear register base address
@@ -68,6 +85,7 @@ struct gpio_regmap_config {
 	const char *label;
 	int ngpio;
 	const char *const *names;
+	unsigned int flags;
 
 	unsigned int reg_dat_base;
 	unsigned int reg_set_base;
-- 
2.34.1


