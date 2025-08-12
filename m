Return-Path: <linux-gpio+bounces-24267-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F75BB225BE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 13:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 969803BF123
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 11:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2982ED87C;
	Tue, 12 Aug 2025 11:20:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDC72D5A07;
	Tue, 12 Aug 2025 11:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754997641; cv=none; b=ZMZSanWa5m4DFzA94mZc03rozwrMcPXDgM7lJhpbs+QBAItAHBHh6CsyZYBbnN67udcFQOevj9N7umkFjsMZjFOveax6+rUqN3bmRAOJL50CgTJY+sSRgwqTIuY84yG3LRSkqrUKTr8PhzFnEULt/b4YF43GUid/C4H/G6A5jm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754997641; c=relaxed/simple;
	bh=Cv+al3RkR0a6hj2nZdT3jnct2NEsZKUY1Yamq/g80o8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JHt0L39KH46xw2pv0H04YuWSD9+KW0x2rcqgFyZDqCdcTyH9A/pjRukb2t455t6uZlmLHn5sHsDu8L0aKZhHlJpn+ee21UcNN0aVwaaiwBDAq9Nrd6NQYULeQE9Eempy9vB74Y6mrCat0+pCEyy10Vqzs4ikdY3lmFaLKQNP9vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1TBM3vkpz9sSq;
	Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olXeWImUxYKy; Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1TBM395Mz9sSj;
	Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 56E5B8B764;
	Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MNwkCkkNJAtR; Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B2D138B763;
	Tue, 12 Aug 2025 13:03:06 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/4] Add support of IRQs to QUICC ENGINE GPIOs
Date: Tue, 12 Aug 2025 13:02:50 +0200
Message-ID: <cover.1754996033.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754996575; l=1268; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Cv+al3RkR0a6hj2nZdT3jnct2NEsZKUY1Yamq/g80o8=; b=fFl+7sV7wvWfoxhth6KvVgNiahxwX5fogT8IfnRNTZTK/9CrJvm+FZscOIx5Gp5mTTYv+jMxX /4BNU07obY7DwKrRVoPtg/YU1mQp3Qpsf7Va6nL30foeAvVGTv6Sg5z
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

The QUICC Engine provides interrupts for a few I/O ports. This is
handled via a separate interrupt ID and managed via a triplet of
dedicated registers hosted by the SoC.

Implement an interrupt driver for those IRQs then add IRQs capability to
the QUICC ENGINE GPIOs.

The number of GPIOs for which interrupts are supported depends on
the microcontroller:
- mpc8323 has 10 GPIOS supporting interrupts
- mpc8360 has 28 GPIOS supporting interrupts
- mpc8568 has 18 GPIOS supporting interrupts

Christophe Leroy (4):
  soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
  soc: fsl: qe: Change GPIO driver to a proper platform driver
  soc: fsl: qe: Add support of IRQ in QE GPIO
  dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC
    Engine Ports

 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       |  63 +++++++
 drivers/soc/fsl/qe/Makefile                   |   2 +-
 drivers/soc/fsl/qe/gpio.c                     | 108 ++++++++----
 drivers/soc/fsl/qe/qe_ports_ic.c              | 156 ++++++++++++++++++
 4 files changed, 293 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

-- 
2.49.0


