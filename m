Return-Path: <linux-gpio+bounces-29225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC811C9EC59
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 11:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BDB874E3C2E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 10:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2EB2EFD9C;
	Wed,  3 Dec 2025 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPkvBHzJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998A32DF13B;
	Wed,  3 Dec 2025 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759175; cv=none; b=Itd68G91Me1yiJfR7jhAPqjzkFQ5oRgzRPxYLeoGSKZ6oV9TSKdofcBVRVNLKw9QV1f82/FECdhIYEvEFSp2B0wEQMadLeZ7ao6BRw5HQEnBR1Ft+AYi5gNpuv+hhBzdjKkuK/1kCfRlEH84j8C7z6kXL3WKKgZ0cJP+G6grFVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759175; c=relaxed/simple;
	bh=CC24x473r5tbD4XJuoWW8uoCGG2+IjO8X1ZjjBAcOCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a1K28+RnSsNuSH6+5WKileHI/wYe3BqR4os9GGRvZpK//Zp5t/BEKKVmASqom+7EqN0MS+cLkxJxPHBC9zKJ4kMhN+HwORWnMqxsyYAbm+0NB5aGlGkBD2qFjkdQHCfKYZT7vSd7NNTkh1qHh7pHt8Y+sbuUVkIoNnPkom9yg38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPkvBHzJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EEBC4CEFB;
	Wed,  3 Dec 2025 10:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764759175;
	bh=CC24x473r5tbD4XJuoWW8uoCGG2+IjO8X1ZjjBAcOCg=;
	h=From:To:Cc:Subject:Date:From;
	b=nPkvBHzJ9ZtAeEtNd82ehrBt3p4pLbBlF3dpRwTQGdKkoKfq2K1Tx8905Oe7JQ82S
	 NwOQGRswqWn+au6BgtMRg8eSCIL/RvjrdWgF4StQaMMO2yf1qRIO8utPdMbq91vZC5
	 8NTJ4TRcVPLrm5mBxNwSnAY9sZn5wzD2i17qCfLH5m0IOM+wwNMTlBXPD/pUz36asx
	 FiTs1yk1L1GVKSGExN8rDNoSFACZ6POKooonelWb5Zz5QLwnOyvXbqJACdT7IirQlz
	 +6XrQR9YfdpZgY5OCxbgc6uCXruBesf69eTyaotSHGxu+X0ZHZsfe1BBaG2RsqvHnn
	 UcuaJU5ZUbkhA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vQkTm-000000006OD-0VYp;
	Wed, 03 Dec 2025 11:53:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] gpio: mmio: fix bad guard conversion
Date: Wed,  3 Dec 2025 11:52:06 +0100
Message-ID: <20251203105206.24453-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent spinlock guard conversion consistently used the wrong guard so
that interrupts are no longer disabled while holding the chip lock
(which can cause deadlocks).

Fixes: 7e061b462b3d ("gpio: mmio: use lock guards")
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpio-mmio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index b3a26a06260b..5daf962b0323 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -231,7 +231,7 @@ static int gpio_mmio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long mask = gpio_mmio_line2mask(gc, gpio);
 
-	guard(raw_spinlock)(&chip->lock);
+	guard(raw_spinlock_irqsave)(&chip->lock);
 
 	if (val)
 		chip->sdata |= mask;
@@ -262,7 +262,7 @@ static int gpio_mmio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long mask = gpio_mmio_line2mask(gc, gpio);
 
-	guard(raw_spinlock)(&chip->lock);
+	guard(raw_spinlock_irqsave)(&chip->lock);
 
 	if (val)
 		chip->sdata |= mask;
@@ -302,7 +302,7 @@ static void gpio_mmio_set_multiple_single_reg(struct gpio_chip *gc,
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long set_mask, clear_mask;
 
-	guard(raw_spinlock)(&chip->lock);
+	guard(raw_spinlock_irqsave)(&chip->lock);
 
 	gpio_mmio_multiple_get_masks(gc, mask, bits, &set_mask, &clear_mask);
 
@@ -391,7 +391,7 @@ static int gpio_mmio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
-	scoped_guard(raw_spinlock, &chip->lock) {
+	scoped_guard(raw_spinlock_irqsave, &chip->lock) {
 		chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
 
 		if (chip->reg_dir_in)
@@ -431,7 +431,7 @@ static void gpio_mmio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
-	guard(raw_spinlock)(&chip->lock);
+	guard(raw_spinlock_irqsave)(&chip->lock);
 
 	chip->sdir |= gpio_mmio_line2mask(gc, gpio);
 
-- 
2.51.2


