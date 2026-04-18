Return-Path: <linux-gpio+bounces-35228-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M9bRNKYE5GmyOwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35228-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 00:24:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7542269A
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 00:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61BB93016903
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 22:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E28F35CB76;
	Sat, 18 Apr 2026 22:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fj9oCc2N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401E135AC00
	for <linux-gpio@vger.kernel.org>; Sat, 18 Apr 2026 22:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776551074; cv=none; b=uwyS5RGRAsaQesxfHjmkkE3R9NW3kC3hsqpJP6VNEIBSEVpeo+0Y2vkoeL1UUKRPrXXiHX1HHCnAbIk8ZuHUim8KfB/BDhpL3JmbB13rRLU4sZaPEGqHg5I0PEgrsJ6YJ7uOlZk1drLz2RqT1p5AFBOc/Nnw0iLJQVzk7TQ7rsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776551074; c=relaxed/simple;
	bh=DzaxfXttnw0wcu8Nd8iWkmGVjYFH7SigAhTrNolB2bE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tsjz46B5XzEUKz/H+/QjIMT6HfWRouURgxUUsUwenMzaecdSJhlVj5sz5Pg5NgCIAOdicaP9yTw0pHXWlDd1SRUpp27l19PkrihuiC+Ihqe4sOYYBpG3dRH8oCrs769cFId6hyNOy3vfy7eRwkAEw2X0PN7hcWYgWxmmVQJkK0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fj9oCc2N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67D5C2BCB4
	for <linux-gpio@vger.kernel.org>; Sat, 18 Apr 2026 22:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776551074;
	bh=DzaxfXttnw0wcu8Nd8iWkmGVjYFH7SigAhTrNolB2bE=;
	h=From:Date:Subject:To:Cc:From;
	b=Fj9oCc2Nud7p0PDBVzUKTdB7RneUa9bRy7I3BWKS32ql1g7WO8hIqdyZwIRFaCWAX
	 7Y7D/swPpVEw4XxTrSC9hoptxTENAH3eLZtL8eWSTAo+tVaHs3gzBa2ZfM+zwpLk2X
	 axmMAqrmPSeDUKfglRtzutGEB7Q/usQAM1jOR+EAUDqovKg326nd7vbdUhd6E0CgaI
	 wPxFqRuyArsorcKDllo7xk9zRn+lXme4TPoqXSM2EGHFDPwLhzyTx57ui0X8iT94y8
	 RtN1ufMvWJHWVmDMVPTbJFc0AFL94QzipXk5DphONxY4NpRLwACkSymPXvBF9vurWT
	 jRxJ/6fTQSJ3Q==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e7b8e3f38so14722101fa.3
        for <linux-gpio@vger.kernel.org>; Sat, 18 Apr 2026 15:24:33 -0700 (PDT)
X-Gm-Message-State: AOJu0YykB6sGaDlfuY3ORCuJLgovCuhQ2yBgHovB/RbHD6qG1mQ8ZuAB
	LjGa47wFTBIcKiHYAlDNIKbJ+jEjSSm3fJIon9869CCtfIWZQCnmbWRytNDHOF6OLop3RZfJouu
	civEr3aMgLQtV8UR1hqpx6q6deL9EsOI=
X-Received: by 2002:a05:6512:31d5:b0:5a2:b4c3:d88c with SMTP id
 2adb3069b0e04-5a4172cc178mr2933344e87.15.1776551072509; Sat, 18 Apr 2026
 15:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 00:24:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLnutHonK6g-a9c85s5LgVY43WZOBCVs_G4vAY8etySU=w@mail.gmail.com>
X-Gm-Features: AQROBzB0f3qoaZLYkh7IeAKx29soarlNbHr6KgiePGlF6VhpqRUzAwcQi-wdVD0
Message-ID: <CAD++jLnutHonK6g-a9c85s5LgVY43WZOBCVs_G4vAY8etySU=w@mail.gmail.com>
Subject: [GIT PULL] pin control changes for v7.1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-35228-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2BE7542269A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

here are the pin control changes for the v7.1 kernel cycle.

There is a little bit of everything this time. Some core improvements
on semantic checks. Some bunch of new drivers. Cleanup series.
But overall pretty straight-forward. Some SCMI changes probably came in
before through an immutable branched pulled by the GPIO subsystem.

Details in the signed tag as always.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f=
:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.1-1

for you to fetch changes up to 90700e10d2ad61c13a5117cfa5e08d9f2e497dcc:

  pinctrl: qcom: Add Hawi pinctrl driver (2026-04-09 10:52:34 +0200)

----------------------------------------------------------------
Pin control changes for the v7.1 kernel cycle:

Core changes:

- Perform basic checks on pin config properties so as not to
  allow directly contradictory settings such as setting a pin
  to more than one bias or drive mode.

- Handle input-threshold-voltage-microvolt property.

- Introduce pinctrl_gpio_get_config() handling in the core for
  SCMI GPIO using pin control.

New drivers:

- GPIO-by-pin control driver (also apperaing in the GPIO pull
  request) fulfilling a promise on a comment from
  Grant Likely many years ago: "can't GPIO just be a front-end
  for pin control?" it turns out it can, if and only if you
  design something new from scratch, such as SCMI.

- Broadcom BCM7038 as a pinctrl-single delegate.

- Mobileye EyeQ6Lplus OLB pin controller.

- Qualcomm Eliza and Hawi families TLMM pin controllers.

- Qualcomm SDM670 and Milos family LPASS LPI pin controllers.

- Qualcomm IPQ5210 pin controller.

- Realtek RTD1625 pin controller support.

- Rockchip RV1103B pin controller support.

- Texas Instruments AM62L as a pinctrl-single delegate.

Improvements:

- Set config implementation for the Spacemit K1 pin controller.

----------------------------------------------------------------
AKASHI Takahiro (3):
      pinctrl: introduce pinctrl_gpio_get_config()
      gpio: dt-bindings: Add GPIO on top of generic pin control
      gpio: gpio-by-pinctrl: add pinctrl based generic GPIO driver

Abel Vesa (2):
      dt-bindings: pinctrl: document the Eliza Top Level Mode Multiplexer
      pinctrl: qcom: Add Eliza pinctrl driver

Andy Shevchenko (13):
      pinctrl: cy8c95x0: Use devm_mutex_init() for mutex initialization
      pinctrl: cy8c95x0: remove duplicate error message
      pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()
      pinctrl: cy8c95x0: Move driver data to the local variable in ->probe(=
)
      pinctrl: cy8c95x0: Drop unused 'name' in struct cy8c95x0_pinctrl
      pinctrl: cy8c95x0: Eliminate fragile use of I=C2=B2C ID table
      pinctrl: cy8c95x0: Gather ID tables in one place
      pinctrl: pinconf-generic: Use only fwnode API in parse_dt_cfg()
      pinctrl: cy8c95x0: Avoid returning positive values to user space
      pinctrl: pinconf-generic: Fully validate 'pinmux' property
      pinctrl: pinconf-generic: Validate fwnode instead of device node
      pinctrl: pinconf-generic: Convert ..._parse_dt_pinmux() to fwnode API
      pinctrl: core: Don't use "proxy" headers

Bartosz Golaszewski (1):
      pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO

Basavaraj Natikar (1):
      pinctrl: amd: Support new ACPI ID AMDI0033

Beno=C3=AEt Monin (2):
      pinctrl: eyeq5: Use match data
      pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB

Biju Das (1):
      pinctrl: renesas: rzg2l: Fix save/restore of {IOLH,IEN,PUPD,SMT} regi=
sters

Brian Masney (3):
      pinctrl: pic32: change all cases of bare 'unsigned' to 'unsigned int'
      pinctrl: pic32: use consistent spacing around '+'
      pinctrl: pic32: allow driver to be compiled with COMPILE_TEST

Chen Ni (1):
      pinctrl: realtek: Fix error check for devm_platform_ioremap_resource(=
)

Conor Dooley (3):
      pinctrl: pinconf-generic: perform basic checks on pincfg properties
      dt-bindings: pinctrl: pincfg-node: add restrictions on
conflicting properties
      dt-bindings: pinctrl: pincfg-node: permit bias-high-impedance
with other bias properties

Cosmin Tanislav (1):
      pinctrl: renesas: rzt2h: Fix invalid wait context

Dan Carpenter (4):
      pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
      pinctrl: scmi: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
      pinctrl: scmi: ignore PIN_CONFIG_PERSIST_STATE
      firmware: arm_scmi: Allow PINCTRL_REQUEST to return EOPNOTSUPP

Dmitry Torokhov (1):
      pinctrl: renesas: rza1: Normalize return value of gpio_get()

Ethan Tidmore (2):
      pinctrl: pinctrl-pic32: Fix resource leak
      pinctrl: pinctrl-pic32: Use devres version of gpiochip_add_data()

Fabio Estevam (2):
      dt-bindings: pinctrl: rockchip: Add RV1103B compatible
      pinctrl: rockchip: Add RV1103B pinctrl support

Felix Gu (2):
      pinctrl: microchip-mssio: Fix missing return in probe
      pinctrl: renesas: rzt2h: Fix device node leak in rzt2h_gpio_register(=
)

Florian Fainelli (2):
      dt-bindings: pinctrl: pinctrl-single: Add brcm,bcm7038-padconf
      pinctrl: single: Add bcm7038-padconf compatible matching

Frank Li (2):
      dt-bindings: pinctrl: convert fsl,imx27-pinctrl.txt to YAML
      dt-bindings: pinctrl: imx35: add compatible string fsl,imx25-iomuxc

Gabor Juhos (1):
      dt-bindings: pinctrl: marvell,armada3710-xb-pinctrl: add missing
items keyword

Geert Uytterhoeven (2):
      pinctrl: imx: PINCTRL_IMX_SCMI should depend on ARCH_MXC
      pinctrl: renesas: rzg2l: Drop superfluous blank line

Inochi Amaoto (2):
      pinctrl: sophgo: pinctrl-sg2042: Fix wrong module description
      pinctrl: sophgo: pinctrl-sg2044: Fix wrong module description

Janne Grunau (1):
      dt-bindings: pinctrl: apple,pinctrl: Add t8122 compatible

Junhui Liu (2):
      pinctrl: spacemit: return -ENOTSUPP for unsupported pin configuration=
s
      gpio: spacemit-k1: Add set_config callback support

Kathiravan Thirumoorthy (2):
      dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
      pinctrl: qcom: Introduce IPQ5210 TLMM driver

Krzysztof Kozlowski (1):
      pinctrl: qcom: De-acronymize Glymur SoC name

Lad Prabhakar (2):
      dt-bindings: pinctrl: renesas,r9a09g077: Document pin
configuration properties
      pinctrl: renesas: rzt2h: Add pin configuration support

Linus Walleij (3):
      pinctrl: Fix spelling problem
      Merge branch 'ib-scmi-pinctrl-gpio' into devel
      Merge tag 'renesas-pinctrl-for-v7.1-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel

Luca Weiss (2):
      dt-bindings: pinctrl: qcom: Add Milos LPASS LPI pinctrl
      pinctrl: qcom: Add Milos LPASS LPI TLMM

Matthijs Kooijman (1):
      gpio: rockchip: Call pinctrl for gpio config

Michal Piekos (1):
      pinctrl: core: use dev_err_probe() when applying state

Mohammad Rafi Shaik (1):
      dt-bindings: pinctrl: qcom,sm8450-lpass-lpi-pinctrl: Add SA8775P
and QCS8300 pinctrl

Mukesh Ojha (4):
      pinctrl: qcom: eliza: Fix interrupt target bit
      pinctrl: qcom: Drop redundant intr_target_reg on modern SoCs
      dt-bindings: pinctrl: qcom: Describe Hawi TLMM block
      pinctrl: qcom: Add Hawi pinctrl driver

Philipp Hahn (1):
      pinctrl: Prefer IS_ERR_OR_NULL over manual NULL check

Randy Dunlap (2):
      pinctrl: pinconf-generic: fix an enum name description
      pinctrl: s32: correct kernel-doc bad line warning

Richard Acayan (4):
      dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
      dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
      pinctrl: qcom: add sdm670 lpi tlmm
      pinctrl: qcom: sdm670-lpass-lpi: label variables as static

Rosen Penev (1):
      pinctrl: tegra: use flexible array member for array

Srinivas Kandagatla (1):
      dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: Add Glymur pinct=
rl

Svyatoslav Ryhel (1):
      dt-bindings: pinctrl: pinctrl-max77620: convert to DT schema

Tzuyi Chang (7):
      pinctrl: realtek: Fix return value and silence log for unsupported co=
nfigs
      pinctrl: realtek: Support system suspend and resume
      dt-bindings: pincfg-node: Add input-threshold-voltage-microvolt prope=
rty
      pinctrl: pinconf-generic: Add properties
'input-threshold-voltage-microvolt'
      dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl binding
      pinctrl: realtek: add support for slew rate, input voltage and high V=
IL
      pinctrl: realtek: add rtd1625 pinctrl driver

Vignesh Raghavendra (1):
      pinctrl: pinctrl-single: add ti,am62l-padconf compatible string

Yu-Chun Lin (7):
      pinctrl: realtek: Cleanup license string
      pinctrl: realtek: Switch to use devm functions
      pinctrl: realtek: Simplify error handling with dev_err_probe()
      pinctrl: realtek: Fix grammar in error messages
      pinctrl: realtek: Fix function signature for config argument
      dt-bindings: pinctrl: realtek: Improve 'realtek,duty-cycle' descripti=
on
      pinctrl: abx500: Fix type of 'argument' variable

 .../devicetree/bindings/gpio/pin-control-gpio.yaml |   59 +
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |    4 +-
 .../bindings/pinctrl/fsl,imx27-iomuxc.yaml         |  126 +
 .../bindings/pinctrl/fsl,imx27-pinctrl.txt         |  121 -
 .../bindings/pinctrl/fsl,imx35-pinctrl.yaml        |    1 +
 .../pinctrl/marvell,armada3710-xb-pinctrl.yaml     |   11 +-
 .../bindings/pinctrl/maxim,max77620-pinctrl.yaml   |   98 +
 .../devicetree/bindings/pinctrl/pincfg-node.yaml   |  107 +-
 .../bindings/pinctrl/pinctrl-max77620.txt          |  127 -
 .../bindings/pinctrl/pinctrl-single.yaml           |    4 +
 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |  138 +
 .../bindings/pinctrl/qcom,hawi-tlmm.yaml           |  120 +
 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        |  123 +
 .../bindings/pinctrl/qcom,lpass-lpi-common.yaml    |    8 +
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml      |  109 +
 .../pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml     |   81 +
 .../pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml     |    8 +-
 .../pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml     |    4 +-
 .../bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml |    7 +-
 .../bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml |    7 +-
 .../bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml |    7 +-
 .../bindings/pinctrl/realtek,rtd1625-pinctrl.yaml  |  260 ++
 .../pinctrl/renesas,r9a09g077-pinctrl.yaml         |   17 +
 .../bindings/pinctrl/rockchip,pinctrl.yaml         |    1 +
 drivers/firmware/arm_scmi/pinctrl.c                |    2 +
 drivers/gpio/Kconfig                               |   13 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-by-pinctrl.c                     |  101 +
 drivers/gpio/gpio-rockchip.c                       |    2 +-
 drivers/gpio/gpio-spacemit-k1.c                    |    1 +
 drivers/pinctrl/Kconfig                            |   15 +-
 drivers/pinctrl/bcm/Kconfig                        |    4 +-
 drivers/pinctrl/core.c                             |   38 +-
 drivers/pinctrl/devicetree.c                       |    2 +-
 drivers/pinctrl/freescale/Kconfig                  |    2 +-
 drivers/pinctrl/meson/Kconfig                      |    1 -
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c     |    2 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |    2 +-
 drivers/pinctrl/nxp/pinctrl-s32.h                  |    2 +-
 drivers/pinctrl/pinconf-generic.c                  |   94 +-
 drivers/pinctrl/pinconf.h                          |    6 +
 drivers/pinctrl/pinctrl-amd.c                      |    1 +
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |   93 +-
 drivers/pinctrl/pinctrl-eyeq5.c                    |  439 ++-
 drivers/pinctrl/pinctrl-pic32.c                    |   64 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |  313 +-
 drivers/pinctrl/pinctrl-rockchip.h                 |    1 +
 drivers/pinctrl/pinctrl-scmi.c                     |   46 +-
 drivers/pinctrl/pinctrl-single.c                   |    6 +-
 drivers/pinctrl/qcom/Kconfig                       |   20 +
 drivers/pinctrl/qcom/Kconfig.msm                   |   28 +
 drivers/pinctrl/qcom/Makefile                      |    5 +
 drivers/pinctrl/qcom/pinctrl-apq8084.c             |    2 -
 drivers/pinctrl/qcom/pinctrl-eliza.c               | 1545 ++++++++++
 drivers/pinctrl/qcom/pinctrl-glymur.c              |    5 +-
 drivers/pinctrl/qcom/pinctrl-hawi.c                | 1610 ++++++++++
 drivers/pinctrl/qcom/pinctrl-ipq4019.c             |    1 -
 drivers/pinctrl/qcom/pinctrl-ipq5018.c             |    1 -
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             |  897 ++++++
 drivers/pinctrl/qcom/pinctrl-ipq5332.c             |    1 -
 drivers/pinctrl/qcom/pinctrl-ipq5424.c             |    1 -
 drivers/pinctrl/qcom/pinctrl-ipq6018.c             |    1 -
 drivers/pinctrl/qcom/pinctrl-ipq8074.c             |    1 -
 drivers/pinctrl/qcom/pinctrl-ipq9574.c             |    1 -
 drivers/pinctrl/qcom/pinctrl-kaanapali.c           |    3 -
 drivers/pinctrl/qcom/pinctrl-mdm9607.c             |    2 -
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c     |  217 ++
 drivers/pinctrl/qcom/pinctrl-milos.c               |    3 -
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   20 +-
 drivers/pinctrl/qcom/pinctrl-msm.h                 |    6 +-
 drivers/pinctrl/qcom/pinctrl-msm8226.c             |    2 -
 drivers/pinctrl/qcom/pinctrl-msm8909.c             |    2 -
 drivers/pinctrl/qcom/pinctrl-msm8916.c             |    2 -
 drivers/pinctrl/qcom/pinctrl-msm8917.c             |    2 -
 drivers/pinctrl/qcom/pinctrl-msm8953.c             |    2 -
 drivers/pinctrl/qcom/pinctrl-msm8976.c             |    2 -
 drivers/pinctrl/qcom/pinctrl-msm8994.c             |    2 -
 drivers/pinctrl/qcom/pinctrl-msm8996.c             |    2 -
 drivers/pinctrl/qcom/pinctrl-msm8998.c             |    3 -
 drivers/pinctrl/qcom/pinctrl-msm8x74.c             |    3 -
 drivers/pinctrl/qcom/pinctrl-qcm2290.c             |    3 -
 drivers/pinctrl/qcom/pinctrl-qcs404.c              |    2 -
 drivers/pinctrl/qcom/pinctrl-qcs615.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-qcs8300.c             |    3 -
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c             |    1 -
 drivers/pinctrl/qcom/pinctrl-qdu1000.c             |    3 -
 drivers/pinctrl/qcom/pinctrl-sa8775p.c             |    3 -
 drivers/pinctrl/qcom/pinctrl-sar2130p.c            |    2 -
 drivers/pinctrl/qcom/pinctrl-sc7180.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sc7280.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sc8180x.c             |    3 -
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c            |    3 -
 drivers/pinctrl/qcom/pinctrl-sdm660.c              |    2 -
 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c    |  166 ++
 drivers/pinctrl/qcom/pinctrl-sdm670.c              |    4 -
 drivers/pinctrl/qcom/pinctrl-sdm845.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sdx55.c               |    2 -
 drivers/pinctrl/qcom/pinctrl-sdx65.c               |    3 -
 drivers/pinctrl/qcom/pinctrl-sdx75.c               |    2 -
 drivers/pinctrl/qcom/pinctrl-sm4450.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sm6115.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sm6125.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sm6350.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sm6375.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sm7150.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sm8150.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sm8250.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sm8350.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sm8450.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sm8550.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sm8650.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-sm8750.c              |    3 -
 drivers/pinctrl/qcom/pinctrl-x1e80100.c            |    3 -
 drivers/pinctrl/realtek/Kconfig                    |   14 +
 drivers/pinctrl/realtek/Makefile                   |    1 +
 drivers/pinctrl/realtek/pinctrl-rtd.c              |  224 +-
 drivers/pinctrl/realtek/pinctrl-rtd.h              |   50 +
 drivers/pinctrl/realtek/pinctrl-rtd1625.c          | 3138 ++++++++++++++++=
++++
 drivers/pinctrl/renesas/pinctrl-rza1.c             |    2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |    8 +-
 drivers/pinctrl/renesas/pinctrl-rzt2h.c            |  273 +-
 drivers/pinctrl/sophgo/pinctrl-sg2042.c            |    2 +-
 drivers/pinctrl/sophgo/pinctrl-sg2044.c            |    2 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              |   21 +-
 drivers/pinctrl/starfive/Kconfig                   |    2 -
 drivers/pinctrl/sunplus/Kconfig                    |    1 -
 drivers/pinctrl/tegra/pinctrl-tegra.c              |   10 +-
 drivers/pinctrl/tegra/pinctrl-tegra.h              |    4 +-
 include/linux/pinctrl/consumer.h                   |    9 +
 include/linux/pinctrl/pinconf-generic.h            |    5 +-
 130 files changed, 10454 insertions(+), 759 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio=
.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx27-iomuxc.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yam=
l
 create mode 100644
Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-eliza.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-hawi.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq5210.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd1625.c

