Return-Path: <linux-gpio+bounces-23202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 647CFB03758
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 08:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A22661773A0
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 06:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC0C20468D;
	Mon, 14 Jul 2025 06:46:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEDC1F3FC6
	for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 06:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752475561; cv=none; b=dC8eIuu5wj2WFodh5CsQrmKqWaC2lpdS8PzY7W1xxgnhwlT2g0R0T0+T5ThwIEhh0I8sYdMyZQ4WI+1W8QLAZSnEM/g7//Rp/urJfRHeVb0DPNZweAIPIvlfclL8XfjzzNcJqVLLTb0kwe92GBpKnR4cyxGEIrwLRS1yf2BKgiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752475561; c=relaxed/simple;
	bh=2yLBHHfIXcwnrcPUkQ9+ntrLxK2ykujzNXpH5Tv9H9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hf2TnJBPm+9lvKtzNJLrSclqIWLsFGN+PSxhcVSQw9PEw0uzJOTvnx4wubXY8j+W1Ir7ZrHLG0hI7d99uNlbbsB4/DXGCmJ/ym1KVMP6OCipooVf6nhTdpzqnmh8tk4CXMhp5D+l5dLvDezOstjzGUXGbSgDon+6zsCNs+EZh+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.193])
	by gateway (Coremail) with SMTP id _____8DxbKyjp3RojAspAQ--.20619S3;
	Mon, 14 Jul 2025 14:45:55 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.193])
	by front1 (Coremail) with SMTP id qMiowJCxM+Sfp3RoSXUWAA--.57377S2;
	Mon, 14 Jul 2025 14:45:54 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH] gpio: loongson-64bit: Add loongson gpio irq support
Date: Mon, 14 Jul 2025 14:45:42 +0800
Message-ID: <20250714064542.2276247-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxM+Sfp3RoSXUWAA--.57377S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WrWxtF17AFWxWFWUJw45CFX_yoW5Jry5pF
	ZFvw1Yqr4fJF47u39rZayDAFyUC3s0yrsFkFW2kwn3Jr9xtw1UXFWayFyY9anIyry5AF15
	ZFWFgF47W3WDArcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxU2MKZDUUUU

Add the interrupt enable register offset (inten_offset) so that GPIO
interrupts can be enabled normally.

According to the latest interface specifications, the definition of GPIO
interrupts in ACPI is similar to that in FDT. The GPIO interrupts are
listed one by one according to the GPIO number, and the corresponding
interrupt number can be obtained directly through the GPIO number
specified by the consumer.

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/gpio/gpio-loongson-64bit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 26227669f026..d5b2ad848519 100644
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

base-commit: e502df58b5e3767c00e887744b6eff43b7fde3ea
-- 
2.47.1


