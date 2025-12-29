Return-Path: <linux-gpio+bounces-29996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87417CE7EA4
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 19:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C1BB303CF49
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 18:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A20C33D6E3;
	Mon, 29 Dec 2025 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="eDl6YqTI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED6833D6EA
	for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 18:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033644; cv=none; b=G9RvdzdIp895N8Xqr1T87xFxtHwY2x2HPI6coGIOa6eylNDUmhp4JiHG8uio7lzyrS2ot18vmR7TXgfL5a8s4Fba7Gs1VAqXL47u1dL5fzvMia/TlhwPRF4aJZyoSDOj6dLzx5oJwHxOes+iTLSbqMyFywGPkSbUUrzAwgDbPPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033644; c=relaxed/simple;
	bh=XoF0Eovrxm1txLTrLfP7MB7ayo4/Y25gdep/95xkk5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xc+je59WHqJArVhgNclpDFcpDCmGZY38mtLmUfGf2GQG9PXR0RRHHimqtPCZIazmtKmlYEiocKKBkD+Kf/PZk5vOa5RO2ptuDYtSJMzd1Z8yf216q81kjBw8FmxgXr1BSY1Wi/9ZDq8YRHPiHqKimFEznXvWJxuzQClM6BZKSwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=eDl6YqTI; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so98481235e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 10:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033640; x=1767638440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=eDl6YqTI35mE7mdIDYxmhJcA4HqpioN6T+TrIWpO7rhwFXtvwMqpaCt2rVWa5KOT3Y
         PzQmjNcD3ZrlKKrL+sLhAkAO1G+9JFeLQ6HfZ4RLRD+vGzqZ8nbHnAvPszy0K7JPB4H0
         5i9ecXb3tDLcQBOFCP5IF14KvLKRYmOOE1wWHk18pvjPph5g85omJIHxFYCFgCNgFzc5
         rRMoxkFKU+zAxax3cIGiVYf33wmRRaGswKq8m8cmtly5hnQJEOUTlktu8+2f62IgiqfW
         u/Neehn5EO2WPKUDyLjLyQBW3zkSTpdvIy0w+c2swIdgRBGSJSsWnY55ywc/rwY0oCsw
         nL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033640; x=1767638440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=SYV706YUvuMM/wfr4h0Gj9gbi8NGp11NGJuBuFhWPN76PWHNyFvVqUe1tGiPU4/MUJ
         irc/fWlQNWV8oJkWYfm/DnUuNp+ngRazNM1+dvLkwqRa+T3QbW9BSGFkrJMen6DZO7Ic
         LDpiJ0YR2UAOMESzAwQMt6fZeWVl1+vDFyWlv4iVQbkK2wfMeRJjwpc37DLBDeBO94tC
         hetEX4LGBrFrULOJxkBlXIlNU6/DE9i5cFlSQZVwk6px4qtK7aHvYxMvoF0nKEn5/cn8
         79h51R7T60qWr97B3oyFzxoTNMxI+b1aNpyHUdD4PFaE5BsitiMOp962et1oPdDV3nJP
         SnMw==
X-Forwarded-Encrypted: i=1; AJvYcCWsVsLbDJtqR6b9xNTVb8PFiKuywt0D5vy5SK0GbulKrbwpHj2NyTGMN7e6uU+0L+kJGyJooNbYZs5y@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz3LmHO7Z43NwzTIjA/qEdZYYHDsajNEYgj4TNlDYABUB7Lwvp
	Uz6/huGiPiY1nWZa2ziQBtDiVfj0i47HEbmkpgFEXMRDRFpQvkhA0+xzNQ+BJeENN2k=
X-Gm-Gg: AY/fxX4TxdSH8t3Zw2mue7Oxv09QQKllJRvTI407+2l7wSHDSe5OpYlDgzJSuUDQwTh
	+lE2Y0detr72nhJRN7VPYsp7fKy5Z6AJISe+HcXmPw8P/ZKmKz7GnBroisrlSyRWlNyn+HnyM9x
	kcwWhtRp+E1lZ7G4Y1ny4geWQ5Q/4nNTXjG6Nk78K1HEP4ErhlHraZt+MDHzqNsVUiqyVa6yQog
	TOloIKOdfF6wzJkCqPIRXpvrk0YwJeBdVHxQR6RH+3Y5qp40XTP4PVqStmpaP4lh8P3ycnsRGAl
	97QKGLY3PlSzxg7vmbrkrjbj5EycVdAcSbVlyduvh7rqVlGKJubHJo3uxbVMvNXy1CLxr2Zf4yP
	jxuuvMFXRv6QafgEYGZFjYjUXmeOYVNNB+V7GIvv9KE3ov6hL6FCHieIPx76he6AQODPLay7jjI
	U3MEyMj7MZkHw67iZRCnmcQvgLtCOlBUDkqdL5DFjPKUj8bj/4t1zQy9bvaXPY67eoV42vbmICo
	n2fvHXj8n2BVgJEt7nE6ddTjpB8
X-Google-Smtp-Source: AGHT+IHW2rHrGjnHbMx7gSl8Rbl6YVS9e37XXYhb9JI7btIp7PDkapkLHawpn2EWrbvZF2/0cVQnBg==
X-Received: by 2002:a05:600c:8595:b0:47d:5d27:2a7f with SMTP id 5b1f17b1804b1-47d5d272cd4mr3349085e9.26.1767033640044;
        Mon, 29 Dec 2025 10:40:40 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:39 -0800 (PST)
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
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 14/15] dt-bindings: arm: AT91: document EV23X71A board
Date: Mon, 29 Dec 2025 19:37:55 +0100
Message-ID: <20251229184004.571837-15-robert.marko@sartura.hr>
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

Microchip EV23X71A board is an LAN9696 based evaluation board.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 3a34b7a2e8d4..b0065e2f3713 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -241,6 +241,12 @@ properties:
           - const: microchip,lan9668
           - const: microchip,lan966
 
+      - description: Microchip LAN9696 EV23X71A Evaluation Board
+        items:
+          - const: microchip,ev23x71a
+          - const: microchip,lan9696
+          - const: microchip,lan9691
+
       - description: Kontron KSwitch D10 MMT series
         items:
           - enum:
-- 
2.52.0


