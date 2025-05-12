Return-Path: <linux-gpio+bounces-19978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDF8AB461E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9A0F19E669C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B8229A309;
	Mon, 12 May 2025 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHcXx2Zy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62EB299AAE;
	Mon, 12 May 2025 21:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085335; cv=none; b=ALqlg2vNXDxiUbk6XxuNr6u+IWI2ikpKH1Xg+ly0MdI9KsyTkwgZCXyF2IqvRgVOIopmSnlqnzxLqRhG5ETVxFDkjcwK0FE9zZnF4Ku7eF7PeaEdd5D8AVY/c/6gn9fr2Ah+l1vItR8l32ZOcvobQMG49YKkXEWz/t3XTEKo9v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085335; c=relaxed/simple;
	bh=ZnJc+8Plft0YCbEOZ5U61D/iUnHBrlspaOOKM22MjOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKH6JYfEzK9xGZXX95+HgSOTeTGJgD6BxlWUS4Y8/rB0FAdiz36gv0JsovL5KbVylk13o1xcTjZD5vXhXOAPKy1bDLJOlrwI5/YR89HJxLho5Jgtl//Y+78UP0iatgZKfYmvItRfWjvttBREvoGwAj6FXRb25i4kX/l12BSdxY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHcXx2Zy; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad257009e81so229395766b.2;
        Mon, 12 May 2025 14:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085332; x=1747690132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zniI+wfyQHBGi/dszKJTZkb9bGfPHkPMGjKY3XSq1Zw=;
        b=DHcXx2ZyI1DY84154z7Av65en0KYpUarVVI9VMF/Pm5tA0u9L6EilR7rB8SqDm96yJ
         uQnemGSparcvkZL62m2Nvdo3gaQ1ehNk03mmwJA6SzOii91XnuNYqIKOT9bzkX7Fe0jx
         zzGlPi+5lf0wfa3X44YBhEBFSryfKcTbU7KrHWLs99teeP2y+3cVwfGNXeK6sW2EJQ8u
         muazolM2JdcwI7bZNtg7gOyn2QM84GJr6HIiWnPppAcKCEe9FaY28iqtu/t0YT0I2m67
         Jd5Wd+XKytbg9K9Pdt9ODg5oMmxEnVIuPyMrulnlK7lpG0LlKwreVlYuCVf5E/ouCg3x
         8ICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085332; x=1747690132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zniI+wfyQHBGi/dszKJTZkb9bGfPHkPMGjKY3XSq1Zw=;
        b=M9RgfaL6WCf69h8Yf92mFWaC012kmlskhgYC/rTU0ObINMLyFlpE9seoULz5pEOfTY
         N964BeJjzqbyu7ulWc51l0a/K9a794m1BXyKo1EFNd/zDFPH9oGkWa1Kl9m7coQPsP++
         xLJM/cYwyahRdo3xuviJwnn/2Nu8HkysadO8tmq4vMXQF9ykb9+/x27cdakU6lRgDNBh
         jL+YmQ2yofALdSFe5Y/7xDZ4VuGKDOrKRM+YtDE4IFYR59AIAF+zf3hPVRadIXBEZr7r
         zk93INYSdZhWi2YsIx4tucM2PJa+FIpy6UQk0K1a7yebr9vIpzJbYM9+Ao5VW9A9jPyb
         8WlA==
X-Forwarded-Encrypted: i=1; AJvYcCUbn2fGMbVhkPk8ZPJRZOJz8tBAsKlH33AkGy5B7LhcnnS4MlyvZrn8raMQjd5snV7W0cbF+q0LTyxRzpb6@vger.kernel.org, AJvYcCVLX0c11cyETk/gSJSbfeg3+lgfppVKdYqLGVltuptz8GuIvjVrCCkjWjLVVbS5fSeRRtC8+iBx+v7+@vger.kernel.org, AJvYcCXBG8AcAEjLJT7EoQOzbdEHHoQMkbpSe3ykOYyXa+pVAc2hIdF0FS362v0rs8Vh10ZMszf8NWTRp9uJB80=@vger.kernel.org, AJvYcCXj8/PEWk0QfJE6DpMPD7yHTa82XtrAjiG5XQ973USnp7mHnWfqsvjfaDwDE9Vj0sxVJqHlMwWRwtZIxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgWalXKjPAPUXaNtdw+IJsGvxdLKC2trVwgpRSVROdyIftbMrA
	Nd/8y27GKFEb6E7DS6r9X+kqXaZCWL4xtUKVpNIAkdbDDRt9S4Rd
X-Gm-Gg: ASbGncu1xVfVTTbKeACrw93FMayQeVLX9BdVtEY0fvQ1Q9H/FqvCOyvKlSIHNa6eOqT
	nsfk5bqXT6TFMNSanngn+4ac+QA/KA9EZKEBBLdmutpNSbLXnpBDDWY0j6BahKeiIeCki4CmO+5
	N7erN7+H4B0vhNzPJO9DU/TZ/edUt16SptUUbRFejgSMhMZ+7lZYAmVzLOmUpv+ODrzqlpcKUIH
	+c2rmbRF3TXSZ+344l9J5bYsfqSI2d8Crs2xo3oTIwwBQhNAwQIHRy8WpA6O8GxaVsaNFVw6JqO
	VDrXXTKhV6tvDuLrI53RZmeWOTK16lhgJ6JlHelhfelbHQ/z0Cw4kG3eRe4k/Cc=
X-Google-Smtp-Source: AGHT+IGpEtJ466hjYZxHXgDx9Wx4R13JZ1nthYkWedmbOHtDOcknWCFkgjViOloIUCaw6IMyoZqxVg==
X-Received: by 2002:a17:907:3f97:b0:ad2:2a5d:b1a2 with SMTP id a640c23a62f3a-ad22a5db522mr1283450066b.57.1747085331905;
        Mon, 12 May 2025 14:28:51 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:28:51 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 02/19] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Tue, 13 May 2025 00:28:11 +0300
Message-ID: <20250512212832.3674722-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a92..167c3dd50683 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -92,6 +92,30 @@ properties:
       incoming GMSL2 link. Therefore, it supports an i2c-gate
       subnode to configure a sensor.
 
+  i2c-alias-pool:
+    maxItems: 2
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@[01]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 1
+
 required:
   - compatible
   - reg
@@ -99,6 +123,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - anyOf:
+      - oneOf:
+          - required: [i2c-atr]
+          - required: [i2c-gate]
+
+      - not:
+          required: [i2c-atr, i2c-gate]
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.49.0


