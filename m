Return-Path: <linux-gpio+bounces-3535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E78085CDA2
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 02:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB4CBB22120
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 01:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997EF6FAE;
	Wed, 21 Feb 2024 01:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b3LiKBLX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA5C5666
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 01:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708480765; cv=none; b=YhmTixNTjEZDrNCMNy7kqXsleeTlxxNoRBDguj2fUZFNjkrLh9/jAq0lw4liKS/Wbg4RsNbRfl+uAEHw8rlEICNlY10maadSWi9JpsMiNkCbwZlhiqId1Rq2AXgXmeznT+QMOcZS1oHZzzgT0y+tqXnV9aTFSHo2/AeggaYacGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708480765; c=relaxed/simple;
	bh=Yy/8YwI1NXHNFY4dyp+Ak0PqgCVjvM91BpGs203MyMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oaeeOP/g/Ft6C4xXZ/5mdGFyQnfhxq7B9QRMT5qLRWMBXARUb8O/hQL/0GiiCDwQ+c7o2OO2pdEeOvmtWTP5iOEagBvm2Mn9GLMbRWyHFb6IKCyORaHs5xr00sGuph/AWP/Z7V054ULWfUBNfbggDDj4ZW4XC/wjolp63qL2lxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b3LiKBLX; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d94323d547so45435285ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 17:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708480763; x=1709085563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mhVd93tz1AXwUEn+kfLstiE+RXrMZSMseSHUIcWvQmI=;
        b=b3LiKBLXvNiUpzQDbyi64eqC/a6YswpAASv42iFVhf8q4tPATJUxBSbGcKgxH4ttWD
         6koVDFjzjBCkosoQ0RBZVwP8v0xXAL/oTCX8BS/ezURFLFXMdtKy0pxxIeiwrrGP35r9
         OyD1Gt5aNdvI38kXSXV8JQkl31Qy00/PkL0W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708480763; x=1709085563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhVd93tz1AXwUEn+kfLstiE+RXrMZSMseSHUIcWvQmI=;
        b=XhMUM3cA8H0t+EXueGHZjIvaUMAnws4RnrY62ElGnYan6nRoa0Md35VbJqehGQ8WyH
         pr+EzjMTEkxfM08yGMYxSZtZxBYnY3BP/CP1Irz/7EmGtFM/rr/C15QbfLne+iSTozge
         Fr/BLwvUO9rB6MUSC7V5BjzFoW1gbNo+OAvMzjZSBvPFsNaXLUZPD/VVsXvtV0rLZX75
         SOKR7godUZlS8s1GJDR8a34HFUJF7M7/nA/ibHga+xJvbYbgdd3RdEcRf7Ljvb0VvpD2
         866A8hWWpBSERCl+ULeb8pZpVpKbzXkonrQ2C7HYoePYecAkZ0Qi+TUwjkEUaTcqViRJ
         f1wg==
X-Forwarded-Encrypted: i=1; AJvYcCUXmt6Oeg4g8F6LOEgJ1Sqr2B/bNq7EpdLswnZXGCnx8wCY+BpitZN5kkAMFT0v/ulpDJV9Diw7MB7BeiZrbc8HvNFIkAEmEFm12Q==
X-Gm-Message-State: AOJu0YwCacrsBvP6smYES2X9SxVkU1SM5G7Mgfpn7GGDFeF8QwXhPuBM
	rn4KS63MaIuPQFig4viHOW9pYDN6XHNzWuiCiG3hGJRZRMgzbqKrEebXSSpVqw==
X-Google-Smtp-Source: AGHT+IEVghrs6OTtT15OvGzhJzUuN8xWMbAKOn5u3u4aHZ8RPX6YQRHSxH1BHaJmaFKEDlN52VLlkg==
X-Received: by 2002:a17:902:ea06:b0:1dc:30f2:6864 with SMTP id s6-20020a170902ea0600b001dc30f26864mr199733plg.23.1708480763218;
        Tue, 20 Feb 2024 17:59:23 -0800 (PST)
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id p3-20020a170902c70300b001db86c48221sm6908476plp.22.2024.02.20.17.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 17:59:22 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] gpiolib: Pass consumer device through to core in devm_fwnode_gpiod_get_index()
Date: Tue, 20 Feb 2024 17:59:18 -0800
Message-ID: <20240221015920.676063-1-swboyd@chromium.org>
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
index 44c8f5743a24..c6667a887ecb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4133,13 +4133,13 @@ static struct gpio_desc *gpiod_find_by_fwnode(struct fwnode_handle *fwnode,
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
 	struct gpio_desc *desc;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index a4a2520b5f31..c6e5fb9aa212 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -202,6 +202,14 @@ static inline int gpiod_request_user(struct gpio_desc *desc, const char *label)
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

base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
-- 
https://chromeos.dev


