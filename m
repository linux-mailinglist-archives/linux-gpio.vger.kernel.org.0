Return-Path: <linux-gpio+bounces-10456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1A4987528
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 16:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B15141F229BF
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 14:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A74413AA2F;
	Thu, 26 Sep 2024 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbC2cbbP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2173B26296;
	Thu, 26 Sep 2024 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727359876; cv=none; b=f+5HPd0UxJxwVAux/lfSKzJFsjjTFhRIz+Sw1w0AWB9MAN82HugmKL1yQWENikAL+3XyEh+6fNcK4Hyu7595h8lX0MLtT+asGubs1y+7Duei6gR3RReK68ui6/dm8t8M8ICRNJjd9c2Q8QQvKxYhw/VJQyyZ4Q0WpBFgDnR4w4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727359876; c=relaxed/simple;
	bh=3NBSLNAD/+ojKnJ5pQmRk9ldNBXAqFRP1dQG8BuQ8kI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ywpbhbzc+hECtiq9kZMCQI80BrObE/VXz1cah7WMz4i9HmtsMUhetmcd+zitOiwlu+GHAgwfaQSJDqR3L6C3ImlEMfek1clMPna4BaLJPyJWihFNWq1xUrAEdOY/Nv+BKauw3xKrAdG6NFB22J3amTQKsXM8Nz2N+DQW6FHeZVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbC2cbbP; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f8ca33ef19so14344791fa.2;
        Thu, 26 Sep 2024 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727359873; x=1727964673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EG/C0RZisI0kve4A+qyt5M04d7snwIymh4dP7TfgG14=;
        b=EbC2cbbPOUoJUBBtxJFx8Y2Ij1Eq27LKYhloKlG53k55pIymWuQPA5YcT0bLD4FaKp
         +VeNRCEDoKxPVamWLMtvNzKI2bRCXR6bXcCkP+6G0HOJfLVqa9/vwEZeR39lvZhC1O4N
         fwtJ1P6ijjDddzPXSjPkK1FV9svqnJKRHEQ9bbUBi/urOpSDrGZG0YqAJVXEHrybHFrg
         vFtNapaSn37RWpJXT1wD08c51uKT6OCyfBlzYo4GJ1zRQs3AZ4SlqGa69Pqdj/iS++88
         GLYDqF8cA5XhtF4qB8//DrXeD2lXIA4w0Odk8NdcGoqS062l4Y7f7afi5DFTQ+o7PnzS
         2yIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727359873; x=1727964673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EG/C0RZisI0kve4A+qyt5M04d7snwIymh4dP7TfgG14=;
        b=Nuf5lwik4q2ncb2jIHqD96CobR19+Lus1v9A+qF30Iuxed/0l+dl8jysNiS5gLP/PC
         Y/nQirBO0KxW10vmWEeMRc9tOMgoCFEFROijP0KZyFHbGY4IVxLw0cutGxFv7TQV0p+c
         f6+opF9VImxuYNtCYflZAU+8HYRwUW4pVP34E0CR4TIZ1i5sQD1rJVPuU4dSUwsGer83
         j/kndAqeB+WWhYWJZIVg6yD4TORmzT1xM7Ji+UNIPmSlOiuL7JlciD9YFb6JXoSal73O
         BhyLJJwyjKEEiIs+V7I1KCijeyQJKAT8tCsCqoZ4zV133WvCU6S7lLNdP0C28mkOgHTL
         l1LA==
X-Forwarded-Encrypted: i=1; AJvYcCWHeo9e0WRKkUPfI+GaXRvMKU3WY0YcF9f/VcMOZY3bigvV2180PpPJCVrIzW5FI5khh3QkQp1w@vger.kernel.org, AJvYcCWt1M4Pft6fyd2yIXx7IayDlz60HopKFrgI6RYKpnl1gT2l8K4yFeB2I8YmlPr3Ev925HSKM83+pLnQtcBr@vger.kernel.org, AJvYcCXy2t/uI/qNr2Vt+kFE3q0AELwBW3qJBLQB75+WxZmAkCSZSIoMruzd5SMegIBmF8Al5PneActdVgmd@vger.kernel.org
X-Gm-Message-State: AOJu0YzyKKFw3/1g+ldZoaGRmZz0882sScspzgIq9NQE5aLy2mwjXxhn
	rmnEiftqiHLKdVWCyxq0sw1pCVHaKgKLtuxFEEwwDVOOBk/9EyBR
X-Google-Smtp-Source: AGHT+IG9SmnyKcHgvqYpMAp/EjtBHQMErDyxgQ1ZeOAEppnV5SKOoxwSn1V72l8GXYGKnb5gRVE6Lg==
X-Received: by 2002:a05:651c:2126:b0:2f7:94d9:426a with SMTP id 38308e7fff4ca-2f91507e2fdmr66456391fa.5.1727359872854;
        Thu, 26 Sep 2024 07:11:12 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-4e5f-6907-08e4-04ed.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:4e5f:6907:8e4:4ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27776cesm2498866b.40.2024.09.26.07.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:11:12 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 26 Sep 2024 16:11:02 +0200
Subject: [PATCH 1/2] pinctrl: intel: platform: fix error path in
 device_for_each_child_node()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-intel-pinctrl-platform-scoped-v1-1-5ee4c936eea3@gmail.com>
References: <20240926-intel-pinctrl-platform-scoped-v1-0-5ee4c936eea3@gmail.com>
In-Reply-To: <20240926-intel-pinctrl-platform-scoped-v1-0-5ee4c936eea3@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727359869; l=1737;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=3NBSLNAD/+ojKnJ5pQmRk9ldNBXAqFRP1dQG8BuQ8kI=;
 b=ANAJduCwLj7wrhGnQqFzOnJ8YgpqYLUTWFKuP8lWpi0Q5NmIWSBiNVy6U7C6f68rx2CMe9M7+
 CmPNDYY4HHgC9kiW0bUZhs7FyUIe5rYi5lSkPy1LGKpszSQzrmJaxB8
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The device_for_each_child_node() loop requires calls to
fwnode_handle_put() upon early returns to decrement the refcount of
the child node and avoid leaking memory if that error path is triggered.

There is one early returns within that loop in
intel_platform_pinctrl_prepare_community(), but fwnode_handle_put() is
missing.

Instead of adding the missing call, the scoped version of the loop can
be used to simplify the code and avoid mistakes in the future if new
early returns are added, as the child node is only used for parsing, and
it is never assigned.

Cc: stable@vger.kernel.org
Fixes: c5860e4a2737 ("pinctrl: intel: Add a generic Intel pin control platform driver")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-intel-platform.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel-platform.c b/drivers/pinctrl/intel/pinctrl-intel-platform.c
index 4a19ab3b4ba7..2d5ba8278fb9 100644
--- a/drivers/pinctrl/intel/pinctrl-intel-platform.c
+++ b/drivers/pinctrl/intel/pinctrl-intel-platform.c
@@ -90,7 +90,6 @@ static int intel_platform_pinctrl_prepare_community(struct device *dev,
 						    struct intel_community *community,
 						    struct intel_platform_pins *pins)
 {
-	struct fwnode_handle *child;
 	struct intel_padgroup *gpps;
 	unsigned int group;
 	size_t ngpps;
@@ -131,7 +130,7 @@ static int intel_platform_pinctrl_prepare_community(struct device *dev,
 		return -ENOMEM;
 
 	group = 0;
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct intel_padgroup *gpp = &gpps[group];
 
 		gpp->reg_num = group;

-- 
2.43.0


