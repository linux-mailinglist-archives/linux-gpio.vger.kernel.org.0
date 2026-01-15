Return-Path: <linux-gpio+bounces-30596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFBFD24440
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 12:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBFEE30BAB93
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 11:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D5937C117;
	Thu, 15 Jan 2026 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="CtS//emF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5C637A4B7
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 11:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768477284; cv=none; b=d/pHKLFFg0Tj8TvlV20a9U5ryPIzhM6N5otK2Du3DMKPLf41cLnIPwX9pLv1H6f1xErHGZ58lnLkG10y2grsnNddFKyLO6zgu+N7c/c+i84pkmRFuiV0qWObyKYvNWvu+QlJpTxHWTlQDfmFp2oKFiDhtKQgUuYAd1WrUNZvJ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768477284; c=relaxed/simple;
	bh=oZkxyNVxYkEwJ2vPpe6uc3+Y+pRPWdMC9g09igJuSnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QG7BZhBmikiWHKIR+iF6btcRxx3wI0WkmBLgFLi50RUexB8p6qc7dbr3M8UsvPnhbIT42vksaPGyTv34ZXajbXOHayvyVzhcz8icXvZuVBlKgtX9uRm6LVWkGw4rfBbbe2lMyHNT/ej8++llLKoPdfRK4Fkio72CXKObGZo9VNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=CtS//emF; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1233b953bebso1972031c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 03:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477278; x=1769082078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMliUwDqBaPP5ftrxzLcCvtEBpKI0UiOIsqsdzxW70g=;
        b=CtS//emF+yK1ZnuPnD/oY+JHTsYeSeCJRHslgL13DIGHhrYLJR2WCsrABgc0FDz8tN
         B2v3/aJaX0rqioEPj7o6UvPnblVbJ5BPUMXs2FXhaRbIxfK0vsBzIbFeVHwdxxFaji4E
         8mHJHdwEiS4v814l7OR4XJBze1m8pxWiBGpMmTX0hbE5Ny43XDLAq0XZ01eYty2yYqYg
         SionVUSa0Q6EdmpcsoBEeUJTyDPEqbksBJ6YtE3S4YwwYt7lrHjinWVWjcSd5Dvm+0KH
         MeOibqCGEgq2WYCsaOOHC/5sPhmbpR56RhjmRHy6KRPCGEJnYoaNT8ETSEgIZnm5Y8Qr
         HoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477278; x=1769082078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gMliUwDqBaPP5ftrxzLcCvtEBpKI0UiOIsqsdzxW70g=;
        b=C0I6C9QvhnrCVq2KCmiQwaCAiVQaSMwidrgXzwOmfwjefYSP+oG3TLuhRsDId0zYMY
         xDadrtK6+it6OSgo5EQ/8n6rvfWXkuC7ebilendjFfNxXuCYjAQAj0fo2Sus9wpE+/cO
         aZUVPdkwnMtSjngBH62ei326MI57m9tfrqv3HoRm8V0XBad35RK0MZReOMA9v5BYvFfX
         vl1onybx8vHHcqZLybtTvhcEmYhfrFe42gwj2rTuFkb4ySO9+DR0CLLBEEESDD0Oq3bo
         nylnrWaxhjWe4jX/dP00MCBoGylUqQG/+4DPXdTXqmoZDpPB+cAFTRE3qGKupWzBnJmQ
         L23w==
X-Forwarded-Encrypted: i=1; AJvYcCWhWVJODR3IxdTdOwHmniGzbASxnvjNJ68I/E8sS8w+9OfqHcXsVxKyJ15HoitMSpLbZW3JNMMhPCAU@vger.kernel.org
X-Gm-Message-State: AOJu0YxFgbhDSTUmubwswou+lb/V7hCXErOXTWyZjx3X8VFK8vDYvZnu
	j9FYabo5KGtwC7iM6ET1q+NV+VCl/wwSU7Tjxl47iRM6hjMryOARmJAJGE9TJyh1VaI=
X-Gm-Gg: AY/fxX6UrzhkIdgaAyQv8K/PLTOxYxsXvmTjcxOdafECn1YzziWnEOp6eQylkzy7e64
	qYtu0DBHhpfKLP09Wc5wZEnhJkD7pK6IaZ6I4ULIgEDH8qNdpRj0Yd8/zlOxpAHwP/WXGrX8KFk
	kYdXbEwqLHi1ESCMJRPbn6UYRW958LY+qSBXbuImFaOm/Rp3+nRibJi8RvrK7FfFmVI0FRFISNM
	RHtLhHn7TuRlljhkxiQXnZHLJt4Dw00HyiKVZMe4sNj6rTMrIIRsd9C6bKzXLwKI1PvvV237cN3
	igj3nsX1VCjRjsDTcWcUdLFZ2LBxz0tr3uTNo9W3tVGk/s8J+JYQqonLZMxjRt1Mun//F6YvZL1
	LCSY3JEgS7zaE8Vj3UE83DwsAi+pWqbwL0EROHIg9jfizRoBnu0kzNmn8VmuHp1RUP27jXzrRL3
	5vuww+2DBQ5jiJIScXfQoOgOZ3XxdYkISC4fNlRRSChHk1Dvv7OkaT3H+0ej+PzpmpUA7WmSI32
	OCSKwKv
X-Received: by 2002:a05:7022:c90:b0:11b:9386:7ed3 with SMTP id a92af1059eb24-12336aa83bcmr5197544c88.48.1768477278199;
        Thu, 15 Jan 2026 03:41:18 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:17 -0800 (PST)
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
Subject: [PATCH v5 05/11] dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
Date: Thu, 15 Jan 2026 12:37:30 +0100
Message-ID: <20260115114021.111324-6-robert.marko@sartura.hr>
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

Document Microchip LAN969x SHA compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Reviewed-by from Claudiu

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


