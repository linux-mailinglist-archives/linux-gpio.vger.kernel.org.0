Return-Path: <linux-gpio+bounces-14591-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CA1A0574E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2025 10:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB50F7A32A1
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2025 09:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F8A1F76C3;
	Wed,  8 Jan 2025 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kwA3r2N/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEEC1F76AE
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jan 2025 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329746; cv=none; b=gizTdUlyVf2vJyKxMRra1EkO5c9PHakK/BpTwTRvrGprX+1tcqzsJDLkXRhEEyUtz7PufF4Bt5vp/EInx60kPtLaWHreKWXKE8sMe4v4gLCFslu/pmUT69V08TTCXCRxeYvUPo/s49fCZ/zWzNFcIRPfbl4LX8JmSwQTSVb52rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329746; c=relaxed/simple;
	bh=Fo1dtitRBIlNxPyuabqbIsGyrCsxtml4L/zmDIMa8Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jLU6JRAVMA2l3s1NEniFs98M6BIBvDROHN909v2Y/vio7E98hjqsIieaPC5PEyogTAMLBIlDK2b1Yw3vpSDHohACLIMw7IMmfALaX1MQdjOX8MQoJj+3Wa1J51hDZIVe35t686aTceZx/8qerRh2K0SeR5RaKlKROGlJBNYxQrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kwA3r2N/; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf57c2e0beso1419639766b.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jan 2025 01:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736329740; x=1736934540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LkjTFh/KUYJwqwm49fCfmXfd56o5yi04XLgl07ms458=;
        b=kwA3r2N/0tkxBcp0JeVxlE/YQiYLLfC+nFoIqdmihfeqzV4IJI8Lo3rqwtxnkqrh5A
         vQk8g0FdSR0F9ViCaJ4zWsOiQ/JoWQ3cN63/OhHrR5SNKVLcoQvm7j21RH9E/qxsQIOO
         xvDtq3pjufkCTWLUQuFT1mDqwNrhk3WuNF9cyfKszLpcZacpdLDwXKn1CTGh8pI5UZY6
         kuqjDUkk+F1mNyK/DW2k56LPmWt4zydrJkhCoOTpf6BDU0tqHT7M+vmV7uF5K6GB9Bd0
         /KfmsWz4ZlFuKDYj035cqT9jLMtZ99uv1pn8HljkpvDtpGHK5vl4tj1xDlRkMOSTaWji
         hPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329740; x=1736934540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkjTFh/KUYJwqwm49fCfmXfd56o5yi04XLgl07ms458=;
        b=ToGJnFP5XQsJMREBj1YCdj94CZ2D00N9qzLW6F9uzy9w5mrwag4rMagnDYCMOPO+vD
         zLTtaNwLBS7rRN7Q6Wy25Jd/u3Ha1fpbKcoYLYD5Dx3g0TC6il9KYP2dCT3zMMtcUCQh
         dvSEkGwLjj40fImk9oS56d1HXyPbhJjVKCMlPoe8espYsxaoNQtTt01k6ymjkKqGPkhS
         +6FUUOosvhr/aWIg6n07XvV9j4gneoMmSftX1hIw0G2WAtw7fTLa44BlJXQFrpdLPX/6
         lLW2wirfiS0G/UREGqXL3B85LMbUuNhQCAQxE97pEe97ex4j5FOKdjJOvZhUcazExx57
         SotQ==
X-Gm-Message-State: AOJu0YxjQ9LbLmPHil6xzAPQi+r1uLFME4mv4Vx1Xt5ErSKVPjLaQSYc
	4gkrmkjPp15EsgbIMDV7xWNvswP3pIWH9c46zETLZIqAuGWeY7yuGWXSbUi5YYE=
X-Gm-Gg: ASbGncs+EAUeoSy2NnqFwYVAcxLkvQ7f5kVCBhQr23B0EoKAmTe0bvMKZlwswJoYdCW
	oLtPEyjKUdJxS4bqx5/2sJ9VQJygky3V9+t0eL+XSvW3LZ6U+6TISsSGq8zrln8YXJpdF1aRQpH
	q8fSTkso5Ztc3xVxdc2VV1mL1AG0FRZzJDi3wAgcY9Z3M00ECvHQ2oo4mu+DrEAoDrytXXy1gtY
	GHw8hANlUteDSEqRtGRRZYH1aitUbqFY+HrcwDbJm8judbtOGZv7a1xH1bU8w0khXiaDXfzYD78
	mZoZu7rAo04=
X-Google-Smtp-Source: AGHT+IHVgJYaTP5uWse6iAj+m5zpohyVnMcsze3pHQF7WwzrPftcXL/eyKDy5K3QQucykTLg5G64tw==
X-Received: by 2002:a17:907:8690:b0:aac:742:28e2 with SMTP id a640c23a62f3a-ab2ab6a8df6mr142681166b.6.1736329740046;
        Wed, 08 Jan 2025 01:49:00 -0800 (PST)
Received: from localhost (p5dc68ca2.dip0.t-ipconnect.de. [93.198.140.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e89514esm2475655866b.74.2025.01.08.01.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:48:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mun Yew Tham <mun.yew.tham@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: altera: Drop .mapped_irq from driver data
Date: Wed,  8 Jan 2025 10:48:51 +0100
Message-ID: <20250108094851.3683769-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Fo1dtitRBIlNxPyuabqbIsGyrCsxtml4L/zmDIMa8Vs=; b=owGbwMvMwMXY3/A7olbonx/jabUkhvQ6Lxbv/2ox/993HH5/+nGjSR/PkgLpdsHYafL/mIrWb DGZ8/9wJ6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQATaa5g/19VzzUlJyKB07r4 r+oczrnP37yLiHr9VH1mg2pu8/14Y3m/+dsudRVGtDQXbvVSOLWJQXVbp+TaTBPGHVnFUY838q1 7cEVYJtTil8OPjRM2NfcZmAQUFBssufPpx70Z+e/ZV6xmnlt880zg/LVe3ZVp5R1XYxg2avYeZe 9UOnfnQlpiw9Q2/ngN8wmpfMHLfusG70sLubWo1rDF8qeL3VUl3s1z+JR6jLPzbnX4l84QKKgJ+ PCS7ZXa1+hpWiahN8R92FUFLRbem/Dn9f3eLzv1xO2ig6dGn1MpDby6Ia6oaY+a0w7v9Uef9x2w 8Z15iGG5IQ+/Zd3uoivBp41Dj6XtCgiTZbu7ypJzWf4lAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

struct altera_gpio_chip::mapped_irq is only used in the driver's probe
function. So it's enough if mapped_irq is a local variable, and can be
dropped from driver data.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-altera.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 73e660c5e38a..4c52fa2d3568 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -39,7 +39,6 @@ struct altera_gpio_chip {
 	void __iomem *regs;
 	raw_spinlock_t gpio_lock;
 	int interrupt_trigger;
-	int mapped_irq;
 };
 
 static void altera_gpio_irq_unmask(struct irq_data *d)
@@ -235,6 +234,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	int reg, ret;
 	struct altera_gpio_chip *altera_gc;
 	struct gpio_irq_chip *girq;
+	int mapped_irq;
 
 	altera_gc = devm_kzalloc(&pdev->dev, sizeof(*altera_gc), GFP_KERNEL);
 	if (!altera_gc)
@@ -271,8 +271,8 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(altera_gc->regs))
 		return dev_err_probe(dev, PTR_ERR(altera_gc->regs), "failed to ioremap memory resource\n");
 
-	altera_gc->mapped_irq = platform_get_irq_optional(pdev, 0);
-	if (altera_gc->mapped_irq < 0)
+	mapped_irq = platform_get_irq_optional(pdev, 0);
+	if (mapped_irq < 0)
 		goto skip_irq;
 
 	if (device_property_read_u32(dev, "altr,interrupt-type", &reg)) {
@@ -296,7 +296,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
-	girq->parents[0] = altera_gc->mapped_irq;
+	girq->parents[0] = mapped_irq;
 
 skip_irq:
 	ret = devm_gpiochip_add_data(dev, &altera_gc->gc, altera_gc);

base-commit: 7b4b9bf203da94fbeac75ed3116c84aa03e74578
-- 
2.45.2


