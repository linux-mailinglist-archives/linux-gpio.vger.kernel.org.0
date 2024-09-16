Return-Path: <linux-gpio+bounces-10164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB8D979B37
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 08:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71E481C22507
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 06:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273694084E;
	Mon, 16 Sep 2024 06:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="li4f2R9r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053663D0A9;
	Mon, 16 Sep 2024 06:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726468500; cv=none; b=aLypIlWCwNTmh+Lor/Nr3iy6F0RUosQwpQV2qHUK2ZDXEpJ0MtNnXhVUFeZkF7MC0MumZwE90ep7tkwvaGYBJAX4NC+uOWNUdPbUpMzVj7rlkGrXXnnBet8vE8x0kUM8LTYrBe2vKtlkAA8cFC9n5ORhR/StODMtS17WlBqDE6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726468500; c=relaxed/simple;
	bh=of9yhCK3M+bzzPmQoMEXbkI6up3J1zdAGPIJN1xknHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VUbGsg7B8R4cO8VgwUWpyu+hi4LKPOX6IpdcuizIGZjTqFYlcZVzr6iwHi+/3EKAa6HwCfZsm+XiDd12hlyo0PjZV6NTSyN+RxewXIsbxBhSIZxT0yie2naojDHxIUa0CZoBSkEPRUfUpv9xlkreC1YXdz+0s7k6XtAlhaIGsAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=li4f2R9r; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=1Tm0X
	Dtxf0Yguf+xgj8TAvMZ8SsZAM4lNoTmcDL2Y8o=; b=li4f2R9ru9FkjQp7ed2RR
	XPY4x0DaY6TMZXOQAbHUHX9X5dgWsiRWHdtzTDT66XUyej/FlB8uhJkoRUpTZphr
	v/tzr9HgTYw75PDqfABy+F1flIZgum2HpXHz2y1QJ391BCyl84bInttvK8HjR3lh
	8ojhu7jWZWRcidj/1GoDPs=
Received: from jean.localdomain (unknown [27.18.168.209])
	by gzga-smtp-mta-g3-0 (Coremail) with SMTP id _____wDnL2pT0edm2LOeAw--.31222S2;
	Mon, 16 Sep 2024 14:33:56 +0800 (CST)
From: Ze Huang <18771902331@163.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ze Huang <18771902331@163.com>,
	Yangyu Chen <cyy@cyyself.name>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RESEND PATCH 0/3] Add initial support for Canaan Kendryte K230 pinctrl
Date: Mon, 16 Sep 2024 14:30:21 +0800
Message-ID: <20240916063021.311721-1-18771902331@163.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnL2pT0edm2LOeAw--.31222S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyUGw1fKF4xZr47uw43trb_yoW8Kr4fpa
	y3CFZ8CrnxJrsay3ySya1q9ryay3Z7Ar1Yg3WYkr9rJF43Z34DJwn3Kr47ZrZ8Gr45ZrWY
	vrs5Jryxur47Z3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piL0ePUUUUU=
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiNxdcomXAnRk5IgAAsk

Resend the patches to the same thread and fix incorrect patch ID.

This patch series introduces support for the pinctrl driver of the Canaan
K230 SoC. The K230 SoC features 64 IO pins, each of which can be configured
for up to five different functions.

The controller manages the entire pin configuration and multiplexing
through a single register, which control features such as schmitt trigger,
drive strength, bias pull-up/down, input/output enable, power source, and
mux mode.

The changes have been tested on the K230 development board.

The pin function definition can be found here [1], and most of the DTS data
was converted from the vendor's code [2].

Link: https://developer.canaan-creative.com/k230/dev/_downloads/a53655a81951bc8a440ae647be286e75/K230_PINOUT_V1.1_20230321.xlsx [1]
Link: https://github.com/kendryte/k230_sdk/blob/main/src/little/uboot/arch/riscv/dts/k230_canmv.dts [2]

Ze Huang (3):
  dt-bindings: pinctrl: Add support for canaan,k230 SoC
  pinctrl: canaan: Add support for k230 SoC
  riscv: dts: canaan: Add k230's pinctrl node

 .../bindings/pinctrl/canaan,k230-pinctrl.yaml | 128 ++++
 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi  | 316 ++++++++
 arch/riscv/boot/dts/canaan/k230-pinctrl.h     |  18 +
 arch/riscv/boot/dts/canaan/k230.dtsi          |   2 +
 drivers/pinctrl/Kconfig                       |  10 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-k230.c                | 674 ++++++++++++++++++
 7 files changed, 1149 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
 create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
 create mode 100644 drivers/pinctrl/pinctrl-k230.c

base-commit: 0eea987088a22d73d81e968de7347cdc7e594f72
prerequisite-patch-id: 2401703b57448c9ea2c3dc7650b4502491a28944
prerequisite-patch-id: 50ccf1104191cdf22f9077880d3dc781b190a3c8
prerequisite-patch-id: f8b983b301d0c14f1448b9e4c321262a509e061e
prerequisite-patch-id: ced4a01ccd8ddab2fd308d543ddf47bd1641518a
prerequisite-patch-id: c2144cf468c57b856830a61615ba6ba501e8ec58
prerequisite-patch-id: 704efc6e76814e1877748959d7319d558c8386c1
-- 
2.46.1


