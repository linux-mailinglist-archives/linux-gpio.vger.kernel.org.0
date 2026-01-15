Return-Path: <linux-gpio+bounces-30595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F11D243FC
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 12:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9BC0F3025A9B
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 11:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B6A3793C1;
	Thu, 15 Jan 2026 11:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="O5lnGvCp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0385332E739
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768477272; cv=none; b=COA/6d0fu/cpuvoaH+8f9ehFHM+poJiyY4v6ugqTc2tJUtQMbfY9wcXeuxvSqa//kxPHir2Ul+cpHd8JiY4Qgzk7Xx1nUnCfpOFyb0Xi3IqHsrgqfciB6671pasHdfxdWtNw/QLkkm8IrQunfYFP7AZvBaH/m0a0Pqdl7UiKbUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768477272; c=relaxed/simple;
	bh=ooKaWydLYAU6ZinUS3YSKV/BPM0KTw6HZzaYhJx/zZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRykarMIXa/VseMWVESPnQEEWRJ0mIC8qBh1IcWRQq+Ij3oWLTj7/P7W1TaeRNgps4uQpfG3s2320zvvxyhKyjKIK1EmIoDY7pfb8gemh0HcgTVnVDKDllxKPv2I2B3ujQK4QY2bwaLauDYevbwgn874ffeb2cf4NOTIQHae/wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=O5lnGvCp; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12336c0a8b6so1524280c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 03:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477270; x=1769082070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyqWPUPdksTIWYuKZmgo4nd2lHSjHXcu6SXb4jlQ4Xc=;
        b=O5lnGvCp5bru6pC2QaWeoBDVHfK15uwu/E3xAeyAUrr9SjEKNdMJFD808ELIWWp8/P
         cT1hffs6A20FXgIcfPjrhRBE/hnQ4mT7Cdn5difSKDrwyd2hfnL+VBgve9xW0YEZo/mK
         BWpmhZEsY0pVJb3Ze+8VNhQ3fjwCJFeMmyElICoDzR9t7Tm46dWQKLCA3fYhx4CQVHT2
         qxTosX+FWOY8D4BqXIDxbpEGADEzw9xh+L8NnwM67RGSd7pTqsiUedvqnRJm6445hNaA
         pK/cG0ss6J5hDKrm1Ag3z2x/qoAeHC3xbnYbZ8jcUMwAMJUqeCEBR1fGzp9vT/vOqmX6
         FI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477270; x=1769082070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jyqWPUPdksTIWYuKZmgo4nd2lHSjHXcu6SXb4jlQ4Xc=;
        b=Y/PeKFEYslRGiq2KlFf274UZIcwL9EOuvl7nIlj3ZCqmM1oQfYOlrUUr09+IBdrUB1
         zUNDLEpYp8ERVDCkV6QyN/+PdNaBSGzQJqt+CWhS/4yO2sr/wv2vvfu5KtEpQ2Q6D3lm
         W4jEBRTvo4Fog1p/c3t1Gl/vH8Djhz8qLFW0hYZbZkbs6K6zpql8XWC1Guq7GiSwwdK3
         WTOwBS7BFajDsqCSf9N6H3C4RHSjZq0q9D/2+NsVQh3rL7K0xo4AVj3iZNdrqiWaMbuL
         xusNby0gwzvOWv7t4GPnqt2D9QIl28E7xlarUzrfZtFKP/i8mR/0acMzbiJNJyJLoz+K
         CMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTlhx6UbS1/J6ep23HjJ8IoBarlI3PvQdVqsAgkR8XsszhFnRNa0O5nm3P+u4H3pxfSja6U02XYCFQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwfswFUUA+0L0Vi19SpIiwjcO0YsOlPAU7eU7rFjECGTKtBU7bz
	cdFHpfYNS0RT82i9UKtf8czmfgWSCEG6g5KjjMY8zjNwDlyNHSlQHaREziKdCBOCMGk=
X-Gm-Gg: AY/fxX794u55PZMmVg76jCw0OrBL9N1iRGC74uBHogsCoqSnm7t0DWOSDn4+2Xx1/o/
	nZVD/y9Rh+8XLMywSAupfRldsMlOu57BXLYgNm3lZm0uIC3HafA/3YtZDROK/gVe5K8AU3ARAcl
	tRhDDO6ezS58Tlmmfm2JGHA8QtMF6UI7N9Nm9etcfspf+LdnYQkWg5XshNI6I9JE7Vp8iiCnyM3
	MyftkoTG5toeqJqLDYx2FeURL281L44wwEVPmAyv6uYySoUTb2d9ja5/W6R68FLWNLS5Z4nNZKq
	jBPNe+y4OfdPPX/diHbPuB+/LnO7S8b0yusoXbNo/wDl80iUEAfXG5C95fATjnt5c8dLOOXR1ha
	oX2bdFtYuEbBEhfvOx931RhTHq3Ns36JPhNJCIJXE5Cpup72gieoOppd3BBq+qT1aUeg+nxOegT
	h2B7my9yIcm0j/K0IM9AaDvJR+QGji4xv8RDbkkiR0MOmUJJ3cMQ9y2ynGNvyoZSXll++sLe8Mg
	OZGfaSS
X-Received: by 2002:a05:701a:ca0e:b0:123:2c98:f6af with SMTP id a92af1059eb24-12336a45a0bmr7461678c88.14.1768477270097;
        Thu, 15 Jan 2026 03:41:10 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:09 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	linusw@kernel.org,
	olivia@selenic.com,
	richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro,
	gregkh@linuxfoundation.org,
	richardcochran@gmail.com,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 04/11] dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
Date: Thu, 15 Jan 2026 12:37:29 +0100
Message-ID: <20260115114021.111324-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
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
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Reviewed-by from Claudiu

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


