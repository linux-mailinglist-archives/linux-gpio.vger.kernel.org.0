Return-Path: <linux-gpio+bounces-25550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E87B5B42EE1
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 03:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 126233B1ABB
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 01:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC071DC9B3;
	Thu,  4 Sep 2025 01:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IEj1Q5BS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80B71DFCB;
	Thu,  4 Sep 2025 01:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949713; cv=none; b=NYhkSvfCPzzImcqCXol3Oc3e7CW6qrnPmWxIVLhGaD1ltkITD7qaOk0bp0CE6bg8ceFX2sQwCUQjltIHli65S2z8seikA/hV6xSlcYwbtesvkAaldvAQDIpmqGzBK9QzQBntMOQ8dKQEHe+T13R1vP6KqG2iIMIDBBdq5hnsshw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949713; c=relaxed/simple;
	bh=rK7UvUnvod158lPYL4vusiZ8if3giwXepEt7gycPh1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Idh7KLNCh2r0KCGBmFXi1OZJUeHpOsuaHWI1MN4QgTPJfUpoz7H2k5+b0hGvfr6bwvRb/+jJ2jRP+rxQSygBn34gACGbo4rKy3JALEcCZ9Xz+tyulJ28NeEpejNAfDZDoO02jEZ5vHmomvF8065jeilApcLPAR+JT/RPyy61ZfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IEj1Q5BS; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 91BF825D3B;
	Thu,  4 Sep 2025 03:35:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0C6HC74cgYU; Thu,  4 Sep 2025 03:35:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756949701; bh=rK7UvUnvod158lPYL4vusiZ8if3giwXepEt7gycPh1Q=;
	h=From:To:Cc:Subject:Date;
	b=IEj1Q5BSXsa2ONfQS4DsgxI96IdyTugFe3QSzh4wrmtgV+QwZh4mUz4rbFDarvOMX
	 RDbGDG6fZH0ro52ZdHsnDPoYYYEGrQK5sXXr/byTPMLq5Jko+smAUJcv3xL689A3mI
	 PxmtXtuhvioFpqzzI1xNsJAKtvwiiXqg8qSCCg+MKmfWpQuWJ56Tw2vdTeJ8TILrQI
	 3w6DpNsAOP1ve2TPhhQ2nBDMaEHFEqZFfd4SKAPmPZseOWhEg4592Uf8m6whpMfco8
	 1+v0U8sQhN96dIDH+pqYbmbFybO/5KuWYZcpO8vq0vbxKFijJl63wpfhJzL4friJWy
	 QTkN1JENLQ3XA==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v3 0/3] Support GPIO controller of Loongson-2K0300 SoC
Date: Thu,  4 Sep 2025 01:34:35 +0000
Message-ID: <20250904013438.2405-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for Loongson-2K0300's GPIO controller. While
being mostly identical to previous implementation, its interrupt
functionality hasn't been implemented in gpio-loongson-64bit.c. PATCH 2
implements its interrupt support with an IRQCHIP, and the code could be
reused for other Loongson SoCs with similar interrupt functionality like
LS2K1500 and LS2K2000.

Tested on CTCISZ Forever Pi, reading/writing GPIOs works correctly, and
both level and edge interrupts could be triggered.

The devicetree patch depends on series "Support reset controller of
Loongson 2K0300 SoC"[1] for a clean apply. Thanks for your time and
review.

Changed from v2:
- Adjust SoC naming style
- Fold some multi-line calls to dev_err_probe() in the driver into a
  single line
- Collect review tags
- Link to v2: https://lore.kernel.org/all/20250901133804.38433-1-ziyao@disroot.org/
Changed from v1:
- Rebase on top of gpio/for-next, adapt changes that convert
  gpio-loongson-64bit.c to use generic gpiochip.
- Collect review tags
- Link to v1: https://lore.kernel.org/all/20250816035027.11727-2-ziyao@disroot.org/

[1]: https://lore.kernel.org/all/20250816033327.11359-2-ziyao@disroot.org/

Yao Zi (3):
  dt-bindings: gpio: loongson: Document GPIO controller of LS2K0300 SoC
  gpio: loongson-64bit: Add support for Loongson-2K0300 SoC
  LoongArch: dts: Add GPIO controller for Loongson-2K0300

 .../bindings/gpio/loongson,ls-gpio.yaml       |  28 ++-
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  |  20 ++
 drivers/gpio/Kconfig                          |   1 +
 drivers/gpio/gpio-loongson-64bit.c            | 189 +++++++++++++++++-
 4 files changed, 230 insertions(+), 8 deletions(-)

-- 
2.50.1


