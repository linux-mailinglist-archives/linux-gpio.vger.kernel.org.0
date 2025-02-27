Return-Path: <linux-gpio+bounces-16717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75961A482ED
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 16:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B2F93B318C
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 15:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C451B26B0A1;
	Thu, 27 Feb 2025 15:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tkEcuOSk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93DC22FAD3
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740670118; cv=none; b=scxCGwF/EiGgzzGeJBnqs5Oa/5EbNMlwJH4FQMabSACkBjgWuPstXfgafBzNacRjq7WRL4tEAbcAgLT8AzOeyQHcplK42fsFuMIEK6prCS2LQIndtXkm7MX2PiJtYv5lX4QuJIG39SJ2uI7zYaFDk6AQbgR8cbSYfiLy/RQV0FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740670118; c=relaxed/simple;
	bh=BStIM3Q7aMRwq331CSOFWaO4WkNTxhb2jNd4nMSki1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YkLg9bPzCO0/ob1LQhiRPDbp2unKgacmd5oIuVE4t+hTbSjotZuoYxrtv7LARMAgshpjSh/sOB4qTNf8SXPfis6LzMo2/oiC5Iv64YRZmhAwkZYNcdnrbNYL+FiXkbCudqytlpZ/QXTt/ti2j3jWtF4V7YhaKuNK2O8HfhvRucc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tkEcuOSk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso7972805e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 07:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740670115; x=1741274915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7624OFG3qUFRR8VK+5r19R1qPbs5o2C0+F6XuFtMrc=;
        b=tkEcuOSkhHGDdv//67ud61P8dBDyAHjDRfsqECkXBxx0b9bBKJ+zHQYNX/Yl2CcgzD
         YQqkQ1NGpuAAiZJisv1PQurQum+U5zm3q8uTDHr6bl57X0mZD8ZM+KBEdj1XWf2ElLZT
         N8bbtOrIA9Bw+qF14yoEOWCbCRksE6VNkbv171PNam/om4ZgtZfG0fiLosd9jPl357KC
         olC4D1CShktQ7EyN5mEckX+cdaNPsNGGsnSHO2V6ERAPmNuaAQlGIC5ledpXcZmtuGpN
         JvWQLBFbp+hv0ZFa15cbPybBxDRlimLszMTWdbetniPJ+GUqUHGBtQeUqMB+fiPRHXwD
         2QjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740670115; x=1741274915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7624OFG3qUFRR8VK+5r19R1qPbs5o2C0+F6XuFtMrc=;
        b=K21Rkh8daIsXvZEqgeadNE2QAgFk5A/UauZ6v730hmjcqkQItOfKXrlV5aleuhSEZD
         rovLewupMwe62HKuR8VTkuXq/AC8xxpdi75ejg0NeWAZI8apmccI8hZC3cQ5p22ci6w6
         aXJ3CPzesOU11mVjE0LothfEIhzgenRK1kQ1WKhJDKuVYn/r9uBUVS59RykBpD6HiFqB
         OV81uF66qyHeHO1hFZjOqJdkxXrPQh1J9HKVjKnLzCXE6S2X5naoqJtjUcUOFCnLYKEy
         r6MDqixnWFz0CStAXtUSNzARMudZPGwFaOjQlCp3G8Scdia1byOWOY0OdHBDxTPhQ7Ld
         +PmA==
X-Gm-Message-State: AOJu0YxJ21aovqyPttoC597wj5NMQhdMEqG41UuVynbA/UVirlCIzvrA
	3uRd7849VgnYFs8pq4sGBGG7p+mjBa3UVbkXiNHrFLNmbgrHQNzh/M4WQuAwNyk=
X-Gm-Gg: ASbGnctJ0ibgv18Q/ZaeZb9CCsRnfuRLsv/RO0LFI8+PBHIc986IRbLOHJqaRWikBI5
	LA11rutnGryWeQ+PQflvdt8pz9epJ5M80Pk+tD5FpDmhIeqaelXCRbqZpzR2LM2tBV9J4qvAla0
	ABsvt2cqh0aHE5wKlhMR9st8AuLRnvmmFHtYN93xADHdntMqjPVxlE9gLiFmkgWaSmbK0d5/XxC
	7mw4hmVV8/0vgqm5lh9sG2n+N+egFZSxrLZb2O5Xq85MpRjJUlfJ0DlHBnxfKpGFUU/aC8XlbrJ
	eIZRaHSDohAYuA60QeodSgDIGA==
X-Google-Smtp-Source: AGHT+IHcKD1/SdfUB9xzo7Is4+i7lHq2eb7AMjlPIjV3WON0VG0sd7gLXvwwR7Rnwswx9QdNhmKzww==
X-Received: by 2002:a05:600c:1387:b0:439:9f12:1809 with SMTP id 5b1f17b1804b1-43ba3b47d85mr16911445e9.20.1740670114206;
        Thu, 27 Feb 2025 07:28:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b50f:c403:bf52:2dbb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b73717171sm26179345e9.18.2025.02.27.07.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 07:28:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] gpiolib: remove unneeded WARN_ON() from gpiochip_set_multiple()
Date: Thu, 27 Feb 2025 16:28:31 +0100
Message-ID: <20250227152831.59784-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO drivers are not required to support set_multiple() - the core will
fallback to calling set() for each line if it's missing. Remove the
offending check from gpiochip_set_multiple().

Fixes: 98ce1eb1fd87 ("gpiolib: introduce gpio_chip setters that return values")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/ab3e42c0-70fa-48e0-ac93-ecbffef63507@samsung.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1b4af0f97e5a..6cfbc8869cf8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3608,9 +3608,6 @@ static int gpiochip_set_multiple(struct gpio_chip *gc,
 
 	lockdep_assert_held(&gc->gpiodev->srcu);
 
-	if (WARN_ON(unlikely(!gc->set_multiple && !gc->set_multiple_rv)))
-		return -EOPNOTSUPP;
-
 	if (gc->set_multiple_rv) {
 		ret = gc->set_multiple_rv(gc, mask, bits);
 		if (ret > 0)
-- 
2.45.2


