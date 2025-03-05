Return-Path: <linux-gpio+bounces-17097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC672A4FA96
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 10:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBC3516FD41
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 09:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E234F204F7C;
	Wed,  5 Mar 2025 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uhtYePaH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1BF204C2F
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168186; cv=none; b=pUmjfhoRFU8GjbYU+WRGXZX3ivCDvneUfcRrjZnY8ibvTzXczyqCFQo1U+NqT9QAwZt999jN739YDu4MVKth7VvWk2BolfhnTxpfB240XZlmRu6dYTNq3UiXkupz5DlnMc/GMNAve79lU/1qVoyc2xo/OW2B04fmH7FvXlPhXcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168186; c=relaxed/simple;
	bh=E/Pq5yil0cjvU/ukMT3gU7USItiQoOxjeOU2SRQfly4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o/ijLPcW3yUyZEv/HcGZ9pQBlPAvkH7ghZ7nnh1Ch4ggxyTOTIsAhKm0TTscjUJDQVC96NuAqzi2WSkX6ITemEAdYiIkQmdVLUtaxsZRcy5XQC8VV92YWoRvoEJG+kcTP2pdr5iVSzcQ0lOfhWRNDQieLrzUvhu+2WGY7uLkJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uhtYePaH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f2f391864so3641077f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Mar 2025 01:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741168183; x=1741772983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d5UjWZ5weILsPr8XknPLuQcsI7+ozARlM9fSmGa2npI=;
        b=uhtYePaHMicj163yVgeoz9HVpObnyQeqY5tDSoBDW4VsjfExxsk6pkjEkFmUjRxhUr
         CFI44y99WkEd+PgxuDLiB3FCoubMwBqRGtJ7X5eXXrvHa5X3eysizExUy4cxLvVuUDKt
         6LMRmEJ9uVzrixup2wlWZdUvhYN35Tfg7cJhUpKhn5M8vhyOFyiqEIyZXY1O2I6SH01L
         8LhiGC4/zSkIAzMZnC9wg3eGd9HP+l3WwDLHuFZyCoI4wI550/NOfthHWrw8gvyKJTHI
         mj9M5ctN3Q/2LtX0qgn8tfDqBzlWFmxmS9dT8+n4OO+Gt3k6PVASTRK24jtv2URZXRbU
         Kocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741168183; x=1741772983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5UjWZ5weILsPr8XknPLuQcsI7+ozARlM9fSmGa2npI=;
        b=mFz9ki4RiV224Vwelfq5YBQRd3y6qSNlJVCbUZsTlD1v1JDqZQCVzwb4koCBQ7rbeU
         MW8YdwLxbzIIh7RVOTbfrcS5BonHgiLGaBfbO1oljPDp2afzyswqEapxZI4y55XV8INd
         +vpqNNv4TPQWw2lrTpimBuK02TKp22vaPSDuiPyl25RP6pIpK1pJjrWXubVTTdTqNGRl
         XJS6F0wk05lyjBBm2xq/dsf/EHW7HrmLqZf8gtQZDoeCDHUYDlUnl5s5+amCmZD7fhLq
         QEHUQp4HSmR2aYeFWs56z1gXz6vX48I8eV1u4rVBRngdZ17EbqBIqTUatMTx0fsA79RV
         18tw==
X-Gm-Message-State: AOJu0YyTUgfNLJ4my8x+ko/WW6xPnjn/1Hfgxd5OKxAWIMNXaVG0FxZz
	5qs8VtjgMFXKQ4Rna0ZOZOFUtVmk+FWCrCZXxz2qqhV7x5AaBhwIXHOr3FjRaow=
X-Gm-Gg: ASbGncvW+c7yihwSvOGjTfONdcKcqG99gplhxTkqtsiThJmEebyKk1Oesq9w02BgSpy
	yaVdukvXL5jmofZEIrE7wOkm6KluHCCy92Do/2gp/7tzNqGIfbK/PiPO4I8FBii4L7VD5b4/wN6
	nnaPT51J4Q3inIsBVZyedSjsoKVQYR6lrhsD5q/tH5ePEcVhhrLJOPUvmkWzuza0VXNGt3LR48E
	u0tZS3aYE6+cc7puGU5TGqRLXNSSUIWI+B33ohCHl7aVDBFswktFNtwdXTSIjWp/7h9uPTFk56f
	T8ayCykzsqpteGRpkxepLsQbNU+AjQGCYOROQ2i/xeuH
X-Google-Smtp-Source: AGHT+IE3ZYndRd3aCGcDy1NsnHk1JcSuobolN1usfY3/rOQ1MO5BYlsEICE8u2lBmL8SzFUnc8hOrg==
X-Received: by 2002:a5d:6da3:0:b0:390:fca6:ceb5 with SMTP id ffacd0b85a97d-3911f757bfcmr2025359f8f.27.1741168183239;
        Wed, 05 Mar 2025 01:49:43 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e514:53b3:5af8:e408])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd42c60c0sm12272005e9.22.2025.03.05.01.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 01:49:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] gpiolib: fix kerneldoc
Date: Wed,  5 Mar 2025 10:49:39 +0100
Message-ID: <20250305094939.40011-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing '@' to the kernel doc for the new of_node_instance_match
field of struct gpio_chip.

Fixes: bd3ce71078bd ("gpiolib: of: Handle threecell GPIO chips")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20250305203929.70283b9b@canb.auug.org.au/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/driver.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 83e0a7e86962..bbcad928ecce 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -548,7 +548,7 @@ struct gpio_chip {
 	unsigned int of_gpio_n_cells;
 
 	/**
-	 * of_node_instance_match:
+	 * @of_node_instance_match:
 	 *
 	 * Determine if a chip is the right instance. Must be implemented by
 	 * any driver using more than one gpio_chip per device tree node.
-- 
2.45.2


