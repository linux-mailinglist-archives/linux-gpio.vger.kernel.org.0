Return-Path: <linux-gpio+bounces-12544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 882389BBDAB
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 20:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 343691F22D00
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 19:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A0E1CC899;
	Mon,  4 Nov 2024 19:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9VXQBg0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A01CC177;
	Mon,  4 Nov 2024 19:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730747193; cv=none; b=hg627kQqVOlBICOjzLGfVaWRDvCdegHp3jty9Sa/bB7tgnO8MMv3QxfYqcvYH+pPn+yGskHYGvnbTRGu1gBKl+8tY/1Rz9IVEwwUetFgthN9xi43N/zEOAt50Fz0qXk7NZiO6OziUSjhh9wqVW/jXReq1idXKqxeALt2WG+efgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730747193; c=relaxed/simple;
	bh=Lu1Fi0IEy8M6BgnItjbqpPrJ7Hppzar99nXYlc6ZBCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jbAS5fGYva8qhGl/WPpeicKDNfO6AmSgXS5FIfGRyBkHrm+KZxst0ESPlorEk18Hev3AnJXPg7o8EMr2JmwqIGgBys1AVDvN8Ee2z9NrN453j02X81AXOPUeonKhDER+WYGgMW7EQ+Tev2JmrViwHWkWpJniz3Ui8g4WCrsi5/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9VXQBg0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9CDC4CECE;
	Mon,  4 Nov 2024 19:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730747193;
	bh=Lu1Fi0IEy8M6BgnItjbqpPrJ7Hppzar99nXYlc6ZBCo=;
	h=From:To:Cc:Subject:Date:From;
	b=G9VXQBg0OJr9ruK9K4Te4NS+RvBhpRlD4WWJHJs3yIccyl3pRBkCfGWgMIYEIKzmw
	 rSTI1vpqCWAEaCVUnRfcPfmms/elbyEu3t9TBzjUBesAEXavjGErPlxcZmfy7PX9AQ
	 hUT8bvNn5S5o3YO4inhpE3WV53tj4MY2OBS8rCzlkuJlL1q52+GUtxZybenNVrDEeJ
	 H9OWVcFNMUU4JZk+6OVCq7VROHwDHURpj+XvwFN3bOf5eBG1dRfsn1wwx0tQbFVEM1
	 0HU40fbhcQbo2vXvhy2E35buIOujmsJHWjU16F9IxXF3TtMrhRyeG29tUODrrpUyfq
	 Oj0NfitO9kYEg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: Use of_property_present() for non-boolean properties
Date: Mon,  4 Nov 2024 13:06:27 -0600
Message-ID: <20241104190628.274717-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/gpio/gpio-rockchip.c | 2 +-
 drivers/gpio/gpiolib-of.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 365ab947983c..64924bc01591 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -602,7 +602,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	 * files which don't set the "gpio-ranges" property or systems that
 	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
 	 */
-	if (!of_property_read_bool(bank->of_node, "gpio-ranges")) {
+	if (!of_property_present(bank->of_node, "gpio-ranges")) {
 		struct device_node *pctlnp = of_get_parent(bank->of_node);
 		struct pinctrl_dev *pctldev = NULL;
 
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 880f1efcaca5..2e537ee979f3 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -337,7 +337,7 @@ static void of_gpio_flags_quirks(const struct device_node *np,
 	 * to determine if the flags should have inverted semantics.
 	 */
 	if (IS_ENABLED(CONFIG_SPI_MASTER) && !strcmp(propname, "cs-gpios") &&
-	    of_property_read_bool(np, "cs-gpios")) {
+	    of_property_present(np, "cs-gpios")) {
 		u32 cs;
 		int ret;
 
-- 
2.45.2


