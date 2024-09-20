Return-Path: <linux-gpio+bounces-10318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2231B97D7AB
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 17:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 941921F2262D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171E617D345;
	Fri, 20 Sep 2024 15:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MekfBvQd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0892AE69;
	Fri, 20 Sep 2024 15:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847120; cv=none; b=IU/ZgDb940De9e3Bkm8RWBCbb2WVKew7OwhtOzn332789m+tmyiC0sJDB0RBeDEC1hF3/0Yh9VNz5fMnCHA4vr/cjPFXwWeIKF7r8TbO9X+BM/R9z0hm58HyVlaF+FpEhahjfWGM5/ou7x3HFsQYQ4Iwyezmga99iXFUIFcLTrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847120; c=relaxed/simple;
	bh=AePiUQPxOWLp1uPlrGEm2hkO8LCwy14Ex1ibFIcaidg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oSeK0krBaprFbMrzoLbK5zu6Ti0bIangryvh13gF0TbDgfScgUQ0CMHcCl/Y5eY/BqznVkCu0x8tNrw43GNrI++uDt9f3Q35p6OckmZUHzIIK2OonCQKxyRpIRkVCUrwJC9taLGbzXSwEnfON4KlQldmLj2XCE0lgDpvGQqxhEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MekfBvQd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cba8340beso20255955e9.1;
        Fri, 20 Sep 2024 08:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726847117; x=1727451917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4URIMbPjI5zukEST/bFTmzzudhozSJLeeQynbazhWQw=;
        b=MekfBvQdSiTZlgPjlTGA9pZ8cKIpoR0wFKV/QQmZCjIoKbCeYVNh126Nk9OBfePlLu
         dFBJhyhPILOhxdMYfOQu8fv1rbjF/mIgoTLxvAGz4QnNpSkaBMbZ67bxAkdZE59ex3h/
         i8+hkI7RM1tFwOQYu/fEYVZwMW5tsXvIkAwL0b42/qS0II40D3aYc2KcAoaIEwUXWbZH
         mfm/Mp7T5IlHRBx9vv8RPX1DOtsHh2T6fvcbJ7JCAnjf5QbQ7vx02XCWhYe8rep9b8eW
         700aG2fT7NEaqX2o4j4QuHmcEvw7lnn9f/rdHtMWj2iCqsdNl1DbO5Mxw0V+VnnbpRXg
         AmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726847117; x=1727451917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4URIMbPjI5zukEST/bFTmzzudhozSJLeeQynbazhWQw=;
        b=iYnK8+ra6k5jX64qoC8NMPBZiMgnAwNM2ZiT5t5WlHc7Zm6+2krIbWizjT79Pr25dy
         nWGZo/WDZUss3/r3leYNw9+v5R9AA/SzIUF+QTEndI/Bq0jLVwd8jyEk5cFGj1PhorJW
         KDl+sQfd0tBNy30Sred6tzJbaDC437pPpNXnnPMGXZi+lLdSYkpKMveBd547ztskCxqo
         e1QzhqKsfFXwhnOMGOkM/0a6m8gJjJj2/O9xW6lz4BpYtBasBeRdM/8Egvr+KGpsn4N0
         G8oEyGPgIv1B0HSRujVYLy1t+ilNSE1owxLcSGdVu7pzEz9bmDme0jNQvZnIsMZeRU6y
         9+dg==
X-Forwarded-Encrypted: i=1; AJvYcCUgGnUBxTnS9+iaFM3ay9M6wxbcZLz4IV+qjWeTMw0lqgq4xCowPj6U0r0kUgsSKAz1SEuQg0/1RLlysA==@vger.kernel.org, AJvYcCV8/M4+GneOI5H500+C0AqKU0RTO5uUEhNozEYeRQ2h2hvdUhG3ejvjN6ycQGjFmk49Tp+TlVzmuBwFvp4u@vger.kernel.org, AJvYcCVCfEXLo9buKve7k1UoPkbBE10Y6vJ1IN+cg+1/5xUdrxYB1argI2hbVG8SkZFtksa7AG5JkYKM/J1s@vger.kernel.org
X-Gm-Message-State: AOJu0YyyPeCN0gb+sqWFdjMstKFBMMkkQIbO8cyZ+kwndU915PDkM33V
	Nu46grI8nK/ao/I09f5UqfuJgVbZsNiTCHTW6H5lTi6sULUdGbvFQmmtgA==
X-Google-Smtp-Source: AGHT+IF3CvqZEy6xSLwewSsAnYAFHq63eD9+RoRpgle8y7OjD5c10btdFWojGzPFdDo7uWsoI287Jw==
X-Received: by 2002:a5d:5605:0:b0:374:c25a:f580 with SMTP id ffacd0b85a97d-37a414cec7cmr2466880f8f.14.1726847117000;
        Fri, 20 Sep 2024 08:45:17 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780defdsm17772839f8f.115.2024.09.20.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:45:16 -0700 (PDT)
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
Subject: [PATCH v5 00/10] Add minimal Exynos8895 SoC and SM-G950F support
Date: Fri, 20 Sep 2024 18:44:58 +0300
Message-Id: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
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

Changes in v5:
- Removed a false a-b
- Added an r-b tag by Krzysztof Kozlowski <krzk@kernel.org>
- Ordered nodes alphabetically while keeping -gpio-bank's in front in
the exynos8895 pinctrl DT
- Sorted a few nodes and properties in the exynos8895 SoC DT

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
 .../boot/dts/exynos/exynos8895-pinctrl.dtsi   | 1094 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos8895.dtsi    |  251 ++++
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  137 +++
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   10 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |    1 +
 drivers/soc/samsung/exynos-chipid.c           |    1 +
 15 files changed, 1634 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi

-- 
2.34.1


