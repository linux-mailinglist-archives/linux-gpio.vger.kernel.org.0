Return-Path: <linux-gpio+bounces-26441-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F9B8FDBD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 11:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72C232A0C83
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 09:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395792FE56F;
	Mon, 22 Sep 2025 09:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yyrKlc4k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2389A2FDC59
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534861; cv=none; b=OLyfjW4IoeQvc8Jln2gznMKbU3RI+vKwlj+oL/84IreniCyl7tfhlMaQktEMjmsVR3z5MlvkpJ1Bl8eXAsyF+D3Dnt71wWQp6yfqKrqX0D3DnCKUzbgtN9g4SFyLdeq8PwGValW+2fG7qcjBDg5xRLg8p2PXKsagEvOzDLy1F7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534861; c=relaxed/simple;
	bh=JSiAbQ6XQ550GNvYxQSyGjmWOwgYL3hoxlRzhMdSIJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UD/D6UtJ5P6Td9znGDF14U+hDC1QK3We3UMi5DwiicByHyJRlHfJErf2k2A8dzsrpoco6ReJF+LYimvd8cjoOcST5YN0D5RkPAhJDcyxqe9T461nSB9IFbPcYzvn5r4m9YwL9hrTUMw1lb8TmO7ZmSb+xv9jwfMsR1Ff2lomoy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yyrKlc4k; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso3595380f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758534857; x=1759139657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWTtZzwfHQn6+lCmpyy7uiwGG/neruMpxQbJXO4Gid8=;
        b=yyrKlc4khGtfTClKvnDUMZOsHrAjuV4V9w8lWOCqWjjyBjWsM/n811H/xE/4VQ2vhO
         /Vjo6C1ximBeMA+qxEJmGVOlo8YqnI/K2EAvdDaLtryXrRlsreiTPp3U7SehvyqdcLZV
         3QaSYzo9uTVP7rsW+uV2mgeI8GxApsr++dF02gqS0mtW5v+42IC6g1NGreqeXe6Eh5eR
         jZ292L1tlJCXPc+ffJ+ye1rPBTwYIaMjka9w8SPkdHbxeXNsadU+21zW2nRRl/weQzuC
         SBGCxSWxkeczwmHHP/oFNkcNyT/pjkvehZF3U0UAdnwoVsbN08A/z29gt3M+TpvS+yFp
         cNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758534857; x=1759139657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWTtZzwfHQn6+lCmpyy7uiwGG/neruMpxQbJXO4Gid8=;
        b=QoFGFewsbb2UUkCEFmPXc5LRgE2Ul2Nt2tsPvuBxakv9K8nNczWv3CmktVyln5XFVl
         Va9yUziM2PvR+cAT7DGw1dHK8psBdAXQz59CfznNJAohv956y7lWKcRkAA3IN/erFnVW
         rzD6RSaSnrSbPt8yi9CKwgWvcwS2RJsN7Cm8vx+a1/YiewrMPTacMVpC85xZr4ujfRSf
         DmUyooVjbjVz2ZF1CtQUfYIKQHMDHuKMa/AEtyseB8Ub3aWSg2RV08QRzm1J+Ex/Y84R
         T8lLRDVdt2vvf9fyUAlmAYvJ+JpmVHHflz6oWKq7nZ6+xm6w0NDq1ub6SxNjZlO7e0rS
         OSyw==
X-Gm-Message-State: AOJu0YwXKbzG3Bqd6L4Ol5Gk+L1bPePmKFYzWzMrBg+xD4Hw1rZLJ3pE
	eUsEap+VMOyczAZ+sREDRMKyne8sC2Zy8gBaAodGARYmU3DrUYyun8A0Sp3nFJ6kHUQ=
X-Gm-Gg: ASbGncvtIRW8Kc0u2VMfUkeDoGC0S4oXEizEwZsKa4Z7IDqnm3k5gJg1YmeCN6tOjPY
	/qa3RMFCJhfDiKc7tckEMK2lf64VVbbTzGrcJQM38M3cSN0N6RUrRIoC+bexBEY3fBrVnCEXLUw
	GzAXEB8bRfyRtj+WbfbXGT0XYYIfLKfwwLDxIhejG12B3HL0IV4uuT0xLWWAxx0xsQzpqiZKLTh
	vBAqgjISX+BqOIMCFs5nDhuQs46iGUeVd+Uv7VGqvFbZTSHiiya3BNz9gOy3iVqHBjEUhIO3piz
	yVuQ7uYixe0SRv4JRYgJux//Fq+RtZEHo3zX56Lw/9V8cwXW4iuzbeEKWaznYZtTx4YsB+RtQHH
	3tlsF/HsmilTTNLfM
X-Google-Smtp-Source: AGHT+IG1+kRPuHwty7//pLz5jaBKbYNCrdG9GqG56Fo5kQfMR/Yof9+/bU8Pda5/DvbhHCSkvIYEAw==
X-Received: by 2002:a05:6000:1a8b:b0:3d2:9cbf:5b73 with SMTP id ffacd0b85a97d-3ee7c5536c5mr8433532f8f.6.1758534857329;
        Mon, 22 Sep 2025 02:54:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:824c:ead0:65a5:c51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-467fc818e00sm156496835e9.0.2025.09.22.02.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:54:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Sep 2025 11:54:04 +0200
Subject: [PATCH 3/4] gpiolib: reuse macro code in GPIO descriptor printk
 helpers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-gpio-debug-macros-v1-3-d99739dff711@linaro.org>
References: <20250922-gpio-debug-macros-v1-0-d99739dff711@linaro.org>
In-Reply-To: <20250922-gpio-debug-macros-v1-0-d99739dff711@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1825;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8H+jaFi/4nEUhuueNetvkF3PKqlgLMwgna7grRPnOMc=;
 b=kA0DAAoBEacuoBRx13IByyZiAGjRHMHIvQf0JLdhJjL3TzNRLv9C0Zc8fiRxjaPJGo+dX6Jdu
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJo0RzBAAoJEBGnLqAUcddyAfoQAKf9
 LnBSTMJS7dME3y+a5Hj3GCVM2fkOyCXUzoLWd3Xm8fMJx0Pj9X9D4NrWjuWJX0CGXH0/lpyJtoT
 +kBptgYOttoHK2uyJcrCTgLBl2uwuV3iqjxyKsdVKgm0+zibwfVsY7ESSxMGVWokZMje6XGlWQw
 73X+oGQ1ZstN0vCntzgvvfOKXmSHIeB/of465LBFwOzPY1UN+46lo1+nwGL9PdC1WfAUzBzFKVD
 n6fIV3M6ygcK6GB2vmspToU/dgpljeRCyDEqISo8j0IVFdQ84LEFJZzrQbRXitybsXXs55yMayB
 IKbewXHAAM6TjjVeqYYxSKpEd2jR00QKc2SpHDTOL0RHOy0LI7RbVXrm31yHqcufsBcv7QpczzX
 Mhy6K+yXgWRCVUElo8ymL0cjHtQvwjanSfkgnTPVS1JXzohtDpbS75XOikDW8H/c1LluycyRaDz
 RrGax2R3RVtD4Gbe1k+YU9UjJXvaSjpXMzbLeB72yJUkChKx9KDKyyrind8uHD/6XD5Rap+EHLh
 lT9DpslSwayals9B/QA8ysp55kKGVJuCymvDv3jUXXLI6om7RONJw6ZzfoID8E0wvX6KGb0NcLE
 9CaefEgAc9Nj4yeKEyt1ZZN/heG7HAEOYmTfBm0AHNEiuiU+CkgXL3gK25z47J1N0SG174zcXu6
 1QtoB
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

A lot of code in gpiod_$level() macros is duplicated across all
definitions. Create an intermediate macro which allows us to reuse the
low-level code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.h | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 6ee29d0222393dfff84608c79d21f4022cdd9cc1..dd96b2c2e16ed1cad2a573e0dfec3ab7260da1a8 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -283,29 +283,17 @@ static inline int gpio_chip_hwgpio(const struct gpio_desc *desc)
 
 /* With descriptor prefix */
 
-#define gpiod_err(desc, fmt, ...) \
+#define __gpiod_pr(level, desc, fmt, ...) \
 do { \
 	scoped_guard(srcu, &desc->gdev->desc_srcu) { \
-		pr_err("gpio-%d (%s): " fmt, desc_to_gpio(desc), \
-		       gpiod_get_label(desc) ? : "?", ##__VA_ARGS__); \
+		pr_##level("gpio-%d (%s): " fmt, desc_to_gpio(desc), \
+			   gpiod_get_label(desc) ?: "?", ##__VA_ARGS__); \
 	} \
 } while (0)
 
-#define gpiod_warn(desc, fmt, ...) \
-do { \
-	scoped_guard(srcu, &desc->gdev->desc_srcu) { \
-		pr_warn("gpio-%d (%s): " fmt, desc_to_gpio(desc), \
-			gpiod_get_label(desc) ? : "?", ##__VA_ARGS__); \
-	} \
-} while (0)
-
-#define gpiod_dbg(desc, fmt, ...) \
-do { \
-	scoped_guard(srcu, &desc->gdev->desc_srcu) { \
-		pr_debug("gpio-%d (%s): " fmt, desc_to_gpio(desc), \
-			 gpiod_get_label(desc) ? : "?", ##__VA_ARGS__); \
-	} \
-} while (0)
+#define gpiod_err(desc, fmt, ...) __gpiod_pr(err, desc, fmt, ##__VA_ARGS__)
+#define gpiod_warn(desc, fmt, ...) __gpiod_pr(warn, desc, fmt, ##__VA_ARGS__)
+#define gpiod_dbg(desc, fmt, ...) __gpiod_pr(debug, desc, fmt, ##__VA_ARGS__)
 
 /* With chip prefix */
 

-- 
2.48.1


