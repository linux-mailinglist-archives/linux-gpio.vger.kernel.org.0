Return-Path: <linux-gpio+bounces-13227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BE69D6DC4
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 11:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FFD6161A08
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 10:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A95189903;
	Sun, 24 Nov 2024 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BcfmiEX3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5447C185B48
	for <linux-gpio@vger.kernel.org>; Sun, 24 Nov 2024 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732445483; cv=none; b=F79oK0b1s64SyCyROlu0vlgwDc8kOwaLUVThua/kXu9SfiH1ej8n8nUfVeaSNn94+zc2p9Dt6jwsNJJk0/RX0QaC0Qj/3aTuYdoCfBipACKSFcBgp77PdUbZj1OhurIKXwpp6XQlGbCOB9H+cp1Xg04IyE1vqXkQw0i6Oe5vBMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732445483; c=relaxed/simple;
	bh=zffOKTdqfjTTv5I/sCG9b00GfKhSgPgasNNUDV1ysok=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=A0SbzHJw/Xxyi0vPekItEEgKsPZjaHfa3BTesH4i5/QeMVm4vy3PcZsAM9mN6m5bVcmOVc3wLyHtCGpmBmgSmzqydWJ3G2o84ZQQHydcZYscuiL8Pd9kjs/Cjv3CHf0mnu6JW9rPnrt7K0d8pWS/uaxyUJDNdE1y8A4YrYumYq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BcfmiEX3; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-5cece886771so5280539a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 24 Nov 2024 02:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732445479; x=1733050279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IRoQ5/TFDPi9vQ2D2F5zOhPJWNXFcAulkMkNcJW6Epw=;
        b=BcfmiEX31oIx4ydw6zJgR4JfttYhZc0Vun9Ves2mCF7N/XbcJeaJrFWmHw/Ka2cwXE
         Qci0kElrENDzv5d534q8PkzRtQsPWc5mOVBkeNXN/4OoX4EzuZojxrdzVxdl2iwxN6Qz
         cPkBkoNY4v8J71/e/lmAOp6AnXGBPiq1dqn+lQ01/+Te+Yfi8Em17yQdL5cnHKtK/b4U
         /4NiAHLzB2Gg52+g4qJ83eTKC8aWIQIG7cYO4W8KAEiRXBQEg0sAFL0WhXDQGUHyvp7N
         uN9wLb3iTg35lNplvrZodnW4n7q5oLv9yMiiivc/rDhKe0PccuAgA5iID5cgpS535ytY
         iAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732445479; x=1733050279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IRoQ5/TFDPi9vQ2D2F5zOhPJWNXFcAulkMkNcJW6Epw=;
        b=Hdh72QHLvKINXeV/+JLQlGf//jIQkgtQCzs6r2c5QFRyJBPzlX8XODILO3JWioljxT
         2T42RV8Nda9DuGFbWGG18HB6ypuGKOXpaaG+jdc8JaC4+YKvJF/kQmhlYOxIvnSYnoY8
         bGHlYyPUhRK/h1wrpoB5FqGtJBhgaMBE9DwV41kjNdeuJrcNwnzT0eD9Fuqmhe6GemNF
         EvyvsFqwzTCAu5DQTPzyd0RxmBkhLLOMfGRO+5D2UCdJ6Y+2RoW50huJSwJMCidzHqhI
         kALNIpt7RArr2BXCZjtN7Cx59RjXVZIsxRBJkuEGEclH7UZrEjRnKfwx24BiDVM6VHSK
         4j7w==
X-Forwarded-Encrypted: i=1; AJvYcCXD7QcabFNMct3hlva+W1bI3USZEEz50LBZb6Biz02q82jnfVF0VGZ3i6iBkZGGvv03dQmj36V3B/nC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ARDrfEcAxQ/eU3r3mfkKKf4UyCC42PnPwaKjnxNLWypPoLm0
	OH8aUdFp9BCDCLH++vGznzO4IpiKY/0S8/FSWqbcsBLyAVWUWG2ueCqhi5th8Ic=
X-Gm-Gg: ASbGncvH+MpAqXkMAIRrCuTK2WlMZZQtiDlDAjEkGWp7IJ8KsZfM1gcDbs2o1oXFoyH
	RSen9gOjjEV6qjJE7x0cGNSbV0fgXFoyeZ1mZP7b/1ftt9lzn5USMWLJHCDT0N5NEq33BAPH5hd
	rPmtJO/gLQ4vL20PePAlAEm85+HRRg7uyckYc7Qr25YEQy4xh4o4Bar9DSybxoyiuRO+VFC8Fp0
	rkWqsoPAv0wmsqb1nvc9YG3w3poHXh5tK3H4kNR/IPv9ZkMiNdjc0ZfvCEb05QOizdS998zYc1Z
	LWnEQCUd+w4fRDSwRFHk
X-Google-Smtp-Source: AGHT+IHUSnB4V4XKnFJZOBm9HqRjQiL9Lrr7Bj5H1pnfj/ZaEVQcms8HU4jA8YugXV5C9/7lLWckhQ==
X-Received: by 2002:a05:6402:1e94:b0:5d0:ffa:7322 with SMTP id 4fb4d7f45d1cf-5d01d56873dmr8435590a12.11.1732445478579;
        Sun, 24 Nov 2024 02:51:18 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3fc6a6sm2910063a12.57.2024.11.24.02.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:51:18 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v4 00/10] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Sun, 24 Nov 2024 11:51:37 +0100
Message-ID: <cover.1732444746.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RP1 is an MFD chipset that acts as a south-bridge PCIe endpoint sporting
a pletora of subdevices (i.e.  Ethernet, USB host controller, I2C, PWM,
etc.) whose registers are all reachable starting from an offset from the
BAR address.  The main point here is that while the RP1 as an endpoint
itself is discoverable via usual PCI enumeraiton, the devices it contains
are not discoverable and must be declared e.g. via the devicetree.

This patchset is an attempt to provide a minimum infrastructure to allow
the RP1 chipset to be discovered and perpherals it contains to be added
from a devictree overlay loaded during RP1 PCI endpoint enumeration.
Followup patches should add support for the several peripherals contained
in RP1.

This work is based upon dowstream drivers code and the proposal from RH
et al. (see [1] and [2]). A similar approach is also pursued in [3].

The patches are ordered as follows:

-PATCHES 1 to 4: add binding schemas for clock, gpio and RP1 peripherals.
 They are needed to support the other peripherals, e.g. the ethernet mac
 depends on a clock generated by RP1 and the phy is reset though the
 on-board gpio controller.

-PATCH 5 and 6: add clock and gpio device drivers.

-PATCH 7: the devicetree overlay describing the RP1 chipset. Please
 note that this patch should be taken by the same maintainer that will
 also take patch 11, since txeieh dtso is compiled in as binary blob and is
 closely coupled to the driver.

-PATCH 8: this is the main patch to support RP1 chipset and peripherals
 enabling through dtb overlay. The dtso since is intimately coupled with
 the driver and will be linked in as binary blob in the driver obj.
 The real dtso is in devicetree folder while the dtso in driver folder is
 just a placeholder to include the real dtso.
 In this way it is possible to check the dtso against dt-bindings.
 The reason why drivers/misc has been selected as containing folder
 for this driver can be seen in [6], [7] and [8].

-PATCH 9: add the external clock node (used by RP1) to the main dts.

-PATCH 10: add the relevant kernel CONFIG_ options to defconfig.

This patchset is also a first attempt to be more agnostic wrt hardware
description standards such as OF devicetree and ACPI, where 'agnostic'
means "using DT in coexistence with ACPI", as been already promoted
by e.g. AL (see [4]). Although there's currently no evidence it will also
run out of the box on purely ACPI system, it is a first step towards
that direction.

Please note that albeit this patchset has no prerequisites in order to
be applied cleanly, it still depends on Stanimir's WIP patchset for BCM2712
PCIe controller (see [5]) in order to work at runtime.

Many thanks,
Andrea della Porta

Links:
- [1]: https://lpc.events/event/17/contributions/1421/attachments/1337/2680/LPC2023%20Non-discoverable%20devices%20in%20PCI.pdf
- [2]: https://lore.kernel.org/lkml/20230419231155.GA899497-robh@kernel.org/t/
- [3]: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/#t
- [4]: https://lore.kernel.org/all/73e05c77-6d53-4aae-95ac-415456ff0ae4@lunn.ch/
- [5]: https://lore.kernel.org/all/20240626104544.14233-1-svarbanov@suse.de/
- [6]: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
- [7]: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
- [8]: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/

CHANGES IN V4:

NEW ADDITIONS ------------------------------------------------

- Patches dealing with bugfix of core functions (1:1 dma-range
  translation and PCI address translation) have been splitted
  in a submission of their own. Also added CC: stable since
  they deal with bugfixes


DEFCONFIG -----------------------------------------

- CONFIG_PINCTRL_RP1 value changed from 'y' to 'm'


RP1 MISC DRIVER -----------------------------------

- Drop 'dev' variable in struct rp1_dev since it's 
  redundant

- Substitute some indentation spaces with tabs

- Virtual irq and local irq automatic variables are now unsigned

- Add a check to unregister interrupts only if the domain has
  been correctly created

- Replace dev_err() with dev_err_probe() where applicable

- Add an exit path check after pci_alloc_irq_vectors() in case
  that less than RP1_INT_END irqs are allocated

- Fix the exit path in case irq_create_mapping() returns an error


GPIO/PINCTRL --------------------------------------

- Can now can be built as a module

- Add MODULE_*() macros

- Replace dev_err() with dev_err_probe() where applicable

- Replace builtin_platform_driver() with module_platform_driver()

- Fix a circular dependency involving CONFIG_GPIOLIB and
  CONFIG_GPIOLIB_IRQCHIP

- PINCTRL_RP1 defaults to MISC_RP1 (and depends also on it)


CLOCKS --------------------------------------

- Dropped all CLK_IGNORE_UNUSED references and reduced the use of
  CLK_IS_CRITICAL to a minium

- COMMON_CLK_RP1 defaults to MISC_RP1

- Drop 'name' and 'flags' variables from clock specific data struct
  in favor of the ones defined in struct clk_init_data. This
  in turn leads to some simplifications in both clock declarations
  and in registration functions, and a general rework of the array
  containing the clock definitions

- Inline substitution of FIELD_SET() macro

- Unify rp1_register_pll*() functions into a single one (with the
  exception of rp1_register_pll_divider)

- Use CLK_HW_INIT_PARENTS_DATA() to initialize the various clocks

- Replace dev_err() with dev_err_probe() where applicable

- Use clk_hw_get_name() to retrieve the clock name for better isolation

- Added a sanity check in rp1_clk_probe() to skip registering NULL entries
  in clk_desc_array[]

- Fixed a bug in rp1_pll_divider_off(): the divider register was
  cleared upon unpreparing the clock, causing some peripherals to
  obtain wrong clock rates.

- Added clk_eth to the list of registered clocks. This is important
  for the ethernet controller to work


DTS -----------------------------------------

- rp1.dtso: dropped clock-names = "xosc"

- rp1.dtso: ranges for reg properties now start from 0x1000000000 instead
  of 0xc040000000 to better reflect the addresses in the chipset documentation.
  Also changed the reg properties in the sub-nodes to reflect this.

- rp1.dtso: added RP1_PLL_SYS_SEC to the list of assigned-clocks (and relative
  assigned-clock-rates). This is needed for some sub-peripherals to work

- bcm2712.dtsi: renamed clock-rp1-xosc to clock-50000000


BINDINGS ------------------------------------

- rp1-clock.yaml: dropped 'clock-names' property (xosc) from  bindings,
  and fixed the example accordingly

- rp1-clock.yaml: #clock-cells description now just mention the binding
  header declaring the clocks

- pci-ep-bus.yaml: shortened the title to comply with coding-style

- rp1-gpio.yaml: added a newline in the main description and in the pins
  description.

- rp1-gpio.yaml: replaced additionalProperties with patternProperties
  enforcing the nodes and subnodes to be postfixed with, respectively,
  -state and -pins. Updated the example to reflect this change.

- pci1de4,1.yaml: ranges and dma-ranges properties are now on a single
  line each.


Andrea della Porta (10):
  dt-bindings: clock: Add RaspberryPi RP1 clock bindings
  dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
  dt-bindings: pci: Add common schema for devices accessible through PCI
    BARs
  dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
  clk: rp1: Add support for clocks provided by RP1
  pinctrl: rp1: Implement RaspberryPi RP1 gpio support
  arm64: dts: rp1: Add support for RaspberryPi's RP1 device
  misc: rp1: RaspberryPi RP1 misc driver
  arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
  arm64: defconfig: Enable RP1 misc/clock/gpio drivers

 .../clock/raspberrypi,rp1-clocks.yaml         |   58 +
 .../devicetree/bindings/misc/pci1de4,1.yaml   |   74 +
 .../devicetree/bindings/pci/pci-ep-bus.yaml   |   58 +
 .../pinctrl/raspberrypi,rp1-gpio.yaml         |  193 +++
 MAINTAINERS                                   |   14 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |    7 +
 arch/arm64/boot/dts/broadcom/rp1.dtso         |   58 +
 arch/arm64/configs/defconfig                  |    3 +
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rp1.c                         | 1527 +++++++++++++++++
 drivers/misc/Kconfig                          |    1 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/rp1/Kconfig                      |   21 +
 drivers/misc/rp1/Makefile                     |    3 +
 drivers/misc/rp1/rp1-pci.dtso                 |    8 +
 drivers/misc/rp1/rp1_pci.c                    |  366 ++++
 drivers/misc/rp1/rp1_pci.h                    |   14 +
 drivers/pci/quirks.c                          |    1 +
 drivers/pinctrl/Kconfig                       |   11 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-rp1.c                 |  789 +++++++++
 .../clock/raspberrypi,rp1-clocks.h            |   61 +
 include/linux/pci_ids.h                       |    3 +
 24 files changed, 3282 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
 create mode 100644 drivers/clk/clk-rp1.c
 create mode 100644 drivers/misc/rp1/Kconfig
 create mode 100644 drivers/misc/rp1/Makefile
 create mode 100644 drivers/misc/rp1/rp1-pci.dtso
 create mode 100644 drivers/misc/rp1/rp1_pci.c
 create mode 100644 drivers/misc/rp1/rp1_pci.h
 create mode 100644 drivers/pinctrl/pinctrl-rp1.c
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

-- 
2.35.3


