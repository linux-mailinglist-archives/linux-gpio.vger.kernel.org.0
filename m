Return-Path: <linux-gpio+bounces-11807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF0F9ABD4F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5B38B23CB9
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86961465BD;
	Wed, 23 Oct 2024 04:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRSrj5aa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CC513D891;
	Wed, 23 Oct 2024 04:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658736; cv=none; b=onxD33R6etZNf0P5ArpfC3krs3lgYqGlhEOK7Gk8nIbbVc83VSllJblYtvWWnMrznjtHbdd7R5dMNm9iVdNWgv8z16jOkOuXoYLOVwQrUDXFwVcxqXSP6lSeUqoCYI1A86oFNlgo8Jc+xxRcycNhuLqvvdnqpH0ZnH0o8r0+WIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658736; c=relaxed/simple;
	bh=w3eVY/B29SRF0KT2mswItvepFQQjOQ+Iv2sPUga293U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DuCsEgz4lyMcFJ7k2DHCV67S5vvc4tAl1VhGjsBuvRtGZIFfbJx2r44K/7Kj1OwpKTn5nqHMtGsaBtPkpOfnNMrRTHLPUI5jThtc78DyESqlmwsh77JVi66E0j4A6Y+hLov3EtiiVQnky1KquMZJrrX/dMAwRSO5V3jGm9FDoDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRSrj5aa; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cbca51687so62986815ad.1;
        Tue, 22 Oct 2024 21:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658734; x=1730263534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5tGCZAwgsQd/JEpSzWcjKaVDDVs2G7IjrY/5JPqA68=;
        b=RRSrj5aaVzjsC4CLP6Vw93MGDEC9PY1JodHEzRErUMw17Iww6KVs/XVTGZ3R33zUm6
         F/tM0tW+sLabv3p1rNDGlKShPyCpq/jTFxnPqWpE3zZYtOskXYui+04cmcSaYeJn9os7
         kK22SBCz+bBaBEjrKqoyWZWNUYwQV1JkR4+Q8o2WW3xRkE/IryzdHaEQvcCCpIg8jWDJ
         6KqIGeYbB+mH53Eudy1C38oh7Xze/+o1tW6jPzUm79MduL9ZUldKy+8+PQH/KbeGRVZ1
         24R/z9Y6NqpVpHeVQYi+DWwxEewDTVIait1hmwQdKqzyJwUJy7QoBJRvM8ir7xjoh3eO
         yMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658734; x=1730263534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5tGCZAwgsQd/JEpSzWcjKaVDDVs2G7IjrY/5JPqA68=;
        b=Tv/Mqkx+LrwMvWESX3ID9eiDLmszmVXLKlcCftnkVlEn1dx+UHwhzS6vR7z9NRJTUU
         I6mwblEcaPEKcb/BkgntsTwSz5jZXQqEetr1MTPpdzH/Z77lCMWSgCl9UOP49BZ0fyPh
         4Lb0Ve0Oct8S+WjyHSwAEszfO5SDoyZwdhqLw1FqiNdsKJYALxYneYD93IcoGxoGNQEu
         6dA9D6TC0+OquE5DJGhb16y5GjovFDwTOW0JIuifSMQyB5fbr+gBGxlO1qTp6cbxIjAg
         wcLE0HtHYPhTXKVJxaZXoXIXw1hRE+mzyoVQvHMLpTx6BhXWiFt3EQYMQifHgixogn/o
         pjPw==
X-Forwarded-Encrypted: i=1; AJvYcCVT/PB2g0Ct/FQevdP393CW6+39W/+Hzr3aNLvcQdUu7klcP1wkh4NEGM8SGQqvczGju2328GJamuHxHg==@vger.kernel.org, AJvYcCW/QaM8Z9IBCNFBuhmBXHKK08N69yq7Bk2om3jB4RSGDp19NXeyx70n5Atz55cZ9o96PMIEwrh5n32NvgdRo88=@vger.kernel.org, AJvYcCXO0aZfe25naPZIHZm3w8O8/AEd9t1q4lsNOMYL70TzQENpQqnWKdATfN4jw/gjVDjciYXGS/v1CmDX3gMx@vger.kernel.org, AJvYcCXWgzJQLJRwHxWK/ot20Zo5uv4pUbKL1ZhBZ396MxWsUT6sZWkJokw0WTbrMLHTUQiGymhfXfo3DIAk@vger.kernel.org
X-Gm-Message-State: AOJu0YzkQyucchHG+fcdRhemguYk1/rySbKILULDAAcVg61N4nLafasP
	J3Q9hvTex1btHpOdWi36MnlgYSCq6BCWg/0XDIDmVDzc3b8lKVrq
X-Google-Smtp-Source: AGHT+IGQczJSDPY9IaBIYcgOGXzqfF+JMyKf0dT11UOK8ODDHJNEr+deUWTrKgnZ1HQ/JnYRDqWFJA==
X-Received: by 2002:a17:902:ea0f:b0:20c:705b:4123 with SMTP id d9443c01a7336-20fa9e41209mr17062725ad.21.1729658734324;
        Tue, 22 Oct 2024 21:45:34 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:33 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 10/20] dt-bindings: arm: apple: Add A10X devices
Date: Wed, 23 Oct 2024 12:40:45 +0800
Message-ID: <20241023044423.18294-11-towinchenmi@gmail.com>
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

Add the following apple,t8011 based platforms:

- Apple TV 4K
- iPad Pro (2nd Generation) (10.5 Inch)
- iPad Pro (2nd Generation) (12.9 Inch)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index b6a2916fb0f6..96efadad15a6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -51,6 +51,12 @@ description: |
   - iPad 6
   - iPad 7
 
+  Devices based on the "A10X" SoC:
+
+  - Apple TV 4K (1st generation)
+  - iPad Pro (2nd Generation) (10.5 Inch)
+  - iPad Pro (2nd Generation) (12.9 Inch)
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -188,6 +194,17 @@ properties:
           - const: apple,t8010
           - const: apple,arm-platform
 
+      - description: Apple A10X SoC based platforms
+        items:
+          - enum:
+              - apple,j105a # Apple TV 4K (1st Generation)
+              - apple,j120  # iPad Pro 2 (12.9-inch) (Wi-Fi)
+              - apple,j121  # iPad Pro 2 (12.9-inch) (Cellular)
+              - apple,j207  # iPad Pro 2 (10.5-inch) (Wi-Fi)
+              - apple,j208  # iPad Pro 2 (10.5-inch) (Cellular)
+          - const: apple,t8011
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.47.0


