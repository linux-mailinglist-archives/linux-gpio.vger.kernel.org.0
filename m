Return-Path: <linux-gpio+bounces-11805-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BB59ABD46
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75B0D1F22F7D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CD814A639;
	Wed, 23 Oct 2024 04:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMj1Nv8s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F1314AD2E;
	Wed, 23 Oct 2024 04:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658728; cv=none; b=CCeDsUxrH+LB6iP+TUW7syqmmwdPwyOSwzycMQUMoJiiLvT2Ck4+akrfdwBlOOAl0liDUw889MZWysAvphjpqn1kA6T6pr78Y0G2GCpmGwszo8TKDPclkPIUVTIa2XyCa2Yrtgrjv4iJ8D+ITWWyzGGKD0uwFj3mZEqE8puSlxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658728; c=relaxed/simple;
	bh=EUU78kZNwoHO8Nwzpazo6uRxyqhOIPAANrOLKIujOpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcCHmqstaBAZE2IsVfJsE9kq928Z4dPIrGsdJ9oVLOidMn4JPxL2zQnF2510wXXdVNgLWlLXnIONTfzSXO83BCjxWUYUDnNotC7x/W22zlVcoCbAT8Hr15fvjsyekyIfX1JSZx6FLiYchgQAIl3/3Vqc2udZw/1x0pQrt8JwkIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMj1Nv8s; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso4915277b3a.2;
        Tue, 22 Oct 2024 21:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658724; x=1730263524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcarKreMP1Q/pdoi5/P9xmiPp+4y+yFJL0ckVrG3Cq4=;
        b=gMj1Nv8sadacxJfEX6R0HXVxGeNqKnoNSoybocg6P6I84mX4rli+CjMQyYSyHiybx7
         R13yX3nVK6s1P8l4rUZQCMloG3NEriTP6S0+FO07kgNP2dvt9EJM389KrCGZXXHPE+KV
         p1h0ELN1mxlFIZLABKmqV5CnKlD7V3xXesxkUMsr0Rq3dzkbNjcQB230/HoLsLQmrSzF
         1A/vo9G9FGijrlnzLpzAs9JZi4QugluMArEEpULXK6yICQYN+m21PAkynbLZOt0LCdcf
         glJjhY+++optH04oSM23trx5dmi52Ap8XaFM9ABS7v7pEFsmboou5Ah8MBmc/PL780Z0
         UuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658724; x=1730263524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcarKreMP1Q/pdoi5/P9xmiPp+4y+yFJL0ckVrG3Cq4=;
        b=ZzdemX8ojqjAwC8BpLdwXaAAuuMHu2lW24nzkYLY9g6f6erAYBUylmpJMAgoQUs7W8
         tiVm6WlDQxBmNZynXhXS3mobFyzmYwzssQL1mzLdEb6mCFHbcCzeJ09D70jLhIN2IjX5
         OSJ6q1rO45bS6plIwnrPVfUHDvK2qvwv99NKCI2o4jHa++fRQ+nLFyBm0Z6xjZx4AWK5
         wtKuX96VVp7RaqBBim/FF9BaKlUm2grMQWJc/rAejCtHT/chCaJnhLLl++cF+zCzMoCH
         bRMsqWB7IKNMAn3KaC5iQCuDJ2XNzo5Gm+Td2fTYTdUi5Z0impSGaFe7qfKVKIOmXMLS
         Kx5w==
X-Forwarded-Encrypted: i=1; AJvYcCUDNbOOqvPclRnpzPs4ynvWjzPhWBk5LDtHdehrzKhExevdxiyNo2BeNZHEVM93OiDXZwcZDgTqwBLy@vger.kernel.org, AJvYcCVH3loc/oxGSRo5sYwfDzrFbsAaH0tjSOgjLAmwQ8ZAPS4bsbnQUPFEh3+24xVQrxSMRyeqqWnQJS++Xg==@vger.kernel.org, AJvYcCVTUe0SrA+PUdtAm1pF+EFLgcem1/Oiqqr9y5jYxe8TfPDAd/NGiL1nnceJnSrr4juAujG/pqowHo9xF8aS@vger.kernel.org, AJvYcCVU8j3WrB/IFuhdobFEuzJlSyUs79A80NEpYshtcElpzNYQi6I56rPZ7d5f+ZvNpQ+E4ReTik04XXdS3ypicxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwufUDej2/wLsvrrO2GEjiQups509p8tUbkyty1U6bshn3XxMVb
	lU/TK5B7LvIvonnYi5w54cgude61hl+pYEI9TrNfRaBJyEzZltd8
X-Google-Smtp-Source: AGHT+IExn+fPRcV10FHE9dtg/+zBAnh+t9Lwtv8s2LJ4pkCkmAnCSv3NLBBJjN4CFeH8Crk1vVbBkQ==
X-Received: by 2002:a05:6a21:39a:b0:1d5:14ff:a153 with SMTP id adf61e73a8af0-1d978b0fb3dmr1939343637.12.1729658724392;
        Tue, 22 Oct 2024 21:45:24 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:24 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 RESEND 08/20] dt-bindings: arm: apple: Add A9X devices
Date: Wed, 23 Oct 2024 12:40:43 +0800
Message-ID: <20241023044423.18294-9-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the following apple,s8001 based platforms:

- iPad Pro (9.7 Inch)
- iPad Pro (12.9 Inch) (1st generation)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 01965890b4ef..253dae759f10 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -38,6 +38,11 @@ description: |
   - iPhone SE (2016)
   - iPad 5
 
+  Devices based on the "A9X" SoC:
+
+  - iPad Pro (9.7-inch)
+  - iPad Pro (12.9-inch)
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -150,6 +155,16 @@ properties:
           - const: apple,s8003
           - const: apple,arm-platform
 
+      - description: Apple A9X SoC based platforms
+        items:
+          - enum:
+              - apple,j127 # iPad Pro (9.7-inch) (Wi-Fi)
+              - apple,j128 # iPad Pro (9.7-inch) (Cellular)
+              - apple,j98a # iPad Pro (12.9-inch) (Wi-Fi)
+              - apple,j99a # iPad Pro (12.9-inch) (Cellular)
+          - const: apple,s8001
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.47.0


