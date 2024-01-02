Return-Path: <linux-gpio+bounces-1963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D2C821F1A
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 17:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 934E41F22AB7
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 16:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03A314F9F;
	Tue,  2 Jan 2024 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZVJl1vpI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB6014F6E
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jan 2024 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40d8909a6feso14998175e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2024 07:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704211196; x=1704815996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2esXyx5UxoOKpIF+VnQ6ASTzOMASqrG8+CTbzdc5ia0=;
        b=ZVJl1vpIC1Dkqy4CjWJ4VibUTVzS7tUNHY6MU70rkwr6SM1vw5pRiC5ecHO19R9e9Q
         MO+sePdzIm1zQYnqmHoYJkf1K1a3/UOoBtjVcxE1OBmhG+t3lZYpmLWzbdXo8YVH1F0a
         u0aLLOzthTcnlQxTy6hJxvy1wn78e/oDRjbTYJgpFCHiIxYQrQrzmTnPo4J5sNrRaX6F
         9b4ubW5JOaU9xlhvhhImOpMsYAiwc5TSfp9p62Cjs+4y52gmL4SxeC8Dj+p54SPCAdlD
         lSfBGVVv6f5vSvK8SoyzTCoZuwaGYzRreXiWD1wCk6w/GHAwqBT9cdQpq0mUsmdYWwmI
         bT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704211196; x=1704815996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2esXyx5UxoOKpIF+VnQ6ASTzOMASqrG8+CTbzdc5ia0=;
        b=JuOVeJD9PhQh+te1VEQDT2FqZ+0qUHoaCEvmJFFyYTAF3aGjZ86tW/5byv57aiGcYk
         s9/HauRKhEG1P9Tt7wuibbk4AZWedrXkX++LBKxi9ETnACxfb/omNdVTRkJYflrn0Zn+
         vXMdJCcpVUfK3vrNuGkzR9Aaf1y6tIi3MCjqZVPAeaTHoxx2M/kxQ5On0UQDIFh8US0H
         erHcCVVPdq7oOeRhdNEKrvdYNCBVIIYjf6sChfqGZUrGXEYt6fL2c9eszBFlrp/IBKwU
         LbjPCm5c9JkPBCyyapfEaDUiOvPHV2YNhtxGEMuOuvbq+CAcjKap+Kf5W5NgfV/sZ1a4
         MfMQ==
X-Gm-Message-State: AOJu0YxySOqZC0z1Nt5/2GTYbVl/tuv6Hax5L/58TlV6pxzCDbDBP/sM
	r86rGGXP/UpPqO7Z20Io0sy//UETw/1l8w==
X-Google-Smtp-Source: AGHT+IFO77LNRULmeuWq25wUmGax3n6DQ0q75MvHESGBQmOGpnwFvSFCxOj3OOkj+FeMCQjM1CDgpw==
X-Received: by 2002:a05:600c:28b:b0:40c:6eda:9260 with SMTP id 11-20020a05600c028b00b0040c6eda9260mr6544470wmk.56.1704211196193;
        Tue, 02 Jan 2024 07:59:56 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f51:fa47:f00a:a53c])
        by smtp.gmail.com with ESMTPSA id u14-20020a05600c138e00b0040d62f97e3csm20556641wmf.10.2024.01.02.07.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 07:59:55 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 3/3] gpiolib: pin GPIO devices in place during descriptor lookup
Date: Tue,  2 Jan 2024 16:59:49 +0100
Message-Id: <20240102155949.73434-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240102155949.73434-1-brgl@bgdev.pl>
References: <20240102155949.73434-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's time between when we locate the relevant descriptor during
lookup and when we actually take the reference to its parent GPIO
device where - if the GPIO device in question is removed - we'll end up
with a dangling pointer to freed memory. Make sure devices cannot be
removed until we hold a new reference to the device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4c93cf73a826..be57f8d6aeae 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4134,27 +4134,33 @@ static struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 	struct gpio_desc *desc;
 	int ret;
 
-	desc = gpiod_find_by_fwnode(fwnode, consumer, con_id, idx, &flags, &lookupflags);
-	if (gpiod_not_found(desc) && platform_lookup_allowed) {
+	scoped_guard(rwsem_read, &gpio_devices_sem) {
+		desc = gpiod_find_by_fwnode(fwnode, consumer, con_id, idx,
+					    &flags, &lookupflags);
+		if (gpiod_not_found(desc) && platform_lookup_allowed) {
+			/*
+			 * Either we are not using DT or ACPI, or their lookup
+			 * did not return a result. In that case, use platform
+			 * lookup as a fallback.
+			 */
+			dev_dbg(consumer,
+				"using lookup tables for GPIO lookup\n");
+			desc = gpiod_find(consumer, con_id, idx, &lookupflags);
+		}
+
+		if (IS_ERR(desc)) {
+			dev_dbg(consumer, "No GPIO consumer %s found\n",
+				con_id);
+			return desc;
+		}
+
 		/*
-		 * Either we are not using DT or ACPI, or their lookup did not
-		 * return a result. In that case, use platform lookup as a
-		 * fallback.
+		 * If a connection label was passed use that, else attempt to
+		 * use the device name as label
 		 */
-		dev_dbg(consumer, "using lookup tables for GPIO lookup\n");
-		desc = gpiod_find(consumer, con_id, idx, &lookupflags);
+		ret = gpiod_request(desc, label);
 	}
 
-	if (IS_ERR(desc)) {
-		dev_dbg(consumer, "No GPIO consumer %s found\n", con_id);
-		return desc;
-	}
-
-	/*
-	 * If a connection label was passed use that, else attempt to use
-	 * the device name as label
-	 */
-	ret = gpiod_request(desc, label);
 	if (ret) {
 		if (!(ret == -EBUSY && flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
 			return ERR_PTR(ret);
-- 
2.40.1


