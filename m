Return-Path: <linux-gpio+bounces-9639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEA3969E0E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D71D1C2379C
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 12:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947F91DA0F8;
	Tue,  3 Sep 2024 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Er9vP4M5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873181DA0EA;
	Tue,  3 Sep 2024 12:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367478; cv=none; b=dqtO8UZjJL4Lf2dXov4oyDM/Ly6nUpN+Da7nzEz0xIxTNhB6VJ8gqG3QjBRjxyr9ZXwAyJWV7dbdH5pqgI5DbOjubJqGyzIhFttXLmfe4D+5z+h2t95MjEjy/KuWo4fG3heBZQw/cQRGa4J30sQrZvovpzf75x0lRrD/twQjo0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367478; c=relaxed/simple;
	bh=qUtXJph8qZjn+7XHcTJWKiaMVEwXxe1JAhSn6JIAUUc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FTyuRsbk0NGj1x6R8q9OtkH+a/7bk49G8M6Xva7EJtSmch1s8dl9xIQjzLDqIZykT8n896TvPx+VZyxvcnsGSM0YCpiWxvoocNZOuDxqlDYkwjbq/XE9uVOZ5U5UGYsEuQd46lfKS2mUlA1eu/vGWgckn2rrTyGTm2Q3WRzzHfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Er9vP4M5; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f64cc05564so4072781fa.2;
        Tue, 03 Sep 2024 05:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725367474; x=1725972274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgkDQVqqpqM/7rIKM8lNzpnvUTjBvuyv/QF1pVVzc5A=;
        b=Er9vP4M5gxDIA/P2r/O99e7V75ik7KWEzemwiseYwXW3ShxAgPkuaw1RU61tNL5Ppj
         qRpX9Rc5S6Rm2AsGaaMzUSejSXPftUvxogVPfLZ7JFA5Dodm3TSPHkSvhgjIqb1p6G6U
         JVq7ub2rIl0AnLpvEbMVqkY8+Yppa7yYHr/eJlG902kDy+Twiq+hRLY3IqSQbYIpvskh
         RImjA251vEa033QPjB70avm3qmU0x8AkGfFc98W1jiW/zFngyNpWI8kbC7eRdDMLS6Ue
         p8nu8D1Z945QlHe0O007yI1Fqx4dtOcIxj6ZBIeL2NM2wdT9i8C5uHXeoTlUmLnhfgUV
         rchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725367474; x=1725972274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgkDQVqqpqM/7rIKM8lNzpnvUTjBvuyv/QF1pVVzc5A=;
        b=KTQRHhFIpYOUANZYvZ8PromvAyQZT1Mje9yyakWA7lBsOq2DtMeEL3N65qGqtDZtKc
         UCdwd5RBQAOkHs4r/nunxNBpVbVRHkQWCWWojSUxe8fxqyF+xm6OK8vksX9T72gJaZZZ
         sRSQ5hmIFGepbMKKKy2q6P7NhfpKCmL78GiuVlTOhpyo7E6WT+FXz2NXYbnKETGl5Bch
         S+HR4/RJ6GXsKwCuHhLXiudyKrmah35YHrhGv+Wl3XZt3qyqLeUGh18mR5cVQNd4tW1Q
         fNgl4iMRt5xzbuk679z0nrpwKvhZ9v5sVtT9NkudzXy23Lvw2d8YQKaBwfIPP0Z2CpyT
         zQHA==
X-Forwarded-Encrypted: i=1; AJvYcCULBFFV7+24bfbFtLjuKuVcH+RwHIfNUnrgOns921CtpalU+XQ6pYBA6VXoyFXsMDDNv9quE/PDgpsenj3d@vger.kernel.org, AJvYcCVSPoQTuJhlgWHMl7HjQIOrIJldKHzozJGD/ZqZHmI23wwbqAOTlUjXxPKjqtPweAgK+1NtmDl4RPQX@vger.kernel.org, AJvYcCWm19whmtxwcXXCrgG4Td3AkewasyiL8Pg+3AYGP5FB9ksS9W2b3JvqkSU/9QQSIcSjnTECa+45CC9DKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHQ1KxrnGKkHSS+TBdw8vcw9ybEnZW91RbYvbaCBs9DaWA3PBh
	cqDou8CVhD5OqICdwIk996N1Lgm6vvMoDxKGzFzr7wXeddctFaf7
X-Google-Smtp-Source: AGHT+IHnZBZyoWpXQq7i6S+0Ib3X+/OZUTzsqzt23XeDv+S1QINUlPW6j+GtnXViB0Y9i9tIfTnMww==
X-Received: by 2002:a05:6512:3511:b0:535:6033:265f with SMTP id 2adb3069b0e04-53560332dc8mr1246227e87.58.1725367474047;
        Tue, 03 Sep 2024 05:44:34 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989223199sm678461566b.219.2024.09.03.05.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 05:44:33 -0700 (PDT)
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
Subject: [PATCH v3 00/10] Add minimal Exynos8895 SoC and SM-G950F support
Date: Tue,  3 Sep 2024 15:44:19 +0300
Message-Id: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
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


