Return-Path: <linux-gpio+bounces-28698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15808C6B84E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 21:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 9EE1B29FE5
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 20:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9202F39A9;
	Tue, 18 Nov 2025 20:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cSZTt9Ci"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B91D27F00A
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 20:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763496312; cv=none; b=YDl51EhGNsWYNPAKDv4Jj7DHs0OwdYQhHFOHEjfmfy+6U5AGeGu4oPb+emw/vDhhQdZrn1xB4SiZRAcjIzkJpWc1TemlTq5S4Zb5Y+yiAB/7IdOrQ2bz3fd+QpbOhCZ6udMKq0vq6YlHdlCfZ/R82QI5EDI/3CDQtP5alkZ0clc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763496312; c=relaxed/simple;
	bh=iFFcU9+DHvwBtFFjcKZUT85UCUn0fiuZ0lAn0OH3muc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YrtXJBgo48cxdd/BdnS2q7YffWhlBb0Drn87ZLJqVQWSt7jJNkplRWVWJNY2/XtGQ+SKOzkyDfxBA6zEaF6nV9pHee7G/yDXo/7DAVmndkIOt4ImVZbtMjB+avWVH6tk1ohqY6k0dhoy1RGwlf/N14qsCqKDBlesCKyd2gHa9ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cSZTt9Ci; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so39897345e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 12:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763496308; x=1764101108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSqzpUv3cAlYnCheDFG7kKnLMRAczRNf4FYZr6gKY5Q=;
        b=cSZTt9CiQ8qMQ5I7W4xXxY5iXuNWwb7ksNCQ9+bjHuATAsNf9OiOc3ccBTuR1slTWJ
         V9Rj2AdT8Lc0JXitntoKg5ZKd+0xMi6Xe7oRlEPbvm8yDhrt01gftbnp9xOT4+gsVs0L
         CBJopMbJrFp+6t+sz2OfWZPThkg5viY9kIBJAAWyRE7uhN+kj4CXWKG6mLHYUXdUGmsd
         VNhXJpOaF6rVcmr8baXmTcPwopYPgrFLu/a2NoH0T1c3YFrPGMkzz1AhBdMXyKrhmgTA
         cIH/GEE3FhaZtqEm8z/dqEnNe9WnZWZYLA/ILHwaCdkXvsXhGbI4USSaAIWDQD4J9gpm
         FdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763496308; x=1764101108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSqzpUv3cAlYnCheDFG7kKnLMRAczRNf4FYZr6gKY5Q=;
        b=Xk5uU8SjGlb/BjeVNEIp9dY5FdtVVSOPQMmsChg309n2rppZTyNqRUPTanMdg5zrF+
         SdlqSOZQt2G3d6LtOfT8tIQEHavCy417lMct6rJ1jkwEWYtAgKhCPnEZjiYeYWWzb6gv
         6JBoLJWvoRATLN4RZMmjoLG2/WZxZiXVMTmJ/T3pmt4bstS9NZlkhCTx3nnrR8sGX8a2
         FfasYC+7OHk8kvcooOPphrdCWfxdNIQ7JBhcU6IimrU6Vh0YLKGbyGVQHRQVl7V9YM3L
         gprJcLVL3PTkf+358f+Y2BHuixrUUkWD2nm1EW5BQq/TuDbKbR/F1iiz91XuuvjFS67l
         itFA==
X-Forwarded-Encrypted: i=1; AJvYcCUDywCaDww8v4dSUyvBuaOL8t5Zpbc/ZdRu26mlkChhkbK4a3vf0akoiC+s0/xHE/6NIiKEJOlt0LHo@vger.kernel.org
X-Gm-Message-State: AOJu0YxhroYhsLOhNOSHb4L8b9X6vZ5zw66yhoI9AnJvMmF6e6WPdOs7
	qd05kWKbg6tQLUADcKN5Voir30iCgtAZncy7rjjyvM9iFGhClh+bHUcKWKWtm3BluY4=
X-Gm-Gg: ASbGnct9roCNMbSuQO0tm6moKaitw4s8V8e5i1RyBL5orJDm3FeUUTe9MesBuRYEKEJ
	JZeQ08y+Xa4bEtiNRThGg6f6RdPmPWC46/fO7IvfUQ2/JJx1B4Q+VYmnxTzpyQNWYgkqNE/hYmd
	qEX4nIN68WZC80JPugLkQ1xEaev/6s//Q6kt8xwI3WICICMKqil05upccT1Qb48ZbDa7Mpca//k
	PvpYiViJLYYkyJS08A/AXlSxOdCEgsyQIBx/iJz3UScb7SWDfxj92qBXryxZrFy956D3CFv6JVI
	8v4PeEb9luF3Fxi+OJYafHrqzaEzBUQG0ZzJqRSWtETSYTr/YzhGBZo54loCZvHEGcs0WKjLaj5
	CxQOccnewwSlF0IhFtCWBKwImYV9m+APjc+kLDYYsj5psAzKXSqzT1R1O1SwHoB9//4CInlxJ6p
	mqgokXxTZEZv2kezs=
X-Google-Smtp-Source: AGHT+IGi03i9uaL7V/fCm3iTAE5PW9qFD67adl6STSr88JH8V2qKaSaGOHAJEmC5xlSlS/+NpXOIOA==
X-Received: by 2002:a05:600c:a43:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-4778fe6a415mr199738695e9.16.1763496308099;
        Tue, 18 Nov 2025 12:05:08 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:3a27:ef52:14e2:c140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9741cbfsm24854295e9.6.2025.11.18.12.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 12:05:07 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: shared: fix a NULL-pointer dereference
Date: Tue, 18 Nov 2025 21:04:59 +0100
Message-ID: <20251118200459.13969-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The fact that CONFIG_OF is enabled does not mean that the device tree is
populated and that of_root points to a valid device node. Check if it's
NULL before trying to traverse the tree.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-shared.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index c22eaf05eef23..4ce574a21850b 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -205,7 +205,10 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 
 static int gpio_shared_of_scan(void)
 {
-	return gpio_shared_of_traverse(of_root);
+	if (of_root)
+		return gpio_shared_of_traverse(of_root);
+
+	return 0;
 }
 #else
 static int gpio_shared_of_scan(void)
-- 
2.51.0


