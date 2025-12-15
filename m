Return-Path: <linux-gpio+bounces-29574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D659CBF050
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 17:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39898304DE9C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 16:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E254339B52;
	Mon, 15 Dec 2025 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="TIMTbnL5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820873376B0
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816739; cv=none; b=OWVjoUd8hEYKSFcK/tgUmirX+Euds3K3FssHcReSS4I4TxbayjkIsOx6uDo50nM5H5GSzNivkNDCNh77yqF2SBplDTqlTH/ZYjs1w+KBxx3dNIbaCZlHN65NVg/4iQEngEBK4mIZIqKXGCPDc4vPy5fZhsPR3EEmeyNunX2mxnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816739; c=relaxed/simple;
	bh=tveRsbPZXzZXhM+Y4ZL/xeAZhYPJspnG2nmDI5Lswyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAoMbmMhiDU59ecZI7zql4FNP1VZa9dv5ryoDS39+Y6dDkMV6qboYxyViwkmOU5++uyJh6MDi3jRGOCmb13eNzwlSmmbhHcatwe5DB40ZrIis4iqqFFvLAPpH9SEFqWe/UwuBYsEdtgyJwbbab94ID5lXK5aOFALsQ3E+rxoN6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=TIMTbnL5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477aa218f20so24301575e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 08:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816728; x=1766421528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GXKAmimvfw8ijk1jKim17aNEIYNsEIF53cEg9wyafg=;
        b=TIMTbnL5Em/KH6EZ1AcGswOTA8nTJvUHKKm2Pz771cI9CVZvlCDopkoqTAva50aEqA
         VAvTMj14W/P63wkCe6DJS/XYIr//ifvfGpzvvw75fSuf45b05uLOG5DOs6HVtszdnv9Q
         OIUMeF9yWoqOyIgcdPi0ZMEBbNuYljd1ptw8AU9xi7TEhisDZdScz0eHTCfMc7x9wXrt
         kpmH42zqbUL5cORxpDZr0pbZx8mEZox9sb54O2O+K9r4/kbOTj4S6RYajMGwfNIXAdd9
         Sgwghwqcz8imo3Z7cjI4LtBBTMVjsidan0IG4I0hZQVfX4VGYq7t9/5kFtSJMPJpi4OX
         UULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816728; x=1766421528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0GXKAmimvfw8ijk1jKim17aNEIYNsEIF53cEg9wyafg=;
        b=kdFDxLK0YYxj+ctA+cCM02sXQzf4ha1QRYL7yQ1m6Ipqx1DNwZ/lCqgLzS3kAUZMPX
         civc4nyUMkfmMfY7OkbkjUfIxDaRI1asu5p27FpX+8AAbqCDnP5d6ubD3iu40cGxqYtX
         1pQDZK7sTJ9V7WnR/QtQY3eUt5+Lihu1lXyQ5MK+IOAYOdofoDmMwXoGfTkPCVOJmXgE
         p3LmJa8xDCXL7EKMrjdXKgbf68X2z11qp6jNZrDfUTltpO1Fq7cZepXptuqAVYxzgkpL
         C0TVCFCGh6m6doeM8s1rRp59+H6r1ZAnSbgLj8ts8lyQ9L0dkQ9CPD7Ye92yp5Ndop1M
         +SxA==
X-Forwarded-Encrypted: i=1; AJvYcCWqMEye+9iji6MRB3TlqQpv1UAbV+2AXzE14P6zI6ySJqyeIaln1dxSvZNLyYVLix3R8AocN5VaJjgR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrtcc1W7xP6TjfDubi7KR99tNnIqMCvUaZxHkjmbUCqsxTQTNe
	/23yp2yNby+UDzraLZmwVWWmk04dB1tWDZR8svoI+8HrcmP3gtOnGE0FY2cSDsBmGrg=
X-Gm-Gg: AY/fxX6vYz4BibA/LQ/awFF3mdR8ZBj19mh3bTpWowAJbC7bvsIfWIwouJlzMMunr9O
	mq5lyiqNht65VKzBTNQRbFIUobNfDwFnAU5xCjTT5H89PxKw0qFgtml/Ru+qvLUdVVPmNW+qk3K
	2h0MUpwWzxXUVJzWW516szOQvxFKf2cq9yfXR8MRdcB4DTdjtMX2iDbH7pI0ijKaHj3hYF13YqP
	9wyKyhi1SYU6yXLgA2qb3nxwVrWdk1x+qxdIBpMWyDwRbZ/sejl6hGTXnJA9bE53/Pl6QEUZLJh
	gpFnX3ooGSMyDhLC6dUCfuAmPxXad7U7dqdLb6uT9NLOCcL7pZQNpAAJKqB4FNFHaX3OEr2947M
	b5FaMRPX4pesePapWBi0msY7ofgelxmfQengWijqAgmolvqInWZXpnfQmhY0T94NLit8ckZfWQw
	Ex+BiG6QW8vI9aEjJ1hktawFa21+JRyFLMLpogBmJn6c0u7sw/AXN3I3U=
X-Google-Smtp-Source: AGHT+IFkqZliIsZtRCNZPvKJ2k+bwRt8m/V9TgUCZlXWy3Yhe4IyvA99Hp8H08ozBRujUcKubFPJwA==
X-Received: by 2002:a05:600c:524b:b0:477:bb0:751b with SMTP id 5b1f17b1804b1-47a8f90d716mr120031825e9.27.1765816728371;
        Mon, 15 Dec 2025 08:38:48 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:47 -0800 (PST)
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
Subject: [PATCH v2 09/19] dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c
Date: Mon, 15 Dec 2025 17:35:26 +0100
Message-ID: <20251215163820.1584926-9-robert.marko@sartura.hr>
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

Document Microchip LAN969x I2C compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index e61cdb5b16ef..c83674c3183b 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -26,6 +26,7 @@ properties:
               - microchip,sam9x60-i2c
       - items:
           - enum:
+              - microchip,lan9691-i2c
               - microchip,sama7d65-i2c
               - microchip,sama7g5-i2c
               - microchip,sam9x7-i2c
-- 
2.52.0


