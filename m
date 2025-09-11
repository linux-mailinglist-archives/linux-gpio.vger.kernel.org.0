Return-Path: <linux-gpio+bounces-25965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD8CB53711
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 17:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3E221C222AA
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 15:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAD1346A1B;
	Thu, 11 Sep 2025 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="Tp0xnrD2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2FE15746E;
	Thu, 11 Sep 2025 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603592; cv=pass; b=hqh3e5WQh6x+lCeKEymzLyrYR7a/ZOA0qo+fAC3o4o5fNLB+Us9J4SNMez5hCeCRXGBLqhvxNNWf09f20m/+HyZWoJbPVwdajZ9HWFvbCqLlQ8TTqL2aEXegK92ib0FIT33rTKX83PRnRmRpnnkfp49V8erk/ba4uJzLXQh+mbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603592; c=relaxed/simple;
	bh=dPiSK05fxe+FuQby1ebrZdrIQ9EXZx7N4NljlqZ2c2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oS/k0DkoOhvLPDWRDqvH16uRVp73hvXAOWgqluoZnVklb3eubfX6TLMph/fhEAZHzjuA2FpTBWtBKsNkE4Q3bPFMR0q9ftrpNziLsANUkHKGKmX5UNl/bmFHviMg+Aymuu+cPa2EB4qb9i9hoAz1jA4QSR1FUccObPrGnlog45g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=Tp0xnrD2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757603532; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B9IGFw7LplNPOkZEq5rg//uOHf2EjeiJHVJse7seMUTzZIMxYd1TVrOZN0zUbq5Xq33L+9q9+TqFilkErBnjfaa/NpughWfaUjECxVa+0PaEb+YDKAdGNrY++tuNVVIv/wj8tJU+KqRR3v9zzmvdP6gOS405s9ICJ1bawZoNf0E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603532; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4E1gkCV3bUB24+jEbYd5O83SC/ksIpy9YseSb1Bd3iA=; 
	b=OYspCStGN7dInL2eQAJ59H16VwPLP5z4wWe5Nr6htKYI4pPJuPUYGIV4faEbAdxSfzVEwkFgj+ZF3SmcHreJc8qUT/uzUAHUdyXtnkWOokhqUalCV4rW9dIvNsZfNzhRjZLbbMNHmz9gEQaCCxIvVLYhrFc0Y2lAOG7iIOnvWyc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603532;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4E1gkCV3bUB24+jEbYd5O83SC/ksIpy9YseSb1Bd3iA=;
	b=Tp0xnrD2zRi58CffU5G3TaTiLbJcAER4BZDZ/9WPboVLvTu6uzg9VYi/ZTt2X5qw
	PMD8pJ8vo2CnYFCkcKqSC4Ganw2/UNoxh4q3T1CUWsieDlvzRf8LKJqusv5Qlx+IBze
	ExFMJOuw5cTRX/uVEXriSe7jqmq8yEDKe+84VPaw=
Received: by mx.zohomail.com with SMTPS id 1757603530466436.8737694403886;
	Thu, 11 Sep 2025 08:12:10 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	heiko@sntech.de,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com,
	marcel@holtmann.org,
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
	linux-bluetooth@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 00/12] MediaTek dt-bindings sanitization (MT8173)
Date: Thu, 11 Sep 2025 12:09:49 -0300
Message-ID: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
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
warnings for MediaTek platforms, with a focus on MT8173. It follows the
initial cleanup series by Angelo [0].

Similarly to the ongoing MT8183 work done by Julien Massot, this patchset
eliminates several of the remaining warnings by improving or converting DT
bindings to YAML, adding missing properties, and updating device tree files
accordingly.

[0] https://www.spinics.net/lists/kernel/msg5780177.html

Changes in v2:
* Wrapped commit messages to 75 columns line wrap.
* Replaced "YAML" by "DT schema" in patches subject and content.
* mt8173-mdp: Fixed properties: compatible, clocks, iommus and
  mediatek,vpu.
* mt8173-vpu: Fixed line wrap. Dropped memory-region property description.
* mediatek,mmsys: Dropped patch as it's not a binding issue.
* mediatek,od: Rewrote commit log with details on DT schema users missing
  the related property. Rewrote mediatek,gce-client-reg property.
* mediatek,ufoe: Rewrote commit log with details on DT schema users missing
  the related property. Rewrote mediatek,gce-client-reg property.
* marvell,sd8897-bt: Moved to net/bluetooth/. Added missing ref to
  bluetooth-controller.yaml. Dropped example. Updated reference in another
  file. Minor fixes in properties.
* mediatek,mt8173-rt5650: Dropped unnecessary quotes and unused label.
* dlg,da9211: Dropped enable-gpios description. Rewrote generic example
  node names. Minor fixes in properties.
* melfas,mip4_ts: Dropped unnecessary quotes. Added "active high" to
  ce-gpios property description.
* mediatek,jpeg: Dropped patch as it doesn't apply.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Ariel D'Alessandro (12):
  dt-bindings: media: Convert MediaTek mt8173-mdp bindings to DT schema
  dt-bindings: media: Convert MediaTek mt8173-vpu bindings to DT schema
  dt-bindings: net: Convert Marvell 8897/8997 bindings to DT schema
  dt-bindings: ASoC: Convert MediaTek RT5650 codecs bindings to DT
    schema
  dt-bindings: display: mediatek,od: Add mediatek,gce-client-reg
    property
  dt-bindings: display: mediatek,ufoe: Add mediatek,gce-client-reg
    property
  arm64: dts: mediatek: mt8173: Fix mt8173-pinctrl node names
  dt-bindings: pinctrl: mt65xx: Allow gpio-line-names
  dt-bindings: regulator: Convert Dialog DA9211 Regulators to DT schema
  arm64: dts: mediatek: mt8173-elm: Drop unused bank supply
  dt-bindings: soc: mediatek: pwrap: Add power-domains property
  dt-bindings: input: Convert MELFAS MIP4 Touchscreen to DT schema

 .../display/mediatek/mediatek,od.yaml         |  14 ++
 .../display/mediatek/mediatek,ufoe.yaml       |  15 ++
 .../input/touchscreen/melfas,mip4_ts.yaml     |  56 +++++
 .../input/touchscreen/melfas_mip4.txt         |  20 --
 .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 +++++++++++++++
 .../bindings/media/mediatek,mt8173-vpu.yaml   |  74 +++++++
 .../bindings/media/mediatek-mdp.txt           |  95 --------
 .../bindings/media/mediatek-vpu.txt           |  31 ---
 .../net/bluetooth/marvell,sd8897-bt.yaml      |  79 +++++++
 .../devicetree/bindings/net/btusb.txt         |   2 +-
 .../bindings/net/marvell-bt-8xxx.txt          |  83 -------
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   2 +
 .../devicetree/bindings/regulator/da9211.txt  | 205 ------------------
 .../bindings/regulator/dlg,da9211.yaml        | 104 +++++++++
 .../bindings/soc/mediatek/mediatek,pwrap.yaml |  15 ++
 .../sound/mediatek,mt8173-rt5650.yaml         |  73 +++++++
 .../bindings/sound/mt8173-rt5650.txt          |  31 ---
 .../dts/rockchip/rk3288-veyron-fievel.dts     |   2 +-
 .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |   2 +-
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   2 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  33 ++-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  14 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  14 +-
 23 files changed, 633 insertions(+), 502 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/marvell,sd8897-bt.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/da9211.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt

-- 
2.50.1


