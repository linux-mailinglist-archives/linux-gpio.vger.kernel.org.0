Return-Path: <linux-gpio+bounces-14223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819D9FC2F8
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 01:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B9091652F2
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 00:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318B517C7C;
	Wed, 25 Dec 2024 00:33:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7652817993;
	Wed, 25 Dec 2024 00:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735086805; cv=none; b=atnICr4knLm27qtcavfEmboccLxZcZyCXuuqCM6fBG44nv3DQ9eW4UW10Y00g8s12EM6es/fsLfmRNtaitMNNCp4uSJYDOEP5Nof8oh0vU6Jizc6wraxuk9zZUCic3s8TZpVJaqEKC7gtNLGzePQyRc+q+d2zYEAwLc651W3RzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735086805; c=relaxed/simple;
	bh=azsMLWSU24kZOm/Gqa8SMlagV4Qub9G9lNilVBghqyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJvWsUaq426K4/Dzwhuh2CxAV7SQeECOViy494r5i+m8xqmruAkCkjX8bzXibdxTlX/Y5+AVDw+9A/M1JJO+Vx0p9bifO0S2OULBRI6IgSRj+eVcmijTwtFTnIkjT3y/66zfqC3tHzpxSFq2RGfJQHjr7rtksoYVrhAZ6s8QNts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 25 Dec 2024 08:32:39 +0800
Subject: [PATCH v3 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-03-k1-gpio-v3-1-27bb7b441d62@gentoo.org>
References: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org>
In-Reply-To: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2568; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=azsMLWSU24kZOm/Gqa8SMlagV4Qub9G9lNilVBghqyI=;
 b=kA0DAAoBMarqR1lNu+0ByyZiAGdrUr2g757rWEynp1Ky5mHaV0bRmznm0pWMiqscTAKftYugU
 4kCkwQAAQoAfRYhBLW6uMnDG3EVZwIj3DGq6kdZTbvtBQJna1K9XxSAAAAAAC4AKGlzc3Vlci1m
 cHJAbm90YXRpb25zLm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRCNUJBQjhDOUMzMUI3MTE1Njc
 wMjIzREMzMUFBRUE0NzU5NERCQkVEAAoJEDGq6kdZTbvtNIEQAIyE4LzGcZuN0fqPdFWbFaWiiW
 5cQqKqT8Ul/wyIWPsH+U0LE36bSf5UVs185RzlRuRoGsnkSo0+QWvisclaHZ0ZTAEEATO3ZNs+F
 tH+4CYVgpoG4d5YEwI9f9M7CVUVOW4HquNMy5nagruWd5RNUcUoDQvBd8h8lGdW/Heyl5JhknNW
 0dNfb8Cao9rts99vpB8h2tQ69n0gtoZnHIOGf0uKfchi06siz6NYoQPor9mvhrxzlgwNJBlU1Rf
 wOxWkmXkxi28LeFCVn4Ja1x1dBWvW/tr6Pm/TUNT0nEaTu4BCp2L7Ae9kSqPPhIbvx9Kwdpm0em
 IWiRl1AI/yFxLHNcFbXLnnGAsKrTgEuCF08TEVKQUdtvz2V1Kt7ZLb35TYpd9Hb2mGJYKCoTznx
 WO4A6r6tOHdG+E0kGbvSjnVOtRRPNKt6ubGpJ82jf+rHlH9G6JRKvxRA1bh/Ctr95BPp61hmg4p
 wOOWDJp3wVtsAlUv/yB9wfwLynbJcC86a9ziYD8omvTeGuAqZmiS1ir66P4Jqoym24bPZLYux9s
 Yasl9Q9rljSzNsny8IXLvKL9UKbqS2+c6ImjU8ORIgofhY5qI5H2JJynrclWLDIny844SJfnTjL
 0jygnGyE7zXab6lmLXcYm8fgO47upExnZPV8kmUQAdwFDOhX+7MMVJ61OL
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The GPIO controller of K1 support basic functions as input/output,
all pins can be used as interrupt which route to one IRQ line,
trigger type can be select between rising edge, failing edge, or both.
There are four GPIO banks, each consisting of 32 pins.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6ce8f27bd4a5a85f730420e103ea51710200d301
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 GPIO controller
+
+maintainers:
+  - Yixun Lan <dlan@gentoo.org>
+
+description:
+  The controller's registers are organized as sets of eight 32-bit
+  registers with each set controlling a bank of up to 32 pins.  A single
+  interrupt is shared for all of the banks handled by the controller.
+
+properties:
+  compatible:
+    const: spacemit,k1-gpio
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  gpio-ranges: true
+
+  interrupts:
+    maxItems: 1
+    description:
+      The interrupt shared by all GPIO lines for this controller.
+
+  "#interrupt-cells":
+    const: 2
+    description:
+      The first cell is the GPIO number, the second should specify interrupt
+      flag. The controller does not support level interrupts, flags of
+      IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
+      Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
+
+  interrupt-controller: true
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@d4019000 {
+        compatible = "spacemit,k1-gpio";
+        reg = <0xd4019000 0x800>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupts = <58>;
+        interrupt-parent = <&plic>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&pinctrl 0 0 128>;
+    };

-- 
2.47.1


