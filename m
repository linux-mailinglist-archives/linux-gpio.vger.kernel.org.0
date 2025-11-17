Return-Path: <linux-gpio+bounces-28600-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A7358C64CDD
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 16:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 817AB4E2978
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 15:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DA330ACEB;
	Mon, 17 Nov 2025 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Pd6vc/7w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABE6257459
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 15:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763392132; cv=none; b=ew8EJrAhMjOlTSYqF1lEsdBCXssWBfS2QYv37DUiAFusRsS+kvMHdkO2/v0XXE6S2l3V32Ovl5wOx74YbwLC/a47CL3UbfL8+ko9EBct6+ZldD727nI43K+POGzZI/lkFW7ivWoTV2zfCfqh2R4/ZwFLDgO2xcF/Pzq0b4wxTcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763392132; c=relaxed/simple;
	bh=6Z3vvdDJi99/j2trtNiDk92hbCD1SPyVgC/q+3Yb98c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZnOrmrky1dOodoLvddpsHwxRJDhbPBtamOw8ZRmNWPChXSFoeEMYEokqgnR2Up7dX8NtRHRk2aIBE4F1zsvAix18PJlH3aEkAladJf/QgC4T/9ENcg1VbjBItchHRMdoSepmZ5sMO+A4HpP97VzUSIkO9BV+LpoLp61MWJGpVvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Pd6vc/7w; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b427cda88so3140981f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 07:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763392129; x=1763996929; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nldYao/zHqiLGI1RXag2w3nlJ/toi6AbF/bm2mPJ4+g=;
        b=Pd6vc/7w3GiuJtqYvB0upS8x0/xKja3WL4MRxN6T1E3LanxBtzA75gmOifFWX4370i
         7BaiPbIo05LcvXS+Zq69uSnJceId9o45ikbiLaOM+z0OjhVQ5MLWtRmfb0g0bb64lu6H
         WJz94cOMHbF7TildXZ8k4raEgANX5tfmhMDpNnfAzwG15um0GaSl+4CCKUE+bRL7MWsc
         zLsU3NsOHyzuu+oy8RvZpq2V4qSr8siHWjPftd5/LjeAm9DVanRiXOpdvgy1AolJ12AO
         8vENPuI9jDrBdfWHqSo4PFUVkj/F+KfSIyEoWOMvnSQdR71G4nitmtbDnCP4GegLDyTa
         oP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763392129; x=1763996929;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nldYao/zHqiLGI1RXag2w3nlJ/toi6AbF/bm2mPJ4+g=;
        b=NZHYsoSnNFVSzP05zwzjkm5vYRyaK7hLl4Ih/AdabhdZ0vC7R/dj7BpT9Thij0WX//
         ZHK2eONrPczEQyta9oYLPuZHEDxXxF7Js6AkRuxnaVWyJ2ssXxyebskXBnjfuXOqMl2W
         Dsm+HsQvbAhK801UCr32ekMFWRddYqcPQB0ylcvQyOfoN+WSSpUoKm/IfNw/08wOkSpo
         8Jz6B+CLKNYyy5zDEiLifnsD2SuPg3+XfXJqt+iHnxcvmY+/TGa8u/MpbbuFYWEmlMun
         eWbwKTGKPyLBwCxHvAcsd5LHpHkriBsGkVcA7QpoqrReZ7aF9/YepxF+8iXh9QkzhRDe
         ZIeQ==
X-Gm-Message-State: AOJu0YzxGZJfAxQZereHXzz4TNnwvZ9CLrcrEEGUa8FkoGvjXyGeoYr+
	Hr0RKkLSv+0iX4xIZeBmDwU07dpfJHgCuOKdXRPxW407IGdXfDP0V2Dc+GXmFdtBxxI=
X-Gm-Gg: ASbGncv3gKDCJ2Hf+rFaZpn3oQX6gwbX3Fr30qOAwE+8nKnhSSFYC5nSwCAqxH/AeDQ
	Fpf+QwP0MOXGMl1C9zM+dEK2H3VsCbTSmJLmN9gRxpNoH84yffcuQCPrVDV8GINpmhTCc1O16R3
	Woep6ZZD4GuX1Z0gU9ScAZ2XSjZTGGZKR3QuJVSNMxYMSvEk62p+ia+KcpUxDC50jAIonJi43sK
	eaM40+UATWt6DlDinoCiQ/OjDZuZlZSxyG6NMGMvYwrEuimUvXFml/ecn+jibS+yUxsRS2G4beY
	0nRWZrACW+su/rsgyupY4qqa1Hz9Ozc4YiYxXLXPfrgx8y6YXaPogAmziwx2+cRAjjjbLDJ/HMi
	K1eLbpB/9urSr/usWXax3oxg8+KUiUs3FLJ1DbgttnOvQ6SkDJ4eoXPVsawjYHWdBT1Mwci7Xzq
	mrJ0us
X-Google-Smtp-Source: AGHT+IGaiaj/tb/Zs3JDmpJ8bAJiBUr+ULEguFxnC1stdrml/MsWAChhdPO2Iycs4JfzhjPmh440iA==
X-Received: by 2002:a05:6000:2dc8:b0:429:d40e:fa40 with SMTP id ffacd0b85a97d-42b5937324cmr11698519f8f.45.1763392129375;
        Mon, 17 Nov 2025 07:08:49 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:36dc:12ef:ca32:1a1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e97a87sm27366557f8f.20.2025.11.17.07.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 07:08:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 17 Nov 2025 16:08:42 +0100
Subject: [PATCH] gpio: cdev: make sure the cdev fd is still active before
 emitting events
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-gpio-cdev-get-file-v1-1-28a16b5985b8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHk6G2kC/x3MSwqAMAxF0a1Ixgaa4g+3Ig6kvtaAqLQigrh3i
 8MzuPehhKhI1BcPRVyadN8ypCzILdMWwDpnkzW2FpGWw6E7uxkXB5zsdQWjc1VlpsZY8ZTDI8L
 r/U+H8X0/QB1hyWQAAAA=
X-Change-ID: 20251117-gpio-cdev-get-file-e8c440a6021f
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2809;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=T/VxDXlzsT4igUw37K7lMLfTPECFMsCcg8T8/aC48Oc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpGzp8SSXsQ0lOMS/XTFKj7dnEMkmxqsKLY5+RM
 wnBD53LlW2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRs6fAAKCRAFnS7L/zaE
 wxElEACOUZC4/MlUygn9iOmlJgqVFdTPKXgJhP56o4k1t7vG/CL8wwtfjLvwy4OhkuhH5d5+u6G
 yLqADoXrDfsQ6r5n6ii7jJFqqFVn4+nqANNMweXmCR/l9eRdDRsgSCsSCUTH2IMmAU303cDCHnB
 VppK3r6N4JRsIKLPwEV2yc7fa8uapFsYxiebLfO/jCjtEADiN0WSn1stZWXe0BJLpFSRlR/YK1i
 Y5jYmIHQToF3xUFZTJJps+Z5RBqXUKup+b01bpx5h6ItiWbJz7IN7i/nVR2pMi6aPCMDcezeB/l
 N6ZMmgi4RhMmXkaGpZfsNi0t7XkFo3/pchrgj7H6w0tFQsBMseKSRB3RaE+nwBM1gT6sySgcRzr
 ffg9GD/vAgila1L3JLM+TspKwPueWQ6Hof9U8Q66r6dTKxcOGwb9ca2AKlzEIYz6SZb6Tt5+jHz
 dKAP4LHUmIMiCGfuVOQS7QOscGRTAKgJ0g7ZQhEE9iC5DU3h0ZwliAVrSj4v46Ly0x9eybPtmIl
 eZqDKTmg3g+pYVkUbAwZ/tbxjovXtNHMiiCEsqn1aSqXJ16BkVZiNTQzvb88okJ2cHlIwmnr55Q
 w9Ilhdvg3NQpGghl7RluEUifP71PRufT12DtMizjoM1IFQXL1dAFEQOGAh09w7Bt4oyGkGkJ5Ck
 KalaAgretMuskwg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With the final call to fput() on a file descriptor, the release action
may be deferred and scheduled on a work queue. The reference count of
that descriptor is still zero and it must not be used. It's possible
that a GPIO change, we want to notify the user-space about, happens
AFTER the reference count on the file descriptor associated with the
character device went down to zero but BEFORE the .release() callback
was called from the workqueue and so BEFORE we unregistered from the
notifier.

Using the regular get_file() routine in this situation triggers the
following warning:

  struct file::f_count incremented from zero; use-after-free condition present!

So use the get_file_active() variant that will return NULL on file
descriptors that have been or are being released.

Fixes: 40b7c49950bd ("gpio: cdev: put emitting the line state events on a workqueue")
Reported-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Closes: https://lore.kernel.org/all/5d605f7fc99456804911403102a4fe999a14cc85.camel@siemens.com/
Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index c437f14132b8637d3322fa7e5c2f86ad9a2506b3..62baa48ec0993da6341bdcafed61305456618380 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2548,10 +2548,17 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 		container_of(nb, struct gpio_chardev_data, lineinfo_changed_nb);
 	struct lineinfo_changed_ctx *ctx;
 	struct gpio_desc *desc = data;
+	struct file *fp;
 
 	if (!test_bit(gpiod_hwgpio(desc), cdev->watched_lines))
 		return NOTIFY_DONE;
 
+	/* Keep the file descriptor alive for the duration of the notification. */
+	fp = get_file_active(&cdev->fp);
+	if (!fp)
+		/* Chardev file descriptor was or is being released. */
+		return NOTIFY_DONE;
+
 	/*
 	 * If this is called from atomic context (for instance: with a spinlock
 	 * taken by the atomic notifier chain), any sleeping calls must be done
@@ -2575,8 +2582,6 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	/* Keep the GPIO device alive until we emit the event. */
 	ctx->gdev = gpio_device_get(desc->gdev);
 	ctx->cdev = cdev;
-	/* Keep the file descriptor alive too. */
-	get_file(ctx->cdev->fp);
 
 	INIT_WORK(&ctx->work, lineinfo_changed_func);
 	queue_work(ctx->gdev->line_state_wq, &ctx->work);

---
base-commit: 0c1c7a6a83feaf2cf182c52983ffe330ffb50280
change-id: 20251117-gpio-cdev-get-file-e8c440a6021f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


