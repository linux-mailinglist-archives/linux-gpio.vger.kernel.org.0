Return-Path: <linux-gpio+bounces-38676-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TgZzL63tM2rmIwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38676-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 15:07:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B11846A054A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 15:07:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mCrO0huR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38676-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38676-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4288A306D3AA
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 13:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3A73F86E6;
	Thu, 18 Jun 2026 13:00:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0903F6C32
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 13:00:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787622; cv=none; b=giRJaorSMYaW7sAAeF7jW+HGJmDUl/rXdpDk7ir8DhODrM11xI7k+vjAwhl7QAfDkOSJCfnhyp0i3rIRyXjBzwz2vGgFW7k4sxkxrIyBZH7doKGMx4nPAQlV34oqkBVyDHrTiqRyfugGU769egJqB1BUd+eJAglcGtiBe61fbSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787622; c=relaxed/simple;
	bh=bVW5ms9bC8uRBLPosVX3uLtcgsl+h0PVQByCAxIunvU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZSRfLGNgDXaK8EOkmOh0A0vbXWiOQ93LtW+8pW+zZfiUgwUL5lMcFCS1yxazy9FVQqHZzcXQ7d0uG3L2RZB4CaTqgkA1KXdMvneGL/8eNBOOPRynrQaIfr31nkAe3RSpC1xDRff99ZqBYRPmvay1ozevRJA3564Y6yZrnmF+U08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCrO0huR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806A01F00A3A
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 13:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781787620;
	bh=dTTpnKBBk8BTyMYsmtaOqV6LAEbrWDpJ00xN8DpGoDc=;
	h=From:Date:Subject:To:Cc;
	b=mCrO0huRb+2DgU6b73GYYgZdZnQnSuqLQGxZghNCoQ7nX2T5ydkx85qaMzAIXmI9w
	 rTqX3Aw95YQlg/p7jrsBjnaVruxeM9kDaIxQ9ceQb39dQQCZcsZgzqnBrzIfD4Mthy
	 BKO41cilUJT9qsK2PZ6Wd/qxcqTR54LQKJsI1PwWFqOjEXj5eUAL7vEx6N2q+NDArk
	 v872etbFEnEKPplOoOUk2Ofm3aoo+8YYltOH7rfLXjYsW7UmDGvxQXGejATyaA4yqV
	 69TTD0c0w9mkKNRyrxEDiW95fK9CoOU+VwwyzVGVq3J7RGS33Z6KK5Q4Lm3p7Kc/rx
	 SoYsh4mcuTf5Q==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ad49da7123so805410e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 06:00:20 -0700 (PDT)
X-Gm-Message-State: AOJu0YwJZCidwuMbK4yuPuOIxJAO/mp5ZIAY29jlEHXlEhAF5X9vmcvM
	0xLDgCsXGrCpfTsXhxT5wDwM3wfSoD7/Lz6BasRMJY3qxrvJ9tIgTSRxx+HNNpNhNrfEdZoehgU
	QsmiXN9YaszAT5y9eebDnSdmWFHGU6nw=
X-Received: by 2002:a19:f00f:0:b0:5aa:62df:cd0f with SMTP id
 2adb3069b0e04-5ad4d4576b4mr713547e87.2.1781787619081; Thu, 18 Jun 2026
 06:00:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Jun 2026 15:00:07 +0200
X-Gmail-Original-Message-ID: <CAD++jLnqGA6eYwbuds+cC0uWvGd-dEX7TPU39ghattp-tETXSA@mail.gmail.com>
X-Gm-Features: AVVi8CcCRSQucvw2BoGhpM48gGBg0i5sRvGpoaH0v7i70290VU8DjSv67IQu4xY
Message-ID: <CAD++jLnqGA6eYwbuds+cC0uWvGd-dEX7TPU39ghattp-tETXSA@mail.gmail.com>
Subject: [GIT PULL] pin control changes for the v7.2 kernel cycle
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-38676-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B11846A054A

Hi Linus,

here is the bulk of pin control changes for the v7.2 kernel.

There will be conflicts! Git will fix most of them but a particularly
hairy hunk will
appear in drivers/pinctrl/qcom/pinctrl-eliza.c.

This appears because fixes were merged into the driver that clash with some
new stuff for v7.2. Such things happen.

I have resolved it manually for linux-next so the solution is there,
essentially it's
some tracedata entry that is renamed traceclk in my branch, I think you can
spot it pretty easily.

Other than that it should be smooth sailing, the changes are big for this
subsystem this time around.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.2-1

for you to fetch changes up to 8b2c4f88c6ee86efdbc81bed1684e13e2efebd53:

  pinctrl: Export pinctrl_get_group_selector() (2026-06-15 15:01:15 +0200)

----------------------------------------------------------------
Pin control changes for the v7.2 kernel cycle:

Core changes:

- Add new generic callbacks to populate per-pin pin controllers creating
  groups and functions from the device tree building out
  pinctrl_generic_to_map() and move the Spacemit driver over to use this.

- Generic board-level pin control driver using the mux framework.

New drivers:

- Amlogic (meson) A9 SoC pin controller.

- Aspeed AST2700 SoC0 and SoC1 pin controllers.

- nVidia Tegra264 pin controller.

- nVidia Tegra238 pin controller.

- Qualcomm Nord TLMM pin controller.

- Qualcomm Shikra TLMM pin controller.

- Qualcomm SM6350 LPASS LPI pin controller.

- Qualcomm IPQ9650 TLMM pin controller.

- Renesas RZ/G3L SoC pin controller.

- UltraRISC DP1000 pin controller.

Improvements:

- Handle pull up/pull down properly in the Renesas RZG2L driver.

- Fix up nVidia Tegra 234 DT bindings.

- Fix up pin definitions in the Qualcomm Eliza driver.

- Qualcomm PM8010 GPIO support in the PM8010 pin controller.

- Qualcomm SM6115 EGPIO support in the SM6115 pin controller.

- Switch Qualcomm LPASS LPI drivers to use runtime PM for power management.

- Clean up the Qualcomm Kconfig business a bit to include the necessary
  drivers for each subarch.

- Fix output glitch in the Amlogic (meson) A4 pin controller.

- Move the Airoha driver from the Mediatek directory to its own directory.
  It is too different from other Mediatek hardware.

- A slew of fixes to the Airoha AN7581 and AN7583 drivers.

----------------------------------------------------------------
Abel Vesa (3):
      dt-bindings: pinctrl: qcom,eliza-tlmm: Merge QUP1_SE4 lane functions
      pinctrl: qcom: eliza: Merge QUP1_SE4 lanes in groups
      pinctrl: qcom: eliza: Add missing sdc2 pin function mappings

Ajay Kumar Nandam (3):
      pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on LPASS LPI SoCs
      pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
      pinctrl: qcom: lpass-lpi: drop unused runtime-PM write helper

Alexander Koskovich (4):
      dt-bindings: pinctrl: qcom,eliza-tlmm: Split QUP lane mirror alternat=
es
      dt-bindings: pinctrl: qcom,eliza-tlmm: Split QUP1_SE4 lanes
      pinctrl: qcom: eliza: Split QUP lane mirror alternates
      pinctrl: qcom: eliza: Split QUP1_SE4 lanes

Alexandre MINETTE (1):
      pinctrl: qcom: Register functions before enabling pinctrl

Andre Przywara (2):
      pinctrl: sunxi: a523: Remove unneeded IRQ remuxing flag
      dt-bindings: pinctrl: sun55i-a523: increase IRQ banks number

Arnd Bergmann (2):
      pinctrl: avoid duplicate function definitions
      pinctrl: tegra238: remove unused entries

Bartosz Golaszewski (3):
      dt-bindings: pinctrl: describe the Qualcomm nord-tlmm
      pinctrl: qcom: add the TLMM driver for the Nord platforms
      pinctrl: qcom: nord: remove duplicated pin function

Biju Das (9):
      pinctrl: renesas: rzg2l: Fix incorrect PUPD register offset for
high pins during suspend/resume
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document reset-names
      dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
      pinctrl: renesas: rzg2l: Make QSPI register handling conditional
      pinctrl: renesas: rzg2l: Add support for selecting power source
for {WDT,AWO,ISO}
      pinctrl: renesas: rzg2l: Update OEN pin validation to use exact match
      pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
      pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
      pinctrl: renesas: rzg2l: Add support for clone channel control

Billy Tsai (5):
      dt-bindings: pinctrl: Add aspeed,ast2700-soc0-pinctrl
      pinctrl: aspeed: Add AST2700 SoC0 support
      dt-bindings: pinctrl: Add aspeed,ast2700-soc1-pinctrl
      pinctrl: aspeed: Add AST2700 SoC1 support
      pinctrl: aspeed: Fix GPIO mux value for ADC-capable balls

Charles Keepax (2):
      pinctrl: cs42l43: Fix leaked pm reference on error path
      pinctrl: cs42l43: Fix polarity on debounce

Chen-Yu Tsai (3):
      pinctrl: mediatek: eint: Drop base from mtk_eint_chip_write_mask()
      pinctrl: mediatek: paris: bypass pinctrl GPIO layer in set GPIO direc=
tion
      pinctrl: mediatek: common-v1: bypass pinctrl GPIO layer in set
GPIO direction

Christian Marangi (1):
      pinctrl: Move Airoha driver to dedicated directory

Claudiu Beznea (6):
      pinctrl: renesas: rzg2l: Use -ENOTSUPP instead of -EOPNOTSUPP
      pinctrl: renesas: rzg2l: Populate struct gpio_chip::set_config
      pinctrl: renesas: rzv2m: Use -ENOTSUPP instead of -EOPNOTSUPP
      pinctrl: renesas: rzg2l: Keep member documentation aligned
      pinctrl: renesas: rzg2l: Use tab instead of spaces
      pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave() on power source u=
pdate

Conor Dooley (4):
      pinctrl: generic: change signature of pinctrl_generic_to_map()
to pass void data
      pinctrl: add new generic groups/function creation function for pinmux
      pinctrl: spacemit: delete spacemit_pctrl_check_power()
      pinctrl: spacemit: move over to generic pinmux dt_node_to_map
implementation

Felix Gu (2):
      pinctrl: pinconf-generic: fix properties bitmap leak in parse_fw_cfg(=
)
      pinctrl: sunxi: fix regulator leak in sunxi_pmx_request() error path

Fenglin Wu (2):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PM8010 GPIO support
      pinctrl: qcom: spmi-gpio: Add PM8010 GPIO support

Frank Li (7):
      mux: add devm_mux_state_get_from_np() to get mux from child node
      dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
      pinctrl: extract pinctrl_generic_to_map() from
pinctrl_generic_pins_function_dt_node_to_map()
      pinctrl: add optional .release_mux() callback
      pinctrl: add generic board-level pinctrl driver using mux framework
      mux: describe np parameter in __devm_mux_state_get()
      pinctrl: Add OF dependency for PINCTRL_GENERIC_MUX

Geert Uytterhoeven (11):
      pinctrl: airoha: Fix type in .pin_config_group_get() callback
      pinctrl: equilibrium: Fix type in .pin_config_group_get() callback
      pinctrl: ingenic: Fix type in .pin_config_group_get() callback
      pinctrl: mediatek: moore: Fix type in .pin_config_group_get() callbac=
k
      pinctrl: single: Fix type in .pin_config_group_get() callback
      Merge tag 'renesas-r9a08g046-dt-binding-defs-tag2' into
renesas-pinctrl-for-v7.2
      pinctrl: renesas: rzg2l: Fix type in .pin_config_group_get() callback
      pinctrl: renesas: rzv2m: Fix type in .pin_config_group_get() callback
      pinctrl: renesas: sh-pfc: Implement .pin_config_group_get() callback
      pinctrl: tegra: PINCTRL_TEGRA238 should depend on ARCH_TEGRA
      pinctrl: tegra: PINCTRL_TEGRA264 should depend on ARCH_TEGRA

Han Gao (1):
      pinctrl: spacemit: fix NULL check in spacemit_pin_set_config

Hans Zhang (2):
      pinctrl: sophgo: Use FIELD_MODIFY()
      pinctrl: spacemit: Use FIELD_MODIFY()

Icenowy Zheng (1):
      dt-bindings: pinctrl: mediatek: mt8188: allow gpio hogs

Jia Wang (2):
      dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl controller
      pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver

Joey Lu (1):
      pinctrl: nuvoton: ma35d1: fix MFP register offset and pin table

Kathiravan Thirumoorthy (2):
      dt-bindings: pinctrl: qcom: add IPQ9650 pinctrl
      pinctrl: qcom: Introduce IPQ9650 TLMM driver

Khristine Andreea Barbulescu (1):
      pinctrl: s32cc: use dev_err_probe() and improve error messages

Komal Bajaj (2):
      dt-bindings: pinctrl: qcom: Document Shikra Top Level Mode Multiplexe=
r
      pinctrl: qcom: Add Shikra pinctrl driver

Krzysztof Kozlowski (12):
      pinctrl: tegra: Enable easier compile testing
      pinctrl: realtek: Enable compile testing
      pinctrl: aspeed: Enable compile testing outside of ARCH_ASPEED
      pinctrl: vt8500: Enable compile testing
      dt-bindings: pinctrl: nvidia,tegra234: Add missing required block
      dt-bindings: pinctrl: nvidia,tegra234: Correctly use additionalProper=
ties
      pinctrl: qcom: Unify user-visible "Qualcomm" name
      pinctrl: qcom: Move MODULE_DEVICE_TABLE next to the table itself
      pinctrl: bcm: Move MODULE_DEVICE_TABLE next to the table itself
      pinctrl: rockchip: Move MODULE_DEVICE_TABLE next to the table itself
      pinctrl: qcom: Make important drivers default (2)
      pinctrl: qcom: Make important drivers default (1)

Lad Prabhakar (7):
      pinctrl: renesas: rzg2l: Fix SMT register cache handling
      pinctrl: renesas: rzg2l: Add SR register cache for PM suspend/resume
      pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH configuration in PM ca=
che
      pinctrl: renesas: rzg2l: Add NOD register cache for PM suspend/resume
      pinctrl: renesas: rzg2l: Handle PUPD for RZ/V2H(P) dedicated pins in =
PM
      pinctrl: renesas: rzt2h: Remove unused variable in
rzt2h_pinctrl_register()
      pinctrl: renesas: rzt2h: Skip PFC mode configuration if already set

Linus Walleij (9):
      Merge branch 'ib-qcom-configs' into devel
      Merge branch 'ib-mux-pinctrl' into devel
      Merge tag 'renesas-pinctrl-for-v7.2-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      pinctrl: starfive: jh7110: Use __counted_by() flexarray
      pinctrl: starfive: jh7110: Avoid ifdeffery
      Merge tag 'intel-pinctrl-v7.2-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel
      Merge tag 'renesas-pinctrl-for-v7.2-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'renesas-pinctrl-for-v7.2-tag3' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      pinctrl: Export pinctrl_get_group_selector()

Luca Leonardo Scorcia (4):
      dt-bindings: pinctrl: mediatek,mt65xx: Add MT6392 pinctrl
      pinctrl: mediatek: mt8516: Fix Schmitt trigger register offset
of pins 34-39
      pinctrl: mediatek: mt8167: Fix Schmitt trigger register offset
of pins 34-39
      dt-bindings: pinctrl: mediatek: mt6795: document the slew-rate proper=
ty

Luca Weiss (3):
      dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
      pinctrl: qcom: lpass-lpi: Add ability to use SPARE_1 for slew control
      pinctrl: qcom: Add SM6350 LPASS LPI TLMM

Maulik Shah (2):
      pinctrl: qcom: Remove unused macro definitions
      pinctrl: qcom: Replace open coded eoi call with irq_chip_eoi_parent()

Mayur Kumar (3):
      pinctrl: bcm: fix SPDX comment style in header
      pinctrl: actions: fix SPDX comment style in header
      pinctrl: mediatek: fix SPDX comment style in header

Mikhail Kshevetskiy (11):
      pinctrl: airoha: an7581: add missed gpio32 pin group
      pinctrl: airoha: an7583: add missed gpio32 pin group
      pinctrl: airoha: an7581: fix misprint in gpio19 pinconf
      pinctrl: airoha: an7583: fix misprint in gpio19 pinconf
      pinctrl: airoha: an7581: fix incorrect led mapping in phy4_led1
pin function
      pinctrl: airoha: an7583: fix incorrect led mapping in phy4_led1
pin function
      pinctrl: airoha: fix pwm pin function for an7581 and an7583
      pinctrl: airoha: an7583: fix gpio21 pin group
      pinctrl: airoha: an7583: add missed gpio22 pin group
      pinctrl: airoha: an7583: fix phy1_led1 pin function
      pinctrl: airoha: an7583: remove undefined groups from pcm_spi pin fun=
ction

Navya Malempati (1):
      pinctrl: qcom: Remove unused macro definitions

Oleksij Rempel (1):
      pinctrl: core: Make pin group callbacks optional for pin-only drivers

Peter Griffin (1):
      MAINTAINERS: add myself as co-maintainer for Samsung pinctrl drivers

Prathamesh Shete (7):
      pinctrl: tegra: Export tegra_pinctrl_probe()
      dt-bindings: pinctrl: Document Tegra238 pin controllers
      pinctrl: tegra: Add Tegra238 pinmux driver
      dt-bindings: pinctrl: Document Tegra264 pin controllers
      pinctrl: tegra: Add Tegra264 pinmux driver
      dt-bindings: pinctrl: tegra238: add missing AON pin groups
      pinctrl: tegra238: add missing AON pin groups

Rob Herring (Arm) (1):
      pinctrl: Match DT helper types

Rosen Penev (2):
      pinctrl: starfive: jh7110: use struct_size
      pinctrl: sophgo: allocate power_cfg with priv

Sneh Mankad (2):
      pinctrl: qcom: Modify MSM_PULL_MASK to accurately represent PULL bits
      pinctrl: qcom: Fix resolving register base address from device node

Stanislav Zaikin (1):
      pinctrl: qcom: sm6115: Add egpio support

Stepan Ionichev (1):
      pinctrl: intel: move PWM base computation past feature check

Swati Agarwal (1):
      dt-bindings: pinctrl: qcom: move gpio-hog schema to tlmm-common

Thomas Weber (2):
      pinctrl: qcom: Fix typo
      pinctrl: realtek: Fix typo

Timur Tabi (1):
      pinctrl: PINCTRL_STMFX should depend on CONFIG_OF

Uwe Kleine-K=C3=B6nig (The Capable Hub) (3):
      pinctrl: Use named initializers for platform_device_id arrays
      pinctrl: max77620: Unify usage of space and comma in
platform_device_id array
      pinctrl: Use named initializers for arrays of i2c_device_data

Xianwei Zhao (4):
      pinctrl: meson: amlogic-a4: fix gpio output glitch
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for A9
      pinctrl: meson: support amlogic A9 SoC
      pinctrl: meson: amlogic-a4: use nolock get range

Yash Suthar (1):
      pinctrl: pinconf-generic: Use kmemdup_array() over kmemdup()

Yu-Chun Lin (1):
      dt-bindings: pinctrl: realtek,rtd1625: Fix input voltage property nam=
e

 .../pinctrl/allwinner,sun55i-a523-pinctrl.yaml     |    8 +-
 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |    1 +
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       |  188 ++
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml       |  760 +++++++
 .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml  |    1 +
 .../bindings/pinctrl/mediatek,mt6795-pinctrl.yaml  |    8 +
 .../bindings/pinctrl/mediatek,mt8188-pinctrl.yaml  |    5 +
 .../pinctrl/nvidia,tegra234-pinmux-aon.yaml        |    6 +-
 .../bindings/pinctrl/nvidia,tegra234-pinmux.yaml   |    6 +-
 .../pinctrl/nvidia,tegra238-pinmux-aon.yaml        |  102 +
 .../pinctrl/nvidia,tegra238-pinmux-common.yaml     |   73 +
 .../bindings/pinctrl/nvidia,tegra238-pinmux.yaml   |  219 ++
 .../pinctrl/nvidia,tegra264-pinmux-aon.yaml        |   80 +
 .../pinctrl/nvidia,tegra264-pinmux-common.yaml     |   84 +
 .../pinctrl/nvidia,tegra264-pinmux-main.yaml       |  167 ++
 .../pinctrl/nvidia,tegra264-pinmux-uphy.yaml       |   78 +
 .../bindings/pinctrl/pinctrl-multiplexer.yaml      |   57 +
 .../devicetree/bindings/pinctrl/pinctrl.yaml       |    2 +-
 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |   26 +-
 .../bindings/pinctrl/qcom,ipq4019-pinctrl.yaml     |    5 -
 .../bindings/pinctrl/qcom,ipq9650-tlmm.yaml        |  118 ++
 .../bindings/pinctrl/qcom,nord-tlmm.yaml           |  141 ++
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |    3 +
 .../bindings/pinctrl/qcom,sdm845-pinctrl.yaml      |    5 -
 .../bindings/pinctrl/qcom,shikra-tlmm.yaml         |  123 ++
 .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     |  124 ++
 .../bindings/pinctrl/qcom,tlmm-common.yaml         |    6 +
 .../bindings/pinctrl/realtek,rtd1625-pinctrl.yaml  |    2 +-
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   35 +
 .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml |  130 ++
 MAINTAINERS                                        |   10 +-
 arch/arm/configs/multi_v7_defconfig                |    8 -
 arch/arm/configs/qcom_defconfig                    |   15 -
 arch/arm64/configs/defconfig                       |   46 -
 drivers/mux/core.c                                 |   43 +-
 drivers/pinctrl/Kconfig                            |   13 +
 drivers/pinctrl/Makefile                           |   11 +-
 drivers/pinctrl/actions/pinctrl-owl.h              |    2 +-
 drivers/pinctrl/airoha/Kconfig                     |   20 +
 drivers/pinctrl/airoha/Makefile                    |    3 +
 .../pinctrl/{mediatek =3D> airoha}/pinctrl-airoha.c  |  124 +-
 drivers/pinctrl/aspeed/Kconfig                     |   23 +
 drivers/pinctrl/aspeed/Makefile                    |    2 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c    |  749 +++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c    | 1756 ++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm4908.c              |    2 +-
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h              |    2 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |    2 +-
 drivers/pinctrl/bcm/pinctrl-ns.c                   |    2 +-
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c           |   10 +-
 drivers/pinctrl/core.c                             |   41 +-
 drivers/pinctrl/intel/pinctrl-broxton.c            |    4 +-
 drivers/pinctrl/intel/pinctrl-denverton.c          |    2 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |    3 +-
 drivers/pinctrl/mediatek/Kconfig                   |   17 +-
 drivers/pinctrl/mediatek/Makefile                  |    1 -
 drivers/pinctrl/mediatek/mtk-eint.c                |    6 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c           |    3 +-
 drivers/pinctrl/mediatek/pinctrl-mt8167.c          |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8516.c          |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |   13 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h      |    2 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c           |    8 +-
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         |   86 +-
 drivers/pinctrl/nuvoton/pinctrl-ma35.c             |    3 +-
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c           |  470 +++--
 drivers/pinctrl/nxp/pinctrl-s32cc.c                |   64 +-
 drivers/pinctrl/pinconf-generic.c                  |    7 +-
 drivers/pinctrl/pinconf.c                          |    9 +-
 drivers/pinctrl/pinconf.h                          |   32 +-
 drivers/pinctrl/pinctrl-aw9523.c                   |    2 +-
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |    6 +-
 drivers/pinctrl/pinctrl-equilibrium.c              |    3 +-
 drivers/pinctrl/pinctrl-generic-mux.c              |  184 ++
 drivers/pinctrl/pinctrl-generic.c                  |  211 +-
 drivers/pinctrl/pinctrl-ingenic.c                  |    3 +-
 drivers/pinctrl/pinctrl-max77620.c                 |    6 +-
 drivers/pinctrl/pinctrl-mcp23s08_i2c.c             |    6 +-
 drivers/pinctrl/pinctrl-mcp23s08_spi.c             |    6 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |    2 +-
 drivers/pinctrl/pinctrl-single.c                   |    3 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |   20 +-
 drivers/pinctrl/pinctrl-tps6594.c                  |    4 +-
 drivers/pinctrl/pinmux.c                           |    5 +
 drivers/pinctrl/qcom/Kconfig                       |   35 +-
 drivers/pinctrl/qcom/Kconfig.msm                   |  173 +-
 drivers/pinctrl/qcom/Makefile                      |    4 +
 drivers/pinctrl/qcom/pinctrl-apq8064.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-apq8084.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-eliza.c               |  188 +-
 drivers/pinctrl/qcom/pinctrl-glymur.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-hawi.c                |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq4019.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8064.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-ipq9650.c             |  762 +++++++
 drivers/pinctrl/qcom/pinctrl-kaanapali.c           |    2 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |  136 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |   20 +
 drivers/pinctrl/qcom/pinctrl-mdm9607.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c     |    7 +
 drivers/pinctrl/qcom/pinctrl-milos.c               |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   21 +-
 drivers/pinctrl/qcom/pinctrl-msm8226.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8953.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8960.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8976.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8994.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8996.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8998.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm8x74.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-nord.c                | 1770 ++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-qcm2290.c             |   25 +-
 drivers/pinctrl/qcom/pinctrl-qcs404.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c             |    6 -
 drivers/pinctrl/qcom/pinctrl-qdu1000.c             |   30 -
 drivers/pinctrl/qcom/pinctrl-sa8775p.c             |    6 -
 drivers/pinctrl/qcom/pinctrl-sc7180.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c    |   19 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c  |   15 +-
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c    |    7 +
 drivers/pinctrl/qcom/pinctrl-sdm660.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c    |    7 +
 drivers/pinctrl/qcom/pinctrl-sdm845.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdx55.c               |    2 +-
 drivers/pinctrl/qcom/pinctrl-sdx65.c               |    2 +-
 drivers/pinctrl/qcom/pinctrl-shikra.c              | 1253 +++++++++++
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c    |    7 +
 drivers/pinctrl/qcom/pinctrl-sm4450.c              |    7 -
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c    |    7 +
 drivers/pinctrl/qcom/pinctrl-sm6115.c              |   42 +-
 drivers/pinctrl/qcom/pinctrl-sm6125.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c    |  156 ++
 drivers/pinctrl/qcom/pinctrl-sm6350.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm6375.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8150.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c    |   15 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8350.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c    |   15 +-
 drivers/pinctrl/qcom/pinctrl-sm8450.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c    |   15 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c    |   15 +-
 drivers/pinctrl/qcom/pinctrl-sm8650.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-sm8750.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    1 +
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |   10 +-
 drivers/pinctrl/qcom/pinctrl-x1e80100.c            |    2 +-
 drivers/pinctrl/qcom/tlmm-test.c                   |   21 +-
 drivers/pinctrl/realtek/Kconfig                    |   12 +-
 drivers/pinctrl/realtek/pinctrl-rtd.c              |   12 +-
 drivers/pinctrl/renesas/core.c                     |   24 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  611 +++++-
 drivers/pinctrl/renesas/pinctrl-rzt2h.c            |   13 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |    7 +-
 drivers/pinctrl/renesas/pinctrl.c                  |   25 +
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c            |   32 +-
 drivers/pinctrl/spacemit/Kconfig                   |    4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              |  182 +-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c |   13 +-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h |    3 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c      |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c        |    1 -
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |    2 +-
 drivers/pinctrl/tegra/Kconfig                      |   44 +-
 drivers/pinctrl/tegra/Makefile                     |    2 +
 drivers/pinctrl/tegra/pinctrl-tegra.c              |    2 +
 drivers/pinctrl/tegra/pinctrl-tegra238.c           | 2080 ++++++++++++++++=
++
 drivers/pinctrl/tegra/pinctrl-tegra264.c           | 2216 ++++++++++++++++=
++++
 drivers/pinctrl/ultrarisc/Kconfig                  |   20 +
 drivers/pinctrl/ultrarisc/Makefile                 |    4 +
 drivers/pinctrl/ultrarisc/pinctrl-dp1000.c         |  168 ++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c      |  517 +++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h      |   63 +
 drivers/pinctrl/vt8500/Kconfig                     |   13 +-
 .../dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h  |   39 +
 .../pinctrl/renesas,r9a08g046-pinctrl.h            |   38 +
 include/linux/mux/consumer.h                       |    8 +-
 include/linux/pinctrl/pinmux.h                     |    5 +
 186 files changed, 16504 insertions(+), 1176 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-common.yam=
l
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-aon.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-common.yam=
l
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-uphy.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,ipq9650-tlmm.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yam=
l
 create mode 100644
Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/Kconfig
 create mode 100644 drivers/pinctrl/airoha/Makefile
 rename drivers/pinctrl/{mediatek =3D> airoha}/pinctrl-airoha.c (95%)
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
 create mode 100644 drivers/pinctrl/pinctrl-generic-mux.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq9650.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-nord.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-shikra.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra238.c
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra264.c
 create mode 100644 drivers/pinctrl/ultrarisc/Kconfig
 create mode 100644 drivers/pinctrl/ultrarisc/Makefile
 create mode 100644 drivers/pinctrl/ultrarisc/pinctrl-dp1000.c
 create mode 100644 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
 create mode 100644 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

