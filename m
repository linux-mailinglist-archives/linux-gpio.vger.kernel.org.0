Return-Path: <linux-gpio+bounces-18673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFED1A846AF
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 16:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE5BB188E70E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 14:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4726528D857;
	Thu, 10 Apr 2025 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Et4OP1zS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0CD28C5DD;
	Thu, 10 Apr 2025 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296054; cv=none; b=grGZ2LFdfRhlsTp5T30PuefLiJ1wf+FfMASDUXvXq9ppFahS3W1JzD65XfxyJqG3RXlaotRXcIyJgHzq5wpqorqFWOGf/jDm0cwQZGBgDToWABxPOjIwXowSCIxQQgRPQaXL+yiBtImOiVwElt2zJ5pY1vYDQ+kP9BBdjp27eqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296054; c=relaxed/simple;
	bh=HoMXmmD7f7z0l1Z9ckE1vbnSpSX6fo2zewO9Evv2Zq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mOs1bDqJ84T6SdexI+e4x04Sw6NNGRwF8Nelj4jIfiaqfxiOqdH5DA9VjKI2LQq77Jb3u/Tx+ParojSg0uBZ/J+4LlbHad8L6e1th88mgccTZk2QlsCE/HxWfgbjCb7cb/afP7yiP4nWbX4WIuLGrmsULUvlIdDK+TunXYxBLT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Et4OP1zS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296050;
	bh=HoMXmmD7f7z0l1Z9ckE1vbnSpSX6fo2zewO9Evv2Zq0=;
	h=From:To:Cc:Subject:Date:From;
	b=Et4OP1zSxFwzxP+VSQTfoQrie8gEtMOY1HEhjJzT87Gdbo/H/F7CBuNNhoR+tF6ub
	 ZCZNk3R8OA0NqMp7BK7ZONMbee3hXul+Gx8GlyCdfPDzt2lxviOjg2r2lSSnmxSM+u
	 ju6oDAzxQ7rXLlqoxweneQu2SU2prX5KVBFAnrt7YkVuL1S2PpCgHLM/L2jNe7/luF
	 13e9gtFbF6CQidFFIW8Uam2ApW0pfW0SorhgK8mEZWNWQNu7oriiE6f2VDZO7MlL4u
	 QYVFxLx8moBhI1cIPz07bFMSBCzRSIqJgyWcuzkt+DwldBIGZgiafoMWOdA0gHxAXK
	 A+76dZLc86uag==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3443A17E0CA7;
	Thu, 10 Apr 2025 16:40:47 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Pin Controller support
Date: Thu, 10 Apr 2025 16:40:41 +0200
Message-ID: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding basic support for the OnePlus Nord 2 5G
DN2103 smartphone, this series adds support for the pin controller
of the MediaTek Dimensity 1200 (MT6893) SoC.

AngeloGioacchino Del Regno (3):
  dt-bindings: pinctrl: mediatek: Add support for MT6893
  pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200
  arm64: dts: mediatek: Add MT6893 pinmux macro header file

 .../pinctrl/mediatek,mt6893-pinctrl.yaml      |  193 ++
 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h | 1356 ++++++++++
 drivers/pinctrl/mediatek/Kconfig              |   10 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6893.c     |  879 +++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6893.h | 2283 +++++++++++++++++
 6 files changed, 4722 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6893-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6893.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6893.h

-- 
2.49.0


