Return-Path: <linux-gpio+bounces-10419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC80E9853BC
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 632F4B23B22
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D07915853A;
	Wed, 25 Sep 2024 07:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjADLRhQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B96158525;
	Wed, 25 Sep 2024 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248834; cv=none; b=TnQoUFZuxpf2CpmZTA4Nje+N2qalhBgYSs5Q4acXJv/sqK/FEmif1W/j3Q/DGOw/FODnH907IBMsJgFEwX/D/vLQsSySBJV9gRNPQIvMZUpSpklMSAl0vQxkLx9mdgjPIR5M7q17aKoTPnIHTlDNehr6KOEFHh+Txgb2Buo6MJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248834; c=relaxed/simple;
	bh=PdLJa8MVBvaTO9CgZ4NY7AAkJ0lR2z9Bnany8DBGvs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hnvLweE7QpQppZ9FpwCug9Hn47S1fJf7vZExc+VmOQzaHN7RLMIUCdl2no1VVJdXxsSChhvl3jieN1wEICo+K3opgDlXDHRTLAwgXEKvHdBX82SEuR61F+dUL7X4ys3qcyPh7qoEr7o/4zR8pbRwwVJ1M0xvdR/kx93qo9G/hQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjADLRhQ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20688fbaeafso68263345ad.0;
        Wed, 25 Sep 2024 00:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248830; x=1727853630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/G6U4dNeBchLENbWDi7+ka7XGG31EAhRde6PGiP6iQ=;
        b=DjADLRhQRZM7zXnQF/KeworwHmyaarwAxMaC474uLgKh7kFnOzYeAvgbsB3433b2Q9
         YYQKJ+bHKtXfzpg5bm2WiMQJplUm67NIV/LCLieFaQl3LAZO0l+zDrIxCS6r0COEryqv
         qtAdOlypnfBNFZOdoD5BXJXUYdb0XzrlK1Y3Ux+hgQ32/F8l4kcPOBnqsldT8jg9P+XT
         vTbyBccvIBSq6g46t54hf6ss8oc4KHgE77yk0ywdjYjuqEqFZ7fqHI7khwIvFvvlPkba
         4ynB7wCT3Z3IK3/XpdcSAEcClPocI4pVkxnIXHtcFFF7sia1l05XsFF6440XVa/MCSm1
         s2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248830; x=1727853630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/G6U4dNeBchLENbWDi7+ka7XGG31EAhRde6PGiP6iQ=;
        b=Blr2cbY8AoPIJNcJRdLr/tDvsAUWikGjRMORzy48y2Mk8TS8eEmBOxipG39l4bLCwi
         33DlGH5R6FQIDrtoOf4Xa2wKatI7mO2tIN8xpzfTUTJ2YghP46cGtQLw++f2CVomw+ev
         xKcYpZv2O96DoJC/TUfEzS98A5z/qIel94LVzCuN5ItIDk2noYHz4Y49rHOaysU/gUOT
         mlE/Q+qgXwBKZubaato97QYZMfFyaVGjzfreYAM2p3FSvJYgh07/DTPKIoXeGhXM9srg
         bDFPDpOB/naG6DGUG9gg+YGNTzHNr40GMIGbWa1k3BI/9WOi4Viq6AuiH6mA+mMt3kgW
         3fGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHhPo6hRyrXMIHpl0KF3GwWk+AJ8snzS3MbLv8ZDtUcjWGYwErF0QBkGeaVg149WrM9jHt4vEVS6lU@vger.kernel.org, AJvYcCVEv+2Y8+ocABf7v7yltgcqCtstC0xhXHdmSnsIRTSosLsou8DOe3r8pJHhslnkaTUN8GHOB56xTz7tsA==@vger.kernel.org, AJvYcCVaYXvuAFdBoWC3z2RHGVRUoaqMQMadShJhvehHeQgHKa8k9ibsrRnyabcC7ybp1iQKIdcr6chNWy9B24ODkJw=@vger.kernel.org, AJvYcCW3bnZL/W6pk2/OfDALj22k1hfqyxYfDyfk8sxtzwwFHg/Bqy4iKgHyMUJM7/Jg4iMghCUDLGQhy4ma12I8@vger.kernel.org
X-Gm-Message-State: AOJu0YyvBEj3UfFMS3wkXBsoHfGJBPUomAbv1bRwvhD+TLCv2FVgsGqK
	hYwHKTYTHlS4nQ5e/yAuud4ZSr84SILvrL0Fok7VReoB3oca4Lbt
X-Google-Smtp-Source: AGHT+IEBz9VxvKTpWTU8dRa4jNNJ7omba+lnmLfBNzwvBOGKgxhGFwlAsnO2HYZwQr63aKE98A1nvg==
X-Received: by 2002:a17:902:e5d2:b0:205:6c5f:e3ca with SMTP id d9443c01a7336-20afc606134mr25437695ad.53.1727248830557;
        Wed, 25 Sep 2024 00:20:30 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:20:30 -0700 (PDT)
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
Subject: [PATCH v5 01/20] dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
Date: Wed, 25 Sep 2024 15:17:59 +0800
Message-ID: <20240925071939.6107-2-towinchenmi@gmail.com>
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

Add the following CPU cores:

- apple,cyclone: A7 cores
- apple,typhoon: A8 cores
- apple,twister: A9 cores
- apple,hurricane-zephyr: A10 logical cores
- apple,monsoon: A11 performance cores
- apple,mistral: A11 efficiency cores

In the Apple A10, there are physical performance-efficiency cores that
forms logical cores to software depending on the current p-state, and
only one type of core may be active at one time.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index f308ff6c3532..f69b75afd258 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -87,8 +87,14 @@ properties:
     enum:
       - apple,avalanche
       - apple,blizzard
-      - apple,icestorm
+      - apple,cyclone
       - apple,firestorm
+      - apple,hurricane-zephyr
+      - apple,icestorm
+      - apple,mistral
+      - apple,monsoon
+      - apple,twister
+      - apple,typhoon
       - arm,arm710t
       - arm,arm720t
       - arm,arm740t
-- 
2.46.0


