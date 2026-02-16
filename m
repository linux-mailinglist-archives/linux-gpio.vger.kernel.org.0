Return-Path: <linux-gpio+bounces-31706-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOBnJ6nwkmlA0QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31706-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 11:25:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B154014253D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 11:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18145300139F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 10:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F032FFDD5;
	Mon, 16 Feb 2026 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEpb7jt+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E2C2FF67A
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 10:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771237540; cv=none; b=kbmP17Wbr/HSAzTMBYzsiA5nk8Uat0fYOKBwLNWyL02DTNkSRpCInadCAOCkLZY0o09huDyelmmVwrTy/zmT9uAmVpHcW/0gA2BrMil6QG3MsSvjKnnYGjJ2RSz+ZPW/ZAABCjpf5cyhWw6sbUed8n2LJk5AIHKcj63AO2+i/3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771237540; c=relaxed/simple;
	bh=nN3NGgehVS9J9Nl83MPNeW0A6C1jJSGXSPO64q6xeGQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=td3LA5GHhIUOaE24vXLXFvArCTzhyykTl4Y1rUGnSNL+jaKKlhxpjBHBCPDOyFVvfw9TEvuQIqigJwDj+fMJLaUhIVo0rsDrc5f3Qjo/fJBjppY5N7OVZe1/G9N/ta+8xyvexGgITc54JpCSzFLZaHemX/1Iflj81OS+Cpjm6zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEpb7jt+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6FCC19422
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771237539;
	bh=nN3NGgehVS9J9Nl83MPNeW0A6C1jJSGXSPO64q6xeGQ=;
	h=From:Date:Subject:To:Cc:From;
	b=YEpb7jt+FWEk91WMp3NN+oTQ4cwntzsc50FwbaTDzIES2aTVWOGiEXzeeOjxCEqSU
	 0HuqPaUrNFPsv9oo++FcU04/ZnWQtv7V4zGAvGaxRroOCuyUALjURBSu19YYR/RVE/
	 okdnRYVss2ZZuMbzbA7mDwgEQ3iPBzV6dx2oTWLVLHrHm76QNTrtUUrWf318TFQ0ue
	 3GHr7tq9VzfbmcmYY40cXpUy812icMjpPmGWXMpCatc92O+4aO2qmAG/rI1p7km8ON
	 e+hefeeasQRCZ1VqobxL1Inurcr1kYN+BjpHndItutdE4MkocVZX5ogI56+z8yvYaN
	 Q0TMS6oIRN+kg==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-649d4690174so2357645d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 02:25:39 -0800 (PST)
X-Gm-Message-State: AOJu0Yx9HwEw9T0Z7fxJtQsSkMhCFN3s5FSjxMZUpGZZDgBJPv1wnwWR
	9U/9C6jalPlNd6emXO9giV2lCSP5ly1r/uWyEDuuyfxC33G3FTdHf1EGtKpjl3Kgk3asi3SOxb2
	1z8NYKTHDXLKPzCxh2mPwT0UR4Is5dR8=
X-Received: by 2002:a53:ac86:0:b0:64a:e7e0:a711 with SMTP id
 956f58d0204a3-64c21a442acmr6065905d50.11.1771237539162; Mon, 16 Feb 2026
 02:25:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Feb 2026 11:25:28 +0100
X-Gmail-Original-Message-ID: <CAD++jL=AQZ3-SXjbHgHPvNppi0iMUHDG0S4uqaQXPs8rk3V5wg@mail.gmail.com>
X-Gm-Features: AaiRm52dmOGTyGaDK-AKnzBQvkhFMeS0UfbWdGBRrF8hjrvT-_n_AGOJeAjbO6Q
Message-ID: <CAD++jL=AQZ3-SXjbHgHPvNppi0iMUHDG0S4uqaQXPs8rk3V5wg@mail.gmail.com>
Subject: [GIT PULL] pin control bulk changes for v7.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31706-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B154014253D
X-Rspamd-Action: no action

Hi Linus,

here is the bulk of pin control changes for the v7.0 series.

You will get a conflict in drivers/pinctrl/Kconfig, just delete the offendi=
ng
hunk there: this is because we moved the files to their own subdir in an
early fix in the v6.19-rc:s (IIRC).

Other than that it is mostly drivers here, nothing much exciting. Details
in the signed tag and changes boiled in -next a while.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.0-1

for you to fetch changes up to 9c5a40f2922a5a6d6b42e7b3d4c8e253918c07a1:

  pinctrl: generic: move function to amlogic-am4 driver (2026-02-06
12:07:14 +0100)

----------------------------------------------------------------
Pin control changes for the v7.0 kernel cycle:

Core changes:

- Drop the unused devm_pinctrl_unregister() function.

- Move pretended generic pin control functionality out of the
  core and into the Amlogic AM4 driver. We have something better
  coming (hopefully).

New hardware support:

- Spacemit K3 (RISC-V) pin control support.

- Atmel AT91 PIO4 (ARM32) SAMA7D65 pin control support.

- Exynos9610 (ARM64) pin control support.

- Qualcomm Mahua TLMM (ARM64) pin control support.

- Microchip Polarfire MSSIO (RISC-V) pin control support.

- Ocelot LAN9645XF (multiplatform) pin control support.

Improvements:

- Using a few more guards for locking.

- Various nonurgent fixes and tweaks.

----------------------------------------------------------------
Akari Tsuyukusa (1):
      pinctrl: mediatek: remove unused drv_offset field

Akiyoshi Kurita (1):
      dt-bindings: pinctrl: intel: keembay: fix typo

Alexandru Chimac (3):
      dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
      pinctrl: samsung: Add Exynos9610 pinctrl configuration

Andrew Jeffery (1):
      pinctrl: aspeed: g5: Constrain LPC binding revision workaround to AST=
2500

Andy Shevchenko (13):
      pinctrl: baytrail: Convert to use intel_gpio_add_pin_ranges()
      pinctrl: lynxpoint: Convert to use intel_gpio_add_pin_ranges()
      pinctrl: intel: platform: Add Nova Lake to the list of supported
      pinctrl: intel: Remove duplicate error messages
      pinctrl: baytrail: Remove duplicate error messages
      pinctrl: cherryview: Remove duplicate error messages
      pinctrl: lynxpoint: Remove duplicate error messages
      pinctrl: tangier: Remove duplicate error messages
      pinctrl: tangier: Join tng_pinctrl_probe() into its wrapper
      pinctrl: core: Remove unused devm_pinctrl_unregister()
      pinctrl: core: Simplify devm_pinctrl_*()
      pinctrl: core: Remove duplicate error messages
      pinctrl: intel: Align Copyright note with corporate guidelines

Bartosz Golaszewski (3):
      pinctrl: meson: extend build coverage with COMPILE_TEST=3Dy
      pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
      driver core: make pinctrl_bind_pins() private

Chen-Yu Tsai (1):
      dt-bindings: pinctrl: sunxi: Allow pinmux sub-pattern with leading nu=
mbers

Conor Dooley (7):
      pinctrl: move microchip riscv pinctrl drivers to a folder
      pinctrl: add generic functions + pins mapper
      dt-bindings: pinctrl: document polarfire soc mssio pin controller
      pinctrl: add polarfire soc mssio pinctrl driver
      MAINTAINERS: add Microchip mpfs mssio driver/bindings to entry
      pinctrl: fix kismet issues with GENERIC_PINCTRL
      pinctrl: generic: move function to amlogic-am4 driver

Cosmin Tanislav (4):
      pinctrl: renesas: rzt2h: Move GPIO enable/disable into separate funct=
ion
      pinctrl: renesas: rzt2h: Allow .get_direction() for IRQ function GPIO=
s
      dt-bindings: pinctrl: renesas,r9a09g077-pinctrl: Document GPIO IRQ
      pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts

Felix Gu (2):
      pinctrl: equilibrium: Fix device node reference leak in pinbank_init(=
)
      pinctrl: meson: amlogic-a4: Fix device node reference leak in bank he=
lpers

Gopikrishna Garmidi (2):
      dt-bindings: pinctrl: qcom,glymur-tlmm: Document Mahua TLMM block
      pinctrl: qcom: glymur: Add Mahua TLMM support

Jens Emil Schulz =C3=98stergaard (3):
      dt-bindings: pinctrl: ocelot: Add LAN9645x SoC support
      pinctrl: ocelot: Update alt mode reg addr calculation
      pinctrl: ocelot: Extend support for lan9645xf family

Jiayu Du (1):
      pinctrl: canaan: k230: Fix NULL pointer dereference when parsing
devicetree

Johan Hovold (1):
      pinctrl: fix compile test defaults

Krzysztof Kozlowski (11):
      pinctrl: aspeed: Cleanup header includes
      pinctrl: starfive: jh7110-sys: Cleanup header includes
      pinctrl: sophgo: Cleanup header includes
      pinctrl: amd: Cleanup header includes
      pinctrl: aw9523: Simplify locking with guard()
      pinctrl: microchip-sgpio: Simplify locking with guard()
      pinctrl: tb10x: Simplify locking with guard()
      pinctrl: tegra-xusb: Return void in padctl enable/disable functions
      pinctrl: tegra-xusb: Simplify locking with guard()
      pinctrl: rockchip: Simplify locking with scoped_guard()
      pinctrl: st: Annotate st_pinconf_dbg_show() as holding mutex

Liang Jie (1):
      pinctrl: mediatek: make devm allocations safer and clearer in
mtk_eint_do_init()

Linus Walleij (6):
      pinctrl: apple: Use unsigned int instead of unsigned
      pinctrl: apple: Implement GPIO func check callback
      Merge tag 'renesas-pinctrl-for-v6.20-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'samsung-pinctrl-6.20' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel
      Merge tag 'intel-pinctrl-v6.20-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel
      Merge tag 'intel-pinctrl-v6.20-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel

Luca Weiss (1):
      pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups definition

Peng Fan (1):
      pinctrl: imx: Add support for NXP i.MX952

Raag Jadav (1):
      pinctrl: intel: Add code name documentation

Ranjani Vaidyanathan (1):
      pinctrl: imx: Support NXP scmi extended mux config

Robert Marko (1):
      dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x

Ryan Wanner (1):
      pinctrl: at91-pio4: Add sama7d65 pio4 support

Shiji Yang (1):
      pinctrl: mediatek: enable ies_present flag for MT798x

Troy Mitchell (2):
      dt-bindings: pinctrl: spacemit: add syscon property
      pinctrl: spacemit: support I/O power domain configuration

Wei Li (1):
      pinctrl: single: fix refcount leak in pcs_add_gpio_func()

Yixun Lan (6):
      dt-bindings: pinctrl: spacemit: convert drive strength to schema form=
at
      dt-bindings: pinctrl: spacemit: add K3 SoC support
      pinctrl: spacemit: k3: add initial pin support
      pinctrl: spacemit: k3: adjust drive strength and schmitter trigger
      dt-bindings: pinctrl: spacemit: k3: fix drive-strength doc
      dt-bindings: pinctrl: spacemit: fix drive-strength check warning

 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml       |   2 +-
 .../bindings/pinctrl/intel,pinctrl-keembay.yaml    |   2 +-
 .../pinctrl/microchip,mpfs-pinctrl-mssio.yaml      | 109 +++
 .../bindings/pinctrl/microchip,sparx5-sgpio.yaml   |  20 +-
 .../bindings/pinctrl/mscc,ocelot-pinctrl.yaml      |   6 +
 .../bindings/pinctrl/qcom,glymur-tlmm.yaml         |   6 +-
 .../pinctrl/renesas,r9a09g077-pinctrl.yaml         |  13 +
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |  27 +-
 .../microchip/microchip,mpfs-mss-top-sysreg.yaml   |   4 +
 Documentation/driver-api/driver-model/devres.rst   |   1 -
 MAINTAINERS                                        |   6 +-
 drivers/base/base.h                                |   9 +
 drivers/base/pinctrl.c                             |   2 +
 drivers/pinctrl/Kconfig                            |  25 +-
 drivers/pinctrl/Makefile                           |   4 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |   4 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |   7 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |   5 +-
 drivers/pinctrl/core.c                             |  93 +--
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       |  20 +-
 drivers/pinctrl/intel/Kconfig                      |  22 +-
 drivers/pinctrl/intel/pinctrl-alderlake.c          |   2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c           |  45 +-
 drivers/pinctrl/intel/pinctrl-broxton.c            |   2 +-
 drivers/pinctrl/intel/pinctrl-cannonlake.c         |   2 +-
 drivers/pinctrl/intel/pinctrl-cedarfork.c          |   2 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |   4 +-
 drivers/pinctrl/intel/pinctrl-denverton.c          |   2 +-
 drivers/pinctrl/intel/pinctrl-elkhartlake.c        |   2 +-
 drivers/pinctrl/intel/pinctrl-emmitsburg.c         |   2 +-
 drivers/pinctrl/intel/pinctrl-icelake.c            |   2 +-
 drivers/pinctrl/intel/pinctrl-intel-platform.c     |   2 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |   4 +-
 drivers/pinctrl/intel/pinctrl-intel.h              |   2 +-
 drivers/pinctrl/intel/pinctrl-jasperlake.c         |   2 +-
 drivers/pinctrl/intel/pinctrl-lakefield.c          |   2 +-
 drivers/pinctrl/intel/pinctrl-lewisburg.c          |   2 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |  31 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c         |   2 +-
 drivers/pinctrl/intel/pinctrl-meteorlake.c         |   2 +-
 drivers/pinctrl/intel/pinctrl-meteorpoint.c        |   2 +-
 drivers/pinctrl/intel/pinctrl-moorefield.c         |   2 +-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |   2 +-
 drivers/pinctrl/intel/pinctrl-tangier.c            |  23 +-
 drivers/pinctrl/intel/pinctrl-tangier.h            |   2 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |   2 +-
 drivers/pinctrl/mediatek/mtk-eint.c                |  29 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c          |   2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c          |   4 +-
 drivers/pinctrl/mediatek/pinctrl-mt7988.c          |   2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8365.c          |   1 -
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h      |   1 -
 drivers/pinctrl/meson/Kconfig                      |  22 +-
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         |  83 ++-
 drivers/pinctrl/microchip/Kconfig                  |  17 +
 drivers/pinctrl/microchip/Makefile                 |   5 +
 .../pinctrl/{ =3D> microchip}/pinctrl-mpfs-iomux0.c  |   8 +-
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c     | 737 +++++++++++++++++=
++++
 .../{ =3D> microchip}/pinctrl-pic64gx-gpio2.c        |   2 +-
 drivers/pinctrl/pinconf-generic.c                  |  69 --
 drivers/pinctrl/pinconf.h                          |  16 +
 drivers/pinctrl/pinctrl-amd.c                      |   2 -
 drivers/pinctrl/pinctrl-apple-gpio.c               |  18 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |   9 +
 drivers/pinctrl/pinctrl-aw9523.c                   |  53 +-
 drivers/pinctrl/pinctrl-equilibrium.c              |   1 +
 drivers/pinctrl/pinctrl-generic.c                  | 189 ++++++
 drivers/pinctrl/pinctrl-k230.c                     |   7 +-
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |   6 +-
 drivers/pinctrl/pinctrl-ocelot.c                   | 184 ++++-
 drivers/pinctrl/pinctrl-rockchip.c                 |  19 +-
 drivers/pinctrl/pinctrl-scmi.c                     |   3 +-
 drivers/pinctrl/pinctrl-single.c                   |   2 +
 drivers/pinctrl/pinctrl-st.c                       |   1 +
 drivers/pinctrl/pinctrl-tb10x.c                    |  17 +-
 drivers/pinctrl/qcom/pinctrl-glymur.c              |  46 +-
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c    |   2 +-
 drivers/pinctrl/renesas/Kconfig                    |   2 +
 drivers/pinctrl/renesas/pinctrl-rzt2h.c            | 248 ++++++-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 117 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h            |   4 -
 drivers/pinctrl/sophgo/pinctrl-sg2042.h            |   6 -
 drivers/pinctrl/spacemit/Kconfig                   |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 642 ++++++++++++++++-=
-
 .../pinctrl/starfive/pinctrl-starfive-jh7110-sys.c |   3 -
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  30 +-
 include/linux/pinctrl/devinfo.h                    |   6 -
 include/linux/pinctrl/pinconf-generic.h            |   5 -
 include/linux/pinctrl/pinctrl.h                    |   3 -
 93 files changed, 2670 insertions(+), 496 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
 create mode 100644 drivers/pinctrl/microchip/Kconfig
 create mode 100644 drivers/pinctrl/microchip/Makefile
 rename drivers/pinctrl/{ =3D> microchip}/pinctrl-mpfs-iomux0.c (98%)
 create mode 100644 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
 rename drivers/pinctrl/{ =3D> microchip}/pinctrl-pic64gx-gpio2.c (99%)
 create mode 100644 drivers/pinctrl/pinctrl-generic.c

