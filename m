Return-Path: <linux-gpio+bounces-16894-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A9A4B87A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 08:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0764A16B0C4
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 07:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523451EB5E9;
	Mon,  3 Mar 2025 07:46:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7EE8635F;
	Mon,  3 Mar 2025 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740987980; cv=none; b=jNE6s4VIMKa0RsaP5vr+x3LNgmQqYS16gAhnmHbKIgzDMZ15PacZI96KzPVSy43sMPqqc7uLU/93kaF7xjfXFBjWDHcaF4KUbBgKEl9y5J2BvHWycrE1AvG7jZhrjfZ2X2m02VS/SgKW4rVlSr5u7yiVulpwYmgwij5flo8Va7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740987980; c=relaxed/simple;
	bh=CTzO7nF7xfmQcpvoc6skrV90V4g3AmOOowAVoX4BtOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtbFu0VoQCqhfup1NxyJ3iB04FXlINtvAqF1yCtRE9bBtlRfsC5KQSVvO0/s13z2+gZt2NL5pFY3UUuB7BO4sj2YBS39yECfvfuoLWASsE5QvPZvRVjjic/glYULD893bfS4ANl8Yz1P+bm45QaHS4SfZ9cMew/bj008YA/ZC0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.156])
	by gateway (Coremail) with SMTP id _____8Bx32s_XsVnrvmIAA--.37870S3;
	Mon, 03 Mar 2025 15:46:07 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.156])
	by front1 (Coremail) with SMTP id qMiowMAxzMQ7XsVn1GEzAA--.57437S3;
	Mon, 03 Mar 2025 15:46:07 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 2/2] gpio: loongson-64bit: Add more gpio chip support
Date: Mon,  3 Mar 2025 15:45:52 +0800
Message-ID: <20250303074552.3335186-2-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxzMQ7XsVn1GEzAA--.57437S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF45Xw1kAr1rCF45CFWkZrc_yoW5Gr47pF
	ZIvw1FgF4SqF4akF9xXFZrAF13A3yftrZFka12k3s3KrWqgw1DXFWIyFy5WwsFyryUAF43
	XrWfWFW7W3WDCrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jzc_-UUUUU=

The Loongson-7A2000 and Loongson-3A6000 share the same gpio chip model.
Just add them through driver_data.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/gpio/gpio-loongson-64bit.c | 51 ++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index f000cc0356c7..a9a93036f08f 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -254,6 +254,33 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls7a_data = {
 	.out_offset = 0x900,
 };
 
+/* LS7A2000 chipset GPIO */
+static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data0 = {
+	.label = "ls7a2000_gpio",
+	.mode = BYTE_CTRL_MODE,
+	.conf_offset = 0x800,
+	.in_offset = 0xa00,
+	.out_offset = 0x900,
+};
+
+/* LS7A2000 ACPI GPIO */
+static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data1 = {
+	.label = "ls7a2000_gpio",
+	.mode = BYTE_CTRL_MODE,
+	.conf_offset = 0x4,
+	.in_offset = 0x8,
+	.out_offset = 0x0,
+};
+
+/* Loongson-3A6000 node GPIO */
+static const struct loongson_gpio_chip_data loongson_gpio_ls3a6000_data = {
+	.label = "ls3a6000_gpio",
+	.mode = BIT_CTRL_MODE,
+	.conf_offset = 0x0,
+	.in_offset = 0xc,
+	.out_offset = 0x8,
+};
+
 static const struct of_device_id loongson_gpio_of_match[] = {
 	{
 		.compatible = "loongson,ls2k-gpio",
@@ -287,6 +314,18 @@ static const struct of_device_id loongson_gpio_of_match[] = {
 		.compatible = "loongson,ls7a-gpio",
 		.data = &loongson_gpio_ls7a_data,
 	},
+	{
+		.compatible = "loongson,ls7a2000-gpio1",
+		.data = &loongson_gpio_ls7a2000_data0,
+	},
+	{
+		.compatible = "loongson,ls7a2000-gpio2",
+		.data = &loongson_gpio_ls7a2000_data1,
+	},
+	{
+		.compatible = "loongson,ls3a6000-gpio",
+		.data = &loongson_gpio_ls3a6000_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, loongson_gpio_of_match);
@@ -312,6 +351,18 @@ static const struct acpi_device_id loongson_gpio_acpi_match[] = {
 		.id = "LOON000C",
 		.driver_data = (kernel_ulong_t)&loongson_gpio_ls2k2000_data2,
 	},
+	{
+		.id = "LOON000D",
+		.driver_data = (kernel_ulong_t)&loongson_gpio_ls7a2000_data0,
+	},
+	{
+		.id = "LOON000E",
+		.driver_data = (kernel_ulong_t)&loongson_gpio_ls7a2000_data1,
+	},
+	{
+		.id = "LOON000F",
+		.driver_data = (kernel_ulong_t)&loongson_gpio_ls3a6000_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, loongson_gpio_acpi_match);
-- 
2.47.1


