Return-Path: <linux-gpio+bounces-17481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27363A5D95A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 10:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59239176A84
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 09:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186DD23A9A8;
	Wed, 12 Mar 2025 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K8T6sTC4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2B323AE7C
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771578; cv=none; b=jFyDEhMJHebap3DJx7FnsTF7yvrWlQbJp3DxOU4bLPIyPD82WbJodLRZC9+4YbGduzSOAcwPJ3hkXwWbMONPAAK+TBlYwLt+3GnRW+T2Uf7k1lskyofdqFtDz5rhYZcqBWSmNPeqjWvybWskZXGrxTIZEpMQronDIEASy7FLCwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771578; c=relaxed/simple;
	bh=S9d+mPQHuwKwxhdfiMhyaYrX7SNT9BfoJz01stp/fyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXwZX/eVToqIL1GjdZfO/bLUPqxZ7uQpHw/Ys4klmsX0I1VnmVE1hgplqIld5Zmk66aJHXzpwmMCemTspv7HumJwK4qEZCce3EUIdniagkYq7ID6QsBAx8a6+gmnPcS6PrzEOwkPFsiQyEHvF9enBliV6fJWWB9MsISmy9WqLD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K8T6sTC4; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso586725466b.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 02:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741771574; x=1742376374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+371/vnLjhYbcobffzm7IbhNXrIuGqbRnBddVdteQIg=;
        b=K8T6sTC47WgDeHJh/eSrYP4hMkFEk08RGo6vQJv5QYZW0eQG12CYacL1ozFARn94uX
         YXtra6DJGFhrY7UOYVguPxQXSl9YR5oCDU2RDDOFym0Y4Fn0TT9V/B+y/QnFvSKaDk2G
         It/9x7YXJCDTg3LTfWb8l1jwz83aguzpM87civCWEbhDuHHpu/tFBF+YiO6dvB+AQUep
         ql937WLDqyJEjR4q3UExg4ld0uAHiWWXXqEFCCneYFzvI5JL4Bi3He19lEi0NOE89bLp
         TGOTJZ9ybNuLS/nuzK9XhyXWcs19lVQUs1xEOcPmDYiCyYAyQOQoho4ReKNalGGahybg
         K+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741771574; x=1742376374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+371/vnLjhYbcobffzm7IbhNXrIuGqbRnBddVdteQIg=;
        b=IBNAowP3nyXt9kg35Gq4IVTJ4tXnKObQg0xZNqstncd1TYZKhcUQWOulUMGzNpBaiQ
         ys12t3eESK8R46AuJwA+bh1mawl280HHfkF/6X7y0cONAMFJ95OZhOJBhEUiDbtl8uEN
         CvGky4mdul9SNlymnbPwmtbac9PEud05UvhZsPpQ2BaJgc7OLpyQTicwTaoQQcBs35/v
         7iIJt+eO7/qaSNal3/wXi1VhqzcB2qvJXMqE3k3y463QolJ4yQS2+zobMCR1/hU8lAuo
         BWwvg1vAUrddRfHzBItIC37Is4wYkf/qi2gua5zzA1gt8TRmdtZ1r0/10PbHCCkoTfsI
         GALQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5NzxZ7xxAAqRLQt99atrXuSx2Eme7nBmk7LAL4Jkv83+9eunsoXFL+khPmwbQIymXyW6Q+LHcawfK@vger.kernel.org
X-Gm-Message-State: AOJu0YwLrleGTPrCWlN+4P7xnYqYsZOkbuMUzCdQFou0s0ux3NDsHgBC
	suBoy8B1ZqwdZzIsHnqvxpiZ2ISODpR0I8HUC3e20FkKzH1W6hJi3Tt+PfJvKnM=
X-Gm-Gg: ASbGncvz0F1BrIU5fr5+Sm+G1X08GxnkJWrgy/xokZPWzeNGjBEgkguJX1JzARTX3Bn
	7Gt7MznMwdiqDDQu1185zhrXWhRYBlviViyHFTAHWfOqihC43xV6xcbLTcw7ruwLp9BY7VZH1R0
	ieiIZj8vO/DddN4qYkl/ISwipZozFoFwjZXLjP1Ycoj8opJrz/5x4iTJrpRoK5q+2jH0Th0T5A9
	6kY0Qd4deXk27GwLb484RVMu514PXMy8m6IzRngHoIFPQIgvAlLp21vm36FTEruhPf6pld9KB5X
	YBgs/6jgOsNXWjNHbbmuwYoTeeTRuP+nOhDs6e59BjZrL6yo6YNt9Q9zWBlCfr62B4naR2Ts0yF
	1iHRTd2BfssMrFlZDNnFeJA6vRhX2
X-Google-Smtp-Source: AGHT+IE+gCLjQjQFoNvdTx7oZ/6z6vZSth34m9edgTqbZhf2/GIvkkBSr49cL/l1l5qBZrRdFw9wig==
X-Received: by 2002:a17:907:9490:b0:ab7:c893:fc80 with SMTP id a640c23a62f3a-ac252b573bbmr2705420266b.24.1741771574042;
        Wed, 12 Mar 2025 02:26:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac25777c748sm894535266b.2.2025.03.12.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 02:26:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 12 Mar 2025 09:25:59 +0000
Subject: [PATCH v4 1/6] dt-bindings: gpio: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250312-max77759-mfd-v4-1-b908d606c8cb@linaro.org>
References: <20250312-max77759-mfd-v4-0-b908d606c8cb@linaro.org>
In-Reply-To: <20250312-max77759-mfd-v4-0-b908d606c8cb@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
Port Controller (TCPC), NVMEM, and a GPIO expander.

This describes its GPIO module.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
index 86fa62154d3b23bf84ce2d53cbbdc33f3d43006e..a45d1bd64d116d14bc05a64fa3da852a41e1de7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14347,6 +14347,12 @@ F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
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
2.49.0.rc0.332.g42c0ae87b1-goog


