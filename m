Return-Path: <linux-gpio+bounces-23821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7D1B120CB
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 17:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B6581731B8
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 15:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CBF2EE5FA;
	Fri, 25 Jul 2025 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZegFWi0U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B971B3935;
	Fri, 25 Jul 2025 15:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753457191; cv=none; b=l8h7FSfC7WMNwRZRSe4/g97fh3HEq+wN16EKlO1mVVR4h+LluboWyBJ9X+pFzm7xAnAA2dPk7ff+W7yzw7cP3cl8OX1tWITx6BcQmBLnYre4BOhYYgrBcAVh+jkzycSRZS4HEtRH6pshA3CF8WS2fogsIJ8WutBqAd9m2D0I/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753457191; c=relaxed/simple;
	bh=gHsVbbxZNO2dedT+gUhOAcXMnQptUD8CKlxUIwX+Y3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZQcGkpWk3aH2Oyp5A8KInqX7RfhkIO5t3H4YFXAX6Y7vkAKAvocc2lgvr7F5bomeo8MRum1pxUgCaJdn8pDBDEAqm09gRJ/iRB3cJWU9RG1hsRGmZdr3oDUpH56n1VBAt5awSmOSHu9eteC/M7aLG/NONw33RMgCkZPWXgDvKbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZegFWi0U; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 29A26431F4;
	Fri, 25 Jul 2025 15:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753457186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vljgC8ZKf9Ll2Z0J4Ye0gbzmI/6q5ZhgRN9iqcDf+q4=;
	b=ZegFWi0UH+kBbpuppLgSHpWEFmi3hZ6L1Y1EJiAfJ/kEmpOiGZfpicDeKsAoSyKOpxMbV9
	mADOM5nnTDnDs4RmyY115cOcW1PtiqM2mxkWtqcfyjRJGAnWCeXMSwBmI/UKqtVka96k5I
	DeUx1eseHh+JJRqFsugTep5fZjm2W5DmcJasGTeHQGsOkAonm4f1KosKyPjWK40gQYzTfW
	In0PzxI2H+UyTEMr8YVwTI4jRCwMeiaaqI4eUKGKxXpb0vHPBoTNU1IjPpi6pRQIHnqRIA
	ZP1GMXq7zav0yGa/duIQF8csjuhokUdip60R+SLU8vQmhbhljPlygBcYLyxhAA==
From: Herve Codina <herve.codina@bootlin.com>
To: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 0/6] gpio: renesas: Add support for GPIO and related interrupts in RZ/N1 SoC
Date: Fri, 25 Jul 2025 17:26:09 +0200
Message-ID: <20250725152618.32886-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleetudffledtvddtffegudfgjeffgeegkeehjeeigffgieevhfekffehheehieeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohephhhorghnsehoshdrrghmphgvrhgvtghomhhpuhhtihhnghdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdou
 ghtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi,

This series adds support for GPIO and GPIO IRQ mux available in the
RZ/N1 SoCs.

The first two patches of the series add support for GPIO (binding update
and device-tree description).

Other patches are related to GPIO interrupts and GPIO IRQ multiplexer.

In the RZ/N1 SoCs, GPIO interrupts are wired to a GPIO IRQ multiplexer.

This multiplexer does nothing but select 8 GPIO IRQ lines out of the 96
available to wire them to the GIC input lines.

One upstreaming attempt have been done previously by Phil Edworthy [1]
but the series has never been applied.

Based on my understanding, I have fully reworked the driver proposed by
Phil and removed the IRQ domain. Indeed, the device doesn't handle
interrupts. It just routes signals.

Also, as an interrupt-map property is used, the driver cannot be
involved as an interrupt controller itself. It is a nexus node.

With that in mind, patch 3 is related to the binding, patch 4 introduces
an helper to parse the interrupt-map property. This parsing is needed by
the driver. Indeed, the lines routing is defined by the interrupt-map
property and the driver needs to set registers to apply this routing.

The last two patches are the driver itself and the RZ/N1 device-tree
description update to have the support for the GPIO interrupts.

[1] https://lore.kernel.org/all/20190219155511.28507-1-phil.edworthy@renesas.com/

Best regards,
Hervé

Herve Codina (6):
  dt-bindings: gpio: snps,dw-apb: Add support for Renesas RZ/N1
  ARM: dts: r9a06g032: Add GPIO controllers
  dt-bindings: soc: renesas: Add the Renesas RZ/N1 GPIO Interrupt
    Multiplexer
  of/irq: Introduce of_irq_foreach_imap
  soc: renesas: Add support for Renesas RZ/N1 GPIO Interrupt Multiplexer
  ARM: dts: r9a06g032: Add support for GPIO interrupts

 .../bindings/gpio/snps,dw-apb-gpio.yaml       |   8 +-
 .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  |  99 ++++++++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      | 172 ++++++++++++++++++
 drivers/of/irq.c                              |  70 +++++++
 drivers/soc/renesas/Kconfig                   |   4 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/rzn1_irqmux.c             | 169 +++++++++++++++++
 include/linux/of_irq.h                        |  11 ++
 8 files changed, 533 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml
 create mode 100644 drivers/soc/renesas/rzn1_irqmux.c

-- 
2.50.1


