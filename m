Return-Path: <linux-gpio+bounces-8604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4102094A308
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 10:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EDB8B2DC01
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 08:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630911CCB5E;
	Wed,  7 Aug 2024 08:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHDzmt73"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D14B1CCB2A;
	Wed,  7 Aug 2024 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019338; cv=none; b=VQx+caKBlmEcZD+lq+gVD6XXVHvzMxM/sVhfnhuB6O7RcAAAX6BxSYlTFqvCJlXYBXZwbgDmqs4gES0WjbCmM4/CUzLFEWmcjOG9BV9c/QHSVM6V8whuQ1aeym18vjXFPYGlhDuPdnIxXXTfSxXYcN7tQ1x1jsxAooTGMxRqFZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019338; c=relaxed/simple;
	bh=jDAc6mZtFFcMM2mQ79UPjvlOQPhQjwrNc7aue2ncb8M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q9M7mx19tkFcYaHnWr996PFjWP9/q3QLuF5ivmPisFaoL7DvsZG80hfqwQdB93MTzkC+frYHgQt0hAhdnZ8p5rDEfp0QOUbgYU9MkJgqYSa/SSif8Qt32T+590/NuNdVuf0L8iVKO1edmUOQGDL2V51rgEMG0B42rV94e1w87Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHDzmt73; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52efaae7edfso1097478e87.2;
        Wed, 07 Aug 2024 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723019335; x=1723624135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwwR0Saz6X5HED7cvAEHh8tAuosVgafovtaAD9pGybk=;
        b=iHDzmt73+Hh6Jz+tHMv976uzK2jmzoX4VJ+ind1KadAo2RpZQkrJ7RvsztmSX/RGSb
         Pb3onZwMKfcoWCO3haWbifnavanFBe+6f3oNoBK/nZ/ZeqiAQveTKUm4zwNn0K2UbgmV
         jLv5wNLsLhufSdrEgnhNSh4EGIZ/pNnX4Nm8Lu5UwVEm4FAMG61lvzfveDmc10jkYGbj
         qn9D0TRo2b6mYmHayoMyINEg7nTyG29nR7OZ2jFJXJOimuV2pMalSb6v1Go/aBQlMBS6
         wSgMCeAwgSHgb9wbtWnWCYJxIEm1qOZxchvLXZf3w3dJe171qra8IX9XZEkNI9hEIZbP
         kj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723019335; x=1723624135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwwR0Saz6X5HED7cvAEHh8tAuosVgafovtaAD9pGybk=;
        b=fJ4vWcxpqfjSo9Xcg121e7n4B3ayYB6+g0sJP0AUbkomlsAvxfWvgBGV4cxPMRGocK
         jS1a2vk0k9ua3C9iun5j+zMaxGQYHLlZ25XfXOaoJxjTY144yh65EqBHSss5RBHzmTaJ
         N47hC9MGmIn+agFjOMYWpmxis6DfGX4Nuoaradi7M5liuOJ7n9AmNIzCdilOcu6QuV14
         CdVPoSbx3d/oFcDHvFmXjdCPSEHoHXYuIYOA5StkVEjLc52dJAVlUVlT+GHplSHG4wuF
         HPmr+uAZph3GRVBtQF0igYiCdEpR4J/U1ymaUMu1pZdrzEmuzro9gw6OtB0wKj65iS4U
         87bg==
X-Forwarded-Encrypted: i=1; AJvYcCVbw24T1fp20EpkerbvaE/FypyWxKxgKIwzNjiAdBobpnKdddadBGyeF9v4GGd+Dagv/JbqLiTySzC6EZf6VwgF57zwhbt7kP5nl1o5edD8/MW4P8k6MsOQ8uxfDhsiLbYBXfYhrI+zeQ4AS5GDwRM3voulO1ouJb6UPy86Bj4pqyrlqNk=
X-Gm-Message-State: AOJu0Yx9B6MwHMkgtdN/JISUa3/NoG7Awz1woABlzNBKvO+FebTWR/63
	F6f+J0KbQbM711X5yke6PjsAe1Ny395nL/6+cKq2J5xmbsYnrkQM
X-Google-Smtp-Source: AGHT+IFSo85WLCkKKvmvZoyHwrCucYq/9bzIr316x5Z+uINmFugRhavBeZVoYqFnQYYNfXJa1jazuQ==
X-Received: by 2002:a05:6512:1081:b0:52e:7f6b:5786 with SMTP id 2adb3069b0e04-530bb6ceac8mr10786462e87.61.1723019334235;
        Wed, 07 Aug 2024 01:28:54 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fb34sm18168505e9.14.2024.08.07.01.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:28:53 -0700 (PDT)
From: ivo.ivanov.ivanov1@gmail.com
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
Subject: [PATCH v1 04/10] dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
Date: Wed,  7 Aug 2024 11:28:36 +0300
Message-Id: <20240807082843.352937-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Add compatible for Exynos8895 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 242dd13c2..a2af2c88a 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -53,6 +53,7 @@ properties:
       - samsung,exynos7-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
+      - samsung,exynos8895-pinctrl
       - samsung,exynosautov9-pinctrl
       - samsung,exynosautov920-pinctrl
       - tesla,fsd-pinctrl
-- 
2.34.1


