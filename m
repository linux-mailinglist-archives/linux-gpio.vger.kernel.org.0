Return-Path: <linux-gpio+bounces-17936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C21ADA6EB01
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95ED116FB8F
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 08:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0F425484A;
	Tue, 25 Mar 2025 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HV+J+HdP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53B4D530
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742889775; cv=none; b=QtRZHUvmtn1W/CRMlGpNxXmKCtdKUoscfyhCWqwwtUuIYOIcOcEJM2zsYwPp4RHBUlkwX8iT6Ce9fZFHKFKpwq8wnBTk3Q2pAqFB/d+NHQKEdmR4/ROV/pRjvUVZWRyu8n7xz7TaAiiNJfN988uK9O134Rs5uKol1IirGWCt0yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742889775; c=relaxed/simple;
	bh=08g+dfR3FV6Y6Q1D84qQqREWDz+FcRKr/yg3IyPY/+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lYnoL8F5QKCc5EOgToCANJy7Y/5c0Q2n1TuOxPLcD00ZbLV6dKNvHgHKlxxxC0RGEMrKv/wph5IyAI0ZzNMKjY/BLTRmecohVdzEtXhFmy2XhLwlVaBCdwGGTdyiSZbflvxZ54wuDhkXV05VB3mnhgute/G6qwu0Uemh1dSzz3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HV+J+HdP; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so430125a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 01:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742889770; x=1743494570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6SEwl1TCy2+vIo8t3ZzKiS9UVWKw2bXaNUc9+NWEYzs=;
        b=HV+J+HdP27msw87G5m+fkHOniMkh9ZpCKH/IjxLOC28XvSAFOoDtoree2wadgKBAyJ
         B94rPlGeQiAlJBLxu9fBD3qeRQoTp+wkd5Yc3edplu8r/j93uUhnC3jBB1d2iqX6KFci
         probPHRQNheao6s0m4bdr48m4dqvNNGpqRoqODB4dj277EjBTH+cHqFh7SztkVqKynhc
         ZKdWa7xjikUKB+HilUrY/x61J3CidCzyKCepGSWvG7+URmgn8Ar1LSpameJtPsDJ9mhb
         je/amYFDcyVxn99h0FpRFHt1vYpSHhTBUd569obOj1gZJIP4LsNG2y3oecE0lqSRsn6c
         ZmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742889770; x=1743494570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SEwl1TCy2+vIo8t3ZzKiS9UVWKw2bXaNUc9+NWEYzs=;
        b=mXNJtXvl2RW+EPR9ofIJ9PXuBhDvAAdDIhAlkSb2Q0HXgkghFKGgFOPCiEafxZa+Z8
         7BZZ78I0sF3hmPtMGMIkAOQNTypXPP7m+QLC8OTV5pkXZU4ErFkkJpwafOGNTkPtWw8K
         5R4i8SvG7MiHfsmKoFDmHYrEKuEAgQmEcQOaxIukH4dv+sypJMyiwzz4hMy4ah/ux7e8
         7C+mKTuMgUxVBXhP2P6KxSTyN2CePPnxlx67XdVxTjYOynWNhQnc+CaiOhrtYBrjbEgT
         sJVGVc5M/ERtmQlPf49PzDfo6DDalp3L1ze7IzY7ce2YifzzqykvYCVIidCauzFVnMTR
         oWsw==
X-Forwarded-Encrypted: i=1; AJvYcCVsbkjhxvZeUR9uJ4jyEtiNxnFBllSkGetiSiFjglawl+Gg9DTuuI0XrcFqGeklmQcM6+kwvMNcYYX6@vger.kernel.org
X-Gm-Message-State: AOJu0YwcXjRfFxDX6GN+fbmvf0PHrJBbsZT7ZUzj9E2iFHFR/O7LGlwS
	pTJiK3mtYZBj4rzNB/HmIhepjmSPNhZsrlukFVdplZNiIgqH/nS8zMyMtf5FAYQ=
X-Gm-Gg: ASbGnctWWsT7mCHaV/Njr+wRRp22tDG/Ya7iN6AaBnk02oIKsUttQkSFnMwC5oJMHyF
	ozO1pHL3xfm/Sx0EP4ho6NfJJK+wwL8Qv5Lt8AfTgQ/mCK25uxZEAQfr69mBRpYayTc3KCEndhV
	jHuKZD6m9wvAU33xHpdbcqH3INWBaLjGzcGrR0mJNG82e0H3ZaGRsVQqTNjSdHPSZtFbACj71XT
	4uBCtpGE7/Wcl05vm3nI/aGTcwXVoXVTn3Lyv7E4Pf/gm1YMfZW1g8ujW0DcYsI6PtkyrJBlsyI
	31tdU3XJ16VP2xc1lsPBhs1ddIWBQGaCAtiSsO4zTDvL2G9QJRaes7MXdF87WseQycMWmJNcYsp
	F02E73xMSyhm+GK8qFlt1ewATBZD1
X-Google-Smtp-Source: AGHT+IEp7lof/A0OionGLJZy6jB+PNe7OTo3Z3Wv4VGDxxx3INxKX7DAQhryN3U82MCJ2ipnw8Ds/A==
X-Received: by 2002:a05:6402:3511:b0:5ed:1400:f879 with SMTP id 4fb4d7f45d1cf-5ed14011fb0mr1400324a12.32.1742889769962;
        Tue, 25 Mar 2025 01:02:49 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccfb004fsm7446785a12.40.2025.03.25.01.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 01:02:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 25 Mar 2025 08:02:24 +0000
Subject: [PATCH v5 1/6] dt-bindings: gpio: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-max77759-mfd-v5-1-69bd6f07a77b@linaro.org>
References: <20250325-max77759-mfd-v5-0-69bd6f07a77b@linaro.org>
In-Reply-To: <20250325-max77759-mfd-v5-0-69bd6f07a77b@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2

The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
Port Controller (TCPC), NVMEM, and a GPIO expander.

This describes its GPIO module.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v2:
* drop 'interrupts' property and sort properties alphabetically
---
 .../bindings/gpio/maxim,max77759-gpio.yaml         | 44 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml b/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..55734190d5ebdbc351e1f91675dddd8a9db80cd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/maxim,max77759-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77759 GPIO
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This module is part of the MAX77759 PMIC. For additional information, see
+  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
+
+  The MAX77759 is a PMIC integrating, amongst others, a GPIO controller
+  including interrupt support for 2 GPIO lines.
+
+properties:
+  compatible:
+    const: maxim,max77759-gpio
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 2
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupt-controller: true
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-controller
+  - "#interrupt-cells"
+  - interrupt-controller
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index cc6536141bb3a06fa6bc411ac69053b8be17e0b0..0abd85ff6fdee93424ee3634c56fbcbcea1a7855 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14568,6 +14568,12 @@ F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
 F:	drivers/mfd/max77714.c
 F:	include/linux/mfd/max77714.h
 
+MAXIM MAX77759 PMIC MFD DRIVER
+M:	André Draszik <andre.draszik@linaro.org>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
+
 MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
 M:	Javier Martinez Canillas <javier@dowhile0.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.49.0.395.g12beb8f557-goog


