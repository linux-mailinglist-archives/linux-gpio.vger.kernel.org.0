Return-Path: <linux-gpio+bounces-24608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D86DDB2DA74
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848511C47429
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 11:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C5C2E2EF8;
	Wed, 20 Aug 2025 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7ivdgPH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0A82E2DFA
	for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687590; cv=none; b=aykvYhDUW172A7jePHnosf605IMF2ij047h4LjRH3++zQQ0zHfmf9hPJZP2mKZpKbsRq8JYv6KEl5AcC3BVettRK48HKReLy+J5dH7615Vec8wUPI8fD+fIHB7/Zn1FXop0UgE/GsGsfSnucpja5h3hivd5kS+enpIknLSn1+Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687590; c=relaxed/simple;
	bh=AWN8CGaK+f1RcRVgTy0D+RMJNbOIaHp8LfG7QOgeDEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2288t1m6k/wZZspTHk6JbFXVrlBwrUsXnL5dhOy8DeehvkKKwEjLPfu3zdMHQY8nLgUj6Naee05qbAGzR3uOYVkFV4eeOF2dkdK0nHiI65+FNK5jJ4tupkGusEIXmo1q14doVQL0U0rU24mRqCpaJcyKpG5O5AWkVWNfaumoew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a7ivdgPH; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce510e769so6630439e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 03:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755687586; x=1756292386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/3Tls3y+SYQUOkMg9WP/g6EYiAVZ29uwYrZ0Q7F0ls=;
        b=a7ivdgPHDed9/yCumlJQ+SkqCPMQJVc4A0FE5QN2L+uHRYL9fCmXHh2Afj3yG7EubF
         m+owdRFexes5UqjeSgk8Wou82YKY2qHYNkkrqH1t9hakUCwpZQRCjZAhMG16T9DTwToo
         iMEE47jaRKOV2mkOUwuApvcIHWkuShLMjabp/jz37eNOQ1qK/KhRrog23p+pEIJ3UdcJ
         0vvWsANw0Il8TN1vf1xDCoou4nG3N4WSW1HuCI/foIN7559S1nvru7po6TZKlw5zYdfB
         sEHed+U0HcjzbE+UNlj47Hn3k3joylknile0i+2alarTJsGUTe5VtqrqtOFBd0M6Sgy/
         hB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755687586; x=1756292386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/3Tls3y+SYQUOkMg9WP/g6EYiAVZ29uwYrZ0Q7F0ls=;
        b=d3wZmSVEuEcF2UuVDzxPg7Gf59WXLqvK4FiMbJoyQKUjTaFRFFDXMLq0o8+RHIjIdb
         zCnvbNTdMGEVWokixX3H62aTfJyDUPSw3V05yH4rOcMk99hNdJa0cJBm+7IBjQRJIZ9H
         quwfxGsoMabVLNqnXROvX7vOjsZaX8qqP2dHf0/KkJKAHqWozYGQE9BOhUR4mmEnO+HX
         na3367G61JBvIc0ghLXSX5hQhdKQgpJiBAd854QZR69ledNzdlH8E5+es07NRc7I82ZS
         Upq5DtQrvR6SlONim1tII2p08nUiOKW2gyTBTKwZfME+4KSx2gL9bLO0xVhfQ84Mh9Pw
         PJqA==
X-Gm-Message-State: AOJu0YxgPTEGEcr67LQVrhHW0RrF/XBw1irWy5EPxaTfHiG6FpzcAdry
	rWVV2qHU6TjS6urgxViQQX69dBpxbJK6QC0IBzVAbuEKUEOHPI17bkhG/qf91ebWjv0=
X-Gm-Gg: ASbGncvUHNb0UUKD5iyAgi20EPFa1wZPbuk2lB+hGCcQ6wvOKKCwcIUSq4b0oqA/PM2
	ZXsI3oYWgDa3goYi8+ly+7cXHBuywfRSt/oJtfAx7QJ1DxZxRYf6K2H91XsfrMQBAp1zCzVOcKo
	sx61A3aErP7yKSjK36PsbValTlwmTB3KuEoThjA3r5br0vxjN25k2eRgghbgMNMXGg1jBIbMzGP
	7b2iFgsT0J6J12wAkf8jgSN+oNrHFE1VOJ+CtTDYLIfNol18YoVmQSptZfIt2/cDYe8YrjdxhHL
	DOMVGcKg8atR+UPVr7YY46pMSn026vo6fJGSxfStXk56Gc8NM1Htlqykc95Hp7ZOYg4eJu2j39y
	qRwXU8Epec17oPG7jrQJ/3O+yxUFvBRtw
X-Google-Smtp-Source: AGHT+IF4jtQoVYC8SGrGiOghm6SqypulBxOp3aZ3d30z7GsbEOicvYdsyN5CdwckNn0IyunnH9a3wA==
X-Received: by 2002:a05:6512:1093:b0:553:cede:6a9 with SMTP id 2adb3069b0e04-55e06c27dfemr641732e87.55.1755687586279;
        Wed, 20 Aug 2025 03:59:46 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef369843sm2518285e87.60.2025.08.20.03.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:59:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Aug 2025 12:59:43 +0200
Subject: [PATCH 1/4] dt-bindings: gpio-mmio: Support hogs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-ixp4xx-eb-mmio-gpio-v1-1-0e167398c8ac@linaro.org>
References: <20250820-ixp4xx-eb-mmio-gpio-v1-0-0e167398c8ac@linaro.org>
In-Reply-To: <20250820-ixp4xx-eb-mmio-gpio-v1-0-0e167398c8ac@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

We use hogs on some MMIO GPIO controllers so make sure the
bindings support this using a pattern property.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
index 87e986386f32a4a8ba257d6a4d8da492b05d5bbf..ca32317dff85bc72aace6638dabbdd91de5e569b 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -89,6 +89,12 @@ properties:
     description:
       If this property is present, the controller cannot drive the GPIO lines.
 
+patternProperties:
+  "^.+-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
 required:
   - compatible
   - reg

-- 
2.50.1


