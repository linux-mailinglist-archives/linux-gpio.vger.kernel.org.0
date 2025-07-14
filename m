Return-Path: <linux-gpio+bounces-23252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5987B04BCB
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 01:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45DB64A12C7
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 23:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFCF292910;
	Mon, 14 Jul 2025 23:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOxCeuJX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F6B28E575;
	Mon, 14 Jul 2025 23:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752534449; cv=none; b=NxU6Tkr0ne/Rl4iuJEr6ZKWlyxOshBUT9FozeQsg/YezRPcBVrjcby/xU2N3It8PIyU3KsiPc7LjH6uBaOSwXu0nTEnSD6kbwrecEs6SjAmN57mGSalDKoiJ7p2eAWYKhMlcQkNJBoN5CS0NsaHHpXZeVLJbeIKOFtWU65YmKTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752534449; c=relaxed/simple;
	bh=M3ZrGG4NqCecLOy7ghueYPG0b2/cith4jDoCB8lQlYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FpqTT/BKhyewSAU4fMkpMQD3IuHOo7lZh8Jb/2sLnRtKPU7A+KJuY5gaNfYj6bDZvefY7mSIOfRgNfLyjYesutK4xWA1sZXpzhwVxcylCVi07h/Y8IOXmBrjfy7v80mqPox/spzT2SOtTtEKMMRFZWfbLQ2u3O+H+clS/LlAb8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOxCeuJX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01595C4CEF0;
	Mon, 14 Jul 2025 23:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752534449;
	bh=M3ZrGG4NqCecLOy7ghueYPG0b2/cith4jDoCB8lQlYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UOxCeuJXEYVSOXZHQC7ypM5F4UDJqK84iTbCW32ER/6nPC6XG+jGtMGJVW1IfUvQ8
	 RXC1IjKtW4ByP5/gntdbSnwr1zhRNX14hDPfBZmiavoISs1zoF7Dw5p8SNJ18RHlm2
	 uHjJy1O6Y8Ygw7axS/cay0KwdE71xaslfv098nXTgx1C43G0mi7O5EMxr5KeHqzhli
	 NtehJizY0qDdfOG1K2Y8fW+F6QO4N7ROZK1GGyjoZjy0ATV0W9YvoeXbJtfOdj8H8I
	 +6E0DikjO/UCwgdKhw+MpTT1jEsTioHFdE3jDOqVED1bCJQ9v/sjDFxiP70UDfz2vg
	 AIR5JLPJ5EUdg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 06/12] gpio: of: initialize local variable passed to the .of_xlate() callback
Date: Mon, 14 Jul 2025 19:07:09 -0400
Message-Id: <20250714230715.3710039-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250714230715.3710039-1-sashal@kernel.org>
References: <20250714230715.3710039-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.38
Content-Transfer-Encoding: 8bit

From: Alexander Stein <alexander.stein@ew.tq-group.com>

[ Upstream commit d563e7f95c933816efe531c3a48e22bc099c0f55 ]

of_flags is passed down to GPIO chip's xlate function, so ensure this one
is properly initialized as - if the xlate callback does nothing with it
- we may end up with various configuration errors like:

    gpio-720 (enable): multiple pull-up, pull-down or pull-disable enabled, invalid configuration

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Link: https://lore.kernel.org/r/20250708083829.658051-1-alexander.stein@ew.tq-group.com
[Bartosz: tweaked the commit message]
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis, here's my determination:

**YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **It fixes a real bug that affects users**: The uninitialized
   `of_flags` variable can contain random stack data that gets passed to
   GPIO chip's xlate callback and subsequently converted to GPIO lookup
   flags. This can lead to spurious error messages like "multiple pull-
   up, pull-down or pull-disable enabled, invalid configuration" when
   random bits in the uninitialized variable match the OF_GPIO_PULL_UP
   (0x10), OF_GPIO_PULL_DOWN (0x20), or OF_GPIO_PULL_DISABLE (0x40)
   flags.

2. **The fix is small and contained**: The change is minimal - just
   initializing `enum of_gpio_flags of_flags = 0;` instead of leaving it
   uninitialized. This is a single-line change that doesn't affect any
   other functionality.

3. **Clear cause and effect**: The code path shows that:
   - `of_flags` is declared uninitialized in `of_find_gpio()` (line 702)
   - It's passed by reference to `of_get_named_gpiod_flags()` (line 708)
   - Which passes it to `of_xlate_and_get_gpiod_flags()` (line 422-423)
   - Which passes it to the chip's `of_xlate()` callback (line 146)
   - If the xlate callback doesn't modify the flags (which is valid
     behavior), the uninitialized value is preserved
   - The uninitialized value is then converted by
     `of_convert_gpio_flags()` (line 720)
   - Random bits can trigger invalid configuration detection in the GPIO
     subsystem

4. **No architectural changes**: This is a straightforward bug fix that
   doesn't introduce new features or change any APIs.

5. **Minimal risk of regression**: Initializing a variable to zero is
   extremely low risk. The worst case would be if some driver was
   inadvertently relying on the undefined behavior, but that would be a
   bug in that driver.

6. **Affects core GPIO subsystem**: The bug is in the core GPIO OF code
   path that's used by many GPIO controllers, making it important to fix
   across all supported kernels.

The commit clearly fixes a bug where uninitialized memory can cause
false error conditions, making it an excellent candidate for stable
backporting according to the stable tree rules.

 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 36f8c7bb79d81..2fbee14570b66 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -699,7 +699,7 @@ struct gpio_desc *of_find_gpio(struct device_node *np, const char *con_id,
 			       unsigned int idx, unsigned long *flags)
 {
 	char propname[32]; /* 32 is max size of property name */
-	enum of_gpio_flags of_flags;
+	enum of_gpio_flags of_flags = 0;
 	const of_find_gpio_quirk *q;
 	struct gpio_desc *desc;
 
-- 
2.39.5


