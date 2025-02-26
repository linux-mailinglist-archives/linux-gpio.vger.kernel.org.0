Return-Path: <linux-gpio+bounces-16647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6C5A46874
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 18:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25AF617143D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 17:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C18922A1E9;
	Wed, 26 Feb 2025 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="km5KCfub"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33EB22A1F1
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592288; cv=none; b=ln5PEbQQsar7M9vpDqi7bGX9hGY2CnfFAuMyf2Y5HN0MyrIuqBJR7EgOoGwIpydwfkQ+L8FLH96Ard9+KdPRCh7HR3qrgTkPYne4JBCbXy7FTrN1UwXtdQ2tNu9B2JmNUa/DOH6RSLRk4l8BHZ5nkpxZidKqcVPfdiEq26Ha1EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592288; c=relaxed/simple;
	bh=I4feaQK2NeL1iMZsywRHTjEz/SueHsximMXGo9uKgLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NwrwQSCp+numfb5Eq8TpvS0Y98D1offVr1s+Gww2flZyW8GvyPMjawX3W8V9adxmAUOpyaZptCOSMAL1VVrAbvRFl3g6ZHr2wCVi5Dunw6UdaBXWDEGh8vAAbtN9UGqGVaXeqyjkdopI9dUUUhAwyX1K4sd59lKUyACTtgyEoeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=km5KCfub; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so12527036a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 09:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740592285; x=1741197085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9YomS+c0wThxhIl04CUTErMlrQA8JmWzVl1nv3uerI=;
        b=km5KCfuboEwYf3Lk8LTH7jJmnQvgCD+Dc8ClSyE8K3EK2mwV9/emetFM6v+S7X7Hlu
         4uK9rloDtfjz47LEtO9xjUAS9Oj89VIw4I3Py/QU+qc6r8zA39pTHTvSvq/V8+bgBiZY
         hj5VZSTd0RnEm9E3xpJx32rUEzk3Nrf3/Ze6LTAnx0OR0x4paJ5o9GLhCYhwOG/+Bxmb
         05DHgc8rvMxqaTa+VuQyBDwUiVbBEPcYOTO1Zf1pVtoq1c/JHNW0hyVMxDy1vTRWohTf
         6h9LXVt1sg0IlQogJ2yHxaPYzhO/n6JStcDD2mwliNsVUV9qGJB9iGWYaemL3Fh8pwc3
         egIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592285; x=1741197085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9YomS+c0wThxhIl04CUTErMlrQA8JmWzVl1nv3uerI=;
        b=FfqZaiLPVFJKkqFBGdxhbyibuo7JN7wgQKqSEq12FV6AjKNDVG+HPGNDldm8VhjJXB
         pBYg3J19REBVomE8mv2Jdjp0WVrwkpr9joC7icWvFN4zQeKX6isgjtpQj9DpLSloshsi
         IvFpSLTwwmhTtUGgGozcB1jRWlWrz0gCyEoGHQ/Afr0AARbq5Eja7Pr33YPQKKeDm6Jx
         bgbfB1u7LYGwUI7vUgjawWnf0D+H0SxCxJ7w+7IPqmfzRNGbSjvZxBQ+NGeaJafWUeIC
         1HA3nz+qyp7aj+QMlafQxFWj1v9YD4AiSYk77ZGgd1H21Fg/XZb1PdKobfGZ0WF73tzY
         jQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMhy4iEPusWUfiH8HQT450p2euDZ+JB1mhe9AYh43zUrE/XLvwvlW7Bo9dlVC4Jf/mtym/m46Kjg1N@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj3+bTQf3X5G102IsGX/HHjqtoQcXxXMHhhlk8kLy2K4vCrIvM
	BHKyOISqW9mF9cYTMVhxXZwQ+q5apOai7ej33f6nHtkGS66O5ZkcFa8T/Er27ZU=
X-Gm-Gg: ASbGnctWX25X+BQrQ+X3NCc7IzXPsHchp1cwrwppZuqwA2nTvdRGvn7KbYCQT3XQIbl
	UYiTK1+G28FyEX0/mBFVaQAwQo7L9iunlsI/5Hr7mdwDl4fiRw4COOXHpU582nM7Om+y70r3uGn
	GscJ6jAxmfAP1aMqAjZLIfctv80u2iYebGg6OoWefYjIdpH2JJnyuI/QBo8jy6ejxv1dC60vqM6
	klHlEk8HCeKhsbJlaf50Vp30vFuOf8c+Xc6r3+0u+Wsj8rSHXn6gTl1T6w/kt/yH+t5WTa2Fk3V
	5pcnidqLHBQPRbNlXQ84biqeYYiNc/JwbXDSo2oT2eXoYCUfCPwP2aK21Yb3o7qiniAgy56YuOk
	n4rMEZAh7kQ==
X-Google-Smtp-Source: AGHT+IF7S3Byg/2EA8G/VaFXwC0WijN7Hyq+Y45Wz3xtOjrJyqaLL3aB8h/6a9ePi5nZG42xtp7hZw==
X-Received: by 2002:a17:906:6a22:b0:aba:6204:1c03 with SMTP id a640c23a62f3a-abc0df5d89fmr2632175766b.57.1740592284983;
        Wed, 26 Feb 2025 09:51:24 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdb131sm361889866b.7.2025.02.26.09.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:51:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 26 Feb 2025 17:51:21 +0000
Subject: [PATCH v2 2/6] dt-bindings: nvmem: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250226-max77759-mfd-v2-2-a65ebe2bc0a9@linaro.org>
References: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
In-Reply-To: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
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

This describes its storage module (NVMEM).

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* drop example as the MFD binding has a complete one (Rob)

Note: MAINTAINERS doesn't need updating, the binding update for the
first leaf device (gpio) adds a wildcard matching all max77759 bindings
---
 .../bindings/nvmem/maxim,max77759-nvmem.yaml       | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1e3bd4433007341a11040f513bf444866b9e38a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/maxim,max77759-nvmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77759 Non Volatile Memory
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This module is part of the MAX77759 PMIC. For additional information, see
+  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
+
+  The MAX77759 is a PMIC integrating, amongst others, Non Volatile Memory
+  (NVMEM) with 30 bytes of storage which can be used by software to store
+  information or communicate with a boot loader.
+
+properties:
+  compatible:
+    const: maxim,max77759-nvmem
+
+  wp-gpios: false
+
+required:
+  - compatible
+
+allOf:
+  - $ref: nvmem.yaml#
+
+unevaluatedProperties: false

-- 
2.48.1.658.g4767266eb4-goog


