Return-Path: <linux-gpio+bounces-29850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 460F0CDA7E2
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 21:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 503DD30C360B
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 20:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57EC34CFB1;
	Tue, 23 Dec 2025 20:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="mknI3aHD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCD5324B35
	for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 20:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521218; cv=none; b=VY2ZEQL5uwHOaVE4twtl8ZhlF+wNZH/P0FMjf/9YObTOMc88tPXldsJqMMHeVRJhX2YwM4MP2yBHJMUGhUcX6QbYxbqQsXBJek6EsJqQvZWGPi4e7Uzud60dF0x/YXl4o8hQzAbF5PWY9n90hwl3ElMtxAWJOCNTlZjHBxMfwPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521218; c=relaxed/simple;
	bh=GSmfufS+BjcFXAR7DhKTmRXgeyl65npdKjntCPPDfHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqK2ov5MaZ1NecH17doTShs1LSvh+FfcZ7X8Izeq2F5G7NxqsavyLVt/AthVUqgnjbnanTHD30fUWfbMO61HM9QIsPR/nX2KQObhdu2vf3Nsj+W+luYU/nLQ+zkvxgzJDPDCF1h2cYWSxwX5Zr7HUpIqnWtuLg1xYo8uqgdR6MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=mknI3aHD; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso4489482b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 12:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521215; x=1767126015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=mknI3aHDk/xx6E1DXCAkhUtT53KYTa8H/fy7ZqYi5lMAYZ2pnjDOEBbpIn+PxzsEih
         Wi8gHCcxw6toR6SqJxa0bt8CxPRFrw2FGeuOBXtyqNd/OiX8LDNzXflhB1fmTCJggOR+
         YGkdiMbAf487Cc3/wOyoWB7V8JvpTpMJwDUOtBr7clyUt5ACpOC3y4DWtOmXN/0bgspv
         S+1LRRlkfT/LfRuRi8mvNfnDrTa7d0Rz3fVOwnNtuYqX9hOvYGnRNM8NwkprFzIiTiGt
         DCBGCog1PbUG/q40amKbvFtSJI3QV2PfA7L1Id37cDtu8ahGqYpYnBl3zRj+quKK05rp
         MSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521215; x=1767126015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=V/sDcMBAWQ4BTZlvP5eOlZd+VQcTGLb9ZVzerZ3UbVD3IGtO9w9R9rK/7jVLcf5AFO
         QQ9BEbiuC97XFx1gC5mT7RNDY5j3EixLwU5JjTrKW0UQnNHJx/9c1i3A0hmA/Pk3/SqT
         5osc4Om7kSiEbpz7TOx/FN5Gk1ruUn6TK43AOcb2xDu57otPOy0c150cRLHHnIbh8Kjq
         msIhrVttQ6q89zHRMxUJnBu3g8pGVb/A1zKXbrCO+2VEK01A6lv6UyowTORdqzdQ8SRb
         sM5IGFq7JD+jwS7P9Ni8XAuxlz3mRRazIAkKuvRvK7h+iPmwQzxYuDEoUuCF3fCGJEKx
         XxoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6vBSOocymqqV8AtHEjY1Tgt9t+O1SBYqdKcMgvviz5N1W1+Elz0LS70LPZEB9ZQeUhnCr7eA81Ql/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx9IQDGmXTCxvKzIQ+A0GsiFLCIOKl+AUMT5cpjtXPDrgc882v
	KUs7J/iowai4V/ykhLifZ1j9GCTMgwJL+OUp9Ruq+zWGrW2+0yd3nU0XIr8YaZzCSmg=
X-Gm-Gg: AY/fxX6eGatw2bO2/c96K3RWm3BSLJOeRHB5ZZBhcVf96umgBCbvLHdIJMLxviC5VNB
	9mE9cCZb42+xNM9BSKv15tl0x6IVpsYhu4ka+0znhYbD2i/wTzIpkB2jAvEWaQD/RcdtwgeKYOX
	iDjNU8V64GAJ+5y4czoiaeZmNcrDiBdcIVPavMcGam1HrDTx3+JKGGrdZdqaTswVuVdQ5rV9qi8
	YSgVnZ26g/IL75AIh9vTJYSSOBJbLCYho1umbrOqc78uxo5YfjafvwBFjFLC8hrRnVQI+BaYfoQ
	NkAXqttwsaZOF7rpkYS+F5N8xl7v5I92ja3336Yk1+CTEsI4PmS8zh39sSX+LG1RPDYK9LErrBJ
	IzS6AJby3bTWt/pJwBAAKb+6DKD3C/6AMhervyl6SgsUOMncwylFTgaY4R3CETjQJ7kVL4Cho06
	zZY5RuC63pDZytEQtpL1n7/jGP3erF3BuSnpOV6UCA2fOIByUBhT4BDgUdtAbW/wIYVugvObkN4
	IKOrQa6
X-Google-Smtp-Source: AGHT+IHTipKQ2GYkfIzCrgEkT5HgaT5cetpxH7RTkCWDpkBy3UcCKVeG1Kf0FvBM/eI9Sln/VDayPg==
X-Received: by 2002:a05:6a20:9149:b0:347:67b8:731e with SMTP id adf61e73a8af0-376a77f12e8mr16762772637.14.1766521214766;
        Tue, 23 Dec 2025 12:20:14 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:14 -0800 (PST)
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
	mturquette@baylibre.com,
	sboyd@kernel.org,
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
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 04/15] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
Date: Tue, 23 Dec 2025 21:16:15 +0100
Message-ID: <20251223201921.1332786-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Microchip LAN969x USART compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
index 087a8926f8b4..375cd50bc5cc 100644
--- a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
+++ b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
@@ -24,6 +24,7 @@ properties:
           - const: atmel,at91sam9260-usart
       - items:
           - enum:
+              - microchip,lan9691-usart
               - microchip,sam9x60-usart
               - microchip,sam9x7-usart
               - microchip,sama7d65-usart
-- 
2.52.0


