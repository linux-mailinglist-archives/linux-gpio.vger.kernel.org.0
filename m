Return-Path: <linux-gpio+bounces-26674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED1BACC2A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 14:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEAF2481745
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 12:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0952F8BC9;
	Tue, 30 Sep 2025 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I9f+TLtR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAF42F7AC3
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759233790; cv=none; b=IAMKUTfZ6Q7LUPQbJUJbIrNPZh9FOBbyn4nig7eetU2x6th7sCXLOhctc/R1KeCpmIhGXkXlRO0QLENpXjcVTy4ZYrrHzNdFBUYXBWfGHjyudjuMxthhk+ZQToSOSpSny/y8FvkgpI6K8+C91MZAahbuNr8/tbipf2l2FaN2rzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759233790; c=relaxed/simple;
	bh=gjUmwu6vW87dgYR6ByqBRk3LF8SFvjZ1PcrYhs2yofE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSsT8Ky0FIf2ERaG/o4/0jkv6ckj8BqxImzkmn68IfoHMbTmXtMfYhj6gYnaxwd7sHkHU1sB9OM7oBjTTpv+iT9kUwm/eKTjHNT3ETbs0JXrNuF1fNYseS8iRTvNN3MUMtMXLmrdngQjl2ZUsLXQgP4UzU3Oify6faWBNj5gzb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I9f+TLtR; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-86420079b01so362992285a.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 05:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759233788; x=1759838588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDggfI4p5TeOGtAQWJj+T8vsugydYvOM8pqJ4uwjX+o=;
        b=I9f+TLtR01Gzkrte9Sywg0e8eUjYIK27adJJ4uJAXGxQU0xVN6Ka0aSyyTsbZauc65
         1HZq3xItAm8Iw88u+jS1ovgmFDyTJkUIfw89KqBSHzGffDMX2mE4U/y/0l3P3O+hvj8l
         gmB+CTsjyUxagrgS+8FlYF3nSWNXlr7nWf864bjRblymGLg/Ms5vU9a6CUXFOUnsN4cq
         3Yo1F69lrg7rwBzqjgTtnmjgxYJdPgRIa04T6PyoQdVxqjQrKDVjFmac8NMgcr/4V2ax
         CTyjtoJooI3LVV5eSj2vehGv3We4dJmwjEd5rm5l8IV72Hnf9epkqErkIEReK6b/ja1Y
         GocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759233788; x=1759838588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDggfI4p5TeOGtAQWJj+T8vsugydYvOM8pqJ4uwjX+o=;
        b=v3jCcrqna4BDMYTv/NWNNOtUqkpU9+zP7Ly/Iq5txBSn5ubGq41Cgk8FBz2ptGbw9a
         CQEUpKVMRMXsCBrQ6MSHKQkumj2FkRWGCXb26yZLezxz0yDWgdYdn6//CwlGWwfOgzIg
         zY+kkRym7NlEVgRVoJpNN9ix+rU/R3u0QbtrlkxxLzIZCVdUA0dilqZQrLotkI64GGEx
         ykMHPZqDbvNC/wfCGHtj+RhAeSEEsi+HT8GiwAiB690qXTlq2RueXym3lRSwCNsYk4kW
         kLcHRXwdGtf7/fDm3AaTxmbR/Z8yyh2RLPyh6MLf8FXAJdi6L358MW2wHUjP70P9KgjM
         7ltQ==
X-Gm-Message-State: AOJu0YwPJeUDsmLHr71rMM2Lp2qzR9RkjxvRlfSDHgRoWDJDtO7Rhwo+
	UlAaEVL52ivq9wmmQqiXAD1AARo5fPcKtVOIf3YZDL7MBGUy7r07LXyDHb6/w9HOQGI=
X-Gm-Gg: ASbGncsNQHw823ByvYmHD4WYqUXZ1V0MMvAxRpTh6vz8/zJsvffuQ8Up7wQUzuAhqR2
	z7hemNIqCLcTV8FgMfiMSZ7lygjMQHePZiD3helmj5BD6Kn578hscJpWMNLh6/YIeqBPox/DZMj
	Yb/Cb73UULWPiI1bnChrfQfeDzoULHTZz7JG+5aPkAXyZ+3IbgW+A675E8Ntjp9CpEVANBvo2sP
	+HAbXxucSKacBjCiBbLnmFp46kLJqyJtWzJjJLApJfrMCV2pAi5LZwpE4mNNTUzRMre9daHOONx
	MNrMIhqXW85eyydI/AeadAI9JiNfNWQCZ+fNrZLUkcqyAkYd+dI9ZZppVmsJkmzeMITMaIkXGZx
	twl3+1F5PpiZXgOt1FIt1iNR8WlqZo+j7mAsYEh49Vx3nZh6hcaq2uQ5borAbosr85PZe
X-Google-Smtp-Source: AGHT+IFZLhst3yxVYryNrmKUu3Gz+c+9FXYpGGOJ5oz94eu4lad9gvqUMOOebdBdhsa5WFINToy3xA==
X-Received: by 2002:a05:620a:45a9:b0:864:7f5d:3fc4 with SMTP id af79cd13be357-8647f5d41fbmr1761803285a.49.1759233787722;
        Tue, 30 Sep 2025 05:03:07 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c306b5f64sm1020160885a.32.2025.09.30.05.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:03:07 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 14:02:49 +0200
Subject: [PATCH 2/6] pinctrl: bcm: bcmbca: Parameterize pins, groups, funcs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-bcmbca-pinctrl-v1-2-73218459a094@linaro.org>
References: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
In-Reply-To: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This will make all pins, groups and functions depend of data
associated with the compatible string that is matched on
probe.

This makes it possible to add support for other BCMBCA SoC:s
than BCM4908.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcmbca.c | 67 +++++++++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcmbca.c b/drivers/pinctrl/bcm/pinctrl-bcmbca.c
index 834241103b5452836aea9fe817f7e5d143893985..5a18a5fadd94ddb5f237f2dca560f1d4b8186dad 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcmbca.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcmbca.c
@@ -9,6 +9,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/string_helpers.h>
 
@@ -24,6 +25,26 @@
 #define BCMBCA_TEST_PORT_COMMAND			0x0c
 #define  BCMBCA_TEST_PORT_CMD_LOAD_MUX_REG		0x00000021
 
+struct bcmbca_pinctrl_grp {
+	const char *name;
+	const struct bcmbca_pinctrl_pin_setup *pins;
+	const unsigned int num_pins;
+};
+
+struct bcmbca_pinctrl_function {
+	const char *name;
+	const char * const *groups;
+	const unsigned int num_groups;
+};
+
+struct bcmbca_soc_info {
+	unsigned int num_pins;
+	const struct bcmbca_pinctrl_grp *groups;
+	unsigned int num_groups;
+	const struct bcmbca_pinctrl_function *functions;
+	unsigned int num_functions;
+};
+
 struct bcmbca_pinctrl {
 	struct device *dev;
 	void __iomem *base;
@@ -249,12 +270,6 @@ static const struct bcmbca_pinctrl_pin_setup usb1_pwr_pins[] = {
 	{ 67, 0 },
 };
 
-struct bcmbca_pinctrl_grp {
-	const char *name;
-	const struct bcmbca_pinctrl_pin_setup *pins;
-	const unsigned int num_pins;
-};
-
 static const struct bcmbca_pinctrl_grp bcm4908_pinctrl_grps[] = {
 	{ "led_0_grp_a", led_0_pins_a, ARRAY_SIZE(led_0_pins_a) },
 	{ "led_1_grp_a", led_1_pins_a, ARRAY_SIZE(led_1_pins_a) },
@@ -308,12 +323,6 @@ static const struct bcmbca_pinctrl_grp bcm4908_pinctrl_grps[] = {
  * Functions
  */
 
-struct bcmbca_pinctrl_function {
-	const char *name;
-	const char * const *groups;
-	const unsigned int num_groups;
-};
-
 static const char * const led_0_groups[] = { "led_0_grp_a" };
 static const char * const led_1_groups[] = { "led_1_grp_a" };
 static const char * const led_2_groups[] = { "led_2_grp_a" };
@@ -462,13 +471,25 @@ static const struct pinctrl_desc bcmbca_pinctrl_desc = {
 	.pmxops = &bcmbca_pinctrl_pmxops,
 };
 
+static const struct bcmbca_soc_info bcm4908_pinctrl_soc_info = {
+	.num_pins = BCM4908_NUM_PINS,
+	.groups = bcm4908_pinctrl_grps,
+	.num_groups = ARRAY_SIZE(bcm4908_pinctrl_grps),
+	.functions = bcm4908_pinctrl_functions,
+	.num_functions = ARRAY_SIZE(bcm4908_pinctrl_functions),
+};
+
 static const struct of_device_id bcmbca_pinctrl_of_match_table[] = {
-	{ .compatible = "brcm,bcm4908-pinctrl", },
+	{
+		.compatible = "brcm,bcm4908-pinctrl",
+		.data = &bcm4908_pinctrl_soc_info,
+	},
 	{ }
 };
 
 static int bcmbca_pinctrl_probe(struct platform_device *pdev)
 {
+	const struct bcmbca_soc_info *info;
 	struct device *dev = &pdev->dev;
 	struct bcmbca_pinctrl *bcmbca_pinctrl;
 	struct pinctrl_desc *pctldesc;
@@ -476,6 +497,10 @@ static int bcmbca_pinctrl_probe(struct platform_device *pdev)
 	char **pin_names;
 	int i;
 
+	info = device_get_match_data(dev);
+	if (!info)
+		return dev_err_probe(dev, -EINVAL, "No match data\n");
+
 	bcmbca_pinctrl = devm_kzalloc(dev, sizeof(*bcmbca_pinctrl), GFP_KERNEL);
 	if (!bcmbca_pinctrl)
 		return -ENOMEM;
@@ -496,19 +521,19 @@ static int bcmbca_pinctrl_probe(struct platform_device *pdev)
 
 	/* Set pinctrl properties */
 
-	pin_names = devm_kasprintf_strarray(dev, "pin", BCM4908_NUM_PINS);
+	pin_names = devm_kasprintf_strarray(dev, "pin", info->num_pins);
 	if (IS_ERR(pin_names))
 		return PTR_ERR(pin_names);
 
-	pins = devm_kcalloc(dev, BCM4908_NUM_PINS, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(dev, info->num_pins, sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
-	for (i = 0; i < BCM4908_NUM_PINS; i++) {
+	for (i = 0; i < info->num_pins; i++) {
 		pins[i].number = i;
 		pins[i].name = pin_names[i];
 	}
 	pctldesc->pins = pins;
-	pctldesc->npins = BCM4908_NUM_PINS;
+	pctldesc->npins = info->num_pins;
 
 	/* Register */
 
@@ -519,8 +544,8 @@ static int bcmbca_pinctrl_probe(struct platform_device *pdev)
 
 	/* Groups */
 
-	for (i = 0; i < ARRAY_SIZE(bcm4908_pinctrl_grps); i++) {
-		const struct bcmbca_pinctrl_grp *group = &bcm4908_pinctrl_grps[i];
+	for (i = 0; i < info->num_groups; i++) {
+		const struct bcmbca_pinctrl_grp *group = &info->groups[i];
 		int *pins;
 		int j;
 
@@ -536,8 +561,8 @@ static int bcmbca_pinctrl_probe(struct platform_device *pdev)
 
 	/* Functions */
 
-	for (i = 0; i < ARRAY_SIZE(bcm4908_pinctrl_functions); i++) {
-		const struct bcmbca_pinctrl_function *function = &bcm4908_pinctrl_functions[i];
+	for (i = 0; i < info->num_functions; i++) {
+		const struct bcmbca_pinctrl_function *function = &info->functions[i];
 
 		pinmux_generic_add_function(bcmbca_pinctrl->pctldev,
 					    function->name,

-- 
2.51.0


