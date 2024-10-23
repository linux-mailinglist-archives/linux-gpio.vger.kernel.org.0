Return-Path: <linux-gpio+bounces-11808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B20389ABD52
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 526A01F2444B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8936152517;
	Wed, 23 Oct 2024 04:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/OMy/pl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6E015098B;
	Wed, 23 Oct 2024 04:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658741; cv=none; b=uYpGdU/W1r8EED0DYo3qp+7vZPacLgAtgzcGv3SAcLQ7QNp8E6Fldlrg2ngoBj0KoTf+AWQCT2AMqKy27zaNXXAe7E/5ZI9c8y9A92uUAA6RFdqtUjLcFABUa2vqt5MTMarumG9evmVVG+aCwyx/Dzck8zTjp0e02/zlvBCdTUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658741; c=relaxed/simple;
	bh=clRC7SlCVokGRt05BZkHjfxvxOHH6WjJTUUbgEJzcqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+rsYXs+66P2w+oqR09Zpy92jp5epE1Xw3cxX5DI7lahzCCcMnuqEyf85JwHFAtJiGY+IVlLh9li6kT/r602g8YbU9lFdfu+JgWo4U6ATG1deGxkbG7QBbznWAcEnHula0c86BQc0xDV5tWLf1V1bz7l94vMPlqVWWDbjtGXGOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/OMy/pl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20cb47387ceso57364015ad.1;
        Tue, 22 Oct 2024 21:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658739; x=1730263539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8ySFZ/e4rYDchZwRHVmsRhqGnJF26yjuWxa24CCZHw=;
        b=Q/OMy/plrOZ/krJnDlWiqgR0wCsZa2HJJAsXxxHbpJ8D/RlTo/8Q1vYludnltYtqY5
         rMQ0a98vSpPgpRx/1HJcWAc1LjGNeL+3onCMtib0EITu0di1gDGju2ayTExG+yh/YkyJ
         LvY161+sp7mA1hj7b9vLU5Dr4jKNBRTGqzweqD7CV3keWWnInkUhkeH7MeBaW+0eyomG
         vCV8epLzF4wfRFi5OXFeq8/RqkHcpyoFwJbA+gKrREpD2AeMxcWHiG7V3zM7ocabjtLl
         WbjzPB46dSETe75niDF07WOqpLxdB594EMAN0OQDsNWSxvumkhA5n7VkeB0xOG1WAIT5
         nLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658739; x=1730263539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8ySFZ/e4rYDchZwRHVmsRhqGnJF26yjuWxa24CCZHw=;
        b=AhAKFffFDsNGmlBtsR5ksnCNnPfmLqxNBDUsYKs2k6KqqwgpJ26rFkSfu1IePFAszm
         E/jXrxbvM3e1A2VJFZn3yQRvou597MiKTU3h5RsuNUKzyG4Xa5WKu2XsESbceTMlfF02
         lZrzQonjW717aqM2ybctp4vp5Hm92rDI9hu8rSpG+oz51/HP/uK+PtwUy4h5iBQGvkP3
         a4YMse47xnSNzexothUHquVcTC8jNf6J94EtAesqBnGhx/Pw6J5wVNvpbhztAjAol7yf
         gaYQcwGQQlBqv+D3iJn5JnTi1h+56J4Rtu3NfWWDhk2r3YQgOkXVeX+SUqn1f4ZLQuNP
         vr5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/LPDYTmS2cMozXYcWXQx7mkLVbUcfuIxvUH2vI6d/kI9l16fNg4sqUCy19cguQftH64DgjSKGhYj4j7aq@vger.kernel.org, AJvYcCUw05PZF3mVMsUCr1Z2ruUJybVmB1UFMC7EkIlQlP1vkLakFBxocp/cyf79fOuIu6l6Qaqhm8h7IgQoWg==@vger.kernel.org, AJvYcCX4HQ8d1Q96zyamAA5UoH1HERXCv1Iz/ADVgQEwLwXC+aMHWELNwaSyrF5oVj+j4W8UgGzDq5BwJeTi@vger.kernel.org, AJvYcCXpY8DwXTfisPd36bdTnm+oWDom8QmdCgqSByK4sYwS8okfX3M7GFa7XyhCXSuEk0396WjT+ZPWcVq1snxwN64=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/PDVH5B7B8FkbYN+RO+BGUefou8VmRYCp3SGggG41OpzUBlgB
	J3IL0TObmlL8j0bFYea+C2Wb3ob2JusoPxDhIxAILHDnUJg/CHgv
X-Google-Smtp-Source: AGHT+IEnzOstKHuAoKlCyOmaiMfvKSyCyMyYjgaGD+r5AD2jOIfOABw/OXeuqWTeXltAhA6ge3A5hw==
X-Received: by 2002:a17:903:2452:b0:20c:9821:69a4 with SMTP id d9443c01a7336-20fa9de8c00mr16520565ad.6.1729658739269;
        Tue, 22 Oct 2024 21:45:39 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:38 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 11/20] dt-bindings: arm: apple: Add A11 devices
Date: Wed, 23 Oct 2024 12:40:46 +0800
Message-ID: <20241023044423.18294-12-towinchenmi@gmail.com>
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
2.47.0


