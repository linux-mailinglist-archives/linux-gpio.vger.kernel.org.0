Return-Path: <linux-gpio+bounces-6487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EED708CA5B7
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 03:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BAC41F21647
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 01:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A804DF9C8;
	Tue, 21 May 2024 01:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRa2wmxl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2785BE58;
	Tue, 21 May 2024 01:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716254699; cv=none; b=ENespN4BpA8fpa0HDWyUUtoKbFQtNTHve7l1l1glL0Nb5l/CNShg4VbTc6Ry9TrQGUxOzJ1bZdABrOkGTbpLd7ujGGD6zdjR9AJJr4cVgM+satjbQmJgmaWyBWS+wVOTof2CQAn8/oVHu6t5DNtMfFWwpkV9vHgwS4v79Doyo00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716254699; c=relaxed/simple;
	bh=9lxj8u4aDM7kKtk7HKEsPhYcu6NOgcXgkGng+hS9kkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zob7dD7AG1f+9ZgS51tAe1eT+oX3ApWp7b7u9u9wnuV8/RHYVrshzF0tmQfLglIlVb+F6jWYhOJ82WkJOARpwJ+fpNeBxT9d4b2pAAoazphe+HV/mowCWV9LzW3DwQuz045us1NnYb3D1SI8CwJxgTyt6bdog38Af5Tb0O+36vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRa2wmxl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ee7963db64so25737585ad.1;
        Mon, 20 May 2024 18:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716254697; x=1716859497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XuZnshTHKl9Tg/cmKKixm6682TVpUXXm5RT75oPZP8=;
        b=dRa2wmxlvUASH3LZ8UPMeonyeE2kHDtivhTPTgW27lBLjTKNFaBlUDABbh15KEswU3
         qpAblAj7nTkPG1HQn8wCqDFj7JjhCARZSEZadjoikbRE0y36IgsuhTOizyEqSk2hHkRD
         n1VD80+yXLGHuZZ3OSFsz41b+5TF550YY7SsyLYrrBfPBqTIqFEBlWAMVvYl9VIwUw4t
         ApM4nKA68AL3jGO7ZTKe7SWaVDI1rFuq+X07OG6gysRQFBt2MqlC9fjb5LLPLpsyvIdF
         dD+UOJU8cwivZNWRH9lHGoeeQyLA9w8N1yYh4NvPeg6eI5MvHRLoOhdjUs8moYEF+il+
         ewcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716254697; x=1716859497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XuZnshTHKl9Tg/cmKKixm6682TVpUXXm5RT75oPZP8=;
        b=kiJNRpCUc0VpbjtV6QXreQM8M2NeTHu/MPx6Q0eE1gkby3ndyEuhV5a/a7KzVoeVhX
         RujQA0YTHuzU+ZUMmnKUyQVuAg5Rpf8xdc+r4w/2+P/27pK45tpgC4IsyYNt9NerN1Il
         AHucaalDYCn2PNto5a4jhku3dnyY/qGyonlJfMj/lZU15aLicPJXDc0uRAMKnIG2aFHB
         lNw4t2pqM00rzN1WxQM2GYU2+nXcQDi3WPAmZ7+kuGcGbGNjmKacvEzSkwLxNN9F+f9M
         phpUYO1spRj3YTzA08nyZHKVTy1gHwFArfShBOj0k0JMPQ3cYfnZCQLXVgBDcE8sIomM
         KySg==
X-Forwarded-Encrypted: i=1; AJvYcCWJNZW1RDzuZK0ljRl8GBX2t38v2nZiRh9sxF13ZoLIks8MsFkFRpgFttuCnFOOXkFFygN1wZ2evvcNeTheUUIRKiOEd8zadXCuJpw4igGmU5Eigmx+Mor5BWoVSd11OadnNQu/5axhUtUem0lQVzS6NstrrIFdhmYHUCt17TB3cBhZgCU=
X-Gm-Message-State: AOJu0YwIwYv28kQNZ7JRImpYd1s6kJGQSNg+BOn+l01slL6jQvtUFeLR
	niwi87g0zaaLqw+n2+BMlOwUzLwVUXcU458ALPEPj3JlEEqJNBvA
X-Google-Smtp-Source: AGHT+IHDl9O+xwzgupXhCETSxzLDpkEfCl2jlIEJeP2Ol2M4UraHSwX/SoxmSMgVAOCg+l0AggnB7g==
X-Received: by 2002:a05:6a21:9207:b0:1af:fbab:cfba with SMTP id adf61e73a8af0-1affbabd1e5mr26132776637.27.1716254697103;
        Mon, 20 May 2024 18:24:57 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-65e149dd925sm6477563a12.58.2024.05.20.18.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 18:24:56 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: linus.walleij@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/3] dt-bindings: reset: Add syscon to nuvoton ma35d1 system-management node
Date: Tue, 21 May 2024 01:24:45 +0000
Message-Id: <20240521012447.42211-2-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240521012447.42211-1-ychuang570808@gmail.com>
References: <20240521012447.42211-1-ychuang570808@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Add a compatible 'syscon' to the system management node since the system
control registers are mapped by this driver. The other driver must access
the system control registers through 'regmap' using a phandle that
references this node.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 .../devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
index 34c5c1c08ec1..3ce7dcecd87a 100644
--- a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     items:
       - const: nuvoton,ma35d1-reset
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -37,7 +38,7 @@ examples:
   - |
 
     system-management@40460000 {
-        compatible = "nuvoton,ma35d1-reset";
+        compatible = "nuvoton,ma35d1-reset", "syscon";
         reg = <0x40460000 0x200>;
         #reset-cells = <1>;
     };
-- 
2.34.1


