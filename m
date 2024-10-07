Return-Path: <linux-gpio+bounces-10995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F15993840
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 22:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7253BB21BC7
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 20:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCAD1DE89E;
	Mon,  7 Oct 2024 20:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="F1rLU2IX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073A61DE894;
	Mon,  7 Oct 2024 20:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728333071; cv=none; b=aiQs/oer3KNlL3s7iM13QejiRx2Q6qcE1uCCPYL6rBfkpN7phNseCuoj2VUMPF1iBvVQuKvnxSU2xmzDyZF8MKUgktGNzcH7GJsXFmG/qbQpIUJtZG/NDTdbTbPea4VX1AkvXdq37OUtwv1diaKhKQ/lmR3roGreDruLZ5J2GlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728333071; c=relaxed/simple;
	bh=HrnsC/rbAWcVrXZlDoo7J6JaiHvmzWh68qIzFB/4eqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UnecFhKpxsjKyA7QNIpHBsw+HYu/tA/rF6J7ZOoWzCXcWk3VUoEekrNAh0Gl/8Q9+yvuEATWzOf5K56xaqwwyYriJsRQDmpZCBhMt+g3KdlIeRJfDiPszYb4QzMn8ohXyOLACG3HVXj7RhyLNXMEyczVUUp3Ur7Tn8jgQcI4Kro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=F1rLU2IX; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id B9AA25FEF8;
	Mon,  7 Oct 2024 20:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728333060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6TLu7Yfzf4lbg0y6z1FzkWz5coi/i50OEYYrcpN/ESs=;
	b=F1rLU2IX5ExchOPTTgvShxw97tG9m63vhbl8shc9SW30D+fYg2NEqoCORz+lfGNWRPWzha
	Nlb1sWq8WXgiYOo6LsBKeGg0lAp14R8AcLncsTxVeqSMYQ9aAROy3pSuAbgWanYFbX5SDW
	80wADJBsT1tBPbdTWdHOjCecTbeKehc=
Received: from frank-u24.. (fttx-pool-157.180.226.56.bambit.de [157.180.226.56])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 7E823360200;
	Mon,  7 Oct 2024 20:30:59 +0000 (UTC)
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
	linux-mediatek@lists.infradead.org,
	daniel@makrotopia.org,
	john@phrozen.org,
	ansuelsmth@gmail.com,
	eladwf@gmail.com
Subject: [PATCH v3 0/4] Add pinctrl support for mt7988
Date: Mon,  7 Oct 2024 22:30:41 +0200
Message-ID: <20241007203053.72862-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 0734da11-ea93-4fd0-bc82-59581f47b628

From: Frank Wunderlich <frank-w@public-files.de>

This series adds pinctrl driver, dt-bindings and dts node for pinctrl
on mediatek mt7988 SoC.

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

Frank Wunderlich (2):
  dt-bindings: pinctrl: add binding for MT7988 SoC
  arm64: dts: mediatek: mt7988: add pinctrl support

 .../pinctrl/mediatek,mt7988-pinctrl.yaml      |  569 ++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |  241 +++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt7988.c     | 1526 +++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   59 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |    1 +
 7 files changed, 2404 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7988.c

-- 
2.43.0


