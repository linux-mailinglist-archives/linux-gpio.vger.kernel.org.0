Return-Path: <linux-gpio+bounces-12554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B107E9BC5C5
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 07:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63281282F5E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 06:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9D81F76A8;
	Tue,  5 Nov 2024 06:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="kX0XQSNc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C22319047D;
	Tue,  5 Nov 2024 06:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730788943; cv=none; b=libjZgN5Mn/EVABsTkPx7wa3XsTVVISkn1IJo9xzvMNtr2a+mMMo1KkgCwFNJfotP0HvSazpu0jM0gcTeplMpmIF6PPWN/3xSHINz3zQeGruokaSjKyNfUpxiJvstvYECmSKIoRudidnaCHegyR+9FVQO6WXvIw+0VbRoBnubJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730788943; c=relaxed/simple;
	bh=u3H/hN/oj/uvo/e+323CG4HQWfcgPi2ayRqiclGrOYw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jH4/Rt+QwDklNlZZCcGkILkA1YJSYEHVfqZ1tUP0eXOXtJl3QGaHb0F5a9vSWE3tR4beBij98kCWZZj1psafUOH3D/jWOsbSjUK8yCyNzrB/TekA1URR0CAqH0qvcZMYSMoiBTGYF/B43wVJ6ej9hf5/BC04+KOES22tNjIS9Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=kX0XQSNc; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from localhost.localdomain (87-97-112-21.pool.digikabel.hu [87.97.112.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 714278760C;
	Tue,  5 Nov 2024 07:42:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730788934;
	bh=HdeM5g8vHJ1AvsskBa9/M6dev2ZQHPDwCf1jzKYrrhA=;
	h=From:To:Cc:Subject:Date:From;
	b=kX0XQSNcmxPeplOeEk6MU/04rMiPSmlkI9ruQHsWajMG7QpNMdslzY5sxdGa7k+gF
	 U46IIG+8kNcGwvLM3JZQ+8mpzjE82q1WrpDFvMNmfykNfTV8g//23N/iVEDjruvKzU
	 c9h455K9JOhTGQFT6GpiFYaIuatXsDEMAcxdbgGz/6VC+QTRAwuyX0cPZREHSP7d38
	 mxj5PviVx147yeTtYObKVAAzDBzfEne4v9Uz1xBHIs7T7CaT90IlsEOLx+TT+30UkL
	 kWcw+m2iXV13nyOCgSSOkFTty72gw1645WWivxFRdGH1WDhrpvZLDo4bN4LDKJyZdf
	 84T31dLBUvHaQ==
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
	Shawn Guo <shawnguo2@yeah.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: dts: imx8mp: add support for the ABB SoM and carrier
Date: Tue,  5 Nov 2024 07:42:03 +0100
Message-Id: <20241105064206.43626-1-hs@denx.de>
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

Changes in v3:
added Reviewed-by from Krzysztof
- worked in comments from Krzysztof
  gpio-line-names should match the actual number of
  gpios of the device.
- added comments from Shawn Guo
  removed unneeded new lines
  sort nodes, properties alphabetical
  rename pcie0-refclk -> clock-xxx
  used GPIO_ACTIVE_HIGH instead of 0
- added comments from Fabio Estevam
  instead of settting each brightness-level in
  brightness-levels add num-interpolated-steps
- changes from me
  fix gpio-line-names for semtech gpio controller
  in imx8mp-aristainetos3-proton2s.dts as patch
  "dt-bindings: pinctrl: sx150xq: allow gpio line naming"
  of this series adds the dtb checks for them and 17 entries
  needed now.

Changes in v2:
reworked the compatible strings for ABB imx8mp based boards
called dtb checks, no errors for this patch
patch dt-bindings: pinctrl: sx150xq: allow gpio line naming new in v2
- worked in comments from Krzysztof
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
 .../bindings/pinctrl/semtech,sx1501q.yaml     |   43 +
 arch/arm64/boot/dts/freescale/Makefile        |    5 +
 .../imx8mp-aristainetos3-adpismarc.dts        |   37 +
 .../imx8mp-aristainetos3-helios-lvds.dtso     |  113 ++
 .../freescale/imx8mp-aristainetos3-helios.dts |   98 ++
 .../imx8mp-aristainetos3-proton2s.dts         |  161 +++
 .../imx8mp-aristainetos3a-som-v1.dtsi         | 1107 +++++++++++++++++
 8 files changed, 1573 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi

-- 
2.20.1


