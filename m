Return-Path: <linux-gpio+bounces-8090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 337F4929E69
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 10:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 646821C21367
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 08:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A63153E15;
	Mon,  8 Jul 2024 08:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="pUJU3jAV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12C138DD3;
	Mon,  8 Jul 2024 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720428096; cv=none; b=Jh8ZhdBJhTCSpr16wEzE9ejAx5fctGJPOoQjxANTBckzd+Y7JvDiHtI4mFiSVrRNHW/5vQXx9IuYc5UmKRSsaydmH2DbMAB7ZW4YAKMmGQsD+T2nuM/FYkDiwdag3zAgXt2IaYdEyWEAv4GvJW+rPCEeIRJOqE7xK/PAXdwZZIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720428096; c=relaxed/simple;
	bh=EbyMstgkGC0hj8mldRlEtHe4fvYA2Le4WLi6G4ZlrAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qrYS5wGNRWmVLCTqNdT0EAZ/ENfQpi3l7znKMk27x+iT5rT3IqhAXRgwqQZKxgQf54y9MGR9s1MEyCmrkyjkUo0yTanw6wb6Ms48puQ4+tOkiHmvo6KjgZOgyPjlw6l1Pqu1KJ96XGjfAPjumq00qTZTAo2AnsUr3NQmw0QL/rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=fail smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=pUJU3jAV; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fris.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99346BFB3E;
	Mon,  8 Jul 2024 10:41:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1720428084; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=NveMWMLf1KKss1u30fBLh9RzfeK0IK5Gk36rVhpiHb0=;
	b=pUJU3jAVou5Tg4YmrtMeZGhGmK6WS7KWRoMLsDsH8i89ySc+f1/q7Bc/TaCRAvFV9Z5MuL
	t2IZKpWNNi4+8SimyplauJhDPUb8bwP01GEOp79OBJ5omUMzVgv6zSyzUyZhClBBqM2atd
	2dwxcMvQw4SoDtBRxUvlJpk+80J6oCSmQJAgopKUGXG8yvhOixRL71ZQ/FJ19z9enzkEN9
	+BL9R86YOPcOCX2vyU3O6Vs+Qz6pY/eBfy4lA4I18c3diM1KZ0EfQmVj2ZIc1fhL8ewZRC
	EkBAr/qfSxKyNLom4uKLJ9zY+RCwKqjQUyPb203LnENHXKtmXjAgLyj81osJuA==
From: Frieder Schrempf <frieder@fris.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Agner <stefan@agner.ch>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bo Liu <liubo03@inspur.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 0/5] Add support for Kontron OSM-S i.MX93 SoM and carrier board
Date: Mon,  8 Jul 2024 10:40:30 +0200
Message-ID: <20240708084107.38986-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Patch 1-2: small DT binding fixups
Patch 3: board DT bindings
Patch 4: support PMIC driver without IRQ
Patch 5: add devicetrees

Changes for v2:
* remove applied patches 1 and 2
* add tags
* improvements suggested by Krzysztof (thanks!)
* add missing Makefile entry for DT

Frieder Schrempf (5):
  dt-bindings: gpio: vf610: Allow gpio-line-names to be set
  dt-bindings: regulator: pca9450: Make interrupt optional
  dt-bindings: arm: fsl: Add Kontron i.MX93 OSM-S based boards
  regulator: pca9450: Make IRQ optional
  arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier
    board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/gpio/gpio-vf610.yaml  |   4 +
 .../regulator/nxp,pca9450-regulator.yaml      |   1 -
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-kontron-bl-osm-s.dts  | 165 ++++++
 .../dts/freescale/imx93-kontron-osm-s.dtsi    | 547 ++++++++++++++++++
 drivers/regulator/pca9450-regulator.c         |  41 +-
 7 files changed, 742 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi

-- 
2.45.2

