Return-Path: <linux-gpio+bounces-11181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9FF99A343
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 14:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BE441F2256E
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 12:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B6E2178F2;
	Fri, 11 Oct 2024 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuDqHPyo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8710217308;
	Fri, 11 Oct 2024 12:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648361; cv=none; b=JkwfeWQwFF5Bdew2CoIZKcwiPdEDsUHN1ocqgeI7DwNW7hZiPq+vwDAUdRxDXZbSTSaKCe7gze3rPElEaZnoi203rycmUwpuWE67aj4WajCuwTRzToAOg9R8m1tpw9rzU0t3tM+UiVV7HD9gWk6F0YBYvQFjBvzeUzRkx7znC2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648361; c=relaxed/simple;
	bh=CzOZ1gSI3ssEpvPx7xZeBHUHSTMn6ySCz9+TFnoNosA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3IJ62J6LPo0GIonbCFi73Q88QSgMmUSWSIkD9sgKXxze/2uhp5jH+b0n6NAqZf9liQYztyZDrrT0+CKwTqgA5VDl0rNujXXMj8TOlp8+EXJChwQ6h3kYoM6GB9mKpglSmH/GUEy8Ul/s8eB0xsuFOGDkceWrRHrtKxDfPuuqt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuDqHPyo; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a995f56ea2dso311974566b.1;
        Fri, 11 Oct 2024 05:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648358; x=1729253158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niurVMnhr9XQkx+PBYP1+4uvh9hBDDKJ30fbJM9HVYQ=;
        b=SuDqHPyoiooMxgPOgBUb4k0B9Y5m9uSebAqkyzMKGsiPbYvC8t2IIRHOnUIL3Y3521
         CrwCDUMt/cMvn9tirWTDrewKHFWXIHeJydGmTPelcFZ7cLvxtHoSH47dlrYN45JbPQ9P
         17OSYH/zGzgonDGtMUofAhKWjsSlFk6DN7fjVkaMXt/Bip+w6yDwm/sY1tMXgq6e8yWh
         7dVA+oByPdal8NOlY/jEKu6Py6L7oAcgHIN51OevGEjydJWXL/WEh1SxAER4o4SlASOO
         5oz8K5XVLyGcGzsnCZHbsH9/iCNSoibRFr/1+v4oY0snVUhr4HiFXNpQGQAGjZTkaV/n
         DFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648358; x=1729253158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niurVMnhr9XQkx+PBYP1+4uvh9hBDDKJ30fbJM9HVYQ=;
        b=DK4YXa2Bj6WSRaJmDLvpC3+AliohRBRi/Z3mGKgvPg/g/1dsWl1DrhsaqwJebqH4AP
         Ci2TQilVH8pwhfMiPY5mL54tHvux1qh0FUeTWpceeUptxyRIEAlxSggptajPsWc8GXor
         aN+mNH3E3mc7hxFo1nNWwBuupezKc1kr9qoBnSRikQp7xo8tB+DqVCDsHYf3RlcmpJcX
         PfYq2EzikON5hUsQdHWOwDR6BLtk9kZbSS3tVDlZlBEgAxJ3uiYPIzeuo3loshOxdqCC
         7oM26ocE75i5a1MF5VVuH/ebG5l6O4qGjWlSp1EilJQdEmpxKlvzxyUg/sz7WgJROdjc
         BJaw==
X-Forwarded-Encrypted: i=1; AJvYcCVpKdWI9HJmOJRubAfWV2BuO7tG50UKje+o0RrZ9XpVJteQ51y4SGzna5JwOXWclPXgxI+e/z2o0YT/Rg==@vger.kernel.org, AJvYcCWvj93BmfREamD9m6/aUteDxquKqm8h9QmjROI96fuEtfFPocG+JIBrCJqPzUVIT3BZuWHK/+unBL3V@vger.kernel.org, AJvYcCWwOR63kYe2ifo/ONf6q5y3jM3rmbz3Wsgu2AkDHmxr3C+VIVeCWxroU/vwv+aJRwNI9B6Hl8F1TkPNlWUh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt07YeL/Fs3y6VgIwLZ9khC3arsWWKsmhZIGQxRR3OpVEmyWqA
	UEjGSATXPUJGpUqXRnK188yDBKNhDEuRc5fYhFsrZN6NnrZ8J02lFSdduxVmvsQ=
X-Google-Smtp-Source: AGHT+IGD/a5c4Tuo6e0RDCCx2Z/cj2KzFlEdqqvp/Scq3W0O0NLRN4KERK8jOfQwZ6WVmXN5mNx3vg==
X-Received: by 2002:a17:907:f1a8:b0:a86:799d:f8d1 with SMTP id a640c23a62f3a-a99b9583966mr212820466b.47.1728648357702;
        Fri, 11 Oct 2024 05:05:57 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:05:57 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 2/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode and property descriptions
Date: Fri, 11 Oct 2024 15:03:47 +0300
Message-ID: <20241011120520.140318-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yassine Oudjana <y.oudjana@protonmail.com>

Change "subnodes" to "subnode" in subnode description for better
grammatical accuracy, capitalize pinmux description, wrap all descriptions
at 80 characters, and remove literal style indicators from descriptions
that don't need their new lines preserved.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 352a88d7b135e..bf8dc176553c1 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -119,11 +119,11 @@ patternProperties:
       '^pins':
         type: object
         description:
-          A pinctrl node should contain at least one subnodes representing the
+          A pinctrl node should contain at least one subnode representing the
           pinctrl groups available on the machine. Each subnode will list the
-          pins it needs, and how they should be configured, with regard to muxer
-          configuration, pullups, drive strength, input enable/disable and input
-          schmitt.
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, pullups, drive strength, input enable/disable
+          and input schmitt.
         allOf:
           - $ref: pinmux-node.yaml
           - $ref: pincfg-node.yaml
@@ -133,7 +133,8 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and are
-              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
+              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h
+              directly.
 
           bias-disable: true
 
@@ -142,7 +143,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull up PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull up type, it is not necessary to specify R1R0
               values; When pull up type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
@@ -152,7 +153,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull down PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull down type, it is not necessary to specify R1R0
               values; When pull down type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
-- 
2.46.2


