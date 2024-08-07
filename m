Return-Path: <linux-gpio+bounces-8600-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947F94A2C7
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 10:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5DCC281C17
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 08:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A391C9DEB;
	Wed,  7 Aug 2024 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0X2SmB8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521581C9DCF;
	Wed,  7 Aug 2024 08:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019332; cv=none; b=uE8fMIKSTqbspAaGrnqHC9etr/bO/JLThlJtI2m7O8vIgZ/TiJRuzc4TVDBkJTlZOw0QTLjHLq6bVIfCaJiICVKDyMzXloZejUSebct6jVM+fFqL8EtDC1tc8V7UXwGOTa1jrbC63pKKWHKqyCSAY0mfgDjiRuc54ymZR0FdW78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019332; c=relaxed/simple;
	bh=x+DSZanT0Z62jq7icA50jY0H3B2SM0juf/t2bXEtfVM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JACMHmet9PEBM8Dusa3DlAzcWJTkK7XvJf0h2fEBbov9NTHWIBA/grK6ovLNIOYMFPirHyXSl2JvQgZWohaQ83C50CRfSZ7KPuPhHQhto+c8Nddx+mk4VaLhb8P8r9/64E9FdLKZM13vfwnfpoBM2KjoMvzG+8X6fBQzDF75oNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0X2SmB8; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f0dfdc9e16so18328541fa.2;
        Wed, 07 Aug 2024 01:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723019328; x=1723624128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xHQXGFpfBnq0ynH+7iAXymSNRta5OaZ+nbnM9m911LU=;
        b=X0X2SmB8R9ZpeJgu/y0uw4a9UUyWFaPktQc6HjekeK/iYj61+ORgKOoC/qdbLeEPxl
         WEsFHIPnpxu8wrMs1NFX66cHXAR6ULlNEaHX/kp3zdjyFWUsoCFy3OcVOQS6ZL34/91b
         J3UK4Ya0iESQ+SkeyvIOsZ3Y7StQtKDsP9bWYmIZ85qiU2ecR9Xjul6xyQ5huDNpsLfK
         JQy1KNBSBxRcFC8fXEw06msxE8Xg8txynlM2J0dg7xbXbkOL5feH03orz5f18qDgCbPd
         y0Ji7Lbz4Iyl2njDRzQ3gAP/2ljLsbv0dIRcndZEoInEy6fkuw0chFMARcnJH0pmyp+Z
         VdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723019328; x=1723624128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHQXGFpfBnq0ynH+7iAXymSNRta5OaZ+nbnM9m911LU=;
        b=tkm6kzthYWKQm41Z1JqlitspYNniuep99XrI4Ohrnfgw39D5oxqRBngUR6v/1gWWfY
         A1Al7AbcUDrU3f802LZlJU/1nodnKJAISQ8BD2eL/1JmDPezwqIdpJrPr3dQDuoGJqFu
         FFzrKbgLK9IA263hhzm2xpj3pXAh3T2BjjyINaJb64+nXieWxJpRlkVI0nfch/EGuHEG
         4Zc/r0NYVmrCLimYJNha33u11XqeUt+h4CbvGP/+5a3OUNs2UVo16l1jW8JDPqMUdWUm
         0vPFq11OusB5BheNbRpZ4J4y2oPqLd6pwwjjclrLjGLG83qR/mGSEky9zvY88LKckmh6
         +XRg==
X-Forwarded-Encrypted: i=1; AJvYcCVou1mG9TSHMGGCXFC38oZ3JLVi8puDJAY1L3+dveybAQHom7ZA++flY/OQTlW9cuyMySRLGbzSNB59TURCQ9VWWbYw990+YPPW6MlTwtybywVxF+U+gdb/WpFuQcc+Uy+/0MMuiSsaPiIvO4oKbEFaOLOi/F8p25ULkWLwTPluFcuZZJ0=
X-Gm-Message-State: AOJu0Yxmz0c3Fb7NJO/nau7+2Gcl3ZwIJvvsl9PJ2PGy+e5wKZh930S3
	101danF8ZraHAIIGznVdSREQZUzAbcOxK6WdriONHovgAjmBTsgt
X-Google-Smtp-Source: AGHT+IEK5dSBqWc3i7uzRm9tZ26iz9CxU/757qeiU79fIRrJyEIVR+ffQg9fJVHOwWedCLSRXyXq4Q==
X-Received: by 2002:a2e:8703:0:b0:2ec:1810:e50a with SMTP id 38308e7fff4ca-2f15aafdc9fmr112987951fa.32.1723019327950;
        Wed, 07 Aug 2024 01:28:47 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fb34sm18168505e9.14.2024.08.07.01.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:28:47 -0700 (PDT)
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
Subject: [PATCH v1 00/10] Add minimal Exynos8895 SoC and SM-G950F support
Date: Wed,  7 Aug 2024 11:28:32 +0300
Message-Id: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Hi folks,

This series adds initial SoC support for the Exynos 8895 SoC and also
initial board support for Samsung Galaxy S8 phone (SM-G950F), codenamed
dreamlte.

The Exynos 8895 SoC is also used in S8 Plus (dream2lte), Note 8 (greatlte)
and Meizu 15 Plus (m1891). Currently DT is added for the Exynos 8895 SoC
and dreamlte, but it should be really easy to adapt for the other devices
with the same SoC.

The support added in this series consists of:
* cpus
* pinctrl
* gpio
* simple-framebuffer
* pstore

This is enough to reach a minimal initramfs shell using an upstream kernel.
More platform support will be added in the future.

The preferred way to boot this device is by using a small shim bl called
uniLoader [1], which packages the mainline kernel and DT and jumps to
the kernel. This is done in order to work around some issues caused by
the stock, and non-replacable Samsung S-Boot bootloader. For example,
S-Boot leaves the decon trigger control unset, which causes the framebuffer
to not refresh. 

[1] https://github.com/ivoszbg/uniLoader

Kind regards,

Ivaylo.

Ivaylo Ivanov (10):
  dt-bindings: arm: cpus: Add Samsung Mongoose M2
  dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8895 compatible
  soc: samsung: exynos-chipid: add exynos8895 SoC support
  dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
  pinctrl: samsung: Add exynos8895 SoC pinctrl configuration
  dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
  dt-bindings: soc: samsung: exynos-pmu: Add exynos8895 compatible
  arm64: dts: exynos: Add initial support for exynos8895 SoC
  dt-bindings: arm: samsung: Document dreamlte board binding
  arm64: dts: exynos: Add initial support for Samsung Galaxy S8

 .../devicetree/bindings/arm/cpus.yaml         |    1 +
 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 .../hwinfo/samsung,exynos-chipid.yaml         |    1 +
 .../samsung,pinctrl-wakeup-interrupt.yaml     |    1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |    1 +
 .../bindings/soc/samsung/exynos-pmu.yaml      |    1 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 .../boot/dts/exynos/exynos8895-dreamlte.dts   |  126 ++
 .../boot/dts/exynos/exynos8895-pinctrl.dtsi   | 1378 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos8895.dtsi    |  253 +++
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  137 ++
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   10 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |    1 +
 drivers/soc/samsung/exynos-chipid.c           |    1 +
 15 files changed, 1920 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi

-- 
2.34.1


