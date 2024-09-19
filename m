Return-Path: <linux-gpio+bounces-10283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F3397CC31
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD9EE1F232FA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE641A287C;
	Thu, 19 Sep 2024 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vbaqe00H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57B51A2866;
	Thu, 19 Sep 2024 16:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762564; cv=none; b=f7HHrkEks/Aj9IyqB9yyYClPtGmKMzNfaVLjb23vt1EEH4VkU20niao28DVT2s6o3xNuuH4IRWWL4PYquWCLQz40QLnY7KWvr0kJpkc25q+Rt3J6ZkjDoAHgr88rsdX9ImTjGrlXlTqrAQP2PZhbdR1liVmpeU7m+iOfu5aBAYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762564; c=relaxed/simple;
	bh=1/0kBarxJdeH0ODjM886OO6FOOEXyxF3Df2gBqXy/CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3QWLVPRPaeFMP0dORkO6r35I6EQ9PiHwE6sGvz/JQjuiB/pk/ke/kZO7vdFeBoDeuwvTR4RVUnWhSqwnOVpndPewEdbkvF1VYhgrj2jrJoHhwALYamGUy0n2GNUv/+m6XXDJRtIAkOcS8GFonyqWEOJ/lNbJ7u4nCKy5tbg8gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vbaqe00H; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so667580a12.3;
        Thu, 19 Sep 2024 09:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762562; x=1727367362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCeCV/1xwkdl5BzxyfA7coBD1+lL/3DpL3W4/CdUMdE=;
        b=Vbaqe00Hvwz4OJzdzhrktk3nupt3/Lezmw0m15BOitHM6iIkeAzcHbri3d1mXF59kd
         IFHNa7J0dSUkZL6dRvoJE5C+bm81oGZFm6i04TLxbNTyjFj6VIj5hUsSfVyEO5TeLQcg
         DHKCFZZ22KPub5RSYxzM4i1PXFRNXM+1bX5pnelv0ih28osT7wlrw/e0Hpc0G8uNMU0c
         g6TU5uNlho6YRP1AvgYDCeCWOOjaLq7z24CrMl53awnFv4YKtuqUYnHPqEY3jARYQmqe
         WOfyFYu1DAVrPFLijGFt5hDVCzg87Aj8FpRN4L0JcE8ti2dvGRcz9wNE9IhZcUM+cc8M
         GeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762562; x=1727367362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCeCV/1xwkdl5BzxyfA7coBD1+lL/3DpL3W4/CdUMdE=;
        b=XcKvgHCg43JvGZJPXWjorYo7yLozcDVmtLw20IQ4yEQb8J+KnsYmYkVbtm9bDzpFMC
         3mgBuwfqB2MaoXd2JydtsTD/kLwotHyIKOq+J6S0MfGXAPAUl0OWMdyI66aMSjrcp/xA
         PjIcP2HZtAZykHPSYMIgToNiQ39HIuDogmkavWDnI6tl9NcTf8xsHdaENK9DzVRv4KjO
         pNPbVGa6whKEgvtX6ohz7Kq5XBadzmtR/nedc07+VMW4ve3zjSw7lZ3pppApiJmXEAEB
         /uJ6j9HWzEqRNC/vzrc7+AZ9RYQiut4h8ThGtrFDr9VNgxBRhjyX84ANRW8bltwTUqpx
         qI/w==
X-Forwarded-Encrypted: i=1; AJvYcCU5bJQP7GBlFMF5CEM21dReV0r0hjMfuAh/G5wApyDXrbY8URTgfSEtJx9YJhisjVA/2ZOTmPapJfoDNkiv@vger.kernel.org, AJvYcCVX3wmkD8o7OaPB3uaqVuk0U3evxx1+XetjtSWpZ0RtstBAqk4n8mISWXT/ocbyzf4j/K7wwMYyC1YI@vger.kernel.org, AJvYcCVeEbDjv3eoinCmQcTJNlVPjPMbnzZ+ygcwOB0tzeKIKOMI+vu0qnFph4hJ4Wjgs1ySMXMM5gE5joW5xR4h8PU=@vger.kernel.org, AJvYcCXA0jSpeekcBBk8KFkgtdnOJGhW53ouBJ2TJavs8FXKdX/PTdn1FM7peUsIqYDhbqOJFhzH0zbq1WFrIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0UxQAgLIKGnyZZ3jTEI7xB6RKSsDidTZA1NChMVHTFfF5Mlz
	UZKe06saMqICtRBQGBWoxUzZBmfPwBtIhN3yTcEJNuk6MrKJQ8fz
X-Google-Smtp-Source: AGHT+IE9yW+76fGrCiFJozu3sPmdSmq74J8gEdc7pxwJ2WUOKX4v7BaxAiOvV/FoYvgBT7lu5u1Bdw==
X-Received: by 2002:a17:90a:e20a:b0:2dd:66a8:8ab6 with SMTP id 98e67ed59e1d1-2dd66a89a1dmr5473300a91.13.1726762562019;
        Thu, 19 Sep 2024 09:16:02 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:01 -0700 (PDT)
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
Subject: [PATCH v4 05/20] dt-bindings: arm: apple: Add A8 devices
Date: Fri, 20 Sep 2024 00:05:54 +0800
Message-ID: <20240919161443.10340-6-towinchenmi@gmail.com>
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

This adds the following apple,t7000 based platforms:

 - iPhone 6
 - iPhone 6 Plus
 - iPad mini 4
 - iPod touch 6
 - Apple TV HD

The remaining HomePod is not supported as part of this patch.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 89c1e35e404b..c05a4414c8b6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -19,6 +19,14 @@ description: |
   - iPad mini 2
   - iPad mini 3
 
+  Devices based on the "A8" SoC:
+
+  - iPhone 6
+  - iPhone 6 Plus
+  - iPad mini 4
+  - iPod touch 6
+  - Apple TV HD
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -89,6 +97,18 @@ properties:
           - const: apple,s5l8960x
           - const: apple,arm-platform
 
+      - description: Apple A8 SoC based platforms
+        items:
+          - enum:
+              - apple,j42d # Apple TV HD
+              - apple,j96  # iPad mini 4 (Wi-Fi)
+              - apple,j97  # iPad mini 4 (Cellular)
+              - apple,n56  # iPhone 6 Plus
+              - apple,n61  # iPhone 6
+              - apple,n102 # iPod touch 6
+          - const: apple,t7000
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0


