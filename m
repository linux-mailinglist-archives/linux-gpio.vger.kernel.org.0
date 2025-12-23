Return-Path: <linux-gpio+bounces-29856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D95CDA920
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 21:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC6513024120
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 20:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815FA35295E;
	Tue, 23 Dec 2025 20:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="qEXm32uj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0DC35294F
	for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 20:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521263; cv=none; b=K7pF/EWEAYrIZ1H+jwTBKWlLRYZCfJYghfIb7rK97YsfoL7LEt8k6ZFdw4HY+IFSbYpyZzIG42TUGgTxGMUphCXWOSUjfOM2OBLjgYb41q3Fybf4CepO8eqQiMcpqcPshrCb4eXptSeGaMAjal4mja3B7GaWINLHu+tdpomeL7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521263; c=relaxed/simple;
	bh=7hKH5EzmH1tw2QTQXNXPEJl0sVHK/le/PcpUxmqe6fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bake5IgyQR2MDvnanwUbRG/JR3nXEG1k6Ga7lyNUZkSv01EbMd9B6yz2/LmKLw/1O29Uuf430EbmOA7U5CTnjOw0onfwprA0fb0Wgxb9RWCGyUa49Y6BYVfuRpw2hHoaSe9oFQTdgHkSwEfim2g/nJDkAeh1m6qI2D+RtlMyrKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=qEXm32uj; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso5382956b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 12:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521260; x=1767126060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=qEXm32uj1+odh+mia+XgDAG39bxsV8BBnWSP0gbyH5RJhUfEzyjInuhiC1FtX9Wppx
         KLxk0YDYruP0rpIpgefdNHqLi8+C65Db06vxmizhWFJNlUeyE4PALzO+idf0NA0jEvMt
         4bfGeG4K9boAoeBljyhuYdHQPXx1fzDNbBeLm+/ymuEu2mywxvu0nFbFozqKna0aW5o9
         UF/l+z+RE/wWwKcEoAMBfnOLbiRWzz5O8Ua1eIoWr08agzCuSQBanUqTE3b4fvbRKl4J
         RwJDjpDIeBb/IhuLWShFAWC3/IHBkQBxlolO5/7LijryExtWwxx8zreGCz/caCv02scj
         QTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521260; x=1767126060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=Oco6yUzblosnwF73+wlDL6n+AXVNlICQ72NCe8i9AX3Z6kDTeHl/ViqvWO4yk5sKVA
         H0QsHqc/6ut/GD6eWhi8yldATg74PqX6z24mLAfUEzPYtRPQNKwv+deEPadql4Ipv8BS
         kVdG8kudPoYlfzD+7x+02sWqni6W/FSDd2EqE6YIj+4qyEDmNQYX3CDHL8ccrC1vZKu8
         3B7lrb92yopqg5kCWCsoZVBgxeZ1fMBFrUTS58U/GPLkm6jhfXg1vuHVyIsq9VmWRzfP
         Es7PrHBP9m6B2v4lXa98W1xegG+Y2rFZXE2cEi3Eo9DZpGTaGARjR0ib3iQgZ8qaGln7
         T8FA==
X-Forwarded-Encrypted: i=1; AJvYcCWKt0N3AeDNSHNzVo8JUR4YGailmIBP8t7Vk+JEGTPquKOnoRFWW1WVNvj+m8XTDdp2a6pEvP6iKKUX@vger.kernel.org
X-Gm-Message-State: AOJu0YxrpZ2LR6vwqBhkk3rrw1p8lQ+CeNMiMIveuHv756Azz78p7KkV
	msR5IjvkhZNtgATheoOI1z+hCHvbXQc7hJxX34e4sVJFAVczR8WScUC1Ge6/STKtatQ=
X-Gm-Gg: AY/fxX69GBW1ggCdyvkq0K7fmG1A/BH0IRjyoFiMVEs++q1swq85QZCjAiuK+xrEKw5
	a3tRntS9tbXPdIm63ofefy/DLa9Eg2TcR0eVWLKqhfBzjR/6g2IQeZ93ul/H4E2pMaVAEibKYvN
	RR0P9Oqy8B0QC/+Esspul5t/7dUaoPszmz0co7cyOgnZkeWEQEUg6NyhvYq3gD2V5pY38DDWv3I
	hOng+gMF+Ze5ieRVdpYwcfYA7LpA5d9k7f2gYBXIxGHSLUgvReLJYMShB2dJuyVp2mnK8EERXVx
	6bDQdPfj+e6eGqfMCytyx5i/pD2eh6f94VGeqPwQEIcc0kHXMGs3m1FnDBObAn9AKGSgTnY1zb5
	75FFTgJva/QHREyZpMR+8YGGekhZF5yjGQjE0/W3PMIwpyzVF+Q937vw3XYMPCJvVTdMwvwscJY
	GdRDKz/G6ea7g+tDP8nir6onTPPtXS4efIX0gJqwYG4sCZ0VAKKEFs3Zfi8eSCZao8BU77X3kC+
	C1QZiRa
X-Google-Smtp-Source: AGHT+IHKfwHDjFbBjFoOP1ZNZG2yYIy8Xdi86MslAqVbrnS76U8emwCJO7CURd8duOcxnItzlu++Ng==
X-Received: by 2002:a05:6a20:7289:b0:366:1880:7e06 with SMTP id adf61e73a8af0-376a5449622mr15082294637.0.1766521260025;
        Tue, 23 Dec 2025 12:21:00 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:59 -0800 (PST)
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
Subject: [PATCH v3 09/15] dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
Date: Tue, 23 Dec 2025 21:16:20 +0100
Message-ID: <20251223201921.1332786-10-robert.marko@sartura.hr>
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


