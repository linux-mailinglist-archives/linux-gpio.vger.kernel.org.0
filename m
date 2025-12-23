Return-Path: <linux-gpio+bounces-29854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAEECDA7FA
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 21:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 901F6304E3BC
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 20:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092F034FF46;
	Tue, 23 Dec 2025 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="JWd8YeUf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E5534D3AF
	for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 20:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521253; cv=none; b=jdUyhv+a1QJ7Z75LMn0w9xt2Nt8ZegR9Oihqe11psp0PeyM8F/BnlInXxe0QbXSWiiKYhssQWT7NoJ/zFLZzXMpNaefzIrXpe+KEiLcRejn+B0hJ+3saLDGrJd+THP0vnH/g7siOqTnoCD4JQs5f81QHm/02g2xStCMRhF4zOQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521253; c=relaxed/simple;
	bh=zUvrtsolEdengocgVlyXQxoSJXOg4mGPqcC0PLdIbPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixo+VI2xX9EXPGhms9C8qb5iv1MSEj9kJOYJVAqfafMHulSWzWVhusYPp5iC9k6wQxPVVp4oxdWE6gz6inqfsB5xDWw6SN56/HSHV130CHYy+Oc5i/HPPnm1+wC3jnUrYMk5q2cH4jlP7f4oa1WSR2OC8AIHhgLFgvbEucCjMnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=JWd8YeUf; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso6123114b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 12:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521251; x=1767126051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=;
        b=JWd8YeUfcE2jxi4dlT6RjGrdeqZAThp66WLdnh1AdZbByRtMWbUC3/KQA3vOxoI7rQ
         Nej77PlWwyPaR0CweuAUAHdybLE+chQvK13KAx1PHCFCzP8dqOUX7DNszBLGLS3YPcje
         3obQGC21IXK8hIsdJaIVFWus/hPNRBL0nHrgv8Rk5tPmeAiEGaHpc8i+apiMSFebghNE
         0W0Qy8FfsEMkqnJOoL71GDcIZHE5UqsuPBST8EGPO7XAr1u45JqOy2YCVoY6QZ5iqEaC
         ghB9VRmSjvWVRdEspk9wiO4HaSDvwPHstMR28m2thH4fnj7e8ayv8KKHgpqopigvFmEG
         nQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521251; x=1767126051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=;
        b=iEhARoMS0ukc35Od7mtbGALPOZfNRIcDhbh2gysmk7YCrfUbx280/JGC45deXszCrR
         KhbRrt987S1eed8MSdBE+uI1AzeKhm0igllmUQkbEYcTWE+MV6wIGe6jb6XWxMDmZSQN
         Zea3hF454Rl+t62muSAbAszCxNrRlpQJZDEFYFVRWFS3IDiyAr7jIggnbVzearj7M41G
         0U39qAtJeyhgA91P65f+3ltTQX2W8qkBQba5wVUssDYvQcbWDbmj7nE0SO9Qvq7Co369
         5i1AcrL+SAeWbP8QLwGGUy/JQNPkty7Oy4dI+hDH2aGRj2Cy2DklKNbiXFdwvoPdpK+j
         32Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXQNzNJeYQmSSJc3UOwV9cUEdXBjc/7qAnkbHZYXaIJJuMbVJ+eVCHKwg0kZhQXM2qiYFcQcH/gqJML@vger.kernel.org
X-Gm-Message-State: AOJu0YzFOm9BS3x5TfOPdVLi7KJcuznDsJSywST8AshF/w3tk4FlCgnW
	tqT++9v6ZlwasK9/xYhXZ5T8ixNOtZK8IxSv2Or6Xjhi9xeNFMZ/Phr3XHFI9n6La6s=
X-Gm-Gg: AY/fxX7J+lkDc7VI196DSKfPVuNJ/zq3mQt9OnKljw4XJzbVIWfx6cW+ffQKFHMjAxg
	h9/mdEy9+41P/9S1uBBNE93ceCIcYW7rEjUHkTUFiDsud7KKZga0/ckEKVg4q43jgbn3ONywKoL
	ZTCMuf6SNsb+2AoPJS/4+kQo+GXNpdiq2gv1IzeIRLENOsxBClfgFzVBOAQGpdyL9SLHr+OIiIR
	gjugBtO6XJOPuD9RObsWUUHNzxUBAIOS6VycMBEFwl7hNhd5jAfOfGItaYCipKAhZlerAZ8xegb
	5RmKL3QmxdrNR07KYOejo4W5dVYaiLMsmRTl5MY0dZbvSsZKuCP/L5ppOUx9WXStLDyNzKsJT4U
	5hYTLQLepDNJx4exAud6Two+2aGdrw7zWO6axey1ELtadP8BiliIlSXHk6toBS9NfU1TdktSJDM
	Rg8FIpKU/h938PoMkgDfBhv0v35hNpHVrZW57O7K/m4b/KKSV4BZQ2G4JX+5xi57MuJSIBYoEn7
	Y6z1OsuzKAsY4Xr6NE=
X-Google-Smtp-Source: AGHT+IHKR6G1JkjZPbcb6JKFu1uGkQq63m4FpssJS+cOb3Ug/zNWJVDVvih5redVT4o6Tq4IHHU3Qw==
X-Received: by 2002:a05:6a20:2588:b0:366:14af:9bbf with SMTP id adf61e73a8af0-376ab2e77c7mr15535010637.73.1766521251186;
        Tue, 23 Dec 2025 12:20:51 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:50 -0800 (PST)
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
Subject: [PATCH v3 08/15] dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
Date: Tue, 23 Dec 2025 21:16:19 +0100
Message-ID: <20251223201921.1332786-9-robert.marko@sartura.hr>
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

Document Microchip LAN969x AES compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

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


