Return-Path: <linux-gpio+bounces-13657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 192F09E958D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69CD52819FA
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E21234976;
	Mon,  9 Dec 2024 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="bQRrTd6m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BF6233D99;
	Mon,  9 Dec 2024 12:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749085; cv=none; b=tuoZvLnC2tYUmaUKoSEtXFfNp6yb/LK9cayPvr9g6xiXCrbCd+u7B2uQ/njzcz9ox5uWwlUJpVFkn1Q3my484CJXeS273gcglw5QHx0CRarhGnHDVR3DyeTgTtGZC0TuXy6JjKh80uKoHi6do2sU2sSw/EnpXUthlitilXFkge4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749085; c=relaxed/simple;
	bh=MQxJACt2qf28gjS7xexq1Q9BaJXRKKxZU40I7tfb95s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RYjD84wrLYRd4cV8x65JwuRvPmMRQWlp3pZ6Qq297MEL+Fuh+JwCOUDERXCxAOnP0k90s/EjvzeTg/x6w4QUDbq1vYkE0nrU0BR1toBpyApewkIIEzxWCigi8OM23MoVL4f91npUso/1F5te8pMuWLwPW6RO2RRRZg9kseR65m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=bQRrTd6m; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout2.routing.net (Postfix) with ESMTP id 9AE375FC3D;
	Mon,  9 Dec 2024 12:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733749075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QbvJAK8CeaB2O9XIazN63jkXHsl6QMzYRIOD/43bDtM=;
	b=bQRrTd6mxV7EwfWBJIgGWFVMpkZQMZRxqYEtSQyW0yFy9QLWY0RDnM1Qyx1gvVDdlOg6uB
	8+4j/vP7QThfGRND9MwAIDKjtb1pRCQ7N5Uy/9kbfWFOwnfR2l8SfdixiglOnS+gsHc4xT
	Q6ezJm0M6ZJGDG746kkKEiDQm/GKgxE=
Received: from frank-u24.. (fttx-pool-80.245.75.28.bambit.de [80.245.75.28])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id AD48D80483;
	Mon,  9 Dec 2024 12:57:54 +0000 (UTC)
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
Subject: [PATCH v6 0/5] Add pinctrl support for mt7988
Date: Mon,  9 Dec 2024 13:57:34 +0100
Message-ID: <20241209125742.9307-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: a2e1c607-20e8-4b0b-9aec-6da01a38e817

From: Frank Wunderlich <frank-w@public-files.de>

This series adds pinctrl driver, dt-bindings and dts node for pinctrl
on mediatek mt7988 SoC.

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


