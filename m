Return-Path: <linux-gpio+bounces-19139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 241A5A974B7
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 20:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51C34176393
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 18:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1482980D0;
	Tue, 22 Apr 2025 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Mf4lNTTA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B421E1A05
	for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 18:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745347927; cv=none; b=gjqHp0Aa6nZ9nXK/Ub37C2FiMffc4fXM/3H/WHbdgZviHh8cy3BSp+M9thaF6VTfNeklTfNajjihP0JU0+DRI6rW2lNm1r9b3ar361qRFfzcmQg2W8sT4+qNKFCkaFIDMkCybigNn629PuwJUolxgCVhFJWQlFqAKz1VtacA3WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745347927; c=relaxed/simple;
	bh=d1ZKYhOAkYo303gP+HNF16iUinqUdjSKGqVlLz4wbEc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=XCpYW7Mfy1K/wwyHwMSU8dgnso2sW8B438AecMAAHEzFvMxSoREDrlO92gRBWPoKV6Hekk7w9mTIe1wKx9RnMFTAJAsm78t1/d18zuid9+aK+GYDRhylTdAGdwETqO61xL54QqOd5rkPyqV9cBg6O0zKcfCNigq9SAscY0ZUf9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Mf4lNTTA; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-39149bccb69so2358923f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 11:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347922; x=1745952722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0jYZzp2m3rJocRHqJkPGj8t9XumriM/fA2gWN3X5VLQ=;
        b=Mf4lNTTALkuv61F+iS3e6OP4+iM9czmzDmAQO6Xr3AJmXX3YUtW/IkNeNq26Udb0E4
         Ni3DVsKljIX+E0Tao+xNEaKtuVSCMEUKn9aEoSVpz/qa2t3TJ8nqOwCHzW62XNd+nLbq
         VjXODcVTjKzms8/wQBYHhV44R6FzLelSNyZ4R60nHETpJsfBuFs/5h71fU0JHDglwfJz
         ApRK/eu4jjLUGgm4NQ51XcFro654plFCD0tefLv5fKl0fIBXQ0Zl7ubNVz/6so5BPnfp
         SWZXFkcYU3bC8GXbInSmW+SH0Z95Zw1vuvaoOs3za48jCSGXrRI8SB0urK7BEKhIYZ4O
         2i1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347922; x=1745952722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jYZzp2m3rJocRHqJkPGj8t9XumriM/fA2gWN3X5VLQ=;
        b=Of2ACHLFZykJYZKPzWZLfTDUXIMkjfEVaxKekF3qgIXzWyJ/PYVUMjQD7tNRbZixj0
         WGWK1P/s9Ppx9SXZT1vfejSI1KNM/e3M6hjo5kbjlVgSzrWq3LSTc8kB49Gdv6cCtcY8
         J5dlNsL5Qs+GkRybF2GutcrZC1Q4bYgkWk9ThZXsUvWzulKSadjO8f6ZpNwRQ0XTm0Dc
         ywJI9phyihk+s1Ag6l2D6ra94KmikDa50h8nKZLhirLqLluFVibR5bWfCFs9bxSJfm1g
         3GTbg13OT+rwGXMPKxsX9dQAhOeqlHx7s5Zq8PoPbXQAVOCdBH2UBd8O6OHJ9z0S8tc7
         gzHw==
X-Forwarded-Encrypted: i=1; AJvYcCXk+X/lggPhXiIdAgr28Jj1t5HgZkjEcGswvoiobQx3tkzsv0qRTnFxvu9/5sVtuTQq+RPOoRaP3uI+@vger.kernel.org
X-Gm-Message-State: AOJu0YxP/Sv3jj77pnR2PDtcBnwgR/BVW6d83uMKfp6IvPCAg3SqbOhK
	bUBg1yNkjHf+LEqOk0GvCiwHheaPUcj2vdO8F6YgSLROzOefHWpyE0/PBlF2PM8=
X-Gm-Gg: ASbGncv9OYeUY5H1mm0iuO1I4PNhCC8BkBugn+P5cXa0Fhagt21in85R0EwPSUdNuDo
	hqJ1b17ziiS0iOCj1KDB1q/IYaBhaJq31Za3XVnXObf0iFbfg6jFFJAcrDduwXwiqqyOD0Wfvth
	F86P18DPa9H7R25SBcYwo0LqO7glQW3++lnRkWZch6oT53/ngNvIgz9WCjby9DkY478tCuYWYLQ
	ut+t+1YkKwlKmn+4CbBTs8eTG28GL2KU1jYPU8Zk9vioGx8KM/vOsBAejIM/+aa7Rf0WQM4ceqO
	BtaHg/UeAaDZNpH0DZRjvRdB2+yyDuaww9Qbzw4JMS1MLUl2xVlK1SibUhMcT9cwQW6CbcUFNdE
	A7EqdZw==
X-Google-Smtp-Source: AGHT+IEHrA8/5iMMk838JwvYEMJ8MIlvTyjc4FVX8BePMsqeS4R2c2WZZfYix+jfAiEZqawBBzBmYw==
X-Received: by 2002:a05:6000:1889:b0:39f:31f4:f2b9 with SMTP id ffacd0b85a97d-39f31f4f32fmr3786363f8f.32.1745347922481;
        Tue, 22 Apr 2025 11:52:02 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433170sm15912911f8f.25.2025.04.22.11.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:02 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v9 -next 00/12] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Tue, 22 Apr 2025 20:53:09 +0200
Message-ID: <cover.1745347417.git.andrea.porta@suse.com>
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
from a devictree overlay loaded during RP1 PCI endpoint enumeration. To
ensure compatibility with downstream, a devicetree already comprising the
RP1 node is also provided, so it's not strictly necessary to use the
dynamically loaded overlay if the devicetree is already fully defined at
the origin.
To achieve this modularity, the RP1 node DT definitions are arranged by
file inclusion as per following schema (the arrow points to the includer,
see also [9]):
 
 rp1-pci.dtso         rp1.dtso
     ^                    ^
     |                    |
rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b.dts
                                               ^
                                               |
                                           bcm2712-rpi-5-b-ovl-rp1.dts

Followup patches should add support for the several peripherals contained
in RP1.

This work is based upon dowstream drivers code and the proposal from RH
et al. (see [1] and [2]). A similar approach is also pursued in [3].

The patches are ordered as follows:

-PATCHES 1 to 3: add binding schemas for clock, gpio and RP1 peripherals.
 They are needed to support the other peripherals, e.g. the ethernet mac
 depends on a clock generated by RP1 and the phy is reset through the
 on-board gpio controller.

-PATCH 4 and 5: add clock and gpio device drivers.

-PATCH 6: the devicetree node describing the RP1 chipset. Please
 note that this patch should be taken by the same maintainer that will
 also take patch 8, since the definition it contains is possibly used
 by the dtso compiled in as binary blob and is closely coupled to the
 driver.

-PATCH 7: this is the main patch to support RP1 chipset. It can work
 either with a fully defined devicetree (i.e. one that already included
 the rp1 node since boot time) or with a runtime loaded dtb overlay
 which is linked as binary blob in the driver obj. This duality is
 useful to comply with both downstream and upstream needs (see [9]).
 The real dtso is in devicetree folder while the dtso in driver folder is
 just a placeholder to include the real dtso.
 In this way it is possible to check the dtso against dt-bindings.
 The reason why drivers/misc has been selected as containing folder
 for this driver can be seen in [6], [7] and [8].

-PATCH 8: add the external clock node (used by RP1) to the main dts.

-PATCH 9: the fully fledged devictree containing also the rp1 node.
 This devicetree is functionally similar to the one downstream is using.

-PATCH 10 (OPTIONAL): this patch introduces a new scenario about how
 the rp1 node is specified and loaded in DT. On top of the base DT
 (without rp1 node), the fw loads this overlay and the end result is
 the same devicetree as in patch 9, which is then passed to the next
 stage (either the kernel or u-boot/bootloader).
 While this patch is not strictly necessary and can therefore be dropped
 (see [10]), it's not introducing much extra work and maybe can come
 in handy while debugging.

-PATCH 11: add the relevant kernel CONFIG_ options to defconfig.

-PATCH 12: enable CONFIG_OF_OVERLAY in order for 'make defconfig'
 to produce a configuration valid for the RP1 driver. Without this
 patch, the user has to explicitly enable it since the misc driver
 depends on OF_OVERLAY.

This patchset is also a first attempt to be more agnostic wrt hardware
description standards such as OF devicetree and ACPI, where 'agnostic'
means "using DT in coexistence with ACPI", as been already promoted
by e.g. AL (see [4]). Although there's currently no evidence it will also
run out of the box on purely ACPI system, it is a first step towards
that direction.

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
- [9]: https://lore.kernel.org/all/Z87wTfChRC5Ruwc0@apocalypse/
- [10]: https://lore.kernel.org/all/CAMEGJJ0f4YUgdWBhxvQ_dquZHztve9KO7pvQjoDWJ3=zd3cgcg@mail.gmail.com/#t

CHANGES IN V9

PATCH RELATED -------------------------------------------------

- Rebased on next-20250422 to avoid errors while compiling the DTBs
  against v6.15-rcX.

- Dropped patch 3 from V8 ("Add common schema for devices accessible
  through PCI BARs") because it's already accepted in upstream tree.
  The cover letter has been adjusted accordingly.

- Patch 6: Style change: added a blank line in the commit comment.

- Patch 7: Added: Acked-by: Bjorn Helgaas <bhelgaas@google.com>   # quirks.c, pci_ids.h

- Patch 9 and 10: added 'broadcom' to the subject.

- Current patch 9 is now in front of every other dts related patches
  since it's functionally required for later patches to work.

- Patch 12: Added: Reviewed-by: Stefan Wahren <wahrenst@gmx.net>


BINDINGS ------------------------------------------------------

- File renaming: bcm2712-rpi-5-b.dts is now the fully populated board dts
  (i.e. the one that includes rp1 node), while the overlay-ready
  one is now bcm2712-rpi-5-b-ovl-rp1.dts.

- bcm2712-rpi-5-b.dts: Added an explanatory comment about the usage
  of this file.


RP1 CLOCK DRIVER ------------------------------------

- Implemented the delay needed to ensure the pll vco is stable (was
  a TODO comment).


RP1 MISC DRIVER -----------------------------------

- rp1_pci.c: Capitalized any IRQ occurrences in message strings.


Andrea della Porta (12):
  dt-bindings: clock: Add RaspberryPi RP1 clock bindings
  dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
  dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
  clk: rp1: Add support for clocks provided by RP1
  pinctrl: rp1: Implement RaspberryPi RP1 gpio support
  arm64: dts: rp1: Add support for RaspberryPi's RP1 device
  misc: rp1: RaspberryPi RP1 misc driver
  arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
  arm64: dts: broadcom: Add board DTS for Rpi5 which includes RP1 node
  arm64: dts: broadcom: Add overlay for RP1 device
  arm64: defconfig: Enable RP1 misc/clock/gpio drivers
  arm64: defconfig: Enable OF_OVERLAY option

 .../clock/raspberrypi,rp1-clocks.yaml         |   58 +
 .../devicetree/bindings/misc/pci1de4,1.yaml   |  137 ++
 .../pinctrl/raspberrypi,rp1-gpio.yaml         |  198 +++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/broadcom/Makefile         |    4 +-
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  |  121 ++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  117 +-
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   42 +
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi   |   14 +
 arch/arm64/boot/dts/broadcom/rp1.dtso         |   11 +
 arch/arm64/configs/defconfig                  |    4 +
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rp1.c                         | 1510 +++++++++++++++++
 drivers/misc/Kconfig                          |    1 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/rp1/Kconfig                      |   20 +
 drivers/misc/rp1/Makefile                     |    3 +
 drivers/misc/rp1/rp1-pci.dtso                 |   25 +
 drivers/misc/rp1/rp1_pci.c                    |  333 ++++
 drivers/pci/quirks.c                          |    1 +
 drivers/pinctrl/Kconfig                       |   11 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-rp1.c                 |  790 +++++++++
 .../clock/raspberrypi,rp1-clocks.h            |   61 +
 include/linux/pci_ids.h                       |    3 +
 26 files changed, 3376 insertions(+), 108 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-common.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
 create mode 100644 drivers/clk/clk-rp1.c
 create mode 100644 drivers/misc/rp1/Kconfig
 create mode 100644 drivers/misc/rp1/Makefile
 create mode 100644 drivers/misc/rp1/rp1-pci.dtso
 create mode 100644 drivers/misc/rp1/rp1_pci.c
 create mode 100644 drivers/pinctrl/pinctrl-rp1.c
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

-- 
2.35.3


