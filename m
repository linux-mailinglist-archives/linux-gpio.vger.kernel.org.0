Return-Path: <linux-gpio+bounces-10285-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B78297CC3C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C5B1288931
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBF41A3AB1;
	Thu, 19 Sep 2024 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cric9RZk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97C01A08DD;
	Thu, 19 Sep 2024 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762572; cv=none; b=seI+/FXR8B9q3eZbZrBRdj0Th5yX0f2EUUumbFgzVfHQXJ9gh+bSiiu9RwCKvdsaEmYUFZriEak1MBXfM/iN17LcVjjuekO56mKGReTCx7Md6u4xI4lllDvrs9uC/eVEFCSm+na1p8/O7z2ncOhYOh3VCa9giexWIU3DuXQuoPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762572; c=relaxed/simple;
	bh=gxcmwltno7gzJ41Nz8gyYVTEjmeGDyce97eI2RwGLXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=guvSjRZWcdFaTs4eqC4Xg+ddr/rOCdYv1Qw4XXpMFlvpKTWgfV07+NiR2r/WuUc0klc88notuj05vm1mqx596/fzzZUu2qzlXeC2mfvJttYJNZoyg9eEMKTvHbDRIpfCBwXP3pgc6t3XuA93vsMGXFGCdBWkBK//90Zm928XZlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cric9RZk; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2d86f713557so780929a91.2;
        Thu, 19 Sep 2024 09:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762570; x=1727367370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qYZTFW41o+4HCo/KseCTomc1lLuFsUX/gJnprrWHX8=;
        b=cric9RZkGsEnbRbMFngWEz6mOD06x9SrsWRFdioEQavv0v9SOFNg+uh4o9qiz9tOiq
         Rm4rXC3ewD5TAaXg7Y8AGKAYy13pxcQRoh/oxFsEGmpeJ+pbiE0M5xmRXoWz6w3Jpk7n
         7eF+UEG2KFgKHHDa5e+I9N2DeIn/y7i3i0d75gwAyRO1HXDhyyxQDapCrHpzq+ZYbUAE
         1EpxmcgGoumC/gAL53n+2rZ2eFOZCYLu0YvZWmWxAtlOax4J4mn1rremVzUwKgKC58N4
         iLE7e349OrGoSFuaRdLydno5Z9fHjdmtnAdyMn7atvUhX3ZtgyzBeIE/NC6qnE1GGN9l
         k4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762570; x=1727367370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qYZTFW41o+4HCo/KseCTomc1lLuFsUX/gJnprrWHX8=;
        b=dm6ZSThcxB2kht8M2AsHuIR34KVXntE2g7uIhSscOdpQV13KBsPgOwbVAgY89ToWrS
         olyfGnBEmwgcDjyU81PNz17XQ2Zt8DOm4QOvYH/Fpwx5HCx/PqOi7aISR/R89M5rnbRs
         Y4COsVAiQOzp60/tC6evfPf56dxsAIgI63NNTvxnt43vWKyojfRB/5FEzk3tE2nvB/ou
         myfPlHMlVkjtWRUj9hppfvUdwbYgDc/dyBFbcSYgUCKNXJQw7rD5on/3poAp2mpE+MdS
         DP81aRaJDDEp/+8LnwRdMAmYWLuFptSEbNZodssSy9qAacEo+lDsgHV2J3XvhYJoZ/m7
         qMEg==
X-Forwarded-Encrypted: i=1; AJvYcCUqGksDy19Xi43CJrZ/2nLguUVIbGNQaPzc7TiRRjgRUQ2fOsd6QbZpgvuNhA8JaNkNeEVpZjjLw4TT+g==@vger.kernel.org, AJvYcCVMeYHrkserrrD1JrS1cf3lA5yzb748cTj3Iky6yFLEnpPgbQb3EEJVodV5zyWoiVyFUQeCpRpUHq7V@vger.kernel.org, AJvYcCVoUY/AmWH20WYJRa7fWpHud/KMpFfBDSo9VS2KqnDUewTYZuGRmAokzETBFNuuCAK0zQ49ZaEI5OLVL0DZ@vger.kernel.org, AJvYcCWaqLF5YORQSwING00lW4e+CrDGzMkcciPqAZzJ/dQBHF8VTuxSSfkbdWuF/M694T3TJLvsiDQvngWlpsgMzeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW/X4Ny1tAJMvhOaY8NfYOjtRaE3pUt+nymKMLkINBQD7Nfaz4
	kmoJRvbwPK3b6j7kAhWtqYQ+Ow3lkKMQpP68wxvfAiFtr+V5OHu5
X-Google-Smtp-Source: AGHT+IFZnjxf5+VdByhmuCWtZzDszq9rZp0DmzAmzzCbmkACIkAItPYU42x2sx0DlOnUrUYzJEHRfg==
X-Received: by 2002:a17:90b:1c07:b0:2d3:da82:28e0 with SMTP id 98e67ed59e1d1-2db9ffc1c9fmr26383630a91.9.1726762570180;
        Thu, 19 Sep 2024 09:16:10 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:09 -0700 (PDT)
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
Subject: [PATCH v4 07/20] dt-bindings: arm: apple: Add A9 devices
Date: Fri, 20 Sep 2024 00:05:56 +0800
Message-ID: <20240919161443.10340-8-towinchenmi@gmail.com>
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

Adds the following apple,s8000 and apple,s8003 based platforms:

- iPhone 6s
- iPhone 6s Plus
- iPhone SE (2016)
- iPad 5

apple,s8000 is the Samsung A9, while apple,s8003 is the TSMC A9.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index fecc4953df33..01965890b4ef 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -31,6 +31,13 @@ description: |
 
   - iPad Air 2
 
+  Devices based on the "A9" SoC:
+
+  - iPhone 6s
+  - iPhone 6s Plus
+  - iPhone SE (2016)
+  - iPad 5
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -121,6 +128,28 @@ properties:
           - const: apple,t7001
           - const: apple,arm-platform
 
+      - description: Apple Samsung A9 SoC based platforms
+        items:
+          - enum:
+              - apple,j71s # iPad 5 (Wi-Fi) (S8000)
+              - apple,j72s # iPad 5 (Cellular) (S8000)
+              - apple,n66  # iPhone 6s Plus (S8000)
+              - apple,n69u # iPhone SE (S8000)
+              - apple,n71  # iPhone 6S (S8000)
+          - const: apple,s8000
+          - const: apple,arm-platform
+
+      - description: Apple TSMC A9 SoC based platforms
+        items:
+          - enum:
+              - apple,j71t # iPad 5 (Wi-Fi) (S8003)
+              - apple,j72t # iPad 5 (Cellular) (S8003)
+              - apple,n66m # iPhone 6s Plus (S8003)
+              - apple,n69  # iPhone SE (S8003)
+              - apple,n71m # iPhone 6S (S8003)
+          - const: apple,s8003
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0


