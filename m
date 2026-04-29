Return-Path: <linux-gpio+bounces-35761-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL1EOJ638WngjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35761-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:47:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51132490B53
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B9C130ABE1D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801463A784D;
	Wed, 29 Apr 2026 07:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fBvQl4xC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEC93A6EF1;
	Wed, 29 Apr 2026 07:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448664; cv=none; b=aoDwQQvgB8dcy5A9LqwC4tPGbu+IU+2MSFygvp4Q4OVtLHryNei00NBsEDzi9qU2sDbW1xkAuJr5iqpk0BRHjNb0eShlGndPmJLVvHKGiMAcZresw+GWBdUxIY12avIbMcdwqbsaBbW7PzD2p6Vxh6UpqnGvBDRmkDwNvLESni0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448664; c=relaxed/simple;
	bh=p66r+zCwkOwB1S0QW0mE5+VDJePu1ZvrY2w3dA98YBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUWK3Jg3QspK5ezVUbQWpKj1N1rZMwl+lYoJSuPCoH88mHFsgkLk1+0C9WuD/067A4Ym6hnEM52xNGLtxGubdKqJZ0DtJQApB+ubs5X/BURWZaqCEBD64EaU84T7Gv6WduqF7SeFHFn2pReRUGk6eq2x7rvA8tLmBx0FIhxiUpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fBvQl4xC; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F9A71A347B;
	Wed, 29 Apr 2026 07:44:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 746E4601DF;
	Wed, 29 Apr 2026 07:44:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3248010729898;
	Wed, 29 Apr 2026 09:44:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448653; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IxcuUJb+ByJPJw8uSLEtbL63MS3PIf1zV8Q9uCPz0+s=;
	b=fBvQl4xCao0eGGnMmPG2s1DuPaxy2W8fEM20BESEF93T/oo5E8tSoEmE3jZ3gbhYXk5DCP
	X5D56yJQMOvAbm+wQbTZFDHXGglNqq1DRQWeLjDfXodjgu8PTBMlrSVFYdlc4WwcR1jC2f
	zwp7o7O+Cj6d1rnQvRX3K6Hbomzi/KQcuarx8Zid8lQn8p8CPseWlU7V1GIo6bMczV3rkn
	hBE2K6YtF5rzxMRoh1vyrw1vqlDznRdci6PR3TxjPTGWQlXva5ERKzHmERzBOVFOizPdBG
	WzyKSiB2YUVac0EjVjR+p17J/fh1M76Mev/T7lohOgh5H7jCadPyvYcITGZ+JQ==
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
Subject: [PATCH v2 02/17] ASoC: dt-bindings: Add support for the GPIOs driven amplifier
Date: Wed, 29 Apr 2026 09:43:38 +0200
Message-ID: <20260429074356.118420-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429074356.118420-1-herve.codina@bootlin.com>
References: <20260429074356.118420-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 51132490B53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35761-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.959];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,devicetree.org:url]

Some amplifiers based on analog switches and op-amps can be present in
the audio path and can be driven by GPIOs in order to control their gain
value, their mute and/or bypass functions.

Those components needs to be viewed as audio components in order to be
fully integrated in the audio path.

gpio-audio-amp allows to consider these GPIO driven amplifiers as
auxiliary audio devices.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/sound/gpio-audio-amp.yaml        | 270 ++++++++++++++++++
 1 file changed, 270 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/gpio-audio-amp.yaml

diff --git a/Documentation/devicetree/bindings/sound/gpio-audio-amp.yaml b/Documentation/devicetree/bindings/sound/gpio-audio-amp.yaml
new file mode 100644
index 000000000000..46f99cdd2a97
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
+          A dual channel amplifier (left and rignt). All features apply to both
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
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
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
2.53.0


