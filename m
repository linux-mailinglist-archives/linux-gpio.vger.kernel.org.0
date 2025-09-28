Return-Path: <linux-gpio+bounces-26646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C680BA6878
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Sep 2025 07:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8C2C18961A4
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Sep 2025 05:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927C2299931;
	Sun, 28 Sep 2025 05:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHCenmbi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8617261B65
	for <linux-gpio@vger.kernel.org>; Sun, 28 Sep 2025 05:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759038092; cv=none; b=gyMHxdDF5JG7H8NILEgJDRtY7TYBdOcuGAsjjUutRIfX9sxQ5Do9I0WfXlyyOoxwEUbpf9W/gIaDxoIi3WTDy50QmEFIvwCfsdzx28FTYgMKIzInI88p4BbAxxOZ/7CNKddrZorNwFPFxUVeljzwEq7naPiox83jZX71da1c34U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759038092; c=relaxed/simple;
	bh=S0v1gHURYMdw1yi6PKnRpYcVfrORhPmC76eStiDMp8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GjhXaKkP5fBThp7oGsdLSq2NZSwQER/WAQGWQ9j/lUvPWTd+e6PvGWIQjEgHwUbtG6M9pjHt01xEz6AvXA1HzPBjisI5vS9hdM5id3mcFo+baVRYbCUVvps6ysEVhOUxpuL2l/0F38iKElSsIrb5WHteL4AN3iRAH6JG7+iKGTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHCenmbi; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-279e2554c8fso35695145ad.2
        for <linux-gpio@vger.kernel.org>; Sat, 27 Sep 2025 22:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759038089; x=1759642889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BIwshfVuzFnOMAKrYLI6jEhBWZi5IYNs9VlFFa/dZNM=;
        b=gHCenmbi+CUm+y9X4UKFg/5Y3cvwV+nJHPkAiWVWC/p1grh5USHHfBcMftMRxVywth
         iCfsEzXT1mL4NMkMw9eiUVqsKWs8L4MsBcbSg27hDeIOgjnbPJjNZ3Tsn4xl3WBzqMca
         C+scI0jx06Q0VpW/7l20Q5CK4YIM0UP8Z7nZTz2s6UVheSXPooQMiiylwG3sX5aVH6rg
         L+Ijtz2lQ2kHLROIDky63xEIQnvsxmhmqxnn21nYP9wJq/e47OtdtuqkWxMvSs9nG2OD
         v3mws+ZoDlrB5zBt2xHyCxF9Z0wNXdIKexydjwsWQEQzG48EQOxM0WudjtyX5UudxyXQ
         zEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759038089; x=1759642889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIwshfVuzFnOMAKrYLI6jEhBWZi5IYNs9VlFFa/dZNM=;
        b=VNw5r4v2tu3KL8yGEKDmzRNJSZRoGtLakz//pfstjmM0XF5kdPl2uQAi1afTn+uvUA
         Qo78yvybPgLHtn50T4P07ek8xInpxBCUK8lxFJwA896JNZ/EwEaHbnZ/QSQp88I6z0vy
         ABfcQaxWuwRjk99hvb6dDHbdAPgOQMSpXdJhaXdoLOblxqj5WnY8jKgyNGZfeqT7y9MG
         b5ux6jwhXxhhjGjw1h/s8yJXDKmBYebu+tWJ75GC5xG2lVfH8B3SIA4vVDjDYjOx0DF3
         yz9BcQTeMfRh7BqGptzPsUSzzxizxq46fSK1aXb5T3+cuym2qrA2zslyeXMjynR2tMv9
         TvHA==
X-Forwarded-Encrypted: i=1; AJvYcCWppe8GBBkJOL/AK7JET5/9+dJNVXulonuxHJFHftZjEl6RcBC7i5wBLaeAk9YAtoBhNHRqTzRb1F6v@vger.kernel.org
X-Gm-Message-State: AOJu0YzcLQx4NOVKuUuNnn69Dj/BlzCHecSNmOOZ/BtURDih57ixR7sm
	9wgABNEOn3W8Ttp+pxYPIjJtF6XN6DOBANh7Y21pLyyP1UunvJtcpwSd
X-Gm-Gg: ASbGncth+ax52ZqNyoySLJh2WIMMlWBI+iMich3wpDj/Hauoh7C2Bxxe1bn5H+klnWs
	ZAIHWIYL+XT90086GXWY9C/zQb9NHJyTxGIvpNKo5fipcP3jA75lKWbjqABh+z9lzNTGwQ8LME8
	tbEEGLj/HeGx2Ss5h0lxS5oWv+vNvnQPzChvf0ZEDB5G+lLxG4+FSZCtNPNnqpS0sOsE13pxN/D
	Mn0H1dZzJ3NGwJdXo+Xe24SCgF0Mu8FULBVynV8rTN8uvu6duAeSR56P5v46kjA4oPQVk/of0p6
	xgSZN9Q/KJ6ezMW7eIeVLoBa4QXB58HQGUWuV5j1D90iwwUU4/61k+FlpGPeUBag8BYPSVGt4Zk
	yJlvprPRc0B5QpjejQkrq5QjWWtvj+bPTlAcDAhI2XbO0
X-Google-Smtp-Source: AGHT+IHgKzmQxn3LYtCYg7KtWdGt8UUYN/QqgIJUJEq3IBbdnq2sdaotugj5GIiwi4pi2voIkLiz3A==
X-Received: by 2002:a17:902:cf42:b0:267:95ad:8cb8 with SMTP id d9443c01a7336-27ed4a96047mr129802575ad.44.1759038089009;
        Sat, 27 Sep 2025 22:41:29 -0700 (PDT)
Received: from fedora ([172.59.161.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed67076ffsm94429295ad.39.2025.09.27.22.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 22:41:28 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v1] gpio: gpio-grgpio: call request_irq after incrementing the reference count
Date: Sat, 27 Sep 2025 22:40:19 -0700
Message-ID: <20250928054019.1189591-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove extraneous dropping of the lock just to call 'request_irq'
and locking again afterwards. Increment reference count
before calling 'request_irq'. Rollback reference count if
'request_irq' fails.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 drivers/gpio/gpio-grgpio.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 0c0f97fa14fc..18d972fddfac 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -227,6 +227,7 @@ static int grgpio_irq_map(struct irq_domain *d, unsigned int irq,
 	struct grgpio_priv *priv = d->host_data;
 	struct grgpio_lirq *lirq;
 	struct grgpio_uirq *uirq;
+	bool needs_req = false;
 	unsigned long flags;
 	int offset = hwirq;
 	int ret = 0;
@@ -242,30 +243,28 @@ static int grgpio_irq_map(struct irq_domain *d, unsigned int irq,
 		irq, offset);
 
 	gpio_generic_chip_lock_irqsave(&priv->chip, flags);
-
-	/* Request underlying irq if not already requested */
 	lirq->irq = irq;
 	uirq = &priv->uirqs[lirq->index];
-	if (uirq->refcnt == 0) {
-		/*
-		 * FIXME: This is not how locking works at all, you can't just
-		 * release the lock for a moment to do something that can't
-		 * sleep...
-		 */
-		gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
+	needs_req = (uirq->refcnt == 0);
+	uirq->refcnt++;
+	gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
+
+	/* Request underlying irq if not already requested */
+	if (needs_req) {
 		ret = request_irq(uirq->uirq, grgpio_irq_handler, 0,
 				  dev_name(priv->dev), priv);
 		if (ret) {
 			dev_err(priv->dev,
 				"Could not request underlying irq %d\n",
 				uirq->uirq);
+
+			// rollback
+			gpio_generic_chip_lock_irqsave(&priv->chip, flags);
+			uirq->refcnt--;
+			gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
 			return ret;
 		}
-		gpio_generic_chip_lock_irqsave(&priv->chip, flags);
 	}
-	uirq->refcnt++;
-
-	gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
 
 	/* Setup irq  */
 	irq_set_chip_data(irq, priv);
-- 
2.51.0


