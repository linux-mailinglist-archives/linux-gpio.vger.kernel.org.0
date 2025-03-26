Return-Path: <linux-gpio+bounces-18014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 137FDA718FE
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AD5C177B96
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C3E1F8AC8;
	Wed, 26 Mar 2025 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKkLRPIp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C751F7545;
	Wed, 26 Mar 2025 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000011; cv=none; b=Ur78w6MJKT3pXIUZHG06uyrvsXBai8QoknXpVoXqbkyMJdahM7s8J/b48PwtmKMyYhmVpz8kNHFNIpphdKDbpO3vUyuXZbVGqXuB0oaNcgpSqBURr2Qr9cIc/g0tDYqDj8s9WtjLYY6eq9TYk9+H24LQTq+OjUEIFaH4BdFCLXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000011; c=relaxed/simple;
	bh=3kQzsMrakU+78qwTYSDqzRTtgKZamrZgIc8SOH2DHtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzRj2WejwBI4IfeihN8cqofDfBdRkBmOPcvycY+63gaR32RCnHnrPS1R/e76PESR4kfMRJo2x6LnPb2mBYQJB3IcH3XdcW77cnEYp+b5gZPy0xCfzqdTfoGHbdZvvX6brpuTc3NV8dkOQkT3IaNdm2rY4Sfg781lsO43VkMpoL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKkLRPIp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so50713065e9.3;
        Wed, 26 Mar 2025 07:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000008; x=1743604808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Do+c2jt3ez/mwsIBzhfn197DCYpfGLyk5Y7H1RPahPg=;
        b=lKkLRPIpXTYr+G8vvMEi0WSvGOZqwCiYXGvpAPcs1n+4Ftc8oe5LNJY2sfmmTLoXTL
         eGUnPRBefrEe+37vTio/8acAZ0vYYIskEP2wiEeZZLCHebfz82oFChQ+EWnRHFv8b0Lk
         7VspsCRl9tGe/oUFKh25v/dGfqkx97OfJFxLVu7yDniH6ZFTz+ZxigNTrM9jkahZthNB
         6KHLhPeb9TDYxUEZ7ewsClLC8SnFtiqDSVdnR66K7GVOir28v+pJW9yxSxIKCpVPX7Xj
         4h6P8qe1L+6jZ+AkcPeexWRotB/1ovtIZF/7z5rds0uenypytUVClzlAiEV7p2UpGGQe
         ay/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000008; x=1743604808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Do+c2jt3ez/mwsIBzhfn197DCYpfGLyk5Y7H1RPahPg=;
        b=DYJbK/Lz89F10S7QPVwGKTBsEKHiDuzEUGOcboDrxjwVTFo0YjfwasUPEnmf0o1YPc
         Tz9Bief1AXzV5fTXdu0/jiSm3zPv4CVDBMAcPeyPUlnV37/mG8jhwlPBw8G+9i9m9bfz
         OqNMdUrzqCc1F/S/0/0v/rtmA81rBYZwDNko9QT81zdqYSvpyrUPtZyoqdTf/4wt+aiT
         mu9naUuow0YZDF391AWThklhNWEXa9Ds5ZWUvUrbsaxyOm15SaZJ5ZQWY46+pyPWCUN3
         tQksAhyj5FfhfFsr7PEvx0PLT4zry0LtdrBVf6ay3RvuMiuBxsHQ1i0mTSrAKs9AFlgv
         pEvw==
X-Forwarded-Encrypted: i=1; AJvYcCU/NnbViYMbqBJs+PKK9LJl3JNA9zsxzcs+014YGhW4eAWF2MAjv+trA7hJHYe1UsOX/TmUWqitZhiO@vger.kernel.org, AJvYcCUqMhhJLrGd88KZWWnQRd/mjcj0V//YL1yfOtQiYNEcSlyLg74dYYccbKLT2MkWGha7fJmrIAVt7CHexZ3f@vger.kernel.org, AJvYcCUvGFoAT0RrIeQnKZBaosbQaovd4vsDmMJ4dkW1X5T3lXvjB8KGxt1MojGm/JdIkH5tEqHAvumwPJbkPA==@vger.kernel.org, AJvYcCWjiuuquqAFsiJ0ai58jtFDdAIeoeNJctznOv3ghM6EfXL1gFbpB9/R7KVwKprZszyVECOdabW6Wtmx@vger.kernel.org, AJvYcCXDxZYhVdyxk1DUgPulBYezbBLU1X1AyL5/6QJkFTJg6SjYg43HCcndPzPybWmAET+HT2/iI0CGO2F/hRvm@vger.kernel.org, AJvYcCXOb5/cW161KnFqBhihemyaI5X37BtJcqZPx5dxCVnqaAKD/79zFgWXt9Dm0fRw2YYeb0JEAc6Ujy5f@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3wMWn79/Nhmv3U4LXztDShOvRkpg3Lewv8gT/C+6bNMN/754+
	O0ioQBXvts4w80FXJmPN58BDfLitktt7cNhHfh2tER6KSLCXBP4F
X-Gm-Gg: ASbGncvQXqQdvcEipydVNr7hkSzFoUkRF0FIEXjuRTsVBepLv5Zd4lhCSMYM9U+PR+O
	qc0fFwi/S+Hug647CA59JTtCc708+AhbBXDZsqZu4L8IVA1TLe011pzYQ2c20ByuRrOy2zsGgwk
	z++wRFDaYCOSvxHbzc80z/aGfu7D24i88YT24K8fFqmNT2bxAN6dVmVVT8U+Ka4LatFPqPsZDLS
	MhrZVU2JlrQewfNNwo7vlY1F059NXVI65PiMDnfsHqmuVl7yL7gCQnwGNdGmgzAXkdneBJHHiMi
	O7cXhUIX8q2gFfbwdXYLwecj8NvVXy+m55gEBznoxT6NxOuU5+s3d29AlGAgeKx6NQV2
X-Google-Smtp-Source: AGHT+IH7yjSccBFCk7mQThkh+BIzoRh/WlJjnbk5vOyrqffw/vRJDSY1aH3bAENm+vJkBJ73vzMiWw==
X-Received: by 2002:a05:600c:4584:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-43d509f433amr208304605e9.14.1743000007409;
        Wed, 26 Mar 2025 07:40:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 08/15] dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
Date: Wed, 26 Mar 2025 14:39:38 +0000
Message-ID: <20250326143945.82142-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the device tree bindings for the Renesas RZ/V2N (R9A09G056)
SoC Clock Pulse Generator (CPG).

Update `renesas,rzv2h-cpg.yaml` to include the compatible string for
RZ/V2N SoC and adjust the title and description accordingly.

Additionally, introduce `renesas,r9a09g056-cpg.h` to define core clock
constants for the RZ/V2N SoC. Note the existing RZ/V2H(P) family-specific
clock driver will be reused for this SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/clock/renesas,rzv2h-cpg.yaml     |  5 ++--
 .../dt-bindings/clock/renesas,r9a09g056-cpg.h | 24 +++++++++++++++++++
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
index c3fe76abd549..f261445bf341 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -4,13 +4,13 @@
 $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/{G3E,V2H(P)} Clock Pulse Generator (CPG)
+title: Renesas RZ/{G3E,V2H(P),V2N} Clock Pulse Generator (CPG)
 
 maintainers:
   - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
 description:
-  On Renesas RZ/{G3E,V2H(P)} SoCs, the CPG (Clock Pulse Generator) handles
+  On Renesas RZ/{G3E,V2H(P),V2N} SoCs, the CPG (Clock Pulse Generator) handles
   generation and control of clock signals for the IP modules, generation and
   control of resets, and control over booting, low power consumption and power
   supply domains.
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - renesas,r9a09g047-cpg # RZ/G3E
+      - renesas,r9a09g056-cpg # RZ/V2N
       - renesas,r9a09g057-cpg # RZ/V2H
 
   reg:
diff --git a/include/dt-bindings/clock/renesas,r9a09g056-cpg.h b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
new file mode 100644
index 000000000000..f4905b27f8d9
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G056_CPG_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G056_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* Core Clock list */
+#define R9A09G056_SYS_0_PCLK			0
+#define R9A09G056_CA55_0_CORE_CLK0		1
+#define R9A09G056_CA55_0_CORE_CLK1		2
+#define R9A09G056_CA55_0_CORE_CLK2		3
+#define R9A09G056_CA55_0_CORE_CLK3		4
+#define R9A09G056_CA55_0_PERIPHCLK		5
+#define R9A09G056_CM33_CLK0			6
+#define R9A09G056_CST_0_SWCLKTCK		7
+#define R9A09G056_IOTOP_0_SHCLK			8
+#define R9A09G056_USB2_0_CLK_CORE0		9
+#define R9A09G056_GBETH_0_CLK_PTP_REF_I		10
+#define R9A09G056_GBETH_1_CLK_PTP_REF_I		11
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G056_CPG_H__ */
-- 
2.49.0


