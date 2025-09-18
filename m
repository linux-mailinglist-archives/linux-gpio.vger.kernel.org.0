Return-Path: <linux-gpio+bounces-26340-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E73A5B861B3
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 18:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52E8C54616F
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 16:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960A625393C;
	Thu, 18 Sep 2025 16:50:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB066221F29;
	Thu, 18 Sep 2025 16:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758214246; cv=none; b=sG5izBU5y3HzTLIFjUREuq43aGMx7vMB9iLz+RXOq0N4+FcCBRfKvH3fFyZcXg4APXQELIAH6ZPAbUEmlqWFUhErtPZrf3KVr7nM85vFYz+FCt7YrYDvNiRAEzEou5rm6m4ElK9vflqWTRaS6MawSOdIct87aEF6SJxKrwH49JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758214246; c=relaxed/simple;
	bh=OgCnUIlKw1JxR7kjRn4Et9d8YymbVWaWOnW11EryMBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fi0KP8/PVBszq6V+vjyQW/dATDifikwrxBKcRCUaUYsMPIymVkDLCpyNU1ienEYmT0fzSl9XNyEy4NOUBklVLEgH8sANSyeGuHPSF2ZUEM6VoHmtWt+VXs0gKnLvl7Ti1Vn1kqpy3XnLyP+QsD5N6I1PoXcTf4RceiCJUtFCLZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSLY10Mbrz9sfh;
	Thu, 18 Sep 2025 18:23:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sO3sKZP93SXY; Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSLY06MC6z9sff;
	Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C9AE08B776;
	Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9SmYjYN9p3HL; Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D1588B767;
	Thu, 18 Sep 2025 18:23:32 +0200 (CEST)
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
Subject: [PATCH v6 0/7] Add support of IRQs to QUICC ENGINE GPIOs
Date: Thu, 18 Sep 2025 18:23:20 +0200
Message-ID: <cover.1758212309.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758212605; l=2729; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=OgCnUIlKw1JxR7kjRn4Et9d8YymbVWaWOnW11EryMBs=; b=kJ17167SdnC2brfs/6ZVeip2FJrVuZWNePg7vhRzccMHLW4xR2hWSncCA8JgOKj0R2u6IENLD yr/kbkEH4dEBRTTs5kh8I0ABfpN+NWO5uki35VvaGdsWBxh54sMSOg9
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

The QUICC Engine provides interrupts for a few I/O ports. This is
handled via a separate interrupt ID and managed via a triplet of
dedicated registers hosted by the SoC.

Implement an interrupt driver for those IRQs then add change
notification capability to the QUICC ENGINE GPIOs.

The number of GPIOs for which interrupts are supported depends on
the microcontroller:
- mpc8323 has 10 GPIOS supporting interrupts
- mpc8360 has 28 GPIOS supporting interrupts
- mpc8568 has 18 GPIOS supporting interrupts

Changes in v6:
- Changed mask local var to unsigned long instead of u32 to avoid build failure on 64 bits (patch 4)
- Comments from Rob taken into account except the comment on fsl,<chip>-qe-pario-bank becoming fsl,chip-qe-pario-bank as I don't know what to do.

Changes in v5:
- Replaced new DT property "fsl,qe-gpio-irq-mask" by a mask encoded
in the of_device_id table
- Converted QE QPIO DT bindings to DT schema

Changes in v4:
- Removed unused headers
- Using device_property_read_u32() instead of of_property_read_u32()

Changes in v3:
- Splited dt-bindings update out of patch "soc: fsl: qe: Add support of IRQ in QE GPIO"
- Reordered DTS node exemples iaw dts-coding-style.rst

Changes in v2:
- Fixed warning on PPC64 build (Patch 1)
- Using devm_kzalloc() instead of kzalloc (Patch 2)
- Stop using of-mm-gpiochip (New patch 3)
- Added fsl,qe-gpio-irq-mask propertie in DT binding doc (Patch 4)
- Fixed problems reported by 'make dt_binding_check' (Patch 5)

Christophe Leroy (7):
  soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
  soc: fsl: qe: Change GPIO driver to a proper platform driver
  soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver
  soc: fsl: qe: Add support of IRQ in QE GPIO
  dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC
    Engine Ports
  dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema
  dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO

 .../gpio/fsl,mpc8323-qe-pario-bank.yaml       |  72 ++++++
 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       |  58 +++++
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     |  26 +--
 arch/powerpc/platforms/Kconfig                |   1 -
 drivers/soc/fsl/qe/Makefile                   |   2 +-
 drivers/soc/fsl/qe/gpio.c                     | 209 ++++++++++++------
 drivers/soc/fsl/qe/qe_ports_ic.c              | 156 +++++++++++++
 7 files changed, 434 insertions(+), 90 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

-- 
2.49.0


