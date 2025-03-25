Return-Path: <linux-gpio+bounces-17945-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C03A6EB84
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B544168EDA
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 08:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA04254855;
	Tue, 25 Mar 2025 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="audrdITL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC25B1A2393
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 08:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891232; cv=none; b=YAn8Co8UYCky5BJOPApwAqcBfztsw7JMF/p1Ktnd1UtboOOls+YP9Wt8qRh3pNn9JnhPx5gFki2+MfddL9ZT2Nof20RFfpskgX3rLfXcHIA6s1tLabx/9dtrnjyznMhMZfzcTdnX+MkbN7MN6k3hO1eQ/jCQ/4d0wKHmMu/4GjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891232; c=relaxed/simple;
	bh=SPqlnkjtrS5DVFkshdhSurAaxj8Nd6Gmu/f6A5AIxGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oQ/yejc+81QHOGJVajr7Ueyp323Y7qZ28YYiNRuH49ejFGiT1EooIN6cSXg9G430G3bbECFu4j/+AK8A8nvvmSWcxZyW2wJOA4u9ivVuajgnlwZFQbD2dUNDmFb2Jcu6y6wifdHKHWGjl8dqAyihCLpDbGMttNvMrmV/EEcwWhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=audrdITL; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so8520303a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742891227; x=1743496027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6hGtk8l3NJ5m0ZZ1f8dhJbnrFpOfREyFqNdfBX5qs4=;
        b=audrdITL+3JD0qjIVIRgUWyS8b6jX7sm9yXG/1MFXs3U2QlOh9v1y9c3P9kozkKtDS
         ZnP+aZYmF02Ep4Xb+HIxg7sleFZZTQxJei205UvCICrM3DTPbfan2E2apI/cE0EPeMb5
         zKUd5jMRjhTYUTjqfqetEPUlDbfgITeFxcxc8c7Lfvo/BGzR/SbW6DhZhFCUZaEFt4sh
         GLF3aBxYusNBB5h9dsfP4RjFQwg3NedQg1SiAnbQkbw7Oy9AsV2Qb8Oz8TCWC1LjHpDo
         AaQE7wQ4G6QBG/uh7pvua1kfBH6+MY5oGNguecz6RV+tJx8f3Lr17eTNn8cxrSvBQimh
         RFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742891227; x=1743496027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6hGtk8l3NJ5m0ZZ1f8dhJbnrFpOfREyFqNdfBX5qs4=;
        b=s4asG7Gt0gDj216m/BIjy1PZDDE6cpSnwHA+g6EWESkAqdTQL9OgXLOBC2+gr0mmHE
         DxJu/uJtNM3n03oSpCSFTszAQyAp+EN8zpgaVaYNwDy4ty3TNzLLm+msKoJ5ukQca3Et
         Dpc+RjL6IjzwJ2araz57Toc4A6FHACcruXGqGB4qqoWyOJUH+UWtJjBMroTh7bkrRmr0
         fVdLVOVQMK9xljdSzX2FgfmsI2wcn4byCJzL+RC/i+zDryl5ywHHuQk2YHXnJ8XXAc7O
         qOfbIRb/khWg+4PpKkl+F06ExDFdAfG3CVFxUJ+pz4Jer6U5g9nONtsalmmNLSBmPXFo
         zHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeJoVntQD1SKYMPtlWpeyyQ2R4dgbFISgv40+dBaoUdRq59kuSJyVC8GmToMU4eljqESpkRJ9+0WQr@vger.kernel.org
X-Gm-Message-State: AOJu0YxVv4cgqRdm8b4wWnuQNKLr94NoCbaqRaJFv4lTrxxK/yyLYQgc
	aEo2B5r9LBO6sutMS9fS28acZS872Pl+5owwEcn8cfme7gtDOcUnDSzRzSn7jcc=
X-Gm-Gg: ASbGnctG+9Ajt+HgUKTsU7PuDBaeHYXKgDKN/BgG/7VkbSG0R5gb+rQJW6cC+WJ1Hhq
	g570g/FjYLgaV7UYczSCDmarRRTxE1zNFogsPjaRlgOA1nxqC0jTw5l2nyuou5ucVJydN91UbzX
	g15auMdGgPDbtxxWnsa36hek3cgAlgyJCP94QIBOtgEHuh8vyjWdJqLZN6N13XSJLdXOyvrlaa7
	2Xm05VaPu8Gjo/tqEByxkKpgpOs3tA9dQD/qmlxJtNx49GrBaJZwENjxKWrzp95zJzhlFOr550T
	IwW5hcd4Pxm/3AxfC+JvkHV4C5zgLXxy4PK+kP0fZwcyuhRO/+3NCIsSfhSNEcBMLHeFeX9vVCB
	bCAj/FZxTLGposV3jlEe2R0MxRNqe
X-Google-Smtp-Source: AGHT+IHsx90NaiqQbXCOGp0fcibvruE9A5P7xlNyFKRVB8QYQJ3nkOK83Yyo533oiwE+WjcVKloNsQ==
X-Received: by 2002:a05:6402:5243:b0:5dc:7643:4f3d with SMTP id 4fb4d7f45d1cf-5ebcd40aff7mr14451507a12.1.1742891227067;
        Tue, 25 Mar 2025 01:27:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcce36d66sm7377366a12.0.2025.03.25.01.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 01:27:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 25 Mar 2025 08:27:03 +0000
Subject: [PATCH v6 2/6] dt-bindings: nvmem: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-max77759-mfd-v6-2-c0870ca662ba@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
Port Controller (TCPC), NVMEM, and a GPIO expander.

This describes its storage module (NVMEM).

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
2.49.0.395.g12beb8f557-goog


