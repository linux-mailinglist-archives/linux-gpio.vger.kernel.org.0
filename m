Return-Path: <linux-gpio+bounces-31839-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P8ZKiSylmmRjwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31839-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 07:48:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8C715C77D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 07:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E43430721AC
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 06:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FC830FC0B;
	Thu, 19 Feb 2026 06:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xsm7JLGX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F060630E856
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 06:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771483569; cv=none; b=k8/EEAz/AqgIcihwgAXGnYlQJ9vUFIGxSjq3Z261WHUQBhkk6QztfYnRXXRU2hfCvxuoIxy9iayYzXZ626nXpVfo49uTeP+UrUWFJyNXDbj2huVjA3ILvTxTP/XPY3YriQ1Ke9tkFz5uC5qiAo37/Qt1pSlGK8MKfcghNEOLQtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771483569; c=relaxed/simple;
	bh=gbwOuCh6UyIObppR+ccmbnKrATlo0fExNZFy0T4F1A8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=au2DGrb2WmC0y4Z6Nfqw1HNTm09e2hC0Tx/j8ebXokywp9JpnS1ndQG0SH7JEEq241vSo8brxavflO1k06vyW0gKzqveG0eqEh2w2P9uZZCHxc6KEtkviUgu06CDO8bLQDMz5wh0xKOsXFK0pHYXm/FYPexDRb06JexXwnSrYc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xsm7JLGX; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12721cd256bso601601c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 22:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771483565; x=1772088365; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E70q3Kd5cdh+0sEnkLZNyFfZgY/oE3FN6dtixCcw/1Q=;
        b=Xsm7JLGXe/J48l1agQgr36zfVIa7DKoW4uiySThf0ditmxQmAs7hyZhQR+gBdIR/DF
         Jv8QyzwHre52TgPa5LQMA8+Cyt8WXk6opOUOzBRDaSDo+4WB9UpSI0MwsTWYo7ev3I8z
         g9fgRKYKWKZK2vFSQ6Djd6sYv3k/A0TekZ1a1aOdkznQYviWVv+Diq6YT3IZZTgUch5Y
         XVu1S1V4AqrFvA5NXKps02p6dAN6GmrT5T3c8ZQkZ6+wsfTjTnNN8nERrEC+1bzSf/7r
         rPOLlY8Tio9LECAmeOplIL+ndstZGMvviqFmvQNKF6c9QsQNPsnArhoX4Qc1wVCHvLsb
         NRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771483565; x=1772088365;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E70q3Kd5cdh+0sEnkLZNyFfZgY/oE3FN6dtixCcw/1Q=;
        b=la4UWnZSlT4RLTnFSuzmHdNqx0b1aGuQ5bFcwFHDcfPsBSPzYV9iYSlJ9UpVqA6Jme
         xadBgmNRuU0kJMJ233lc8sXCUzHFm2qA3zIa5q27IRUXo0bKspg4HVijIft9pbevv519
         PvXn4FOaa4yX4H7R8UIbiJaXRo9YHLB3AeL2MCY4w6BOO6V8zPRt4uwZoW6PrL42DhBv
         Nqz/h/EFx4/ZUmzZdNs6pG7QMJZihqjukFdXcbSPKMPU6S7i8Yz3CUaZI0F0g14yRCIQ
         l6In0EjAk1whweIk7CDWfBBXazanyRmNBwSNJJjEEmNFu0pWTzOk7k5Dlo2G9LqCb+A6
         /XWg==
X-Forwarded-Encrypted: i=1; AJvYcCXg8K4FL9RziVkDckaGHyceMAZTU41JRh7SMjJaIlIZTc9lKHoKg5yXKCnFdeYEzlUufuqeEO3OjFwM@vger.kernel.org
X-Gm-Message-State: AOJu0YwluN0tYJNoRgBiW52VkMr55xCHhncpCop/RNbX7CIa+Xdn9izR
	3NAoWCYbA55LW3lMHgej3XLJ+lS0iuUOGawINbrvlz/NQM44mc9Fo63B
X-Gm-Gg: AZuq6aKfV0+hnc8CQ+u7MyZHk+KcVMWWQfTdLpZn98ViRugZ13JQbXk04PYZTT+0eBD
	wVIYMP0qH5YQE8afVsYV9zDoMCU09rxBUcljdisE7YDtZL6PTge95NdwCw6IRa/IHpX+Xq2b7fS
	CqJaVi56LKx1eczmYkpBe+8/49IMwp2RaWXe5pRBTMPL3ZgolDzF+XgNUGLiaLJf/d5SQ1QE7it
	1TnG1Zn06myO7K4i/lIkEgQwGur3xx3KPg3JFwA3YBWjaOeXhI2wb+IWnlHYWaMl4vQljDpleks
	Hp4VzSo0tUpdEFvN9sDMojnmobpRDNIljRvO4PRfOVaEjZaWqA+10ibRVO1QevFW3ED/q/o1oGp
	yjcQtVN/5mfEwJvZiZ3KMQmPrPw0brNgtkT12QfyLHE4OTne2i5hglv4mvDa6mL73WoURxUmpnD
	/EZpHbKX06Y3ZfAJRMeX0Cy9F/+bTCmpjL+H0GeAZgcBptvLpLlbClZUzq5qE1MFbQ
X-Received: by 2002:a05:7022:251f:b0:11a:37a7:3d2f with SMTP id a92af1059eb24-12741bd6599mr7766072c88.37.1771483564618;
        Wed, 18 Feb 2026 22:46:04 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742aff32asm24395845c88.0.2026.02.18.22.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:46:04 -0800 (PST)
Date: Wed, 18 Feb 2026 22:46:01 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Tj <tj.iam.tj@proton.me>, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: amd-fch: switch to guard() notation
Message-ID: <aZarCgDvMUta4Viq@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31839-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2C8C715C77D
X-Rspamd-Action: no action

guard() is more concise and ensures that lock is released at the end of
the scope.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-amd-fch.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
index 9f329938202b..9b9d75acf35a 100644
--- a/drivers/gpio/gpio-amd-fch.c
+++ b/drivers/gpio/gpio-amd-fch.c
@@ -48,13 +48,11 @@ static void __iomem *amd_fch_gpio_addr(struct amd_fch_gpio_priv *priv,
 static int amd_fch_gpio_direction_input(struct gpio_chip *gc,
 					unsigned int offset)
 {
-	unsigned long flags;
 	struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
 	void __iomem *ptr = amd_fch_gpio_addr(priv, offset);
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
 	writel_relaxed(readl_relaxed(ptr) & ~AMD_FCH_GPIO_FLAG_DIRECTION, ptr);
-	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
 }
@@ -62,12 +60,11 @@ static int amd_fch_gpio_direction_input(struct gpio_chip *gc,
 static int amd_fch_gpio_direction_output(struct gpio_chip *gc,
 					 unsigned int gpio, int value)
 {
-	unsigned long flags;
 	struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
 	void __iomem *ptr = amd_fch_gpio_addr(priv, gpio);
 	u32 val;
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
 
 	val = readl_relaxed(ptr);
 	if (value)
@@ -77,33 +74,28 @@ static int amd_fch_gpio_direction_output(struct gpio_chip *gc,
 
 	writel_relaxed(val | AMD_FCH_GPIO_FLAG_DIRECTION, ptr);
 
-	spin_unlock_irqrestore(&priv->lock, flags);
-
 	return 0;
 }
 
 static int amd_fch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
 {
 	int ret;
-	unsigned long flags;
 	struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
 	void __iomem *ptr = amd_fch_gpio_addr(priv, gpio);
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
 	ret = (readl_relaxed(ptr) & AMD_FCH_GPIO_FLAG_DIRECTION);
-	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return ret ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
 
 static int amd_fch_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
-	unsigned long flags;
 	struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
 	void __iomem *ptr = amd_fch_gpio_addr(priv, gpio);
 	u32 mask;
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
 
 	mask = readl_relaxed(ptr);
 	if (value)
@@ -112,22 +104,18 @@ static int amd_fch_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 		mask &= ~AMD_FCH_GPIO_FLAG_WRITE;
 	writel_relaxed(mask, ptr);
 
-	spin_unlock_irqrestore(&priv->lock, flags);
-
 	return 0;
 }
 
 static int amd_fch_gpio_get(struct gpio_chip *gc,
 			    unsigned int offset)
 {
-	unsigned long flags;
 	u32 val;
 	struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
 	void __iomem *ptr = amd_fch_gpio_addr(priv, offset);
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
 	val = readl_relaxed(ptr);
-	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return FIELD_GET(AMD_FCH_GPIO_FLAG_READ, val);
 }
-- 
2.53.0.335.g19a08e0c02-goog


-- 
Dmitry

