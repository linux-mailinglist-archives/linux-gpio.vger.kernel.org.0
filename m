Return-Path: <linux-gpio+bounces-21164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A95AD356D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 13:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 515973B5BC3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 11:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CAD22CBFC;
	Tue, 10 Jun 2025 11:59:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D68622B8CC;
	Tue, 10 Jun 2025 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556785; cv=none; b=AFXUjUg5astdHlrctAgAEEKF/QHwGNzs+bcDy0HARltEqvGb6OWFfYZUrWcVZXt07hQeJa8tHwMl3f6tmse6nL+fOMoq5qz2CpbYzECCmeBDhzkMksmJUXNcfjISmIj+aWX7fgIKz3OJEPdZX4CqQFJowjUwFbwf53q+qMOqq7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556785; c=relaxed/simple;
	bh=MktQiHfELBx4PHWTInsfVDuNoRGhpjiHqP2Lv3lIPOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mNov2FsBf9o2IHWG/1AqsO86mFAqgIiP68PgF5rJkKnI0Q9h7FygtfztCGIJ4Z4DpmGcvkphxLdGFvPwJWbwij7X0+2xnJRqfcl0trGpmR6A6R1jfvfRp9jk1v2xYIeYkHc34Ga9veko/fLO8BRmHT/nLiFYI8E97B1ae8ARenw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8AxDGsrHkhoWacSAQ--.46071S3;
	Tue, 10 Jun 2025 19:59:39 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMCxPscoHkhoUFUUAQ--.64953S2;
	Tue, 10 Jun 2025 19:59:38 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: loongson-64bit: Correct Loongson-7A2000 ACPI GPIO access mode
Date: Tue, 10 Jun 2025 19:59:26 +0800
Message-ID: <20250610115926.347845-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxPscoHkhoUFUUAQ--.64953S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWruw48WFykCrWDXFW5CryUurX_yoWkXFc_uF
	1ftrW8JrW5ZFnFvw13u3WIkryIv3y7u3ZakFn2qayYq3s8twn8ur9rurySkF9rXry7urnx
	Wa4kCFySvw4xWosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb4xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1l
	Yx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jrpnQUUUUU=

According to the description of the Loongson-7A2000 ACPI GPIO register in
the manual, its access mode should be BIT_CTRL_MODE, otherwise there maybe
some unpredictable behavior.

Cc: stable@vger.kernel.org
Fixes: 44fe79020b91 ("gpio: loongson-64bit: Add more gpio chip support")
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/gpio/gpio-loongson-64bit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 26227669f026..70a01c5b8ad1 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -268,7 +268,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data0 = {
 /* LS7A2000 ACPI GPIO */
 static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data1 = {
 	.label = "ls7a2000_gpio",
-	.mode = BYTE_CTRL_MODE,
+	.mode = BIT_CTRL_MODE,
 	.conf_offset = 0x4,
 	.in_offset = 0x8,
 	.out_offset = 0x0,

base-commit: e0d4a0f1d066f14522049e827107a577444d9183
-- 
2.47.1


