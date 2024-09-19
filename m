Return-Path: <linux-gpio+bounces-10280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F076397CC25
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F4881C21E53
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514FE1A0B08;
	Thu, 19 Sep 2024 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J87ZBjFF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC70919CC13;
	Thu, 19 Sep 2024 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762552; cv=none; b=qdjhlvf5BIdY1SMlABRItQvuj42AHcL6ZKId/PDTB4iM8ePqpDIX0by7mCI+kkDxfbiP/CuKfQBYoxPIdRV+33USEtve4tc6myWvqIoI6Qljt4eCLFg0ccCMV2VBsEEz0t7fwsWOztk+Ak3i3SaQ+D94qlWmtO5i4elmGzU8Cgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762552; c=relaxed/simple;
	bh=wjv7S2defJHb4w2LIijyyI7ICLEtDGHr6+Y7Ed98jvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDE/OzAwiiyEy0XB20/b2eUGA0B1uOWP1eiLGN854qRtseNKMcns7BM/4wXNnDbo5WFJz3tDhPs4phazBe7C20NNurlWmi0CvEKCL9SYnsYxMZ5auIFXnBQTn/4uqhAxjiRQAaY6O2VWiCRahL0SibURjXQ741fkv9048d2+vFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J87ZBjFF; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7163489149eso804302a12.1;
        Thu, 19 Sep 2024 09:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762550; x=1727367350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drlfe7ijxNosG2VKP6kf49hdRW10I7zx+SACXHP4QNc=;
        b=J87ZBjFFlySZd3EFsotIh8ON/r3AfJWjlesMU/MJREuxqxHJHE5ifiOlcVIfml6OpU
         wz0u4Z6RPRhw0rcgdhwLGGPUVqKQrtzDSH/68dgXEaYNCx6cEB7XkbzarJe9ltwryIbN
         ueV/UMirPiHdZ05hmlfGlHpvNNFsPkA3WGt5ZLU0oqVI7WpGac5/3RzPsVBzd4uC69sr
         td/7SQpT2pbiYrRhGAt6rvA37qPBdkmg3iMWE+sYA/irGv2A743YAfmrcz6O7mr8VACy
         ys3DbRfPSiauknXQbrz2hSRwxgaN7kuot2PJ/5gZktlqT4o66t2YdysNRs0d9/mD+/Vh
         V7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762550; x=1727367350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drlfe7ijxNosG2VKP6kf49hdRW10I7zx+SACXHP4QNc=;
        b=wA/nBn0p2pUqxhiGkgVnX/Pv7nWVCeHPkXaVKUhJ+5ZNMQ/ry7l+UVwZGjH/L9eiA5
         ace1nK8xmAFeVFxUOrd5TZjlzf8VEI+igReJI6AigPX5SgemZcBsP60K5/L19A4wAsJG
         XkfOVtFBYMsgj+hsxxepm1poP8JTcMXee34T3dM9McbaF6TiLxTmsCduDffiMNed/87z
         FSlKVJxLtRn997KL56tH6bAMXG17OQuEl/cImNm41slmGl0ogWxR4bvvZsHoA0hnWIiz
         L39+vGmRjdn3dV4vB4Pux0wNvmeU8lsQRBJHD6MWQ7D4yvgQyo46nAYblLJWW7qEh0Zz
         gM7g==
X-Forwarded-Encrypted: i=1; AJvYcCUg4QLtIWIJau13zn3U12YNVO7XAQU10hFXrc0qVNt1UjcvFF65w99+dgdmr1APK/eU3SMs2fupgJ2h@vger.kernel.org, AJvYcCW2pEJDqiB7Ff+2+QPFfFoWCeSnqsa0x/MWYFyUr6uNUZGpYqgfah0xftK27Nk1CoPqQUvxvLffU06p8Z7JxYY=@vger.kernel.org, AJvYcCWmEq5yTr4lD2FO5O0bJCQs/LIzXjzHNQzfHpdrTGRSGpmzMU0L4FZpBP0/AsZBlxcpyKKEKHVDXSpQ8A==@vger.kernel.org, AJvYcCWoTuKC4Fu5enn6F8Dxky6/0xK8aaQqhYH0+wDpuW/OCkCF8K7jhKepwKzhfZOXGJKaU+Yp4jkZ++B9cSzT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz6VSavG33ghPlMYsgN4TpeUOOtofGySKtz0x0nfBjsYmiu+Wv
	8YW2OQroscV33/v7D2FE1+g7oOr/oBRdgH8PTvLbgE7Dp2wsNQ34
X-Google-Smtp-Source: AGHT+IHBa45a3i0mBcEALSUXYEP4sZkfBrpm4+r2kymteTZliXjeUmZ29WQUDgBzdOh4B5cgeiDtBg==
X-Received: by 2002:a17:90b:1957:b0:2d8:6e9c:a765 with SMTP id 98e67ed59e1d1-2dbb9c251e7mr29329273a91.0.1726762549704;
        Thu, 19 Sep 2024 09:15:49 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:15:49 -0700 (PDT)
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
Subject: [PATCH v4 02/20] dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
Date: Fri, 20 Sep 2024 00:05:51 +0800
Message-ID: <20240919161443.10340-3-towinchenmi@gmail.com>
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

The blocks on A7-A11 SoCs are compatible with the existing driver so
add their per-SoC compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index 21872e15916c..310832fa8c28 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -16,6 +16,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-wdt
+          - apple,t7000-wdt
+          - apple,s8000-wdt
+          - apple,t8010-wdt
+          - apple,t8015-wdt
           - apple,t8103-wdt
           - apple,t8112-wdt
           - apple,t6000-wdt
-- 
2.46.0


