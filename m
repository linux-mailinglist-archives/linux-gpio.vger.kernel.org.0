Return-Path: <linux-gpio+bounces-8355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39219939FCE
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 13:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26EB9B21E33
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 11:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CF5150986;
	Tue, 23 Jul 2024 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jwRyO1bx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292F914D2B8;
	Tue, 23 Jul 2024 11:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734107; cv=none; b=VOZaBcv1ynJ9NKa8H1zTM91oTxy389nandD4kYPvvS2cGWdokuVZ46SdbAXVFxB2Ky15otrEfhKwlXOqVoKgop76/vGFp/auVqRZVBbu9q9BShcfnRdIuR0FrFGr5ztBCA40zka/6rZNefsj4hJ6B7twHBMemOxSy2vww8oIoFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734107; c=relaxed/simple;
	bh=vp6Qm2xtofuMRY/ZHf1ElKLZgvlS6sgrB5W2isGgiGA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sW89nBRxZUQvvaNKEAZ9dX2bGZPEqagi8qX2g4EuQvWIfR15S4A6fr63YK37FwXg/zr1R2HZV+TQ+phs7fsVF9+2TPXP7AEI73eDrNz417UBJB0K8HlbT+Vn6MVGQoDex9K6O2QpXMNFCAXxycJCCkevNuf6qf8k8GcxtcyPBtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=jwRyO1bx; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721734106; x=1753270106;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vp6Qm2xtofuMRY/ZHf1ElKLZgvlS6sgrB5W2isGgiGA=;
  b=jwRyO1bxeZZxDEng/bu+12Sr0N67JMGIJpVHm5JqQwhxlwUsar3M9PQk
   CzIflHnayE1F5RZ7d2Sfpn+KqX5a6J+mNSBQAEQZmI3w7fzBdmQbMS7jE
   qq7DMMH1l1S93CYCU+tT0zR4z7ZelQNBlXWNI/UBQRKmW5D2T8mJ9oMh0
   sk/z5cuXfJSx53TyIN6FCG3LdUQ/dkPwnDYfjYTwjZp/VS0MtSE+ZBn5D
   YkgbPyffKrVwQklOwZZfOdLHKQTVT4gnQsh328Miv9Z6OBee07z8nI4WA
   Xo9wDjug6hwzUFgJyP7XEmyFJz7pScRTYle6BLBzOJE4hDS0ADhvpzThF
   w==;
X-CSE-ConnectionGUID: S6DrTYNTSQStcH62wvxgTw==
X-CSE-MsgGUID: SDhomshkSKmseY4caTDADw==
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="29574950"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2024 04:28:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jul 2024 04:27:58 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Jul 2024 04:27:56 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Marc Zyngier
	<maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RFC v7 0/6] PolarFire SoC GPIO support
Date: Tue, 23 Jul 2024 12:27:09 +0100
Message-ID: <20240723-supervise-drown-d5d3b303e7fd@wendy>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6834; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=vp6Qm2xtofuMRY/ZHf1ElKLZgvlS6sgrB5W2isGgiGA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnzJ/fNCHQx9rnwhPFxbXTyg1PB1x4sKghIClc5zvpm3ZNH t5lmdJSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiSx4xMvx/y3RH1fzMlKNHzm30i6 nUf+rgv33Hz4QST0GLk8fuKLAyMiw+eyzW5GZxxYJ0q9rSG3dPrrpTebdQ1KN3yQ2Bz2sKpzMDAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hey all,

Lewis is no longer at Microchip, so I've taken over the GPIO controller
patchset that he had been working on prior to that:
https://lore.kernel.org/linux-gpio/20220815120834.1562544-1-lewis.hanly@microchip.com/

However, you'll note that I've got more than a GPIO controller patch in
this series now. One thing that was wrong with Lewis' series was that it
could only, depending on the iteration of the series, support GPIOs that
had their interrupts muxed or GPIOs that had dedicated interrupts at the
parent interrupt controller. I found that to be problematic, because the
hardware itself always has a mix of muxed and dedicated interrupts and
so there was always a controller rendered unusable for interrupts.

I've attempted to fix this by remodelling how the interrupt hierarchy in
the devicetree is described, with a mux added between the GPIO
controllers and the platform's interrupt controller. This is a better
match for the hardware, or more accurately *is* a match, and avoids the
issues I pointed out here:
https://lore.kernel.org/linux-gpio/23a69be6-96d3-1c28-f1aa-555e38ff991e@microchip.com/

Stealing from the irqchip driver patch, here's some more information on
the interrupt configuration on this SoC, for the 3 GPIO controllers:
- GPIO controller 0 has 14 GPIOs
- GPIO controller 1 has 24 GPIOs
- GPIO controller 2 has 32 GPIOs

All GPIOs are capable of generating interrupts, for a total of 70.
There are only 41 interrupts available however, so a configurable mux is
used to ensure all GPIOs can be used for interrupt generation. 38 of the
41 interrupts are in what the documentation calls "direct mode", as they
provide an exclusive connection from a GPIO to the PLIC. The 3 remaining
interrupts are used to mux the interrupts which do not have an exclusive
connection, one for each GPIO controller. A register is used to set this
configuration of this mux, depending on how the "MSS Configurator"
(FPGA configuration tool) has set things up. This is done by the
platform's firmware, so access from Linux is read-only.

The mux has a single register, where bits 0 to 13 mux between GPIO
controller 1's 14 GPIOs and GPIO controller 2's first 14 GPIOs. The
remaining bits mux between the first 18 GPIOs of controller 1 and the
last 18 GPIOS of controller 2. If a bit in the mux's control register is
set, the corresponding interrupt line for GPIO controller 0 or 1 will be
put in "non-direct" mode. If cleared, GPIO controller 2's will.

I'm downgrading the series to RFC status, and have not implemented
feedback received on the GPIO controller itself (which was mostly about
using regmap), because I would really like to hear from people on the
interrupt side of things, in case a significant re-write of the driver
is required. I've split the changes I made to the interrupt handling
portions of the GPIO driver into a patch of their own to make that more
obvious. Clearly that would need to be squashed, and any feedback
implemented, before the driver would be acceptable.

I previously enquired, a year ago when I actually wrote the irqchip
driver, about how to implement this mux and tried to follow Marc's
suggestions about how I should ago about doing so:
https://lore.kernel.org/all/87wn11oo5o.wl-maz@kernel.org/

Marc, I know you're no longer maintaining irqchip drivers, but I'd
appreciate if you in particular could take a look and see whether I
implemented your suggestions correctly - in particular the
irq_domain_disconnect_hierarchy() stuff.

My main issue with what I've conjured up here are that the hwirq number
that I get when calling irqd_to_hwirq() in the mask/unmask callbacks
in the gpio driver runs as far as 95, but each GPIO controller only can
have up 32 interrupts, so there are % 32 operations done in those
drivers to make the number a valid GPIO. In my naivety, I had expected
that the hwirqs seen by the irq_chip in the GPIO controller driver would
run from 0 to 31, but instead the hwirq numbers are that of the GPIO
controller irq_chip's parent (so my new mux).

I'm not sure if this sort of knowledge about how the parent works is
acceptable to have in the GPIO controller driver, but more pertinently
it screams "fundamental mistake" to me, and that my implementation of
the alloc irq_domain_ops callback is just broken. Unfortunately, I have
been unable to figure out a way to avoid that, while also (what I think
is) correctly using the irq_domain_disconnect_hierarchy() stuff in
the alloc callback.

So yeah, is doing something along these lines acceptable, or if not,
pointers as to how to resolve the problem would be highly appreciated.

And there's also a nastly looking of_iomap() in the irqchip driver. I
know this is unacceptable, some regions were described entirely
incorrectly in the original devicetree for this SoC, and I'm trying
to work on my problems one by one! Please ignore that for now.

Cheers,
Conor.

CC: Marc Zyngier <maz@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (5):
  dt-bindings: gpio: fix microchip,mpfs-gpio interrupt descriptions
  dt-bindings: interrupt-controller: document PolarFire SoC's gpio
    interrupt mux
  irqchip: add mpfs gpio interrupt mux
  gpio: mpfs: pass gpio line number as irq data
  riscv: dts: microchip: update gpio interrupts to better match the SoC

Lewis Hanly (1):
  gpio: mpfs: add polarfire soc gpio support

 .../bindings/gpio/microchip,mpfs-gpio.yaml    |  28 +-
 .../microchip,mpfs-gpio-irq-mux.yaml          |  79 ++++
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |   8 -
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  50 ++-
 drivers/gpio/Kconfig                          |   7 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-mpfs.c                      | 349 ++++++++++++++++++
 drivers/irqchip/Kconfig                       |  11 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-mpfs-mux.c                | 333 +++++++++++++++++
 10 files changed, 840 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml
 create mode 100644 drivers/gpio/gpio-mpfs.c
 create mode 100644 drivers/irqchip/irq-mpfs-mux.c

-- 
2.43.2


