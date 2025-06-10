Return-Path: <linux-gpio+bounces-21225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8284CAD3B32
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4E893A6B14
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E728C1E47B7;
	Tue, 10 Jun 2025 14:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="shhGGg9f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1E51624E5;
	Tue, 10 Jun 2025 14:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749565981; cv=none; b=XVb5thyzsnyIZH8BD0EkKjXiNTQt1PxblApip2mLFk4Oodrt5x4d5D25NCJAOnaaHEu9BJ3v8XzgJkls/Zpn7vaL7TjeoPUeuzEiG2Iq9WjbmrPX3GFhY2RRiHxsbFY7FCMfT0lSG7r8tcQ0BD31ypIsYA7ofSwYTKey01aIEnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749565981; c=relaxed/simple;
	bh=Lxk5LAvzQZMC2JesfaTl3VoldatBdsx2TM4wrlAB+8Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EqB7YqwU4e+QsraW/eITnxGvEKtN+F9HoPP08f07RjId1CCopi6suYaKx/h4MV2tETAOWvIbz/A5/ofZM+qgrzyzwsEcuBhlED1EGo/bMJOYUe6J3SE5P4sxGmcRKAdIfPVw1kex9PqGlMEaqntS6D0yGgqyitTzRbDrysVE1n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=shhGGg9f; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLEan013925;
	Tue, 10 Jun 2025 16:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=xDfYRyarrgvvh2wy//yUSD
	fOPipUMyzMYfOpAjRJTT4=; b=shhGGg9fg6nZp0bUBgZ6LA4w/T2bgVnrGKl7My
	Jcz/lZxX7qoPiLbSYEdRNYhZfUm+tCbcw4eiC9To21hJ8fGTou131GXJKLV4369I
	Qh2G0li0wZQhqJ/wKsDEHzf/nCedmOtH7cpFDmYV8Eh9MGQQQYSoJgLav3TcPBdx
	v4oh9cAiuDKx1PUyP3yFylItiVPrUQR75Qg0GQ/FfY5JmoC0gq/80aCaqR1KNtD5
	Dsiz06ANiJWCNuXoMINxlYLT0zYM+kT9u4hVTrZdUPlxzQgeviibbhfT8TnWTAqp
	vFbN7tSOD/H4k3mWGeg8zzJBYUHkcj5eNGjBgMDRDraVoj0Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahmnmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 16:32:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 588874005F;
	Tue, 10 Jun 2025 16:31:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34C16B36E48;
	Tue, 10 Jun 2025 16:30:46 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 16:30:45 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 0/5] pinctrl: stm32: add irq affinity, RIF, module support
Date: Tue, 10 Jun 2025 16:30:37 +0200
Message-ID: <20250610143042.295376-1-antonio.borneo@foss.st.com>
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
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01

This v2 is a subset of the v1, split-out to simplify the review.

This subset:
- adds support for irq affinity,
- adds support for Resource Isolation Framework (RIF),
- allows compile the driver as module,
- adds entry in MAINTAINERS for STM32 pinctrl,
- minor cleanups.

Please notice that the entry in MAINTAINERS already excludes the pinctrl
driver HDP that has a different maintainer but it's still under review in
https://lore.kernel.org/lkml/20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com/

Changes v1 -> v2 subset:
- rebased on v6.16-rc1,
- added include export.h required by v6.16-rc1,
- change in Kconfig to avoid default build on COMPILE_TEST,
- added entry in MAINTAINERS,
- Link to v1: https://lore.kernel.org/lkml/20241022155658.1647350-1-antonio.borneo@foss.st.com/


Antonio Borneo (3):
  pinctrl: stm32: Declare stm32_pmx_get_mode() as static
  pinctrl: stm32: Add RIF support for stm32mp257
  MAINTAINERS: Add entry for STM32 pinctrl drivers and documentation

Cheick Traore (1):
  pinctrl: stm32: Manage irq affinity settings

Stephane Danieau (1):
  pinctrl: stm32: Allow compile as module for stm32mp257

 MAINTAINERS                                |   8 ++
 arch/arm64/Kconfig.platforms               |   1 -
 drivers/pinctrl/stm32/Kconfig              |   6 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c      | 135 ++++++++++++++++++++-
 drivers/pinctrl/stm32/pinctrl-stm32.h      |  19 ++-
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c |  15 ++-
 6 files changed, 168 insertions(+), 16 deletions(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.34.1


