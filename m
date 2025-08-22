Return-Path: <linux-gpio+bounces-24795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8DEB31870
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 14:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2BCA5848B9
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 12:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523BC2FC034;
	Fri, 22 Aug 2025 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="keyaL7QO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92ED2FC008;
	Fri, 22 Aug 2025 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755867207; cv=none; b=nBlqqNxEnIEHrnuZmNg6PzrYpSfqFXwM63BfqBh4iDNYwhkDycQ1mP/Xsq/fx8Vve9UVF3LAp6NTH7166imeurl4KBIdaVLufxgvvm6n7xK/A0ZCZi36yui2MBnyrdFMNYU1tP0kTT1Oh1K1N6LOJO88XTog2fUq6q5lSVYx1JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755867207; c=relaxed/simple;
	bh=PLU7Jy+4Idnvc1wYz0kN+QAM+kuaOgeNMCbhEi1tcJc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oTstRToFP9EwtM1Tkqmmk2meTvAiQKnMPjW0Biy7IfqQmxJaCb37WKOIXtWCyZTRoBYgtNQAhu9MNOH4CzUAKaHtxgkGbl6f1pO9hBzRHgViOANW2wWEI9j/gFYtJPNcePKMi9GfNTHfEWdrfdZEwigAqYFXsW1h+6rEKl9iILI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=keyaL7QO; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: fa8c272a7f5611f0b33aeb1e7f16c2b6-20250822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gdrKdZ51IexfRxyYh9eQjGmdG6o5t0ED4W3C8AISUc8=;
	b=keyaL7QOfXRiAu0qbA6h3ulRSnAWmYhVkTofO8RvB/kxM8HAPDWVg25iIYoHjYAiVanjphn2u2hnPp0v83bE7G3fUbE7VYDbe7zrVfOOHQzbnvyhInr9amNJ8mls6Jd5sOavdiFZMqX/ByN03TQV0Q7Y6RqfPOKy0WFExmtT7gY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:ecee648e-dd5a-428c-bae7-8cc573aef1a4,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:e2f6c344-18c5-4075-a135-4c0afe29f9d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|102,TC:-5,Content:0|15|50,EDM:-3,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fa8c272a7f5611f0b33aeb1e7f16c2b6-20250822
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1089959311; Fri, 22 Aug 2025 20:53:19 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 22 Aug 2025 20:53:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 22 Aug 2025 20:53:16 +0800
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
Subject: [PATCH v7 00/10] ASoC: mediatek: Add support for MT8196 SoC
Date: Fri, 22 Aug 2025 20:52:29 +0800
Message-ID: <20250822125301.12333-1-darren.ye@mediatek.com>
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

Changes since v6:
 - optimize mtk_afe_pcm_pointer interface and improved logic checks.
 - update mt8196_afe_private structure by removing unused member variables.
 - only reference clocks directly supplied to afe and set required frequencies directly.
 - update adda driver according to reviewer suggestions.
 - update i2s driver according to reviewer suggestions.
 - update tdm driver according to reviewer suggestions.
 - optimize platform driver and update widget rotues.
 - move the sof route from platform driver to the machine driver, and moved pinctrl to platform driver.
 - update the afe yaml file to remove unnecessary clock references.

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

 .../bindings/sound/mediatek,mt8196-afe.yaml   |   113 +
 .../sound/mediatek,mt8196-nau8825.yaml        |   100 +
 sound/soc/mediatek/Kconfig                    |    30 +
 sound/soc/mediatek/Makefile                   |     1 +
 .../mediatek/common/mtk-afe-platform-driver.c |    56 +-
 .../mediatek/common/mtk-afe-platform-driver.h |     2 +
 sound/soc/mediatek/mt8196/Makefile            |    14 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c    |   580 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.h    |    64 +
 sound/soc/mediatek/mt8196/mt8196-afe-common.h |   205 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    |  2497 ++++
 sound/soc/mediatek/mt8196/mt8196-dai-adda.c   |   845 ++
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c    |  2613 ++++
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c    |   675 +
 .../mediatek/mt8196/mt8196-interconnection.h  |   121 +
 sound/soc/mediatek/mt8196/mt8196-nau8825.c    |   868 ++
 sound/soc/mediatek/mt8196/mt8196-reg.h        | 12068 ++++++++++++++++
 17 files changed, 20834 insertions(+), 18 deletions(-)
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


