Return-Path: <linux-gpio+bounces-21247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4E5AD3D0D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 17:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B7851BA23A7
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DFF4244665;
	Tue, 10 Jun 2025 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="wYYLTwM3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868E923BCEF;
	Tue, 10 Jun 2025 15:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568834; cv=none; b=kfSML/LjkX8jCMD+Zr0fD0aEhkh72DIyfN3hqgI5hx5N4dsyypNqNHROKTautz8ykvvoIe0/6rXg/kb1ol7o5FOVAGDhwhP3N424ldr5ycYmkHPvbL0EUhWUTGTC85CP7jWv+ryVZl0kIo3nVb/kg9JGUvkR4BFuH2Vt4cv7B0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568834; c=relaxed/simple;
	bh=6CTIG54ldEtBHRVvsF1cC3SKsD3cwAiQewve9PGFX/A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dx/sxxEVbcdxBsUXg4vZhrlP0cHwhRhxNamB8s2m56lLCOhRC6+IdH92ZJR7mAWIwD55me5+psKBDi8Nn1c+0byM9KUcTjkadSgkU3Z5l/V7EMN2H6rYno2JhBrZIkk1H9J6ud60tXGSrRSkNdXOD3sbAIrVIhviB1cd+pXoM8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=wYYLTwM3; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLCla032162;
	Tue, 10 Jun 2025 17:20:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=Mmod6GyCvN+xKlhUHyHmJv
	0MBU3r0IJh4g+WMqECjq0=; b=wYYLTwM3L6iIUCZS1+O47DnT0JkqnRBQs8N65t
	Jfi6VIeQ+/uqzBwuXX6D0HmqlPF2kOSodqn22MXTD9ciWwL4Ad+QWixdo6J/cXR5
	ylcswSsjRIFnH6aXlBTs5zfib4lYDUk73yMDhGrCZ45tBKUkDUJzUqCOapQMeyny
	kHsV8Nnkd7SlNfnurpE0SmZ+hcKrQtcPXInzdV1KTR25uH/Ledhek6TIq30szpvy
	e5SqWOqLKqzqVIuDEc5H8pQ0nIrqUu+H0sgQS0zsbOcsNWZp9iRJN9sZ3/57p2dd
	Z4u2knkBQ/Hjhs0yfA61NYcoNbmdDqSuMKOaWMfCdUJ49dkA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4750cntpqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:20:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 01D3240044;
	Tue, 10 Jun 2025 17:19:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAC0DB7450D;
	Tue, 10 Jun 2025 17:18:41 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:18:41 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/5] STM32
Date: Tue, 10 Jun 2025 17:18:32 +0200
Message-ID: <20250610151837.299244-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01

This v2 is a subset of the v1, split-out to simplify the review.

This subset:
- introduces the pinctrl mux function RSVD,
- adds two use cases requiring RSVD,
- minor re-format of the dt-bindings.

Changes v1 -> v2 subset:
- rebased on v6.16-rc1,
- added use cases of the new mux function RSVD,
- added Reviewed-by: on 2/5 (former 04/14 in v1),
- added commit to re-format the dt-bindings,
- Link to v1: https://lore.kernel.org/lkml/20241022155658.1647350-1-antonio.borneo@foss.st.com/


Antonio Borneo (3):
  ARM: dts: stm32: Add pinmux for CM4 leds pins
  ARM: dts: stm32: Add leds for CM4 on stm32mp15xx-ed1 and
    stm32mp15xx-dkx
  dt-bindings: pinctrl: stm32: Add missing blank lines

Fabien Dessenne (2):
  pinctrl: stm32: Handle RSVD pin configuration
  dt-bindings: pinctrl: stm32: Add RSVD mux function

 .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 25 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 14 +++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts      |  2 ++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi     |  2 ++
 drivers/pinctrl/stm32/pinctrl-stm32.c         |  9 +++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h         |  3 ++-
 include/dt-bindings/pinctrl/stm32-pinfunc.h   |  1 +
 7 files changed, 55 insertions(+), 1 deletion(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.34.1


