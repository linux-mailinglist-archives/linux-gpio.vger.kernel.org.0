Return-Path: <linux-gpio+bounces-33186-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GETVGfjEsWniFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33186-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:39:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0924E26974B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01DAB301BA82
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4E6344DAA;
	Wed, 11 Mar 2026 19:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c6VBHg0u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D3233B6C5
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257967; cv=none; b=k5fFjIFAyg2VzQ64eErsw+U6hMMCv5RLFno9jiRGWKVD73MvwIs4X/wQBkgY6Kc75o8Euwrsu8l/TPefssWgSk4q10zlsGNqpff8GDMqtCF/P6b2kGsAk5NakJbfPQ8muvlWTJxGyda/Hnvmh++V3/OLvgPGFbLpFBf8Go610Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257967; c=relaxed/simple;
	bh=qAqHd7WdBfIomObVD+/mACW3BUxf70VgmHF8fv4ZLTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEcbjBl0NLu+wEZ/tvhxo9Gil7O7SIcg66VP7nWpwqISMI9Z2i7ZBkEhPG7lGYDHvoAdGLn5HBX+1a+tthSa56+VdUKd81vXXwkpfVc6D22AxPIrbBq9I9EVGjHfDXwy9LXgBc7o0gtQyTn8TL1i+aBasT0wYmp/vFCv1quCI2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c6VBHg0u; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-485409ab264so1908615e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257961; x=1773862761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LQkJ7hYeM6FobCrRfQAAST7LKz9aCrMza/cHqRkkyPA=;
        b=c6VBHg0uC3FervAp/thCt94ZiABO4509ZbUT+P0OaFeaaJ3At28Gy735RRTMLxwZh0
         0Le6tyhrCkEhEMOAXmQyvzFGHfPbhsQIoT8GWsB5rbQILkjSi51lqeUQD20yFyI9y69g
         Dk6oYaVeSft7YXAUO6eTg8rvx3cb2XUpfLlmYnWHflwCIuEmIOmajBKJ2npjeEbwSLwK
         GHSlFwWuIdLJThYipmSD119GKvDE10wnOqZNU921skY0DQftDkSC2FKd+5oIOQ0dZYA1
         XWaiI7ZkRAF6PT6MaXvGOSO64Rz9oNS4+iDCuv2K5fL4YGajLVh+ZrMbV+bN17KzP5CQ
         T1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257961; x=1773862761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQkJ7hYeM6FobCrRfQAAST7LKz9aCrMza/cHqRkkyPA=;
        b=niXJSEO39Lgis6Fm64Lv4lVwPbUIohk1F1ZL6I8ljHKDcXB4RVnxaqxThB7Jc1Gh++
         Nrc/wrcvgZ2k/01avx8OQ7NLO+9++YO2xamj67W+kiqUDegsYRgsxGHtwXMX+kRKJIQR
         wFwer9uCZZGXftWicuCvLsZ9GtGLo0Lq+W4vgUuoqDhfsIZOyCfuL9pLtnidsRYgSsa+
         9NvfBieSg0VCn0D+GTibXAuXHQZj0d6OSITWYWXxTCaEJfDXU/uDkohMHlPJiwd75bj0
         JaffhPW5mxYvAtibgs8OanwI7dMY5RL7DIU9SQvkyW3hWta3dUu7aC44gHoPeHfvmMww
         F4mg==
X-Forwarded-Encrypted: i=1; AJvYcCVvMe9kjNNbGzxyI4ZBYoiL45FbpGkKhKvMF10vePO+8JttruKln95qXNE1ayAv+KDJgH4uuX8XsnPy@vger.kernel.org
X-Gm-Message-State: AOJu0YwgvfxWgDV9SHkwEqR8g7vCJPQ3d5u0og36aMrocDW+QgtAszBQ
	meFe0GbV2CRcidNWuX+TYkMAePHclFJma/D8eCOR/GHc/Dg/Ov/SC6SAbGpoDf/g/yk=
X-Gm-Gg: ATEYQzz44FJWr+odpQ3AFwnch3AEH2dofKj1kA5CiyHJl17JATz8owwJRXLf5GyGlgY
	QtxI/RPfaDNor2db7pbL7xsVJMYlDF/dQ07qk5gjZrpCpJVVj0m5LVkPVfg8wwTqBRvunKoUv6Z
	CyIRs1J3Lvdb3uzg1YkVFuoshe252TEHfjpx2hRuRJXtA+6pnor+8QBXR4snWGRTYdLAd8WkoKP
	T5RhX3l4cgK2r1GIs+S66+ZDTq6azDS1qtrQCitEqvtmdultgwekVnXBANh74d4+ExYbqm7bs71
	rCCYDMiH1WD1Av8m+RKDADiBHsC9KBXacBMLfJaN5Ul4BkLD6qOz4nY5qi6+6MFcOGDaNooJvGy
	xEigXS0W1uAZb1e8xqXMzE88zpYBFIMViAwyddefDYeTXMYtwIGcJLIQiVcWsvYowJeEXxUQNTN
	5uFsN642d2IxzITpZh/46EVldw+a8K
X-Received: by 2002:a05:600c:46cd:b0:485:3294:fff0 with SMTP id 5b1f17b1804b1-4854f5a2b77mr13943105e9.17.1773257961415;
        Wed, 11 Mar 2026 12:39:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a2d7de3sm27652245e9.3.2026.03.11.12.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:39:21 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:39:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.og>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org
Subject: [PATCH v3 6/7] dt-bindings: gpio: Add bindings for pinctrl based
 generic gpio driver
Message-ID: <58446889d781435424c46bac563483e603d7c0e9.1773150895.git.dan.carpenter@linaro.org>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773150895.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33186-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 0924E26974B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

Add a dt binding for the gpio-by-pinctrl driver.  The driver is used
for doing GPIO over the SCMI pinctrl protocol.  There are a few
mandatory properties such as gpio-ranges and ngpios, but it's not
mandatory to specify the pin-mux.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../bindings/gpio/pin-control-gpio.yaml       | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
new file mode 100644
index 000000000000..81c68579df6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/pin-control-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pin control based generic GPIO controller
+
+description:
+  The pin control-based GPIO will facilitate a pin controller's ability
+  to drive electric lines high/low and other generic properties of a
+  pin controller to perform general-purpose one-bit binary I/O.
+
+maintainers:
+  - Dan Carpenter <dan.carpenter@linaro.og>
+
+properties:
+  compatible:
+    const: scmi-pinctrl-gpio
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges: true
+
+  ngpios: true
+
+patternProperties:
+  "^.+-hog(-[0-9]+)?$":
+    type: object
+
+    required:
+      - gpio-hog
+
+required:
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+  - ngpios
+
+additionalProperties: true
+
+examples:
+  - |
+    gpio1 {
+        compatible = "scmi-pinctrl-gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <10>;
+        gpio-ranges = <&scmi_pinctrl 0 8 4>,
+                      <&scmi_pinctrl 4 12 1>,
+                      <&scmi_pinctrl 5 15 1>,
+                      <&scmi_pinctrl 6 17 4>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&i2c2_pins>;
+    };
+
+    gpio2 {
+        compatible = "scmi-pinctrl-gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <3>;
+        gpio-line-names = "gpio_5_17", "gpio_5_20", "gpio_5_22", "gpio_2_1";
+        gpio-ranges = <&scmi_pinctrl 0 30 4>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&keys_pins>;
+    };
-- 
2.51.0


