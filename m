Return-Path: <linux-gpio+bounces-40-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 975D37E9512
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 03:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 508A12811B2
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 02:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747CF1FAE;
	Mon, 13 Nov 2023 02:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JuygbspN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D50848A
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 02:34:37 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD124111
	for <linux-gpio@vger.kernel.org>; Sun, 12 Nov 2023 18:34:36 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso3970826b3a.2
        for <linux-gpio@vger.kernel.org>; Sun, 12 Nov 2023 18:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699842876; x=1700447676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3x9HMy2KOCVDwBY1aKyWkU7yvsdzFHPBbEJCciD5yLQ=;
        b=JuygbspNqMr3rkxFBnw8mb79whkOEmqHm6n3kiFY3P2wDBeVpbmJ7Sx1JfGb3fpKkh
         Ed4CCOWtlMpKLsel6zhInjMuZgbmxT+Pq+i6gAi/tk11rgSZdfmAT6uGH9NcNxOt43dD
         VgDB6P068mrPmOjMRE96/YWzeRueurz7TNCb9TnSW9kZoktZrtdDx1lsHC/UdllAydP+
         AP8i0Dl3xeawdsxRiabAF9P8imei6lWig9EuXYR+HUDu7g77YPCUX1u1xKqnN5fphfAZ
         xMu0W29Drz3xvDkTWlnZgXsrFFJ6v60OQLIc1IV+oa3gUhk0W4DwWlzjvyTqzQNUvQ+/
         IRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699842876; x=1700447676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3x9HMy2KOCVDwBY1aKyWkU7yvsdzFHPBbEJCciD5yLQ=;
        b=Vp8n39+wXjug6oLTExbMfBDDEeHRfxlDpCDm7kNJGs/U72azzIhpN+L0aSj2h88/ZU
         vO1gath45WS5FvS4cxpe1mvnIMqGxJWBLlsXYOGb5vtuDdcoWqSDUhYmMW/xZRT+ZOhF
         ORE85k0hl/eBokeOGMkMpnRhtTfW+NBsoDh4IPF/Mn1N6HXX9zTavdvcRHOU0Mn76MH6
         GTl0VFUpKzY6ZHmnFLTUhZhVSmNDCt7vjAm88rGxC5dG9CFOn2E1WX4G1PArBwdB+U+V
         yYFZnnwcL4YWKWW+37vB+Tnv5jfpSpnDod4IrdBATpJ3H0P4IL3Ib9jRbbv/01ef6afg
         CvxA==
X-Gm-Message-State: AOJu0YxOmU9RffplaR0+eT8TQEi53iX1dBxk3ZslDBkcamlDFPjvq8i0
	8ZLrz7iytLz+MwHFZNgYqhQmntcUtzTdglB/rnXdoQ==
X-Google-Smtp-Source: AGHT+IEnZh+aR0sLWPKOFMs80myLNe8uYYzars/PhN40NDuSuCYLfhLw30h/2jkP74tE/0IvSzLuEA==
X-Received: by 2002:a05:6a00:800c:b0:6c3:5f49:6da5 with SMTP id eg12-20020a056a00800c00b006c35f496da5mr7110474pfb.34.1699842876238;
        Sun, 12 Nov 2023 18:34:36 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id hy12-20020a056a006a0c00b0068fb8080939sm3015184pfb.65.2023.11.12.18.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 18:34:35 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>
Cc: Andrei Coardos <aboutphysycs@gmail.com>,
	Alexandru Ardelean <alex@shruggie.ro>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2] gpio: sifive: remove unneeded call to platform_set_drvdata()
Date: Sun, 12 Nov 2023 18:34:32 -0800
Message-ID: <20231113023434.1186043-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Coardos <aboutphysycs@gmail.com>

This function call was found to be unnecessary as there is no equivalent
platform_get_drvdata() call to access the private data of the driver. Also,
the private data is defined in this driver, so there is no risk of it being
accessed outside of this driver file.

Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Rebase on v6.7-rc1

 drivers/gpio/gpio-sifive.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 8decd9b5d229..067c8edb62e2 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -250,7 +250,6 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	girq->handler = handle_bad_irq;
 	girq->default_type = IRQ_TYPE_NONE;
 
-	platform_set_drvdata(pdev, chip);
 	return gpiochip_add_data(&chip->gc, chip);
 }
 
-- 
2.42.0


