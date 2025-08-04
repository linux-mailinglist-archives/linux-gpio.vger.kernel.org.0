Return-Path: <linux-gpio+bounces-23977-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA6B19710
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 02:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7701173D30
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 00:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE361991BF;
	Mon,  4 Aug 2025 00:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iS0xP6W1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A911F19307F;
	Mon,  4 Aug 2025 00:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754267081; cv=none; b=LKZsBzKxI4KGGu4kGAFmzHnEmON50YQ1k2/JtNJrpmShg6ciOUQH53+nhOS6FeiMo3SKlWe9rFSUsGtdM3wJjiC4fkCvy2hVvlMoLji8jo5NSwqxDoag3Vydk3UtpPJsOfcItw7IN9UaTtM7oD7xoww8KWNoyNipEaGwQxsU6SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754267081; c=relaxed/simple;
	bh=5+VGatyAyn0VYzmKC+9QVp6Me0hrtlbLXliosSpLPOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ovGQgonh9DhmSDrS1zqVZwZ+ZgiUqH/Y549hc/Dd0iK3bistexqykDUtTuGNf4CwmKs3xlQ8x6XJi42AmvKxDhsCgUTpofFMfvvgXp+t0Fpa0HH5Plr0zYvVyD2UdCcI1SM/gSsk9cIs3wZxO6jriWsAqCALg4c1vGoGOVYtxn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iS0xP6W1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73949C4CEEB;
	Mon,  4 Aug 2025 00:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267081;
	bh=5+VGatyAyn0VYzmKC+9QVp6Me0hrtlbLXliosSpLPOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iS0xP6W1g43KXUf14c3WvFumDmPiTua0xZeqqO+RkwLcZWasJ2FLk78sOK5FLBkmy
	 Z4in6VYxfzz3mt4j6cV9PrQvqEOFMSVoIBBMFwxo1dmdMsbIS8dHRcr8hzvmh4t1ez
	 L9TwAlFUtrr/OMH6TXBhVdv5i1PgoQd6nwYi5HKgsa3Wtqm53jttoj0jF/gHIL8tWQ
	 e/DT76G0Q82Bq/cny2OciUNbIkNnQAaZFPRVqwoyYyZUzEVd7psD9CN2w+XXmdwQaI
	 H2+iwjjREGDaJZ/QWFlupNxug6MaOdBuek/w+P6xIlW/JQ8ToxvgZVd3IpUS5TnFoN
	 93HxSqLidEwCw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Xi Ruoyao <xry111@xry111.site>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	zhuyinbo@loongson.cn,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16 19/85] gpio: loongson-64bit: Extend GPIO irq support
Date: Sun,  3 Aug 2025 20:22:28 -0400
Message-Id: <20250804002335.3613254-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804002335.3613254-1-sashal@kernel.org>
References: <20250804002335.3613254-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Binbin Zhou <zhoubinbin@loongson.cn>

[ Upstream commit 27cb8f702eb789f97f7a8bd5a91d76c65a937b2f ]

Add the interrupt enable register offset (inten_offset) so that GPIO
interrupts can be enabled normally on more models.

According to the latest interface specifications, the definition of GPIO
interrupts in ACPI is similar to that in FDT. The GPIO interrupts are
listed one by one according to the GPIO number, and the corresponding
interrupt number can be obtained directly through the GPIO number
specified by the consumer.

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Link: https://lore.kernel.org/r/20250714064542.2276247-1-zhoubinbin@loongson.cn
[Bartosz: tweaked the commit message]
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit is suitable for backporting to stable kernel trees for the
following reasons:

1. **Fixes a bug affecting users**: The commit addresses a functional
   issue where GPIO interrupts cannot be enabled properly on several
   Loongson models (ls2k2000, ls3a5000, ls7a, ls7a2000). Looking at the
   code in `loongson_gpio_to_irq()` (lines 120-136), the function relies
   on `chip_data->inten_offset` being set to properly enable interrupts.
   Without this offset, the conditional check at line 167 (`if
   (lgpio->chip_data->inten_offset)`) prevents the `to_irq` callback
   from being registered, effectively breaking GPIO interrupt
   functionality.

2. **Small and contained fix**: The changes are minimal - only adding
   the missing `inten_offset` values to existing chip data structures.
   The patch adds 4 lines:
   - Line 225: `.inten_offset = 0x14,` for ls2k2000_data0
   - Line 233: `.inten_offset = 0x30,` for ls2k2000_data1
   - Line 249: `.inten_offset = 0x14,` for ls3a5000_data
   - Line 257: `.inten_offset = 0xb00,` for ls7a_data
   - Line 266: `.inten_offset = 0xb00,` for ls7a2000_data0
   - Line 284: `.inten_offset = 0x14,` for ls3a6000_data

3. **No architectural changes**: This is a simple data fix that adds
   missing hardware register offsets. It doesn't change any logic, APIs,
   or introduce new features.

4. **Low regression risk**: The change only affects the specific
   Loongson models mentioned and only enables functionality that was
   previously broken. It cannot break existing working configurations
   since it only adds missing data.

5. **Hardware enablement fix**: This is essentially a hardware
   enablement bug fix that allows proper interrupt handling on affected
   Loongson platforms. Without this fix, GPIO interrupts are completely
   non-functional on these chips.

The commit follows stable tree rules by being a clear bug fix with
minimal changes and low risk. The fact that other similar chip data
structures already had `inten_offset` defined (like ls2k_data,
ls2k0500_data0/1) shows this was an oversight that needed correction.

 drivers/gpio/gpio-loongson-64bit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 70a01c5b8ad1..add09971d26a 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -222,6 +222,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data0 = {
 	.conf_offset = 0x0,
 	.in_offset = 0xc,
 	.out_offset = 0x8,
+	.inten_offset = 0x14,
 };
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data1 = {
@@ -230,6 +231,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data1 = {
 	.conf_offset = 0x0,
 	.in_offset = 0x20,
 	.out_offset = 0x10,
+	.inten_offset = 0x30,
 };
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data2 = {
@@ -246,6 +248,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls3a5000_data = {
 	.conf_offset = 0x0,
 	.in_offset = 0xc,
 	.out_offset = 0x8,
+	.inten_offset = 0x14,
 };
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls7a_data = {
@@ -254,6 +257,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls7a_data = {
 	.conf_offset = 0x800,
 	.in_offset = 0xa00,
 	.out_offset = 0x900,
+	.inten_offset = 0xb00,
 };
 
 /* LS7A2000 chipset GPIO */
@@ -263,6 +267,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data0 = {
 	.conf_offset = 0x800,
 	.in_offset = 0xa00,
 	.out_offset = 0x900,
+	.inten_offset = 0xb00,
 };
 
 /* LS7A2000 ACPI GPIO */
@@ -281,6 +286,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls3a6000_data = {
 	.conf_offset = 0x0,
 	.in_offset = 0xc,
 	.out_offset = 0x8,
+	.inten_offset = 0x14,
 };
 
 static const struct of_device_id loongson_gpio_of_match[] = {
-- 
2.39.5


