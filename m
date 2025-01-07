Return-Path: <linux-gpio+bounces-14557-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEDEA03CAA
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 11:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AABF7A307A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 10:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B841E5726;
	Tue,  7 Jan 2025 10:39:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D5E1E9B39;
	Tue,  7 Jan 2025 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246362; cv=none; b=jlPxWLE9WFbgOa0g8jSr+g/qi8xaA87CpUcs4J1XI30XucrnqgbxFZGWp54rn/pJqODY4waTR3W9sZx0o+pbGCnzOI0v74VXbb7Uo9hWaJsbxA2wC+cvh5Fskun5NsxWmvsNLwYVGe+PiatUYeqFDODTDNLFtzch6K8Z9bTXVd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246362; c=relaxed/simple;
	bh=LEocVp7Sn0lF5nlR2i78xyP4ZP0H/jxp/rTifcxwcHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BG26jv20JzEnTgbQrMHDaFeAp2GbSnbzvaocmW06TvBB9gjn/EkgvThY/Qzd0WVfugxm2Pg2R7XTNjv1LFxQ1gaxMTexsGXth7CoiZb+EyTBoWKIC7Kv7zHPGObwbEB+OmBInF9O75tYu5fGuUgRy83XAewymJ3WCS/gzj541wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8CxC+JNBH1nGDFfAA--.55676S3;
	Tue, 07 Jan 2025 18:39:09 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMDxfcdLBH1n0PIXAA--.37103S2;
	Tue, 07 Jan 2025 18:39:08 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-gpio@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	stable@vger.kernel.org,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: [PATCH] gpio: loongson: Fix Loongson-2K2000 ACPI GPIO register offset
Date: Tue,  7 Jan 2025 18:38:56 +0800
Message-ID: <20250107103856.1037222-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxfcdLBH1n0PIXAA--.37103S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFWUCw48GFW8Xw17GFWrtFc_yoW8Xw4fp3
	y3ua4rKr15JF17C39xZF9rAay8uas0yFZFgF42k3s3XF9Ivw1qqrW5AF909a17AryrAFy5
	XrWfKFW7ua1DCrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxU4s2-UUUUU

Since commit 3feb70a61740 ("gpio: loongson: add more gpio chip
support"), the Loongson-2K2000 GPIO is supported.

However, according to the firmware development specification, the
Loongson-2K2000 ACPI GPIO register offsets in the driver do not match
the register base addresses in the firmware, resulting in the registers
not being accessed properly.

Now, we fix it to ensure the GPIO function works properly.

Cc: stable@vger.kernel.org
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>
Fixes: 3feb70a61740 ("gpio: loongson: add more gpio chip support")
Co-developed-by: Hongliang Wang <wanghongliang@loongson.cn>
Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/gpio/gpio-loongson-64bit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 6749d4dd6d64..7f4d78fd800e 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -237,9 +237,9 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data1 = {
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data2 = {
 	.label = "ls2k2000_gpio",
 	.mode = BIT_CTRL_MODE,
-	.conf_offset = 0x84,
-	.in_offset = 0x88,
-	.out_offset = 0x80,
+	.conf_offset = 0x4,
+	.in_offset = 0x8,
+	.out_offset = 0x0,
 };
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls3a5000_data = {
-- 
2.43.5


