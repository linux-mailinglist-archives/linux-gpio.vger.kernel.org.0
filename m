Return-Path: <linux-gpio+bounces-29575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5603ACBF0B0
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 17:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F29263001B8E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 16:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5A533A039;
	Mon, 15 Dec 2025 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="OfUP/ICW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84881337B90
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 16:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816741; cv=none; b=FZUShSFXyW0WUroZQPkykswe8VMQL8OTHgT/AuJ8C7aOZVhlUl/j+hi5wYPR7gwaX2lIo8J8V/ldPewlbfJB55l063+y09ic+0UNkr45hxB3S/kULJkKV6STUdFqldL16JGW55/6Ceu+WTdvEuIaYfY7HWbZMZzdboIgypi1ELA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816741; c=relaxed/simple;
	bh=h4KBW+OqWMvRHvXvtXgMj+kYkCK8alyetopM4+3I/yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USULQmQSS4DZcmmKtww/NBBqahdSSxPjLh19TQhq3DaDf+UAnSu/tCLnwAPIni45cATNgMSedWX4Jhx4moyr9yMwq4t9Pd0g4P+cbOCQcUBe1amNATfy99aOjqOZ9hyl4JtTn6j9QQ70eRHmQl0MyLhLLfeOoLHbCFRY7oYmZlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=OfUP/ICW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477b91680f8so36977935e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 08:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816731; x=1766421531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRhTYOFBvq7YVDoxsO44nCdQXJPNAFf/GkuN2Aepibs=;
        b=OfUP/ICWkdj/41RG3vUqj76mrUf7etPXv1VDW9TPrcx/pbN/0ZqaNMYefTovfAq9wV
         3gSG8GDVlA8WGkb4XennljmZKT9Z/RdE+rgKupgAE9ynOzGJbZlqiPGhmpSai8gk0W3p
         uYYzMMBKoc7UHytUUyzTeNkoN4zNudPYqNyIVoShBl8b7/SGacT6NopHVw28SMw8Hx0l
         LaHRh1t8Lr9jeU95EHQ8koV0ig+m7rOB4Pq9EG96Z4e3cdYVBy6PsiQXH+aHWKdYkqMb
         /inS/mpHbUwzNkk2NjXNQBGHfdxT78IO7GvrhvprYOc7qAzItPVRLil2MBBtGeAJ1g0U
         0ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816731; x=1766421531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GRhTYOFBvq7YVDoxsO44nCdQXJPNAFf/GkuN2Aepibs=;
        b=YYLJTEwunLOPBC3f5mLQnuF2wRavb8Sf5/SLmG+5X1BBAh6iYvgujV/RnXHfmXcH4z
         i/Rc9rHixg6LsuS/cEfKWCkDjpysdDrnSc5yTPCfY3nESqbRFQjfID6EuyinbnCelmyf
         a5nixKOr+6IiGdDwA7ThhBaEblnXcQKgL4ZhsEObm64EKie+rAA/SW+a/vpkTHOQYdxP
         ic6SKVmaiwTII1xX4Ll+TQ50jWyKbP6tOzBHSYCwADiRcOvVws0VpiKObF3wSBFjpXmh
         pCr1dx6eyL0E2XqigOdCnZCWO+MwbPOb2PMyPSnj83jzLgJB97AahCXiFjqI2RyFiDzQ
         tHwg==
X-Forwarded-Encrypted: i=1; AJvYcCUTYLx9l37pyKatVdLwezTt9XUeq/lFIkUOkrr50Q5YIx27A1oZzBqghXzaIg2p45yYIGdQ0yzpl7q3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu2dBtdjs0MOPtOfWlGlvwisp+FnaVCiYJNQtULMXiDWgiGLUJ
	uOkI6EEZ15YiCWhvum/GomqMWeNRid0LK/1F97Z9Jt6DFSxAGV4RHz8i8aTztokPlvs=
X-Gm-Gg: AY/fxX7CBL5MWOINMFaryr0AUkkrQ/6yVVtGJHRh+jhJounr2KOrgGfgyYQxWUiIWVx
	EizCRkzVpF8X+cUVXRGx143LWkduCsbXcKiVQvsKur6n7IvR932MnFLO2Dizy2vR1pD/lH+L8Hn
	4VvX/VaLUWCwr5WK0rcwiMjzV2j9mMRykl5NlzQQQQNkGgebWRpBCHDk4FoBEuCf09MlU1weqOk
	b7+oYUia+rhEtvjlgQGjhWmuNpGKd6dqTN7fjEQdOmAHzlOaVqjAOyMIwYWDs3xKLaRbDXaGJZI
	IZZurdLmgA7J0CRWDconSFmvxt4RhmwBX35ZjidD5kv+/mW9DEyN0E3yP6UY2lJ4sgpfOdeAdmg
	XBS/HjvuKWnKRRUCpETFHSZTpBUysAVo8Shz1V0x2ltRJvrVstMJHpZOuF+xChTA9+uVglX60Ho
	6eV14BukGEkCNwl3EPqKd4P9iUcCgXsT2StTbRrcU6BEfa
X-Google-Smtp-Source: AGHT+IH8ueFxxMMyV68FeFfRx9NsSwNlL/Ao6Q/rQdEFzAIzqPflgAc/QenJHtj3S1aXhik6vqKjfQ==
X-Received: by 2002:a05:600c:3489:b0:477:95a0:fe95 with SMTP id 5b1f17b1804b1-47bd466121emr3483595e9.24.1765816730643;
        Mon, 15 Dec 2025 08:38:50 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:50 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com,
	Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com,
	tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com,
	kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	mwalle@kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 10/19] dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
Date: Mon, 15 Dec 2025 17:35:27 +0100
Message-ID: <20251215163820.1584926-10-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215163820.1584926-1-robert.marko@sartura.hr>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Microchip LAN9696X TRNG compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
index f78614100ea8..3628251b8c51 100644
--- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
@@ -19,6 +19,7 @@ properties:
           - microchip,sam9x60-trng
       - items:
           - enum:
+              - microchip,lan9691-trng
               - microchip,sama7g5-trng
           - const: atmel,at91sam9g45-trng
       - items:
-- 
2.52.0


