Return-Path: <linux-gpio+bounces-13386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A89DFFC7
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 12:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F076281532
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 11:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6208E1FDE14;
	Mon,  2 Dec 2024 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="ArHi1nWC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761F31FCFE7;
	Mon,  2 Dec 2024 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733137766; cv=none; b=eY0XrR7BtLH84+xdCFcJURQ7aGkIK8ZBWN8hJPs0tSgOnZkPMx8zyWj/rLiBvfHqY0digpzlgXkSR5l+Su+Omc9jNk5X7+Rz7lwGxnzUk2PVh+E3AYrDRYvSaW3T5mIHYhsn9NRGn5eN2YKoB999wxvOTRKqiyiShxa4xKXkqEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733137766; c=relaxed/simple;
	bh=ehSSEoWvXlF4UI9qtPYGUyBaauQysGmoOhwaF7jtG7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MQlqPiQZYpfRiczjj+vVgzWkHoBFdkWK31IHnB30quf6XNdzXG0tEWgpFA8uGyAQ4R59o5TyBG4o81MidqampnRoF6F9m4Ennag+IgyhVc9K17XHuYL2V3aaV18FT+BxUbO6rtVdxKAd3fXDU2MeezIHFbj3aRghZw3VPNPsrH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=ArHi1nWC; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 7B32260FA5;
	Mon,  2 Dec 2024 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733137257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=86EvgCO6od0cvtHnJ8468kzI29+oaxRmTIup/RkDzcA=;
	b=ArHi1nWCoN+5NaD7YWdy0JFjjfVTHhXym47DOdaM+9fX04Be/GCvXii40N+5naHPKrsi7A
	GTM0rjkWw2UUR4srnK7+Cj9D6qBEYuBM4DN7JQQwUBOCMvKlN20Td4sTvCwBU+gltwcqFW
	sfp2TS1TYXcllwKLAYMI0RoqVfrvQV8=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 83B971002C7;
	Mon,  2 Dec 2024 11:00:56 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 0/5] Add pinctrl support for mt7988
Date: Mon,  2 Dec 2024 12:00:34 +0100
Message-ID: <20241202110045.22084-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 55088614-6dd8-4657-af48-c5c86a14cb8f

From: Frank Wunderlich <frank-w@public-files.de>

This series adds pinctrl driver, dt-bindings and dts node for pinctrl
on mediatek mt7988 SoC.

changes in v5:
- rebased to 6.13-rc1
- moved dt nodes with mutliple options to BPI-R4 board
- changes suggested by angelo in v4
- changed example in binding and dt node to not using const MTK_DRIVE_8mA

changes in v4:
- fixed fixed string binding error

changes in v3:
- rebase on rafals dts patches
- update binding to have mux subnode as fixed string and conf with optional suffix

changes in v2:
  binding:
  - drop gpio-cells description
  - move ref in mux subnode up
  - order uart-functions alphanumeric and fix typo
  dts:
  - fix indentation of reg-values

Daniel Golle (2):
  pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
  pinctrl: mediatek: add MT7988 pinctrl driver

Frank Wunderlich (3):
  dt-bindings: pinctrl: add binding for MT7988 SoC
  arm64: dts: mediatek: mt7988: add pinctrl support
  arm64: dts: mediatek: mt7988: add pinctrl subnodes for bpi-r4

 .../pinctrl/mediatek,mt7988-pinctrl.yaml      |  578 ++++++
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  189 ++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |   54 +
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt7988.c     | 1556 +++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   73 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |    1 +
 8 files changed, 2448 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7988.c

-- 
2.43.0


