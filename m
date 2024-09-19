Return-Path: <linux-gpio+bounces-10289-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7B097CC4D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF8B2B233EB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EBD1A4E96;
	Thu, 19 Sep 2024 16:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4mdsqjo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A501A4B9F;
	Thu, 19 Sep 2024 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762589; cv=none; b=jPGdfSGOPqunpm89/htWMsfYlLvDfqo3vzf+x+K7dyO3UC3V9VD8b6nZZEWhsGgwBOxaot2V8EIE6xJRSRv2kNs3AoPfxTztEsocu91akppnoiwGOXN5lti9+E+/qkwXIJNFFsvwujfapQJ5bN1ndKUmA2D4LDQUnroVLUHi2F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762589; c=relaxed/simple;
	bh=oRRZjOe8crHuqKO3fJOPVea9O1ipoSrxWoL3J8IvGh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQe3bLHtz2mmHljFYwG0osSzhAnXA5RquA80UTD87ckGEf6y77O9sjIL/If3C0LmmgDmeZ2wAXZv+KoDD/kgp9gP37DHDsF1gwpkeiyQqzdxTcCd7sGjsgeue0No/qqnNE9k3I0IbgNVkxkj8ArskCabYYd8KTXF2daYxxUb4JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4mdsqjo; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d8b679d7f2so907379a91.1;
        Thu, 19 Sep 2024 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762588; x=1727367388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgWKpEVOCov+RuJGQrOjklAplcYwSkE5zO4KxeBxyVs=;
        b=N4mdsqjoVIWeBmw3xnPKzIq7htKSw80nsh9mE3Xic9sdEKbxQlyv1DYvJxV8NbMMlA
         h38EJtj5C94L7fCDuKfLzT44LaaB5CsLWlTR0+jeDcZyqnnDplQsAZSlL2f8qhhhnDGf
         BZcvXzILdPdyWpFUvwlUWdZAOHAVbNxx1UldnA7UdLr7FaWw13oGibmEWk7kSJhZlqN1
         WihymA8HQ25/E9zZSbx0mFNltoFlWLM/6EGBk1bjqw28po7L/FEt9N/ebbyXdQSRKdck
         vgQQ6moZabqTZlwItFDOHN81IwFMaApKe2x4hqpCc8WiRHBy3loDmSM2uFuNPgAeNgL4
         KnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762588; x=1727367388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgWKpEVOCov+RuJGQrOjklAplcYwSkE5zO4KxeBxyVs=;
        b=XDAJ4GsLydVD5+b/ldA1VmEbyo7cjpgnOep3UH3BjU1R8CCyGnlbwCUK04OKuoQERP
         ZKh+gdCpQKsyOqa7hkANM3wKmwHggnaR5C1UM9rybzvAUxL9y5UVBSu74Ol/aPS59lyt
         +p8busXuyReVNBbTiASa1stxm6irw+FoO5JtG1PQmRmrNYk+hRo97qRLSucnaCq0siTZ
         0o91E5550M8fzYgWVo0GnXYltpixEkAq1/F3jL8Y76z7mZbMkD/WKNK+Suz18Sb9PVqK
         tBz9Q/Fut4L5xrI0PcK3MtLQZ+f06jOn2eBpMx+UfiFVTvmGUbNr17OfdyWXWTFiILvx
         RjvA==
X-Forwarded-Encrypted: i=1; AJvYcCUW0EaAV3ZrHJQOFMtpRaiELTcE8nM5X4dmqcfTzh0uNFJnmZIs4l8c7xQCW0awBXYGfpLI1dX7Vy1Mlg==@vger.kernel.org, AJvYcCUurktj4l40Ju+/411b51lRJP9ldXuQTlPXgLa52sxrMkMfnGOkgU4tIAQIVmJkUOPCiFfqIPDW2ECF@vger.kernel.org, AJvYcCXDs5HrCWRU4JrbIJAAC80gsjonL0934aoVZpsk40C84FctoM0SYxcsZisUKgzCVqUeVcmECafEncbjdQ/5@vger.kernel.org, AJvYcCXw+RIp52ofcuPXyO3heq73Oq0261O6yVfb7+mtPQj+U1IozrlHe46Wz64HBmrMRkPfc3O10jaj7oEyMxu6gCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVKVl8w01NwhyyyR8O/tJ2/OCJmuWFpeGFcgcB2/rcptMDn+//
	UJBLskGDC8xR6eQEwajSlTXP8WI04pNGrAOFZL8uYm08LWJcWHE+
X-Google-Smtp-Source: AGHT+IHHnFuSvqgGScSELj2y4e0Y0hfFO95m/y2fVsqznlF2laG4grn5xTp/2H35jwUVczmZzDXP6Q==
X-Received: by 2002:a17:90b:109:b0:2d8:8a03:b90d with SMTP id 98e67ed59e1d1-2dba007f3bcmr29289731a91.41.1726762587665;
        Thu, 19 Sep 2024 09:16:27 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:27 -0700 (PDT)
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
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 11/20] dt-bindings: arm: apple: Add A11 devices
Date: Fri, 20 Sep 2024 00:06:00 +0800
Message-ID: <20240919161443.10340-12-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
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


