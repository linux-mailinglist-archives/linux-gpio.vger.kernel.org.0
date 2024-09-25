Return-Path: <linux-gpio+bounces-10426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C41569853DB
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 017601C230F3
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0632218892B;
	Wed, 25 Sep 2024 07:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2nn1TEB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF2B186E3B;
	Wed, 25 Sep 2024 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248873; cv=none; b=QJFNrOScbRpVZzMGXC107WGaTg9g+ntTsl1vj/aDbtNLZgOCHPXVAF7CD0yzN11ayuZNFniRyCHftzjiyQPOz9pz9flzsGHJHHdQKqsCmAKr+EENqXXrZizQqghsDeZXgFrcJV3Kn2EdZ2kyQvNM6d9DpjeLpVCWZJD3ciea+3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248873; c=relaxed/simple;
	bh=mwHK5GHiG38texeDGYpGeDrNMRO0Wo/5vFLRgwSQrj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6Gl/JGbf2x/eYiZWUoYkYicxNIlrOzB6J1hit6seax0908IYcvwuzvN3jxOyyyp5RqKeZFiOnqpr5yfapJS/yY424K4bWNG0MbCx8URez7xMvaEkx8GGzkVYZGc7kcWUKJM6S0sjacVzpii8TZyFBtcGCCgRRoKBmcF4zU6XVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2nn1TEB; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so5233226a12.2;
        Wed, 25 Sep 2024 00:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248871; x=1727853671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qL1bUZmlpaNEXcSDtzcduMqg904aKTZZJEvyhQxFwVY=;
        b=f2nn1TEB8bPhI7xDUjobRqVzgrspd5ADdrkdYWkqYTWzcQ38QQhDRWIEEKg6zkruQN
         WBidCDQvHZO9izF0TEw0uWROpR/9hGGJLpSZeZa9+b2zcH83Er7hWZtpkuKgVSMTTjk7
         tFBSp2U3ZwIQND9hpdpTd1YgZVWsuH9QKRQzNxHFnc7k7Oivw2k5Zb5f+6LzRTqGP+oU
         MPCytbM0JI7m3Hd9Etx3ZYjDAu8zLFJNqnrddIi2R5BgCy+VoYrK1Deu7VYLoxMv+5VB
         5dqb9+f1XNWH0f9BV1TEL8MIinCNZrMl5ZziCbB5XO+1WLzbLgkeAfjWUVnLu8bL3Fwk
         ubkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248871; x=1727853671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qL1bUZmlpaNEXcSDtzcduMqg904aKTZZJEvyhQxFwVY=;
        b=r4wWANzNQZ3cWG7uiVFhyoIfmPksEGHqwG9nEutF6YyE6bYC7dUApPoS/MFp0u/Z4v
         E4it1kg8XcS+03Kih9DPGw+qso0RW+QqX3E9srlN/6tV2z3sWfpKTDMew5PoHTr2C8SJ
         Q2d6BeXiCYNiKpArOnUuwxix0cE/XShivl8r9uCEAu4LXurD4KSLZ+AYUBDE+s6gy50M
         63Vvzb/UqPMBI043U3tugVAhlZAnt+bx5PigLkUD8w1CbjdXzDv9Jf6NfeP/yo9BWk80
         qFnVGbGjrd04uRWmhS9owdWJOEzv3qUVlm2zTJKzOQme91qoYF2b2USvjAl85f5R4pJf
         xM2A==
X-Forwarded-Encrypted: i=1; AJvYcCVbhMoxMIKHa7dkSR4p+gw250UpSDHYfftM48TYUWxB6hxD87oaaOO8TYPp3/sJLjgLhXceCNWU+ApI@vger.kernel.org, AJvYcCW7VRgxOvEXkZnuyWCqZApqZRZ/lLbveZ1L/VgRHltvpFM16LOfY//Rdp+KFchlhb5ImFKUl+nhnl8Q7Pei@vger.kernel.org, AJvYcCWxecHGQHFlN7Cp8t82vCQamSQqzyL3Ek2WYsxPjfpLypOyb7TNIkG9nejci2ZQ1KFYGfjmTbgPKb1g4w==@vger.kernel.org, AJvYcCX8k2rDs+Tr7Wg9Vz8WYbOs7mJsW5cOOs3xYtEtqGNlXwiM5DOaLjDdmLQiDYf8wbXKE1eDd9iHMv3o5slMKUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPSlZ4e/3ufyUufLUF5MwdMeVrhaxilY5hs9qZ/brZRhGVJ7X0
	pDlwU9fGu5jbI6vxwRRJRi6tgCOA0OXqu9H0YB0Y1+7iU0Scuq2d
X-Google-Smtp-Source: AGHT+IEGAuegRViCnSuJvwVYQger24wdPcK/JpLkMgsXxyB6wQFokWL4zigD/vmbvh1D7uOFV5xX1g==
X-Received: by 2002:a05:6a21:a4c4:b0:1cf:6625:f08 with SMTP id adf61e73a8af0-1d4e0bb0850mr2818860637.45.1727248871511;
        Wed, 25 Sep 2024 00:21:11 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:21:11 -0700 (PDT)
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
Subject: [PATCH v5 08/20] dt-bindings: arm: apple: Add A9X devices
Date: Wed, 25 Sep 2024 15:18:06 +0800
Message-ID: <20240925071939.6107-9-towinchenmi@gmail.com>
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
2.46.0


