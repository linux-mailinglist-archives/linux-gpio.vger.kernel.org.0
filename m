Return-Path: <linux-gpio+bounces-20526-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 403D0AC22CC
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 14:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB8705418DB
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 12:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9F418641;
	Fri, 23 May 2025 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="1LipR1xB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66992DF68;
	Fri, 23 May 2025 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748004036; cv=none; b=RZbMVasoMgflTVqXs7Yf/HgQ7NzVwMIbcmdKJx1ndPuPdC0Gd395oyui/xnMfEzbF/YQRxMuQvsALqtZXy05Jk4zfWRd0sGbfgJN4O99ZDJpcsoViD6K5r6TRpNOtNBetGthcPJ0rwe1CEfPKFkLPXgcvdTSDP/0HkZNfF3WDSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748004036; c=relaxed/simple;
	bh=sA8TrAly6Qt0aAA5v1vLnwngN71dQUxehlr6vaz6YzE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=TBqEsPVBB6eJMu6Dw1P/OUgl0dWofd5WLVwPqpRur8crp7sPG5C8isTZqeYeZQiiBFLvxxJUWV5yGO1M6OYWoz29EmMS5gx9klnTMOl8AnDPP7l+E4In5mAxN8k+ad/Yt6gYkxPP3EiLvtP3P+kxh0GFGX8y/LU+dLC4WF9vYOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=1LipR1xB; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBKc2I029978;
	Fri, 23 May 2025 14:40:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=2YyhQzykqr2IukkjXY4a8d
	iTP0eWbO99O5z3m7RWB6U=; b=1LipR1xBEOhYzBdlcKyKjqBAaALvXVHak154yN
	a3rM8dGt+hVaaSYYundcEOORPxBDe1v5dGHpyQgG8kk5NF9mmGmBUd0HAhyhh/Sh
	s62yDWkrkQOENh4sme4SvcxhKQvked7n7fwOhqO4PMvC/mAVW1EJHHiOThvTo1il
	6suVWNjUG4y0WJHXhf6z/8SuJD+1j9/JI4jssRGyI+GfuCTxWVMfwlQw7B4w7sED
	w2mTF4rn4hf6CH2LOxHHEl7eYrkELMMckQHFyLPvX85u7h+IkV2rQlcZ+di8FAI3
	Cjwz3mPAAQ/BSnly9knWdIbBkIR6Gcg4okzYJ0fAOi/F9h1A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfcdxje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 14:40:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E53224002D;
	Fri, 23 May 2025 14:39:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBFDDA0D901;
	Fri, 23 May 2025 14:38:23 +0200 (CEST)
Received: from localhost (10.48.81.67) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 14:38:23 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH v3 0/9] Introduce HDP support for STM32MP platforms
Date: Fri, 23 May 2025 14:38:12 +0200
Message-ID: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADRsMGgC/13MSw6CMBSF4a2Yji0pt1wCjtyHcVD6kA6gpBcbD
 WHvFhJjcHhO8n8LIxu9JXY5LSza5MmHMQ95PjHdq/FhuTd5MxCAAqDivZn4c6I5WjXwGsCiUWW
 lWsdyMkXr/Gvnbve8e09ziO9dT+X2fiE8QqnkgrdGVK2uUUqhri4QFTQXOgxsoxL8cgTxl0POU
 bq6azp0TjfHfF3XD3UnYD3pAAAA
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
X-Mailer: b4 0.15-dev-6f78e
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01

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
      MAINTAINERS: Add Clément Le Goffic as STM32 HDP maintainer
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
      ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinctrl node
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 board

 .../bindings/pinctrl/st,stm32-pinctrl-hdp.yaml     | 187 ++++++
 MAINTAINERS                                        |   6 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   6 +
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi        |  25 +
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   7 +
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   6 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   7 +
 drivers/gpio/gpio-mmio.c                           |  11 +-
 drivers/pinctrl/stm32/Kconfig                      |  14 +
 drivers/pinctrl/stm32/Makefile                     |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          | 720 +++++++++++++++++++++
 include/linux/gpio/driver.h                        |   1 +
 12 files changed, 990 insertions(+), 1 deletion(-)
---
base-commit: a08b2b34239e63bd839078de98911d3653cdab83
change-id: 20250224-hdp-upstream-622e5da14a9f

Best regards,
-- 
Clément Le Goffic <clement.legoffic@foss.st.com>


