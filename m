Return-Path: <linux-gpio+bounces-10429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 801839853E8
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29A251F26A5F
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BD018A94E;
	Wed, 25 Sep 2024 07:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4lV5mvF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E25118A6D3;
	Wed, 25 Sep 2024 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248890; cv=none; b=ukMceWfFy74LkHKouXY3dhzDY8pOwAl4i6sv0flt2FyOhZ1W3HMN4V0ce4anuF1UEOP10v1CK/p7Z8fsk9TD/9gCC3tMnY5Ajq+f/eWXvohJngPla1ousOPbdvEmdtKIP883PxabmXx9UkIDo8Sv9R8Vnt/qFYkSBRXuwMhHFyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248890; c=relaxed/simple;
	bh=Gqs1ahfB9mr3TeunJDfEiuHnPwB3lCyorA2M4bZqYjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yr0XXl2M/Ar66cBOLAuwUpmyW69Yn+veN/gYIuj8PhnZqp5Q2w47l66IegtMtn+avibosf2z2Xn+/WmZOxv098N98nQXVGgB8VEO41m2bL6nrOLvl1Tc89e0EzY6kumA98wyXNQ1aBcf4S+JIP1MQAXqFY4q8qycGkO/NYD0b+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4lV5mvF; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a1a7c0f612so6658515ab.3;
        Wed, 25 Sep 2024 00:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248888; x=1727853688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRS99LqtKKHwle8nUek6BghPGrFF+lICOD/F9U0T8Ic=;
        b=d4lV5mvFHb1skUFmkU/TqhiXGxg2Bb3HXxdTpH2iODpX3WaCzNmUbC4GebCy6ei8c2
         GOvYS5jjramEg9Lnmt8pltSzg+ARfgmp3OH/za0PtTnYz77/ysBzhA65mN90RtZSAWui
         Ti09pUHvr3eEaA0c4AKLZ+Im+n0KJmNqiC/cXyx8vYnysRXPENuwvPmTGaUl+p4VkHGQ
         8lh/MACquGmcu924M7pfwV0NBOt1yNS1mH9x5TQjduAz3ftryKRp/EJz3DKyHfPOvzjs
         xgiDKBIMhYgbpU37RHeK+CqoziLutDv4godwwVvyk2wN9VR/jz0bFDRNKeyIelvpNAEr
         bplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248888; x=1727853688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LRS99LqtKKHwle8nUek6BghPGrFF+lICOD/F9U0T8Ic=;
        b=I8y6xB62R3U3BftaNciTfwv9WKJcF84w76bJbTTxGISFg2V/+jHwhl3x/PUsjo1I/W
         wrhJla9JTd87yZ5W+7Jeanw0N3EsKob+9R0l2y93+uXGfTL8MGEBz5d7Vv4n1JdI1Y53
         yjtRvU6Imj1P0clQlCIU2TNu6PMS4K04j/pqX8RcCTpwSKeCZqB/HzEi7fFV1OrifPkK
         IOqq/7y7ky+Nv4hYKV2zDbb3GUvCvbvWNOJwtmFxDb2QQ52nU6JIsavV2oF0sbtqltoc
         RXOOIJ2S7pzAFi5KMae0udgdasCH20vA3Q6xSXkWMNm7TSR/qmjBWRHalPd1T2E3sMbH
         t5cQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+EXB5G+f511pY0YPB61hCn3GO2OMkxNv+EAiMP0OioaMvzwsZ89W9sbFXRW73oPzJiA8Dr6t70EfbSDrl1IE=@vger.kernel.org, AJvYcCV7gpqSlm1GUFS8KBUKXbB/FC8nChiU76E4qm+0donUbZMHJjn+G+qXFIEZxhBXuLUcNu1OYUtBsaI2@vger.kernel.org, AJvYcCVPYl+DEjzQ6W+Sn3VpfpcgJSWYMKumtEHIIlipB/yYwHEZUd79h4EXNtRRiS9WzwZ2FjaLZ1NkwNsaGQ==@vger.kernel.org, AJvYcCXtXXdbn/cmbDYHIcgAXEiH5HEKzLxml7hPVqMMKHM+9eP9bun9SSIL6z4/XacNQsVg6G0wAP99gvpfzs4n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy59gqztSPFrSkdVsnNQswKhVcEHx3kzXMDTSMRBraF/R+HvneR
	M3puI8HEscTvUT3APALsXDS2ipyYgsJvu1fqYoi/mSvZvjGAWpq/
X-Google-Smtp-Source: AGHT+IFvpJTqUs5gJ8SSQJcfciyhjfNIffVpvedL4cAQ58ETxwhJEW1uKD70Mfulzgk67MLgTsYtPA==
X-Received: by 2002:a05:6e02:1848:b0:3a0:98b2:8f3b with SMTP id e9e14a558f8ab-3a26d7149e3mr19848075ab.7.1727248888368;
        Wed, 25 Sep 2024 00:21:28 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:21:28 -0700 (PDT)
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
Subject: [PATCH v5 11/20] dt-bindings: arm: apple: Add A11 devices
Date: Wed, 25 Sep 2024 15:18:09 +0800
Message-ID: <20240925071939.6107-12-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
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
2.46.0


