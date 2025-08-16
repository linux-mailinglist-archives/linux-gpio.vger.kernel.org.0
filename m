Return-Path: <linux-gpio+bounces-24453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DF3B28A54
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 05:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 320B658825D
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 03:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D215C1D88A4;
	Sat, 16 Aug 2025 03:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fgOrKMkc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2941C3BFC;
	Sat, 16 Aug 2025 03:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755316258; cv=none; b=AIq/555wB4675Ec1wDKgbbqLCKatStaORnNrktWh614YfGe/WBDTFrq+GvVHrszf7fTGKb6BfhRvFNE5s66IyRBdjhPRb+32xKdcIjnMpnDdTpIthuGtDbMK9RVqk3R4kub4VqaPuMkq7qGeBAtX6t5IARhrvXVy5lyOGKAdAY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755316258; c=relaxed/simple;
	bh=ji8lgMEfgfQf0FfIR9ASrIZlJBvRxe30F/clE5+N0bM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hWY3WXeGOP6phIszMQ0GhrJ64IgVWEMA/BOO2i3SdtGsDqp8pgmC5bEEbO7RFfpcsZ9ByO9BihYbpaBgMFr6M4O47fukD6c6d88zeO97nqVM8Zf/VCWo3rzI3+GyGz6m/g977/S25OiGrWA59X6lpNdEZmlh10RxedxtShjP9cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fgOrKMkc; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C10EC22C1F;
	Sat, 16 Aug 2025 05:50:55 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOeO-Fg5KiIv; Sat, 16 Aug 2025 05:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755316253; bh=ji8lgMEfgfQf0FfIR9ASrIZlJBvRxe30F/clE5+N0bM=;
	h=From:To:Cc:Subject:Date;
	b=fgOrKMkc/kQuniJGhFm4QIyI0P9MepwygZp6f/OEuWBAkeou1poU0VYe/xOEgAo8/
	 LmukokAJUavM5Bm7mjEmtih1SkNnC+M+I6rkPWkw6HFa1/YRlc8ugxhRbf8wHcUJzY
	 oHNAHFeDJ2Uq8QqJb/+Y99CMC9LvMwkAsx0Yb1Ctd08SagRS3kzKXKJuliT8AhLSGH
	 RtR1LgnLLOLU6Mtvac5MGQpSEBRbbQsjSo5F7rWIVf8CWdI4KCxPr65vdHuNGdHyDK
	 sR2ukqsVXQYjsr/6N+hVXhRgnxahqEThXZOOxAkZagMegUNFUv94mYPJuPykQ6rB5r
	 dxPcO3p2sIfhw==
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
Subject: [PATCH 0/3] Support GPIO controller of Loongson 2K0300 SoC
Date: Sat, 16 Aug 2025 03:50:25 +0000
Message-ID: <20250816035027.11727-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for Loongson 2K0300's GPIO controller. While
being mostly identical to previous implementation, its interrupt
functionality hasn't been implemented in gpio-loongson-64bit.c. PATCH 2
implements its interrupt support with an IRQCHIP, and the code could be
reused for other Loongson SoCs with similar interrupt functionality like
2K1500 and 2K2000.

Tested on CTCISZ Forever Pi, reading/writing GPIOs works correctly, and
both level and edge interrupts could be triggered.

The devicetree patch depends on series "Support reset controller of
Loongson 2K0300 SoC"[1] for a clean apply. Thanks for your time and review.

[1]: https://lore.kernel.org/all/20250816033327.11359-2-ziyao@disroot.org/

Yao Zi (3):
  dt-bindings: gpio: loongson: Document GPIO controller of 2K0300 SoC
  gpio: loongson-64bit: Add support for Loongson 2K0300 SoC
  LoongArch: dts: Add GPIO controller for Loongson 2K0300

 .../bindings/gpio/loongson,ls-gpio.yaml       |  28 ++-
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  |  20 ++
 drivers/gpio/Kconfig                          |   1 +
 drivers/gpio/gpio-loongson-64bit.c            | 191 +++++++++++++++++-
 4 files changed, 232 insertions(+), 8 deletions(-)

-- 
2.50.1


