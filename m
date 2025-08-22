Return-Path: <linux-gpio+bounces-24823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6596B31FBC
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 17:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAF3DB60606
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 15:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D2F254AE1;
	Fri, 22 Aug 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JfO9TjCs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C53225A5B
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 15:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755877599; cv=none; b=E9EsTKA/U7b240tNKYf/jV5stENUv9iVo7MeeI7OuApRUxejpEdyOq0FMycPqbjQ+iUYmIG/C0GW2sMnld3r69XytR8VZ7eCJG2cp40wn93Odxkwsur+H7nKXc5E5YhaUl7SsfezeBQQUUpqTTK8CTHrOveeAD4h9RiKO8CCxUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755877599; c=relaxed/simple;
	bh=z1hUv6KsVfdsqANkHfljJHbn19cLr05ZqjD4NTsAvxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7x1V4EHtTUk98pPaDtzifJ6AbY8ztMUIhkxc0yfvUyVvfaeMspCBnygsKYB/d3OL5CZTjz3jQsyjLsPyRcDErHtK3sMcGSfTyqLF96LTtHt8496R+KupvAXDt4FaHtjLo5Q+wcT6L9aXv0xGN7uaU7H6orY4Zf+h+2XjFJDT6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JfO9TjCs; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55ce52807f8so2178363e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 08:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755877596; x=1756482396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHPjvts8CpUfCJyt05T/dLXMLgVzDOK8mKME/4LBuUs=;
        b=JfO9TjCsi/qo/lf8GtnhyQY11eAAhLVscgW1jkTkR2MjlyLWnDyIxwXT5FTgZH6CaP
         iN3rMP4P8sCGFFXUk2zewZ3EWZkKKZajv+OLVufVMH4BTnX8OMpc7kwjmhfm9PuXJg4s
         SzYFNIn7LRBJZ32Nwoh+V0EEJzjvdwOzJHZNcRNguRtvuZ2YRazPtEZJZLkm63JWZ21t
         rkR71vyyaK/eF82iG/tFrGWY7gTBDWJpRFdhMmswuOAvQViabVbXpQyT8q2Fhtaa5H/A
         WcIV821PbxleIwubCtjeLWCO/SZJb9aTS07c99OrUUYMZMCxRCSKdotyECe4f4bSaOIK
         SecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755877596; x=1756482396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHPjvts8CpUfCJyt05T/dLXMLgVzDOK8mKME/4LBuUs=;
        b=PXcQmrt3Jua4+K89oPLimEixjeCdMwSID8VskwfGVr9UvravulwJlf3SPzUoz9SIT/
         SqyAesQ/Xz7SAhZGF10QVfwmb39UQSlOaIQP5QEHuVzcVLKaI9+1JzZtLKJ1ctiqffcj
         dZT/yrhRsD2aFURT6PlLDiMuS8AvbdqVk1LLBdIZj3rNNRLJKGT46/fp1HIHVwRzWuwH
         8XBMW10AIYluLQs1aDCu2W6TShGJzzOhvfrN6TzA6LcL5eSpvuvkhXAgsh4++BMkxx0e
         NqKnufPIzIoaqPl+X4b4kGxWSwOosEBz5bn+qaCJHWHSiTrnSHcvwCufSd4iEPkQTPeE
         mL4A==
X-Gm-Message-State: AOJu0YwCUhUw3pmyC1Yj7i4UzmrhMvn+5ZKaxyShPNC+HPPXFuC8af/l
	qgt8aKFZYflcxAFD73Efkd1no/I6QjA0pB2xw0Q6dbiWMXEvscMA9ue/5iZJ5D5cCyy7KWohQyy
	ebE2142Y=
X-Gm-Gg: ASbGncsQnIhDrAIFm/bpoWbG4rcro2sowzOROuody4MjSHONIwQqwgtTM1R57zwAz+i
	/myW48ISyXoM6tlgDdpfoi8fXktN8YyJ4YYPnJx7rZL14E6OOMmPnMaIiDn28vY7TcPwQ9etB9V
	DiIE5vYlWiGWVCy21oNLRYscLESXR2mZSyYmYtPLtCdjUZWoP+O4fnh63vetfDzGgmx6IlxG4ti
	xCd0x7sZskr5LQ1WhejfT5hLhd5fLLq7h3rZHo15JwpWLrHFQDTJyfiucgWs7nJjWXD7HA9FNF/
	ZKCXfMFHz1xJM1ny2JAK99fbtqYQW2BOn87sWIIplQBU3K65xnFPK91lOp+wkspu1oETBV562kO
	J5/wiUxk5nPikVTXDKl8JXf3zfCAfC99RyI6qUlRSM9I=
X-Google-Smtp-Source: AGHT+IHen6twnK0xg5Kvf9PnMf7cOX0tVM9CEp626hj9X4Vutbt4jpw8zdjkHneKZreTIxDKcPpRcQ==
X-Received: by 2002:a05:6512:4281:b0:55b:9424:dda5 with SMTP id 2adb3069b0e04-55f0d39675cmr1038292e87.44.1755877596170;
        Fri, 22 Aug 2025 08:46:36 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5d1a6fsm56541fa.49.2025.08.22.08.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 08:46:35 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 17:46:26 +0200
Subject: [PATCH v2 1/3] dt-bindings: gpio-mmio: Support hogs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-ixp4xx-eb-mmio-gpio-v2-1-bd2edd4a9c74@linaro.org>
References: <20250822-ixp4xx-eb-mmio-gpio-v2-0-bd2edd4a9c74@linaro.org>
In-Reply-To: <20250822-ixp4xx-eb-mmio-gpio-v2-0-bd2edd4a9c74@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

We use hogs on some MMIO GPIO controllers so make sure the
bindings support this using a pattern property.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


