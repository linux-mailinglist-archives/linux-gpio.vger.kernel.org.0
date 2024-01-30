Return-Path: <linux-gpio+bounces-2733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC8A84248D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83025B2F5A2
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D236A34F;
	Tue, 30 Jan 2024 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="QhF49jlT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328146A331
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706616526; cv=none; b=kjypr+ByYGOCY2PX7dK07NNkAMkJ47OIRaF//Kl5r7vsVmMQ3dJd1+NQl55OzzQzW9fXHx5A4hc5YTY/bZB2gYS5FOfVb99aNW8FlgOVP9VP/M7t21AzY9esbTDwjVaRZ70+4SNYJ5zfiulBEyJyXTsJUgE//LR91NfzwN+2Nak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706616526; c=relaxed/simple;
	bh=zDcAbkLItqPMxxfP3aRTCDFDYSoc9GjSDeC3F04oer0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=erOYCCjK2vrMb0NjUZlsP40ODsvy7wCifJbcNKdsKvTrM1M6TTxXl8F18OuiymmgQZpro8yZgmXMQlDh1xASTg6C7k4vEIdegFELSZL5VH3fQcnuZRwd2wGCakCajsj50Pk2t1JrPJk0aMNev2wroeMVbYXhofXCtyGwAP/0ZmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=QhF49jlT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a350bfcc621so418895066b.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1706616523; x=1707221323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=In0D55Mdq6WXKilN4JPLmFe9w0y3bSsay5sRffELyd0=;
        b=QhF49jlTP4HyP1Aa5qS0zvUUoigbQqkg/0Lg2F8+7UYD0tGrU9GxoNOuiTTCujhc8g
         +9nmxj6rA1CHZhTzagCl2xNqBy3PwpQ39+lRdqtYsgtSsAka8JKAeeU6iR3Ym47ZqidO
         6bu72f45bns/XS6xWz1DxxvgEuViFBo3xblZj0jNBxA0lW4zk7Vm013XOUQAcqduvJP9
         xGWLAJm8JnIige/2OY3K1+XgQxYdGS9pVHIZjuRd4GfxiW4TZaTCMlqkrfx3ezwZF7rw
         FS3NkfAW3sYdV/pdpVOvAbC+I4/Cka9hJG/cr41FLsvXGLr3iMhPHkWurtVSaGPo2nzR
         sl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706616523; x=1707221323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=In0D55Mdq6WXKilN4JPLmFe9w0y3bSsay5sRffELyd0=;
        b=cFuu+N3s0gN4HeljK6RAQvz4ygEUynILwpHu/ksVx0lkUnqTqzTJY5dWWsRbeBMbdJ
         DFPLQLtqSol3HSu6/YZdLPtGKUSqBhyGfWE6lHh+YVFiDuJNQKvZD4VQmgdmv8SluaHi
         etfiyrZfOM22npG3mT69w76+px9XH6mYqb9N9Xt21TLwInvB8KNLGiK3Wxc50SEyHAbr
         cRO17tcP8TvEwYE2bVmuqBCSCWSu6JDZvH/JlLMLAkr9jG/V/wU+WjhgGrCTnov6nXQp
         +YuyhKp5sLI1UVkryMIM+S5CDW0ijdOcHSkYvgKhLSSsjzvJZ4rXWGgykOlSKfUSB5e6
         QzLg==
X-Gm-Message-State: AOJu0Yz1nEwt7EH7DFj+ZUnQYo1rX3+zzn8ntlt5k8GlFyhZWTGDxrwH
	lWxbw9UaXwBFQQwhuZEhEIqQtSZBN6nSyIc9L/GzE93MaGhmTPoAVhShP6ABlKM=
X-Google-Smtp-Source: AGHT+IFu1x2NO+wOXcim/9FpMa2Nl7kBu7CCXr4K65rQBZKR8gTlcepFpx4upRKOpR9sz4mFwIAZRg==
X-Received: by 2002:a17:906:1c50:b0:a35:7438:113d with SMTP id l16-20020a1709061c5000b00a357438113dmr5415571ejg.27.1706616523224;
        Tue, 30 Jan 2024 04:08:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVVEfzifHvj6OKtuasaqW26a+xizwHZ3E8WMl3oLvw9q1sUgyPHCdTkUDaULnVKunGgFNz/wLhqddeFP/eDAs3/mjn3Ic33YTcJn/e4D2ZQL1QzT9Z0LokBbUfnNIMnJP9k9OTY40OpG8vw4LaBdCx16q0ikCYUp+xxRafwqPa5s51hnlzavQPmRz01D/4p/KbniIVIV0K74NIScTnk3T/OHBSIhkuba23XYHnYHkUH25J2Y/Ux7trcr3NJVhM+EdaQt4pA0XQAlSkWeGUttGpK4h/bw6TIkhksZMwafqp2yS9mPk4R6OuIlJSizShaz+2EQ/RQcMgbEXkc/IU5+BTqKzmnBItij2hmsmCREg==
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id vv9-20020a170907a68900b00a354a5d2c39sm3751242ejc.31.2024.01.30.04.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:08:42 -0800 (PST)
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
Subject: [PATCH v2] dt-bindings: pinctrl: cy8x95x0: Minor fix & update
Date: Tue, 30 Jan 2024 17:38:06 +0530
Message-ID: <20240130120807.460335-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update maxItems to 60 for gpio-reserved-ranges to allow multiple gpio
reserved ranges.
Add input-enable property to allow configuring a pin as input.
Rearrange allOf
Update example.

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

base-commit: 861c0981648f5b64c86fd028ee622096eb7af05a
-- 
2.42.0


