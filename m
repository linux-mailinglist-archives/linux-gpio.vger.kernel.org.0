Return-Path: <linux-gpio+bounces-13946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DCF9F46CE
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 10:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE50B16B04D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 09:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AC41DE8AB;
	Tue, 17 Dec 2024 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="n/L3xXmQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76A5537F8;
	Tue, 17 Dec 2024 09:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426270; cv=none; b=qPH9MEcQsv0re0Dv46CdiP3xEeT9DxiaRewMhIOVQWggLt6YA0OODk9hpIMosI2cvF3P8KMCtue7uCt2QOdjurMMssBoQnuZAXmAg7Uw98PO/MHLliNf8k2dM4XjA/hAaZKN3lvfb1EuuvchiaeGXVOy+fo3ZCZD5pgXkUbFdcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426270; c=relaxed/simple;
	bh=bpEYxJ+W6mmb4q3K13vEGXmXtr0H2RuNcMExQtywJBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HerbaJhJRyLIca95QSo6YAy6scd7Nilfo+Qrhk+fqnhjkR61MiBefoAEaZ7bygW0Bb0NpimsRNKzCvoG1XmqtEetBR9ZQf3r3483TOlebLiiY6Z5Hq+rr9BXZHtevuJtxlp6RMXIROh5dSnasn3Xq/zr8AIBusXgJa7nzO/LX0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=n/L3xXmQ; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 256DD604CC;
	Tue, 17 Dec 2024 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734425685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2pqbbdVHCcH3VANkw0WgRiMAw/2BcvXvAUXBdVOTo8Y=;
	b=n/L3xXmQKhLKYpcTbcJzXYze9sUI5wba602cFxDR6wWF9/oLQwE8LtHnzdqQPkml14Tx9M
	BiaHg/NlwqKyHr+k316IV4aWhEJ4MccLHpdn/tlAbJNMZxnCalnj7QPszX27OkUf369TAQ
	o775fjdMpk1M3EQrcSWe+q/J4doqJR4=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 14A511003B7;
	Tue, 17 Dec 2024 08:54:44 +0000 (UTC)
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
Subject: [PATCH v7 0/5] Add pinctrl support for mt7988
Date: Tue, 17 Dec 2024 09:54:25 +0100
Message-ID: <20241217085435.9586-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 9c7aa8e6-e3a5-43a8-993f-ab4d197c3c29

From: Frank Wunderlich <frank-w@public-files.de>

This series adds pinctrl driver, dt-bindings and dts node for pinctrl
on mediatek mt7988 SoC.

changes in v7:
- add const for pins and mtk_pin_soc as suggested by Christophe JAILLET in v5
- left angelos RB because of minor change (hope this is right)

changes in v6:
- some fixes to binding
- changed title and fixed typo in bpi-r4 patch
- added RB's

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
  arm64: dts: mediatek: mt7988: Add pinctrl support
  arm64: dts: mediatek: mt7988a-bpi-r4: Add pinctrl subnodes for bpi-r4

 .../pinctrl/mediatek,mt7988-pinctrl.yaml      |  575 ++++++
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  189 ++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |   54 +
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt7988.c     | 1556 +++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   73 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |    1 +
 8 files changed, 2445 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7988.c

-- 
2.43.0


