Return-Path: <linux-gpio+bounces-29669-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D94BCC6460
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 07:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4487F30A1813
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 06:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE88B30E822;
	Wed, 17 Dec 2025 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bm9jrLyY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2958830F94F
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765953174; cv=none; b=pk+if1cE9TVRZL/nWa5KiafUc0bB2iVg/QFbGyP6EU/4mjegqGQ0W2ErMbpdIPLzZ1VF2RWvZURiOJbN1LzGIBSJ6UoUcx0vFqZlNuRjNiD8Jhlq6QiS/UwOuwVxSTI+TQs+q2YhR3/KO4PzDFNc30ntNdEgN3AH5Cw9p4NiPdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765953174; c=relaxed/simple;
	bh=6k8slzBEObG7/F39KrdsXvRJ53AAQJmWEKRrz4ZcEvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5cFatdXSxDvyIOZPzhhDcSveFh6pXMGnvN2KKNfK8LqXMoygp/dVB7xtfab5eUCDGgVmVOZCI/s0MXZ3zuricLGXTg1dzbu4QjguOiEBeMTRoeW6s8usaxT/OxMfSVkv1B+d7n7y6zB6lQnCl+pvXXNutHDTC/qrkxJ24K7j8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bm9jrLyY; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29f1bc40b35so80278095ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2025 22:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765953172; x=1766557972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7IjOd5n7dn01gPusqci87Y4DSrB1s49xDCI1uVTCFw=;
        b=bm9jrLyYEzk03ucfhgG+RW06Rxe1YaULop6Wv/QDTECH+DARFk8amz4zGGKy0CfZqH
         hryOwRC6J/bW3TSiognhmv3mTZQ3tvivRKZ8d7FHzfiupOJSxPtFwFMUHrHZGM1sFx05
         aRk2SNyi6T8lMJXtt2xA2Q0FaOBev0ZidU+h+AwM1ySs9h3ee3c1INz0JUcHEn6un+dW
         LAVn3hlntLWqlW8qkQqu1qUik98d7FOY5O3nJP9DYTINwYXpIJyGlZ0ta07YgCQV5MO7
         S8N5v/r9J7ux5W1qMdPUT4Z/E9I98PwYc0ReOfHXcvFbpRkCcuvXbkOkl1Yf24WCMxNt
         ORRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765953172; x=1766557972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F7IjOd5n7dn01gPusqci87Y4DSrB1s49xDCI1uVTCFw=;
        b=sGAFU7maSzyQqlfR4sznYn1ehHUu6s/TpGmEMqjkeppOF4N/Rou7WnS9asuDuwPR6S
         DJr+41ejZhXjjFDfZmHzjeVLUvsZ52MioGujALsLBoBNIxPB4Z3pYCCI5w617IrYA9js
         XElilDF+phxDCX1WtHpghfANJ+0hPNp/NmQZnlEmlVJWaOAlCTAD8U5EUiWhUbbOhkEw
         8ZI7UG2dcOmgq+NExtoJ+LALJ5CQz3rQFa48+DHfrcHFKjzhDzbIQblu7ffa1JScfbSL
         wPf0p/qIEetIF4M074PK7dRf7pa8nxLhGzFEjpdyEazjF7NmeGW4fI0NznGDShPFCwy1
         2U9A==
X-Gm-Message-State: AOJu0Yy/L08q/VTZ8BdoiLo2UI6lPW1bIg4eTcVTinuxwBGN+I21fCQW
	90aBwcljx5bB5owcRESXTWLjvMK1ZjKwVZfh7JD2RGgpStXjBY+EoXNhnOXiPw==
X-Gm-Gg: AY/fxX6eRoyLbjv0BUtHbTJZzsXJiu4eE81Hn6xc4RD6M/7fp10rqNapR7RcRJKhCsg
	I76hHUopo0qqn8tKB1Dl6SHcijX1xXSEUN7NqgRNAezTCJb529nKtE5oZoigCzk4jRJltlCvMkB
	WUTcqu6HGAtu039ZVWsMmZvxRDLSqjmQfDHvhkNd3hzuwuxTp9SKs16tHL5VesgTTnRV01XACUG
	Cy2M539i7c6SPdlRLSR3mrBvYQk5bWcP7ckvOKx/7AXj1XkRnW+nKZPmqFZkykErW9HVY8q4D/h
	A1vC8mNVOX9CTVnVndNxd40klYcwarftfobrJVphn85QHFH5YiJO2UIyyRtcCZeK73Ke8q8l0OD
	9f+8qzWe+wjodRaxsMN5ex4OqM0BHWSVZnmXuCgstYg85TH8HnHhR1WZ0jA==
X-Google-Smtp-Source: AGHT+IH5GnY8d5gQrU0i8znAn0mRFRq67JkGc6rJik3SKTklB0zxyLRR+POE3lPsDPKJ+qVNK+22bg==
X-Received: by 2002:a05:701b:231c:b0:119:e56b:c73d with SMTP id a92af1059eb24-11f34ac5313mr9572454c88.2.1765953171788;
        Tue, 16 Dec 2025 22:32:51 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::c20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm61454672c88.13.2025.12.16.22.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:32:51 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] gpio: realtek-otto: use of instead of device handlers
Date: Tue, 16 Dec 2025 22:32:29 -0800
Message-ID: <20251217063229.38175-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217063229.38175-1-rosenp@gmail.com>
References: <20251217063229.38175-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an OF only driver. No point in using generic device handlers.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-realtek-otto.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index efcddbe01308..8bad43afc586 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -372,10 +372,10 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
-	dev_flags = (unsigned int)(kernel_ulong_t)device_get_match_data(dev);
+	dev_flags = (unsigned int)(kernel_ulong_t)of_device_get_match_data(dev);
 
 	ngpios = REALTEK_GPIO_MAX;
-	device_property_read_u32(dev, "ngpios", &ngpios);
+	of_property_read_u32(dev->of_node, "ngpios", &ngpios);
 
 	if (ngpios > REALTEK_GPIO_MAX) {
 		dev_err(&pdev->dev, "invalid ngpios (max. %d)\n",
-- 
2.52.0


