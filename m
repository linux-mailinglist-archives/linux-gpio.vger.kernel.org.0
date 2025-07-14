Return-Path: <linux-gpio+bounces-23250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92277B04BAC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 01:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C727116D71D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 23:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C13C28B407;
	Mon, 14 Jul 2025 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TecX8TEP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4664128AAF6;
	Mon, 14 Jul 2025 23:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752534392; cv=none; b=Ki/RNZ1N47kkwMx5TeIoL625zR7E8zpUD+1HewrfH/h//tlZk3pMCZDpjgRuvQywGfWNJi/EHcGpRvItwCGeqhMm13lv3SCW6YT4rMpz8rpJBFDCZe727fs91DlTjkNwI1xUzlaV+OrRD5FMTJNtWm0u8IfQLycEn0Kh+MEr8B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752534392; c=relaxed/simple;
	bh=ChNnv9/qNNtWIT13JsmzOk+r6SJUetuZttTYrEmHzRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AFOW12/C+j/0ijkl0AC7eSWMo8qBiz+KUTQ8to9fJgW4mgjOgSBkq9tO2kl5heKTSDoc9XhvpOg9Gt/WjvZoajUyI/BcY3MIkyDGZLmiClZz9f2O4EFha9A/Qdj9/giQd4R4okKPIiMzri1pG3bI/wlrLsv21X6CuUDx/QDsqPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TecX8TEP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA91EC4CEED;
	Mon, 14 Jul 2025 23:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752534391;
	bh=ChNnv9/qNNtWIT13JsmzOk+r6SJUetuZttTYrEmHzRY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TecX8TEPMsFjLP7FbupPn1S+bpEYY0Fhx6pndYZk8qLtHupUdLsJi58zwA9RHPku0
	 V/11MDNn9yqlfeo7NcNCzFAAbP7oTQg4jdZEvOBdVKziNWurLFAcFA6+8qqtWnvbqe
	 O7lcP8A8uJEDXROpGmzZdptxPot7Axhvwgw1Ln1/jBOE4PRfc84XP9ZukuyKA6z71s
	 XpuQkCpcZa4aX4uF+cgaP86aWa6TUTW7Kqxt/p0ByVljAjemOzhF4NIurd6++exa60
	 rSKk6J+M8khVbnHJ04an6S0e7lN+abFupfyYKEDwT3ISw2wYPVP1+O2kvMerNT6O5E
	 TKsF+JSr3DjQA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 07/15] gpio: of: initialize local variable passed to the .of_xlate() callback
Date: Mon, 14 Jul 2025 19:06:08 -0400
Message-Id: <20250714230616.3709521-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250714230616.3709521-1-sashal@kernel.org>
References: <20250714230616.3709521-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15.6
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
index 17802d97492fa..c8a1f9d4a3edb 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -708,7 +708,7 @@ struct gpio_desc *of_find_gpio(struct device_node *np, const char *con_id,
 			       unsigned int idx, unsigned long *flags)
 {
 	char propname[32]; /* 32 is max size of property name */
-	enum of_gpio_flags of_flags;
+	enum of_gpio_flags of_flags = 0;
 	const of_find_gpio_quirk *q;
 	struct gpio_desc *desc;
 
-- 
2.39.5


