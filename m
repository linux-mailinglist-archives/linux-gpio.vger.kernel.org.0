Return-Path: <linux-gpio+bounces-10923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC91E99258F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A7FC2811C1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136D018C927;
	Mon,  7 Oct 2024 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkiYIzpU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6840E18C90F;
	Mon,  7 Oct 2024 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284962; cv=none; b=KqPHVNHZ2GQD/fA93vIW4ZQ/pD9hBIVFbvDQ5ZFK7DCJtx1C3V88swOPjP+JGaUNrFXVwp8rfkLS9Qm36ozupF6DYMLcQL4HT7jkTAGzN2bcgQqWHVnDyNcBVBqcrN4bAJO8sJPZzBaBbvstI0UC83NtOQTQZovVyMtWmWH8JyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284962; c=relaxed/simple;
	bh=axB8KGq+JGycqUSiDu96r7BR4lVXFJttsQF251Chsk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldECof0BeiSXr6menScfJUyYYXph4hYBDamRpP8Eq8da2yjBbhi5VPoj6DLB0/zVrR/8xvOcPkod6XOTjIHryWVAGdwPhSepIhPg4SQ5nDZCwirS24B1Iyl6uRKoGfTFbbkQlT+0e7nGSeQHDWFzqqz/2/7t8jJzt0hKUzWVomU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkiYIzpU; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e0cd1f3b6so58946b3a.0;
        Mon, 07 Oct 2024 00:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284960; x=1728889760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g4gRZCGHCo1rLxKmX/2hEmMSo1WKQ/Z9kAIXCkaby8=;
        b=nkiYIzpUSSb6DaXUhj6Mp0FtFLqdCeKPG2pz6BfO5vLsgh99GV76JkS4c4dvTpe+/d
         WFvoYBfzCTtjMNXf29xrGmiaOVEP3SVtoXc0Rl5ea0j8/MayIbkeXj76MXpHbH0NSlP3
         fMeTpb50T2rsMt6A86IS1C7vrL85Q9PckvMSo4vSagVj0pMLVQPId4r5vHl6zcmnof6Z
         666hczFHY80Hpk3Ijah49j2rKAkKR6c2YXyMzRN9Nr/PNHsBj6KvYSkdZzBtPmicHVIa
         vCoFY9Kmed6TMBiMh9VpP8m61O3Ix7E4pDS/0wgC242XzQh0GWtPfUXkkiskUCaEWuuB
         y/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284960; x=1728889760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5g4gRZCGHCo1rLxKmX/2hEmMSo1WKQ/Z9kAIXCkaby8=;
        b=lWYPS44FuXrxVmypOwf3eD8kaxwMQJjddiyczVHc6HVpH5W86cHYm1iyOlttkoCHm9
         JpeGtEUjQfum3a4jxQaeE8Qm4P5/P22NEseaU/ZCBN+4YBq8sHKy8v6f+xFLfWNOSsXj
         UhCURJ5eyuVnq7+vHf/ruh0ayazLH7ozrrkT9Tlvku5Ly+H291yVBsk4XUe4XYVgZj3t
         ZgUbgV/fgNB3w5rA2HpnGZXuLL9/n8K1lH3/iVRCNTTDFlwlTzq7DJ8HljHyOsdgSLW0
         7E0Zz1z7+lZ/0sau3g6sjOD7OUNDoVELHCQrm9f7N6rovWUUySXKcYNunGwvSK3kDceS
         KVFA==
X-Forwarded-Encrypted: i=1; AJvYcCVAToMQU2SgpI3rGEHMSFElE5+U75GVh8QyK5Qd2e8N81362yZ6+qgh+TlFYGHX2ZU2IKgddbeU4GMg@vger.kernel.org, AJvYcCWOS8xG7jGkwc82d30jlrYERT47ZLGuodweysgz6xKZOuMR45p4QxF89LgduP1vdy0ZhfejWCayWC3FslFHy/w=@vger.kernel.org, AJvYcCX+Ua5yBdbD7NC5oifgMKq3WosCuQqHW6zhnzADfsIImWyAkDYG8KXfpvG7zBzU3fPbPveZ+WlGX6pCkBsn@vger.kernel.org, AJvYcCXlwNRkjTvt6Rb3aiInP59U59c5Kvzqw9TQ1m2nGQZwxDoiSugLt8AIOfsib1BB2wVOep3/1nRVBBs4oA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQCDv1rr3nCGP0IlweDkrTlCYtlzkkaC4xX+KGX704jDHv9en+
	E7TezHYOv51ExiXFe4Y7Np+RSh0F6FcMJphnnDLZPx3Y7drRNuEl
X-Google-Smtp-Source: AGHT+IF1cMfn/nRufvbr/klzHOxtlkRzYprffmyfRZXIeT0sFZViWXk6TH7oFwlUjqJmvuuvs5lv8A==
X-Received: by 2002:a05:6a00:124a:b0:71d:fe40:7e68 with SMTP id d2e1a72fcca58-71dfe40808emr6377612b3a.1.1728284960458;
        Mon, 07 Oct 2024 00:09:20 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:20 -0700 (PDT)
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
Subject: [PATCH v6 11/20] dt-bindings: arm: apple: Add A11 devices
Date: Mon,  7 Oct 2024 15:05:36 +0800
Message-ID: <20241007070758.9961-12-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the follow apple,t8015 based platforms:

- iPhone 8
- iPhone 8 Plus
- iPhone X

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 96efadad15a6..dc9aab19ff11 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -57,6 +57,12 @@ description: |
   - iPad Pro (2nd Generation) (10.5 Inch)
   - iPad Pro (2nd Generation) (12.9 Inch)
 
+  Devices based on the "A11" SoC:
+
+  - iPhone 8
+  - iPhone 8 Plus
+  - iPhone X
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -205,6 +211,18 @@ properties:
           - const: apple,t8011
           - const: apple,arm-platform
 
+      - description: Apple A11 SoC based platforms
+        items:
+          - enum:
+              - apple,d20  # iPhone 8 (Global)
+              - apple,d21  # iPhone 8 Plus (Global)
+              - apple,d22  # iPhone X (Global)
+              - apple,d201 # iPhone 8 (GSM)
+              - apple,d211 # iPhone 8 Plus (GSM)
+              - apple,d221 # iPhone X (GSM)
+          - const: apple,t8015
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.2


