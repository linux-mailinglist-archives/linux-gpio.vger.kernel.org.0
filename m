Return-Path: <linux-gpio+bounces-22058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E610BAE6633
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 15:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C977117A3E8
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 13:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113DE2C325E;
	Tue, 24 Jun 2025 13:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G6sPCliT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CDC2C158D
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771170; cv=none; b=tHlKSxuEMcT9c3G+9eJudPs4lOnf+ixeI39Dpkm062YO4N9laCycG/rUfYDGdiVcQ4Qk248Pr5rVrjWrd+XB6SYCpb85YUnYzdR2UnNve+1NuA12xciGW0GGIasvwmxTzjUdALTxt6KrvqePYoH39rxfQQ8olZkwzegfJAfohLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771170; c=relaxed/simple;
	bh=RY0c8fBXynewvdGV8o0rvkfKQ04xXx5tv1lKWTRku80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hA4RkJ9M23se9BaiF9KAK0Py1z2/Mv8HVersTXm/lGxJUfGGC5zdWWZJjzg6U5Icloy/Wsi/FdQ56UpWUmA6rFG3kDkcq0zt3JZfb7LVRWmXP0aZYszeeTqlEqrxcERPyB2PwA5oGD5QYJ+x1wtPcvg7g5uzEobVITfGeEOzSDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G6sPCliT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so349595f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771166; x=1751375966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pd8kBKpFzE1gkS+2PaBdjUJKosglaITysg11GB8BGwg=;
        b=G6sPCliT8S57CfjE5Gm9+qItnfKqvtR0z6B1JfVJ8YWfwlPHXFbIGtudhGVi0TJQ3P
         SMIp6j+bGnaMngbFCXdw7BrctkyYkIg1aUKEvK3bn66mEWcaJSVjm5wlqywC/WrtzcnJ
         yASQf9VZ0Tf9xAGogJkjQD44zGBH5R2qVG7qDI3jkh5xQESYvtqe9MMzLkZurhPapyWq
         AYP7Wfr/KbscxWhNWJ2ntFHISsBRPEU/b/4xy+zRPY4+855H8MTqIEsglpfsspslEPeC
         Q030ZojbRVNDrUFlm4fdPXjcIaTHFCJKZ7DQExJtq88zchXkKrg81BAVAK0lRrqdN2oA
         s+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771166; x=1751375966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pd8kBKpFzE1gkS+2PaBdjUJKosglaITysg11GB8BGwg=;
        b=viu2uvr0bsncb5K1nbvKuj443WhJB/f0jtkNwhZ1+a0+n90dNv397s66s2vtRuqWD/
         RQX2BGgrw+hsL+gFH6gtuKnDuSXK8RTsvxHxNzjy61HbyWeJ5q08rkWlQEkqmGb5C/76
         7a+UZl2wSyhHZi4m51LBu2ladbdaTfaHtxhCRG39oXE3VYhQNgD9k4K2k7sJXFm6NqYB
         hV4qZas46IYbsBV9vTyjioRzzCU/OSCgT161xuh9GYo7qidquEMlAaWI9acFEEaZNHwq
         BCc0ypvn1NxQTllNzyRmkNje/m6jkiT2DrP287bpPIsyuVU5ztst26+oHA8qo2gBy8fJ
         6GcA==
X-Gm-Message-State: AOJu0Yz3Ohnos2+XZBhASO5cFMZD+PaaR0h9Rg9oQ+ZyGOIAHCgSvNuP
	vopJb6VgO2506lrCP4G7+IN5mXTIN0FL5/5l7MzukQnq0uYvyLXcVjtIxB2zt2EHTOQ=
X-Gm-Gg: ASbGnctkeqaXuTCGY2n3cBLkfsrh1Zhce7lIqwwPBZ9pJSJNG1fJI5uJPu3KgnynzH4
	MrNZ9QOTr5PVkyp+m2LAsC4DqSnDl+aNN2RITk7zO1WWThnUkCdyWjLdnVILSUHeedcHg+aoYnN
	vIKq4MbWJrDyJDpyjb7/35E0y3+1HEoP/IwjqDjp8t1AEbU6CAL7GVfNakeB2jONfqvOyQvQW3K
	4yU6GWkWmqig8l1nRPGvQBqbQ/2L9sV7QPBgNCCI6bvl+M39HCz4R7nNtgTQsOn/LplWLFh573a
	nQXEJUs8RmhhYaPYtccr10U9xYadB5vDGp2e+ZFsXv4WcYPfK51LaKHAHzXuFbKLzg==
X-Google-Smtp-Source: AGHT+IE6Kv/SU+UWtBM7VJQczlIAMoJFCuFxK4Z5BzTohHnuGX8KwrkAv0aXxfyraOvsIUuEerAM8A==
X-Received: by 2002:a5d:5e8e:0:b0:3a4:eeb5:58c0 with SMTP id ffacd0b85a97d-3a6d12c2492mr12092009f8f.20.1750771166160;
        Tue, 24 Jun 2025 06:19:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:14 +0200
Subject: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for
 gpio-mmio
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3347;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Zivpm93wsUA9kJXUprjnSmisj2JfN4trpIukMCYvtOg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXXsIcX49O3O0Vn7qIBdCdKUO4DSQym+RKCh
 2q7Wf2xdICJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql1wAKCRARpy6gFHHX
 cjKpEACamWQvhV5Ftf344+uLwE3eRxLALSIK12mth3MQwWxcNhD5+2Fog/n4/74bdZvd+wIugkI
 MPkGXKOFRazn94C155pgLL42HxmV9PQDqspEJb/vMcUCmLwRwjkg7JF53m4FVg4fw1oFeyQ8gCo
 BTaaNJtJoGr64Wa4hphvdie37PAHwUUiE2OuG8n0P1V3Ljy2lraqmOiGRDmRbyD7fb5G6De1Y0I
 f6QYIauiTXgLGtvfj4rTWmilcZhVqeX/vxE+6Z0fMqWZAJHhA33Q60Yw9yXx6M9OMBM3wlqp5Ai
 So6eClCTIDjrZEkbmyBjHKled6SogXnR5Pustqqof17csbbvSIQNI0GIv52rLjJYibYQ65QQzj1
 pGbsrN7/DdF+TZhDiMvCHXwfEhzVqMINiYYPoNY5m1XQJE2M0ePdqKOkgF8QMeax5mQBDd4f8CH
 7ebb4+GoYOOEiLUrd6fo9uuxxqdOr8x3244rvEgnl0SEEDfw5kAUD/CPWmO/n5qoyaEvwD1dAvo
 Q+4gH11IglIaHC9Icuto5MmtnPzkUG8d48bYxmaZlNWxVh+6UKn6K7L26RNcK2ES1WxJxsHIQl/
 1ACV2sR9s+iW2TSk9n/naUCaR5pzieOlQ9MI1XKZT3iQRdMjssC3cL0bXzvsNmcXFJ4H1CuiYYx
 2NApTH8Cqa311FQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace struct bgpio_pdata - that we plan to remove - with software
nodes containing properties encoding the same values thatr can now be
parsed by gpio-mmio.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index ef03d6cec9ff6927668d051ca459eb1d8ff7269e..fc2daffc4352cca763cefbf6e17bdd5242290198 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/stat.h>
 
@@ -37,22 +38,34 @@
 
 /* The sysreg block is just a random collection of various functions... */
 
-static struct bgpio_pdata vexpress_sysreg_sys_led_pdata = {
-	.label = "sys_led",
-	.base = -1,
-	.ngpio = 8,
+static const struct property_entry vexpress_sysreg_sys_led_props[] = {
+	PROPERTY_ENTRY_STRING("label", "sys_led"),
+	PROPERTY_ENTRY_U32("ngpios", 8),
+	{ }
 };
 
-static struct bgpio_pdata vexpress_sysreg_sys_mci_pdata = {
-	.label = "sys_mci",
-	.base = -1,
-	.ngpio = 2,
+static const struct software_node vexpress_sysreg_sys_led_swnode = {
+	.properties = vexpress_sysreg_sys_led_props,
 };
 
-static struct bgpio_pdata vexpress_sysreg_sys_flash_pdata = {
-	.label = "sys_flash",
-	.base = -1,
-	.ngpio = 1,
+static const struct property_entry vexpress_sysreg_sys_mci_props[] = {
+	PROPERTY_ENTRY_STRING("label", "sys_mci"),
+	PROPERTY_ENTRY_U32("ngpios", 2),
+	{ }
+};
+
+static const struct software_node vexpress_sysreg_sys_mci_swnode = {
+	.properties = vexpress_sysreg_sys_mci_props,
+};
+
+static const struct property_entry vexpress_sysreg_sys_flash_props[] = {
+	PROPERTY_ENTRY_STRING("label", "sys_flash"),
+	PROPERTY_ENTRY_U32("ngpios", 1),
+	{ }
+};
+
+static const struct software_node vexpress_sysreg_sys_flash_swnode = {
+	.properties = vexpress_sysreg_sys_flash_props,
 };
 
 static struct mfd_cell vexpress_sysreg_cells[] = {
@@ -61,22 +74,19 @@ static struct mfd_cell vexpress_sysreg_cells[] = {
 		.of_compatible = "arm,vexpress-sysreg,sys_led",
 		.num_resources = 1,
 		.resources = &DEFINE_RES_MEM_NAMED(SYS_LED, 0x4, "dat"),
-		.platform_data = &vexpress_sysreg_sys_led_pdata,
-		.pdata_size = sizeof(vexpress_sysreg_sys_led_pdata),
+		.swnode = &vexpress_sysreg_sys_led_swnode,
 	}, {
 		.name = "basic-mmio-gpio",
 		.of_compatible = "arm,vexpress-sysreg,sys_mci",
 		.num_resources = 1,
 		.resources = &DEFINE_RES_MEM_NAMED(SYS_MCI, 0x4, "dat"),
-		.platform_data = &vexpress_sysreg_sys_mci_pdata,
-		.pdata_size = sizeof(vexpress_sysreg_sys_mci_pdata),
+		.swnode = &vexpress_sysreg_sys_mci_swnode,
 	}, {
 		.name = "basic-mmio-gpio",
 		.of_compatible = "arm,vexpress-sysreg,sys_flash",
 		.num_resources = 1,
 		.resources = &DEFINE_RES_MEM_NAMED(SYS_FLASH, 0x4, "dat"),
-		.platform_data = &vexpress_sysreg_sys_flash_pdata,
-		.pdata_size = sizeof(vexpress_sysreg_sys_flash_pdata),
+		.swnode = &vexpress_sysreg_sys_flash_swnode,
 	}, {
 		.name = "vexpress-syscfg",
 		.num_resources = 1,

-- 
2.48.1


