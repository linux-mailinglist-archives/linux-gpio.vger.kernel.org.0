Return-Path: <linux-gpio+bounces-29984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A754CCE7FB6
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 20:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC6A73038032
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 19:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3483375C3;
	Mon, 29 Dec 2025 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="EtboB3HH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B483358C9
	for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 18:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033621; cv=none; b=Q0NeHvt7mMyNrHgplKvtiWnhWpCrT+iJ9Id3Seh0XLcYKKAZf8L71dUp9MNJ+5wqg0SHdmOfx3SyYtsxzhB6R8F8gMGi2Oxuv/jFRY0yPSlvky+475s/Rdhhi5JGljgIe5dft4GdUNacLX4wgP8jXMwJHdhFonVfy1340szbehA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033621; c=relaxed/simple;
	bh=lnkhvIt3TrOEyzf6TQ1BG1hfakQAvNrAup7QLQoickg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1ZrAvitOCbMYqgKITm/KDXOS8kzDopnKYFAWKlxMFNCUFCXl6E6J3WnTMGK3VcaF8zCZjkpp4ECcIp3Y1vutuO6JJhlLE9Jmup5ldTdX/+L08mpNk9h3DyJBRVlw7NtDE2dSEgvnYdmoDx73NJvLkaA61XSvDteM66guuMOppI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=EtboB3HH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so71187725e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 10:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033617; x=1767638417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=;
        b=EtboB3HHe08w0XqyvQc3lIhAD3Wrb3A+jSxyRDBnGZHNNGsDYTpopftjz07wgCqGTg
         wVeB0SBg0sYtcFqQU94CuwWFrINZ8JOPcHYxaQ6Eqrk7RF9dttwfVjkFrtKvAte42QKe
         r+FYs+x/gVWoMwshb1deUAAslnK41Cwlqc6VYn9NzC9sJc0HbsKoDjg1tHFyEjsIuV1E
         ATaaF/DfSISmFUI6qUXqycxRqvEHQLBI94pKcPYVDNRLhHS4veRqPGH7ev44aJH8hGtb
         2pYEvIocOndgsPPLrTFgpsyOh5/kaYmScXGx3p7T8JaO6Sc3tDW4z8sPJigQKU51gN30
         qWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033617; x=1767638417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=;
        b=TFRgJTbQ9XnRxjyoF0pnVT159bmqI3E+fYVWkmemQ/yKdPuHEqjeorFw2uSOWzjlyB
         B14RSJAxAHx3JRYK7F8CK2Sh2hTU2dPMO0LU7NlnYtNxgo0+zyRhaFohkxU2YgVN6jTS
         KPbxEZZxgat7TMRhCZJQ7qwP7IjvMhYSu2J2iqhh/ecUw8bzXp59Uvy7SfN2HN0uUm4O
         i0CmbDao4QWOAtE7KiiPo8o0MuOV/No0cVhi7FEj9GUcWmTHUVbE+skCgYh1w9rcEvmN
         UxaYxgBa9OBkT/+vQQFuBXG6nN8Q2d+imPvs8qzaXEzPpOxn1goOjDKDj6mzWrk6KSmK
         tS7w==
X-Forwarded-Encrypted: i=1; AJvYcCXS4HUPo89eaUBCaB/I00A3uZ1xC5uH807REpJ9CtHVYAc6o9cw6vt2G/ndK7V/aLOcCAI8iVRRHb1J@vger.kernel.org
X-Gm-Message-State: AOJu0YzQIT1dLIwxjFm1HStEWBdgxqos/qh6UK2EE4awqA7FXP7Tp61d
	38Nkhpy7IYBlZ3heoFA4Cv+7UCWyzIRJTH6eB/kAi0kNbXfuPxkLOR3OqOgtIq/NxVA=
X-Gm-Gg: AY/fxX4nJvfNGC0+SUVWnmW/2wP5XSzXkRld1F5uSytQUUuCtAS7lhU0rAdZ7KrxAVr
	0Qyerxth+OOviOttoTw0nuU4LzI7Hy8dBAPOHnjoV6e+0xS3Hqn5JvCitzDHnPekba4kWpmCyGy
	m9poF636xmKn9TvT/6paVlGI3nirbtNGNYrrdncAMEIrIITJ1OE3SizvONrd0YwrKnTQkRyh29w
	sBA3DTOWTB8eeaVak1ePAXdo5tBtkPz4ggikss0k/PLKKevBM2AAE4+QeXFnw+0H1uUM/fEfvIl
	vNUB+qZ8NJvx9HOvgpqnPNAgPP/FzN8vwF0SCdcmAAvrXU6DJGflXTBxk1kXD+4mh6+5Qdr/RFA
	5eaUJnvPzfctL74sDNpFcwKb5VsfnCZqisuEFE8oSp+j4t4Uhyjd7fzCI+cj+5x2YqQtw4JHXjf
	T7/eiR57K6aw9FPwnC2u6A36zEczT0w6O56VDEjiogvgy7vxLuRjz8NLd/lzaiAJ64gmllbThzR
	Dpag8HnBCZdZvCYP6WpOZ50miBTl0hZ0lTlB94=
X-Google-Smtp-Source: AGHT+IGjzQS21rGuoSBITpTDpuhXFeVyR+ePrw+9us1bVyog91e0BDAjrgenQhgGZwBix2fL5K0wjw==
X-Received: by 2002:a05:600c:1d0a:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-47d1959f72amr367970555e9.30.1767033617043;
        Mon, 29 Dec 2025 10:40:17 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:16 -0800 (PST)
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
Subject: [PATCH v4 02/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
Date: Mon, 29 Dec 2025 19:37:43 +0100
Message-ID: <20251229184004.571837-3-robert.marko@sartura.hr>
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

Add binding documentation for Microchip LAN969x.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
index c7d6cf96796c..5e5dec2f6564 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
@@ -20,6 +20,7 @@ properties:
       - const: atmel,sama5d2-flexcom
       - items:
           - enum:
+              - microchip,lan9691-flexcom
               - microchip,sam9x7-flexcom
               - microchip,sama7d65-flexcom
               - microchip,sama7g5-flexcom
-- 
2.52.0


