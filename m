Return-Path: <linux-gpio+bounces-8612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C341A94A397
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BE8C282284
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194861C9ED8;
	Wed,  7 Aug 2024 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/szeVwM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B13223CE;
	Wed,  7 Aug 2024 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021754; cv=none; b=FdHYyXSx/nuIP7P6xG3MJWi5ANW7myUiJW2Zcb+i2eLOFwlVBunp0DdQQUXlkjXkfV7Dr+SVvSgpGO+0So3JOdLMa6nnoN6Ixdp95DsSUJddxc36XrUGb16zmtjeXfpeaF+yShS1RWbVN/M64uTGLzyiuBFYIX5tNKNGK+C+A2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021754; c=relaxed/simple;
	bh=Ubx1PmX5T0LbjQdU/nyoIOLX5QNgCWAhvSJSiiP9Qv8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BXoRER7f+GYCWOaCH+dR09DoHm5HHXSo/DfqW1AMWJp5uT+1PaoTXMfOCiEevXPUwYnBfPUcAJq1GFHHKS0HeTaK/X+Qf8aPvUUQFZse8ZFoZvn9N80Xc8/AfGX2qTUSL6aT26LJLyf16zXRxuZS5c1eCFphTtOvuRJgm6ddBFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/szeVwM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso10418005e9.1;
        Wed, 07 Aug 2024 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723021751; x=1723626551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NGCJ0rLgyZcGwsYVM6NICsTItaF4blq1lnqTK5KCEU4=;
        b=j/szeVwMBZRskO0Z/WP8zFi3qMhXed6ANFUkas1phvrvcOGRTHNTmf9kM1kWxS5Pg/
         HtP1RdT31EVsiG03ZGxKtm6sTK+fMtx6NtmkzR2QmSrbNizfJaAav8zRsCAxCf7T1CNo
         WrBejL7qLdOb8oh3cjl2VELHRhKCmapUaCoz7OPocjEUf0//NWlPHme9KTJet1/7jued
         ZqjB5ClqybsaArElC1xEFDyQ0qD1BMutvrn7IcmdXcpJs8e9TNQlqrOTO2uN2AFzjrRu
         pBv9P9vuiA6DmPOYYQ2BXqd9jFwkmfzPgC8NbmsW43WTPNGupvspWwOMBl4jSuRPoLR5
         Ybgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021751; x=1723626551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGCJ0rLgyZcGwsYVM6NICsTItaF4blq1lnqTK5KCEU4=;
        b=QmIUPWySRTQD6V5sBiQhfwB4yXApkAn8Dj3FUpVRV7TaF+6t7Fx0fRpe4HlxHzBej/
         ue6Lp/QSsLUoU1XK6dEWPxRV6DCwojTGbKndJNCfiCXeGKmR1n2bGp4kTfgaK7Qq3mbJ
         xyXMknSrLP6z3Ija9IDX+R2mkhzhuZUi30MrHIcl4UN1ykx66Kg0hTf/0wk8hwkfCChy
         Z9Upl5m2Unsu9yK13MQXfpLHDUxgOfW79y11rMAGLlWcz3QYrUvqJECi1RWQ2dnA1cKE
         k7sP9hUkC8hHnH2jgFSKc/t2foi4CWWRVaqU9HHeaoUGKjfeaCMVjZI224d021cLsU6S
         CC3w==
X-Forwarded-Encrypted: i=1; AJvYcCVJhTcbchIpXIxcS5ha7gY0it4jIlsjCtddkeLPK0xEVvXNwQY2gGs3bYF1Z7LZ5MXyrI71RKGUPVpaqw1QFy4ELo941C/5BmxqstOKs7eHkT6ckRZvKSUuvU/7q+Hrw/eNYROZ1gc4juRi99wJLCW3wkyJzBI+olJ7PD2r18CuDMBWfcM=
X-Gm-Message-State: AOJu0Yxaz2ZFdufzyLXDAEpsO2Xhq6rjWWjpJG9CPwy4F8+fNWaIqCCe
	V7p5MhV9gCy2P69PTu2AC95J11Qa/H/GbXpIkvIJpWkAYUDKO/Kp
X-Google-Smtp-Source: AGHT+IEWLvu9nmdlJKDwe5++PzaE3LD74m8FwOOly7td2JyuphWfWMAWrP9J446nE5JRNDnkLFhGDQ==
X-Received: by 2002:a05:600c:350a:b0:428:1eff:78ec with SMTP id 5b1f17b1804b1-428e6b2f2c0mr139636935e9.18.1723021751230;
        Wed, 07 Aug 2024 02:09:11 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905801d37sm19860455e9.31.2024.08.07.02.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:09:10 -0700 (PDT)
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
Subject: [PATCH v2 00/10] Add minimal Exynos8895 SoC and SM-G950F support
Date: Wed,  7 Aug 2024 12:08:48 +0300
Message-Id: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
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

When sending out the V1 series it turned out that I had sendemail.from
enabled for some reason. I'm really sorry for the inconvenience caused by
that.

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


