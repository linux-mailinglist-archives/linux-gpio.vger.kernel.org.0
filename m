Return-Path: <linux-gpio+bounces-36718-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOhPIeEzBGoqFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36718-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:18:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C8A52F78F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 252BA3042257
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5EC38889A;
	Wed, 13 May 2026 08:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E++l5Nm8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB50F388896;
	Wed, 13 May 2026 08:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660252; cv=none; b=DyPiQltMwbna3uE7mXBAgxIshhkV2yjO40OfeRma1ZeDH9yQCLxZZRR/8z0D+XUXR0tOacpuKiM8lYr97jGz0sNmq8r1bC+WEVA+0Srl/MjupYCzO5PtIPFKUX5HRA048y5ach7Uy73QOxI2pp1I9LQaefXCs+GaXmM0uHfkFGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660252; c=relaxed/simple;
	bh=TQjKByRvsX9lIZ+Og9tNG7DVpm+mvyrZqEFZnCV7BB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iw1vUSpca0U8OsFpL58xJJmW1SMMsLjNOcXkI2Ci1iEvFdHnk84Rqr+QWOyFOss1HzJpjiJp/1B1bddPwzdwvyVHJtFT/3w2KfBHnh0kv48tchKSUx+otRshPl3SetsQhvmIwFbyDKobTm/lJDTWSxpwzj7FbTRKUeKwOc6SGJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E++l5Nm8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1409C1A3598;
	Wed, 13 May 2026 08:17:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D9EDB606CE;
	Wed, 13 May 2026 08:17:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CE0E11AF8CAA;
	Wed, 13 May 2026 10:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660242; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0zinHiBM3fEpTYt8/+O7+fe/fqCVMjUqGdXgb4Vs4F4=;
	b=E++l5Nm84tHMnnHoGSHtOPjzuSO49vCd5EUe6m1+H6YefdVWFIgEGFX5NlvgT+KpBuK0YX
	1IoTQ9eWWpfTPMi5wkoVTVN1CPesbpXEXuaiLfXBoDjJpc9TDBQN9sxl8hrPbfCrGr3aFx
	3/X9mbZlac/UEQqgcX+n/SlnlExMvxxlEa81kG539O+PciB34cmM4Y/UqP7U7VmR6RP+b6
	nNZwnQ5bUTNxt8KZjlAZDLKTwX6ee5KSx9Ydtf1b0SnNmYAlIsqzK7/jovwkSkEnjh4K2A
	zeYwMozrDT9O2FmtLlwBSbC3M+A+sAFI6mQ0vA1/dqS8f4qFCGgiqMWhahuuiw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 02/17] ASoC: dt-bindings: Add support for the GPIOs driven amplifier
Date: Wed, 13 May 2026 10:16:46 +0200
Message-ID: <20260513081702.317117-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513081702.317117-1-herve.codina@bootlin.com>
References: <20260513081702.317117-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 87C8A52F78F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36718-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Action: no action

Some amplifiers based on analog switches and op-amps can be present in
the audio path and can be driven by GPIOs in order to control their gain
value, their mute and/or bypass functions.

Those components needs to be viewed as audio components in order to be
fully integrated in the audio path.

gpio-audio-amp allows to consider these GPIO driven amplifiers as
auxiliary audio devices.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/gpio-audio-amp.yaml        | 270 ++++++++++++++++++
 1 file changed, 270 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/gpio-audio-amp.yaml

diff --git a/Documentation/devicetree/bindings/sound/gpio-audio-amp.yaml b/Documentation/devicetree/bindings/sound/gpio-audio-amp.yaml
new file mode 100644
index 000000000000..3690f3d1628c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/gpio-audio-amp.yaml
@@ -0,0 +1,270 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/gpio-audio-amp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio amplifier driven by GPIOs
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  Audio GPIO amplifiers are driven by GPIO in order to control the gain value
+  of the amplifier, its mute function and/or its bypass function.
+
+  Those amplifiers are based on discrete components (analog switches, op-amps
+  and more) where some of them, mostly analog switches, are controlled by GPIOs
+  to adjust the gain value of the whole amplifier and/or to control
+  the mute and/or bypass function.
+
+  For instance, the following piece of hardware is a GPIO amplifier
+
+                                         +5VA
+                                           ^
+                                        |\ |
+                                        | \
+        Vin >---------------------------|+ \
+                                        |   +-------+-----> Vout
+                .--\/\/\/--+------------|- /        |
+                |          |            | /         |
+                v          |            |/ |        |
+               GND         o               v        |
+                            \             GND       |
+       gpio >----------->    \                      |
+                         o    o                     |
+                         |    |                     |
+                         |    '--\/\/\/--.          |
+                         |               +--\/\/\/--'
+                         '---------------'
+
+properties:
+  compatible:
+    oneOf:
+      - const: gpio-audio-amp-mono
+        description:
+          A single channel amplifier. All features apply to this sole channel.
+
+      - const: gpio-audio-amp-stereo
+        description:
+          A dual channel amplifier (left and right). All features apply to both
+          channels producing the same effect on both channels at the same time.
+
+  vdd-supply:
+    description: Main power supply of the amplifier
+
+  vddio-supply:
+    description: Power supply related to the control path
+
+  vdda1-supply:
+    description: Analog power supply
+
+  vdda2-supply:
+    description: Additional analog power supply
+
+  mute-gpios:
+    description: GPIO to control the mute function
+    maxItems: 1
+
+  bypass-gpios:
+    description: GPIO to control the bypass function
+    maxItems: 1
+
+  gain-gpios:
+    description: |
+      GPIOs to control the amplifier gain
+
+      The gain value is computed from GPIOs value from 0 to 2^N-1 with N the
+      number of GPIO described. The first GPIO described is the lsb of the gain
+      value.
+
+      For instance assuming 2 gpios
+         gain-gpios = <&gpio1 GPIO_ACTIVE_HIGH> <&gpio2 GPIO_ACTIVE_HIGH>;
+      The gain value will be the following:
+
+          gpio1 | gpio2 | gain
+          ------+-------+-----
+            0   |    0  | 0b00 -> 0
+            1   |    0  | 0b01 -> 1
+            0   |    1  | 0b10 -> 2
+            1   |    1  | 0b11 -> 3
+          ------+-------+-----
+
+      Note: The gain value, bits set to 1 or 0, indicate the state active (bit
+            set) or the state inactive (bit unset) of the related GPIO. The
+            physical voltage corresponding to this active/inactive state is
+            given by the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags.
+
+    minItems: 1
+    maxItems: 16
+
+  gain-ranges:
+    $ref: /schemas/types.yaml#/definitions/int32-matrix
+    description: |
+      A list of one or more ranges of possible values. Each range is defined by
+      the first and last point in the range. Each point is defined by the pair
+      (GPIOs value, Gain in 0.01 dB unit).
+
+      Ranges can be contiguous or holes can be present between ranges if some
+      gpios value should not be used. Also in a range the first point and the
+      last point can be identical. In that case, the range contains only one
+      item, the given point.
+
+    items:
+      items:
+        - description: GPIOs value of the first point in the range
+        - description: Gain in 0.01 dB unit of the first point in the range
+        - description: GPIOs value of the last point in the range
+        - description: Gain in 0.01 dB unit of the last point in the range
+      description: |
+        A range defines a linear function (linear in dB) from the first point
+        to the last point, both included. The number of items in the range is
+          N = abs(first_point.gpio_value - last_point.gpio_value) + 1
+
+        It allows to define the gain range from the first_point.gain to
+        the last_point.gain, both points included.
+
+             Gain (0.01 dB unit)
+               ^
+               |                      last
+               +- - - - - - - - - - + point
+               |                 +  .
+               |              +     .
+               |           +        .
+               +- - - - +           .
+               |  first .           .
+               |  point .           .
+               |        .           .
+               +--------+-----------+---> gpios
+                                          value
+
+        Note: Even if first_point.gpio_value is lower than last_point.gpio_value
+              and first_point.gain is lower than last_point.gain in the above
+              graphic, all combination of values are supported leading to an
+              increasing or a decreasing linear segment.
+
+    minItems: 1
+    maxItems: 65536
+
+  gain-labels:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    minItems: 2
+    maxItems: 65536
+    description: |
+      List of the gain labels attached to the combination of GPIOs controlling
+      the gain. The first label is related to the gain value 0, the second label
+      is related to the gain value 1 and so on.
+
+      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 and 3.
+      Assuming that gain value set the hardware according to the following
+      table:
+
+         GPIOs | Hardware
+         value | amplification
+         ------+--------------
+           0   | Low
+           1   | Middle
+           2   | High
+           3   | Max
+         ------+--------------
+
+      The description using gain labels can be:
+        gain-labels = "Low", "Middle", "High", "Max";
+
+dependencies:
+  gain-ranges: [ gain-gpios ]
+  gain-labels: [ gain-gpios ]
+
+required:
+  - compatible
+  - vdd-supply
+
+anyOf:
+  - required:
+      - gain-gpios
+  - required:
+      - mute-gpios
+  - required:
+      - bypass-gpios
+
+allOf:
+  - $ref: component-common.yaml#
+  - if:
+      required:
+        - gain-ranges
+    then:
+      properties:
+        gain-labels: false
+  - if:
+      required:
+        - gain-labels
+    then:
+      properties:
+        gain-ranges: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    /* Gain controlled by gpios */
+    amplifier-0 {
+        compatible = "gpio-audio-amp-mono";
+        vdd-supply = <&regulator>;
+        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>, <&gpio 1 GPIO_ACTIVE_HIGH>;
+    };
+
+    /* Gain controlled by gpio using a simple range on a stereo amplifier */
+    amplifier-1 {
+        compatible = "gpio-audio-amp-stereo";
+        vdd-supply = <&regulator>;
+        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>, <&gpio 1 GPIO_ACTIVE_HIGH>;
+        gain-ranges = <0 (-300) 3 600>;
+    };
+
+    /* Gain controlled by gpio with labels */
+    amplifier-3 {
+        compatible = "gpio-audio-amp-mono";
+        vdd-supply = <&regulator>;
+        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+        gain-labels = "Low", "High";
+    };
+
+    /* A mutable stereo amplifier without any gain control */
+    amplifier-4 {
+        compatible = "gpio-audio-amp-stereo";
+        vdd-supply = <&regulator>;
+        mute-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+    };
+
+    /*
+     * Several supplies, gain controlled using more complex ranges, mute and
+     * bypass.
+     *
+     * Assuming 3 gpios for controlling the gain with the following table
+     *   gpios value    Gain
+     *      0b000       Do not use (gpios value not allowed)
+     *      0b001       - 3dB
+     *      0b010       + 3dB
+     *      0b011       + 10dB
+     *      0b100       Do not use (gpios value not allowed)
+     *      0b101       + 6dB
+     *      0b110       + 7dB
+     *      0b111       + 8dB
+     */
+    amplifier-5 {
+        compatible = "gpio-audio-amp-mono";
+        vdd-supply = <&regulator>;
+        vddio-supply = <&regulator1>;
+        vdda1-supply = <&regulator2>;
+        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>,
+                     <&gpio 1 GPIO_ACTIVE_HIGH>,
+                     <&gpio 2 GPIO_ACTIVE_HIGH>;
+        gain-ranges = <1 (-300) 2 300>,
+                      <3 1000   3 1000>,
+                      <5 600    7 800>;
+        mute-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
+        bypass-gpios = <&gpio 4 GPIO_ACTIVE_HIGH>;
+    };
+...
-- 
2.54.0


