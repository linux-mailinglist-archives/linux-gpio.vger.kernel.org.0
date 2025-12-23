Return-Path: <linux-gpio+bounces-29851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6641ECDAA56
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 22:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B02F306B1B3
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 20:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5AC34D92F;
	Tue, 23 Dec 2025 20:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="WPMJMxT2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2867A34DB44
	for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521227; cv=none; b=Qk6AAMXkCxxE/jZgj9QFyazGhMvUro2oCSUh4Kq4bSN4yGbvpfeIgNZ5hvbNew/jCnZPh5gaD151PWgEgGSyoMSSfhLo7LjMFBJG5l8sGmA4SsIP0nnMeCsAXOEMl79GEdtIIqL4m2oiC+JgLWfuIU/wA37s1BBql8fwpWk0qGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521227; c=relaxed/simple;
	bh=HaP35Mv3tJhzA+ZM5JG9j+YNJFp/ZeK++35o7px2hP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMqjaE7Mn1ZNGg2blB/sKbV/XLWH/SIX/v72YR0aldfYz+9vIFysL3KHk2T3lUWpnbHvcvD012sYSGuXOySROEwBmhdE2NEeDbXHa8UBo4ibHCUE2y05FiWcdzuMVXfYYgiGwz/2bTc1XguOUqfRkcN1Y6QnBq5wOowydAdCJgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=WPMJMxT2; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so4802745b3a.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 12:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521224; x=1767126024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTgt2hO049DGrJM4Ny2YlS3thIKNeyR96EH9617zL0Q=;
        b=WPMJMxT2Z86tRUSGNKn0CYAH7lwYVAgIaWB3yVBHo64gd/T2s91doAUDCV8wqm3d1k
         DqXXsn9br1YlTxfvMupgH3TmIT1S0x0xNftveqUk5jLtfQ1ixzf9b3ZSBozDvQE2pyQj
         hhOrWomNhyMz/EC5b18RIvwIaScGg1TC0qvDuhlBcWJ6GfC1lTqE2K73G9hASX2Oxm6M
         /UgVfZTNLJNSpUC4EIkLNjKwAmUHnH4XO05eDMmPyIj+hi6/jvMdE4U0XPk1o+gmoLW5
         VBVI94hQaZ0XoDa6zJ3zoBMsb5xR+5HTpnU/B/bPo4koRUuMa3SXd6NekJ9GtM3jn5gy
         M6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521224; x=1767126024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PTgt2hO049DGrJM4Ny2YlS3thIKNeyR96EH9617zL0Q=;
        b=YsmEG+sOoSNVx+CVrtWkNITSmMJHhG+uD33WvomhnTjHaTJe+D50/JJdOC8PKd/ANE
         1FxTkUiof+BPmPkGQ81XjLxub99O4uHKxzdccGe1MztwK6yrbfEkHJlPLsKdusBPZzev
         rdmkA/jW/l3l8dfTlKVOAauQrgQMj6Ms2riKuvfnsPXzeuYLRk/+FgZ4PHDxNsUrFK4Z
         NZQfN+2jIYj6lgeNpOrxMFHfpgBQNktiYqLpX9xYHcSzRwsYY1jhtjRrMu89ANQGFGpu
         M33zO8pqet7FiHlnB81qwP44TsuKvui0OlCTKtVpdbBcedqd599/FBnxmIlfxd/mVTqN
         taNg==
X-Forwarded-Encrypted: i=1; AJvYcCWgYxKi/SDyhJhffZ8efiOsFomS+pIImGXepTm6NE3RQwHGjjQ3eSfOB/hEH8jBH5h3hAmNDgj90V0K@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx/SD99WsiiqU7B8UlZaJXJrRHJbiRrwDLjl8M+5TxmkF8XjWj
	ah2ljWUTY96YihAgixFqsDwx15gS4q71IIpRL74OCwGzWGoql0HPIi8DG7tW6TOirEw=
X-Gm-Gg: AY/fxX4OMOseYu4RhhSUFDCIpCYp4ZIxvmfa2ZtqmdIywwbbZBraKR9Y9asR4QzyokA
	ECjKGEJwqjhe1/OxsuahlqA7s7nyAtsf85TxXmsg+ycBEqjWbVgVYUKxtPpaPR6cQn9XI5QAENr
	I8ordUmjKJ7FkKXYd83NblM9PJXWUauA/rM3cqdxS0iOkqKfQqIxg2vFmbXu04EsITy2PQ/FcKQ
	Z1Z1KPq0ndFcdBup5e5Zfpw9hTjFt8QsQ2MdKfiUCqyJ+pKVpIDPyLQV0x8Q/TSWNs9tx1MaA5D
	xqHmlBhyuEKMCQYi3+GrJ5OaRon6yrPODIBWPQeL7uZs007Jo89B+1BdZaCPoBTs91i1X2qMo36
	N7x9AVTwCiB/hV6iAecZNWB4i2mt5U4tvvbP801JVx4tpfzWXQ/fxleP2xcwLc2W05M5LQyejfm
	NcmYM7wmYvfdrvkZwjd6aEXdP5Yhj4tfqI6f9UgpweBNd/og4z4oDr5PfaQ1DqgK1fZNjVSNuUY
	zOoiSV+
X-Google-Smtp-Source: AGHT+IHEkRqkF3+ulFb7YQxPiXmGF+AIEzrSLTHIV/1Chrc5EC4Qv4EqGmxiVXP6kKzXYBSaNsC5Ow==
X-Received: by 2002:a05:6a20:3ca2:b0:344:a607:5548 with SMTP id adf61e73a8af0-376aa8f3946mr15876623637.58.1766521223699;
        Tue, 23 Dec 2025 12:20:23 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:23 -0800 (PST)
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
Subject: [PATCH v3 05/15] dt-bindings: spi: at91: add microchip,lan9691-spi
Date: Tue, 23 Dec 2025 21:16:16 +0100
Message-ID: <20251223201921.1332786-6-robert.marko@sartura.hr>
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

Document Microchip LAN969x SPI compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
index 11885d0cc209..a8539b68a2f3 100644
--- a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
@@ -19,6 +19,7 @@ properties:
       - const: atmel,at91rm9200-spi
       - items:
           - enum:
+              - microchip,lan9691-spi
               - microchip,sam9x60-spi
               - microchip,sam9x7-spi
               - microchip,sama7d65-spi
-- 
2.52.0


