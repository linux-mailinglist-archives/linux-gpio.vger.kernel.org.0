Return-Path: <linux-gpio+bounces-27453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DD0BFC3AB
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 830786260CC
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BFA347FFF;
	Wed, 22 Oct 2025 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBhLgU/o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8739348869
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140071; cv=none; b=obp4ZWlvzE+K5ZW7NbcyXYxJ/YMH+1Al9rzUs08zcoXNYvnNmpe2u0qp/52J5gr15KmUfhc/Tz227VKVI3kMkwxwH/xjedyqYMcx2LKrfhSF8im+2l44IRYwj67IrPMtKDH0aEane6jwDNZ5ngpMSu83x5E2DPBbWywzDgPGo74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140071; c=relaxed/simple;
	bh=t58k7nuf9fXppT7leLM5wPeiFjCn4yr98+SyB7CjCIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r1ezxO7MMh+h+meOws+z7ALlBobPZaBkCK3V+7sUBqZLSfcfP1yDH7/awV6XcLWEsQerl7+C39z0IkslxhTyVE2qRPNaDRPXXr3EtOEjH0bZpVAAdKFUTo7PbnO+OLnfjogC3z4jkOJZlhO/EhXCfLY68MP9VNynk6a7NWBLeB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBhLgU/o; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-427087ee59cso765805f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761140068; x=1761744868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rFXbojovxWliJMkNJdsF09HvmueXHOHMsMOPKrCfmZA=;
        b=gBhLgU/ojivpduN2gcdB3lUg9+9Jw7ht01gSzRJMbpFRrvZ+TsIcl3tzsrQ06XaBYG
         b/LGE6I5n81903wXqo+Oj8YUcX9v2nTq2N3tkW6GZQpPck8w/Pum/0u/RAJu4722PNgX
         OOsuBrDMVTccEUBqEflyQojt028JOadAoosJXDH/K6f8MsDlY8PWnKXQXFfQPmBNAMEL
         aVvi//PoQF0unp1IUDv2llfwZ/pM3QWUMpzFeeS50lXHlD5BtgE+jCq96b1pGGBPcasy
         OZQkOTuqoW7zZiyVw3/KiA/3NKHozYEDWHNd8RRJKErg7Ik0/uuPM66ay3u9bxalaaxV
         5fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140068; x=1761744868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFXbojovxWliJMkNJdsF09HvmueXHOHMsMOPKrCfmZA=;
        b=GVSFhz7rx4iufZF0VBwXN/SPu0i55Y9gluD2uvmR8CwvtGFUBKDJ/tAawvUVnGJzpg
         8K6cneULlZVoVnC7Dgerv7UJk+eSYVwDXTOpBPUFl8b6KYE5U6bT1+KSK+hktyfMPIVv
         QgB+EnXe2ZMHq4XTcIqIYS/eDozlbkoXIzkrN15fzUFgjQMqIt4oFgFqg8ewJL9BmzEV
         R/P0Rcw+rk4H+N9LSYFwAyngwK3kiEBoZWXTRkM2LWPUI6+260JLdpSLC0ZpySl+RhTI
         rn98+rYj74Lg9cZS6O1O1KMKcOgv2mmwYreIK888KzFoBLIquZJZEljIfNUoYxytqBiq
         Ompw==
X-Forwarded-Encrypted: i=1; AJvYcCWVA/JAhamyYXq9Tz7M93fwG2baLVm6WgZiNmG5Uzg8LnZ5Ib00ezNnI3V8HKKWgajSAyGjdAiE9NSf@vger.kernel.org
X-Gm-Message-State: AOJu0YyJSuJ/8J5iCcIoHCLpOurHLC8f2L8TX8kzDFKGDbhvSP8A153Y
	Jnf6GOMAdysGTUDFkQpaxKAJuQiE8qej3il11t3CFksEBI93JNzUU/IfJYUgwa1MB4Q=
X-Gm-Gg: ASbGnctZar6cTxOAHUye/EktHo+naqNmwR+DSfaJ16e6HjuIR6ggtZ+4E/HeRWcbCGg
	Mmr8eBgu6/WWPa5fb21ShoGEEuO5IDdd3wJonfooIYhqE2mOx6eAVetXA85ESS7gKn7WbP+5+za
	ovchb/0wYJlqD3cdQtQbphCM9vRGzu1c4sZj4spK0jbRV5pxoLIGEIAQqSjZY3ygm5Z90ajAmfD
	yzeDbbOQCbvjq/BHwfnTTtYrBPuydCv32ltIrfNnMHxZsihKWVKIqfBX32R6vFwT/vVNScYe47E
	dsaAUnAtoP162/Qp8XfQIUCKgMDHMC0iflg2XepBAw6i5MzDA0/KLrgW41DeNfV4uuMeok8eX06
	Wbb0mhFySueTrob2e5P2WEIA2h0eHOr5rcM/sNoo7CEggSEAaoBl3jBF6k6Wy0Jq1R9m/kG2ht5
	RgTYcbckCdBbYcN08EpMzLCQ==
X-Google-Smtp-Source: AGHT+IEWcnZIaP2wLBKfRqry0HILeS5KfSEJcKKwt34JV4PPLBebPsmgOhwbhA8EkzXLqs8P73MPpA==
X-Received: by 2002:a5d:55d1:0:b0:426:fff3:5d0c with SMTP id ffacd0b85a97d-4284e531afamr2257012f8f.1.1761140068108;
        Wed, 22 Oct 2025 06:34:28 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42855c2fb92sm2981201f8f.46.2025.10.22.06.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:34:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: toshiba,visconti: Fix number of items in groups
Date: Wed, 22 Oct 2025 15:34:26 +0200
Message-ID: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "groups" property can hold multiple entries (e.g.
toshiba/tmpv7708-rm-mbrc.dts file), so allow that by dropping incorrect
type (pinmux-node.yaml schema already defines that as string-array) and
adding constraints for items.  This fixes dtbs_check warnings like:

  toshiba/tmpv7708-rm-mbrc.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctrl):
    pwm-pins:groups: ['pwm0_gpio16_grp', 'pwm1_gpio17_grp', 'pwm2_gpio18_grp', 'pwm3_gpio19_grp'] is too long

Fixes: 1825c1fe0057 ("pinctrl: Add DT bindings for Toshiba Visconti TMPV7700 SoC")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/toshiba,visconti-pinctrl.yaml     | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
index 19d47fd414bc..ce04d2eadec9 100644
--- a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
@@ -50,18 +50,20 @@ patternProperties:
       groups:
         description:
           Name of the pin group to use for the functions.
-        $ref: /schemas/types.yaml#/definitions/string
-        enum: [i2c0_grp, i2c1_grp, i2c2_grp, i2c3_grp, i2c4_grp,
-               i2c5_grp, i2c6_grp, i2c7_grp, i2c8_grp,
-               spi0_grp, spi0_cs0_grp, spi0_cs1_grp, spi0_cs2_grp,
-               spi1_grp, spi2_grp, spi3_grp, spi4_grp, spi5_grp, spi6_grp,
-               uart0_grp, uart1_grp, uart2_grp, uart3_grp,
-               pwm0_gpio4_grp, pwm0_gpio8_grp, pwm0_gpio12_grp,
-               pwm0_gpio16_grp, pwm1_gpio5_grp, pwm1_gpio9_grp,
-               pwm1_gpio13_grp, pwm1_gpio17_grp, pwm2_gpio6_grp,
-               pwm2_gpio10_grp, pwm2_gpio14_grp, pwm2_gpio18_grp,
-               pwm3_gpio7_grp, pwm3_gpio11_grp, pwm3_gpio15_grp,
-               pwm3_gpio19_grp, pcmif_out_grp, pcmif_in_grp]
+        items:
+          enum: [i2c0_grp, i2c1_grp, i2c2_grp, i2c3_grp, i2c4_grp,
+                 i2c5_grp, i2c6_grp, i2c7_grp, i2c8_grp,
+                 spi0_grp, spi0_cs0_grp, spi0_cs1_grp, spi0_cs2_grp,
+                 spi1_grp, spi2_grp, spi3_grp, spi4_grp, spi5_grp, spi6_grp,
+                 uart0_grp, uart1_grp, uart2_grp, uart3_grp,
+                 pwm0_gpio4_grp, pwm0_gpio8_grp, pwm0_gpio12_grp,
+                 pwm0_gpio16_grp, pwm1_gpio5_grp, pwm1_gpio9_grp,
+                 pwm1_gpio13_grp, pwm1_gpio17_grp, pwm2_gpio6_grp,
+                 pwm2_gpio10_grp, pwm2_gpio14_grp, pwm2_gpio18_grp,
+                 pwm3_gpio7_grp, pwm3_gpio11_grp, pwm3_gpio15_grp,
+                 pwm3_gpio19_grp, pcmif_out_grp, pcmif_in_grp]
+        minItems: 1
+        maxItems: 8
 
       drive-strength:
         enum: [2, 4, 6, 8, 16, 24, 32]
-- 
2.48.1


