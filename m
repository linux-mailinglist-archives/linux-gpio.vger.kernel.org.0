Return-Path: <linux-gpio+bounces-24626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B341EB2DE33
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACC6A166E0B
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89481321425;
	Wed, 20 Aug 2025 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o2Q2+Zgb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E882E5405;
	Wed, 20 Aug 2025 13:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755697505; cv=none; b=g3L/Y0p3fPLl61b3+xFZ5FSnI9czl05eOJ9IQBSBf7l1G8CrVCM4QG9zf7BtjW2uxEyw79FDulYHCZA+L6APVxsy+Cnidpg4Y6Ovxr9a9tnttTtVgXm1UZ2bmmO/mro3Elz2yZYFQ71yYYG4QV7/tBWLs9ZrXEd50MUgcKpZLnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755697505; c=relaxed/simple;
	bh=KfG24pPgv1Uh1EexQ+H85Ze6YKWSeO2wkVKi6hfXFb4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ad+TGz+boMZf/Q6quEkLpP+zq7SoHFZLYi93cBdq4tMRABPRWTbJlGK2eMMGZy9oyyUITKZuipXbZ39mxhcFcH9S4+hMobRjLMy5aNVdXPUWsR9eDvwDiUc7H47A6U2KHUMA6fjcMuC815HDRLGyXU4m1MrktTzJbnJw9egFWtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o2Q2+Zgb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755697500;
	bh=KfG24pPgv1Uh1EexQ+H85Ze6YKWSeO2wkVKi6hfXFb4=;
	h=From:Subject:Date:To:Cc:From;
	b=o2Q2+ZgbK78wJb9uQKi4s/epP/4RRxMajW9l1L4ZrZplygagLaCdFh951EdeS+fuN
	 UaBUbKv1r1pWFjvIqWkFnXz+OqwYtwCmChe7tpXh3ZLXAccO+JrFzxgUM8I5ZKb26k
	 Tm1uDq3v5PcgVILUqrU2M5SVHyhzao/5ZyZlEBVPaOjBrB+sSBGoqYlOyOHpawFqHN
	 GpYpvdA8eBfQGqzxk8UtZWGW0g/SNP8VM36Z34LKi59ReTj7tijITfU5qJlZ95XDFk
	 CZeIt1KFP5yy9nAZwS5iYfifUhZeIe17YAqaT28pswfb22L5ApPB7LmBYPNVzx7i2R
	 i/gh1aPHxuqvg==
Received: from localhost-live.home (2a01cb0892F2D600C8f85CF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AFC817E01F5;
	Wed, 20 Aug 2025 15:44:59 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 0/6] MediaTek devicetree/bindings warnings sanitization
 second round
Date: Wed, 20 Aug 2025 15:44:51 +0200
Message-Id: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTRpWgC/32NSw6CMBRFt0Le2GfaWqxx5D4Mg37hRWhNS1BD2
 LuVBTg8J7nnrlB8Jl/g2qyQ/UKFUqwgDg3YQcfeI7nKIJho2YVxnOYHutngS+dIsS/IW+VksJw
 FpaDOntkHeu/Je1d5oDKn/NkfFv6zf2ILR4Zno6WXJyGFMjebxlGblPXRpgm6bdu+s/ArSLQAA
 AA=
X-Change-ID: 20250801-mtk-dtb-warnings-157d4fc10f77
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

This patch series continues the effort to address Device Tree validation warnings for MediaTek platforms, with a focus on MT8183. It follows the initial cleanup series by Angelo (https://www.spinics.net/lists/kernel/msg5780177.html)

The patches in this set eliminate several of the remaining warnings by improving or converting DT bindings to YAML, adding missing properties, and updating device tree files accordingly.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Changes in v2:

- Restrict power-domain usage to mediatek,mt8183-mfgcfg only
- Add the MT8183 AFE binding before audiosys (it is referenced in the example) and include the memory-region property
- Rename binding files to align with the compatible name
- Drop former patch 7/9 (already applied via the pinctrl tree)
- Drop patches 8/9 and 9/9 until we decide how to represent R0 and R1 values

---
Julien Massot (6):
      dt-bindings: clock: mediatek: Add power-domains property
      ASoC: dt-binding: Convert mt8183-afe-pcm binding to YAML
      dt-bindings: arm: mediatek: Support mt8183-audiosys binding variant
      arm64: dts: mt8183: Rename nodes to match audiosys binding schema
      dt-bindings: sound: Convert MT8183 DA7219 sound card bindings to YAML
      ASoC: dt-binding: Convert MediaTek mt8183-mt6358 bindings to YAML

 .../bindings/arm/mediatek/mediatek,audsys.yaml     |  16 +-
 .../devicetree/bindings/clock/mediatek,syscon.yaml |  15 ++
 .../bindings/sound/mediatek,mt8183-audio.yaml      | 228 +++++++++++++++++++++
 .../bindings/sound/mediatek,mt8183_da7219.yaml     |  49 +++++
 .../sound/mediatek,mt8183_mt6358_ts3a227.yaml      |  59 ++++++
 .../devicetree/bindings/sound/mt8183-afe-pcm.txt   |  42 ----
 .../bindings/sound/mt8183-da7219-max98357.txt      |  21 --
 .../sound/mt8183-mt6358-ts3a227-max98357.txt       |  25 ---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   4 +-
 9 files changed, 368 insertions(+), 91 deletions(-)
---
base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
change-id: 20250801-mtk-dtb-warnings-157d4fc10f77

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


