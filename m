Return-Path: <linux-gpio+bounces-11759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CED9AB30E
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 18:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F6C61C2281A
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 16:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659771AD9ED;
	Tue, 22 Oct 2024 15:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="j1Dlhm8l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC221A3AAD;
	Tue, 22 Oct 2024 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612785; cv=none; b=LciU1OrwIdyE++LP+zuSHyJfhWpPG17xp0Eq4ijExMX+YIGCBNM2YwgZECLBm6KDlohRCYdwy1/3Aj6TA1VVlqt/VuREahF8iOF8lI/iUeXZzsk8JWrxClYQAkHV4kDimK3KDAGgQMJ6sJR0DPvb8rKtHcbL/0H6ADUwuWrLp3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612785; c=relaxed/simple;
	bh=ewytY9HxHvUWX6XTcYqjtATx26xPNqTacLGjbA/Zt88=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n+ByClDq4xOZVB0yiTCtPCfNls6l/FSoxh3wjMvDv7GgWQY/9ficGQbufRA+Erpg9z8g+qiDU7N/oXiacTpk1gbgkQv872a893WmEJ0orhh7U3QeXDft7Kf14sn+DdOM+puldpIFdCo35IbfLLSmcBJv7kcXTPuvvWzLYDNiov4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=j1Dlhm8l; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBW0Se024761;
	Tue, 22 Oct 2024 17:59:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=RtDggdY2iW+robAFxHqAEs
	sSQfrLj5YNuaQVcXG5m80=; b=j1Dlhm8lgIJT3NwzUPHpY72H4qB/AH6b8RHHrK
	IXIC4lrTjmirBYpFI5/GKng/oDBWFKUgam9jgKgc4UipdsxnA3MIxaviAo0J460S
	4LWhcxtqPRd5UQlCklx6h5YJu+ajWUOx5eCyLCQpOoz6fG4L8inaR/nGg8ZkRZML
	w9+ray9EZaqvhqijL9/cFlO0I3kkCrUsg0rrNuTnexmis6WzsZ9w8NLXzJ5XO/zn
	ErZi53zTWJa33ukr+CepqVYHzk1Ai0S02HeMMnF75UYWa9rE82GPOApqhDyB3rSk
	zaeE3inRr50S8QoFMM2P5TNFJtinl0dKmuW4LRajc/s7oL9Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42c7316cmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 17:59:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BB6894004F;
	Tue, 22 Oct 2024 17:58:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B654C26D665;
	Tue, 22 Oct 2024 17:57:16 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:16 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        <linux-kernel@vger.kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        Stephane Danieau
	<stephane.danieau@foss.st.com>,
        Amelie Delaunay
	<amelie.delaunay@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Cheick Traore <cheick.traore@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH 00/14] pinctrl: stm32: Add new features and support for more SoC
Date: Tue, 22 Oct 2024 17:56:44 +0200
Message-ID: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

This series introduces the support for the new SoC
- STM32MP215,
- STM32MP235,

by adding the support for the new functionalities
- irq affinity,
- Resource Isolation Framework (RIF),
- Reserved (RSVD) pinmux function,
- IO synchronization parameters,
- compile the driver as module.

Some minor code reorganization is also introduced.

Regards,
Antonio Borneo


Amelie Delaunay (2):
  pinctrl: stm32: Add stm32mp215 pinctrl support
  dt-bindings: pinctrl: stm32: support for stm32mp215 and additional
    packages

Antonio Borneo (4):
  pinctrl: stm32: Declare stm32_pmx_get_mode() as static
  pinctrl: stm32: Rework stm32_pconf_parse_conf()
  pinctrl: stm32: Add RIF support for stm32mp257
  dt-bindings: pinctrl: stm32: add support for stm32mp235

Cheick Traore (1):
  pinctrl: stm32: Manage irq affinity settings

Clément Le Goffic (2):
  pinctrl: stm32: Add stm32mp235 pinctrl support
  pinctrl: stm32: Add new package to stm32mp257 pinctrl support

Fabien Dessenne (4):
  pinctrl: stm32: Handle RSVD pin configuration
  dt-bindings: pinctrl: stm32: add RSVD mux function
  pinctrl: stm32: Support IO synchronization parameters
  dt-bindings: pinctrl: stm32: support IO synchronization parameters

Stephane Danieau (1):
  pinctrl: stm32: Allow compile as module for stm32mp257

 .../bindings/pinctrl/st,stm32-pinctrl.yaml    |   62 +-
 arch/arm64/Kconfig.platforms                  |    1 -
 drivers/pinctrl/stm32/Kconfig                 |   18 +-
 drivers/pinctrl/stm32/Makefile                |    2 +
 drivers/pinctrl/stm32/pinctrl-stm32.c         |  365 +++-
 drivers/pinctrl/stm32/pinctrl-stm32.h         |   27 +-
 drivers/pinctrl/stm32/pinctrl-stm32mp215.c    | 1807 ++++++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32mp235.c    | 1906 +++++++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c    |  305 +--
 include/dt-bindings/pinctrl/stm32-pinfunc.h   |    4 +
 10 files changed, 4326 insertions(+), 171 deletions(-)
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32mp215.c
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32mp235.c


base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
-- 
2.34.1


