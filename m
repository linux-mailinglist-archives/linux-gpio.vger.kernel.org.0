Return-Path: <linux-gpio+bounces-2604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFCC83D9D3
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 12:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86288B2B6A9
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 11:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2321518626;
	Fri, 26 Jan 2024 11:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="L03Nu2Tq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497B61A731
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 11:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706270276; cv=none; b=ddZ+aKSHMUTxQMly6UL76KvyhARpY2stPxtKvNxCMILWeawFlfy0Vwjd+ODi8wOyqc+RmkODQNYeEoKX0kw03k+ehTRnBjRmeanUL6sCDrtgWGucVCf/CUPzfcyOWDuUQCGwD34Cs3Pjo9GqrIFOlqn8xmdoxchLx/FBPBPewk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706270276; c=relaxed/simple;
	bh=fww9EB7dHTt266qwXpxXlSuJ7F6luyRDgiG70yImJ/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QD4rKIHAISJ+rZxThS0rrYck43CXb36QbrCUZrfsOa0kmBupdbsnuUCdYQuDdXIGZ9+kSeQrqF/MByDbVmHV0FEMvqFNlcmDv2z0xLT8t17Pw1IfxwkifxYwqhfeQpoNlwLNaOfYAPw73YcFYGyMCrwWkWQuGbo36Vfkc+qcnxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=L03Nu2Tq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-337cf4ac600so308434f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 03:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1706270273; x=1706875073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6igzwQypdxPSe5LiU4uAuaHmPYLT8/p0hJRSsz2288A=;
        b=L03Nu2TqrDfKunvmkedqLYo36Khot4vBn0yMINlhwvf2DW3AkYCLiGjr9MhHThM/at
         Z34K2d9kbmfoQ74FxtIltK8zPpMHcIf4nfWq6ZZ56RBy6fltLquqMSictYTVlMvfF7mv
         3HpsyeIHVulVbFkFQo6MWBlilzTUN5znFe19350v1GsnWUYKszigzI1d4W1ItGOSJnyP
         BsccWyFBn8yhUHMQXdWQ7h+22f3+6+Nk9EbxgWV7lZ7OVLzpQc2IlSJ3SKM1qUfvRBKC
         pZR1QbM7OysDVvHWv+ngOFZkK9zaBmH0fHWNNpKxyDpYyOdubMkm3u+6kkF2wUXOPMQy
         5aBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706270273; x=1706875073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6igzwQypdxPSe5LiU4uAuaHmPYLT8/p0hJRSsz2288A=;
        b=nw+JoHX7z/tSsLMpRMB3PQUO4B3wCneSRzJJwax9XtV6hP1eJo5JXJye3UTDn3JbHM
         aEpdZQRWTksHGlFa3R9BApEQj2EQTqvbqooQmJ/QvJudoYDRThKCFGH7/Zcr+vPcVwHC
         j2oLuVqkXKObrYZt/qytWilkJU3LVgsMiy8vJuTsEVvbnkxwzIOuY8j8+N4MP7bA/EIC
         9/ytez77YX15chzywnfUG44CQlR0jErso9yW80gOF+5YvnopwESBsH4ZWTY494VWtLYX
         cXeoz2WrPDbSEKkzt3ojXHHkRcxAAFmPXCR6K3MnA1XBGvdmk4k1oLPlmjBJJkeYHhs5
         L+ww==
X-Gm-Message-State: AOJu0YySmXKCH/jw9wIF0A6iterpplWEvKb6A3pIeWYKzh64Cv7frfPT
	Wz/FyjeyWmTNt/7Z98JIZYufZENt8iSolGFyC91Tb+wvPGUeewfG46UAI5R0cLM=
X-Google-Smtp-Source: AGHT+IH/g7DbFsBW/D5Q0U6E+tjhovnYwoTtkSRKVmze6lMSQku+rRgaWgmlm+VXvHeX7yyey18UCA==
X-Received: by 2002:a1c:7506:0:b0:40e:86eb:9e7e with SMTP id o6-20020a1c7506000000b0040e86eb9e7emr823322wmc.142.1706270273511;
        Fri, 26 Jan 2024 03:57:53 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id bd19-20020a05600c1f1300b0040ed1d6ce7csm1682149wmb.46.2024.01.26.03.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 03:57:53 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: mazziesaccount@gmail.com,
	Naresh Solanki <naresh.solanki@9elements.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: cy8x95x0: Minor fix & update
Date: Fri, 26 Jan 2024 17:27:48 +0530
Message-ID: <20240126115748.1491642-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update maxItems to 60 for gpio-reserved-ranges.
Add input-enable property.
Rearrange allOf
Update example.

TEST=Run below command make sure there is no error.
make DT_CHECKER_FLAGS=-m dt_binding_check

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 .../bindings/pinctrl/cypress,cy8c95x0.yaml    | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml b/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml
index 7f30ec2f1e54..89ce0cb68834 100644
--- a/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml
@@ -45,7 +45,8 @@ properties:
     maxItems: 1
 
   gpio-reserved-ranges:
-    maxItems: 1
+    minItems: 1
+    maxItems: 60
 
   vdd-supply:
     description:
@@ -85,6 +86,8 @@ patternProperties:
 
       bias-disable: true
 
+      input-enable: true
+
       output-high: true
 
       output-low: true
@@ -101,6 +104,9 @@ patternProperties:
 
     additionalProperties: false
 
+allOf:
+  - $ref: pinctrl.yaml#
+
 required:
   - compatible
   - reg
@@ -112,9 +118,6 @@ required:
 
 additionalProperties: false
 
-allOf:
-  - $ref: pinctrl.yaml#
-
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -133,6 +136,21 @@ examples:
         interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-controller;
         vdd-supply = <&p3v3>;
-        gpio-reserved-ranges = <5 1>;
+        gpio-reserved-ranges = <1 2>, <6 1>, <10 1>, <15 1>;
+
+        pinctrl-0 = <&U62160_pins>, <&U62160_ipins>;
+        pinctrl-names = "default";
+        U62160_pins: cfg-pins {
+                        pins = "gp03", "gp16", "gp20", "gp50", "gp51";
+                        function = "gpio";
+                        input-enable;
+                        bias-pull-up;
+        };
+        U62160_ipins: icfg-pins {
+                        pins = "gp04", "gp17", "gp21", "gp52", "gp53";
+                        function = "gpio";
+                        input-enable;
+                        bias-pull-up;
+        };
       };
     };

base-commit: ecb1b8288dc7ccbdcb3b9df005fa1c0e0c0388a7
-- 
2.42.0


