Return-Path: <linux-gpio+bounces-23051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED424AFF5E3
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 02:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 271051C40785
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 00:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037611FC7D9;
	Thu, 10 Jul 2025 00:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="gfikRw9z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F9F1DFD96
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 00:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752106875; cv=none; b=ZbNOjH0osE18fEvzPQfmQ1xlmIV8Od7DayoLmft2it7Np8BV0zg47dOsTq7cJ9sMWuWbDTZ2ITTPqv0xHp91dZT5WWhck9r47BU2A0r/ZAdCkKNxv76kiNXiY6rolMArAAOqEUZ0sMT6hxnFxd7ooxXLG95bM/xQhYrtZhcYfRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752106875; c=relaxed/simple;
	bh=lEO9lFVLPvU0FUK9issmomG8Y4kidyt58rZ5FWvDXqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mhidmln7qGBHdTgEIaUkgnHqRo0IKAFpAr9O3cXShUebdex8bizh9HNSquo75fZFSLGBpfLhLMNwl57R7WCE39ycYoxKz/nrPDLm6RDTV3jvI/jENhYhxnuBVKUVMdtFwcRShmbvuAKFUvVeuy9VnqIJGqE3HEQnogDCXEeq7fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=gfikRw9z; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106870; bh=lEO9lFVLPvU0FUK9issmomG8Y4kidyt58rZ5FWvDXqw=;
	l=646; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=gfikRw9zxoHZZCVbF7gL7m701WY2F7eTaQTCfV9Am5Z9sMxUAAalb7ditDxMy9+AM
	 +aCfOFW8VyxtrYIOi4ulyIOW3K0PIsEKxrMaGkTDLmDmZE2xzxAdu/OgDlHxccV99j
	 HsbHmi09R06VRzyj9j/aH3npTAIxeKOBkXxzuTZU=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:21:10 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	ksk4725@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	smn1196@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	ravi.patel@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
From: ksk4725@coasia.com
To: Jesper Nilsson <jesper.nilsson@axis.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: kenkim <kenkim@coasia.com>,
	Jongshin Park <pjsin865@coasia.com>,
	GunWoo Kim <gwk1013@coasia.com>,
	SeonGu Kang <ksk4725@coasia.com>,
	HaGyeong Kim <hgkim05@coasia.com>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	SungMin Park <smn1196@coasia.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Shradha Todi <shradha.t@samsung.com>,
	Ravi Patel <ravi.patel@samsung.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Hrishikesh <hrishikesh.d@samsung.com>,
	Dongjin Yang <dj76.yang@samsung.com>,
	Sang Min Kim <hypmean.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH 16/16] arm64: defconfig: Enable Axis ARTPEC SoC
Date: Thu, 10 Jul 2025 09:20:46 +0900
Message-Id: <20250710002047.1573841-17-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: sungminpark <smn1196@coasia.com>

Enable the Axis ARTPEC-8 SoC in arm64 defconfig.

Signed-off-by: sungminpark <smn1196@coasia.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..00b902c2d997 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -38,6 +38,8 @@ CONFIG_ARCH_AIROHA=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
+CONFIG_ARCH_ARTPEC=y
+CONFIG_ARCH_ARTPEC8=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y
 CONFIG_ARCH_BCM_IPROC=y
-- 
2.34.1


