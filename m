Return-Path: <linux-gpio+bounces-23402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7696DB08DD3
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 15:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63153A45A8F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 13:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFF82D8784;
	Thu, 17 Jul 2025 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Dbp3K2FZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1081E98E3
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752757444; cv=none; b=OEnPNHkTUEPbhAyQYIcERpFvD1j+OUW5sx8g9msZGjYRrtQmIOHopq+grdNLMD4+PI28piRYvfSFGvohKzZrKySCe64t2npg2nOgBYjfiveHMYQaHH2SJm/X1J+pk0Z9GoQbe9D3cMo2d3jlpouibcUFoZlIU9URAI/V6eVqIk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752757444; c=relaxed/simple;
	bh=NftqzsRL5J/T4J3rX4hNKcGRqdV8OQxf1wBUn1DJjGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eIVqYK938e0d+Fmt3rp8Z/tQVpD9lHrbrVFy+SRJlEfPKMSv1rHBAHn7VlSGWNF7MjubaGrI9jmL+bT1SWfJAJB+DT84x4JESHiVOPXXhIFbISsZ7XH5nFjAaC5G4sC52bCzG+gPH0y5H68bu2SKotiGmCE0oOKHJRjwAOih2w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Dbp3K2FZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45611a517a4so4010305e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 06:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752757441; x=1753362241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkwWhdv6v2tQVpOgaNo0HBrvh5YlIDiiOsHIyXdFuE8=;
        b=Dbp3K2FZfjqFEwrH2RGgy+qe7QTFlhjij9MWY+p4xl6PS9VUdz11GGeXiufFTv5VBM
         XzDKfq3ecK4uA21MV/EyiHPSTSb25kuK19UBrhq6axXMHrPxfg2XhTS9cAssva2l7JBQ
         uDfqp4rTSw9F1R4tW+ovNGBnJAM5pbEJgRUr2iD0DISKorrQh9i2Ou+1Lobv0NRd/Dos
         QrV7XMfpdwKWKrlKzD1F2/iXp0vMPpx7gl4vCoNBrwuFuDIdVeOAd0K9EjcUtCwf+SpY
         Xzx1pdWJID0eadOPEoqbjgEz+sZYSMf2uLTyHfhLofJIFD7gB2j0pIccOhENGB1i7b97
         YiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757441; x=1753362241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkwWhdv6v2tQVpOgaNo0HBrvh5YlIDiiOsHIyXdFuE8=;
        b=gCL+MKqWFCr7X9mwPmdvDg9pXGOH1aABNM1E4CwLAUFnmq3F8VhuRcm1U7gTrNfEjn
         OhkP4ouNzviEAEs/diAN+esKjRpsrEUYk8PQiBhjNlykmkjMMDLBdUaevxwNXK1AtIHa
         nxVV8Z5JIAHu1gAoHjg+aysiT7XsJsIN8iUvHe9jPAX4VW5/t76JblDCDceUmGq67PUF
         otx00M0m9ouPYTuBpYwl1juR8SZRaW13TfQQpUdl9yipyLkbAFI0vFtIxEpg1TZvaaGB
         u6Bo0v9Td1/jPDHqH20Lovy7wcZtfzeY8A9dXfEhDMY2hMi6jdhGp2/suqykUgUHn/Rb
         ThzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5NorKCTpKe+r8Wxi/NrHbhTIVJWWIaOOymgfqIqqZ/zzFQ3Q1pXC1/myTR2jYDx/gyICXxdRnKUY4@vger.kernel.org
X-Gm-Message-State: AOJu0YwETWY3kkuZWbwLjZ2/+a+EsEst3ENYinNs1O5/jNOa5rItJaDw
	eze3gU2M6tSAUqKsx+sC0lRuD4P0Y4pNbS3X35dTRnTm02zosmJXK7nMUOddRuF+26E=
X-Gm-Gg: ASbGncvdzzusPmgF/ALF8s/WXDZnL5lTtDTmSxEOfliFTxrCDsqgP7PRuatSU9I4xO0
	tqJPbAIoDe2doWEHE6+msS6gwbqtYELFbVE0m2OfVJNipGCAzxwrNIbpddfq92GoAF2okfAYQh0
	OSJLvLPRXIdxvyYUMUX5aArZI6IxCdsAffo+d5JRkAS8/Okgt8F8Stn8wtUECDlT7jZSakjQyTQ
	CwONUY7AiaHFqZf+Upu89kqmRRR00Bzm6QWsGAWzIXKhR34mPEswhsqxwnvlMtuoAEb1jsOZw+w
	fcpL5Wg3267OIEHp6PymgBHQpxUR4lG4QhflypJrG7fMYsae/3B53XcV+W9DYj8qwcln61pF42t
	VxX8eJqn96qkzMBVVRDVPr58=
X-Google-Smtp-Source: AGHT+IHCEa5ASkRQNWGuxFa+q/5TTFTyaTn4FE3gd2ldB4CT+hspmh0TDEoQG3esevQchrYLxJN0Kw==
X-Received: by 2002:a05:600c:6610:b0:456:942:b162 with SMTP id 5b1f17b1804b1-45637bc1e8fmr18452415e9.11.1752757440948;
        Thu, 17 Jul 2025 06:04:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9e61:4694:c621:5693])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm21113548f8f.34.2025.07.17.06.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 06:04:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] misc: ti-fpc202: remove unneeded direction check
Date: Thu, 17 Jul 2025 15:03:55 +0200
Message-ID: <20250717130357.53491-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
lines"), the GPIO core makes sure values cannot be set on input lines.
Remove the unnecessary check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/misc/ti_fpc202.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/misc/ti_fpc202.c b/drivers/misc/ti_fpc202.c
index f7cde245ac95..ca415ef45cbe 100644
--- a/drivers/misc/ti_fpc202.c
+++ b/drivers/misc/ti_fpc202.c
@@ -125,9 +125,6 @@ static void fpc202_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	int ret;
 	u8 val;
 
-	if (fpc202_gpio_get_dir(offset) == GPIO_LINE_DIRECTION_IN)
-		return;
-
 	ret = fpc202_read(priv, FPC202_REG_OUT_A_OUT_B_VAL);
 	if (ret < 0) {
 		dev_err(&priv->client->dev, "Failed to set GPIO %d value! err %d\n", offset, ret);
-- 
2.48.1


