Return-Path: <linux-gpio+bounces-13387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878959E00B0
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 12:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4A84B2FDCB
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 11:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4644C200BA9;
	Mon,  2 Dec 2024 11:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TXu+Y0bo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83C91FF7CF
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138348; cv=none; b=MfiGyMLaMmH3YyX44mAsi5vVRV/9gt5fnnf9YOT6pGBJWMQcw1QnTLudmo2XO57nTM1t/kFfCE8Lfdk6tjTYKqI969EpZt6xv05fqWYG2CzcvPOqlirTe+je79GFGNYOfzXjaAJS5Il+Me5TntWW9IuqfbzJQWdN7pxOgIv0PBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138348; c=relaxed/simple;
	bh=uCQAgYJ6+Mc+JfRJ9hb9AD/dXQ/2I9Ya9X92PLE+rv4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=CFsDOSxVPkO612FtxUBKNfReCYGRDGsdzuo8cQZRwUsn7s0k+0RQWtun+8j9CExLSn6qj36xH/pr0H5ED1iQTGBkJP0PFpabtN/oOFa0Yi5bPpNkI7fhjY1Rt9ojqoO2tC7S63MRNjKsSkgnISf9Lrm2aLo1OCQjin2lWFIIzcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TXu+Y0bo; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-a9ec267b879so665727366b.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 03:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138343; x=1733743143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gjHlwSiznG7ZMzHVL1AbaIvEmzPENJ2D8a0GdBICd5U=;
        b=TXu+Y0bolKfe6SMv8VBE4+Tr1REpZgemdQnddEfgtX8TNnsmT8zpxnbF6849gOTDUQ
         dZwlHbiRhZc+Dt/ns+DUamxgEXNNycl2AERaEszXt+R2eOL93ubajPS2IEUYE59GB1/w
         AFDEye1nJfIHmuymBl9Jzjsp0p6QPe5Ani1IUbq2GF8GEb8uxrbD7hFsaNw62zRXPPkU
         EWD/rMQ931QAUM9Oe3ezbVIDC8MPtzo+RqUem9Po1mkLQflVFWbX+KBBpJ6M3mnkZBK2
         HhM4bfJaZARxdoNrtcgfy+i7LlwRHbIz4bhMz/pv9Zcla4Kv5A69VCtWqfj0g44yTqaV
         hSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138343; x=1733743143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjHlwSiznG7ZMzHVL1AbaIvEmzPENJ2D8a0GdBICd5U=;
        b=tKAcbVO6OXdn4CQ/BgoliPM4OrTMSYSUvYDxIf314wmqQnELrXxxdbUfGKKnLYVvhD
         cOS9f87tlMSrVtrwJIXjko32JqA0vq5td1sDo6WCJCT2bxnMIN/pwKFaMixFpY7KXA1f
         Viq1RTHPx70uH2IODhz/s4DHAcb7SPa5nyfugdQRrHEA4HcPOQ+uBsz+yxIXblgK89Yn
         KuUocIHWjcT6P8TknZ7vf+1JDV5thw5RogC8TiJazB91pXAu11XyvuszluvNxSyGBhed
         dFW1cO6ww+rVNG06LAsLlEDn8z03OELityWnsUn4KAuwln5CwjPNQ/QENLbZLZOzkvO7
         UOJg==
X-Forwarded-Encrypted: i=1; AJvYcCU39KOVN8e3fIyPWgV6cl6Cj4jnLDx7a/N0J7h4nwVv9P8xaoqyJDAtz6yOyKfXK/DSfBkLGdAMW6kk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2dYPNzfrahDWO33mXIMlkVWbCb4+7EzZ5jo6mm1VB6tBONjWu
	XdGILuHMKMfIv1eUDA3aLpT4R/vqKRJaatN72HpoUj6zTH4pPAqD4mqBQPuSgVnixdS3a/4AHFo
	l70R5TA==
X-Gm-Gg: ASbGncsmf43dCSP895rr8we8Xv0T8I6SjfTPwRdc6g9stTroO+T7OJsG7MtvmWBe3hp
	G1oj+2wPUI6u0gYN/DEkADaYLz4QJMMR4f2uxMTkNRMegRe3eq0b5LVhyn5hNBm1kr9XwC5cefr
	TFYiLlmBwA1YT8iPB7YkLRyMCzOGnjdxeeQSSdEAV4dfueCidUPDMo37tOgABpWnp3Avw/gFfdM
	ldUllMVnAnxe9zZAfQXiLTxhI2go5PrSSdmvjlP3bwiD7frd70jJyZq6smsEYKavLnlmQeSHp/0
	UocV51OK9DCRmKHoNz7m
X-Google-Smtp-Source: AGHT+IEs4gB+Ysjlt8eU17nb3Ci2yczcmJ4H3W58u7P8uDa3tV/VvmLR86S0tSbUkR8W6jLjqNnUhQ==
X-Received: by 2002:a17:906:32c3:b0:aa5:449e:1a1d with SMTP id a640c23a62f3a-aa580edd946mr1994683366b.2.1733138343233;
        Mon, 02 Dec 2024 03:19:03 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996dbee1sm496958166b.45.2024.12.02.03.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:02 -0800 (PST)
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
Subject: [PATCH v5 00/10] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Mon,  2 Dec 2024 12:19:24 +0100
Message-ID: <cover.1733136811.git.andrea.porta@suse.com>
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


CHANGES IN V5:

PATCH RELATED -------------------------------------------------

- patch 1 and 2: added: 'Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>'

- patch 6 and 10: added 'Reviewed-by: Stefan Wahren <wahrenst@gmx.net>'

- rebased on v6.13-rc1


KCONFIG -----------------------------------------

- drivers/misc/rp1/Kconfig: leading spaces converted to tab


RP1 MISC DRIVER -----------------------------------

- added a comment to describe ovcs_id field from struct rp1_dev

- added braces around a single line if statement followed by a braced
  else condition

- removed a double space character


GPIO/PINCTRL --------------------------------------

- moved a multiplication (*) sign to the line it belongs to (code style
  fixup)


DTS -----------------------------------------

- Moved clk_rp1_xosc from SoC DTS to board DTS


BINDINGS ------------------------------------

- pci1de4,1.yaml: adjusted ranges and reg properties in the example
  to better reflect the address from RP1 documentation. These refelcts
  the same convention used in the dtso

- raspberrypi,rp1-gpio.yaml: fixed 'pins' pattern to go at most up to 53

- raspberrypi,rp1-gpio.yaml: using single quotes consistently over double
  quotes

- raspberrypi,rp1-gpio.yaml: added some pin config option supported by the
  hw/driver but missing in the schema


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
 .../devicetree/bindings/misc/pci1de4,1.yaml   |   73 +
 .../devicetree/bindings/pci/pci-ep-bus.yaml   |   58 +
 .../pinctrl/raspberrypi,rp1-gpio.yaml         |  198 +++
 MAINTAINERS                                   |   14 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |    7 +
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
 24 files changed, 3286 insertions(+)
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


