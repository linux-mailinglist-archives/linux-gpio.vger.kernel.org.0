Return-Path: <linux-gpio+bounces-24287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DAFB2266B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB5631B6326B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B152EFD94;
	Tue, 12 Aug 2025 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m0HJMO5L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE06D2EF656
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000775; cv=none; b=Nclkn6PY128Wq3LtAuauVeJ9RM+a3zjv1D3P8CCDKKQje99XosU67Y1OLzwU+4uK8J/SN838rwbDF1DGjnMTMCfUnbiTtBApCuj9myLwJYXVCy5FaM14vqRP3qIFFvEyG0a19yRWeKemIFM8LeLsNYUeJaStYYt3+Bw0JMSE++g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000775; c=relaxed/simple;
	bh=weXYtvOJal0gfVKqkBOQyBy266M+SxjHRozHrgmLGEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2aWDs2O19/UY7FFq+ruNhG3AL2rAyC0aq/1koTT/qt7BlB090adh8AfYBlXSwvW5ujiakhHDnl0AUcgnJQ7rSltgJodDJhcIshKUk6epRhlYKAsj9hFg0KreV0TSk5Tp7FfeNaeJH2E4U3sfY2zcakTwXFqRWpxV2+mqEbE7kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m0HJMO5L; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so5457899f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000772; x=1755605572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=m0HJMO5LqUuYUSGZZiEWrzj84Uw3NHcfPPoS1Nev0iodKPZrrpyZwP3S2wo31XOJT5
         edBPZwCU30TnspOx1BekZg2/DyE/gfoLGBkEsuMk8pH3VS6/nN1tK0mqc2KJLe1Rk9f9
         1n4suKMELg0INlZHT3mjJW6OmbUpJ+2PRZVonlvQ0YXzrKjKegWdemYL2QgTQ+QeBzy0
         zr5L6xBlTtrsEodTjs6VOSKO7ZSIBm8p9e/vZMrhWZS+8CFmNXOnNCJUzGdLvSdK5KIh
         rLySA6CQ9+GargqL5fw5uiqyRQJmsEUOJtZU7jrcm+2GBIxhImnnsf8kKPiuE7xzlrPM
         3JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000772; x=1755605572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=BeFg7z844RAPeqG/no8HdW2c2NEEPHqpbmyoMFd+w/Kp7y8CxOyxMu+WrH4UUu0rkW
         mgffOxybQjLJQ2VovAZ5EuMn2G279QownZWbBxUCJQp2BgLNKLNgddg5BJtbgjmjxCfK
         surOEs4phpAx0TM1PnMHbXM/Tw83nwwBFMpyU5WyUlWdQ/1ksYpzf3zdlxWBLrpT1KW3
         q54RJF5gQmleIa/t0va4/qr7sp8g4fAzafTYV+a6vqeGPT6FqjDfyoVFBVLzbiOnUSXD
         4lc4MhLKVzT3ZcDgO1lpoCkbzcIC+EDPtEVG+g4NRebfjLgAzV/DHGQJatIEKBMwTdzz
         maIw==
X-Gm-Message-State: AOJu0YxXRxf2lshG9euoM3Un/tnqPqwOZldprFXUx3pLAbPwfxoQUPzs
	VZ+aSRy83TMGQXflfRiCY8kxl1PXV7BAZVyh1yjMIeWiEK0irtCvfhVXUEre3j4hTnu3lLoW8i5
	R71mJ
X-Gm-Gg: ASbGncsBhKrGetwHOVEbjxZx448xx5H6RADgNp+pw2Qt5DXJsaAieeQUz2XoAxzdTlX
	OFnlHfKjAE+9qXbkdgwhuk57OxPDrxh2HLkoP5KA91w4eMlGKLFM/lopo1gBUVnAz1PUK1QU/h5
	laZ5VZ7BijKx1YqfWaxnByqXAcIj55GiFKaCSr0RpmGjViDiffhdggj2rbhkLRnO6zTDh+mBa1j
	oC1nWydf/J059r0P0jaLKgBtB+kgmexJf4qOcI5sbXw8lWGjmSJr4QC06JBMHIKZHP7eTwCKk2d
	m4bQGvmav8gBQvfvVV71WKYKtGQFlB897Y98slEyDRDBGLAVp9+IPahc0LEOhHRg3pgpNXE+pvQ
	u8ej8qhs3Nh4Ccqk=
X-Google-Smtp-Source: AGHT+IGenwtiWKA5m6N8X/17L8Igizzs58tEqhGQ2i43V54n+juzpwGprI0kz/fD8dVQkyyLD0TJFg==
X-Received: by 2002:a05:6000:24c3:b0:3a4:bfda:1e9 with SMTP id ffacd0b85a97d-3b91100cd3cmr2802046f8f.46.1755000772287;
        Tue, 12 Aug 2025 05:12:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:43 +0200
Subject: [PATCH RESEND 01/14] gpio: generic: provide to_gpio_generic_chip()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-1-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=q7IZHV9NOU3n+seY+p1AeQbkCwKHTjI/3z6Qnen62yA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy+/aTeDVPsPxVXdZxmvSFa4YrDThEqevhSwe
 PgxEtRX6SmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvvwAKCRARpy6gFHHX
 cpyZEACY+tGiTQH3CofyMRCLnRX+JHMRcdsWX3t08rZbJGpX+q5SIOH1+vjwwHSzbbRFgNtb6Az
 yS+Q88S1hUF+Zn42rihC14JaL1n8HPjULnJU9+EmpHxNSdphHWoCyaSDY4lDSZrSgwHxeGLwwCa
 zQ0itokAPCVZnoSTc90/PSQ3wz4OQ4yaC15rrBwVJv+0/uNrSedOx7le8Ch+Yerr/7u5hAfqDw2
 Wh54zE77WdXhVGDPBTOy1tkw0XZ6RxtMrZXc+wPBByD9mPQuTTL/P3DWmU60UyjMf8wKxi8SAxf
 5D4z5myqGCbw/ADv0LvErruoYZD4C8f3qcPRCCA5zCxF5lPfTyNfju8gLEybrLstkErCkmGDIqt
 OU/eZQAaqAR1oGPF1UUkbyopU3fFMvWH9i3xqovxOMrYyhemN/uk2hy/Jxc6W9bqAzNQ6deuXBB
 YUIgDP68wx6qnXpSji2UBHXsbKGMH1cILjqHO52qsG2MenCZR8P3lnDRoiaLxAZnWQg53oWicqb
 ZlyhFECViH2I5yNjFkAa0C15bwra8/mZaOAyQi5JkduX5MzK3I8E8YKdgXGXSmXVtujLjmpgJrj
 Tbqt9+l3+QY7igcmOQXGyFKExVahGcfO78xW0TuCLsdk1OVQEsylXtch3WyKNnZfBcOegTHVRJo
 GraLgXcIK7/LeTQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a helper allowing to convert a struct gpio_chip address to the
struct gpio_generic_chip that wraps it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/generic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index f3a8db4598bb59f1dba4fbebace24dc10be44ae4..5a85ecbef8d234d9cf0c2f1db7a97f5f3781b2e4 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -55,6 +55,12 @@ struct gpio_generic_chip {
 	struct gpio_chip gc;
 };
 
+static inline struct gpio_generic_chip *
+to_gpio_generic_chip(struct gpio_chip *gc)
+{
+	return container_of(gc, struct gpio_generic_chip, gc);
+}
+
 /**
  * gpio_generic_chip_init() - Initialize a generic GPIO chip.
  * @chip: Generic GPIO chip to set up.

-- 
2.48.1


