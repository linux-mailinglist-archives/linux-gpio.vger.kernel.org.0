Return-Path: <linux-gpio+bounces-29309-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F02CA9974
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 00:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52AD73019BAB
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 23:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F293D3B3;
	Fri,  5 Dec 2025 23:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="By68nouB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EB82C234A
	for <linux-gpio@vger.kernel.org>; Fri,  5 Dec 2025 23:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764976402; cv=none; b=Y3/ngR+XqDheisHULdhL0rM3CG5fWtNEP5jHtj9lIF/ytdjLCfGbpu8EhYKuwQnEzTnbVOq9N4xcgSqN39EXB3BZxAxGkhSmej/b3ctjce8gYPJrx6UKQamw/yjaTUVwmPkEWt+ctXHYxieeXR9rM8D5CLMVEf/ScRVkbE+WFng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764976402; c=relaxed/simple;
	bh=Z2TnggYnSPNTQQA0qeFMaIKiMc/QIExFwLuHda2smVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kbyOHWgPcWnIcSHmHtiYQ0ZlPzbOnXcNKxCO4Fg0cQafj++rObw1pnbdMgV3IsiDmZvAAJkJEl3jvafI5EjDz9TEbQo4fV0tXxqQBkSmFqhaAn51t2KuOKmRcZYJPGTomaciYPUnXpac9zFyIG2xvR5o9rwARb+8MoZHiwhUNYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=By68nouB; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-595825c8eb3so2671048e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 05 Dec 2025 15:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764976398; x=1765581198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ok3XVC2kEB7d6LX2W7MFJKuf7Db93yAzAqWhVXvqPiI=;
        b=By68nouBGABZzZpDHHPfiQKoWSJIfkh9HRFeKVufKIhFcf/6Nfi7+gl50e75zXgh9J
         up9YTfO5T6MeQSqtFwTgm+PjOUVIj8AuX/tuMgoSjBBPY89tDxsFFGJgC6sDFlGSISXl
         teZQYe5X1vaFL52WoTZqrDs2tHmLS8btykVC8U0Scz7LAGA/kXFXshUt7b4XPk2G8ybs
         /tdb6xEuF09fB7POS9v+IWuWb/puLOVWKU/1zffiTdNnaqK+wq/waqirFHn4A8F7rIx6
         1qIXQpN4E8X2iE1uVy3KFgWKxVhMfOYxE0qXuXFOgnuyOXJF620Jlda5Q5eMCZAfLrIf
         0ZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764976398; x=1765581198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok3XVC2kEB7d6LX2W7MFJKuf7Db93yAzAqWhVXvqPiI=;
        b=n+tojYw7h3qJ/XO73+2ws4aHXfnf2c8wFHSRBfsF0VdTwSrXmjaoanD4WWvV23BttV
         d1g6+hA0JpZ6V4PQQ8446G3zq+jSfDGzYDGcLqYNvBb9/ZO5sS5r1FeMsTwLmx2U4cLL
         2qPUfBcbfNbyI4s6X7fppJtkPL89F3KrJzClklYoG/OYqtv94QFNAKBN9RIykq7ITBr7
         y5f+v4pj6eX4JGZRxJgtnCO0jVb0sPqyOauJ4IS4iplw3jUjAsK2c3Y50Dmel2moIDxm
         /MgkkMXeuHDr2QEu8AYqQ1wtlfqi+gGQTIZk/L07nMo82fcHK37w7aov1oi6OHfaxIVu
         ih1g==
X-Forwarded-Encrypted: i=1; AJvYcCWb4oBGaVohQ10IcwnTua8Mgow1+5BzjzwdMGC1X0Xe2I7sYTncOlPaZqJ1bgAV2Mne5sQWoIa3G+Yh@vger.kernel.org
X-Gm-Message-State: AOJu0YxT7sVEbiimddeDwfZ9lHGO4TuM5jmQDkdjdNe+npQc3NiCdhG6
	eCqDnqI9CXLvVgXhtchW966boFjjAW8rXZ6sQ1O1MLR2A9pLjP7zKy2a
X-Gm-Gg: ASbGncsT/Kj4y1r4egd9WjoaQzy73EcQVXpP+ljeIJesXYn1gwVsK4PGoFTjlcm1qGA
	aBVZE8339/yDCinJLExOd6VlSi/FUap5LAnAARRB/6bRuJ0Bkxzt1ei/ZY7nRS10MQoI9JAcKJ7
	xpyJEQ+PJojhBPhtkczbAtLBz/ww35nDwZhuc6Njhns2NGXbIFwV6agC4lX+W/oQTfcEOJmeDJ3
	6QCpu4mBN6/KEVcJxNmoRrimG5jGEK8BrEJYdUOCmM3GRwgYPB+YVKlWE29msVK3Fc7Kdotf50a
	3fFeVOAjwnXcFR6PC4qmwokbZyz6tVp+7I6JBex0qqZIkwCZM4rki402AGx6zYH2gYJHHpgV0cU
	3MYyQlt/7ol6FLHrrqK3jD7f3hngIGQOfrdhPRo4nfM0mZ0KFNJ/gjqTdAGVmv6UK8e5014XBcY
	WPArJOnM1/wCR7cQOkfZ8=
X-Google-Smtp-Source: AGHT+IHw+siol0Y/HCUauT594fFSjA/LYfEXRKCDELP7T7smqU9LZ6s7uqmUidrRDZEZmBY4flxMEA==
X-Received: by 2002:a05:6512:2353:b0:595:8200:9f7e with SMTP id 2adb3069b0e04-5987e8af414mr145380e87.20.1764976397518;
        Fri, 05 Dec 2025 15:13:17 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-597d7c1e2efsm1918614e87.56.2025.12.05.15.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 15:13:17 -0800 (PST)
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
	Askar Safin <safinaskar@zohomail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpiolib: acpi: Add quirk for Dell Precision 7780
Date: Fri,  5 Dec 2025 22:32:42 +0000
Message-ID: <20251205230724.2374682-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
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
Reported-by: Askar Safin <safinaskar@zohomail.com>
Link: https://lore.kernel.org/linux-i2c/197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com/
Cc: <stable@vger.kernel.org>
Tested-by: Askar Safin <safinaskar@gmail.com>
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
 
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449 (v6.18)
-- 
2.47.3


