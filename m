Return-Path: <linux-gpio+bounces-17943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7D4A6EB7E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5FD71699A7
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 08:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C10253B79;
	Tue, 25 Mar 2025 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G6scjL9D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721D919F42F
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 08:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891231; cv=none; b=l7FKhPXzNcG5ep9HyAECE0DSmWDdzMoPi+1PJhu/zLMTeUuc0VpfOA9KiwseU9uvt2Jl6nZNjKHz9PiRyjy5W9GR4w8Xbg5UYd/97nnxZWhHe3NA0PsbcGHU44AWjZ02yAllIqpUW6vmJWsHKHSVqIMWv0bv+EVr++d8WlXXS2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891231; c=relaxed/simple;
	bh=08g+dfR3FV6Y6Q1D84qQqREWDz+FcRKr/yg3IyPY/+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SYexP8LDtzpFLI6PhE1gWNTo7m+kEIsFtoI4cHhXjNp/YyRQtvJnhO+WR/QLobU9N0ZJ116PrUmbefbZqO8QEFTrFj3tdAmTEdtb2GL7Q6gsL+zQjenQAobUwI0rU6e3f6QXSG5kml5Pjm7ghiHoM68uRGQO+Y7VDTKMr2PLLzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G6scjL9D; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso9513755a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742891227; x=1743496027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6SEwl1TCy2+vIo8t3ZzKiS9UVWKw2bXaNUc9+NWEYzs=;
        b=G6scjL9DNmE9GB1Dz/XAmVfBhitUGsomcwc2XIJd9YMuEd8E+9bLZkYFrzqucrBjXC
         hcdMQckwsLHw0ioxKx8yBbrElCVMD3o1aTb4UTYXkCBYuvWJp49lefycQQW3eCk4V2Bp
         m6J44fn3topVeBztYrJl0invvyvSOZtzJgVJeCCerJR3M/0OhrzI6RLBbC+FEoozB8nA
         v0ZwDMMOnGt2K9qmHhyEO3/YlITiDsmlGgGCAZ15epUaGyIlzFglozWrKJTlHlYt8leg
         tHHa/kh2JJ2VvtsWsntOj4vvFhmvWzSq0XhFgsxK9K6jlAYE6/5fX2VVWA484TwSQEF6
         fmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742891227; x=1743496027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SEwl1TCy2+vIo8t3ZzKiS9UVWKw2bXaNUc9+NWEYzs=;
        b=B8uhrLRO63gs86q0GN3k9vwXSI3c1hb8sMWHvVR2BkZHeHpen6+19DDeCSDsUtUDS8
         898Wqen17qpk65Qz4BA4cKtoNh8Mc/m/aWxc8Zdj1R+qebiga9oSzHuqX2owqykNmbzl
         HvOQyV1ONITbMrIhrDs7OfmMGhkR/3Kb6RewS62/496p3czGjvX6PWz2RFth5TViSHF1
         A1ai01q+iIKO2xvdrM003hsT2YpSMeBi4/GXpUK3GysksAXFlNWpF7nHpM2s0BWao8vs
         F9SQV/xCI19ZJAUhHaVLQIPBZfqwxFFdHoHXFhA5YdUbp+xvsCu27UGqcUcXx+UJ3jfs
         enKg==
X-Forwarded-Encrypted: i=1; AJvYcCWZVxbdI+PZCK4FHMBNKKrYrpHinl6BFerh2iS27W5zxYnkgm6e1q0e8CTJMoudmGcU7I4Rs37UwX/x@vger.kernel.org
X-Gm-Message-State: AOJu0Yyah3rvX1hEQNXI+yq+NpEmq9DC3EllS1HMokSsCJQl25dRay/k
	O7WiSQrCWIQ0oIdfBIPPqR77kOgcJIYCGSce8Br51mXH8ToPoOd7+IglpFx4k/Q=
X-Gm-Gg: ASbGncvbZvQfVQ6bULwOdteo1C4IFQz3NlppkpfEPt2wIPJ+pW8D7SIasIN8/wNpkL8
	GT/jF87NOmS4QuRNvnWsH0viICDiwt7n82z7GoBH7l9eNQb2tTRrYwe6Kn50Lh4MKZ4laD7Dk/L
	0K7Gbcy0yZJK0VO7SbAJf44xAnM0qdMNx4f+UblyLVTS9B/N9F8Zz8g66rtJ2vXuM4JQfYNuTrB
	auu8YQTGYYzA23lrmsV525TPNx3ZMgQK/Rp2OsXKhKwJtS8xKrMXn9KJElT3sT/aB4Zv5MhFL0L
	/Ohc1Dam23poVn+mJbVnxgaj/D+h3EbbAKq8KAs8dPsujXS+qSRdcU7y+r8Vo1XYLx60ZUyz+Bk
	EaHnzxKLsVN/PBO5QMRqH3sm03HPC
X-Google-Smtp-Source: AGHT+IFGom1pvP26uA9aKjTrkI6D6p34D8OfrDEsjpJgJY0txiyido0Z3dDxMIp3H950t0uf76P28A==
X-Received: by 2002:a05:6402:2816:b0:5e5:49af:411d with SMTP id 4fb4d7f45d1cf-5ebcd476285mr15315373a12.17.1742891226502;
        Tue, 25 Mar 2025 01:27:06 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcce36d66sm7377366a12.0.2025.03.25.01.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 01:27:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 25 Mar 2025 08:27:02 +0000
Subject: [PATCH v6 1/6] dt-bindings: gpio: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-max77759-mfd-v6-1-c0870ca662ba@linaro.org>
References: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
In-Reply-To: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
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


