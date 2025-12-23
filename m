Return-Path: <linux-gpio+bounces-29800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEBDCD84C2
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 07:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 371FF3015171
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 06:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7948F2FBDFD;
	Tue, 23 Dec 2025 06:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b="0qdA4Jzd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E2F2F4A1B
	for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 06:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766472801; cv=none; b=Thil6acyo/wMhQ2Z/eH//7z9venVEQKjwwSB0gQUX8iGqr4v8uoYtbjl9kw6WQAi6+3MVMES6U+y37h1zFQ+ThYiPz8jE7HFTyZL2iKPV6Kl5/thGlt5O+xTp9qoICthohXQNXVNI7o77LGs/WqEyoCdFvTBeelA9LZXoIXmhHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766472801; c=relaxed/simple;
	bh=0Mqi7dBywdOuhuH+YUhkuktsUNLkUWukjoOq8PzZrdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oXAZH6s8u2KYB3Z2xeSFh87pMOA1h/v0iqSS1ABI2gj9Dn5CyxgsN+an/rRSkyXy+dnD500jQsIcKgXP0OksEBHEAbvAZXB8f7CPXeXJUPYMVqH+AwrsITH87u2ecqVGmCrpKDHbg5V56+0RsA9Yk5OTxRIM2UIVp+1WksAGA5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b=0qdA4Jzd; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso6570018b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 22:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1766472798; x=1767077598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Omie+aIP/M9di46gB5qUKmryRAwukobUHm+cdMjFh30=;
        b=0qdA4Jzdc+fKSRdy9TJZObD43qatIQhLMCEbM45NgduJGfImP5MOwRAtJkghXEwsvU
         tTdGHQTKKBLjHwwLCCnsx7/OqQziim02gjeDQgI854S+jHJmZ+NXwSApqm+RY9chkl6d
         MH2g/Jqk93NrIPJmbuY47PilblKYf8epFS+sDuvswyXPkgZqQFGN8KSYbhi8y/q1Y3iw
         VhSIB4KccCmG2HXGVP6VlBtqbCgD/fIexHIK0RRIvhbVQ93NzPDD2eRnfSbuuLSboCA1
         dAGKGtGTQ7E3sjgPR4DqT/DwjChSF6WM97DpT+HlMuM/xGcGx9iRm7Vk/1gQaILtJViK
         xUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766472798; x=1767077598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Omie+aIP/M9di46gB5qUKmryRAwukobUHm+cdMjFh30=;
        b=n0WZ4PduNx7U06HlWkSGR/8eb9Ftm0eb1xu8Kknu0R3/yJT145jDO2JeeneT5e+2EK
         LerCU3/7PW87i1MI91FiLqAFtXm/I3EleYnL3YBXmMvZhizI0XWy0CnVd8ANbDDl94VF
         CjuccGS80cH4fzr3n3x3dSosour9Atbqubh+NKhPnp+Qjg/Bq6u8YBaYf+Si0/kCKrFS
         ifPam7kdWfvk24McS2A5//R8PWuAEDRTAtHcYEJ08kwD/4CfZiNoWkCPCJu1hslEXOKf
         GWHdIQqtAZd6Za1aV5TbQdl5wBNfezVhUQjrU5YutLM70XLKib2YgF5e0EMoxfj0e6nM
         xPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVeilkLHky1Hv9Wo+pLAi8ILxwsQBcBgKi4gQX2XnYi3Jl4aP8JvzMswsq/pXYRQybL9oCYxwYaPWZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7dIAbzLvOFTNt25qlTz0MBF4tLp5AUu7ENogec5s7ra3/Mah7
	55WUWRQv5EWQpgDRvUViftQ9asF1X0s7wY4eMNYhArMwEfMxmoP0NhcOg86nXK84Yf0=
X-Gm-Gg: AY/fxX4+l9/h+4OVQXQR/UhH18pJRmzQD5fCP15WKobSpn2t7TL+9nfVDg+ckNxmt7X
	Q6LmPhKWOnIPlYwiC0WgEx6vbztTcWDONl3DqaX/VJ9L1kcJZpx1IhDQJHT2kjGFn6tMT3RS4wv
	nSiA9hg2TogbKMgvrhWmZmCMKLQf1zLiQJtxDenUxMT16MR1yR8wQxZvgsDOThVAMxA4ZcWrhn/
	mgCWXXmtr5zB6tpQU3hSmLv2EZAuW+NjEbxUSW5sI9Qe6K6nYH3F7e8u1tiH/dmEnAFQ0+VloJQ
	nEwiiGvBJqlG8znBuc/i38AjSw/pp8fMBcENTOOx7Y9u8wfa9h1uZcBV2Auc0H44J/rBlRUT4s4
	GuNIrjS1tJxUx7MLnNe5Pnk42U13wpsr8y6x4gGMB7WqXTJPSy22TRnLjG6/VcqGpieWdXS6gQu
	IVBD7emIrkFO7l/97Ta52gKXai
X-Google-Smtp-Source: AGHT+IE9aDkJ4ZmTo42FTF2x3yvPVHXivvnWkrQMedEhpuyk1W6PnwRGT+VNRs55UHHmOHVjeO6dlQ==
X-Received: by 2002:a05:6a20:6a09:b0:371:d67d:e56a with SMTP id adf61e73a8af0-376a9ae2989mr13490259637.57.1766472797865;
        Mon, 22 Dec 2025 22:53:17 -0800 (PST)
Received: from localhost.localdomain ([103.158.43.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbb7sm118295755ad.59.2025.12.22.22.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 22:53:17 -0800 (PST)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: linusw@kernel.org
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] gpio: mpsse: fix reference leak in gpio_mpsse_probe() error paths
Date: Tue, 23 Dec 2025 12:23:05 +0530
Message-ID: <20251223065306.131008-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reference obtained by calling usb_get_dev() is not released in the
gpio_mpsse_probe() error paths. Fix that by calling usb_put_dev().

Cc: stable@vger.kernel.org
Fixes: c46a74ff05c0 ("gpio: add support for FTDI's MPSSE as GPIO")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

 drivers/gpio/gpio-mpsse.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index ace652ba4df1..b473db9c3c4d 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -596,24 +596,26 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 	priv->intf_id = interface->cur_altsetting->desc.bInterfaceNumber;
 
 	priv->id = ida_alloc(&gpio_mpsse_ida, GFP_KERNEL);
-	if (priv->id < 0)
-		return priv->id;
+	if (priv->id < 0) {
+		err = priv->id;
+		goto error;
+	}
 
 	err = devm_add_action_or_reset(dev, gpio_mpsse_ida_remove, priv);
 	if (err)
-		return err;
+		goto error;
 
 	err = devm_mutex_init(dev, &priv->io_mutex);
 	if (err)
-		return err;
+		goto error;
 
 	err = devm_mutex_init(dev, &priv->irq_mutex);
 	if (err)
-		return err;
+		goto error;
 
 	err = devm_mutex_init(dev, &priv->irq_race);
 	if (err)
-		return err;
+		goto error;
 
 	raw_spin_lock_init(&priv->irq_spin);
 
@@ -626,8 +628,10 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 					  id->idVendor, id->idProduct,
 					  priv->intf_id, priv->id,
 					  serial);
-	if (!priv->gpio.label)
-		return -ENOMEM;
+	if (!priv->gpio.label) {
+		err = -ENOMEM;
+		goto error;
+	}
 
 	priv->gpio.owner = THIS_MODULE;
 	priv->gpio.parent = interface->usb_dev;
@@ -657,12 +661,14 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 					&priv->bulk_in, &priv->bulk_out,
 					NULL, NULL);
 	if (err)
-		return err;
+		goto error;
 
 	priv->bulk_in_buf = devm_kmalloc(dev, usb_endpoint_maxp(priv->bulk_in),
 					 GFP_KERNEL);
-	if (!priv->bulk_in_buf)
-		return -ENOMEM;
+	if (!priv->bulk_in_buf) {
+		err = -ENOMEM;
+		goto error;
+	}
 
 	usb_set_intfdata(interface, priv);
 
@@ -673,7 +679,7 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 			      MODE_RESET, priv->intf_id + 1, NULL, 0,
 			      USB_CTRL_SET_TIMEOUT);
 	if (err)
-		return err;
+		goto error;
 
 	/* Enter MPSSE mode */
 	err = usb_control_msg(priv->udev, usb_sndctrlpipe(priv->udev, 0),
@@ -682,7 +688,7 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 			      MODE_MPSSE, priv->intf_id + 1, NULL, 0,
 			      USB_CTRL_SET_TIMEOUT);
 	if (err)
-		return err;
+		goto error;
 
 	gpio_irq_chip_set_chip(&priv->gpio.irq, &gpio_mpsse_irq_chip);
 
@@ -695,9 +701,12 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 
 	err = devm_gpiochip_add_data(dev, &priv->gpio, priv);
 	if (err)
-		return err;
+		goto error;
 
 	return 0;
+error:
+	usb_put_dev(priv->udev);
+	return err;
 }
 
 static void gpio_mpsse_disconnect(struct usb_interface *intf)
-- 
2.43.0


