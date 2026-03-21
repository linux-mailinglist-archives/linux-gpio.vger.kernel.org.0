Return-Path: <linux-gpio+bounces-33968-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDvVKI1vvml1PQMAu9opvQ
	(envelope-from <linux-gpio+bounces-33968-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 11:14:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9882E4AB5
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 11:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A36C30304BF
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 10:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924332620DE;
	Sat, 21 Mar 2026 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OmTFv8Va"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC762D97B7
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088043; cv=none; b=n3TpllHUbs0I4CZRxdl/1fHs6O4NearL9S8e8LBMqrncbqzg0vT7lE5aAPuoJAixBzoS2ctjwVQcTGSzg2t013xnkZ6CgrSdqMwhdu0460muiECi3kF2XUA+Rf+pkAN1s87nTeijuzy7rj2+DxfAhwHRzYsJ2X3xcEIihOdutZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088043; c=relaxed/simple;
	bh=frihfCmQzIanWsGaTNFRfE2QMRNSkUDCsJaH143VVzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xa8x7gxL2ZdlR5QO4L61mupUCUSHhjpbtAgK9yCMoixusOHcPf5D576WR/uGVi7LJt0Y45nbYPXw2cwdVRKF/RblIzPsBNXW8xj5ysAjYz5ox+6+U61tjSrkJYviNY0e0WpP6dH9IOfgCDB5U62JaP2WtMCLcQ7/s08c25BjNwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OmTFv8Va; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fb14227cso27142795e9.3
        for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 03:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088040; x=1774692840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyCrfc/ZXBBtX/vytpgp8YE9CQadwN05k6xP+vhF1Ho=;
        b=OmTFv8Vacd91aiP9aLkE2H7zWi+9qXAYNKaK8G0g/PbPXlsixlITFI5Je3mUMd5MPE
         Z37qPzByarp5IVh3ZerXA3FY7eIzH8URSKKKJibBNoNk1Bw5kDyeGiwz8xCBE/yVjSEh
         PNlYFr5iK1vjuIM4KkW6oEQw/IjPZkNG/0Nc+W6/4KhN4Qimb09KQ3s8X9koMyTGUhri
         GM7xgiQlGuOMf1hoRVXHx1/f7fnp5zmBWwZj3d5fzRbyykW2eSEB1qWR3sGMtmonI0Hf
         EMSWsvBcro7gblXV0VADq5k0F81/Qhmi6fl6vkTkmW/R22kl5ISS+Q73Fc2KaolHMhXU
         lH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088040; x=1774692840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyCrfc/ZXBBtX/vytpgp8YE9CQadwN05k6xP+vhF1Ho=;
        b=okPyRRnLaiPgxy4JsLOsbXjTkVOc3Yry7HIypP/1bUYUSrNTCi3FiWgs/KSADlkVkf
         OB79uFcpBgox4P9vFaDe6Pqtq7f8SfaoN9orPfqF9HwBE+hXL+qyjOR+uOHCBhFunoV/
         zGR1YVmAvVq//BDVKFYHoOAWmrekfomq3AVNQBg6ua0c29ycupKD5sni8i1nbvq+Bm5w
         VK3SJ3DgwYXXK5sC25BgEa72Nd/MoHzPMITAk81H/8s6OqC022i7ifZn8jMEi46VJSWH
         jzFqda3qhQpFlIAAp/D5pyd32BnldccKJVIdI8ITWE9Ern/uF4HPlBDVhCjoVVjgQHSx
         Xzjg==
X-Forwarded-Encrypted: i=1; AJvYcCV5qVpUF4MgLtycbnaMLgXvrDo1FvppjAyWN5VGEoi8Q1hWr8ami8LQiy8zZz6jSNxulJBfvcKms4t5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1cbzdOc5ZYdyPb6/C6KrLrW9bP5vj87n7ISsKt0DWLOe94sxs
	/nNYDaygePuaLgx7b06+MkAsi37xwOVap85GwRqbvoTE/KVC7nx9h91EmUfTCoDXthI=
X-Gm-Gg: ATEYQzz972EAzodkroaIjh4l0w6jP9PRiZlv2FSb1AOVcCWpENlFwkvOkQBDbBAwyOh
	AgO4I+hV/UKi/nuhOc2hCrwTvppTp2DJqVfRArB/+FKWTWKrQ2gnWkSTWdBJeCXeEQjJ3XuIgU6
	8PvDoGB1sJjvjyo0e2k6J657OVUpA/tKHWlRod/jD806tLIkmrnfbCfYkQCjFlxF0sYNHB5SDAP
	OrmipgUKM08grMcNvPl5SUZnPMspIeSq/8aa7CzqjxvmQzkTPIJbmGM/pA1oUKbfuQm9ZFvyOeH
	Mam2Me6ibkt0HQYvWl6dYsdvTmwchBI1Goe+jsb9g6fqPNhnakXPI5M0WTC3sEmfuh/50r/efiP
	AR83aPri7+iiXiFrNer3VQQwaSu/JbDgbzZMIMeaJbYUXClvNaHDDIEN4NVFPDDRO5RfbkNLdhT
	0ZYlt4gwq6Cg53/ASyC+yBFmfugfsB
X-Received: by 2002:a05:600c:1f0e:b0:486:5f71:5829 with SMTP id 5b1f17b1804b1-486fedab740mr84674065e9.5.1774088040301;
        Sat, 21 Mar 2026 03:14:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm14161545f8f.17.2026.03.21.03.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:59 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:57 +0300
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
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v5 6/7] gpio: dt-bindings: Add bindings for pinctrl based
 generic gpio driver
Message-ID: <047c75a48d76a0f11f9fcd156ace3b5fdaab10ed.1774087290.git.dan.carpenter@linaro.org>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-33968-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 3B9882E4AB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

Traditionally, firmware will provide a GPIO interface or a pin control
interface.  However, the SCMI protocol provides a generic pin control
interface and the GPIO support is built on top of that using the normal
pin control interfaces.  Potentially other firmware will adopt a
similar generic approach in the future.

Document how to configure the GPIO device.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
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
index 000000000000..9d20b5f23cdc
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
2.51.0


