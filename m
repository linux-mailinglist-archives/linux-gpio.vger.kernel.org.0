Return-Path: <linux-gpio+bounces-12382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D989B7DDF
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 16:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13500B223F7
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 15:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B261A0B0C;
	Thu, 31 Oct 2024 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="IhzO+4gK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53696A019;
	Thu, 31 Oct 2024 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730387571; cv=none; b=H8UjDuiOeqOTrtjsXEyToj33VUiAP7cdXZjdMLA+xTqRq6IgedLlrggEsBKeaLd2wGp3RddvsxsO/GTscSWDBOqBK725lXpf7h43aUHXoK8VkiKXPG52D0Bsg4MuIHMf+PPeYG0kwPqSlp6aTlDq0qlqC7/bEHF0mqC1/VP28s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730387571; c=relaxed/simple;
	bh=fE7XOfb60YUH7w+POxS2I+b7W3BK8jEjKtWCQTJ2KqM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KtMmABniMTwDkHIlv5HDpu9kKFkukEWrtxcSzGAK8Wmhr7Z3YP2yMsV81baeh+YbsdFWdoAHyHOw35YaYfxZBZ9dnwE9NGDWWRQr/jEjYL9DGYuiYN5Q2ZDtwh5GewpvvSQiKaB0r3iGrcgyqi7lnfoK3efgsvjJOqiiyXVeSPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=IhzO+4gK; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from localhost.localdomain (89-186-114-4.pool.digikabel.hu [89.186.114.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4C89A88F48;
	Thu, 31 Oct 2024 16:12:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730387567;
	bh=LM1+WsafnKkfeROALqH5BTD103VV7dOo3P/ZG+WIGVc=;
	h=From:To:Cc:Subject:Date:From;
	b=IhzO+4gKZr3u3GehPzi0opVPoUdKOHh0Q8+VMz1YdmWnF5Gn51PAgptcSETJZ9aot
	 WruroA1+WmNh19u2KhFsiPvACXWWNxrc/geeHUGMQ7+6ScCnSOkNGchiwjtIHYJGBD
	 xDZZ4sA5haZsshdlV76FN68wGQN4qVU8mf0kfj/ACleLuSMHO2a2WZYJWxFhjJcSDn
	 OWkHOaQ3A9EgNd754MkYe5AR2uKGIYERook9hjvLI0TyRmhi5n0ahfcHHdADpcPX6B
	 UnWwZGNByLFroTnNPN/kq/oekvXkLY4wOeWUcf7dk43H+7EOD9X+gwRU8Bda5if8ve
	 OCZlUbaUh2XwQ==
From: Heiko Schocher <hs@denx.de>
To: linux-kernel@vger.kernel.org
Cc: Heiko Schocher <hs@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: imx8mp: add support for the ABB SoM and carrier
Date: Thu, 31 Oct 2024 16:12:34 +0100
Message-Id: <20241031151238.67753-1-hs@denx.de>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The board uses an ABB specific SoM from ADLink, based on NXP
i.MX8MP SoC. The SoM is used on 3 different carrier boards,
with small differences.

series is based on:
819837584309 - (tag: v6.12-rc5, origin/master, origin/HEAD) Linux 6.12-rc5

patches are now checked with

make W=1 dt_binding_check
make W=1 dtbs_check
make W=1 CHECK_DTBS=y {for each dtb introduced in this series)

as Krzysztof suggested.

Changes in v2:
- worked in comments from Krzysztof
  - reworked the compatible strings for ABB imx8mp based boards
  - removed unneeded dtbos and build now dtbs for each
    carrierboard.
  - removed user spidev entries, as I do not know the
    real spi devices connected to...
  - call dtb check targets as described in cover letter
    and fixed warnings except warnings see below:
not fixed dtb check warnings
- pci (warning pops up for each new dtb from this patch, but
  also for a lot of other boards, which are already in tree)
imx8mp-aristainetos3-adpismarc.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
        from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
imx8mp-aristainetos3-adpismarc.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
        from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
- proton2s dtb specific:
  - rs485
    imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: rs485-rts-delay:0: 0 is not of type 'array'
        from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
    imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: rs485-rts-delay:1: 0 is not of type 'array'
        from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
    imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: Unevaluated properties are not allowed ('linux,rs485-enabled-at-boot-time', 'rs485-rts-active-low', 'rs485-rts-delay' were unexpected)
        from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
    do not see, what I am doing wrong, also rs485 works fine
  - led driver
    imx8mp-aristainetos3-proton2s.dtb: /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']
    I use the comaptible entry used in drivers/leds/leds-tlc591xx.c
    Ah, may because file
    Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
    is not converted to yaml?
  - pinctrl driver
    adding 'gpio-line-names' leads in a warning as this property
    is not checked yet (and so a warning is dropped).
    add this check in new patch
    dt-bindings: pinctrl: sx150xq: allow gpio line naming
    in v2

Heiko Schocher (3):
  dt-bindings: arm: fsl: Add ABB SoM and carrier
  dt-bindings: pinctrl: sx150xq: allow gpio line naming
  arm64: dts: imx8mp: add aristainetos3 board support

 .../devicetree/bindings/arm/fsl.yaml          |    9 +
 .../bindings/pinctrl/semtech,sx1501q.yaml     |    4 +
 arch/arm64/boot/dts/freescale/Makefile        |    5 +
 .../imx8mp-aristainetos3-adpismarc.dts        |   38 +
 .../imx8mp-aristainetos3-helios-lvds.dtso     |  115 ++
 .../freescale/imx8mp-aristainetos3-helios.dts |   99 ++
 .../imx8mp-aristainetos3-proton2s.dts         |  162 +++
 .../imx8mp-aristainetos3a-som-v1.dtsi         | 1116 +++++++++++++++++
 8 files changed, 1548 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi

-- 
2.20.1


