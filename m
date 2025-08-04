Return-Path: <linux-gpio+bounces-23980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D295B197A1
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 02:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 082773AFAD7
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 00:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5631CEAA3;
	Mon,  4 Aug 2025 00:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaGuOsZT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C331C84DC;
	Mon,  4 Aug 2025 00:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754267322; cv=none; b=ZkB1HBld2hpH0Op1qJnzhrK0e7Su6hFSKP2Eeufuj3Z8g9rzDAPfm0LSMfB+eLuNOkZpTA4M2h//vrjh+LnZkrQ1G1n9X4/PJ/e2H6akAzzZRkkWZ3TBvMqQXVHH8lzjswqqOw44WuUYdIHcFHDWkLt9+Nm2EDtgQUS/aWQ0iJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754267322; c=relaxed/simple;
	bh=7EJg3bg9n5DVKr0bsLvdBBTCfmWZ9fbgpLBrM8HOSIg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b3ufBnHrVYen6ywMsmIJlmaq/MXyIUnMfL5Pxx/PExiMAWL5YmjWq/5tRyZxGguzl5RE/Jx27FsTkPcb2K/qKaS6DQKGOHh6RQQ5O/j9lqUM8pyNfy2VXKqbdL8vGX5giljtMXcFe/s+z5QBHEyH8vL+gzEUDc1NPpaA1BE6XBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaGuOsZT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6096FC4CEF8;
	Mon,  4 Aug 2025 00:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267322;
	bh=7EJg3bg9n5DVKr0bsLvdBBTCfmWZ9fbgpLBrM8HOSIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YaGuOsZTW9AU6WlK6DVBplLOYtw42OpHtnPNRQKfpv77GZtL0rtji6E9JO3RGPu5u
	 28pVc4vrCynz2RsSoqbarDl7qlkVh0cSCXMtaK/uxEjkhu2kKitwxEn1eIF2YXAKpD
	 4sfB2o9aJfJ4EWLnXyraRHEajz887yzmkNMgFvtHZfwNtmj0YuKsDwEYpfdbFr7oSr
	 TahaBszUzlvHea0MF0mXFzT4MJmZuUq34DviDeevVVa4tewE+jeSx3QBlDxxNvaFvq
	 2brOh0iBSOwpHKURLG3qpKtczvhiI2SP4DkmgksHiKRNY6pLcz6IBA/vTNfITpfd83
	 qHcC6lIE5PuBw==
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
Subject: [PATCH AUTOSEL 6.15 18/80] gpio: loongson-64bit: Extend GPIO irq support
Date: Sun,  3 Aug 2025 20:26:45 -0400
Message-Id: <20250804002747.3617039-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804002747.3617039-1-sashal@kernel.org>
References: <20250804002747.3617039-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15.9
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
index 286a3876ed0c..fd8686d8583a 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -220,6 +220,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data0 = {
 	.conf_offset = 0x0,
 	.in_offset = 0xc,
 	.out_offset = 0x8,
+	.inten_offset = 0x14,
 };
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data1 = {
@@ -228,6 +229,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data1 = {
 	.conf_offset = 0x0,
 	.in_offset = 0x20,
 	.out_offset = 0x10,
+	.inten_offset = 0x30,
 };
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data2 = {
@@ -244,6 +246,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls3a5000_data = {
 	.conf_offset = 0x0,
 	.in_offset = 0xc,
 	.out_offset = 0x8,
+	.inten_offset = 0x14,
 };
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls7a_data = {
@@ -252,6 +255,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls7a_data = {
 	.conf_offset = 0x800,
 	.in_offset = 0xa00,
 	.out_offset = 0x900,
+	.inten_offset = 0xb00,
 };
 
 /* LS7A2000 chipset GPIO */
@@ -261,6 +265,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data0 = {
 	.conf_offset = 0x800,
 	.in_offset = 0xa00,
 	.out_offset = 0x900,
+	.inten_offset = 0xb00,
 };
 
 /* LS7A2000 ACPI GPIO */
@@ -279,6 +284,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls3a6000_data = {
 	.conf_offset = 0x0,
 	.in_offset = 0xc,
 	.out_offset = 0x8,
+	.inten_offset = 0x14,
 };
 
 static const struct of_device_id loongson_gpio_of_match[] = {
-- 
2.39.5


