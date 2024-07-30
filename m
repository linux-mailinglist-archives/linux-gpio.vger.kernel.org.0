Return-Path: <linux-gpio+bounces-8448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F66940F15
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 12:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF52C28380A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 10:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00BE19DF54;
	Tue, 30 Jul 2024 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PM/hGoHK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5FD19AD81;
	Tue, 30 Jul 2024 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335171; cv=none; b=PVgPnhLDa/Qheie0dU+nhEaLJ2MIu0qqP1FZDtOe//1JDyMx0XOM7LFv8DM6v/aIL689/BgB9Ov1giP28L9AoykjkC8Dp+8yo9n7zgydKpRxcJrm3DRQ69/gQ6z7m87WUuqa+xdp6YJEuGLFW6HM0mBtHnMJ7sTebKqulJNSjrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335171; c=relaxed/simple;
	bh=esxKEex8+51rNpzxQN3ox5RAsVaCCzTefrB7PLUkUm4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HygVlP7vqVdMF5TGcQ+XhtVcVcBxdPdbMdk6C8ts/Kao9sx5tcnaTM6ByWpJ4s/02wKbprSnr2+0NU4jJf2MrzHuGwQiDgCdafu656qF1ogwcaNjd4YFPiT0PULW1JrAN501+DMawVwD62A40sYMf1XFo9xJW3iLkVe8DRpG2ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PM/hGoHK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6156C4AF0B;
	Tue, 30 Jul 2024 10:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722335170;
	bh=esxKEex8+51rNpzxQN3ox5RAsVaCCzTefrB7PLUkUm4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=PM/hGoHKejg7tHswaCVpjDmQs35ugrJEykpaLXYY0TNu/5j85VySr/vPAHQc+FEPg
	 leoqk/RoT9PJCnN1xLW19Lsn2mc25SJOfBM8KVKU//5RAOYedeUx1Cq67IrxIhq+lH
	 5VEe27uX3WY+kuvJWToEI4txBUo0KmEkN+X2VfIPveOSMLr5VtkitkYYK1lziXLhX4
	 +CtYXoJN+8gKesI/jNDEgBD5pCxHDAeAuCCSpG2FErRZPiVFeAeq4do/LjZxFpffhz
	 mBt8mpS0whL4uA4yOINpu1gYcHrs4N0/BoFvl5J/R0KVXjuCKm13vZpGdlNJbfvXlT
	 iaTxLXxQCgllA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E05C3DA49;
	Tue, 30 Jul 2024 10:26:10 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Subject: [PATCH v11 00/12] Initial Marvell PXA1908 support
Date: Tue, 30 Jul 2024 12:25:08 +0200
Message-Id: <20240730-pxa1908-lkml-v11-0-21dbb3e28793@skole.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIS/qGYC/4XRy07DMBAF0F+pssbRPPzsiv9ALBzHpqaPVAlER
 VX/HbdSaTALljPSub7ynJspjjlOzXp1bsY45ykPhzIgPq2asPGHtyhyXxYNATFYYHE8eXRgxW6
 73wltGaLtvVTBNIUcx5jy6Zb38lrmTZ4+hvHrFj/zdXsPkr+DZhYgbJQ2Bc8GnHuetsMutpuxu
 ebM9LCGDGpy4FoNjAJF//ke230ubYc5hwriEiIhgKSWULH6T8plXVPVlaVu6Nia3nAnFVVWLSx
 SZVWxXvUKHZsYWVZW/1gEhMrqYjtKERxJCMlW1t6tBPxjbbEpeqOtV06a+l33sBLqzq5YUh6Ao
 +WgU/3LsMBU37Y0AcE69KlTVmJaHvdyuXwDvK6FCoUCAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7782;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=esxKEex8+51rNpzxQN3ox5RAsVaCCzTefrB7PLUkUm4=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGkr9m/WOmZcOSHwk5IB1+9Lqv1vOHd/Lv70+EXZUtafy
 TrubyabdJSyMIhxMciKKbLk/ne8xvtZZOv27GUGMHNYmUCGMHBxCsBEdBMYGWa0evcIHu84HBhb
 2Wb7lKHBldH6+OSsifYsaTGVSsWLahgZHm6ceT9+S538hScxiaIHlA7e+D1vH//KSDUze9VbTa8
 vcwIA
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

Hello,

This series adds initial support for the Marvell PXA1908 SoC and
"samsung,coreprimevelte", a smartphone using the SoC.

USB works and the phone can boot a rootfs from an SD card, but there are
some warnings in the dmesg:

During SMP initialization:
[    0.006519] CPU features: SANITY CHECK: Unexpected variation in SYS_CNTFRQ_EL0. Boot CPU: 0x000000018cba80, CPU1: 0x00000000000000
[    0.006542] CPU features: Unsupported CPU feature variation detected.
[    0.006589] CPU1: Booted secondary processor 0x0000000001 [0x410fd032]
[    0.010710] Detected VIPT I-cache on CPU2
[    0.010716] CPU features: SANITY CHECK: Unexpected variation in SYS_CNTFRQ_EL0. Boot CPU: 0x000000018cba80, CPU2: 0x00000000000000
[    0.010758] CPU2: Booted secondary processor 0x0000000002 [0x410fd032]
[    0.014849] Detected VIPT I-cache on CPU3
[    0.014855] CPU features: SANITY CHECK: Unexpected variation in SYS_CNTFRQ_EL0. Boot CPU: 0x000000018cba80, CPU3: 0x00000000000000
[    0.014895] CPU3: Booted secondary processor 0x0000000003 [0x410fd032]

SMMU probing fails:
[    0.101798] arm-smmu c0010000.iommu: probing hardware configuration...
[    0.101809] arm-smmu c0010000.iommu: SMMUv1 with:
[    0.101816] arm-smmu c0010000.iommu:         no translation support!

A 3.14 based Marvell tree is available on GitHub
acorn-marvell/brillo_pxa_kernel, and a Samsung one on GitHub
CoderCharmander/g361f-kernel.

Andreas Färber attempted to upstream support for this SoC in 2017:
https://lore.kernel.org/lkml/20170222022929.10540-1-afaerber@suse.de/

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Changes in v11:
- Rebase on v6.11-rc1 (conflict with DTS Makefile), no changes
- Link to v10: https://lore.kernel.org/r/20240424-pxa1908-lkml-v10-0-36cdfb5841f9@skole.hr

Changes in v10:
- Update trailers
- Rebase on v6.9-rc5
- Clock driver changes:
  - Add a couple of forgotten clocks in APBC
    - The clocks are thermal_clk, ipc_clk, ssp0_clk, ssp2_clk and swjtag
    - The IDs and register offsets were already present, but I forgot to
      actually register them
  - Split each controller block into own file
  - Drop unneeded -of in clock driver filenames
  - Simplify struct pxa1908_clk_unit
  - Convert to platform driver
  - Add module metadata
- DTS changes:
  - Properly name pinctrl nodes
  - Drop pinctrl #size-cells, #address-cells, ranges and #gpio-size-cells
  - Fix pinctrl input-schmitt configuration
- Link to v9: https://lore.kernel.org/20240402-pxa1908-lkml-v9-0-25a003e83c6f@skole.hr

Changes in v9:
- Update trailers and rebase on v6.9-rc2, no changes
- Link to v8: https://lore.kernel.org/20240110-pxa1908-lkml-v8-0-fea768a59474@skole.hr

Changes in v8:
- Drop SSPA patch
- Drop broken-cd from eMMC node
- Specify S-Boot hardcoded initramfs location in device tree
- Add ARM PMU node
- Correct inverted modem memory base and size
- Update trailers
- Rebase on next-20240110
- Link to v7: https://lore.kernel.org/20231102-pxa1908-lkml-v7-0-cabb1a0cb52b@skole.hr
  and https://lore.kernel.org/20231102152033.5511-1-duje.mihanovic@skole.hr

Changes in v7:
- Suppress SND_MMP_SOC_SSPA on ARM64
- Update trailers
- Rebase on v6.6-rc7
- Link to v6: https://lore.kernel.org/r/20231010-pxa1908-lkml-v6-0-b2fe09240cf8@skole.hr

Changes in v6:
- Address maintainer comments:
  - Add "marvell,pxa1908-padconf" binding to pinctrl-single driver
- Drop GPIO patch as it's been pulled
- Update trailers
- Rebase on v6.6-rc5
- Link to v5: https://lore.kernel.org/r/20230812-pxa1908-lkml-v5-0-a5d51937ee34@skole.hr

Changes in v5:
- Address maintainer comments:
  - Move *_NR_CLKS to clock driver from dt binding file
- Allocate correct number of clocks for each block instead of blindly
  allocating 50 for each
- Link to v4: https://lore.kernel.org/r/20230807-pxa1908-lkml-v4-0-cb387d73b452@skole.hr

Changes in v4:
- Address maintainer comments:
  - Relicense clock binding file to BSD-2
- Add pinctrl-names to SD card node
- Add vgic registers to GIC node
- Rebase on v6.5-rc5
- Link to v3: https://lore.kernel.org/r/20230804-pxa1908-lkml-v3-0-8e48fca37099@skole.hr

Changes in v3:
- Address maintainer comments:
  - Drop GPIO dynamic allocation patch
  - Move clock register offsets into driver (instead of bindings file)
  - Add missing Tested-by trailer to u32_fract patch
  - Move SoC binding to arm/mrvl/mrvl.yaml
- Add serial0 alias and stdout-path to board dts to enable UART
  debugging
- Rebase on v6.5-rc4
- Link to v2: https://lore.kernel.org/r/20230727162909.6031-1-duje.mihanovic@skole.hr

Changes in v2:
- Remove earlycon patch as it's been merged into tty-next
- Address maintainer comments:
  - Clarify GPIO regressions on older PXA platforms
  - Add Fixes tag to commit disabling GPIO pinctrl calls for this SoC
  - Add missing includes to clock driver
  - Clock driver uses HZ_PER_MHZ, u32_fract and GENMASK
  - Dual license clock bindings
  - Change clock IDs to decimal
  - Fix underscores in dt node names
  - Move chosen node to top of board dts
  - Clean up documentation
  - Reorder commits
  - Drop pxa,rev-id
- Rename muic-i2c to i2c-muic
- Reword some commits
- Move framebuffer node to chosen
- Add aliases for mmc nodes
- Rebase on v6.5-rc3
- Link to v1: https://lore.kernel.org/r/20230721210042.21535-1-duje.mihanovic@skole.hr

---
Andy Shevchenko (1):
      clk: mmp: Switch to use struct u32_fract instead of custom one

Duje Mihanović (11):
      dt-bindings: pinctrl: pinctrl-single: add marvell,pxa1908-padconf compatible
      pinctrl: single: add marvell,pxa1908-padconf compatible
      dt-bindings: clock: Add Marvell PXA1908 clock bindings
      clk: mmp: Add Marvell PXA1908 APBC driver
      clk: mmp: Add Marvell PXA1908 APBCP driver
      clk: mmp: Add Marvell PXA1908 APMU driver
      clk: mmp: Add Marvell PXA1908 MPMU driver
      dt-bindings: marvell: Document PXA1908 SoC
      arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
      arm64: dts: Add DTS for Marvell PXA1908 and samsung,coreprimevelte
      MAINTAINERS: add myself as Marvell PXA1908 maintainer

 .../devicetree/bindings/arm/mrvl/mrvl.yaml         |   5 +
 .../devicetree/bindings/clock/marvell,pxa1908.yaml |  48 +++
 .../bindings/pinctrl/pinctrl-single.yaml           |   4 +
 MAINTAINERS                                        |   9 +
 arch/arm64/Kconfig.platforms                       |   8 +
 arch/arm64/boot/dts/marvell/Makefile               |   3 +
 .../dts/marvell/pxa1908-samsung-coreprimevelte.dts | 328 +++++++++++++++++++++
 arch/arm64/boot/dts/marvell/pxa1908.dtsi           | 300 +++++++++++++++++++
 drivers/clk/mmp/Makefile                           |   2 +-
 drivers/clk/mmp/clk-frac.c                         |  57 ++--
 drivers/clk/mmp/clk-of-mmp2.c                      |  26 +-
 drivers/clk/mmp/clk-of-pxa168.c                    |   4 +-
 drivers/clk/mmp/clk-of-pxa1928.c                   |   6 +-
 drivers/clk/mmp/clk-of-pxa910.c                    |   4 +-
 drivers/clk/mmp/clk-pxa1908-apbc.c                 | 131 ++++++++
 drivers/clk/mmp/clk-pxa1908-apbcp.c                |  84 ++++++
 drivers/clk/mmp/clk-pxa1908-apmu.c                 | 123 ++++++++
 drivers/clk/mmp/clk-pxa1908-mpmu.c                 | 112 +++++++
 drivers/clk/mmp/clk.h                              |  10 +-
 drivers/pinctrl/pinctrl-single.c                   |   1 +
 include/dt-bindings/clock/marvell,pxa1908.h        |  88 ++++++
 21 files changed, 1296 insertions(+), 57 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20230803-pxa1908-lkml-6830e8da45c7

Best regards,
-- 
Duje Mihanović <duje.mihanovic@skole.hr>



