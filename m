Return-Path: <linux-gpio+bounces-7139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E00BC8FBDAD
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 23:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C981A1C24A9F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 21:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9666B14BF91;
	Tue,  4 Jun 2024 21:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FKDTcuHX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8858314C59C
	for <linux-gpio@vger.kernel.org>; Tue,  4 Jun 2024 21:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717534847; cv=none; b=VWsJiL3g0Oon2tMR0aZyr3WSK19fe7hwrXdXzKwc/lNDBBYkCAs+ltRYIknTo0cB3T2H0ShCD58tE30Z5H7BllAoE2cQoCJOc+rT+q7C1r+dX+4XITzkNbg3w80jxzDfc01t2yhm9oC/TkPut6YlXP8SUk0i9uOLF6qss6FVJog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717534847; c=relaxed/simple;
	bh=GqHvE1UnreGJtntPnTAT9B/LVDdwjmGnTFg6hiSqSDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dEQel57iXwFXMrjpkl6m5vl+/sc1haasb68e2l0mScyFzbAIPPlJy3LDjzFpRQOslSTx1vZrfN8DPyidb85qPbvTINPd/9gcmyXTOAHB070ya6ZHna7rOor/eE5oV3vMhG1hVJhUHBbawhiTyWPnXGcYpbCj1W947o7IhlB+fZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FKDTcuHX; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e6f33150bcso62965581fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jun 2024 14:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717534844; x=1718139644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCSn4qOvGeD2aNGu9iMn8q1u07VdwHi0maMLWc8fmG4=;
        b=FKDTcuHXcjzkqAmGXgdU+qBpvonZ3NxsgGr7GpFhIgLrNXrTMdh41nT9KVYrAf/PRa
         k2JleI0qlYgHi3/PXM/o75aSCBYsobgDNscQH9sf9Wru4EmM6hiDPrM4b0zYZd4/frbM
         9Fux0IseEpvL8NOQNrKMD1YeBvOnCqC5ar0HEIN33FPq4jN7T87IF2FWTzAp4fUJecaG
         boPg504uNwvHycdlhqa13nlPcrI6nxSzSzzMlP+8DAvBtpygbkJKtn0MSGRRFa3qJqhm
         GN5cURWq3COV5P1QOcXiIpRLtkiyohRgTE+EAqlChAbRgtkVkTxzujRUTee57zi+nhHi
         pCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717534844; x=1718139644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCSn4qOvGeD2aNGu9iMn8q1u07VdwHi0maMLWc8fmG4=;
        b=taRXctlkzNjB5UkCOW0EpoJ55OiUuhnnwt9s2yDNp5orG29V7tGUXf/MXkr8iPNK/1
         JzaIoLgq4IbE7AoZxlvRsht5NLU2Jt9tSm3CDrlNsz/WPxg2RvTnPcX3i5Y+fEc4mvrJ
         +uj9NChC77o/CNJp+NlgS69lDDq60mYrz6s0yAwKo8zkzej4krXp3i37zNiDbKb+femn
         6uttoH6X6NshFjFede/C8FSDaWMuBsl2BXQRpX7hvIDF6g2cfi0VZE/8DrzX4ifK3Adv
         jyORBRTotu/EnbGsKyzNC/RIRoAPT7EyGc3K42Hz0eqzmS+iTM9zca3eO3XhdKl5cY60
         0anw==
X-Forwarded-Encrypted: i=1; AJvYcCXpV2bgNd1AAJwGhDkQKZsLw+9bVUblHVKduBz1G441itetMaDYdp+A+pImcLGrlxpa9hUwMwHKh8DJLbJJNDKWNkH5n8wWKxV0kQ==
X-Gm-Message-State: AOJu0YyiJE8eFbXH0h3c/c4sPvVAzSPvnXVLUTC/+pXT6ecXbOfcdAZ4
	f8wqt94GU49V5i9wkao5vy7A/m+R8C7LLhNnQCcL3npMnr5iO58vJX43l7XGouA=
X-Google-Smtp-Source: AGHT+IE9+xCoJOHfnQnMokBP7OaDeheDgnzCfQ1KkXEd7b74F1jA+KK7E+ny7Dx3xKJD1D9+ZHkZQw==
X-Received: by 2002:a05:651c:210e:b0:2ea:9449:7711 with SMTP id 38308e7fff4ca-2eac79c33f6mr2437851fa.2.1717534843586;
        Tue, 04 Jun 2024 14:00:43 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cc8082sm16140991fa.94.2024.06.04.14.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 14:00:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Jun 2024 23:00:40 +0200
Subject: [PATCH v7 1/2] dt-bindings: pwm: Add pwm-gpio
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240604-pwm-gpio-v7-1-6b67cf60db92@linaro.org>
References: <20240604-pwm-gpio-v7-0-6b67cf60db92@linaro.org>
In-Reply-To: <20240604-pwm-gpio-v7-0-6b67cf60db92@linaro.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, andy.shevchenko@gmail.com, 
 Philip Howard <phil@gadgetoid.com>, Sean Young <sean@mess.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Nicola Di Lieto <nicola.dilieto@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dhruva Gole <d-gole@ti.com>
X-Mailer: b4 0.13.0

From: Nicola Di Lieto <nicola.dilieto@gmail.com>

Add bindings for PWM modulated by GPIO.

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
Co-developed-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/pwm/pwm-gpio.yaml          | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-gpio.yaml b/Documentation/devicetree/bindings/pwm/pwm-gpio.yaml
new file mode 100644
index 000000000000..1576c193f2ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-gpio.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic software PWM for modulating GPIOs
+
+maintainers:
+  - Stefan Wahren <wahrenst@gmx.net>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: pwm-gpio
+
+  "#pwm-cells":
+    const: 3
+    description:
+      See pwm.yaml in this directory for a description of the cells format.
+      The first cell which represents the PWM instance number must always
+      be zero.
+
+  gpios:
+    description:
+      GPIO to be modulated
+    maxItems: 1
+
+required:
+  - compatible
+  - "#pwm-cells"
+  - gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    pwm {
+        #pwm-cells = <3>;
+        compatible = "pwm-gpio";
+        gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+    };

-- 
2.45.1


