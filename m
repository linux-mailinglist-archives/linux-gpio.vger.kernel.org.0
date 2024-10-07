Return-Path: <linux-gpio+bounces-10918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F46992578
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39F1D1C221CB
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4753118B462;
	Mon,  7 Oct 2024 07:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBr9TO4k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B056D189BA5;
	Mon,  7 Oct 2024 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284943; cv=none; b=VLBoBKLXa0nm/rtGgb5yCyGvmXA/HrO8oTnIfHJwiimtTQd15MQKabqgfmsTjvsze7S3P7E6ia+10cO/Nvn9qOMzDocp+rt5nWAvmVDiMcU60CL7i75Oszh+IoyuZd42tCVesmxGBLwwv9z0sUHa+Wnv05I0Blo7gIiCPC5R5fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284943; c=relaxed/simple;
	bh=jKkpVBJ+mBPvRKjYAZrgLzemE5EU0UA5QtAv3xIoawU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3ApWV03nMajT25xZSCzVkUuHSLd3SNC7P+MEYYvrGN+LfokJ+tG6MvKxWJI5TPKwoEuXE8Q/WKUn/wWiAuHTg4Yvw/+MeVwcM8dNkgbowyVCSGE26CqRPOkToXOE9UQKxarge1YqfkAfSF/1N9nVIZmWLCNAnxDIw6Sxed1abI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBr9TO4k; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71df04d3cd1so1849985b3a.2;
        Mon, 07 Oct 2024 00:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284941; x=1728889741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdN7qegJvA70c8rJy1Z9FAe9FRFAtpJPWh08eWIZEqw=;
        b=lBr9TO4kYJ2LMkCra3jaBZlFbwQhJJaJbXK/I3yWCCAdbUCQm6qW7hdGkGGx3iEwnN
         5sVpRvG9kiUJZmjfbM9phdDIjvACM5cCmK/MwjSWD2nHPrxzKisxGzRFBbfjJl3cNP/b
         0RMEMix4WuO0bUd60qz9J4veRRm5qoKn4dZbGxRoHjGRncvUwZyxcFJY8AH++n+eOYNE
         IJykLpN242qWrlaXmcciCMbTFlaaaFp7qF638DfC6S7y7k2zI11C7NQ3cKww1/RRkJXz
         U6GFXgFYsdUP0lCVfMsB4gwFO6kcAnAFay/AawO1Vim/zkCTu44U06FVL0uzbjDI/R/W
         Q9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284941; x=1728889741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdN7qegJvA70c8rJy1Z9FAe9FRFAtpJPWh08eWIZEqw=;
        b=UlgzkeB3nOg3WD0nkebiKPNW55V7BucI2+yRPtSi7WB1tYmUtF8TVW6dOxz6cdHqqd
         KHRDzVk/xUCP3gPJktkIuKwbH5h2ZLeGjXmtkpA5mNyK+2r36QqWoxYCzhXbRC4D1QZh
         y1AM90CkplWedZPv2wvLgzOyw6Mxy6zASHNQWWlLZWn8OGXsIudK00LoY2V55zsDohO4
         LiueRqRp7hOP2KXsqHRDFOf9aj5M31jrP1kyuuounEKVAKRMQpj9Dg+U4fuF+v4z5lTi
         lXBjyBq628F4d6gESH9LtDHWu2IHKSxECFiM+bCtAarbWwMnV8wtIv3HrpVvdH9yDXwN
         RSdg==
X-Forwarded-Encrypted: i=1; AJvYcCVgU5W+qWaYTlwnjfpGk19ROeuzH0TWieB1wTOnOCSJWjzLPt47M9wlIO2+i1bbT40InLLnXph7sG9M9A==@vger.kernel.org, AJvYcCWX03pwWCCPSIEjDV4vYCkmTZZqfQZSd41JpqnZyTEtBtKqCbZ3sY6HM84GK8U2uMs/wY5kHL7+BapiA4le@vger.kernel.org, AJvYcCWyXVa+Qv7PI0s4EdzH4+KalRiO9vbQbH/kW8WCYEMZ8ygRP6HIsJJzcDRCAjOKe+oUm3iKj07BhyAM@vger.kernel.org, AJvYcCX4XvaaryoKeGctkB4dmsrgWYcIuCU4zfjLCCxUu1mk6yviQw9mpRoDd7smiTkR0j6h4OyskrgZ/zjfbPy8uBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeD4zlv77ObOPA4+y/9oqhIdKsFYvxh6Pm2x8b8PSlQE24Y5Zx
	t1bX5Kj6kZA4coszBeAl2j1z+8EVUW5mTPPgI4iDrKuIslfQvUc1
X-Google-Smtp-Source: AGHT+IEYLZ3CfSfHKi0NaZZrLxIkVDrzX0uE8Z43T/3LSz9zrp2CUhMWk4gf9XWf9BxdS+iOn2knig==
X-Received: by 2002:a05:6a21:1583:b0:1c0:e997:7081 with SMTP id adf61e73a8af0-1d6dfa41668mr15574000637.29.1728284941137;
        Mon, 07 Oct 2024 00:09:01 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:00 -0700 (PDT)
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
Subject: [PATCH v6 06/20] dt-bindings: arm: apple: Add A8X devices
Date: Mon,  7 Oct 2024 15:05:31 +0800
Message-ID: <20241007070758.9961-7-towinchenmi@gmail.com>
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

Add the only platform based on apple,t7001, the iPad Air 2.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index c05a4414c8b6..fecc4953df33 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -27,6 +27,10 @@ description: |
   - iPod touch 6
   - Apple TV HD
 
+  Device based on the "A8X" SoC:
+
+  - iPad Air 2
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -109,6 +113,14 @@ properties:
           - const: apple,t7000
           - const: apple,arm-platform
 
+      - description: Apple A8X SoC based platforms
+        items:
+          - enum:
+              - apple,j81 # iPad Air 2 (Wi-Fi)
+              - apple,j82 # iPad Air 2 (Cellular)
+          - const: apple,t7001
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.2


