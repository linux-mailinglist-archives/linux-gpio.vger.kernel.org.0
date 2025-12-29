Return-Path: <linux-gpio+bounces-29992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DB7CE7E2C
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 19:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FE0F307834B
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 18:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A79333C192;
	Mon, 29 Dec 2025 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="js20qBKl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3531B33B6CC
	for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 18:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033637; cv=none; b=cbbIv4JKwlTgz3M61Yz86GEdisCdL7YvTzfOtA5RKJ7u7llEgY59ptEt8PUhzy0YFf9rScBKDqQf599otI4GA5XI+EvaMtey0NaBRnOtkBI+xNfgjf+et/LwD8l79pnBDvju3PQnkfMHOWUFNnxnBWyAZR7HD4MeO09eNTuqUo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033637; c=relaxed/simple;
	bh=omWUVkHfDgWK8/wVYsqR1gmKx3uRcWW/S7wsFlqvQZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBZCqpHbLlYIDwQEA+APlisvihmz+XEtphvC4xDzkWRvjNFbTMAPI5q9bb6j78z9D+x2kH/gHKjHZ6TWE4Y14tkXkjokPm7f6T4Cj7pT7/1xC1NDn/7azeGFrFUKMLJSXUwOegyKFAqjkQpYNHJoIV7qIhnrOlS6lXpmfulMfLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=js20qBKl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so71141025e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 10:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033632; x=1767638432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=js20qBKlOIc8p7LAg3ojQzBrDVa9hnJ3iwdqCsfn32yFz3aInQM6QoNK5N/ROzBK2F
         7GGCtwcKHJrg81RR8yBIoLsUREQkvIHNvhSZ1Uyooa1SkWmuCNLxf1fM7yTIF/tSA5xd
         VFlGqY3EMA41aCFoQleCr+F/kX/Bxmhq53oqbmeTatA6OX82TeqOt3nsr2uNqBEqrl0k
         nBsY0OfjmzG0AqlPzNx6ENwwoGPvY0sYVSF5LPWB3Vob0xzKohW7DvCBZ7tTFFYgAJ6C
         HU5bjhYy+qoTsm16Nc5dGsdDMwZMnkSPDCi/zwej+DFJ6pcf+YNfvG9ROfUQuUhCz1pP
         LuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033632; x=1767638432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=JURJVD5P4N8/56+sCZKRHQhTENAivS0Hm9LXK/pR9t80J6MU1yDNMUAWhyWnyI7Hn8
         S8BlZ9ATcXVYfG0om07mhnrkNiJkAzYF5A9YpWg3PHn1p3BWMt3YJA3huS3MOtrJvQYL
         Ubkb8Bf524m8d4r4CqWgryBndvNIiZfx7QT525OwIf/Hr7oQSfsmHp2Xs/SHNcYyKCOh
         /ocHzLhdFgxaYEv/8vV44x5neZC9n+8wBkpbW/hIDSXixDuya5WNb6HUir+rw+HaSCep
         23MXVn+brkoOJjgYs9FuUGQJ6izD172t8U/o/V+LbxrzXfBnXX1iw9kbsAmHI0xBlK/v
         m5Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUqMR7DdgjflaEsAlqbFROoYuC/lPki2478MKs5V3egk8unKNhcQDUw75YBy+CJf1LeG0zzFRk7Ae2q@vger.kernel.org
X-Gm-Message-State: AOJu0YwfRtGWslcKahbf72IZOdu/WGNIVPcGtdP1RmKo26viSwsCNQFu
	vqD5V0Yts4rFizUXdGmy2tC5CtMZIsrve9n0ozQP8YuI2lweuYoWZtJsGFmNbxo/LjE=
X-Gm-Gg: AY/fxX4/wHaIEGiXH2y7yYvLQ/SnZWvUBlNCr2clCnq5aeBQhReFasRcj9RACIqfhyZ
	iHxw0hPT+QatPkNzpFYRHUeitmQQHCzYNlvMh2QD13Ne0IqUhSQx44Nrf+Ha9/i2dimrBuWQifw
	TmMezvnIA4G9EgAdQzLN33HHJp9bfbQqgUzhiw/GZr1m4MyDzrT/ts2iRD4BZ2NpqPql9x6ZFg7
	eyK3bxlMJq+BW1/rPB0+CnjFKyiJ80MlUfc/hZXaI0KGRnz+L3I3nX8YV5OyDvE40BvGwI8vJ32
	JTmOb/cUCUeNq4xTYk0LNdAFAQoJbuUgp5h+txJM23mJR58tn15hJsuKC1LyM7gMbHxRLddYPPm
	Du8f2K6Lz5bdy1CYuGWga39BQ74/otdrs34e5WjLA/GMLP57ZjKK5CbpO6fc6eK/x3psJJYPYnn
	6uozp2pMnIlhXlaqEm7XEngMUONLOEG1haPoXq4PxyIiIoflnHFdyyaH8oILD7lGGJCKo2JTqLI
	65Waq4Sv+uV9EKkxsYtlAKh7/Jh
X-Google-Smtp-Source: AGHT+IHMeEPdVuxCEsr3HbzwXW9O9zK0z+wZ0vfJLANR2lbSoc703JFfFuycpKgytpooUs272ghcDw==
X-Received: by 2002:a05:600d:108:20b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47d1c038664mr255232695e9.28.1767033632356;
        Mon, 29 Dec 2025 10:40:32 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:32 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 10/15] dt-bindings: net: mscc-miim: add microchip,lan9691-miim
Date: Mon, 29 Dec 2025 19:37:51 +0100
Message-ID: <20251229184004.571837-11-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Microchip LAN969x MIIM compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

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


