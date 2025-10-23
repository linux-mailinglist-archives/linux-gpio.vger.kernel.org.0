Return-Path: <linux-gpio+bounces-27513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CFBC00153
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 11:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 314833A555D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 09:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BC32FC00F;
	Thu, 23 Oct 2025 09:04:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4482F9D89
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 09:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210243; cv=none; b=MOWl7AC0sCp+t9GmTz3rfUqhtcN2FLpA/tbL//eqNBgDkkNGKtJZCPSdMwcEu3+MfGpjRScnXsNTbJ7+w/yY8Q8SZmnI8kJBL7EzVrRDy+xSCfJtDnURuKlYOND48xqqmuWLIl/G2GNCG302dZVKM6OHaCV/4OgVgi5EW/RYvYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210243; c=relaxed/simple;
	bh=PFkHdeqKWBWNHtX7ClfEdNao8WapB20TpcHP9aN05os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPk5aJDbXbYESMPGhuj2GGqoFY5/3t09xWbVthKpaV+J1C6mPDgdcqyfhKotiHRDR7Krg0fTot3sCY3ukI1Nk2azfLh8EbTMLIiJwtCZJIB7pLrDgHdragAuP7cMAEd68YEn3Her+3xFVCWuwUle+0EQtVcmMGVMXfPyBV6Z3Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8DxLvB+7_lo9K4ZAA--.55303S3;
	Thu, 23 Oct 2025 17:03:58 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJCxocJ77_loER4DAQ--.41176S2;
	Thu, 23 Oct 2025 17:03:56 +0800 (CST)
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
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: [PATCH] gpio: loongson-64bit: Switch to dynamic allocate GPIO base in byte mode
Date: Thu, 23 Oct 2025 17:03:46 +0800
Message-ID: <20251023090346.1995894-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxocJ77_loER4DAQ--.41176S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEECGj5w5EEYQAAsp
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jr1rZw4UtFyUXF4rCF4rZwc_yoWkGwc_uF
	1IvF4rJryUAFnFva43Za4SkryIvr4ku3WFkFnIq393Xas0qwn8uryUur13Wry7Zr15Zryr
	u3y8uryxAr1fGosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbVkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1l
	Yx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWU
	AwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI
	43ZEXa7IU8q2NtUUUUU==

gpiolib want to get completely rid of static gpiobase allocation, so
switch to dynamic allocate GPIO base in byte mode, also can avoid
warning message:

[1.529974] gpio gpiochip0: Static allocation of GPIO base is deprecated,
use dynamic allocation.

Reported-by: Hongliang Wang <wanghongliang@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/gpio/gpio-loongson-64bit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 02f181cb219e..d4e291b275f0 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -312,6 +312,7 @@ static int loongson_gpio_init(struct platform_device *pdev, struct loongson_gpio
 		lgpio->chip.gc.direction_output = loongson_gpio_direction_output;
 		lgpio->chip.gc.set = loongson_gpio_set;
 		lgpio->chip.gc.parent = &pdev->dev;
+		lgpio->chip.gc.base = -1;
 		spin_lock_init(&lgpio->lock);
 	}
 

base-commit: d5376026f9269601e239545e2ec4aea0cc62bf2a
-- 
2.47.3


