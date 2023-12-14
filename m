Return-Path: <linux-gpio+bounces-1450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9B9812C63
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 10:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A09F51F21892
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 09:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D8A38DC6;
	Thu, 14 Dec 2023 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYrx/Bmp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82A0106;
	Thu, 14 Dec 2023 01:59:17 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5c68da9d639so4551720a12.3;
        Thu, 14 Dec 2023 01:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702547957; x=1703152757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsNugrMTLdavqUaTzPaiiSqSEI8478i76rEA8WzTmjs=;
        b=HYrx/Bmpb0/ztK7gQIfH+pYDdKhH9068NrDelmWb32ex09PSBiCSxIns9wUk7fDv/1
         RspvSfurCi4wdMylvOMbys0w3uIKh9yhk8B3UFeB+UlAd7IrDnVokzcjWTMKPTmdWKBz
         D/H7gwu6iC/CYr7sz33A6JSLOHeg3lG7jM5/VgIc3xsc5suXY/xXY0IGle+pOQbjTuB3
         D5tBjphS9sK2oXV444Xpg7Petn+Gjldm9f6LTI3jaTtBE1+lsuEJC4cV7D4SUDs5QeMW
         52PULRB40T9eKsfisxhToW7phjzkswYhfoofI0kWjOg4zi9SEK5WZdV67mxgHRp7hYE8
         Y/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702547957; x=1703152757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsNugrMTLdavqUaTzPaiiSqSEI8478i76rEA8WzTmjs=;
        b=IE1JGUxFWR3yqK6p74fNvJRi/BDmnliCW0+7CHDXBwx8yoj1hoWZBL66LDSDHdwdYy
         FO8HSsJOSkwJLUi3iQCbpFwwaVKeegTr2+Arbakx4xiuFw93LMZZXlqz9oeVFqvbFZlX
         8QXBE02f+OMA7ZLwMQlz0fM259mvYySydGvmYYvwYVA+mTYkFo/CogAnHBWd03aqAfYf
         bFUSAa6hR2HSRSdM+6mVPsf2UK64n69n5B9xUhmjXnLmb7dKoEGKcsPnCM2XRXkVjUvt
         S+1yEMHPpViN2TQ6JXFZWau51peAN7a5R5NwNOtz5zETkKmMt7d/alVK6nJ34M/bcVjU
         rdFg==
X-Gm-Message-State: AOJu0Ywt1NqzglXG1C3z8gKq3ydS/62GSIzoOWbevv4vcIB6eySUvyTE
	np6KUevDwX1pqxn1a6lBmxbR+ed6+b4=
X-Google-Smtp-Source: AGHT+IGM+QUj5jfgwYUikQjoJ+FGUpcrZqFUvb0379eV8vCZ5ZbYeawfXIyV7Ry/FZdckig20vHtcQ==
X-Received: by 2002:a17:902:c40a:b0:1cf:c37f:7158 with SMTP id k10-20020a170902c40a00b001cfc37f7158mr5879146plk.23.1702547956967;
        Thu, 14 Dec 2023 01:59:16 -0800 (PST)
Received: from rigel.home.arpa (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id r2-20020a1709028bc200b001bc6e6069a6sm922807plo.122.2023.12.14.01.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:59:16 -0800 (PST)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	andy@kernel.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 5/5] gpiolib: cdev: improve documentation of get/set values
Date: Thu, 14 Dec 2023 17:58:14 +0800
Message-Id: <20231214095814.132400-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214095814.132400-1-warthog618@gmail.com>
References: <20231214095814.132400-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation of the algorithm used to perform scatter/gather
of the requested lines and values in linereq_get_values() and
linereq_set_values_unlocked() to improve maintainability.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 73262305de0f..27cfed748b0a 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1391,9 +1391,18 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
 	if (copy_from_user(&lv, ip, sizeof(lv)))
 		return -EFAULT;
 
+	/*
+	 * gpiod_get_array_value_complex() requires compacted desc and val
+	 * arrays, rather than the sparse ones in lv.
+	 * Calculation of num_get and construction of the desc array is
+	 * optimized to avoid allocation for the desc array for the common
+	 * num_get == 1 case.
+	 */
+	/* scan requested lines to calculate the subset to get */
 	for (num_get = 0, i = 0; i < lr->num_lines; i++) {
 		if (lv.mask & BIT_ULL(i)) {
 			num_get++;
+			/* capture desc for the num_get == 1 case */
 			descs = &lr->lines[i].desc;
 		}
 	}
@@ -1402,6 +1411,7 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
 		return -EINVAL;
 
 	if (num_get != 1) {
+		/* build compacted desc array */
 		descs = kmalloc_array(num_get, sizeof(*descs), GFP_KERNEL);
 		if (!descs)
 			return -ENOMEM;
@@ -1422,6 +1432,7 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
 
 	lv.bits = 0;
 	for (didx = 0, i = 0; i < lr->num_lines; i++) {
+		/* unpack compacted vals for the response */
 		if (lv.mask & BIT_ULL(i)) {
 			if (lr->lines[i].sw_debounced)
 				val = debounced_value(&lr->lines[i]);
@@ -1447,14 +1458,25 @@ static long linereq_set_values_unlocked(struct linereq *lr,
 	unsigned int i, didx, num_set;
 	int ret;
 
+	/*
+	 * gpiod_set_array_value_complex() requires compacted desc and val
+	 * arrays, rather than the sparse ones in lv.
+	 * Calculation of num_set and construction of the descs and vals arrays
+	 * is optimized to minimize scanning the lv->mask, and to avoid
+	 * allocation for the desc array for the common num_set == 1 case.
+	 */
 	bitmap_zero(vals, GPIO_V2_LINES_MAX);
+	/* scan requested lines to determine the subset to be set */
 	for (num_set = 0, i = 0; i < lr->num_lines; i++) {
 		if (lv->mask & BIT_ULL(i)) {
+			/* setting inputs is not allowed */
 			if (!test_bit(FLAG_IS_OUT, &lr->lines[i].desc->flags))
 				return -EPERM;
+			/* add to compacted values */
 			if (lv->bits & BIT_ULL(i))
 				__set_bit(num_set, vals);
 			num_set++;
+			/* capture desc for the num_set == 1 case */
 			descs = &lr->lines[i].desc;
 		}
 	}
@@ -1462,7 +1484,7 @@ static long linereq_set_values_unlocked(struct linereq *lr,
 		return -EINVAL;
 
 	if (num_set != 1) {
-		/* build compacted desc array and values */
+		/* build compacted desc array */
 		descs = kmalloc_array(num_set, sizeof(*descs), GFP_KERNEL);
 		if (!descs)
 			return -ENOMEM;
-- 
2.39.2


