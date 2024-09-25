Return-Path: <linux-gpio+bounces-10428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F07A9853E3
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F8631C21FED
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD58618A6B0;
	Wed, 25 Sep 2024 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VogsXESN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37548189B81;
	Wed, 25 Sep 2024 07:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248884; cv=none; b=cB0QGNO12FcT3Vs2IAX+k3hQ2IBWMgmiDpcqf8JJMts8/I9bksdfogXwM+HWFEtyq0t3RAhndIGNkNhctJK3SmD5QMFQGTOWOItOsyfxFvTy5TIWGL20Pe9VB4r9TZTFbk/wz75PpUfB3JRa0+gaO1QMTpXac783HQYzMHFNgEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248884; c=relaxed/simple;
	bh=6UE5luBJ4zEL1AXe5UiNe+h44DRAjdXD3nJ4OxS/kog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvAGLSKJedQI+7O+I7iGRMi3HcetNDvG7YcARQA/Jp2avcggm+ScsYo7rb41lTzhdaZeVXL31Ku5I45UmrSaW7DNaJ/lmw31Yb7/8bzIfyMj18g0dYfQc9QwM+8hzJXazN5QbQeBfJnCDRnnM/fQofMSD6o6rOksueRjRHbMvjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VogsXESN; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a1a412638fso7577215ab.1;
        Wed, 25 Sep 2024 00:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248882; x=1727853682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORCGcbSwKgWFHAVRm/UYQifm4nQpWQfHLfuPNDrl1Eo=;
        b=VogsXESN1+DiQfdn6FO3zvF4XU7U3WMWKQ5H0wAM8vGog9MhPS8UuNachap4VkSzjG
         DXzMeUk5a3rpjD9EtGlnPTGwynmoienuct1TrVONyrVYb+xo9PL6TFIX/MNMNxagUr0w
         Xx09Q48t0Um52i++Wvac1EJdHG2cMng0XMb2NqKuy9hP/rBCVwGJQlYTTbxQNZy+Mgb1
         TzwocVnyhrdUxIE4GHXjkN2eJPFmBxj1UqCWESC3ZJw3rmPaeUY6b3a4DN1vIpFPI1LO
         EoTdqSHu+cLTzYQckdUiTfa1cMmwEWvuWsshFiur6Lp7HXvOBn+odaCaRA1y8DHZrGD1
         7O9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248882; x=1727853682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORCGcbSwKgWFHAVRm/UYQifm4nQpWQfHLfuPNDrl1Eo=;
        b=oj+ZW5tTgdV0vE1JdZh2yewQl8IaCIACQ7+nKKO5dh6OsehycSMH6ffB2YSDn6qbmU
         743e27TYGEoy2QR9brD+/Nxv4ewbqpP4mIY9F+Xyyro/Vx06vnF7kvnyyavbNwAsM7Dm
         cJUbngh7T5/1LkP1GZ3ns4fGoJZoy7YIktbzL8zXsv7mQvtISxIcbZzBG/+/sbxYCM0a
         gnMENARXx3uv0vzrSfHhe1f2mTxCD6bymAcW3jOpgIPh6tNb6GLB2HTBkhC0i4WKfiaZ
         JUFXSpEz9YzdnmkH4M3uNoJPWj3kj6s68drWM7s4GWHjE+04iaVmGAq8lUCLkcoE+Gzj
         oT2w==
X-Forwarded-Encrypted: i=1; AJvYcCUUPYl7Xy5yiNkgvUt1FDAVV7HYLbkMvQynOPu8r7YS5MUTXABcDN0fqDtATvcy2+72ARrBIY/7qnH+K/CKuBQ=@vger.kernel.org, AJvYcCV4V6919Q9b9JRzH1vPploqYW5n5D1HFZnQY5k+ibI+0RGwmjYrGLXRcxmle9nd5Qj3bmMyEC+IUEFB7naX@vger.kernel.org, AJvYcCVupk9NCY5d+02j4NhF7+QERCmf4fSv6sWd5xZauqNQU43rX1Hjmxa6UyIiEFLzRpt/72fakcN3ffZ9@vger.kernel.org, AJvYcCW1TGsD80/IHbBtIM5CVrunzr06mX4knVfTv/A1aGpUHpqdWhUtAbDSN7ZefHnuWTg0X6Q+Eyym+TpVrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBm2ixZppAcsjAhAlXKfIqOHmn7cxgdiG6/VoHjueYqgRnWH9C
	qLK2WNgXNFX6/JsROeqh+in60gsMwqnlUwaBtuWR9mfiMVO4arCy
X-Google-Smtp-Source: AGHT+IGz+nBPKU/0ZQZRn4iIi1Zpl8XNNeYysGdEscn0nqTGqEHb35M1Eb0BgRB+lLd63nxO2NUglw==
X-Received: by 2002:a92:cd88:0:b0:3a0:8eb3:5154 with SMTP id e9e14a558f8ab-3a26d6ef162mr20639305ab.4.1727248882421;
        Wed, 25 Sep 2024 00:21:22 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:21:22 -0700 (PDT)
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
Subject: [PATCH v5 10/20] dt-bindings: arm: apple: Add A10X devices
Date: Wed, 25 Sep 2024 15:18:08 +0800
Message-ID: <20240925071939.6107-11-towinchenmi@gmail.com>
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
2.46.0


