Return-Path: <linux-gpio+bounces-16537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17883A4383C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 09:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6D783B2B57
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 08:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DDA261574;
	Tue, 25 Feb 2025 08:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="wokAmkmN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7206C25EF9C;
	Tue, 25 Feb 2025 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473537; cv=none; b=dJ81k+6ytQCrZODT8hrW5TQqVYeAYNlcXI94n4vpnlUFcZ+MuGODljQRL2H/CvgUaLxvrjBujJkFa0LkOTZwuhwpsaNeuQZDTIFI1CUsReRTBGHyusnEwuAzHzTL+Nyh/5TO0QyQmBu7SWQI/4BLDn62TL1kmF9xxU20l1J/l3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473537; c=relaxed/simple;
	bh=yNnxrxmeT0tzlxDl2G//TdoPZleuNF92l8GJUkb7+yU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ICF+ZkPJCq5yJPCG+X7hE/NxTGyrQoeCOhz+Qycy1Ht7F1pvRCJSlut9Ok51K/nnTlzv8mzm877KAR3ykHjEpddz88O2EhBdgF1dYnXcMosBtvtxYsuj1WYgEiu/wlPDgcsE91KntE513hvFL8ZPEhnK7mr5XpXdpSvTkMyo748=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=wokAmkmN; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7nJ8V022886;
	Tue, 25 Feb 2025 09:51:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=hJp37HjRsS682VOG5jU/XH
	JBc6aQu3148SnFqqYYIJs=; b=wokAmkmNpW2iVOAoTyplt01g7lc3I6lK1JoBYv
	5ukC+rWeH/OUKA6tcVveTCTqohwD+FQFBxAkroO50xd2+xp0tgbVg6tQ6myJn/N0
	lyeL7PeVQ5dIents9G6bl8VMQNSS3W2sEtSMWsGEzEDgl7x5f6nt9ah/SsJlpXns
	63rWLs+63cui536rbOoI88B+z8kP4s04Dbve5AZyBVMk5XyysyfsDqnPvlXYI6Ht
	e+3tErD9obpGTVFpMaSTFKHn8A6FwIcBSjRvMW2/FrWmtbB4hT0TYhE5FwM5nXiH
	+DXxQKzkHArsgWBkg7zKoteVc4BkmtduikXKly5OvKPtR8TA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp1td1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 09:51:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1BA7B40056;
	Tue, 25 Feb 2025 09:50:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 06FFC479F61;
	Tue, 25 Feb 2025 09:48:06 +0100 (CET)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:48:05 +0100
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH 0/9] Introduce HDP support for STM32MP platforms
Date: Tue, 25 Feb 2025 09:47:59 +0100
Message-ID: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL+DvWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMT3YyUAt3SguKSotTEXF0zI6NU05REQ5NEyzQloJaCotS0zAqwcdG
 xtbUAc+Fd+l4AAAA=
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
X-Mailer: b4 0.15-dev-42535
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01

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
Clément Le Goffic (9):
      dt-bindings: pinctrl: stm32: Add HDP includes for stm32mp platforms
      dt-bindings: pinctrl: stm32: Introduce HDP
      pinctrl: stm32: Introduce HDP driver
      MAINTAINERS: Add Clément Le Goffic as STM32 HDP maintainer
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
      ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinctrl node
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 board

 .../bindings/pinctrl/st,stm32-pinctrl-hdp.yaml     |  72 +++++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   7 +
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi        |  26 ++
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   7 +
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   6 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   7 +
 drivers/pinctrl/stm32/Kconfig                      |  14 +
 drivers/pinctrl/stm32/Makefile                     |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          | 301 +++++++++++++++++++++
 include/dt-bindings/pinctrl/stm32mp13-hdp.h        | 130 +++++++++
 include/dt-bindings/pinctrl/stm32mp15-hdp.h        | 116 ++++++++
 include/dt-bindings/pinctrl/stm32mp25-hdp.h        | 144 ++++++++++
 13 files changed, 838 insertions(+)
---
base-commit: d01895c5b11849113e70f012d9d142f1d88852f0
change-id: 20250224-hdp-upstream-622e5da14a9f

Best regards,
-- 
Clément Le Goffic <clement.legoffic@foss.st.com>


