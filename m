Return-Path: <linux-gpio+bounces-7312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EFF90239D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 16:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF18D28CCFC
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 14:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81E984A4A;
	Mon, 10 Jun 2024 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iAUWpvfF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106978563F
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 14:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718028360; cv=none; b=sKD7ZReZY46Gph4H1MxfILuzqzX18cBHjsblv7+r0rdvTfL3GOSbDrqIMqle12sdz0ii9qqbG/MvhtJpVOw1oC5pCqy+LpwNoerCCo3BZ6UWmQs39h475VdEnyih0isFwXxZ9Hy1CyqVvVNQ2OLYwqicD9Y4sSEpTgvZ/xdKJKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718028360; c=relaxed/simple;
	bh=gBa1n5V5gUIsszcEppINk2D8zEynondAoO83jLEUfYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFgGQ7YCnKtFqg51p+5fHjeN7w+Fmj5zzPRn2Sccl/xIzSm7LYQG637kqvLFuBhJC3IaGBGi54afmD87UEgtyEUm4+MsEKp9qGXqnG4vqaYHhcUbpRsRv2Zwt8OzAlNEd7r5KpnkVA6gv8mzz0py/fGRWt/bg62rciXic/ihezI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iAUWpvfF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-421820fc26dso10699435e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718028357; x=1718633157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIJouERmppUalE0J8gICZtjFJhQ1JN77/tIkUQ2LKPE=;
        b=iAUWpvfFP8nHFPCVQ7JhvU1uY6/D3fs44mT5ZiD4pMoIOUoaeWb1M0TenuTmG0Yntr
         vahd7Vsg6xInQlsppro9iPWerE0eWW25RAH8kA/Hg//hneooVGSMEPM5+Xwkn3Yk3U+9
         4xZJ5vVvpwhPwqofo4yt5QHlf2/W8AXFaWw3u3X3WKGMdqU7EEexnYKAnqw4tn1YoQPX
         t2VWOZs2au6oPVeXjOdgAyrphv/R20qFa/MWMUqJK+4Uj5Yxi0kVaz93bf98he8umI/v
         yYOo5fqN9cD3UFaJxUL23ydE48rhQV4n8ghPJP18TvBxSCsbW7iKKRXDorPnLsugI472
         eg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718028357; x=1718633157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIJouERmppUalE0J8gICZtjFJhQ1JN77/tIkUQ2LKPE=;
        b=pTDAyKsxSwLkHIlZRImwDIBhrA24HvPjZzLp4SL/fuDNno3NSOhQWQSMpx0z3+NJfp
         6XjAUKSSMj+EbX1mR3321csrUHYLZc3ZM2LAMJdasUQZlq0PI6VDQmeRQg1YHKMwQxcE
         IlASXteE4Jk1YFel8l35H1HcuNpMI80Hx6sqlvCeWtgWyXhRi3mUiF/SYtOkuKg2ZQ2e
         Ql0O9tAuIe2/hq5zEPzjmhYx9QH16ERKsKyY95Ltpyrs4nIjkH5hos0ABNvvU4IwsiBl
         MGUwETZA160lG5Obvyc+3DA/7/FNruFAECnY8h7MON0NKPEuciaJf7zscfyAuagjuNiW
         W1ow==
X-Gm-Message-State: AOJu0YxJSDPYPf1kA2XrF9tBrXwlAnD7yjvDJQNOMopOpYpSz4DP5DrW
	jWyZUbVzAaD1NjnMdJYWCrX5o5Xrk2kAioNOpdwgopi0EI7SN5Shvv73MSbw4EY=
X-Google-Smtp-Source: AGHT+IHrdDDcymVE+Z/TLFKqIfkJKC8mz7mWvdmD88Fhip4ejOwb6y4gpPMrE5VZu6d8G7l6TDSCsg==
X-Received: by 2002:a05:600c:a42:b0:41d:d406:9416 with SMTP id 5b1f17b1804b1-42164a4ddd2mr81776455e9.34.1718028357271;
        Mon, 10 Jun 2024 07:05:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:b790:b49b:9038:8e99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42217ff4302sm11113845e9.31.2024.06.10.07.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 07:05:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH 1/3] gpio: sim: use device_match_name() instead of strcmp(dev_name(...
Date: Mon, 10 Jun 2024 16:05:46 +0200
Message-ID: <20240610140548.35358-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240610140548.35358-1-brgl@bgdev.pl>
References: <20240610140548.35358-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the dedicated helper for comparing device names against strings.
While at it: reshuffle the code a bit for less indentation.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 2ed5cbe7c8a8..278bb0c54636 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -581,19 +581,19 @@ static int gpio_sim_bus_notifier_call(struct notifier_block *nb,
 
 	snprintf(devname, sizeof(devname), "gpio-sim.%u", simdev->id);
 
-	if (strcmp(dev_name(dev), devname) == 0) {
-		if (action == BUS_NOTIFY_BOUND_DRIVER)
-			simdev->driver_bound = true;
-		else if (action == BUS_NOTIFY_DRIVER_NOT_BOUND)
-			simdev->driver_bound = false;
-		else
-			return NOTIFY_DONE;
+	if (!device_match_name(dev, devname))
+		return NOTIFY_DONE;
 
-		complete(&simdev->probe_completion);
-		return NOTIFY_OK;
-	}
+	if (action == BUS_NOTIFY_BOUND_DRIVER)
+		simdev->driver_bound = true;
+	else if (action == BUS_NOTIFY_DRIVER_NOT_BOUND)
+		simdev->driver_bound = false;
+	else
+		return NOTIFY_DONE;
 
-	return NOTIFY_DONE;
+	complete(&simdev->probe_completion);
+
+	return NOTIFY_OK;
 }
 
 static struct gpio_sim_device *to_gpio_sim_device(struct config_item *item)
-- 
2.40.1


