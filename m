Return-Path: <linux-gpio+bounces-30593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 56666D243C0
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 12:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FD10302AE24
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 11:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF1137C0FE;
	Thu, 15 Jan 2026 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="BzmUI76H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14C837B40A
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 11:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768477257; cv=none; b=HMNr7IBYqa0ciNOcx5waC1EJ3bjwrO/oclfqLs4lrKp2TsJq2xDxtkof+crqs3UDG3HLXh+qBJQ77VbFey0iztQ4UeINHaKE6oq/M0vC3BVW/aDCfGsOTrm8VJ6O1gSVTCfaXbwA2HmF86A8A7FZiAaNDngkbXMJO6owPGmIpeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768477257; c=relaxed/simple;
	bh=b/54xVwD9NWBApT/YlbKlATwkJX1Z2JAQOFmiza0IIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=js+BfXD9ATyeRbEX3sxRqAZbtLKGfs1qjCDchKH87L64yK8FWITr2lfmWFr8pBoS0j5w9Pk6PO62LVxw/+xS9iMR4RtNl3IPEq1xkCNRV6q+uFxul0X01KlPEQiAqv801thj//dZfV73FEOjHNw0FlcYAM/WKrneXyo6xyKik/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=BzmUI76H; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1233b953bebso1971298c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 03:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477254; x=1769082054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3+In9zGTnNVCdfWyUqUmvhLH5cDZ41X5IQo0vghvEY=;
        b=BzmUI76HFoIf+H2p1c/j0xVbV4COe063YZKargTzFj/IGBRMeJPYbUTaHaxA3d45xG
         z8lSpJ8fz9wv6JQE09xRzLQTKoktg6GvXS/a8od588oaSVTo+xhBZ4Fqb74NiN6xvQZl
         HtsQUCSb7ngWotCTs5g2GJnkserXtPybEEXO1A2is6tuUeQVQ9jfHuQZVE8uX/IxPmM+
         KVHrgxVVvGxbUYvzt2bh43cxu90LawRwhWUJdAaZRIBmJZl91t5X4KDK98mBFre5IhJh
         k1dZtAE8z0oetFMzXE/+2TxlBijLZAi0Zr0lKGTLzrmxY51ROW2ekXGE3hQheRXpbNd2
         9xaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477254; x=1769082054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W3+In9zGTnNVCdfWyUqUmvhLH5cDZ41X5IQo0vghvEY=;
        b=gdicmJkxY7ptEjOsLxOM3UsYj0o6uwEBr4+ggZ33zeaXt/5kbts+el+TKJL5cVVsZP
         RkOyJU04Mi7c7MuJQ5rdelcUx5qrHtw4jOA90gVxzB7ThXhaPCE4vtnhO6EOxAZbGkJ5
         DMIMZNs0M1DM17HTxBV7QbYjyhsQH6fI2BmWoYtZfwbWpD8tuXyTWuIqkgrAYxemN33J
         a2ZfTtv4HGCcHi8HGH4Q+gvcgSUkIofLyH5MGmO35iXx137141dPFN1dRpWMF+9a6C01
         S/8KDYMpsQNn0xngUfpLpCDvH6blZnezqlYcI66PpRRRryv5CJ6X/Fh5lf6lSH/+fWp6
         clCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA5bmImw3MYU37/GKd1rSRX7JKRmB8Vx9bFbQNBcuOL0MdBDkGdW4tQ9z4Etn01XbxC5pzxxkcX7GZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxD6CHGh7M7IgAz0ddJuUymASf13wqRI+gxbigk/c6NtiMTo6KC
	/U5UOvr4DUcmDGL2gPUAol47zFdOVWl8NI3Ay66h+hVwOoyI5LwVO/jnWb05o6rogIw=
X-Gm-Gg: AY/fxX5pUpqiSB9Z45hGUn5arZCKTi1VYzRubS+DA5hUkbKmiQb00YDBH57kOBNJ0QW
	u51YeJaPEaF4fMa//WlNesfG2LIROTNxqj8dBUfd2EsILzNSDMM1OSROGILWhCrLrVWpDYjAXuF
	q1WxkykulOavLL8c2xgj1m+PovW3xkbJl9JjSqyAwoH7csPzozZLH2l4WzlNVsS3TUy7BaC6inr
	z2l1AaaZZL3qp7L5Xg0Rha1xZfznkLjZemmcbVCdiEMAVN57G+Fzqr0HsIkaIfnZr+diz1OD9wU
	L0y81kZdT10z+mX3aEEx2hJruKBy8k15wen/lSIQkyr0Z99h2z3EU01WFj6l8hqrA2OI4U/BvzB
	6bRivat7dgjj3HKYpkWQawFf5QA7co1/kP7dN2lf4t/xVq8H//lL5eV+EibJkFi5p0Ui3DFfENC
	iipVsiqhyyd83dpMMp4PVb1rHRST/s2BcCXb7w6BMsmsSCdCV8DNAVbA6zFjffX3TLNOgOH1Jsz
	UT+mlvx
X-Received: by 2002:a05:701b:2715:b0:123:3461:99be with SMTP id a92af1059eb24-12336a38feemr6811395c88.21.1768477254152;
        Thu, 15 Jan 2026 03:40:54 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:40:53 -0800 (PST)
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
Subject: [PATCH v5 02/11] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
Date: Thu, 15 Jan 2026 12:37:27 +0100
Message-ID: <20260115114021.111324-3-robert.marko@sartura.hr>
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

Document Microchip LAN969x USART compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Reviewed-by from Claudiu

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


