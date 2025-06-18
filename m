Return-Path: <linux-gpio+bounces-21767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94101ADECEA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F580188AFA9
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323C32DE219;
	Wed, 18 Jun 2025 12:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgFQjueK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37D52DE1EC;
	Wed, 18 Jun 2025 12:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750250606; cv=none; b=H2EbACU8/2C+dwHw6046qte71j5bu9PWLNZ4635/jQ5T8IcxaKQPoLfAxhYNQHRq/DWV+TRE1fatkwBMyp2MJ3zTu6Mqu/GrGju/HRfnjHTcfBgeu9vAMP8RyxTv7pTSTqoCDvAi8BL1oyvLt629aJ5NMlDtyZpW5Ir/FKl1U1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750250606; c=relaxed/simple;
	bh=sEwTFjUCiBVe4R3iljd5w8GSzTd/qtNXrriFMn9qrO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SyiwhGzGGhSrCL81eJh2cnAvS+9z3WZ5VkGj+fGgpQTrZaN4RoCuacAS5AqL0lUZHoxVrJ/LD6elWtwjItOaPI+LUkW2xXL3KNWq2ZiYeY0sdGsVgp6dRqyXSzrz5aoEPbE+8XBDoDNFOzGp4mt9ToPoC0lxdAgyN/jH+j8miLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgFQjueK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75A8C4CEF2;
	Wed, 18 Jun 2025 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750250605;
	bh=sEwTFjUCiBVe4R3iljd5w8GSzTd/qtNXrriFMn9qrO0=;
	h=From:To:Cc:Subject:Date:From;
	b=QgFQjueKKcZsRqeXF7t+tyGl+x6nLtDn14B49OhBEA55yl8XHJDZaL2HnyuxqQ+/X
	 VvW7RehI4AsLyDQ0HQV6ZaxSICG7HVCR5mSoXxY5p1vrcSzVcJd6CNNsWfOXJZVtlM
	 6kaviF1wY2vRe3kXwu3UjqXz4jFa/9+nZ2S+kZPpv+wxC2xwK42PvOm7oWpXXaXUtZ
	 s7HdFaEzhAmPuLWIZEwVbO1OnJme5EDlnRGY2+pO4pqcKIQcs2ISoMdKnnv2l/U1dI
	 5ISwor4hZfuWh+lotKpcPWwXbLXpejpdnFdPVE5Di9OZYOAeS0YpGgWD0HJkNgNqSi
	 RL2nwSFyXIehQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH] platform: cznic: turris-omnia-mcu: Use new GPIO line value setter callbacks
Date: Wed, 18 Jun 2025 14:43:19 +0200
Message-ID: <20250618124319.19220-1-kabel@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 35 ++++++++++++-------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
index c2df24ea8686..57c229d70ead 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -439,27 +439,28 @@ static int omnia_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
 	return 0;
 }
 
-static void omnia_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int omnia_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	const struct omnia_gpio *gpio = &omnia_gpios[offset];
 	struct omnia_mcu *mcu = gpiochip_get_data(gc);
 	u16 val, mask;
 
 	if (!gpio->ctl_cmd)
-		return;
+		return -ENOTSUPP;
 
 	mask = BIT(gpio->ctl_bit);
 	val = value ? mask : 0;
 
-	omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
+	return omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
 }
 
-static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
-				    unsigned long *bits)
+static int omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				   unsigned long *bits)
 {
 	unsigned long ctl = 0, ctl_mask = 0, ext_ctl = 0, ext_ctl_mask = 0;
 	struct omnia_mcu *mcu = gpiochip_get_data(gc);
 	unsigned int i;
+	int err;
 
 	for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
 		unsigned long *field, *field_mask;
@@ -488,13 +489,21 @@ static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 
 	guard(mutex)(&mcu->lock);
 
-	if (ctl_mask)
-		omnia_ctl_cmd_locked(mcu, OMNIA_CMD_GENERAL_CONTROL,
-				     ctl, ctl_mask);
+	if (ctl_mask) {
+		err = omnia_ctl_cmd_locked(mcu, OMNIA_CMD_GENERAL_CONTROL,
+					   ctl, ctl_mask);
+		if (err)
+			return err;
+	}
+
+	if (ext_ctl_mask) {
+		err = omnia_ctl_cmd_locked(mcu, OMNIA_CMD_EXT_CONTROL,
+					   ext_ctl, ext_ctl_mask);
+		if (err)
+			return err;
+	}
 
-	if (ext_ctl_mask)
-		omnia_ctl_cmd_locked(mcu, OMNIA_CMD_EXT_CONTROL,
-				     ext_ctl, ext_ctl_mask);
+	return 0;
 }
 
 static bool omnia_gpio_available(struct omnia_mcu *mcu,
@@ -1015,8 +1024,8 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
 	mcu->gc.direction_output = omnia_gpio_direction_output;
 	mcu->gc.get = omnia_gpio_get;
 	mcu->gc.get_multiple = omnia_gpio_get_multiple;
-	mcu->gc.set = omnia_gpio_set;
-	mcu->gc.set_multiple = omnia_gpio_set_multiple;
+	mcu->gc.set_rv = omnia_gpio_set;
+	mcu->gc.set_multiple_rv = omnia_gpio_set_multiple;
 	mcu->gc.init_valid_mask = omnia_gpio_init_valid_mask;
 	mcu->gc.can_sleep = true;
 	mcu->gc.names = omnia_mcu_gpio_names;
-- 
2.49.0


