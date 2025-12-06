Return-Path: <linux-gpio+bounces-29341-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B919ACAAC3E
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 19:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B848D30080E0
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 18:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0A42F0C6A;
	Sat,  6 Dec 2025 18:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/Hn6TT8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C6D2C3260
	for <linux-gpio@vger.kernel.org>; Sat,  6 Dec 2025 18:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765046110; cv=none; b=A5Y4Wv87pNDgTf4TAOuRuvn2/zhG8p7DxnW6cTlMNaV1fqiz7rz7l0eCka0UoZ0lrDx55KcRa5oYINZK6QW4cEAD6v6R9K7eZvJzHNKZlvolTqFh3XfOmGFpUeqTl5OPXkgHgAa9hRJowK3Dd1wvkLo+b7F99qIzuh60kBdVpN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765046110; c=relaxed/simple;
	bh=2Xj9BvX5DJCNWMWbbzPbSZXRdRtJu6wOg59n92iAbNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pge5hu6+dtGlvVsdDQzMg8OIV7jyQdwOStqyvH2ki5Tdd6YEHrakwyXH3YJedulINsu7FzRO5UM9cOH41a5B9qgwo1L8k9Z1tc+jL/iSnkciw/rLuKPhoXHmugb+OXdg/FyGSaIdL/z6/0JjMG384CHVGWbDIzYhUO1RzQCxIiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/Hn6TT8; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-597de27b241so1827486e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 10:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765046105; x=1765650905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBbB448ht3hgqVqiqj9wAU25sZQEfiyetfXCLvEq3so=;
        b=I/Hn6TT8iLH4JVy9MgQdBbonERZmmt6dv3kMvFnvwEmcPegq4M3EyZuAM93KgRYKeg
         Au2WWmCwvJ5sLJI2dVdRocT+9MYZIqUjOaqL870wu350DpWHKujPJJxd5FhiCHZkU9Uy
         ueCStBtDHPhN85XWZ8SPCEkqbMF/U8Y9rrtGANJ/tUH9/5+P6zMaIWJsZQThKRTy4UKh
         krzI8iPj6xYcEo7gnNawrr46QdPR6cJet4d7kvCxySUof6nC2QLIG1c8TQpErBsx70xF
         sDk1m1xBNMbyawGYD2+rMFsbeMCUgHAwbFcYn+Zz6HZHjHXhGAXHSgKwxm9UKJnHaO6U
         f1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765046105; x=1765650905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBbB448ht3hgqVqiqj9wAU25sZQEfiyetfXCLvEq3so=;
        b=ieTKM+tbZeKkmOpKlrualo1hIG2UDBAtIKO9mj1SDG7iByPgY0d0cvVUjKwqt65wLA
         AxOsUObGt7/rqpR8Ra/uOwHqyRBSx9lpW87PUOM1yBvx/Qdey0+BfIbd/y9GmRilWGbj
         R6zA2Ou1aV5wAE6Rh6KW/acZAiJpHVm08x1GQLzigaiM/OvsH6+M85eXKzjVh5kB8geP
         oz+w7FJKbTZNBOet0TYe5XIBZbDDRGqM0hQ3bpnImHoLIh0bk/TU4qOTnVjGuOqJkGpd
         /4sMDOnjXflgK0H+0NtO/inSprxM1ZXh9yrVv6imVHfduve4QsHu5u/bmPSKH3tPhXGh
         MzCg==
X-Forwarded-Encrypted: i=1; AJvYcCW17qu270l7Zoqb2RqLRKW5DH5DFkcw9+07szqqGB1aNSwztFVBjXS/LA2//QZUMSPa2GuTMqR5a+F7@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQbxobOUiLI+SgT4mo37WmW3sa/qldEk+a8Gq+r6jaOWIepij
	meXzTLQ5ekKOj5W0eRGo775EHPYyAfdRtzKK1aj1VvJPMAK3jPLkIj1l
X-Gm-Gg: ASbGncumlp8NI1pVD9HO6PXu7AgkeQgMLX4PN+P8Vj0iw1eZudyPz/tkqBh27CLuTU1
	GYR2TWqD+58LG2OcDQp7iS7qN8t/uep+/LkJywxkNkJtlZqZsKS2mUxHV1dSRRIaIamCZUR+tEc
	hMD7dUrQ0SHZz2YGBSNuvjRQVsolVhvyRa1XFwfh46XVHCD+0qq5CRuIBy2YMsqWkwRBWwJlz8x
	9LWPureknoCVYBEHzhLJxH7B2kn0lb+V3IfBWrSdH0p8/XOxJNhom26+glcXA7eN9g23tPP0wJz
	mj1jXFl5/ytLuaR+XrU+jxI+5lPGaO67P9iAhg8daS2TI8jygQl01fP2E84WFmB3H/kCidUZUF4
	lyTxJN+MeFhEl9fisYpXZLpk3KYIh8A3wtEpyIi0qRcYH+zrM0a0hpwtiUHGxbaKn/utCpI4Ma5
	i4Cl/yhK+Q
X-Google-Smtp-Source: AGHT+IHnxnTE4IQRpHLhybpHqVatvtv9+syN2SM1jyy7DP6ZE+rzLXHDgj4+p7nmI+TmaroB84yRhg==
X-Received: by 2002:a05:6512:1113:b0:595:81ba:fb4 with SMTP id 2adb3069b0e04-598853c54e7mr893651e87.47.1765046104377;
        Sat, 06 Dec 2025 10:35:04 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-597d7c31520sm2588902e87.101.2025.12.06.10.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 10:35:03 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: regressions@lists.linux.dev,
	Dell.Client.Kernel@dell.com,
	Mario Limonciello <superm1@kernel.org>,
	patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2 1/1] gpiolib: acpi: Add quirk for Dell Precision 7780
Date: Sat,  6 Dec 2025 18:04:13 +0000
Message-ID: <20251206180414.3183334-2-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251206180414.3183334-1-safinaskar@gmail.com>
References: <20251206180414.3183334-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dell Precision 7780 often wakes up on its own from suspend. Sometimes
wake up happens immediately (i. e. within 7 seconds), sometimes it happens
after, say, 30 minutes.

Fixes: 1796f808e4bb ("HID: i2c-hid: acpi: Stop setting wakeup_capable")
Link: https://lore.kernel.org/linux-i2c/197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com/
Cc: <stable@vger.kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 drivers/gpio/gpiolib-acpi-quirks.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index 7b95d1b03361..a0116f004975 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -370,6 +370,28 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_wake = "ASCP1A00:00@8",
 		},
 	},
+	{
+		/*
+		 * Spurious wakeups, likely from touchpad controller
+		 * Dell Precision 7780
+		 * Found in BIOS 1.24.1
+		 *
+		 * Found in touchpad firmware, installed by Dell Touchpad Firmware Update Utility version 1160.4196.9, A01
+		 * ( Dell-Touchpad-Firmware-Update-Utility_VYGNN_WIN64_1160.4196.9_A00.EXE ),
+		 * released on 11 Jul 2024
+		 *
+		 * https://lore.kernel.org/linux-i2c/197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com/
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Precision"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Precision 7780"),
+			DMI_MATCH(DMI_BOARD_NAME, "0C6JVW"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.ignore_wake = "VEN_0488:00@355",
+		},
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.47.3


