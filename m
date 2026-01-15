Return-Path: <linux-gpio+bounces-30600-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB4DD244A0
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 12:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10E1B3087992
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 11:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A15137A487;
	Thu, 15 Jan 2026 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="zqtLJLd5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0D33803C2
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 11:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768477314; cv=none; b=FiUe8QJ6ym4xlWr8zDq1X+tKnJPVMA7iD8ZWE0IlYA63xNnWW+B5b7ygwQMPfMvS1yTPkAskAtx3uAV1scd8Pm/0G4fY85yiIG/1YYn9EV1ftdo1nj60DJZCkog6KThXGlRRo4L9NMbDXEGs/7+KmzfKIn99JM5ZlIGWwslGx+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768477314; c=relaxed/simple;
	bh=Wp32ITHx7s2+X+835Jbu4gJ7F+S1PggViopmVDWASsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6mwWNfVEdl0LmzmUq5K7dqEebxSDeoPwEyBpwF5R8OXa1JPNXXc9lxsfdj0gltQ4Jxfk4cFOZQwwiqT8XeRia3QGCpwr7NffPZ4r7CBQSxyY6BbT1QnjUwl/orguCw03FJg2JRN7ihokRK6SxCrQmSDYvxWk24lVc2IDhFALzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=zqtLJLd5; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-121a0bcd376so2136399c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 03:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477310; x=1769082110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6BNeAKcW11oL+iAABviMYbNNLfmxyGYsliVava+u3M=;
        b=zqtLJLd52zChUvs4oYWUJHIMhxUAmPvrUA/0RxveUEHPvgdR011hU/GyGExJrIAUtw
         ovZapknkgFlI5/Zy7PYrplN8lb0nEvwlrB2bitjgOHP/9PAg1nrZA9Fj3UIvooQSj2Eb
         aOmSZy9AaiWsrmQA8A5g+8gR30/6QW10C906so7KV/BSfppbdAkUBExMMWuejC1oyg8a
         hS1eVLAVKZ6isDD7pGVC/rjV+tM4j3B2ep3BO5FIQk93c4p82HoWhGA3oGp1gXkRV+Fx
         7lVupRmwIN+TVrcbFZYu3fb4M/QxwuuB4FgD5JB2r/pXEiPUEbhi6FRsYlGJffrqypV0
         R7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477310; x=1769082110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6BNeAKcW11oL+iAABviMYbNNLfmxyGYsliVava+u3M=;
        b=vUksro29gOKj9glJOA5B/wadILWcKn5UNhuyfxbUyj3C47INvZFD2exT24mpZl0xD4
         JOy8xt18AzxJuwc9HjkyDmuJIEHpNieej/cIacSjK9jiZZGeKmBOBbDw1mfPzyU4wsg4
         T7WF69PmbfHs5RGLTzAJvO/dlmi+2p4NeGyseL6sKaUOxbj+SbzsaKL4C/qmKsUoL53S
         oP90OzKbBHr5ujiqyJXTdR9mZbQrpAMVfoDlQTPSBDXm8HFp826Qp93oy9Rsr343x7l1
         57GyKMOtNqn0GlzokKZSN75Hpxfg67MSw1z4ytVkB10mk7d8WXCALBO+mJpKo9rBaXBd
         WS4A==
X-Forwarded-Encrypted: i=1; AJvYcCUVsZjAkx7zqbUnDg58Me1fryxNQEKONiV21Yr+WDZh01VlsAfjHd3HTmCVzWh9Ww/iPQjy4+gegSF8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7gAa+mjpEG/0uanwTciAO2lbMChtuX7AqbvttfIhhXrMoS+Vj
	p9BNMTFBsu8t7EETl3d7QC1uGPd9pndUuwM9e3Im9MZ5Fl3ipOUXGBEIbw1Hgehz5dI=
X-Gm-Gg: AY/fxX6cyCRW6bb3IQlESqw4XWVWifU+m1Vjs5+T/Ajp7JO3dnTp4XoY166mxItlB77
	GWid94v1Sx07t2QK12ZWlBHa5+3E3i+qb4elmyODwMobWKPled9mjYGTHH3TzdT8805QKv3rn3A
	+nuP1OEyMNYmPRGFTypVr+qBItACte5otjSG0pzFszD8GPTxf3/fESDK+/3LQLNrXVmS/Zn+TyL
	JSBUjUY5GC4pouMD0SaV8DJu3RzbizirbOSXoxmWDgOwus68GyLZyT4inXSEObc66/hkhzGAKFm
	1WszuMc306kc+JfNoSpNZMLuWqt3MD23jlfLeMNKCvtgrdR+hnVg4JBHvYwjXOiMW1sVyuy3BVY
	UfsT9FE6MRCgDXsJeco5jRQDVDQJva3pr7H4Y+RbiWXGtIP8dFC1cMSxAbtKgWvHxPvrQgXmsLM
	mGIys37upRdNcXj7EdsEFO55ZFVVHw/dhjbGZg4vJEyUXGQVhg4NNLU4Hk8NJWkhKG7UnOpWksH
	onExrRR
X-Received: by 2002:a05:701b:2715:b0:123:3461:99be with SMTP id a92af1059eb24-12336a38feemr6814416c88.21.1768477309977;
        Thu, 15 Jan 2026 03:41:49 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:49 -0800 (PST)
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
Subject: [PATCH v5 09/11] dt-bindings: arm: AT91: document EV23X71A board
Date: Thu, 15 Jan 2026 12:37:34 +0100
Message-ID: <20260115114021.111324-10-robert.marko@sartura.hr>
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

Microchip EV23X71A board is an LAN9696 based evaluation board.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Acked-by from Conor
* Pick Reviewed-by from Claudiu

 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 68d306d17c2a..bf161e0950ea 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -243,6 +243,12 @@ properties:
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


