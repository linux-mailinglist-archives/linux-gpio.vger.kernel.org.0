Return-Path: <linux-gpio+bounces-22921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF08AFC954
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 13:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF194562C0F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 11:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AB52D9491;
	Tue,  8 Jul 2025 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HC09y5dN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3976215F48;
	Tue,  8 Jul 2025 11:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751973504; cv=none; b=JIRyWZOLFyQSYM/NTiQAzrfA3Jc7Bb1SO6X2XxybSb/nfk2x7Qbn9HSaZkL/UiflnSWf+jyE1iESBBejwKW9nLHRKVbjdDpKbYb1UyIJc05dt8h2OgTS0Heak9jEqsP/gDEYCJ30b9tjwiIS0Rp1oxBD5JnapgWag0EKd6BRp1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751973504; c=relaxed/simple;
	bh=xY4xPTMRtyzuiqGW52Mj3aVx8O7B1JwwO2oZL1QYlTM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RAdvFYjoz/A1KwwY5xF43f9YlmuWc1CpdwD0+m61S/VBISZqHpFGbO4CRGgSxW9puwmo+SS8499Yq3GmA9DAqZmkna1ESqG5AguJGz24A2rios+zdrp+43q6x2Zc4WTe5OP5FBT9vUd+x7jx/GIHJg/UZ1k40Zc0BxZGtmzhVTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HC09y5dN; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3d256cc85bed11f0b1510d84776b8c0b-20250708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GVVtgIDgRyS0EiQiov6cjVyodIJmEgZVKCuRpntH8+E=;
	b=HC09y5dNk4ilwDq8ovFvyOm2BEQAYwcXdtb3mCDVU8HYkrrLKHBRpp05i4A679AzEH7Rb5EX0WJlPnuE9zjHMVARvYfrvRrngP3/MesKPur6L+T8rkBqackLiDR7cxu+LfsftznKJU8XpXkQRKIjPbRJ1bJ1Cz5az3ZfggOO7hQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:5614e324-65da-403d-8df3-5a9f48e2f0b2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:00e6a449-3902-4ad6-a511-6378a8132fbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|102,TC:nil,Content:0|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3d256cc85bed11f0b1510d84776b8c0b-20250708
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1728271332; Tue, 08 Jul 2025 19:18:13 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Jul 2025 19:18:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Jul 2025 19:18:11 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>
Subject: [PATCH v6 00/10] ASoC: mediatek: Add support for MT8196 SoC
Date: Tue, 8 Jul 2025 19:15:52 +0800
Message-ID: <20250708111806.3992-1-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N

From: Darren Ye <darren.ye@mediatek.com>

This series of patches adds support for Mediatek AFE of MT8196 SoC.
Patches are based on broonie tree "for-next" branch.

Changes since v5:
 - restore the commit message for mediatek,mt8196-afe.yaml and only remove the string document.
 - add reviewed owner for mediatek,mt8196-nau8825.yaml.
 - use SND_JACK_AVOUT as jack status.
 - use GENMASK_ULL to support 64-bit address masks.
 - modify the afe platform and i2s dai driver code based on reviewer's suggestions.

Changes since v4:
 - modify the mediatek,mt8196-afe.yaml commit message and add reviewed owner.
 - modify the mediatek,mt8196-nau8825.yaml commit message.
 - modify the audio common code based on reviewer's suggestions.
 - add reviewed and tested owners in the audio common code submission message.
 - fix cm update cnt calculation issue.

Changes since v3:
 - the AFE TOP CG index is added to the common header.
 - remove the audsys clk register and directly read and write to the regmap of afe cg clk.
 - modify the clk logic according to the suggestions.
 - remove the macro definition of MTKAIF4
 - remove the tdm cg event and directly read and write the tdm cg reg form the widget.
 - remove the i2s and cm cg event and directly read and write cg reg.
 - afe hopping and f26m clk cg are placed in remap_register_patch and enable.
 - the yaml file is modified according to the suggestions.
 - replace SND_SOC_DAIFMT_CBS_CFS with SND_SOC_DAIFMT_CBC_CFC.

Changes since v2:
  - remove the mtk_memif_set_channel interface modify.
  - remove duplicate definitions from the header file.
  - move the afe gate clk to the audio driver for management and registration
    and manage the afe clk gate in each dai driver.
  - delete the useless clk source.
  - the i2s driver adds i2s clk gate management, removes the additional dts
    configuration of i2s4.
  - the afe and i2s dai driver,memif and irq data structs are encapsulated using
    macros to reduce the amount of code.
  - the volatile reg is modified as suggested.
  - mt6681 codec is not supported, the mt6681 keyword is removed.
  - the name of the machine driver is changed from mt8196-mt6681.c to mt8196-nau8825.c
  - remove the i2s4 configuration from mt8196-afe.yaml and make the modifications as suggested.
  - change the mt8196-mt6681.yaml to mt8196-nau8825.yaml and make the modifications as suggested.

Changes since v1:
  - modify mtk_memif_set_channel and mtk_afe_pcm_pointer interfaces
    are improved to support mt8196.
  - remove duplicate definitions in the mt8196 common header file.
  - cm logic is merge into the afe platform driver.
  - modify afe clk to return judgment logic and remove useless clk sources.
  - refactor the mt8196 adda dai driver.
  - remove the gpio module and use SND_SOC_DAPM_PINCTRL to manage it.
  - removes CONNSYS_I2S related functions that are not supported in i2s dai driver.
  - fixed mt8196-afe.yaml and mt8196-mt6681.yaml syntax issues.
  - modify log printing in all modules.
  - optimize the header file included for machine driver.

Darren Ye (10):
  ASoC: mediatek: common: modify mtk afe platform driver for mt8196
  ASoC: mediatek: mt8196: add common header
  ASoC: mediatek: mt8196: support audio clock control
  ASoC: mediatek: mt8196: support ADDA in platform driver
  ASoC: mediatek: mt8196: support I2S in platform driver
  ASoC: mediatek: mt8196: support TDM in platform driver
  ASoC: mediatek: mt8196: add platform driver
  ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE
  ASoC: mediatek: mt8196: add machine driver with nau8825
  ASoC: dt-bindings: mediatek,mt8196-nau8825: Add audio sound card

 .../bindings/sound/mediatek,mt8196-afe.yaml   |   157 +
 .../sound/mediatek,mt8196-nau8825.yaml        |   102 +
 sound/soc/mediatek/Kconfig                    |    30 +
 sound/soc/mediatek/Makefile                   |     1 +
 .../mediatek/common/mtk-afe-platform-driver.c |    47 +-
 .../mediatek/common/mtk-afe-platform-driver.h |     2 +
 sound/soc/mediatek/mt8196/Makefile            |    17 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c    |   728 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.h    |    80 +
 sound/soc/mediatek/mt8196/mt8196-afe-common.h |   213 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    |  2632 ++++
 sound/soc/mediatek/mt8196/mt8196-dai-adda.c   |   888 ++
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c    |  3944 +++++
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c    |   836 ++
 .../mediatek/mt8196/mt8196-interconnection.h  |   121 +
 sound/soc/mediatek/mt8196/mt8196-nau8825.c    |   869 ++
 sound/soc/mediatek/mt8196/mt8196-reg.h        | 12068 ++++++++++++++++
 17 files changed, 22719 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml
 create mode 100644 sound/soc/mediatek/mt8196/Makefile
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-nau8825.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-reg.h

-- 
2.45.2


