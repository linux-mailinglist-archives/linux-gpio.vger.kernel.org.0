Return-Path: <linux-gpio+bounces-8620-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 066C094A3B9
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 320B31C21352
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431DD1D414E;
	Wed,  7 Aug 2024 09:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etXJ6E4i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587F41D3630;
	Wed,  7 Aug 2024 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021767; cv=none; b=bAGs53ksJxBZDic3uv5XLG/beOHg7dtdx6Zsr6Aelm2KxthMlqKnAWmImLerLfaRUXPa2zXfNsPbRzTfOZZTHFh4q1cBNOuBpMK/9aH3J0dmbjDzNz3SIZpSs70RpsDEI2s2OGqPnUzoGECWbLbYgu3ZkEVrMcCS7bUfom7WzRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021767; c=relaxed/simple;
	bh=1ciWXVYsPlELPVtp1zZbnMfNRGJcetZFdDdSLsQCcjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XJKkAINPorXDfc5ske4eLvZJC8wZOi7F8TJfN3DO8YIZ1b7VSZOKWNYPNnPUKBee6YVSdg2rfFnAbppwF2MQY+yVXb4YstgptFGv5SiWELp5PxYvd3bDkg9hR2nWaCb92eVRZMBQkELkSjM7d4zGVzdKwHJk6Okv/l7E7Y44dZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etXJ6E4i; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4281faefea9so10163915e9.2;
        Wed, 07 Aug 2024 02:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723021764; x=1723626564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/Rj+FE0mEboMxqdM09FEcIsQwLQR1um0Acu+jIgSCE=;
        b=etXJ6E4iM8De/QAZw8ofCg0eUpyYErcrc1/kf/rDJnp7dJM9MfHKLsmNMaDxfXMXDY
         X4lPsnXiu4STaAR6FSjpfQSZ4Kld/bVBFMgKLyXkpq4cJ2VqMWOdKtbahqLcqaafr+PV
         DA+qYdJM+dyuGiRNTYjJ3P5A+gmBBgvL2gReYCrQYCtYa/IB41au8m1i8ideIhNti7EP
         BAuKbQUCgNHMdWGYXyKQa9TsYc2JUUHtrd7OFuKrrft/YWNcoH4DeV+IVdlMey/5kvCj
         q7mscns5j7Esh2svhkfpeUfg1/YCIWihLI5x/xOv4Ir3mMOsAmA5obncMb/dCOn1LHku
         sBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021764; x=1723626564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/Rj+FE0mEboMxqdM09FEcIsQwLQR1um0Acu+jIgSCE=;
        b=eTpydvcwgifs08ZrGscYGlvEcJzGYihlC9mwFFcUHKXMFnOr0XbJz1LHozQhNp4E0m
         jpJgaskANMywSqslR8IEW4h6Rp1dLykMpKnfN8RGgjb20Hz90k/29CCLruM3kpD5GPmk
         WRIrNUC10J6EwYU9LqabdrV3SGucEjAj+F0PKo7oekX6OMjDFxOp7FOEXK8UfrxRIva8
         UpDfD64kKFfccXuSikmqREmO60GB8I+or4YRkM9QH8Owy5S7yVQ0Jpvb9JxNN8HDx3Ml
         H9MIOYPwpmI4xOKZcP4+NV/jL0wOlyoxWYWvIBYBsR/F29EPJt/9z8H7tAyj+qmC7A/K
         yqJA==
X-Forwarded-Encrypted: i=1; AJvYcCUxyESdv2wN4tOYaELugGXY3br1QP0Li4lSVKZ9Odkc8pSahikajwaidRbQ/7z2FRoIDdD8NhtcV0ygSuR5pzAv6WcWswtxLpww5FSnOtBduGwawbV2BdMcCxO7Rr/puATdSR+UwuicbrEofvVybALOOLQse5dr7acEOfV5btRa7k41a4Y=
X-Gm-Message-State: AOJu0Yx0xYbUazXQOfkv5nLn2QGS2ZqyzMVzWt0dJwNZorbqFBAGzo5B
	x9KgvEZm5KYnzRsKKglIRVGhxuWai+00JmyVrsRt9nioMoBhQIyv
X-Google-Smtp-Source: AGHT+IFcsxHnYLp1KfrkmDgil6ZUZcKca5aGW31wE6RM8LStn6v6DVLljfW2Yooh+r08Vrg8wUN7/A==
X-Received: by 2002:a05:600c:5111:b0:426:60d7:d299 with SMTP id 5b1f17b1804b1-428e6af1a1amr122469955e9.7.1723021763625;
        Wed, 07 Aug 2024 02:09:23 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905801d37sm19860455e9.31.2024.08.07.02.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:09:23 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/10] dt-bindings: arm: samsung: Document dreamlte board binding
Date: Wed,  7 Aug 2024 12:08:57 +0300
Message-Id: <20240807090858.356366-10-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Samsung Galaxy S8 (SM-G950F) board, which is
based on the Samsung Exynos8895 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 01dcbd8aa..49884a7ab 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -224,6 +224,12 @@ properties:
               - winlink,e850-96                 # WinLink E850-96
           - const: samsung,exynos850
 
+      - description: Exynos8895 based boards
+        items:
+          - enum:
+              - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
+          - const: samsung,exynos8895
+
       - description: Exynos Auto v9 based boards
         items:
           - enum:
-- 
2.34.1


