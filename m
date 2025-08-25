Return-Path: <linux-gpio+bounces-24874-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C78EBB337A2
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A036617D242
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 07:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1801128BA81;
	Mon, 25 Aug 2025 07:20:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B55128724B;
	Mon, 25 Aug 2025 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756106436; cv=none; b=IFfnTZDuEP8nJX0CtUePKq/sKg61yv2qrN/nZFFfD+6BN1wA6y5SqoYCveNIOvRK70AltDADBFEmWI+4aJhdnz9laeOYl078ZLagmHrGLgCkX/Ivzcy4L1mCumh8Q1fiOegn9UwIPcjS3E/orzWWyKo/xK+lJcV1IpM38KXGdgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756106436; c=relaxed/simple;
	bh=9gU8poKsNJSgCMj5IC193x1flh8SKIRE7FBDWszpiWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bKpAFURKlqF/IA1FLCJk1jN0j4pi/KWssW10KOq34lbSOMCWBbVhThzBzzmDa/oZSbcN0zlUse5Ndj7yOgwT8mvxiKGb2m0q+ZG+KA/C9d+FNNPPhkBs2odfJIdzVwxfMMp+1879QsxhlojB7qiPWcLKox7GT1D4xyhWn6HGxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9M286c6Jz9sSL;
	Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxLSvRcp4PtP; Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9M285rFVz9sSH;
	Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B144F8B769;
	Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 79Duc9-z2n-g; Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8845D8B765;
	Mon, 25 Aug 2025 08:53:20 +0200 (CEST)
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
Subject: [PATCH v3 0/6] Add support of IRQs to QUICC ENGINE GPIOs
Date: Mon, 25 Aug 2025 08:53:15 +0200
Message-ID: <cover.1756104334.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756104796; l=1967; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=9gU8poKsNJSgCMj5IC193x1flh8SKIRE7FBDWszpiWY=; b=s6s0Zoi/uoWVoB6Dpqtqh36eyBdZYPiQX7Lsm4T3peSJPKqTrsYBsGx5vTJQ1PXR5nzJtkHfw rRSUesOi+piCK4lY6+crj0YPYpBjOJvpltbn2OeKjzVgBzPFYDj69GD
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

Changes in v3:
- Splited dt-bindings update out of patch "soc: fsl: qe: Add support of IRQ in QE GPIO"
- Reordered DTS node exemples iaw dts-coding-style.rst

Changes in v2:
- Fixed warning on PPC64 build (Patch 1)
- Using devm_kzalloc() instead of kzalloc (Patch 2)
- Stop using of-mm-gpiochip (New patch 3)
- Added fsl,qe-gpio-irq-mask propertie in DT binding doc (Patch 4)
- Fixed problems reported by 'make dt_binding_check' (Patch 5)

Christophe Leroy (6):
  soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
  soc: fsl: qe: Change GPIO driver to a proper platform driver
  soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver
  soc: fsl: qe: Add support of IRQ in QE GPIO
  dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
  dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC
    Engine Ports

 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       |  58 +++++++
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     |  19 +++
 arch/powerpc/platforms/Kconfig                |   1 -
 drivers/soc/fsl/qe/Makefile                   |   2 +-
 drivers/soc/fsl/qe/gpio.c                     | 145 +++++++++-------
 drivers/soc/fsl/qe/qe_ports_ic.c              | 156 ++++++++++++++++++
 6 files changed, 322 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

-- 
2.49.0


