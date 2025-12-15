Return-Path: <linux-gpio+bounces-29578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FA7CBF1E6
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 18:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0F103007778
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 17:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F0D33B6F9;
	Mon, 15 Dec 2025 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="wuE/sKde"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EC7339717
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816750; cv=none; b=ufOB1IV3kpbqbdj4Zz5Iev53uxUDqG/RFT7/Oib/mC3xCSsE9tZJmIB33hmNxuvlUnFwJpRLouapOaeQqPyiBvIAT4JM5s/jvhwlIWtHWA0lVHbLclleluDS/GONoG2C68kSgqXCwdMCvUvijwUWhU8UL0TctAQJ3dn9fhh4Ieg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816750; c=relaxed/simple;
	bh=yzcerxGw6ZEQ5EAWvF/XHa1fvQNZAbIc9+3T/p54DUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kq2tYc2SsMwJg4GsltyMrya0T/pKWDYQFb7011aU6EZazdxua0Tzg4w2SvQNiSqKzz7qhq2P400tbhVLZKl3xjpQhWTQLv6az5Gscalcy0j0Gm04uSdc/SWR6rrHVKWcsQl+0JaHYsZtTWTp+ID2eTP/IdpMHiKX3iUOq7rnIi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=wuE/sKde; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477b91680f8so36980895e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 08:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816740; x=1766421540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7uXKaE9ntPCAZ2rjdGBHoMUGCXZvwAT6+sIs1szqdY=;
        b=wuE/sKdeZ1o995m+SXaS8gdLHPqBj9GX4ItZqDHLT/qyQVo6rZb3HQc/BcqB9c7y5T
         WAWKU5zNvBo3ukX5igI9stooGkl2JDOJfHn4J1f4AYJLQrPEKVd2idNvS1PnecZcOAyq
         mFoxp5oktt9oRgiksHv5Z4zX/eFmpFXWKx3IIax7Z8kiRoMB+FT6Ll34iiTLPHD+qAzV
         7re8uKM49/6YD+Lft9crtVxLMzWamLgsxkgI/dyKNTW413QTLQSC3Df6Xs8ax13SyOye
         EEfiPyAgiG/5/DD9prlU8lV/UkYUcRTK6gB78zSOSaMZ1IvI6Ok8OZ10nBaYz4uByJ64
         jtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816740; x=1766421540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7uXKaE9ntPCAZ2rjdGBHoMUGCXZvwAT6+sIs1szqdY=;
        b=PonZw0QyLAsUrXjBP5YwqxSxhgUU+zMj4yO6AwLmJFrNjTYMi/Ilex5Y3TUlH6OdQP
         PWAaSTCqciAolo7cdVNaD9pYB2NN3pTPdRSRq63QCik/JWhlLTPcK4dnWjbGN5ufJsSc
         utSOB/mwyiomv/QthHi16g9qxj0CrYVDqP1xINjBe5OgB9oFQerqE0OM10zJOWXba+41
         i/m94oRmUK25RZB6sRJsgUSOBfiELtxd/hxK72WXLavAbYaFICuVwJKwSl5WOFqusRlC
         LKzabv5efANWrnxbd4fBQCfkY8V/K1mEhbPZePDf+Z49ppTF0N5wKt/SU2is8vwPYA16
         TuZg==
X-Forwarded-Encrypted: i=1; AJvYcCXK7A0EECZX4gPtSu9NUz42r1+025MC8gow8P4k8oyCARM/fwuQYLZGf55UmfHLRrxxTWnD+DMy6Qy2@vger.kernel.org
X-Gm-Message-State: AOJu0YzTDGnRslSVM4ZzjT380xgpiMZQQjjl8fiF9bp+nAd0rb/EzSPh
	KajZDJMrfQTiL7t7SNHxJBd3/NZWKMSkAxcYWEcfioUNqk+tQp6FpUSu2RpoWUJ6n94=
X-Gm-Gg: AY/fxX5Uv5F8EAjf5/dX1Xem/qU8YhsRyx8y7lq21F6IMKrpTSTysYJ2Mf1WawoizqO
	ajfBnkk0hm7uRvdXhop9zPpuui58EVKq6H/iHH5/6VBs9NuSARUY1YG8ACR3r1L3Zhvj9RNq7Ks
	vpwudii0jLTdsgzaYbXFurQbdVSYLjKT4yOmi0lvHl6S/NrBwNmMJIX8i9K+sInnJJkb1suY8kg
	VHh3oCkjD9z4JDA7dDCr/DwoQR/AlDrFqThPksFAGCEDQeAn6dIxPOxwNeyxvLz/sdBRq0dOW7r
	q2cXQpVbQ9/mf4LDg2CCWcVG1w/AucAG7kb0MPYRgxnA8ZwDzNPaSVT7COlyueCcwknxN6o00kq
	6BTWrHl47hRGNAfUxeKn114DqnDpnRPU96j79AUtV3/SKuVKpU3Y/h8pKLSmjDpKYyvHbe3Gh2j
	J1A6aD2doEgArBiHZyCAb4YBHfPLUrZwLfSZT86QTiBciE
X-Google-Smtp-Source: AGHT+IE8U04tM1LjVUd6BjLQwQ0IIQCLbUIBLs6wp+cysOg55uq2vnToFSgCzvzZIateLKaG+nb0Ew==
X-Received: by 2002:a05:600c:46c4:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-47a8f9046fcmr131388855e9.20.1765816740113;
        Mon, 15 Dec 2025 08:39:00 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:59 -0800 (PST)
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
Subject: [PATCH v2 14/19] dt-bindings: net: mscc-miim: add microchip,lan9691-miim
Date: Mon, 15 Dec 2025 17:35:31 +0100
Message-ID: <20251215163820.1584926-14-robert.marko@sartura.hr>
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

Document Microchip LAN969x MIIM compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/net/mscc,miim.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc,miim.yaml b/Documentation/devicetree/bindings/net/mscc,miim.yaml
index 792f26b06b06..2207b33aee76 100644
--- a/Documentation/devicetree/bindings/net/mscc,miim.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,miim.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mscc,ocelot-miim
-      - microchip,lan966x-miim
+    oneOf:
+      - enum:
+          - mscc,ocelot-miim
+          - microchip,lan966x-miim
+      - items:
+          - enum:
+              - microchip,lan9691-miim
+          - const: mscc,ocelot-miim
 
   "#address-cells":
     const: 1
-- 
2.52.0


