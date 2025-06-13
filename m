Return-Path: <linux-gpio+bounces-21521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A142AD893E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 12:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C273E17F4DF
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 10:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85332DFA3A;
	Fri, 13 Jun 2025 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="rAsTWTmr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654452D5404;
	Fri, 13 Jun 2025 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809793; cv=none; b=EHyw5SpttR/yrWURbW/tsIk6Zrp06bzteCSeiWgmvpuOvPq0O0/VbGHn8IrTYIMdqHyA7OumMfrekb8V7AEkLBcyY8ecfVJpi0/ePJZH/UVK/VXOMwx7WLrivjyuo+GcotXMftR1SUJHhep+yvwUSkaLfR3W4YktXb3jYVGTG1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809793; c=relaxed/simple;
	bh=daFc3JaOmdVeYKdpK6FyJLmMkdUpoztgupw4pCqyMnc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=uuSkTFuIDO7DX3B2tHAJkGBfTSNeZfT81oueXBBOnziP2T25Z6P+lbuouaMrpORAbJAXHF2TOELNCx2ZYRRYF8T5CG5moemOYQTDpR2KA2n7ELt8BxilRfZdRkB8PZqFSaxwWF74ls+VYVZfm7CGVKz6XcjsS2ACdC16cssEr0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=rAsTWTmr; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D6TVYs004645;
	Fri, 13 Jun 2025 12:16:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=D6+Z27WjMKMnjNKepyIzix
	r0wCa33K4TQT/u8u13GqU=; b=rAsTWTmr7pLh7CIqwhfI6jjXqO/MgHq0VvP9oM
	g9HCW88TkQ8GOmL+a6w8Qp4mWpWzEwHsNlTuvAehlb2AA2Vf2zE11zs3wWGFsKGl
	dvurqJ7iSGwF9RCRDPjlO5bKOdumZsXFcHObvDyoDalEDpullg/gd1TPiqapvh2o
	Pgp/jzpCzz3ydT7DGFQpd0RDfLtlkApVlzXpUdeTAQLYZHe7ZwnZfxJyC7M+/Qoh
	lYbf8K2esKiBY7s7ZOpSdZiS+/5QW4PsY/81gMT3Npb6/dc4vnNs9ONjcuRW6bz3
	wrwsH/DcQk/Gt+IaJLRPAnfnEPNG4c8gekjqzlQuQZQJ3gyw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs356a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 12:16:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C602040052;
	Fri, 13 Jun 2025 12:15:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5FA932F6D5F;
	Fri, 13 Jun 2025 12:14:17 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 12:14:17 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
Date: Fri, 13 Jun 2025 12:14:11 +0200
Message-ID: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPT5S2gC/23NSw6CMBSF4a2Qji0ptw+pI/dhHJQ+pAOEtEg0h
 L1bSIyADs9Nvv+OKNrgbUSnbETBDj769p4GP2RI1+p+s9ibtBEQ4ASA4dp0+NHFPljVYAFguVE
 FU9KhRLpgnX8uucs17drHvg2vpT4U8/UT4tvQUGCCpSFMasEpJers2hjz2Oe6bdCcGuDLOZAdh
 8Q5daIqK+6cLn85XXO64zTxygitCimZEH++szUvd5wlfrSyosoAocJs+TRNbxUXAFhnAQAA
X-Change-ID: 20250224-hdp-upstream-622e5da14a9f
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0537a
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01

This patch series introduces the Hardware Debug Port (HDP) support for
STM32MP platforms.

It includes updates to the mmio gpio driver, the addition of device tree
bindings, the HDP driver, and updates to the device tree files for
STM32MP13, STM32MP15,
and STM32MP25 SoCs.
The series also updates the MAINTAINERS file to include myself as the
maintainer for the STM32 HDP driver and adds the necessary
pinmux configurations for HDP pins on STM32MP157C-DK2 as example.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
Changes in v5:
- (Better) Change the bindings file name:
  's/st,stm32-pinctrl-hdp.yaml/st,stm32-hdp.yaml/g'
- Remove Krzysztof Kozlowski's 'Reviewed-by' trailer on bindings.
- Add Linus Walleij's 'Reviewed-by' trailers.
- Refine SoC dtsi patch's commit message to explain the need of keeping
  the HDP node disabled.
- Link to v4: https://lore.kernel.org/r/20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com

Changes in v4:
- 's/Add/add/g' in MAINTAINERS commit message.
- Fix the (wrong) status update for the thermal node in stm32mp131.dtsi
  file.
- Do not enable HDP by default during compile testing.
- Change the bindings file name:
  's/st,stm32-pinctrl-hdp.yaml/st,stm32-hdp.yaml/g'
- Add Krzysztof Kozlowski's 'Reviewd-by' trailer on bindings.
- Link to v3: https://lore.kernel.org/r/20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com

Changes in v3:
- Use `bgpio_init()` function:
    - Add add patch to create the `BGPIOF_NO_INPUT` flag needed for the
     `bgpio_setup_direction()` used in `bgpio_init()`
    - Remove `stm32_hdp_gpio_get` and `stm32_hdp_gpio_set`
- Use `static` pm ops
- Update bindings:
    - add pattern instruction for pin values
    - remove function's maxItems to use `function: true`
    - fix the compatible in the exemples
- Link to v2: https://lore.kernel.org/r/20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com

Changes in v2:
- Remove bindings header files with function name as #define
- Add match_data with function name for three compatible:
  "st,stm32mp131-hdp", "st,stm32mp151-hdp" and "st,stm32mp251-hdp".
- Rework a bit the driver to use match_data.
- Remove the use of `dev_err_probe(` in the resume ops.
- Remove `MODULE_ALIAS(`.
- Remove the vertical bar in bindings description paragraph.
- Fix an error in the `pinctrl-0` parameter of the binding example, it
  was refering a node that wasn't existing.
- Use uppercase pin names.
- Link to v1: https://lore.kernel.org/r/20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com

---
Clément Le Goffic (9):
      gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
      dt-bindings: pinctrl: stm32: Introduce HDP
      pinctrl: stm32: Introduce HDP driver
      MAINTAINERS: add Clément Le Goffic as STM32 HDP maintainer
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
      ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinctrl node
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 board

 .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  | 187 ++++++
 MAINTAINERS                                        |   6 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   7 +
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi        |  25 +
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   7 +
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   6 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   7 +
 drivers/gpio/gpio-mmio.c                           |  11 +-
 drivers/pinctrl/stm32/Kconfig                      |  14 +
 drivers/pinctrl/stm32/Makefile                     |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          | 720 +++++++++++++++++++++
 include/linux/gpio/driver.h                        |   1 +
 12 files changed, 991 insertions(+), 1 deletion(-)
---
base-commit: 24b0277c1c539cd41539d9297baafc62df04464a
change-id: 20250224-hdp-upstream-622e5da14a9f

Best regards,
--  
Clément Le Goffic <clement.legoffic@foss.st.com>


