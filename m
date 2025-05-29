Return-Path: <linux-gpio+bounces-20748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0858AC7F06
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 15:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30FE39E7AF7
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FDE22A1CD;
	Thu, 29 May 2025 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IKfVtxk9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5435BBE49
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 13:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526562; cv=none; b=ANNOFxEMaAZuAsvX1bZfHRZtU/NdIv5oXPU6XdQDo7SSIEKK5Y6v2LDxcvQBrzujiD8ZCPEf9oYFxouibsPUsDX6GNFEn8m2L0QlOgGcIKoV+BUJIHdr3t/+3WSy1+bowkR6ilRPf9B/BBJqu8ke+zETXg+l25DUgwmIWJ/lxbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526562; c=relaxed/simple;
	bh=4HwF496DgIlfElZuHhFmk8b+VHf8sNsCIAHkC/SFcto=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=VXUyP/Su16vHlu/wFv8Bh1hMjoPTQ5Y/Lzj3x1RF1wS22dbUa5qB5ZyIqxOyLWqJa016E69A9CFRw+kAZvVsplwNnUUHp/Ic00n3nNwd50FuIktdZ6OV/sscbgM0BqgpFAdJUyHH9SFIIKpgZdFNky/4u6v/bP80M4Egz6stKz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IKfVtxk9; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-602c4eae8d5so1868898a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526556; x=1749131356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x7N9IwYBv5E9wg+44t8dlF3HK0phPTpnfhv5ZLvw1io=;
        b=IKfVtxk9K/CCdFRB+5OpiCP3X56J5OzgoCAFlU/vUd1+YwMzuBl6JibZT5dDvQLZ7a
         hLDsWBaIclnpAjZyMAa5xLlFRIF3/2DGzmbhFrvqOSYRVys7fH2dFDyANFuRnoDELMj6
         tXDMRy+j+7VHRTQb5E3gVSvs7zb8Me/XsQThzazsR8yTAlsnlyfMtgkjIciqBNXUoOvt
         BkAjBkG0w6TNpBksFZqu+cS6UP4cU2sL+Q695+G7evrRa8a0KrljfXHq0BYjc4oVV24I
         +XCdciwhnSg9gLrUWdJw0De35Nx+0XT0MCGc5wgE2mJAZQ5/3i8Nfjfy+VkBrvPoIiqa
         7FTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526556; x=1749131356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7N9IwYBv5E9wg+44t8dlF3HK0phPTpnfhv5ZLvw1io=;
        b=v0JQp9YPgg5FKdioGvw2cXyZKnvLfbeiOeIcmcJsiHE6QhcCtrM8g2QVqkqV/0qtcU
         l9W+ko/1vYjN7vi+K6lpK3v4L4Vtbk4L/eqMouQhUHiosozfnyM8s8l2IHOU6hjPNEh8
         nDwPBKX10m4lTAxB4bK+VvtFZ5ASkO1NQxbQNR8yP6GzA/TRA06SLcN5Qf9cZ0qFSsK1
         Po0JgEk8M9K/EsQ61zW0h0TdTdhDA+CWv4FSDlqGP7G5I5/72GqfY+CTOxTSXJ2fXo59
         AsduEbXQpfOhuRNZqhf+LC1vp/7h4FV+VBllENDxEQOCCc2wIJ/6TnNu9d+awipscQ8x
         2X7A==
X-Forwarded-Encrypted: i=1; AJvYcCURf9NMHAU0l6R/hMRaP0NY0/H8u4P8QjWxWn9N7ZfAvowZCmr5/4qvxxgSicGQ+w+kc5mY8RNk9zDK@vger.kernel.org
X-Gm-Message-State: AOJu0YwQJbYcZU+ndxBlAodfgkxkCO+ZANJD90xiRRaTHZsfT98ncX9L
	SvjO4tYkh/C2j/W9/nbfmVLV97uVwUEOBzHNCwP8ZawUPsChXEeid6W2Osuli6dsZOk=
X-Gm-Gg: ASbGncv9sTOZju1B3TpUQndBiN20O+pIEbRVBIEoz40Q59uQ9UvnRCDrfCGIhAYtn10
	chnjMcWbau75sFdO+eczyCzLykQGdql31YhdA/F1rLe5g6ope5fsXQCWFAFMzsTiKwrvVJh7piY
	+T7+X+0ygjKhB6x783SRXY/JLypB4uGSGVBOiuAIbUnAoG4g0XDXIfNwiHdpRU+mNPDhA0HmDxV
	2qv8XHCeVUT0jCZ1YcnSXbV0PVVcZv3NdaPrjeCmAk3Gn80Ap2spsdeHLluOLDOisSbONHkX4uu
	hrUObD/99KCkAfJEtwKDqN4yuB1LRw4YlT9DFVNIbxGKmLjIdNay1ydH27Ks+bJ2OigBmYGgxaE
	jqNZq9dBgYpPG9Uydx2afg38RycRL/2Sv
X-Google-Smtp-Source: AGHT+IExJkGEZyVgOynKMT3c6h04v8rLffrbr2nLD8TNSpVPvkwYBhMoZvaNRWehDSxPNuf66WwjDg==
X-Received: by 2002:a05:6402:d08:b0:5f6:d403:fb20 with SMTP id 4fb4d7f45d1cf-60535b7597emr3111333a12.8.1748526556406;
        Thu, 29 May 2025 06:49:16 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c2abb4sm13394a12.13.2025.05.29.06.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:16 -0700 (PDT)
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
Subject: [PATCH v12 0/13] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Thu, 29 May 2025 15:50:37 +0200
Message-ID: <cover.1748526284.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*** RESENDING PATCHSET AS V12 SINCE LAST ONE HAS CLOBBERED EMAIL Message-Id ***

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

-PATCH 6: the devicetree node describing the RP1 chipset. 

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

-PATCH 13: collect all changes for MAINTAINERS file.

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

CHANGES IN V12 VERSUS V9


PATCH RELATED -------------------------------------------------

- Patch 10,11,12: Added: Reviewed-by: Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

- Patches reworked to apply cleanly on broadcom/stblinux branches:
  patch 1,2,3,6,8,9,10 -> devicetree/next
  patch 11,12 -> defconfig/next
  patch 4,5,7 -> drivers/next
  patch 13 -> maintainers/next

- Patch 13: new patch gathering all changes for MAINTAINERS

- Patch 7: Added: Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


RP1 CLOCK DRIVER ------------------------------------

- Dropped some WARN_ONCE() lines that are basically useless

- rp1_clock_set_parent() now returns EINVAL in case the parent check
  is failing. As a result, rp1_clock_set_rate_and_parent() has also
  been adapted to return rp1_clock_set_parent() retcode.

- Return an ERR_PTR from rp1_register_clock() instead of just NULL

- Dropped some unaesthetic blank lines

- Disabled the builtin locking in regmap since we're already dealing
  with concurrency in the code

- rp1_clk_probe(): dropped dev_err_probe() as redundant due to commit
  12a0fd23e870 ("clk: Print an error when clk registration fails")


