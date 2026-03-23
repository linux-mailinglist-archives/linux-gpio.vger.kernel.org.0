Return-Path: <linux-gpio+bounces-34053-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JE9LrCOwWmuTwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34053-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:04:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 607C72FBD15
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1A833039B81
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 19:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B762315D33;
	Mon, 23 Mar 2026 19:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VCsTMxEC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D05B313E3F
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 19:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292509; cv=none; b=Bcoo/6d3Li5V6atJrC3QXznOLf1egMy6640QNZq3eu3Y/QdwduHAVPrNms2H5NE0BvYOxY6AvMV84kwdT9WwyJkakjCl1Zrzhvmxr17fWWRizhYICWs8142mZHzvlUG/b2oy8sw6SzZvtnaqIMrSDcfst6W34XBfLxF0R0PSbCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292509; c=relaxed/simple;
	bh=HwXxD/Mvckwc9RensaO5rKc7xsT38UOSxYK2/xxw7d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7e8J4qPOfKCv0L1n34u1aMYN4kMgK1D1ON0+88F2emD+TMy3Q3xrvfFsJctlMDsmaT4h1oDXfr4poEd+FEzqic6o2LaqZ+w+AEaFi22BK3WtApt50M2kc5W8l/d3iTM4Hi+RilX/9XVJmi8ZKLb7ydurcvmsjnK/fddMCLZUAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VCsTMxEC; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439fe4985efso2819048f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 12:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292506; x=1774897306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NvES5asAEJe0f+U9lkKESn8eUh5IqEP6vkqyZhx4vo4=;
        b=VCsTMxECs1+Tf9bOrw+28UVAEhC2a6Go3DLk/9hBOjZNWCUP1fyFeoR57HVrZ3Pi4d
         LAmXtugh8WwFt3VK3Q2MZ/TOu/iZjNA5WosqvBJhHYA/9XssdfUKvaFJdMd+aIzeO00i
         XYUYAaTXYrfdll3cRlxd5jTug1IauGRmg6Hs4sp67pV5+CJwTxFun1sbS7IYeh1zBZxw
         1CimWpGUFdSXprFmb1XvdZrpTCLK2N+IUMS/61NgxTxCxuq75+g4s746y5fMxTqr8YoJ
         4l6Mvr+dE6yLpw9E5dfbL08O1UBtF+cHa51FuVC9T+GvAPbOaKHr3qSUCNeCxtl0c4GL
         PRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292506; x=1774897306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvES5asAEJe0f+U9lkKESn8eUh5IqEP6vkqyZhx4vo4=;
        b=PRWnKbdE8wn8vUg0iGjUKzDebtI3JvDyzYRI4Jylx+/ACc8qM1mt1E277xRvXoStAj
         e9V3yQGRH+X5WrlxWUxEn1lfNruTykSkZO6XeX9Wj90vcb1gJ56TsEmki70+Rwik6gQh
         6+mLhAhdztx5mXhGF+8IZvtchZimzzK4RU/gjBeeJ1JemmjcyLiIkEkF1lfo326XhUzt
         +1PkGXa/eTDVtVl12/8DzgbwX3v0vdbCSgzQCTHFmqgxHZCrcwnRxey7cEuOAPzAFIEK
         UAv/9pZ8vmuhsJgrC0KS2fHpvDSq4KKzGazTfvPJKhpUvR0OG3e7SJx/L8NmIieNSEru
         zVGw==
X-Forwarded-Encrypted: i=1; AJvYcCWsjfHqkRWjnSi5rX1d53KX1NS9hiJVkIxBC1FRxjd16qExfm0VoT4Hr5xyQw5XChhns/2TC1l7xjck@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs2KCcpzq9cIXo82NzjwGa/jeONYCFIXYm4kprt+ugGeqRe5ZI
	ks7yAO09BjtemDGrOLi7SAyiVPheYsSNc8TdkkNnTLuJgsGGEf0XOAr2RteQCN4Ilvc=
X-Gm-Gg: ATEYQzxzFmyaIYOmAcCHKKdIiAxCQaBjYShNml5CqTwqIN96p5tQ72dsijqE1iIghVc
	4jf3PLyhZiuSfPDhSYEv91cLLYpo7ogRW8L/BoQmSPgm2bswkXGaQWpXSB0fCj112FkGNCCsQzq
	04Tjk16e+sqDSjKzU1txiqe4GM0peJTwow5ntSJa/zlXBPlF33p92R4W3ZtsDBcpQQzTTfU1b4r
	KCBeYEVIZlwjBPdllx8CgJ0QxKRscC+blXvY33WD6yt7aY0IQVP6GWtZ9XVEp3BZjP2NSpdYcTL
	THSI0ouPqMIybsZbGYAM/JlkmnNjuchMUOg5efc645CMadEv5YvAXP+Bva4qdLx+lv/nR2hCjzH
	JBnD65Z55V9JmncRQTK9i4mkBWqvnQ0P5Dp1wSXgHiYekaUyPVsd5XL7cfa7D/9yHAY7I9DEtDO
	wUxGJEcvrPOgvnrbz7DmyuWgkLILbG
X-Received: by 2002:a05:6000:186c:b0:43b:42e2:f4fc with SMTP id ffacd0b85a97d-43b64263ff2mr21553564f8f.26.1774292505939;
        Mon, 23 Mar 2026 12:01:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64714decsm28606638f8f.31.2026.03.23.12.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:45 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v6 6/7] gpio: dt-bindings: Add GPIO on top of generic pin
 control
Message-ID: <3ff8504571babfc0acaa74fccd1e12024d33dd11.1774283146.git.dan.carpenter@linaro.org>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-34053-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,qualcomm.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: 607C72FBD15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

Traditionally, firmware will provide a GPIO interface or a pin control
interface.  However, the SCMI protocol provides a generic pin control
interface and the GPIO support is built on top of that using the normal
pin control interfaces.  Potentially, other firmware will adopt a
similar generic approach in the future.

Document how to configure the GPIO device.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v6: Fix the subject.  Sorry!
    Fix typo in my email.
    Add Krzysztof's reviewed-by tag.
v5: Fix subsystem prefix
    Re-word the commit message
    I removed all references to the driver.  I also removed the
    reference to pin muxing because that's described in the pin control
    spec file.
    Fix 3 vs 4 typo in the example.
v4: Changed additionalProperties: true to false.
    Add gpio-line-names.
    Deleted one example.
    Add r-b tags
v3: Forward port and update

 .../bindings/gpio/pin-control-gpio.yaml       | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
new file mode 100644
index 000000000000..a05cd339253a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
@@ -0,0 +1,59 @@
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
+  - Dan Carpenter <dan.carpenter@linaro.org>
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
+  gpio-line-names: true
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
+additionalProperties: false
+
+examples:
+  - |
+    gpio {
+        compatible = "scmi-pinctrl-gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <4>;
+        gpio-line-names = "gpio_5_17", "gpio_5_20", "gpio_5_22", "gpio_2_1";
+        gpio-ranges = <&scmi_pinctrl 0 30 4>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&keys_pins>;
+    };
-- 
2.53.0


