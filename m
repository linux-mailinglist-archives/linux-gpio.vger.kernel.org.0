Return-Path: <linux-gpio+bounces-10920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E05992580
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AD43280C99
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5BD18C003;
	Mon,  7 Oct 2024 07:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zhz62eUz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF3818BC30;
	Mon,  7 Oct 2024 07:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284950; cv=none; b=EZnUPAaxdG+vangz8Qu1naV3f9eP3w2w1fqrtiOArfAJbvC+uwGXlG2G3Ehl0WhahNKwcqa3+385sXzorsWE0hVtqc702G28KXTztmaunSipzFcjmvFCGf0aZsfavzUKgSVqsHVzxgSsw7Y/wdIqyTXq6OQYyvjobWOCqpYopK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284950; c=relaxed/simple;
	bh=eOPWxost3/Q/Ct6nJTvUfPY+tUjDPPoFiOm+DWy2974=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awfjj10HgCBdMVFIF1KxRk90r8kWMZle4nxPeBqALwliktEqM+ykjgkPkTU40qs+NMO5JzOXl/5fIvczHS07ZYOy23uJYBB5hnKVdbGtmqKuB3bfps3KsDIGlPlj8JcnMVBprBXntmUXs8N2iZtONw94mpnX+ko/SgFn1DzJX1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zhz62eUz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71df8585a42so953339b3a.3;
        Mon, 07 Oct 2024 00:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284949; x=1728889749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2GO0bDPlkWtBLbc/b6xzMR0wH9aMrQdYT9FKZAjN+Y=;
        b=Zhz62eUzvcAn0cGn2+DgMRzP1H5HdbYGaN+FsVYzFGf8bSttzWJYeiDNuKuElM2b4Q
         /L0oYJ+X38u8S554t9gxVqHPOq7YuUXGs+hEFXCsc9mrRBCkXiWUz3Kwga606CUjzUYz
         V8p6dpSa72IkJ+aQHlj09BbCAxl4PT6CcTT8xYu/YrlAFpTugKqTjpu2AJBGaQT90lKN
         gx5AMU8zKc4b1D2LnkRPzjgJ9dbYhcut02D+DMalFhJ8DgSjTHnTzVoAgx0ltike6id4
         wmnZsuojDAe6cajaAoGUQTquSJ35+WzjIL3H4sEyDQDMNnpNKy/ca+5SAjkwDPeFXzSD
         Ml0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284949; x=1728889749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2GO0bDPlkWtBLbc/b6xzMR0wH9aMrQdYT9FKZAjN+Y=;
        b=IfbJHuNfTyKVkqoFAP01rMkjuRqYbmFm6IVg8s/OX12E+mbvPhTKrz9UC1B2xiG249
         X30Yhgep+zsEvQNG6ewnYJSquuNspQPyLeArI6pbXmMdqs0R12ReTG6Q6AMArkBuZ5GX
         EZ9vtEPMKNFzb2IVm3eS5S/ON1RIBahA3MsRqZmSMmvSZ3CB9y3g6T4hvzpI579hw+YY
         Qqdsiv2Ih4/puPafA0UnwFLcIOwexzU/zc8rH6jTpOrxFxEEVS+zuUzThcZOI3ayIHij
         JW7dVrsiuWoU8J2dSABK6BckznXKvgkpjBnhmnxlON8NVEVXW+AhHzng51seo/HTTrvE
         UDeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBoT9IoBMLUpYf1x7gvyTbkSvkZ67TpBxP3BaFFZtGGgS6+Peow17w7d3Oubwm/ApbpL1LIUqhxN3VX7FQCPU=@vger.kernel.org, AJvYcCVv+RJ+Cy4rpg/0M3tqHEhrd4DETvOD9SWrMbiypJ2pF36JYRoX5YLlB312UunIsA5o3iNMf3jRKRPlOasb@vger.kernel.org, AJvYcCWQANgwBW2EnHAqPbOUNdDlqf+i32A/r/THSM7kbKajjNWFRIlThtZpPsiDt+pEmJ0egACb0FE4SLkl@vger.kernel.org, AJvYcCWpGGl67vRJ5Cgm/pLg/5/H2uUW5zMHHkAqYRDvGcv2stpYTE0SdWEWYrJraWhTNOSao/ecvflq2t0oWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4z1P9gVx5KoQvtcHTJrszcsXe7ZRo6Ne6GjFOUpqUnG5G6xY0
	JpJ0NAmgCebcgKaGdiSxxUj2ItxnqfcE7Q78RL205qOaGMCPCwPb
X-Google-Smtp-Source: AGHT+IFXaLJs+l/9floukTKIL11mw1cfwaNwUaCQr6k1PcQeQ4IXxFNbobywjuKW1EGZNB+R9nXhEw==
X-Received: by 2002:a05:6a21:1707:b0:1cf:499c:f918 with SMTP id adf61e73a8af0-1d6dfa36895mr15730204637.18.1728284948866;
        Mon, 07 Oct 2024 00:09:08 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:08 -0700 (PDT)
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
Subject: [PATCH v6 08/20] dt-bindings: arm: apple: Add A9X devices
Date: Mon,  7 Oct 2024 15:05:33 +0800
Message-ID: <20241007070758.9961-9-towinchenmi@gmail.com>
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
2.46.2


