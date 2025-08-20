Return-Path: <linux-gpio+bounces-24659-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A21B2E337
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 19:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7473C5E471F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 17:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571C4335BB4;
	Wed, 20 Aug 2025 17:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="iXdiIBjc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59CC321447;
	Wed, 20 Aug 2025 17:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710099; cv=pass; b=o1rfIMjzfadph5ExeuHI9ZPdidbD53FDeKG7v9P8DXGXl7d35oe1A0Y0Zt2Ieh1vBCWyrXt7h+Cnhen2rPqBKW25i6GRW8x0l6rX4aKnzq5gRwI3NIhuSOWDlF9yf3GL+GtFyioO98F41XNpkOlsoovdMYAnQMbe0lopUvQ08mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710099; c=relaxed/simple;
	bh=sV4kV/mfpkuY2wa8iKDdxtO5llhW9IcZK2g3plBieoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZR5TxkYcQgjUGvd43QUMtqcDgNWQc4RYVFsrJFwsflk7sde8eqSlsEv4NFA3RNjKsmA0ri1SEcP8o5BhsYCS2WBcpjoNbncWT8AaDKQN+bdUEHNDdlWgG1nh0eWcRHZnVkTEXSIlnIwmqQT7NKj+fXxJbRIgkcbvuqJnz6jlCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=iXdiIBjc; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755710040; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Tim5F0HvYU373WHcbS+AW8itdXClm69OGGAsV1A46kh652ncp3eSt6GC0leBhqQH405N+NPRTuGFjKQEUvPvcrXmcjPYge5C/9fszUGPrpZ5XGJoWwPlyg6Izx+fS2Si8WlHPNLOTPyqgUchpe4WQwKCX0+b+lLw//3TM164iRw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710040; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DaMNOnKm2AnfZhbaigAUu68c7YdBR4a87CV7XaTyqjQ=; 
	b=NO+n+dEsIpuIEW/n/h9GYA9kEKtT860Sym3jjxLtnbWPN+LQVmltK9yAjn4BT/NP9BeIqZ29j6cMMWzQ8cVuRxHQsn+gkG6m06E2i3FvJET1GwFmdYbpD/1QAJ/EvgPsXeR8DaWuwm6GggX8aaDWOJ1UsDCWYze9LFtBPVar8h4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710040;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DaMNOnKm2AnfZhbaigAUu68c7YdBR4a87CV7XaTyqjQ=;
	b=iXdiIBjcdK3P7kvXuElLIVC112o9r1eEOb6UZAwC74zp+49vHMbc2ihpozoDyC7T
	X+KKEt/amBhjUN4d6/KrsnmQM8X6JXL/Fxoc1teeoq21qpT+5zcDfZ1qpXkTHyX+0Oa
	tsnKB3Yni2Qt7wENZUUvI7IQ/xdgh6kf7HnAjcUQ=
Received: by mx.zohomail.com with SMTPS id 1755710039628806.7841478498982;
	Wed, 20 Aug 2025 10:13:59 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	ck.hu@mediatek.com,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	jmassot@collabora.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v1 00/14] MediaTek dt-bindings sanitization (MT8173)
Date: Wed, 20 Aug 2025 14:12:48 -0300
Message-ID: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This patch series continues the effort to address Device Tree validation
warnings for MediaTek platforms, with a focus on MT8173. It follows the initial
cleanup series by Angelo (https://www.spinics.net/lists/kernel/msg5780177.html)

Similarly to the ongoing MT8183 work done by Julien Massot, this patchset
eliminates several of the remaining warnings by improving or converting DT
bindings to YAML, adding missing properties, and updating device tree files
accordingly.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Ariel D'Alessandro (14):
  media: dt-bindings: Convert MediaTek mt8173-mdp bindings to YAML
  media: dt-bindings: Convert MediaTek mt8173-vpu bindings to YAML
  dt-bindings: arm: mediatek: mmsys: Add assigned-clocks/rates
    properties
  net: dt-bindings: Convert Marvell 8897/8997 bindings to YAML
  sound: dt-bindings: Convert MediaTek RT5650 codecs bindings to YAML
  dt-bindings: display: mediatek,od: Add mediatek,gce-client-reg
    property
  dt-bindings: display: mediatek,ufoe: Add mediatek,gce-client-reg
    property
  arm64: dts: mediatek: mt8173: Fix mt8173-pinctrl node names
  dt-bindings: pinctrl: mediatek,mt65xx-pinctrl: Allow gpio-line-names
  regulator: dt-bindings: Convert Dialog Semiconductor DA9211 Regulators
    to YAML
  arm64: dts: mediatek: mt8173-elm: Drop unused bank supply
  dt-bindings: soc: mediatek: pwrap: Add power-domains property
  dt-bindings: input/touchscreen: Convert MELFAS MIP4 Touchscreen to
    YAML
  dt-bindings: media: mediatek,jpeg: Fix jpeg encoder/decoder ranges

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   9 +
 .../display/mediatek/mediatek,od.yaml         |  10 +
 .../display/mediatek/mediatek,ufoe.yaml       |  11 +
 .../input/touchscreen/melfas,mip4_ts.yaml     |  55 +++++
 .../input/touchscreen/melfas_mip4.txt         |  20 --
 .../bindings/media/mediatek,mt8173-mdp.yaml   | 174 +++++++++++++++
 .../bindings/media/mediatek,mt8173-vpu.yaml   |  76 +++++++
 .../media/mediatek,mt8195-jpegdec.yaml        |  31 +--
 .../media/mediatek,mt8195-jpegenc.yaml        |  15 +-
 .../bindings/media/mediatek-mdp.txt           |  95 --------
 .../bindings/media/mediatek-vpu.txt           |  31 ---
 .../bindings/net/marvell,sd8897-bt.yaml       |  91 ++++++++
 .../bindings/net/marvell-bt-8xxx.txt          |  83 -------
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   2 +
 .../devicetree/bindings/regulator/da9211.txt  | 205 ------------------
 .../bindings/regulator/dlg,da9211.yaml        | 104 +++++++++
 .../bindings/soc/mediatek/mediatek,pwrap.yaml |  15 ++
 .../sound/mediatek,mt8173-rt5650.yaml         |  73 +++++++
 .../bindings/sound/mt8173-rt5650.txt          |  31 ---
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   2 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  31 ++-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  14 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  14 +-
 23 files changed, 672 insertions(+), 520 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt
 create mode 100644 Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/da9211.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt

-- 
2.50.1


