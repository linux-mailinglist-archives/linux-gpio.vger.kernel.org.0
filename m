Return-Path: <linux-gpio+bounces-10807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 756FF98F927
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 23:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B074C1C2129A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 21:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B1F1AAE11;
	Thu,  3 Oct 2024 21:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRlqLShW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4C617C77;
	Thu,  3 Oct 2024 21:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727992070; cv=none; b=Je9Ar6wNMBSD2Zu6XZikkkd1JnS8MGlYYLcoWhBXZfKMdJ81nIRKhjgxdzP0cvcYePNAGDKuiJ3bex4Ov2kxJuii1o2AkuojS8trVRWE1tdeX1HJ8Kp5Vi21cUOkKtRRDJJF4FTpaSeVbyhqpQ2RTMg7QQWkjmNcXWuiQsXV93k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727992070; c=relaxed/simple;
	bh=Cmq5eIfd7dF2DBNe1zh0om/nxF2DZ5dPEnATH7OPjMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mTEhjyxv+ixm8aZhmwINtzRKOEj8ayzK24nBzh2ZchMBa5Wn5xDargsmZyoKSs5Dezh4jzXdK9scmrOZg+/+Fn5df5LHDmUH02+neR8VFAaiHP4WxyPxIauv6xGkZVAs/7a8cq2B1K6CUjlEHJGhmkQoF10AMV+MlP03aQIj7Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRlqLShW; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso1002792a12.0;
        Thu, 03 Oct 2024 14:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992068; x=1728596868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NpKhnrCiToOYHN1pw+7+JMdclUxzZsmOklrrm50ukd0=;
        b=gRlqLShWdLL/y4+BPW3Q+uMPFSgBRzKPfDtUfLApa5Z2T9NJUV33/CIrUOuJ3ITBlR
         TK04F8jre5S08TTT4HDrSZBFLeLfBFgJTTzesr70TWWOnmu8eue8N+Gozu9LmRAUf5eL
         YSNv70jiOhnRtBFoezPFxdVek3M9kQwr0cCM9/bdginpQAJIXwueKnjcXxQ5F8ToB2xp
         TkwIW5ejvIN30WxTj3uLlfQk5EadiVAWSCN/vMxC7k+5Q99Yx7o9qbrGQYaukKYuUpQ7
         FsIZ8zkTXO8OY1bKCsrYUY3JWk851R59CG/1Z8FJ3j5eV5zafeYgb1QHMoMIoA7JWRsK
         kwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992068; x=1728596868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpKhnrCiToOYHN1pw+7+JMdclUxzZsmOklrrm50ukd0=;
        b=V4cZfjdUkZWljOHps9ZHCFIULpQU8sfAHRZwrR8xam0xtqzzNlK3Iyuf6TZoWVfLfj
         h+00hrdPiEOs7R/AIN/KIC4KTNXyrGfWCl1F9WQ4JChWRAa4+MC7RBNxBzTU2Ro3GWev
         1UkftORxT+XSUYyFlBqBpS8y6nEtHRqAz3ivcZ4EHoLlXk+eoFHwKoVUB9xNnsFSS0hU
         EOr2nuGH04jinCckOhh/uIIBTHzQLEqKEkQyfsxi+nbNuWgR+J2+U3WyVGe7mT2LE7h1
         fVK51SFlFp3c8W/Cj3VuWhR1nCdZRKZg0AOro+NRmK6OApvzKriE+gBhS7snSvETkDW5
         BZnA==
X-Forwarded-Encrypted: i=1; AJvYcCVKh+0GiLFSQwLEdgyO3wqYGiXGLfehSzCFM5PmXkjeFCzpM5qYAabG33S8vqjURta2r2+agcS0lA/wu3w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxobd7pkMsM3Z7wzLYn0zbi/tFkAOONz7BhoxPLzzcjf2ZS1oyT
	v/8kZH6BFWE856e5pyrwwPY9vK9cxFmMuQSXKBvOvYZdsMLGMybaxqRXQN4b
X-Google-Smtp-Source: AGHT+IFLVRXwy4rrbtcVpK2hq5udADNdS2MpsZyjrL8C4iv9iZVofZF5dg75RfGAZl8yUcX67ZbJTQ==
X-Received: by 2002:a17:90b:3a4f:b0:2d8:e524:797b with SMTP id 98e67ed59e1d1-2e1e6273485mr582358a91.18.1727992068369;
        Thu, 03 Oct 2024 14:47:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beead8dcfsm13513695ad.4.2024.10.03.14.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:47:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] pinctrl: aw9523: use devm_mutex_init
Date: Thu,  3 Oct 2024 14:47:46 -0700
Message-ID: <20241003214746.146207-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplifies probe by removing all gotos and removing mutex_destroy from
_remove.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 36 ++++++++++++--------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index f6df8d32225b..5cb24c1dcb0d 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -976,18 +976,19 @@ static int aw9523_probe(struct i2c_client *client)
 	if (awi->vio_vreg && awi->vio_vreg != -ENODEV)
 		return awi->vio_vreg;
 
-	mutex_init(&awi->i2c_lock);
+	ret = devm_mutex_init(dev, &awi->i2c_lock);
+	if (ret)
+		return ret;
+
 	lockdep_set_subclass(&awi->i2c_lock, i2c_adapter_depth(client->adapter));
 
 	pdesc = devm_kzalloc(dev, sizeof(*pdesc), GFP_KERNEL);
-	if (!pdesc) {
-		ret = -ENOMEM;
-		goto err_disable_vregs;
-	}
+	if (!pdesc)
+		return -ENOMEM;
 
 	ret = aw9523_hw_init(awi);
 	if (ret)
-		goto err_disable_vregs;
+		return ret;
 
 	pdesc->name = dev_name(dev);
 	pdesc->owner = THIS_MODULE;
@@ -999,29 +1000,20 @@ static int aw9523_probe(struct i2c_client *client)
 
 	ret = aw9523_init_gpiochip(awi, pdesc->npins);
 	if (ret)
-		goto err_disable_vregs;
+		return ret;
 
 	if (client->irq) {
 		ret = aw9523_init_irq(awi, client->irq);
 		if (ret)
-			goto err_disable_vregs;
+			return ret;
 	}
 
 	awi->pctl = devm_pinctrl_register(dev, pdesc, awi);
-	if (IS_ERR(awi->pctl)) {
-		ret = dev_err_probe(dev, PTR_ERR(awi->pctl), "Cannot register pinctrl");
-		goto err_disable_vregs;
-	}
-
-	ret = devm_gpiochip_add_data(dev, &awi->gpio, awi);
-	if (ret)
-		goto err_disable_vregs;
+	if (IS_ERR(awi->pctl))
+		return dev_err_probe(dev, PTR_ERR(awi->pctl),
+				     "Cannot register pinctrl");
 
-	return ret;
-
-err_disable_vregs:
-	mutex_destroy(&awi->i2c_lock);
-	return ret;
+	return devm_gpiochip_add_data(dev, &awi->gpio, awi);
 }
 
 static void aw9523_remove(struct i2c_client *client)
@@ -1039,8 +1031,6 @@ static void aw9523_remove(struct i2c_client *client)
 		aw9523_hw_init(awi);
 		mutex_unlock(&awi->i2c_lock);
 	}
-
-	mutex_destroy(&awi->i2c_lock);
 }
 
 static const struct i2c_device_id aw9523_i2c_id_table[] = {
-- 
2.46.2


