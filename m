Return-Path: <linux-gpio+bounces-10922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 863F899258A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA2691C22260
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AED18C346;
	Mon,  7 Oct 2024 07:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGlO2wOZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4C018C353;
	Mon,  7 Oct 2024 07:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284959; cv=none; b=orPQguY5tctEDdYpXkPeTJJLNsFucNb4y/7DSnRBzdXEH2px8ahcwq+ZrIS+S73PzZpsibSUvUYTSdCm3OBc+Zu8KPraHIuHKOdg0ami2tJ9HaEpP2z/0ROxSsx2MphJvN8/TUF2MkcoSDnF2NJXF9Zt7pmwWdSSbkINVixLyjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284959; c=relaxed/simple;
	bh=2yb7n7gKNJS1kktb+Yf2SYFW5hBXjDXQF3TG7PYeqTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7sD7KQh6uvhd+dEaFK12eZuQSnfTovF0ZkTdXi58HP+LdvLx1tW93nvmrlRTGNibFd8qIONp+bOZMOMuQ84zuvGRQc47JARlYyNHlzir8xpNhv2jsyrb1aPTfAc/nyI0Mg+qzMlubH2JAGeHEr1niFVH2f0QxJYhj/B5RtBKnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGlO2wOZ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so2786996a12.0;
        Mon, 07 Oct 2024 00:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284956; x=1728889756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMvAFFeWkPWBXgzkEAJzMHvTNWtfW81e6+GO+82Em9M=;
        b=jGlO2wOZl2yiiTs4gh+k7Wt6pDfW5b76Hm8RUMN5qPG6a4pVyCSWD1R93zm5EnL3aa
         sze4MNfPVVKQjbLSvEX0KqURj8Gqhq+dPFV/PkTrb4IMzZty4PGyFKwID/ARDDEPZln0
         ZL5s93U6SMdbIvmuhDSuwg2NW6/xIIN+d3itLYNk+ugaktXfiGlq8/0QhvbpbwJBza8S
         omJsY+Adxn866E91Xa3iLIAklK7cKxu1VReBAWxwYxbSsp9a29qmcYp2oJeDerWBAXUV
         D1DOiwmGiTvcMbo0qYhPVqGex30EUh/JvJM4da+LroaEROiy+xcZ6ctfttE1Yl6q+dfX
         bQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284956; x=1728889756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMvAFFeWkPWBXgzkEAJzMHvTNWtfW81e6+GO+82Em9M=;
        b=viJwjenjST4jHkYg/PapTl2DluGZe/jbJvJrHNpbrVXXK9Q8pokPYBob2pzDaoXfOn
         M6uhFZ1KsTeP757DSsQZW3nyga3z3bxj8rLBdkAn+OE7VRxoF8flKLB1n1QzSTEEUZvR
         r0aaumNwMsaor/vLlSP+IcNc+2SRBbCFI0kE1CEpoVSgnb5tqF3hNT9SWY9UAf+NQb/4
         QYnU1F+rWzn2K/CpS9NfEoYNbXDQT9G2pW/scmC7dfilLpN0T4/4OkWHMjWCFfr+UA3E
         fGWNLdDXa9b3I1iTCsIvWTWxjdKYBenK2SpqyaN8H1UDtp4xWwBSDOxg+7qtHaq/sC3t
         +MfA==
X-Forwarded-Encrypted: i=1; AJvYcCV2Yz496y1A3eFhgW5Fs7Mna4BoG2jnWQxQ/fBGDTbYp+kcsM7Jp6TSX13Zwvzyzb9sBlUYBpt+KFrLJFcbSAg=@vger.kernel.org, AJvYcCV4tD2TsjNtk1i73q2sMTvKt8+tf2UFLCyV4gEd7+EYtBYGh6GMWIzqMtipMpOhLcer0ow0NE+MROdzE714@vger.kernel.org, AJvYcCVnQXgp/OPdJl8SWh5t4f+9X6/22DRnmXJqEVu7769BUSmhk7wqaIVXSCtC5Z4rEM4q4ldIyWruTD+Rcw==@vger.kernel.org, AJvYcCWAU9k7FbeftAgBjWZ1DErDjzWNciRrMu0kERL1ZTlsiD7e4pXD+vTqNwLGtc2pi6eWWcQPOaxov6B7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz80Xh262uaoDfI/JdJR6I7lCS6p5XpslhDZPUhQK8ktpANx7Ua
	6Zpn9+Qdiqh8pmi9I2uUQtUGVdHiH9nZHOeaNunxW5ceV7akgOH8
X-Google-Smtp-Source: AGHT+IHH8J8izOhOEj5haFlwY9o3pI3ZVMWYVItq9zEqkmyoSxUSlllOKhIomN7kYBgqPLn0AlcVVA==
X-Received: by 2002:a05:6a21:999c:b0:1d6:e61c:a5bd with SMTP id adf61e73a8af0-1d6e61ca5dbmr12829355637.1.1728284956595;
        Mon, 07 Oct 2024 00:09:16 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:16 -0700 (PDT)
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
Subject: [PATCH v6 10/20] dt-bindings: arm: apple: Add A10X devices
Date: Mon,  7 Oct 2024 15:05:35 +0800
Message-ID: <20241007070758.9961-11-towinchenmi@gmail.com>
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
2.46.2


