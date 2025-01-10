Return-Path: <linux-gpio+bounces-14649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1379BA09158
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 14:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B348B3A1619
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 13:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD4620E031;
	Fri, 10 Jan 2025 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HMf6eD4n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388E720D507
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736514039; cv=none; b=Phzxu0whP3J4tswB+vt2tVYbw6tEqVDI7iTXH8pVvfCy25crwnOVR2fZMyXn1JXe1OjegSnkWnfMiz5HUpcaW+gR/Kf8XL47NsjqDUdKPQANB+KZYGNqx99DVJeQyco5AJ8+AklxePxs6wfAZinL2SolW+0tu9nMxWqzQoQb6a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736514039; c=relaxed/simple;
	bh=NI94rkazrHFiOl0XdQvbczTPb0hren50HBQrX3tChuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJ6jdjq8EgWzXy2GBIiJ93q+sRXDR+yFSt4Bo8oZW4mdWwjX+MVaLtrnvNHjKYFENJbddCLhK1btLoSf5E/ggcvl0I5ldNk4DXGOJB8nFCCQmiP7Qv14Sf99fmfGdoILQUe/SpyW0zwTCcfRRyinhx6ZRLQGhYVWSIFtjk2YFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HMf6eD4n; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385df53e559so1609976f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 05:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736514036; x=1737118836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDCD62Pui8+0UkwiGsBc4nPgO3uBLewidrJs9+oBlXo=;
        b=HMf6eD4nprPWZDSj/opVtLIXWW5ofyOxBAYyqTKnMk1F+Vst0jl8y12ArINzO/pnXg
         GAaq0PwPoRa/8XjJKI0w4sOOTb7oj48k7v7IRcxUY616vwTmFRC7bW6rUy5axKRFE5qj
         vYSlFVTtBTLVEDBSTpFBb4Zwqa63MAocDhx2/lhMw3QbLgfiY2PDSAqWs/ujsnNUi2ej
         qDNYPs7hBUenHY6GjXTpgpRBi9QJdjnp66k2UdIgFtZafdmZET8ZsWR+fjzhCd0C6yFv
         YaG70R+2zmv2c48J9Thpf92xUiKMQAKg5SHP+ZVmaxpPxcUWSMbEwKgnu7D18mMFFxjX
         C31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736514036; x=1737118836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDCD62Pui8+0UkwiGsBc4nPgO3uBLewidrJs9+oBlXo=;
        b=P225DotJflJwQSU3zL4ty3FLfMF4tAk6Gnl039pWr51WAy2O/5dQnfBf242VncAmEX
         Ghu++6nQgUJCtGLp0GUdTL64uf4ztFNeH1NI8Lc8MEeg7JsN4ySTC+o1KSV6HS8uFq3e
         Uh922PX/2IntOzZbZTfVfyULhpANAoPIr/piQqWqjkJmKyXcdBvlZtwCmGZSwaEaPgum
         gBaan4Qs4j7jxG24j6YBIEbbv8VIPFQhw4auCGPGrspdm0eLdyyh4xQQ5GCXYIu/Dpqy
         mLeZwxNwU5QYRV88CWvXRbWip2AY4gC00Phoy0DC9cDGUSRknCT0hUQkjrSDCbclfGBv
         R9gw==
X-Gm-Message-State: AOJu0YzzOxZvioJPsxicXTl5mfoStjDPOM/rd2JcQ7qK4uo3wlj4yMSr
	adCQj9DtTeALxfEPvGxErMSKIsBLEo9PyyKoBFbc0IW3lrAIhbHPWUtVVsaVVFk=
X-Gm-Gg: ASbGncvxsLpc+RfZWogp8Tn69MiJxNogJSZrrUwuLa4nap9dFa6/L6DZRl/fnTPZwtT
	t1iHWRXKMlXDNv6Vj9Jpz+XXM8bTnQb10FB2jP+3bd+KC/IP8OSWnZhaRimYB60tAgRlOLlUVSI
	OcM118OIYo6r4m/nusKAI9cN4W4fa4K450T9N2I4RZJ1vulfu+cbwwyZ4ArSL99gzKuaFKNh2sX
	F4n6BwkV4qtAAMPynyABDTwAN3TDjLvXHPbvzGWtDwgB5o5xLlZByY=
X-Google-Smtp-Source: AGHT+IG/Z301PbNUmfwGgNeewmZnvFfB+D5Qh8Yoe/mPcCOg5S5xly8CpbeGJdRKhVQh5rwbALv9ZA==
X-Received: by 2002:a5d:598d:0:b0:38a:624b:e7fe with SMTP id ffacd0b85a97d-38a872d121bmr9293319f8f.7.1736514036429;
        Fri, 10 Jan 2025 05:00:36 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5581:e96f:97e:b3a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37c2esm51360745e9.28.2025.01.10.05.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:00:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=20Bence?= <csokas.bence@prolan.hu>,
	"Geert Uytterhoeven via gmail . com" <geert@linux-m68k.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: gpio: fairchild,74hc595: use a fallback for Semi MC74HC595A
Date: Fri, 10 Jan 2025 14:00:25 +0100
Message-ID: <20250110130025.55004-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250110130025.55004-1-brgl@bgdev.pl>
References: <20250110130025.55004-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This model is 1:1 compatible with fairchild,74hc595 so use the latter as
a fallback instead of adding a new stand-alone compatible.

Fixes: 0ba6cec7acbb ("dt-bindings: gpio: fairchild,74hc595: Add On Semi MC74HC595A compat")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../devicetree/bindings/gpio/fairchild,74hc595.yaml    | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index a209c5b4f6e0..da462dddb140 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -28,10 +28,12 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - fairchild,74hc595
-      - nxp,74lvc594
-      - onnn,74hc595a
+    oneOf:
+      - const: fairchild,74hc595
+      - const: nxp,74lvc594
+      - items:
+          - const: onnn,74hc595a
+          - const: fairchild,74hc595
 
   reg:
     maxItems: 1
-- 
2.45.2


