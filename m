Return-Path: <linux-gpio+bounces-15585-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E677DA2CF7E
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 22:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FAF8188F4B0
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07221B0439;
	Fri,  7 Feb 2025 21:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GMIXLkWJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B431624F6
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 21:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963860; cv=none; b=fk9l8kIj2rlYfEt9kgSxPXFcq+LrAVrrb27ukCUdX1Vpl4VnNMBCPO6SZRV1xtPVbRjBG4fWYdxfcg3Clt7nn5A4stLj1sBB7ArKhjgTT38MFSNK/lUcUiC/wfAZFnmM+K2P8FsmnZnB0Yb+r+iQG755u2K865JEG2Y/YY+uKZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963860; c=relaxed/simple;
	bh=WHIGRxxdtzNqWH8ZAn4DwpUwVqIKiy4iGUCgzTzN1MQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nR00tcl+AbjEaureXIEgvdXT4iyBB8hDM3wDGRkgT8yndeY6wJvQ0YWGpb/t4zUhy3BO37CBcw2PPUb3nPKyBjAVktMAx+1RON3ENSnQ78+dw1De7XZLtnNDMkq2cIhzffgM9H73besxQ8yLgzRyMoJ3zdqMzPul5lsnLDJR+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GMIXLkWJ; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-ab7430e27b2so469095766b.3
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 13:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963856; x=1739568656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBJYgpNe2Zy2gRsFh41ExOz15Gu4bZ/zj8Bd9suI/jA=;
        b=GMIXLkWJGIcyuzQOahhABfSDD+czMiLpzao+UNBbbjrPY+MjeHHAb8qUtjGyjD9+nI
         dQFbP1KwLIiCc+41WUMl5Sh3tdGGmC0IL8h5jPOdSz43mb11oe2WAVE9/Kv0MxqhXOa/
         Oz2AkNNO8kQD423onsM/QDvnBD0OLbDcuunQCVidx0wMaCSBNalokYODcqjatslW9Mdr
         hXGShBQW/yEcTAMGqMR7LhNj0yVkeQndmJYkc7PdCohrU62hR0Cd0a2uQyRGRzqpESBc
         40J5zGcUp1SaviUrRbsvD5hAShwkiDKBD20cVxQiK1Ha3bPPtfU3vS+a/RSaU33iqP1c
         wZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963856; x=1739568656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBJYgpNe2Zy2gRsFh41ExOz15Gu4bZ/zj8Bd9suI/jA=;
        b=teUf+Eq6ajbZ8Q8CBW7s9yrMmeYSrqkBWPPc4HK9u5Nt8EyJ/fLmjv44mF/LRaSEQp
         Xxgb5nhEsgC0y3bYaTXimVijvR5eTOo49VkARS+23h+I2pyxnn9QuoyG2pDjzZKEdDlx
         2/KxZ6nwqi8XbFw6sNQMwGgpEvbzARVYW5H4arFiXu8mdLWBxUCgGEoocRbqb1MIOgJn
         4K5/wDcgfB4hrwZbU+Kjm88nrpfYPx108whaRiclY431cWmk4L3vLsCUDXHXpPPVyT38
         AeqZ8tiKWUr9eITHX1RnKww7Q+CED0J89fazXI4QjRokhx8lCjKECA8oiIMqkpmZ/xlv
         Np+A==
X-Forwarded-Encrypted: i=1; AJvYcCUNdl2jeicqwevNlvcTVUamk/WKM3dyxBsJaebUAU/5GX2lOb+ejI1OpLv9+qiae8EKtB0sWFD/CKqI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzio5Oq3oZOCPUEiAmERXoO6WsMMVQGQZDknzBWbp3I9H9uv9uf
	/k2sy2kmhqNm+aIbIgSA33ZWVgxz0ZtAFZ+6/XglbvgXj8/x5A7HQMtjjHWUkIE=
X-Gm-Gg: ASbGnct/163zmRuiLzOl7x9rn40TBcDI+xAUXB3tnZfBVDo73inoanrYyMcGcJxQ7oz
	h/hKD1jp/qafVFBOSYpGM7MvIaIQmMOJlznA24gNEL3OFHCPKgyxdNE+JRenrohy8DQj6r7XxKU
	V02Dwyny7Enk9etmwLZNW0LklLwBKreinlSXHBmBqpXeXoom6d1OEzjSVb9gTIgIgZjV3puwzSq
	/Jg/8BI0gSbdysJp7mw+Xo+YYQ6XW+jxFxc7Ym4oePYM/rELHRhc0xMHFUiIxvCZw4vlNBHSG84
	EY2LmClz0DU2iVkF/D+EybkIgQMavAfEsBYc7ywPJpU69OD3PlBzMICeYQw=
X-Google-Smtp-Source: AGHT+IHYuDDLuZlqtQ6Nspmj/6m4io2RGooeIQpuIOV6WNrioVZw+PtkcdK6Lw8MV30RRA4HV39EBQ==
X-Received: by 2002:a17:907:7e94:b0:ab7:6d59:3b4c with SMTP id a640c23a62f3a-ab789adaf0bmr433844966b.21.1738963856272;
        Fri, 07 Feb 2025 13:30:56 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79d4df211sm23307866b.32.2025.02.07.13.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:30:55 -0800 (PST)
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
Subject: [PATCH v7 00/11] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Fri,  7 Feb 2025 22:31:40 +0100
Message-ID: <cover.1738963156.git.andrea.porta@suse.com>
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

-PATCH 11 (OPTIONAL): enable CONFIG_OF_OVERLAY in order for 'make defconfig'
 to produce a configuration valid for the RP1 driver. Without this
 patch, the user has to explicitly enable it since the misc driver depends
 on OF_OVERLAY.

This patchset is also a first attempt to be more agnostic wrt hardware
description standards such as OF devicetree and ACPI, where 'agnostic'
means "using DT in coexistence with ACPI", as been already promoted
by e.g. AL (see [4]). Although there's currently no evidence it will also
run out of the box on purely ACPI system, it is a first step towards
that direction.

Please note that albeit this patchset has no prerequisites in order to
be applied cleanly, it still depends on Stanimir's WIP patchset for BCM2712
PCIe controller (see [5] and newer versions) in order to work at runtime.

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

CHANGES IN V7


PATCH RELATED -------------------------------------------------

- patchset rebased upon v6.14-rc1
- patch 1,2,3,4,7,9: added: Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
- patch 1: fixed a typo in the description
- added new *optional* patch 11 to enable OF_OVERLAY in defconfig


RP1 CLOCK DRIVER ------------------------------------

- clk-rp1.c: general rework of the register fields defined via GENMASK


RP1 MISC DRIVER -----------------------------------

- Added a short explanation about the reasons why this driver
  is contained in drivers/misc, as an addition to the links
  pointing to the entire discussion in the maling list

- Deleted rpi_pci.h which only contained extern reference to
  symbols created automatically by cmd_wrap_S_dtb to include
  the dtb overlay as a binary blob accessible by the driver.
  Those symbols are only accessed by rpi_pci.c and are not intended
  to be visible elsewhere. A new comment better specify this
  to avoid confusion

- Used KBUILD_MODNAME as pci_driver.name

- Kconfig: solved a recursive dependency on OF_OVERLAY


Andrea della Porta (11):
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
  arm64: defconfig: Enable OF_OVERLAY option

 .../clock/raspberrypi,rp1-clocks.yaml         |   58 +
 .../devicetree/bindings/misc/pci1de4,1.yaml   |  135 ++
 .../devicetree/bindings/pci/pci-ep-bus.yaml   |   58 +
 .../pinctrl/raspberrypi,rp1-gpio.yaml         |  198 +++
 MAINTAINERS                                   |   14 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |    7 +
 arch/arm64/boot/dts/broadcom/rp1.dtso         |   58 +
 arch/arm64/configs/defconfig                  |    4 +
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rp1.c                         | 1511 +++++++++++++++++
 drivers/misc/Kconfig                          |    1 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/rp1/Kconfig                      |   20 +
 drivers/misc/rp1/Makefile                     |    3 +
 drivers/misc/rp1/rp1-pci.dtso                 |    8 +
 drivers/misc/rp1/rp1_pci.c                    |  305 ++++
 drivers/pci/quirks.c                          |    1 +
 drivers/pinctrl/Kconfig                       |   11 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-rp1.c                 |  789 +++++++++
 .../clock/raspberrypi,rp1-clocks.h            |   61 +
 include/linux/pci_ids.h                       |    3 +
 23 files changed, 3257 insertions(+)
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
 create mode 100644 drivers/pinctrl/pinctrl-rp1.c
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

-- 
2.35.3


