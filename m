Return-Path: <linux-gpio+bounces-20350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26603ABDE33
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 17:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C8B73A5A80
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 15:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69E52512FB;
	Tue, 20 May 2025 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Qkn9lUJ9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C55250C1F;
	Tue, 20 May 2025 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747753486; cv=none; b=nOBzWZ4DcW4kLhZ77Jm6OAZ2y3waSPL2qw30YY3UKhNb/v+Sk5BpiVcEvKhl9ijh2ZTCwkPbAiZt4Uq4QsMVuMu36A+ZqoOWY8AUpbRXmrme3PpMVVkok0BiVL+ISWszlu/lw6jE2pC+ix86VTXWn4zVIE9RMq7gNAlNRHz9cu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747753486; c=relaxed/simple;
	bh=WRMjvzS1b1sNFIk4cQt1K9KiZaTdWTOBfeZdgt7ZezA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VGouF2k7CkyPDlTQHEK9bWnsUTwSyj+/szVV+kr7wOmGMC7mcjp02KXvrYlczR3C5tHmJi3NbO5+s67LucUIqNWHJDH00cP2LuAkVJmniD1KXxW6yeMBtJXkEbEpDOZgpfC3NYzcNCob8rvrU9D2pb0I2gEolcXCOjRl0/K2vYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Qkn9lUJ9; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KD0WJa009394;
	Tue, 20 May 2025 17:04:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=tWA7zfIJL8NOL8PgFDUk3K
	GRBtuH2ewpE9P64TjssUg=; b=Qkn9lUJ9qezBGTlonCPfE+5j9jeX/mIKuOGXfc
	9DoXsBxyGO/Xpf8lHgAooic9/wbYDQXAci8St94t1mQz9gE96WD8s/rH6EqvFpt1
	ju58Pt8HLZzTMCk1fhiHT/zJiIGENN5RQyxK9vl9VMXgRkOvjNqOU8PIVRMzEyiC
	6O9KxgAx3YqbEqh2ADt4WMM1xH/VlBy4hI1zQkvSaeCH6KojFU15wDrkXQfj6xst
	vXmkPyAc1eM8/q/Caa/46J/GP9G26N41oG8xwmIP1kX/Y6FZA0GRaf98xj15pcWN
	AOhQC9JrdXMlZeCGFKGCwv+XhMfbUsRI8MtDOnndh6MOPBpg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfvke9h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 17:04:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 52F5040053;
	Tue, 20 May 2025 17:03:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1DA2B20848;
	Tue, 20 May 2025 17:02:31 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 17:02:31 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH v2 0/8] Introduce HDP support for STM32MP platforms
Date: Tue, 20 May 2025 17:02:27 +0200
Message-ID: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIOZLGgC/1XMQQ6DIBCF4auYWReDo5jYVe/RuCAwFhaKYShpY
 7h7qUkXXf4ved8BTNETw7U5IFL27MNWAy8NGKe3BwlvawNKVBJxEM7u4rlziqRXMSKSsrob9LR
 AveyRFv86uftc23lOIb5PPXff9Qepfyh3QorJymEyo+p7qW9LYG45tSasMJdSPpWS/xOqAAAA
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
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01

This patch series introduces the Hardware Debug Port (HDP) support for
STM32MP platforms.

It includes the addition of device tree bindings, the HDP driver,
and updates to the device tree files for STM32MP13, STM32MP15,
and STM32MP25 SoCs.
The series also updates the MAINTAINERS file to include myself as the
maintainer for the STM32 HDP driver and adds the necessary
pinmux configurations for HDP pins on STM32MP157C-DK2 as example.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
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
      MAINTAINERS: Add Clément Le Goffic as STM32 HDP maintainer
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
      ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinctrl node
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 board

 .../bindings/pinctrl/st,stm32-pinctrl-hdp.yaml     | 188 ++++++
 MAINTAINERS                                        |   6 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   6 +
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi        |  25 +
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   7 +
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   6 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   7 +
 drivers/pinctrl/stm32/Kconfig                      |  14 +
 drivers/pinctrl/stm32/Makefile                     |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          | 736 +++++++++++++++++++++
 10 files changed, 996 insertions(+)
---
base-commit: 09fac5c576bbff764dddf2baca0038b359376fd8
change-id: 20250224-hdp-upstream-622e5da14a9f

Best regards,
-- 
Clément Le Goffic <clement.legoffic@foss.st.com>


