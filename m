Return-Path: <linux-gpio+bounces-3676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C9E860AFE
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 07:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96BD61C224FA
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 06:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B3012E45;
	Fri, 23 Feb 2024 06:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lc40NOQw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7AE12B84
	for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 06:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708671178; cv=none; b=YJNPghKPUnIfC9DVeBKGMgDyoAHInC7g2OJPx5xzW4iLiybB/PVlxqzCthskWB/b1w9cC/4SALlcvw5/xuPgmu72VnqoQFimU2n212NmvDDtf2uiiAQZBjsvMlmo9KVeambtln9Wjm1tDoez2MZQqXxbR0EJxaHa/gqiGhube78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708671178; c=relaxed/simple;
	bh=LIf7/UyiE55q8WBoINf1R7JpFbQ0n7ltteZEC2U4/sU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CLU1yJMXv2yNPnijh1zsbLQIEXlo7zA104Li7NAW/KNM6YstyJ4wMBvcAQFCtSXlzW8mtoUB2foP0al0ntd3L9Z843fmZJGSa3cOExiQNcHI+z+4WBOWVtxJA6Szp8DdkkKK0nflW3wlIEqf284nkm7GB/mvEML3FprC54EIMxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lc40NOQw; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e45d0c9676so25587b3a.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 22:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708671176; x=1709275976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4gjzC9xBa8ids+ZwVlsrtDEaW20Z5hUGx3X+FKF8NKY=;
        b=Lc40NOQwHbtFQq8tE74Wk8JUd52KLsfq1BMS4+Xu3o4KaDnTDg8qsjy1QxZUacd0ig
         mfurb6Tr0BJrECKFVXhKO2WIRMmfaYFsYII2ouyIDllGh2XbnW9B8xvM+K3Gk2sF1Dw6
         MqIVQ83FCX/53MMwym13+hyVgkCcSfHW8Pths=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708671176; x=1709275976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gjzC9xBa8ids+ZwVlsrtDEaW20Z5hUGx3X+FKF8NKY=;
        b=fAwGXh5zk5sqE7+wy/2f7xNyO87Hjf0Q/QFk0Adunz9QxOJhnsKzhZ6bQ6zN8IXkvV
         kHTzlXWZYE0IjNjmru6aZEeE0eBBfHctuGvPKlJPnvv7PuzfM+HmPGCepbUfcJSBBf5n
         FCqnNj6n5o1L9bqT5WBK2PpapzUNK2qLBVIrO9/ZD58LR/au5g8RNbJdWJOwhhrZv/Bt
         k1k769iMzdwOsSm3lZPVpPM3y6xPGD0uatGWJ/RrlRGROYnYf0JIVf1DQd4vZH7IA9Jy
         XUqlW+wQxL9hq+vTTcyWtuSneOgYMwJKZKjC7aXaFtNT8hQPdzej7HCRJaKHWOjxWGu/
         r1iw==
X-Forwarded-Encrypted: i=1; AJvYcCXFyRVOutFb+z17Dd1kGAA1gHw2D50Q4yCxX7SJk+12f3rcRWvFKX0aMeqh44WD2YztjRyPJcAHEPBMQg+zxNF1WcXfM60avdd0tw==
X-Gm-Message-State: AOJu0YwUvInyLe9h4GvaXriAscmawA1RzBOeBEMwp25/98LhfQG0Bz6O
	BWhYKgu1xz0tyILHxIIiJngA54Jt0MQJSjrhLwIeruXTmItRHwXnb/C06DpV3Q==
X-Google-Smtp-Source: AGHT+IHlR5+CoNwE9VM1shWvRZnE7a1WH2TFVG3mmZ38R/O/bus+HV20LdXYzOWaJPORoTFS8y80qw==
X-Received: by 2002:a05:6a20:c90d:b0:1a0:85ed:4769 with SMTP id gx13-20020a056a20c90d00b001a085ed4769mr1660947pzb.11.1708671176002;
        Thu, 22 Feb 2024 22:52:56 -0800 (PST)
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id i5-20020a639d05000000b005dc4829d0e1sm11651599pgd.85.2024.02.22.22.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 22:52:55 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2] gpiolib: Pass consumer device through to core in devm_fwnode_gpiod_get_index()
Date: Thu, 22 Feb 2024 22:52:53 -0800
Message-ID: <20240223065254.3795204-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This devm API takes a consumer device as an argument to setup the devm
action, but throws it away when calling further into gpiolib. This leads
to odd debug messages like this:

 (NULL device *): using DT '/gpio-keys/switch-pen-insert' for '(null)' GPIO lookup

Let's pass the consumer device down, by directly calling what
fwnode_gpiod_get_index() calls but pass the device used for devm. This
changes the message to look like this instead:

 gpio-keys gpio-keys: using DT '/gpio-keys/switch-pen-insert' for '(null)' GPIO lookup

Note that callers of fwnode_gpiod_get_index() will still see the NULL
device pointer debug message, but there's not much we can do about that
because the API doesn't take a struct device.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Fixes: 8eb1f71e7acc ("gpiolib: consolidate GPIO lookups")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes from v1 (https://lore.kernel.org/r/20240221015920.676063-1-swboyd@chromium.org):
 * Rebased onto gpio/for-next

 drivers/gpio/gpiolib-devres.c |  2 +-
 drivers/gpio/gpiolib.c        | 14 +++++++-------
 drivers/gpio/gpiolib.h        |  8 ++++++++
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index fe9ce6b19f15..4987e62dcb3d 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -158,7 +158,7 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 	if (!dr)
 		return ERR_PTR(-ENOMEM);
 
-	desc = fwnode_gpiod_get_index(fwnode, con_id, index, flags, label);
+	desc = gpiod_find_and_request(dev, fwnode, con_id, index, flags, label, false);
 	if (IS_ERR(desc)) {
 		devres_free(dr);
 		return desc;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3c22920bd201..cff4ac2403a5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4187,13 +4187,13 @@ static struct gpio_desc *gpiod_find_by_fwnode(struct fwnode_handle *fwnode,
 	return desc;
 }
 
-static struct gpio_desc *gpiod_find_and_request(struct device *consumer,
-						struct fwnode_handle *fwnode,
-						const char *con_id,
-						unsigned int idx,
-						enum gpiod_flags flags,
-						const char *label,
-						bool platform_lookup_allowed)
+struct gpio_desc *gpiod_find_and_request(struct device *consumer,
+					 struct fwnode_handle *fwnode,
+					 const char *con_id,
+					 unsigned int idx,
+					 enum gpiod_flags flags,
+					 const char *label,
+					 bool platform_lookup_allowed)
 {
 	unsigned long lookupflags = GPIO_LOOKUP_FLAGS_DEFAULT;
 	/*
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index ada36aa0f81a..f67d5991ab1c 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -223,6 +223,14 @@ static inline int gpiod_request_user(struct gpio_desc *desc, const char *label)
 	return ret;
 }
 
+struct gpio_desc *gpiod_find_and_request(struct device *consumer,
+					 struct fwnode_handle *fwnode,
+					 const char *con_id,
+					 unsigned int idx,
+					 enum gpiod_flags flags,
+					 const char *label,
+					 bool platform_lookup_allowed);
+
 int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 		unsigned long lflags, enum gpiod_flags dflags);
 int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce);

base-commit: 36e44186e0badfda499b65d4462c49783bf92314
-- 
https://chromeos.dev


