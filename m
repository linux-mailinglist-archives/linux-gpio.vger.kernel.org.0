Return-Path: <linux-gpio+bounces-11355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E1499E4C3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 12:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23C251F23FA7
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 10:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0A11E6DDE;
	Tue, 15 Oct 2024 10:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Aef1CqdS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD221E6DCD
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728989798; cv=none; b=nTe7t5DL6t7ZIpfyEptBmTXgE0PlD6MgYK38KKYbyjTiN15QFYuY9MYk7rDN3skCBO3xb11M0KMyyOzPRarb13QRQPPvpIAI2OFPKKazOFlwUMauYXuv8bNZADo9Y7ZfINHrimU93mXVwOSwUHyXzkV9zZaD08JtB81tP+HFlz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728989798; c=relaxed/simple;
	bh=1FvGI52kfpezR3fRNk5gdU5X2NGN/Ce2PAUzH6Yx218=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JuSPTEKVM45ppKRNn88qjyCOM33jB4jXxm8XJCdi/It4f/Km04MfWAm1+SsrilAZaPnCA9U84HFAQWa7XXjzJ1xabB11srse7iCGSS4ZUPLcA3YvpEUa2rCqLCC7r2rl0hzCWz1KW2baagbFhsrF9GaCSGtjbkNJrEdg9Le3+ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Aef1CqdS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d47eff9acso3091631f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 03:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728989795; x=1729594595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Io1/9kud22QAvhf6jzcXu5d+3TGY2BSmgSByZJNBKbU=;
        b=Aef1CqdSysm20ynvj7X6w47e0nPtHZwwcZ6595YqwD4TSpciRSJvbMOWE5rqGO/3me
         kZ4NcADrmOED2ohUJAnWM2fxhs/0nCuCf3YRPz3zP2wyoKlKxxMS2+CYYL+r7922g313
         fRUkSUR9QDumXNYBPAeoE/YkwSYx8lo70YcmgofB/A7WN3j1gimLyLfCYDs9RIPjH7ar
         pmSbBEhnWLJdG1m4qGTmVXseR+ANt8baBIxFLuPXCNTFk1la7M4+MieezfDbSGdxh9qS
         yXJLFNTYMWsAwS/XKPjlTrPbeJrxtnSh0vMlZgGgmrObjabA6tbRAujk8cfA4xLFNg3C
         FWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728989795; x=1729594595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Io1/9kud22QAvhf6jzcXu5d+3TGY2BSmgSByZJNBKbU=;
        b=K7PiNU9zU0sbGolTXo6bKiIOCXSsNSVl9qNhnKLak7Cz4xjJhaIbXj6LRV8cRpFs3A
         JIcANTAwHsl6KPm0LT/IRApHWtfPA/nDP9wePM0aKC5G4DX9JC8a4OwVtZNzCkRG2s6W
         4EO0luBFsUuIMLPrmfnUEFiKuK4Wdpmsu1uM3lvew0ad+yZNkM2IBV/d7wDQ5s80U8Pe
         jeX549tqZCpGuJ/4M2R6/sN73pze7ErggWJExe2gREZBMYCa/U9S/PbIpdE+XfWoX7Eg
         k+vc3Jy+xMhagkJ1D03WIcihZU5yoQtih+g+NEhg1sJhJL20J81p+rfeCuHUQldq3wo6
         zwSA==
X-Gm-Message-State: AOJu0Yxg1FcENAvzIFt66JpdiQByNZ/REByrWOP8KOzSf1F+/Eoj02Xe
	FhDLZB/VmvdcbUODzK66rxYhTBQ61xL/AMn57APlnMBWoyAZjp5g3wVYKY2i+t0=
X-Google-Smtp-Source: AGHT+IE/KgsUcgkQEmhfXkFmH2Hx2cAjwfcojeoaOttZwqt4pV698ZjtBDq3aaLrmB8GcX6+TGtddA==
X-Received: by 2002:adf:f70c:0:b0:37c:c842:a16e with SMTP id ffacd0b85a97d-37d5fe96419mr9151347f8f.5.1728989794246;
        Tue, 15 Oct 2024 03:56:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d382:b11b:c441:d747])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc403d3sm1254115f8f.101.2024.10.15.03.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 03:56:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Oct 2024 12:56:14 +0200
Subject: [PATCH v3 2/6] gpio: cdev: prepare gpio_desc_to_lineinfo() for
 being called from atomic
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-gpio-notify-in-kernel-events-v3-2-9edf05802271@linaro.org>
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
In-Reply-To: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2678;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=wig1myTtW24p4sbtrRCA4A81OwCTFkQeSpoEcy0Eyvo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnDkpeDtDXpfarJmYVsE4wOtqMq59PjI88NKdi7
 fSqi/3aoLqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZw5KXgAKCRARpy6gFHHX
 cgbCEACwvj7qcGHV+sVbRvRDrI0Zodz6pcCNqar5bxIA/t85KHc1Rs9f06seRHY1JaXmv4bTEoD
 Yz06lwZx/AbD6bBJIuT6GGWn8ntAmp/jJ8PLgi59qZ9v7VCCkKKHELtNnSHoH9jfvYpGRPpUtNp
 UepyZX3QfxkOumGHUD7QcUD4Fnrir7FsZObBGWSleSMbBDxVjUkUd9YM/aN+JLyuCFRgt+eUDBh
 R+48oyWC5nxVVExuaDS9qYKAHc5jwJ4bclNVv2+Ie4pCKs2sAa6NBH/kLD0rLJbFmMEbtQipOLx
 tK2C0ihc7dVGhX6j/a+BuY1G1v5aWzXQ/oNemL96Nh8Ce5heXCUI2AVQtgDfLVxZxFFvV0D71q1
 MzVZBFhfwMgUanxXNIJuZ5fSOhiYmMbeWarjTgy62Ao/vyldVy+XwKxj62c3QzmYhan78mZz2ft
 6q6eul1oKhH3RdpgnwwLeTQdJ5fjfGHmDqjyf/y9G6VqSVMIEq4ZePYcLIE0MMwrAf8Ba2eTSI/
 CbwHh+Tr7UzODe9I/QuG7YvB68yuk5vZUSvkNo3Je3fjcQwjoWVJ2K3AXgzxgoxXkbg3gWWMEZp
 WOSw1/Bx/9hSycQCE7N2zVLyiLxNs31ogwYBRBoj/dP6GeZSNZw6K/RjFKbB/ugX56SYEQyeNR2
 DG1+7srG7kPSO/Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to prepare gpio_desc_to_lineinfo() to being called from atomic
context, add a new argument - bool atomic - which, if set, indicates
that no sleeping functions must be called (currently: only
pinctrl_gpio_can_use_line()).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b0050250ac3a..b28751242835 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2361,7 +2361,7 @@ static void gpio_v2_line_info_changed_to_v1(
 #endif /* CONFIG_GPIO_CDEV_V1 */
 
 static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
-				  struct gpio_v2_line_info *info)
+				  struct gpio_v2_line_info *info, bool atomic)
 {
 	unsigned long dflags;
 	const char *label;
@@ -2402,9 +2402,12 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	    test_bit(FLAG_USED_AS_IRQ, &dflags) ||
 	    test_bit(FLAG_EXPORT, &dflags) ||
 	    test_bit(FLAG_SYSFS, &dflags) ||
-	    !gpiochip_line_is_valid(guard.gc, info->offset) ||
-	    !pinctrl_gpio_can_use_line(guard.gc, info->offset))
+	    !gpiochip_line_is_valid(guard.gc, info->offset)) {
 		info->flags |= GPIO_V2_LINE_FLAG_USED;
+	} else if (!atomic) {
+		if (!pinctrl_gpio_can_use_line(guard.gc, info->offset))
+			info->flags |= GPIO_V2_LINE_FLAG_USED;
+	}
 
 	if (test_bit(FLAG_IS_OUT, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_OUTPUT;
@@ -2502,7 +2505,7 @@ static int lineinfo_get_v1(struct gpio_chardev_data *cdev, void __user *ip,
 			return -EBUSY;
 	}
 
-	gpio_desc_to_lineinfo(desc, &lineinfo_v2);
+	gpio_desc_to_lineinfo(desc, &lineinfo_v2, false);
 	gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
 
 	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
@@ -2539,7 +2542,7 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
 		if (test_and_set_bit(lineinfo.offset, cdev->watched_lines))
 			return -EBUSY;
 	}
-	gpio_desc_to_lineinfo(desc, &lineinfo);
+	gpio_desc_to_lineinfo(desc, &lineinfo, false);
 	supinfo_to_lineinfo(desc, &lineinfo);
 
 	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
@@ -2632,7 +2635,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	memset(&chg, 0, sizeof(chg));
 	chg.event_type = action;
 	chg.timestamp_ns = ktime_get_ns();
-	gpio_desc_to_lineinfo(desc, &chg.info);
+	gpio_desc_to_lineinfo(desc, &chg.info, false);
 	supinfo_to_lineinfo(desc, &chg.info);
 
 	ret = kfifo_in_spinlocked(&cdev->events, &chg, 1, &cdev->wait.lock);

-- 
2.43.0


