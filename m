Return-Path: <linux-gpio+bounces-29985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43699CE7F4C
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 19:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ADD9304D8CE
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 18:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B99338582;
	Mon, 29 Dec 2025 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="JcqlzjRA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E49336EFE
	for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 18:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033623; cv=none; b=bsGMNyD64syM3ZqOrkfl5phoUF89es7cCqYW/UvftjKcv6woKDx8Bwq6IaNcJnZYgiJzxiFWSY6YpznI8+/rR4+EuBXVplQ7BgW785a0US9j0LWZoIVCMhCFEPk5w/dx/5g4+7wSRcEUIUAfXDNrdbCpo779dlYfF76EnHqbNzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033623; c=relaxed/simple;
	bh=GSmfufS+BjcFXAR7DhKTmRXgeyl65npdKjntCPPDfHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMpC3h+fQmH2JltASkv22lEXoBCrtqb2pbro7kWixMHV6HcMNNOnslnPK0d9DBLGSzVukMZ/CnEAgfMzxpLkdlSKP8vN5WVncDNFHQ4johIRl5Qy0crdlTW8gft1banpRHXJWQmGVOYElxyageCZc8f861+1TRukx+wl8oDDg5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=JcqlzjRA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so44613575e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 10:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033619; x=1767638419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=JcqlzjRAY7GYd7DXROYgWaELXWB9Ssktmv0mSGBMky80lcqfObTvF++Aws/cnbhLIt
         yMn5+n7PQsVaPG5S0nSJdGjAQv+rbOP7HgcdcPpJ397mAkKVT5uX3fyEiZz4iNDImAv1
         ygQjSfkGsJtE4BH6mibkK5llo62IgL2R6umMw1dy0lu+we47jagIw6mQtfbEdcJbvIFs
         sj7gIiiZW5UrWkm0ZabFQQS5bX4/iAVnhv0/33iHD3qs/a9XjKvmtSqSoKgynE0Fb5bW
         zfOQUkXxivxUuLlwihW02aUZHmiajEMBEq4a1P099s5Ia7Jcqgyr+cJNoEthuSEHRpJw
         8pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033619; x=1767638419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=CQvOKmIV/W5AbKZ40Ie6k1K8iNY7KaaTEyMnr/wE3jBXnB39WMs5soMs09tVo8/aab
         isysTctt/4HVHL+eQBnMFBCJpfTF1pvjvr45eQy/E0Rh93xCFrt3Q/bFyvplj9wKtWdT
         rg4Eb1J/7oNl8/O4lgAc8NYEz3ZMiR8OrWTnP+N6+3k+TnmcEH8H5WuQYpCYqesoHJak
         uryLYvAEjMST/g/GiFPGpc5dFcBVwgi/1wzV99jNnAFD0hIWMqpzvCPr0zoGWMhsuKMJ
         pQECIylsLA977EkBupWbPsblSKDoTYdmCIUiXi5mA8zNhuRw0LZ1zEtYMhf1St6FFt/G
         Ya3w==
X-Forwarded-Encrypted: i=1; AJvYcCWPt4r/CJC333a+iETvtYbf4lz/LTSu+HV+4wXzw0zZWWM85XDILVMiYxcao6rnd4dGxYdIZJVVv4zw@vger.kernel.org
X-Gm-Message-State: AOJu0YwnLziK57nmV7rSesbo8eLLAx3xX/ODL0T1YvDHJSjYhHjUhS0/
	MsAu1998AATG50wSkXYHTGLkAH4KOndRzGB14S50SFt2MuJwjS6OJM/MC8bLfemwTTk=
X-Gm-Gg: AY/fxX6pwxqAAw/GFVxcR3hO5hvLQSDMAfMv3JU8KeqtgabT27EJoCRA7eHljCA7xzy
	j7A0sjfFRDjVHvFZMT2XwlO2AX9BnMgQQbjVWqfRh7NgMh6ZZ59quNwqo608R85tv8KRLA+67/m
	DpBTxEKjSoyQ4edBBdhRgS5B8C41SMradeAgevLpptQGCwraRCEIYtJ3QQnwD/QZdXaXJO3+mX0
	vnOtyf9ceLlpy2Gxr3oO2Cv2HVXghaKhvqfYWCiPuaUJnRVgogWOBME9hLAMfn+KHugdMr/EWyN
	Vx1dwCzmSSt4OMqHeOykAGsHLoVMAKz6cL8ReGmyM53YEOnSUfunYaXtONp7LyD9wHXJL8WcpIq
	+Zw/Z25ASldKpByvwtH5nW1KzlaJOVInYibTOsWFdyrdL4QsY9UQn4jng8wIzKU3IV+qwNlc1EO
	4hV1lh/a90a24e8FDvp78Slpz41JWY8Boh4T4N5NMynFMNdlwzgLR+qUmDNalsejorUrBJ05mXs
	158xxG5xcYKm7w/WEv4IFEeLGeu
X-Google-Smtp-Source: AGHT+IGouKdEkhppybsCuf/IfO2U2/Dz9wh0+2E3/5N4x/PhA0Nd7PQ1c14nBgJEnbaurS5x35/GCw==
X-Received: by 2002:a05:600c:4e90:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-47d19557183mr403585065e9.15.1767033618979;
        Mon, 29 Dec 2025 10:40:18 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:18 -0800 (PST)
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
Subject: [PATCH v4 03/15] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
Date: Mon, 29 Dec 2025 19:37:44 +0100
Message-ID: <20251229184004.571837-4-robert.marko@sartura.hr>
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


