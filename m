Return-Path: <linux-gpio+bounces-38391-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IJx9CXGMLGrSSQQAu9opvQ
	(envelope-from <linux-gpio+bounces-38391-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:47:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D012367CE13
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:47:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hxnDBCdz;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38391-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38391-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3EA1301957A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 22:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497D73D6496;
	Fri, 12 Jun 2026 22:47:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928AF3D6474
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 22:47:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304426; cv=none; b=EDQBxgXBQe8RgAbm3pDrHw6LxjDPfLQWtHslRJH0OZlyXDSYVvbKavshthPSZkhBezaAeGi7E3nzrJyZFy+JNRE1g5PDCMC4YsNuLMIgAeIdtMjqAHFU+5U6CWd9SeEQyhc2l3bwD0b7xB7rhKRFUL8FkcX7aoKRq4SEZDBZHJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304426; c=relaxed/simple;
	bh=wPe+MCGV7y8p2VWX5tNsJUlFInLquvWFNJQafrXkt8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FkDV5NNdOHJ5Hh3BzZkXoEug+byqEmatYE2YZwf/L716HcUi99c7sjbgH1AfLB/xoIAKWBPB/f3E19BJMJXDIZ04CO8RLrd/WnvAqlWjaAEXgxOEy/8JvI8HWNlqNDM/qEQmpALtzy5PonlgDBi5vsPwF3nAeRVYXKk24DEdPdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxnDBCdz; arc=none smtp.client-ip=209.85.221.178
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59dc1714d44so519416e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 15:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781304422; x=1781909222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1aVnlrURhUdP5DcLJVh35bGmgGAkbGlAndwroGP4wM=;
        b=hxnDBCdzIZv4YMA1Wgah5WeTrWWD2KHv5VQovlcfT7AwAGetZFFOrxz2JwTKr9cw4i
         xYSvQkN+C8sPmsYpDcfdix+piaxHqMtyOvLHbueVCsFLaXpvb9ZyFvofwig4xguk/KFz
         Y0JulkGIu5k8yu/lhtdeoSBfYIHjE6zdeVUl7lth8dWKcJDcy3+mCXvGqUR2aCkZzFxV
         +MdU844pUQr/vU8qYa4735KcFAmYERoyFhYjco0zHToOm1gF7DMYBeb6R3GRQdfrKGrQ
         XtD6VWTfOp8XWpw4Xm7Y4BqOEoCd4+4I2JciZkM20p8ZLa3GzmWOw8MhHpQctkLS5cit
         GNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781304422; x=1781909222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g1aVnlrURhUdP5DcLJVh35bGmgGAkbGlAndwroGP4wM=;
        b=K7EunTp12Lb/8vaKBSV8VFk7mLEA9JIemfnWaaPKP+V5sObEGv1jopHCGeIrwXV1EH
         Hj6vUKR4WeOXlVBB/mqRX0NmV+f/Rw7owx6AaHMR/0nHSM2YyE3OIYdeEZOddvhSuNfZ
         eUFcmGXWlkzev+HepnFucBq6mlvVhnvfjNPX0WPo13RFmyxeepLNHAsL8dC/5iKiwDGx
         nsklJnQmPDgOYti5ryfI19oTFEXgpqwST7J+pnAIuLuxvejdm+VCy6WHPaiDdy6BrvG6
         xSgANg/xKr2F1GljkuIWS02Ef5eICpDcD0LFvXoZLcZpy0+R0647ds6lOKHbQgWHZmD5
         D28A==
X-Forwarded-Encrypted: i=1; AFNElJ9Al6ZI8gKV57uFA3pE/1Qj9stohY05e9bKsFfyKF9/Q/fW5kyfgZ66CNNCdS5+IC4pXIdG1hhk94Ol@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+kmoQTo1GVSPhTeXoBTpzb5ExVo1ThHcvLxZrVK7wV1PbDB+0
	tow0Zr+0jiea6/ZhQoQQCPckbGpbUfHKuZJdUFIEgdKXEvv+RXleNyynLu779Q==
X-Gm-Gg: Acq92OHb5rCFFdTApurRvPFg+XPChzEdcKIaPhYe+IbG/2FsxcNQpJG4V20dZ0UZz+s
	ZRygFMMK7cVd5UPhrv5MofPnYljplAcs/WgDMcLLA/w89u/RQGbLzI+vf591Jwzxksz8R6qBewN
	b6gS0fBLX0jl5qec+mkm94sdV+NMmAqAgh2EiXzFCFSeSXluD2sLghb6+xLq2fr/JGzpi5ejesk
	tUUcIlW+zmj9OlsKcjEX3C5g+VE19kJ6P2oD0/BA76Ecku9j4pXV6DFZCaUoZLRpUcQ8ClambT0
	jc+PFitaI0V7fiR0wGqpZ/HyRXVTPbVv4f0xBUpIJD3YTSiHSAzBaPrYJQgs2UqRj2pemjrVMfL
	ijvYKTeXXQM9sqjBhYlszTMHvGczpn4Z1EsM6p9Ecnsn18WwsoNyXTzWL/wGpOpy5hmhwAwMxt3
	OeLUWMli5AI8DGDbLOlqzHjQ==
X-Received: by 2002:a05:6122:828e:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5bb6c0352d7mr3035023e0c.7.1781304422519;
        Fri, 12 Jun 2026 15:47:02 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb691fd8adsm4244553e0c.13.2026.06.12.15.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 15:47:02 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 12 Jun 2026 17:46:19 -0500
Subject: [PATCH 1/5] dt-bindings: iio: adc: Add TI ADS126x ADC family
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-ads126x-v1-1-894c788d03ed@gmail.com>
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
In-Reply-To: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10990; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=wPe+MCGV7y8p2VWX5tNsJUlFInLquvWFNJQafrXkt8k=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFk6PUnTRJR7nf5drStyczgZVCfYKLl+gtOnH7YvhOSTs
 67W35raUcrCIMbFICumyNKesOjbo6i8t34HQu/DzGFlAhnCwMUpABNZ0s/wT3F91lqm2v0qbpeX
 VEi+jvm5/NKn3Ml8TysePRDzDJqrnczwP+qDGE9UT9fO21ejZ7oUayxmv32UUdlvS863Vtm3Mzm
 VGAE=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38391-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:kuurtb@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,dimonoff.com:email,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D012367CE13

Add TI ADS1262 and TI ADS1263 ADC2 devicetree bindings documentation.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../devicetree/bindings/iio/adc/ti,ads1262.yaml    | 308 +++++++++++++++++++++
 .../bindings/iio/adc/ti,ads1263-adc2.yaml          |  49 ++++
 MAINTAINERS                                        |   7 +
 3 files changed, 364 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
new file mode 100644
index 000000000000..1c4fde94f6c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
@@ -0,0 +1,308 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/ti,ads1262.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI ADS1262/ADS1263 analog to digital converter
+
+maintainers:
+  - Kurt Borja <kuurtb@gmail.com>
+
+description: |
+  The ADS1262 and ADS1263 are 38.4-kSPS, delta-sigma (ΔΣ) ADCs with an
+  integrated PGA, reference, and internal fault monitors. The ADS1263 integrates
+  an auxiliary, 24-bit, ΔΣ ADC intended for background measurements.
+
+  Datasheets:
+    - ADS126x: https://www.ti.com/lit/ds/symlink/ads1262.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,ads1262
+      - ti,ads1263
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  spi-max-frequency:
+    maximum: 8000000
+
+  spi-cpha: true
+
+  interrupts:
+    description: Data ready (DRDY) interrupt line.
+    maxItems: 1
+
+  start-gpios:
+    description: Start conversion control.
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  dvdd-supply:
+    description: Digital power supply.
+
+  avdd-supply:
+    description: Analog power supply.
+
+  vref-supply:
+    description: Optional external voltage reference.
+
+  ti,pos-refmux:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Selects the positive voltage reference input:
+      0: Internal 2.5 V reference
+      1: AIN0 pin
+      2: AIN2 pin
+      3: AIN4 pin
+      4: AVDD pin
+    minimum: 0
+    maximum: 4
+    default: 0
+
+  ti,neg-refmux:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Selects the negative voltage reference input:
+      0: Internal 2.5 V reference
+      1: AIN1 pin
+      2: AIN3 pin
+      3: AIN5 pin
+      4: AVSS pin
+    minimum: 0
+    maximum: 4
+    default: 0
+
+  ti,vbias:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Enables the level-shift voltage on the AINCOM pin.
+    default: false
+
+  ti,idac1-pin:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Selects the analog input pin to connect IDAC1:
+      0: AIN0
+      1: AIN1
+      2: AIN2
+      3: AIN3
+      4: AIN4
+      5: AIN5
+      6: AIN6
+      7: AIN7
+      8: AIN8
+      9: AIN9
+      10: AINCOM
+      11: No Connection
+    minimum: 0
+    maximum: 11
+    default: 11
+
+  ti,idac1-microamp:
+    description: Selects the current values of IDAC1.
+    enum: [0, 50, 100, 250, 500, 750, 1000, 1500, 2000, 2500, 3000]
+    default: 0
+
+  ti,idac2-pin:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Selects the analog input pin to connect IDAC2:
+      0: AIN0
+      1: AIN1
+      2: AIN2
+      3: AIN3
+      4: AIN4
+      5: AIN5
+      6: AIN6
+      7: AIN7
+      8: AIN8
+      9: AIN9
+      10: AINCOM
+      11: No Connection
+    minimum: 0
+    maximum: 11
+    default: 11
+
+  ti,idac2-microamp:
+    description: Selects the current values of IDAC2.
+    enum: [0, 50, 100, 250, 500, 750, 1000, 1500, 2000, 2500, 3000]
+    default: 0
+
+  clocks:
+    maxItems: 1
+
+  '#io-channel-cells':
+    const: 1
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+  adc:
+    $ref: /schemas/iio/adc/ti,ads1263-adc2.yaml#
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - dvdd-supply
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+patternProperties:
+  "^channel@[0-9]+$":
+    $ref: /schemas/iio/adc/adc.yaml#
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      diff-channels:
+        description: |
+          Selects the analog input configuration for this channel. The first
+          value is the positive input and the second is the negative input.
+          The following values are available:
+          0: AIN0 pin
+          1: AIN1 pin
+          2: AIN2 pin
+          3: AIN3 pin
+          4: AIN4 pin
+          5: AIN5 pin
+          6: AIN6 pin
+          7: AIN7 pin
+          8: AIN8 pin
+          9: AIN9 pin
+          10: AINCOM pin
+          11: Temperature sensor monitor
+          12: Analog power supply monitor
+          13: Digital power supply monitor
+          14: TDAC test signal
+          15: Float (open connection)
+        items:
+          minimum: 0
+          maximum: 15
+
+      ti,chop-mode:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          When enabled, the ADC performs two internal conversions to cancel the
+          input offset voltage. The first conversion is taken with normal input
+          polarity. The ADC reverses the internal input polarity for the second
+          conversion. The difference of the two conversions is computed to yield
+          the final corrected result with the offset voltage removed.
+        default: false
+
+      ti,idac-rotation-mode:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          The rotation mode automatically swaps the IDAC1 and IDAC2 connections
+          of alternate conversions. The ADC averages the alternate conversions
+          to eliminate IDAC mismatch.
+        default: false
+
+      ti,pga-bypass:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: Bypass the Programmable Gain Amplifier (PGA).
+        default: false
+
+      ti,rev-vref-pol:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          The reference polarity can be negative, but the ADC requires a
+          positive voltage reference. In this case, the reference
+          polarity-reversal switch changes the reference polarity from negative
+          to positive.
+        default: false
+
+      ti,sbias-connection:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Selects the sensor bias current source connection:
+          0: Sensor bias connected to ADC1 mux out
+          1: Sensor bias connected to ADC2 mux out
+        minimum: 0
+        maximum: 1
+        default: 0
+
+      ti,sbias-polarity:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Selects the sensor bias current source polarity:
+          0: Sensor bias pull-up
+          1: Sensor bias pull-down
+        minimum: 0
+        maximum: 1
+        default: 0
+
+      ti,sbias-magnitude:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Selects the sensor bias magnitude:
+          0: No sensor bias current or resistor
+          1: 0.5-uA sensor bias current
+          2: 2-uA sensor bias current
+          3: 10-uA sensor bias current
+          4: 50-uA sensor bias current
+          5: 200-uA sensor bias current
+          6: 10-Mohm resistor
+        minimum: 0
+        maximum: 6
+        default: 0
+
+    required:
+      - reg
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@0 {
+            compatible = "ti,ads1263";
+            reg = <0>;
+            spi-max-frequency = <8000000>;
+            spi-cpha;
+            avdd-supply = <&avdd>;
+            dvdd-supply = <&dvdd>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            reset-gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
+
+            /* AINP: 0 - AINN: AINCOM */
+            channel@0 {
+                reg = <0>;
+                diff-channels = <0x0 0xA>;
+            };
+
+            /* Temperature sensor monitor */
+            channel@1 {
+                reg = <1>;
+                diff-channels = <0xB 0xB>;
+            };
+
+            adc {
+                compatible = "ti,ads1263-adc2";
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1263-adc2.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1263-adc2.yaml
new file mode 100644
index 000000000000..9dd5577589b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1263-adc2.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/ti,ads1263-adc2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI ADS1263 ADC2 analog-to-digital converter
+
+maintainers:
+  - Kurt Borja <kuurtb@gmail.com>
+
+description:
+  The ADS1263 includes an auxiliary, 24-bit, delta-sigma ADC (ADC2). ADC2
+  operation is independent of ADC1, with independent selections of input
+  channel, reference voltage, sample rate, and channel gain.
+
+properties:
+  compatible:
+    enum:
+      - ti,ads1263-adc2
+  vref-supply:
+    description: Optional external voltage reference.
+
+  ti,refmux:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Selects the positive voltage reference input:
+      0: Internal 2.5 V reference
+      1: AIN0-AIN1 pins
+      2: AIN2-AIN3 pins
+      3: AIN4-AIN5 pins
+      4: AVDD-AVSS pins
+    minimum: 0
+    maximum: 4
+    default: 0
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#io-channel-cells':
+    const: 1
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index 396d4e76dccc..9379699d99c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26668,6 +26668,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/ti,ads1018.yaml
 F:	drivers/iio/adc/ti-ads1018.c
 
+TI ADS1262 ADC DRIVER
+M:	Kurt Borja <kuurtb@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
+F:	Documentation/devicetree/bindings/iio/adc/ti,ads1263-adc2.yaml
+
 TI ADS7924 ADC DRIVER
 M:	Hugo Villeneuve <hvilleneuve@dimonoff.com>
 L:	linux-iio@vger.kernel.org

-- 
2.54.0


