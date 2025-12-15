Return-Path: <linux-gpio+bounces-29576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F805CBF077
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 17:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D2B73092F05
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 16:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BC533A70C;
	Mon, 15 Dec 2025 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="g+Jpw/Rq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F72133890C
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816744; cv=none; b=iZ6H9CIB9zuIheqpb/guGBjEnoM5IsNYZbp74Yr3ucv/uyYRoWbWaWnAdQ16N1C+kKjXjDWEEuJL0LfrH9fCdkzL5+UTenSbH4/cCJQmKq7dHD6ykYD73XHcGT4G339HdkCHYpdtSxYqL6QjkexHK9KqQNk6liW7ZVFlwdc0F4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816744; c=relaxed/simple;
	bh=H5qZHJBlkQV6+/j+zTVqie7Q24nFHuF3MlV57DgQSPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D14zp4sSWr6MsCZQ03TIK+EoxNBlWS4v7sh63B9lM2ed0hxDQsf6r9Qo7bvYlrLA78vhaFyVHvNI1jdH+SA2f6h6r3OcKgVD2fZwfHnRWhBeFPJICeqyOpP3dvvyvWW/RwN6NNLsn3/dnXTlbtdjqxEqB8eeSeblVJOM/+5eAKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=g+Jpw/Rq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775ae77516so44372475e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 08:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816733; x=1766421533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cvy2LXuomfpj1nBing2L+jv3vaShIDCdMet4k/EboCs=;
        b=g+Jpw/RqdSE8R3RrrjQvhbjLiVU5JJvGAMD4icDPe28PPyf9q7p33NAR2brta51Jk1
         vhKfrzJqyBKDndGSaKieS7beK81YB610auUCmT+2t2R9OxgxySm5j6UcXqt7vDwr2yca
         IuvDhLzV7LpgZ2naTmCudKK9fP60HkJlmNpO5/Svow1GgRTRosFh1KiW3zICe/wl6SKe
         gjELLThAa/7h/I8jFCkxujmPa2VFPMEilRd1q68bEJMPgd/hEtLuCCXGcHJ6yfTsFE3e
         VjMvyu9I5um1nsezeE1uGkkQJcEcPANF4u/Csjni370le8TjbMdqiTU/AQK+gb7/fSl9
         q2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816733; x=1766421533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cvy2LXuomfpj1nBing2L+jv3vaShIDCdMet4k/EboCs=;
        b=ne3ohTRF6XnjgQxFGr7hX6X2MYCZ7StNYjzJuAaU7OgpU6THaZdqUKHZ3yli8WVqrJ
         0bqeQfvKE33kgRi+wW210dODDBbjpym8OF1Ta0wVNTCVqA4JrhFKeAh60dPlaFgewBXD
         s0+RUYeh7zHcqz/fy0Pa+SklVdO9cfMeSGzbleHKhMblak0pwMxSqHYvTz5SOIUVn+7u
         KQ6IXmVa56fnSX4EfJKq1q1b/6Nu9sms21Pa4Xwvqc59S30tXtBLumxwjIxDNivbaow3
         TaRR9/KqEUA+NeA3GGOJrAsnqfYaUqdm9R1hXcIoO9zJKWczJXVX6L+m+29Gq9CsaTo/
         jpEw==
X-Forwarded-Encrypted: i=1; AJvYcCWkdlOqRmTm0ecFrOXW2J3nahuhSaZPswMzqdwluB7tjnPqhP+xndwXmeNf8gXJtljf6Oh1QIoVkfq+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7sr5sVTKATNmDgG1RccQi78/VDz/E4H6KHEgtK3jHUwqwSH/9
	4xlzV250xnso+JGhb1huRxYg1l3ERetEwdDeXpJJLuiFOs4gN5/e0hWgn8EBfmLh3Sg=
X-Gm-Gg: AY/fxX4PNHny+C5ZGsXxN9+S/xMCTSB/J0QMD6QQhpwtYFdwY+X99r7rGEK805l7zMT
	ahy4oHkE0hBIv+rY0PX25y8sVDOlaQiJ4GbWmZ9K/Z8J8ski6hH/GqvdeCpOafLG+vERS0G3O24
	198ydZWbvyFZWt3+/4qXxdRY5m1EfxwOazpCiKjQZEg/v+rZnA5krSjtdfu6pnfIlpwTFgA1/oe
	4aOOiIC7lFVeZIdNbH47gyHMYf7EmxTXMbQkFVNTBKJW3ZWy3Ki9oJCBxdJFeELGSsILriR/mOz
	1vytNysM6uZ9B4U9w7S1GGUbeoVy7NplVzOmX3UL+VJI5sUn4KEqA/EGJDv2cTOpEeKj0JYS1ur
	isWyH6izF1RO1ZTLeRkw0UYWwrIBI+ximnpo2Zvpwg1c+/bpeGW5QAArWwlkB5CxlwfutnL1Uqr
	5BkDAmdkg3yXJJZJeoi94tIl4QF6zVjso6O5Ymma6VQFCs
X-Google-Smtp-Source: AGHT+IFiI7Ni2LKcVl3YPoJbZhPL5dwoIiYSj1m9w7GWGjr7ZRqjP07iguNywDfLKiIq9PsRU4kDWg==
X-Received: by 2002:a05:600c:64cf:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-47a8f89be65mr106452615e9.5.1765816732996;
        Mon, 15 Dec 2025 08:38:52 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:52 -0800 (PST)
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
Subject: [PATCH v2 11/19] dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
Date: Mon, 15 Dec 2025 17:35:28 +0100
Message-ID: <20251215163820.1584926-11-robert.marko@sartura.hr>
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

Document Microchip LAN969x AES compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
index 19010f90198a..f3b6af6baf15 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-aes
       - items:
           - enum:
+              - microchip,lan9691-aes
               - microchip,sam9x7-aes
               - microchip,sama7d65-aes
           - const: atmel,at91sam9g46-aes
-- 
2.52.0


