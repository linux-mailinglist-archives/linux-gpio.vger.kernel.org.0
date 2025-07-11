Return-Path: <linux-gpio+bounces-23128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D4AB01509
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 09:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A52C188AF83
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 07:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211851F1534;
	Fri, 11 Jul 2025 07:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gB9CGcZe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1629B201261;
	Fri, 11 Jul 2025 07:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752219845; cv=none; b=HhlrLERNp/QxPf7V3Q3K9+VLofZwssztBzQxLEbQAgWzPeZg0VEgcJgvzI208Jnlu9KNEBemDvzzhAYcaSxm2fWS15JDSzZPEGS5x60M26LPF4A3gWuJ02mFHX6MKGTzyFdUiTvF8gzKd+UbWK3uKjE1oV1K0KJG4ILi4ctD8tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752219845; c=relaxed/simple;
	bh=RqAMnhLxjpNB5sDmK3hLlBYA06SudtRiECgXqCitt8k=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=I74TZVK+Kw+0wtmMLIrCjBJlBKvvkBNSAy28ByFEZOXIcGNHBrUMJCiX9LTPQ5RVbaimzgr4+cNaOgZFBe4f8dIxkhxYFR7sr/vRdIhizx9a+oFJ2egL/Hw5Zgdfxf0VWK45JtCwa3bQc0IqlmWH59SdFa+BV2wLAOHVuXl56wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gB9CGcZe; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B6UUJ6017493;
	Fri, 11 Jul 2025 09:43:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=uuDTz2OBo60kJWuliEHNDZ
	ybBbmEHsHQuc3BlwbYSOw=; b=gB9CGcZe4fDDd61vM8aB8ttFHRSrOh007m2CrJ
	T+qnmotBinFSUCavbNg+7wQwZbr/BAvBNl6cEnQkSHaEyyIN9tLBsR+KFrFylifS
	K5VlL10ZyZ4C0Lb/FQMCF4o1VN5LUiJZFpXz5joJM1xADElvQUW54wNJ18lw1DWd
	39FssGb/NStr32szR4CLBkjpv1/lryKeGjAX4grcsMdU9zLrV5h2sdvtXj3iU31o
	w2yl1rq3sIjtHgk/1XJEneVm38Xz7pegEm1P+BiOmizo/xxCsqVc7JvfGJQEcux1
	NRFHxNyRM574yUFkFlnzsmR+27jtSPuAoOYThkA/uzeFtafQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47qdm6arjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:43:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7CE2E40051;
	Fri, 11 Jul 2025 09:42:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3983AE9B67;
	Fri, 11 Jul 2025 09:41:36 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 09:41:37 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH v7 0/8] Introduce HDP support for STM32MP platforms
Date: Fri, 11 Jul 2025 09:41:18 +0200
Message-ID: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB/AcGgC/23PzW6DMAzA8Vepcl6qYMeG9LT3qHYI+Rg5tCDCU
 KeKd19aaSqDHW3p93dyFzmMKWRxOtzFGOaUU38tQ/12EK6z188gky+zAAWkALTs/CC/hjyNwV4
 kAwTyttLWRFHIMIaYbs/c+aPMXcpTP34/63P12P6G6G9orqSSxittHBOisu+xz/mYp6PrL+KRm
 uHFCdSGQ+GEkdumpRhds+e45rjhWHjr2dnKGM38z3W95s2G68LrYFq0HhSy33N6ca6216lwjp6
 j8o6gdnvOK757PBeOTU1YAg2azd+XZfkBhJHY++UBAAA=
X-Change-ID: 20250224-hdp-upstream-622e5da14a9f
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio
 Borneo <antonio.borneo@foss.st.com>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-7616d
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_02,2025-07-09_01,2025-03-28_01

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
Changes in v7:
- Due to reorganisation, my contract with ST ends at the end of this month
  and I will no longer have access to this mailbox.
  Therefore, I will be available for any mission related to embedded and
  kernel linux.
  Change email address in MAINTAINERS file for STM32 HDP driver
- Link to v6: https://lore.kernel.org/r/20250623-hdp-upstream-v6-0-387536f08398@foss.st.com

Changes in v6:
- Add Krzysztof Kozlowski's 'Reviewd-by' trailer on bindings.
- Remove gpio mmio patch as taken by Bartosz Golaszewski:
  https://lore.kernel.org/all/175031700235.8154.11042956002137082224.b4-ty@linaro.org/
- Link to v5: https://lore.kernel.org/r/20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com

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
Clément Le Goffic (8):
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
 drivers/pinctrl/stm32/Kconfig                      |  14 +
 drivers/pinctrl/stm32/Makefile                     |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          | 720 +++++++++++++++++++++
 10 files changed, 980 insertions(+)
---
base-commit: 31b6d25a25ac3fe4ee6092f2bf04a816e4b5b64a
change-id: 20250224-hdp-upstream-622e5da14a9f

Best regards,
--  
Clément Le Goffic <clement.legoffic@foss.st.com>


