Return-Path: <linux-gpio+bounces-11116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BFE997253
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 18:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 975BA2837E2
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 16:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C751A0AFA;
	Wed,  9 Oct 2024 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="OQ+gFqKF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8117E765;
	Wed,  9 Oct 2024 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728492765; cv=none; b=jqS/+TXnI4prybWgTEZyd32Tt7PganFOg3ZVKTdqaobDi/pLeMwCFZ4iO1LfyAiVq+Ag4gGEJwl6iMHSUuUpP/dndJZOxyn59zHKs4xO1uyWqJ+QUy6DAJvJzWZpaVwe7x/+fmv3qzUrnLIUhpVFFld1MNbtqEf+O81EDuylPJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728492765; c=relaxed/simple;
	bh=b7Ps3bTMFX6klhLzpKmqv69HUnFie/ZwK482f7DSNv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VKh3geDkV5RfsvPMdvVL1I4+YgclpvWgaVQg49inTwzyR9TT2TUx2amekDQfyZcDcc3XUYYRSTo5VIBDhHhZnj2mVD6WycvCRuuQtJhvZa+2RdKemcsdyVGtyc18C144i1z4Pj6nWzGCN1Y2BpT7315GgWLibvBCA2sJNO5nvVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=OQ+gFqKF; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout3.routing.net (Postfix) with ESMTP id 6D682616A2;
	Wed,  9 Oct 2024 16:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728492754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UpGS3gTyhzjjSZbO4X6Vyyq4IACP8SWP3ZnkGETPtLk=;
	b=OQ+gFqKFt8WwUNnxdIoSGv7v/PpLekziwmGcij40gQBc7yTtBy4GK+wqJZomr5vHHLewkk
	Erdbl1b8e1c9n9UDQ4/ABCisTyyG/nzFIHpLoVx8AP5jfEs3nPfV0oO3d2ahTm5Mj6mkKo
	RuckdCa8u18CVDZrtEg8QfHFi3XG0vg=
Received: from frank-u24.. (fttx-pool-217.61.150.182.bambit.de [217.61.150.182])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 54B628023D;
	Wed,  9 Oct 2024 16:52:33 +0000 (UTC)
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
Subject: [PATCH v4 0/4] Add pinctrl support for mt7988
Date: Wed,  9 Oct 2024 18:52:10 +0200
Message-ID: <20241009165222.5670-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 7027da39-35ba-43dd-9915-1fe059df1531

From: Frank Wunderlich <frank-w@public-files.de>

This series adds pinctrl driver, dt-bindings and dts node for pinctrl
on mediatek mt7988 SoC.

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

Frank Wunderlich (2):
  dt-bindings: pinctrl: add binding for MT7988 SoC
  arm64: dts: mediatek: mt7988: add pinctrl support

 .../pinctrl/mediatek,mt7988-pinctrl.yaml      |  571 ++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |  241 +++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt7988.c     | 1526 +++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   59 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |    1 +
 7 files changed, 2406 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7988.c

-- 
2.43.0


