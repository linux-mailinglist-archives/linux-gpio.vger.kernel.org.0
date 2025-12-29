Return-Path: <linux-gpio+bounces-29991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FD3CE7E14
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 19:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0337D306579A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 18:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFC233B95A;
	Mon, 29 Dec 2025 18:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="u7HmGPkA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F5D33A9ED
	for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033635; cv=none; b=JByqMxG6yqdHuzpbCJqLqUs71v4+7GLjk1F885/Vnhv2gu2LvuDF/PjQ+WN+fK/ump96RfRHKb8XP6if8yspEglfoIUDE/lD8NNqSJKyyIPAJPvTuJ6lC6IJhlJ4GvHtchAdjL05ZFhkEdY1BEvLE3/10QALk8l+lNOJPOdjPIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033635; c=relaxed/simple;
	bh=7jtkvldmPSo6tJBxZSibRZu5hmUTyLaiO8iQq/Sa4wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTc/sWWn2dDTl/IYHPtH35888XFGbBogJaBT3eclqQjHpxvm2Aze35bg1eUMJqbVytP4p8Yi2yXkfOTvIf/bT5mnC8qjU1wYws2BcOsBcjLU2W6CPMssK2gReE4iBx08my9XF1vJ92RogKLVFsn4gHzKKgbQK6vVubiQIkOvGRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=u7HmGPkA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47774d3536dso74515595e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 10:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033630; x=1767638430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=u7HmGPkAkdP3R7rcUekjuNxY1rqjuIdNyca9I/XGM9QnG+kfzr1RniY05coFnav3Ng
         RYHUu+lqU0wDiflHit52ZG0t1bmh/XBC+sQTV348FEuYagsi0eLdDABPMr2PVkaD7inJ
         smarDUYRZ7OjWsdOyQ7pkBVYoLoQKrRfREcBHdttYvdam13AsICcjYpaIixihY848NF0
         4+AVUcKCS1vvv6tkvlnLJv5CroC9pr3VorsPqY0IGKUkVt2HWY+/PhFxoJpOM5MxrRZR
         rn0bKm0ktUYeG/Ov+a8MT9JGcL8LG7NbpQ5e7zQAkwYV+aLTTb3hvAKTdGWO/w9MZ01Q
         gN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033630; x=1767638430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=wZybpAnafMFShE1B+2oD4VcCf1jILs8HqD95qdhcj8mFBmyfLwk7nd5hULYxWmNK+5
         RynjOJl/doYBs/qTAa5l4HmQ2ciVhCbCoYE9U9fIBPnKJbI5cS1TKltKn/A1wYmHCq5d
         vm9kpcnsEz183QlZhRnGBgC80pvCLfiG2kTRuJZfW3559wU0zXjtQAf0rK1Wy0tsA6jX
         +7xVMGfrYDe8L09pIBx4OEG3elRvzp3uIULMdT6o4y08awKynOJ0cqd4CiB7cT+Pfy7n
         SKICus0eoOghbaCnfs3Np7iHmzG+Gkj7Rdpztkl7isy2Uc65GzOSdOmSuD3YUVJudfun
         Orbw==
X-Forwarded-Encrypted: i=1; AJvYcCVDp7jOrkX97/7FyxtIcRHn37paFjEbWFD8dlR1t6nPywxDSXMy3/q6xX1OGv7k1xniwS8/104t4+PL@vger.kernel.org
X-Gm-Message-State: AOJu0YyezMdUEePzNPbyjt26JJWezxqho+eNwWjIkfvkauGy2uEwIhea
	HTdUmpLb0ygLZI2VWrpjJIa1fFSJrg79KUld2EZJ1VaTTIBSrnoyZk3fKwR9n3V0e2k=
X-Gm-Gg: AY/fxX4LPXrG/gJLAqMWz58PmQuKDHWXRhmMJkK8gfL5IIGGBe3Gu1mEqoDXUxie+51
	zihIEwfApvjbm+wxOWuxeL04CeHGXw7sta70jdQi9txPUKQl0RKRs9qw8UJCFqWk7X8CSmZ4J6U
	0r20pRxcVOWPVa8dU++M/iJAFXbbDHR6DXXfphCSsYHnVQ+nytXtxkuAFkqHLn2CUzJdZLJJq55
	0e01VqULYZN1TREzUwH6TkqlP+iV+wC0MPbh77alXKX8sOrNpfYnlWMIWAr7Ysn0ZFsCd1v2VA7
	eUcku6rercFRBuNdk9087UT5PA6HwG9fpN2WvZW/dL1hZVj9fWSJRKRidshbfsMXTbplYzXMODc
	c1tGQX2jDSiHonaEXPHVcRiNIxIsettaqO50ogzT/79BTjees4oTYyz+oaBeRtuwlM8Li/J6IaQ
	hw9ZRCxJgZB9tSfnK/qlR/oS94lZK7Pl1Z6AA806dxS8gPJmz4MFuRliMBt7f5iCtia6BwGvj/y
	A4JHgq40EcErHw8vThRXwDluncN
X-Google-Smtp-Source: AGHT+IHU5TUgf1GXiZLlNhFvhk9NZs5LXOVfATsL4H0x67DGWgTd0xHPjLFDLe/wLhfc9aOjmrDYdA==
X-Received: by 2002:a05:600c:8b11:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-47d2d273999mr360424715e9.15.1767033630467;
        Mon, 29 Dec 2025 10:40:30 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:30 -0800 (PST)
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
Subject: [PATCH v4 09/15] dt-bindings: dma: atmel: add microchip,lan9691-dma
Date: Mon, 29 Dec 2025 19:37:50 +0100
Message-ID: <20251229184004.571837-10-robert.marko@sartura.hr>
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

Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Merged with microchip,sama7d65-dma since that also falls back to
microchip,sama7g5-dma

 Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
index 73fc13b902b3..197efb19b07a 100644
--- a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
@@ -33,7 +33,9 @@ properties:
               - microchip,sam9x7-dma
           - const: atmel,sama5d4-dma
       - items:
-          - const: microchip,sama7d65-dma
+          - enum:
+              - microchip,lan9691-dma
+              - microchip,sama7d65-dma
           - const: microchip,sama7g5-dma
 
   "#dma-cells":
-- 
2.52.0


