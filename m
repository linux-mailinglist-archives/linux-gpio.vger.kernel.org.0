Return-Path: <linux-gpio+bounces-29990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DC1CE7E02
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 19:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6C453057124
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 18:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A1233ADA8;
	Mon, 29 Dec 2025 18:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="u+C/t36R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0AC33A6F8
	for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033633; cv=none; b=B2Y6iX0EN23xIMWVojEDJbUywkosePsJPI57h3N0azi3C706qQgbsT2TLfnyQLk2xn0x2Xt7WGa7TVNmWuj94sev0x/Gzbfd/7OudJMOPBL4HMVhb0msPdcrIo+fhqyr6Tbd/mu0F2oWv0aq0i4ysnN6fYhOuWJNZUKvqlivVjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033633; c=relaxed/simple;
	bh=7hKH5EzmH1tw2QTQXNXPEJl0sVHK/le/PcpUxmqe6fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAimOsZI/zpShQcLrtU8p3keq8jzpAg0Ur0ca52pJpzbrYSF6XiKZIY7vF3BRJrEotfk+6NCOKGVchjBbRK/LGcyJkPBcUnoFgbbsI98S5EoOFM74Hh/r0f1r/QtaRYYDAx/v9WAIdSqBlpqgZu9su7t94VbaOy11OPW7rChQlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=u+C/t36R; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso75498535e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 10:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033628; x=1767638428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=u+C/t36RxL2h1deDF2NgdB+V/8PFIJNoVWYqFiBvqPNfeDhDg8nP4BHIkKa+gcW6Kz
         oZyl4BCY1ZY0UlTWbp3WqvUDh1jCR0nluG0nE8iXrs7pjzmjBbQHIbIPL+8dTif2iApy
         49ONVh5e7r1p1beaG0DMCImekdmaXwxCCIx94h6Iy5ESduLUfRYjQji8QXQDkAohfmk4
         FFH7obpel1rzxwvDQjHUy+5M6GtE/DPaAt1uTJE0l+zC7cPSxPsPuUtaftvHqc0L54Uw
         F9IFWNLp3CuSTGSt/Oey3Exa3OKO39cdnJXeJo/5uJiqKIWjp4l6/JJxmT9Pm8bsytkv
         193w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033628; x=1767638428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=EdktbFgGoMPs1jiu2/k5W1U4tvICA07KuwSv/X5y4NHTs7Eb4cwdHpC5ub/xGC8M4/
         7WfjWHetpAJagx6Tkom9pKgQYd6K6UCn6qg4+wSvGodbfpAN4ZKTf4yXY1ZmDrAvK3QY
         pnrF/cvUkQQUXAVsjrL8kmgPmrLTC32dIc+JW4o/jUcp1MlgB1APyTb/W1vsQkr2rb/A
         DbTQpxA38WSA2uaHzSeO88OqPY4oYyVz1zSMpoLKHT4nc95W08ETuSNGDWHpRCn08bYM
         pwvvZ9BoCunchxlX4CpgCsdlGapwjwRX7aQ2IZaHD6rlKdCnuYkbUkazd5jLu+alzQmX
         3BKg==
X-Forwarded-Encrypted: i=1; AJvYcCWmPPtFREL5YAb2rK57pMq5x+86y2kvL9kSsT+XShmfLo4Xo+/yUyEk6SXE812wXdwAJrjxlJ3OlnYE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+/vHcwebpvemtMhlEEzfpCdNGf07tMh7PnUw4/JaBOYflbmKd
	ARF2lOvM1mFWx2c7pXFFERyCx3IouqWNToq75TNd5ZsaMexKqZguujWZjrBvSURRdas=
X-Gm-Gg: AY/fxX770UlF8SnOe7KvVi7TU05vvYmaY1F/Q2pX9NckqxMGzdyD65egHc0KyeDf8Xn
	X3fxNT8NEC2kOyvP5v/F9C5kLf+wqYMPC3JcJs2XovPvQnuJd3pvao+iDb8/dfZBaH1rKEEyLQe
	13dCfeWcXNtn8XizZUoFasSMF3Zy+7L43XuNRAnSfcQJYCl1xtiYJ/W0NExj5EoEPBhhyFTVPhs
	6pvtbKNDiY8jX6RhbZCwKdUkkOIkZo+eozjosgs2ZwJPRrt9EVA6M6xpj5Qmui7h+DAFMJRzsQX
	BlMs4+IXTjbGOfC2N0mHc18BSkOu69Whxvg9r/GGQvjULQmLybc8Xo9uRv3O3Ghiw4U81XOR02u
	jNK2nEOFJC2rNHqubQyzkM0i5J4mn2IFn+CqJ/ksKnzKdHG5YvAIvfH9A3UxP0duUBSVvo7DAhv
	2tTDJTLiRQ9AJ5pxcRkkRhvgcqnLp8kuiEcUcHPar6n42vvzqgAO4fsK+AqKLjIpTJKVI3gant0
	G/O4tiaJ1V2jSixuR+pV07fPO3I
X-Google-Smtp-Source: AGHT+IFilbmrX7qgCmCad3pYK4YkE2820iFvJcnWl298VhAC/QPnRoMoqJ3XAnKO9WPGPH+NwyaEYQ==
X-Received: by 2002:a05:600c:468b:b0:477:b734:8c52 with SMTP id 5b1f17b1804b1-47d195670b9mr338260535e9.14.1767033628587;
        Mon, 29 Dec 2025 10:40:28 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:28 -0800 (PST)
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
Subject: [PATCH v4 08/15] dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
Date: Mon, 29 Dec 2025 19:37:49 +0100
Message-ID: <20251229184004.571837-9-robert.marko@sartura.hr>
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

Document Microchip LAN969x SHA compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
index 39e076b275b3..16704ff0dd7f 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-sha
       - items:
           - enum:
+              - microchip,lan9691-sha
               - microchip,sam9x7-sha
               - microchip,sama7d65-sha
           - const: atmel,at91sam9g46-sha
-- 
2.52.0


