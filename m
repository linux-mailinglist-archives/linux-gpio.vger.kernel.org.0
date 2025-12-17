Return-Path: <linux-gpio+bounces-29670-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA21DCC689D
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 09:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84B3230E64C7
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 08:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB11341666;
	Wed, 17 Dec 2025 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnwZvAxH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C836B341061
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765958942; cv=none; b=HoJc4QWDhNNcCR+w0cL06X/PyPZKrGziWwK4UqnfK0CkWI/5xZknQbNGzH4hHA+YMkKAtoSUAYbZqwH1qviaaY1V009p9QdG8esT8j41nUf32lRMcsrgSt9KIpCiEKkZWZ50ReFXa7wivPvL1s8GvB3umvI8Y5ALReyiGq2Eb8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765958942; c=relaxed/simple;
	bh=WYGDwtO9eQNVNa8ZVym/Vt5s9Af72lv4Y1u8XOfzFPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b71i3EKBeoOe9t8GWUYYzByoj64Szf4MmsXJPTXpPTEpcTUBHL6PaC6rkxxEQht3xXT1g+sliSPxqaVf1tHsnEgnnPa+/jflmR5amoHPFMYtEyK+0iXYq0zmmUVI0CmI0DB2Zyu8Um7xF4hLxxpC37FSqFs9QbHITu/EUXMo7MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnwZvAxH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so40248395e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 00:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765958939; x=1766563739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNdbat0FCjuFkU/WW3WZpT0/Ox10m6+452sPx2EkmMU=;
        b=OnwZvAxHh53g7oaA2/aZE6FPlfIY0YYKx2wfwSo3lQza6vHpDCZ070Std54DpfK9xb
         /hSrFjvgPrHM96TzkBYgxjQTvjuzWkIYpTIbjxIZvfJLtvllO33zSlfv/YR6mSMwW3P9
         CuQgXGS/KVxwNr9Z7rsC4rXulpCMS5GR6hqYrhsAD68K1cf00N7GXeAGisR/m8+CkecY
         GCIYp9A2yN+tLq4JQBpEhA4ylx2Oo4o42kCG0JvwyOEES0KT/ZfRAkCW5mI1v4gd4ti2
         F2KSnNtPc9xgdOpmxrk16xD3t8ykkugKGnbMwlfIRporRpOle47MD564F/YX4qX3flxB
         vmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765958939; x=1766563739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MNdbat0FCjuFkU/WW3WZpT0/Ox10m6+452sPx2EkmMU=;
        b=ASGoi9HIGNTcpkcJWP9q2ifp+1nkaQCP7ZhrnGOgck64jYRMyCtuZq/kpE40y41QaI
         0f3/gWjYRix81qlUvSXyLVP3pPoKbfVTn9SoTwOie+8P6kigh/Ggt1Rifv3cwjzIuvMS
         UUDD+KONsyHUOrJwHOHV0hrAHfyEr2kjJ+fwY4bPw+ux2zbD4WDy6A651H6oPrBzqTct
         gg7yZxsw0v0Sgtw08hBcapfVpj38Vk7g49dII2XoZS3h2ASnTPrbivxX/m7GFZ0MtDjB
         5+ZOWyD/S49eLvALlva784PuIcXbaxj3/BLqVqz3CTc4a8lUgJNXf+J2biT54E8EG7z+
         fI/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDvKFi1eZ2SJL4paaBiQVDFFxL1FSsr42v0TAYRh+qE1toTT9ieuNhTsTD5wfehby9U4h39D1nfi7p@vger.kernel.org
X-Gm-Message-State: AOJu0YzXmYpgzm3MCQAe1WTxMG5m4zInyWs5tnmE7NEM/gdZh58/2xZD
	FImVL4EzYAuNM3Jt9kqJWoLR0fvd7IBELvYkFm4TUcAwq8xacCNOKMHz
X-Gm-Gg: AY/fxX5xzgax6Tr02OLgQA+ionCyj9s3CnSIzPS+vA7iPvYEMGcdpfp+7AalX8EjIZZ
	gVkqRMPpBoonXBus3ArMggTuCfYGiK0rDUJCj4TfIU3qaT9a7Y/eEyKJm6k7YQFv2u+5BzBtf/a
	Y/i4rG5z0iTSXSem+hIkZengjRzHg1Nt2PCfkP1WB8dlKqAklTqlUfnWWG1/+5GKx4Dp+V4P2Gy
	qX9fyvgkW46hCj5zbHkRWeT96AguApMg07r5iLQ+sMI6cOtzMGf9Vr8ElHJeNHiSJuckkiPo/IP
	r6mpntbuPRxhgzcP1s/USDlqbUHFuXRVdmFMofpiWbZ9SGnXuSczMufdFye045MUork5Z1TR7DF
	40fvYmWJu4+UnRW9B3+eirCmLlmjkgiFdkfq1i442cDoRUX0mbS3lSaUlDskJ/ufUnoIYKZ9vgC
	f4MRx3Sa1u7SIVjkJSN3n+fuG/vtOqDqC3pBskS2I0w3dp5COnsN5ej4P8kgcSn90/
X-Google-Smtp-Source: AGHT+IGIniiX4z2xcB+HJw7rpdiF/WcO2McouN4KlikrTH48po4ehonwpvhBjzZMT7mg2YbyGVhW7A==
X-Received: by 2002:a05:600c:4ed0:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-47a8f90ea5fmr200713865e9.30.1765958938898;
        Wed, 17 Dec 2025 00:08:58 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1cb6a8sm25518315e9.2.2025.12.17.00.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 00:08:56 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: Add compatible string opencores,gpio to gpio-mmio
Date: Wed, 17 Dec 2025 08:08:27 +0000
Message-ID: <20251217080843.70621-2-shorne@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251217080843.70621-1-shorne@gmail.com>
References: <20251217080843.70621-1-shorne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In FPGA Development boards with GPIOs we use the opencores gpio verilog
rtl.  This is compatible with the gpio-mmio.  Add the compatible string
to allow as below.

Example:

        gpio0: gpio@91000000 {
                compatible = "opencores,gpio", "brcm,bcm6345-gpio";
                reg = <0x91000000 0x1>, <0x91000001 0x1>;
                reg-names = "dat", "dirout";
                gpio-controller;
                #gpio-cells = <2>;
                status = "okay";
        };

Link: https://opencores.org/projects/gpio
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v1:
 - Fix schema to actually match the example.

 .../devicetree/bindings/gpio/gpio-mmio.yaml       | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
index b4d55bf6a285..6fcf5fd2cb66 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -18,11 +18,16 @@ description:
 
 properties:
   compatible:
-    enum:
-      - brcm,bcm6345-gpio
-      - ni,169445-nand-gpio
-      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
-      - intel,ixp4xx-expansion-bus-mmio-gpio
+    oneOf:
+      - enum:
+          - brcm,bcm6345-gpio
+          - ni,169445-nand-gpio
+          - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
+          - intel,ixp4xx-expansion-bus-mmio-gpio
+      - items:
+          - enum:
+              - opencores,gpio
+          - const: brcm,bcm6345-gpio
 
   big-endian: true
 
-- 
2.51.0


