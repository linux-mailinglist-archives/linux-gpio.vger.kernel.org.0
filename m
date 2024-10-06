Return-Path: <linux-gpio+bounces-10891-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AED94991DAA
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 12:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57C321F21BDA
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 10:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F131741D4;
	Sun,  6 Oct 2024 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="O99VF029"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D2D1EB36;
	Sun,  6 Oct 2024 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728209340; cv=none; b=cOd5DtDlpxE+rZvv2tfGPP/Fp+aTp1kUgOTlzybnksEDPWYJ8reOv12lB6rShtLOcgPFWPtU2h30J0EVWrthnnoX/fZwxieBciNL0s8Mz8FiRBfd+bQmItuLl1kljWxTcCd2uxKSimG0MJegKXsQzjn6lzgLcLb3SEoGx9cAeVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728209340; c=relaxed/simple;
	bh=tG4jB0jiD8wydvRD03/UzpMrEMiI3LUIhCYAv6gaSgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xh9vl4PWJqjx22SqO7fFE16BGU5Hkenpzmg6Eo1SWKAUx3eKmxEEX5rHtTOugHEn3ohWC68QZTw8N/U3bW/RfTzSA7Llwvmy9Dph/8tvwjxOhgo5YpKajp9fTtylEFKBPGlUA+/tIEzTvSvunz+4QGK9OmfQF0txLT+HY88Q6gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=O99VF029; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 24CFD3FEAE;
	Sun,  6 Oct 2024 10:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728209330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FypBKEYlhaTlaKbMRffqRtZ7GSPmlXXTHh5zzK+/koM=;
	b=O99VF029B7ZrWgo++quavYdAYwKnWb+7jMEUelU+8ECW9EGGu0eIPvnHta5RP+1CHJAHG6
	ebMsTMvpgaP51kbYxdfU4mn2iWNUzKPc0RyvkDx+3HcJin0EkqTSd6bFBCOQyFCTrNHVUQ
	eKiJFqRb3pUkSGZX9Y/ufBF2rRymR2I=
Received: from frank-u24.. (fttx-pool-217.61.153.101.bambit.de [217.61.153.101])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 2AC1B360250;
	Sun,  6 Oct 2024 10:08:49 +0000 (UTC)
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
Subject: [PATCH v2 0/4] Add pinctrl support for mt7988
Date: Sun,  6 Oct 2024 12:08:36 +0200
Message-ID: <20241006100843.13280-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 7fb96a6d-30e2-4582-8447-9fcf730e4f06

From: Frank Wunderlich <frank-w@public-files.de>

This series adds pinctrl driver, dt-bindings and dts node for pinctrl
on mediatek mt7988 SoC.

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


