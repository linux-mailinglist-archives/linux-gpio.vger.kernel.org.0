Return-Path: <linux-gpio+bounces-10287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF36597CC44
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D32B288F7C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4CD1A42AB;
	Thu, 19 Sep 2024 16:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+e0hjfG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B281A3BB4;
	Thu, 19 Sep 2024 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762581; cv=none; b=LU2xX3Hth35T8GmYRvFMa6GvWk77KWxvy5y5+HmA5dUs5PpxAoL4/NvcDk4tbomFBxW/VyFCClhIAXjUjvl2B5uJfU7fRBgWMxCu3H3dCpnmplkqUqWwGKjxA7/ZNdSnP6ZBij8TVY8yfruTeYEhijKkalmk9YlI/KG1ztptqTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762581; c=relaxed/simple;
	bh=V0wAJ3KgOJQBQptHA1TQBm5dVVW7DLpAyWuD7rLAvWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJ6jznakp7q+7AiTPjGoIMxYG3J6wzZHnWvyrsrRJD+Djno7wbBS2XoEPonClRtku3X03e2pYkl8WukCC9z4zfCIbwM+XzPum1jEvruTlKRFGrsFfB1QTzTr+eAyNqvcKfCMgxYawJ9vywh4XuQkj83Qj0J8ujuWgiQ7+Dlz4fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+e0hjfG; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d877e9054eso831653a91.3;
        Thu, 19 Sep 2024 09:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762579; x=1727367379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed1R7heD4sdGMJhfePEjEjpAPx6TqwKkotv7yYVzxAA=;
        b=g+e0hjfGVV3h+h1H9a2Q9uqT1do+swZl15nOD/bIgYlDsEyGxPGA89GbT54WNWLpjR
         6fGilV4i6C/FWQ5Oy3JWNxhbbEzF77oqTR8EgRabqXT3rMmmnH7mpywgdeCi9jHY+cfQ
         g0f4/FiO+Intzj4FI6O8RO6v33Vtpo1BGJtG73vtm0Sjx4oA4Kl2fSryyRMFIQllZ/qK
         BIQkNlxR6Xl4XibYDwgaQzxTjr2B2gb4Hj8GVWqBP9jEa6biDcdhrqnN300PIwbDB/E4
         78ZCX4Ohn94xsGWZLC4Ihkq5y4e+xpiKNnY1Yd9DSEKZGGjZUxmSyM1nN9pZE6lTpkLr
         yQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762579; x=1727367379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ed1R7heD4sdGMJhfePEjEjpAPx6TqwKkotv7yYVzxAA=;
        b=Iai42qZLoQ37RMrG+iac5ntO5GCrfNMFNIDbP3W0nzEM/13rf3vSHqOSTfQaCuobQs
         7MbWP2Oqm0yaf6nPz65sdVbslZZZNOQkBNNRZ3aTT7IlF7ci05Jm9w/k0Nu5m5RFPWLb
         yX88biBWtk2kHmDP+08iG7i6CVM6HT/OkqpRAPmK4GW+dAG43BjYhIU+zW74KV7KulTa
         sXPdIcfazDFU8JsIlidCtBzn3yXtxVhdDWmSu4CIW//c4hk7g/HB97JzSiJtiz6Opc/k
         VCoAHFdKwNKTKuw8GNPlqDgoC8s7FouzaotW+Kx+kFkOhjdKEKUr/ZkV2FgY7En2ye31
         1tsw==
X-Forwarded-Encrypted: i=1; AJvYcCUUI3Tj/Lwb8VTIH9q8euvA1I40XdmcXkvbEWL/x9ljOMzUVLuHSOuXf3A+YMoS9KyS72OAaoYarKl+wRePJs4=@vger.kernel.org, AJvYcCWEQqzLFCvY62+qGXtJ1wBEOiPOh9CGlndINedf0Ple2irXUImxYni/O6UK5INakh8GLmJGy/QV16ZihwvM@vger.kernel.org, AJvYcCX/2PIQmjHIAB2rZitjmt8bRDgZhAI4vnayRspud81L6yxp/2dH8XUh63jH2KF7NQLz6uHlbZcxEP9k@vger.kernel.org, AJvYcCX4T3KGyScgL6axQcoFCeHCnVVmRGbtvEJIYzEvCQBBZEEDV5icUVvnxYFya4WKbRXyKuo2oD5tSs1Eew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCYka3qpsxOdvhbvAQQd9bGWImdHw13VC+BQQflnc5zpTkvWSO
	rXlh5w+TWeLyW+ucp2kAwU3InWsPenkcAdgcmQIg3hEwNDRaIfBz
X-Google-Smtp-Source: AGHT+IFMEiRQEO96fXpMQJDT33pJZKtVeKcslkgQq5lZT1LI9m5cJrYWA9C9RX5x+bWY3lKJYJ8myA==
X-Received: by 2002:a17:90a:8584:b0:2d8:b923:b56a with SMTP id 98e67ed59e1d1-2dba00822c3mr25077757a91.41.1726762579393;
        Thu, 19 Sep 2024 09:16:19 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:17 -0700 (PDT)
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
Subject: [PATCH v4 09/20] dt-bindings: arm: apple: Add A10 devices
Date: Fri, 20 Sep 2024 00:05:58 +0800
Message-ID: <20240919161443.10340-10-towinchenmi@gmail.com>
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

Adds the following apple,t8010 based platforms:

 - iPhone 7
 - iPhone 7 Plus
 - iPod touch 7
 - iPad 6
 - iPad 7

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 253dae759f10..b6a2916fb0f6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -43,6 +43,14 @@ description: |
   - iPad Pro (9.7-inch)
   - iPad Pro (12.9-inch)
 
+  Devices based on the "A10" SoC:
+
+  - iPhone 7
+  - iPhone 7 Plus
+  - iPod touch 7
+  - iPad 6
+  - iPad 7
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -165,6 +173,21 @@ properties:
           - const: apple,s8001
           - const: apple,arm-platform
 
+      - description: Apple A10 SoC based platforms
+        items:
+          - enum:
+              - apple,d10  # iPhone 7 (Qualcomm)
+              - apple,d11  # iPhone 7 (Intel)
+              - apple,d101 # iPhone 7 Plus (Qualcomm)
+              - apple,d111 # iPhone 7 Plus (Intel)
+              - apple,j71b # iPad 6 (Wi-Fi)
+              - apple,j72b # iPad 6 (Cellular)
+              - apple,j171 # iPad 7 (Wi-Fi)
+              - apple,j172 # iPad 7 (Cellular)
+              - apple,n112 # iPod touch 7
+          - const: apple,t8010
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0


