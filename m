Return-Path: <linux-gpio+bounces-30761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B077BD3C262
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 09:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F23C5E0151
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 08:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554393BF30D;
	Tue, 20 Jan 2026 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QM6kXlGN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45263B95F2
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 08:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768896463; cv=none; b=KRQwLaSJIuuHhwBf494GrGvXIQnDSAuxGPtahRv3/ISgWdWk8pdHT6t1X1/5iw9I03YoDkmbGcci5eqN9Hnos7PKcKB+z4ueX374/mztsu0nkkO+jxuY6dOLQwVZfJlfBWyTWz9dAAtMjs5YMTWIcvY78RlT04xv6hphl5a5W5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768896463; c=relaxed/simple;
	bh=8cXCHWqSFqAhb/0yrvwMCQYeAmlW3lL6PDpwp+nTw6c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J5ClcEnjH7ekxPfFv4ZWwF33H/ZTwYBEhoxmCIPRpHIPu3EjVGwn+FucAC6kI4oLhd9KiNJI/CIwmestX7rDvd0bbCPCyXxXlSpwqo+0CcwblcN0BaTcWo61FcZkEXQdzPTArZ2A94zpkG+A5mPX0/x7HKTBsdKUv5eh0qZQc3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QM6kXlGN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a110548cdeso33772015ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 00:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768896461; x=1769501261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Syo4ZZwZwDuvqR8s7EAD3Gw1DEsI3pVtXVpUzZjtTyk=;
        b=QM6kXlGNHluP18bDdUqkPr6aIDZEMXEPsLo7AHiBVPYJtXwmoAQb25suvpxtNBUeJ0
         iwMo6g0UIHqpo/ax/YF/xeXqUh8eQWTOAopuCXCIagmapi3i0oYNVdcTsXUYAHjlhfOw
         rTwVNoVrgGJI9IaW0IQwXuwzQyCAV7VXSl/1o9riXmpch0rSnMQIoMM+LDJW20nTfLg5
         L2JMGD9lQNZaUQt3Y2RJ7STtbew6LOtf2IntTa4FmZx2CG/FcJOWFE8g4JldsuC44f7O
         Z1ZVU+J7DH3oZALfybJmJsLTqEviVOk2PHhKdzxUhiVweL9UT+iLwvU7z5+J/98NMAAZ
         mJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768896461; x=1769501261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Syo4ZZwZwDuvqR8s7EAD3Gw1DEsI3pVtXVpUzZjtTyk=;
        b=JMQRwle7OD8fbuIDxfdbllE6SxmgI257AvukZqj6NjFfGxm3rNi8wzoxV5wxUlqX57
         B6LRn2nthDm7U+OIcKicQ7b93qugOHr9CDiSSFYbs3I0W+kGNlzUwxLOTPcHPMMOHoJb
         x9he0ooh69brfTLGI5IDFfLPreBt5u4uhPXobfbFfC3bA7qy/iYm4Db/6AjX/RZydm4e
         3D9jrW2pIJhswtWpwpPgUlYU6MqfB2dLGpStVwfc/HwVufQj/CBlD6laJXy+i7bOGDZP
         g8LXlNSeK3xcgyatRTaLh+cfO9fQtqUu6MP6UcsEM060/cIsiIG6BM0h0XSO0U9GcKae
         McVg==
X-Gm-Message-State: AOJu0YwmFGwY8ZFOxEMN1Lei3nljyVKFQ1do2HJsgNDEqVFelXW7h7Xa
	IEyMmcV6j42J+a0tVvByvJ9tbMmZFU/ou49dlIKplIdefkHbKIsy4XU2
X-Gm-Gg: AZuq6aJI/j7Q78h/jQIFPBZLEYulbsTc7EK3OyZHhv6pyiBRxh7FPSnFTU4aXKm2eVD
	DDTtSVi8H/HfluvbbxdcMkMbaDlog2+6+XdElNhpHJJhEFQrPYgqW6f97JS31fPi2qzPrckv+S2
	2J09cIMmTxGGhdikAgF3q8gTTmSaVLsb4ynCdeefdhSv+vdEn4jN7P9cocFncfo289jGJ4HiNfS
	mRLP42M7AydZ8+QrVWOOY9d5KYl0+qr7zSnKnVftLQ4sA5MH1OA6iLb3OQTmnYxtK3c4u0OxfP4
	A77KVcsHwWIcDzOrM9mAAM0l8jJei8/YMBRAxCTAfrhyPdACp8M4hNyalFRtPUBEwJE7sMyR4jH
	c3CKK14X2GaU2osamrZ7x/87PLfAp3wQZrybjoHXQ8pFLUsDNPPpOGnt0Ka3zWu4Vz0/rvZhX8M
	HCUbFnBKXmG4cW+nKn9Y7obRtheVbkFZG0N0ikw+zuZ7tF32Zwt1PMm4DNgHMxNiNo1Xe7lyrqy
	R9sdOOk+gtFpyjUA6nG6aY39bPSWc4D81+loLvd9TiezQ==
X-Received: by 2002:a17:902:f544:b0:2a0:ba6d:d0ff with SMTP id d9443c01a7336-2a717533f7fmr123178715ad.16.1768896460959;
        Tue, 20 Jan 2026 00:07:40 -0800 (PST)
Received: from 8d75dc141a66.ap-southeast-2.compute.internal (ec2-54-252-206-51.ap-southeast-2.compute.amazonaws.com. [54.252.206.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193decfcsm115731655ad.60.2026.01.20.00.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:07:40 -0800 (PST)
From: Wei Li <unsw.weili@gmail.com>
To: tony@atomide.com,
	haojian.zhuang@linaro.org,
	linusw@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Li <unsw.weili@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: single: fix refcount leak in pcs_add_gpio_func()
Date: Tue, 20 Jan 2026 08:07:35 +0000
Message-Id: <20260120080735.548853-1-unsw.weili@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_parse_phandle_with_args() returns a device_node pointer with refcount
incremented in gpiospec.np. The loop iterates through all phandles but
never releases the reference, causing a refcount leak on each iteration.

Add of_node_put() calls to release the reference after extracting the
needed arguments and on the error path when devm_kzalloc() fails.

This bug was detected by our static analysis tool and verified by my
code review.

Fixes: a1a277eb76b3 ("pinctrl: single: create new gpio function range")
Cc: stable@vger.kernel.org
Signed-off-by: Wei Li <unsw.weili@gmail.com>
---
 drivers/pinctrl/pinctrl-single.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 998f23d6c3179..d85e6c1f63218 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1359,6 +1359,7 @@ static int pcs_add_gpio_func(struct device_node *node, struct pcs_device *pcs)
 		}
 		range = devm_kzalloc(pcs->dev, sizeof(*range), GFP_KERNEL);
 		if (!range) {
+			of_node_put(gpiospec.np);
 			ret = -ENOMEM;
 			break;
 		}
@@ -1368,6 +1369,7 @@ static int pcs_add_gpio_func(struct device_node *node, struct pcs_device *pcs)
 		mutex_lock(&pcs->mutex);
 		list_add_tail(&range->node, &pcs->gpiofuncs);
 		mutex_unlock(&pcs->mutex);
+		of_node_put(gpiospec.np);
 	}
 	return ret;
 }
-- 
2.34.1


