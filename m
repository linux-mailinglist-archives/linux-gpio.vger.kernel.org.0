Return-Path: <linux-gpio+bounces-9909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A04409715EE
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 13:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE0671C22E5D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 11:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC111B5327;
	Mon,  9 Sep 2024 11:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIZAGjU3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7431A14A09E;
	Mon,  9 Sep 2024 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879653; cv=none; b=t6FkNd1vJhMmokwdsye+tAD+IvJjF7fjAzlAMPyEEGgY9JkuqpuLM3JXH2FMxP01psxjtCgENQbGKGUi0G2mfSTJyXzhYlDcesB/JfLK9LNG8YJt6KqBQiJCnac87tNbAfHVzNEJ094wWuYYvsJfMNpBwiaN0YFbarZbIox0Os8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879653; c=relaxed/simple;
	bh=YJlAqc3FJBst6pAl3Cuqx40kPEG6Jl56wKBblwBO//I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YIrARfvsmBxQv0SLcUE01SUYaR/1wgysgtqdg9YEMyElAEQqP5sHZ+Pwetu7zfOBtG/kefYrTyO0Wr/AotqCSzMkx4S3OcE42QhLHi+u686x90BpDA1PUiLbtQ+34bTAeRRbJJDF5MFFkrPKv1bRVSturnl58RWcKX5bo9qMZII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIZAGjU3; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c3d2f9f896so4254869a12.1;
        Mon, 09 Sep 2024 04:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725879649; x=1726484449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDBuici3jjjuzI0ajN2+GIIYpMxb6uO6qVCZB5JZ/pI=;
        b=SIZAGjU3jGvpm0rduZCsvR4euvgAndsipgmtwf8XJZ1D4L8P4L/4DbAgnu7yj46Jtr
         QAkJGC4ZUW2WLeeGp6iMPYbQjxEal0KuKmgs1B+21XVp3rm3D3j1kGDF1j8btVoyio8F
         2bOyGkIOXdAVxU4obDuSV0QObPQ/oaQR2UAEWSATZLd5p3O7aEKHmDbl/DTrV/AdXcnH
         ugwp3feLxlE+b4iIsZnO5aQktzAALYTyrtt+R3OdIMawKehAra37+cld/9GBA/MTvWgj
         MG/uzzcfKmESt77lK5odFhGMcW/qHqyJ+iWGmnS9mnAaRgRd/v0Lb1sTZ5vM7KWqyjyb
         +fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879649; x=1726484449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDBuici3jjjuzI0ajN2+GIIYpMxb6uO6qVCZB5JZ/pI=;
        b=QNC/BS6dVR09z8PrzdIrQya4cu5Zn2y6pfRIUDYncSKljClItJ+fR3M2cfgTR4u49S
         5BhmIc9Ycr0iP4P+kNU64euZsEUH37DN6xo7Im3XwGtWM/b6vLT4dcqdYLLTeWSdDF1/
         5am4reXV1dQ9atEuTIOE6AF7Go135NZnbQ5O9mVfb8PO1fA7vKAc1AnLCUwH5TxBArnE
         gu5xDn3bwqgz5rJYgSmMjtLX8Bn1Wt00OS8lIkUFjK1CDnnWqH//RPacT5ZJwyxRNl5Z
         plVr+pt+TIkf4cW9Adbk44c3Ina14kVze04NBgTbM1fHw0P9QjQ1AWeF/zj6K1G1lzk1
         FKPg==
X-Forwarded-Encrypted: i=1; AJvYcCUJIdBC550lz/wsCVvZMOl/53T15Hp/9tX5+oSDW7BzdEhn9RWN9IyYaEygXjAJdA4YQ47PU0UMmiVjCYFV@vger.kernel.org, AJvYcCV6UFY7vl5PAd+inQxhG84ct5h3jvrmbghFHt+ffac66w/Pw2xjSDbHvCooPwu0q0v8r57TlW7/50Fd@vger.kernel.org, AJvYcCVMpwod0SLETMKzQ/7UBht1ummSodV+oBUe/bGCIax7pwNj5zc4BMcxzTmsHtGaT2qsb0aIx6CEcu1pgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBWtRn+odHC2GSP2laS+eEVzPChBaOYrkjIpE6I5lIgYSoTIIA
	74E0ZMWJmnH0G4M3TQvjmutvgtSYKX08KqSV20TgLUg4FgwsjR+o
X-Google-Smtp-Source: AGHT+IEv1dLNzxnOFTIV98R3pObLp1WlSPGUrL3vFtYOTogcVM4yoDRoOc/wmXA81v8REjAEZU4ttg==
X-Received: by 2002:a17:907:3f9b:b0:a86:79a2:ab15 with SMTP id a640c23a62f3a-a8a8884be3bmr777455166b.40.1725879649168;
        Mon, 09 Sep 2024 04:00:49 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc74sm322649666b.208.2024.09.09.04.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:00:48 -0700 (PDT)
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
Subject: [PATCH v4 00/10] Add minimal Exynos8895 SoC and SM-G950F support
Date: Mon,  9 Sep 2024 14:00:07 +0300
Message-Id: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds initial SoC support for the Exynos 8895 SoC and also
initial board support for Samsung Galaxy S8 phone (SM-G950F), codenamed
dreamlte.

The Exynos 8895 SoC is also used in S8 Plus (dream2lte), Note 8 (greatlte)
and Meizu 15 Plus (m1891). Currently DT is added for the Exynos 8895 SoC
and dreamlte, but it should be really easy to adapt for the other devices
with the same SoC. It has been tested with dtbs_check W=1 and results
in no warnings.

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

Changes in v2:
- No patch changes were made, only fixed the issues with my git send-email

Changes in v3:
- Added a-b tags by Rob Herring and Linus Walleij
- Ordered the Samsung Mongoose M2 compatible in cpus.yaml
- Ordered the EXYNOS8895 information in exynos-chipid.c
- Made the commit message for pinctrl support more detailed
- Made the commit message for exynos-pmu.yaml more detailed
- Fixed suffixes for the exynos8895 pinctrl device tree
- Removed redundant nodes from the exynos8895 pinctrl device tree
- Made the arm-a53-pmu node cover only the Cortex A53 cores
- Added a comment mentioning the lack of a PMU model for Mongoose cores
- Added a comment mentioning the issue with CNTFRQ_EL0
- Removed the redundant fixed rate clocks wrapper
- Ordered the nodes by the DTS coding style in all 8895 DT files
- Removed the redundant status property from the simple-framebuffer node
- Switch to dual licensing (GPL-2.0 OR BSD-3-Clause) for the DT files

Changes in v4:
- Added r-b tag by Sam Protsenko
- Resolved the remaining pinctrl node name regex issues
- Corrected interrupt-cells for gpa1-gpio-bank
- Fixed suffixes for the dreamlte gpio keys pin nodes
- Reordered the dreamlte gpio-keys nodes alphabetically
- Fixed interrupt-controller simple-bus unit address
- Change framebuffer-related node labels to match other device trees

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
 .../boot/dts/exynos/exynos8895-pinctrl.dtsi   | 1092 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos8895.dtsi    |  249 ++++
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  137 +++
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   10 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |    1 +
 drivers/soc/samsung/exynos-chipid.c           |    1 +
 15 files changed, 1630 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi

-- 
2.34.1


