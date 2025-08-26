Return-Path: <linux-gpio+bounces-24954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED0AB355C5
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0566686C8A
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 07:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C348B2E7F32;
	Tue, 26 Aug 2025 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Vz2RvEQd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFA938DD8;
	Tue, 26 Aug 2025 07:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756193981; cv=none; b=Q8bVZ91RxvOW6jCCe2toFRoMZnrDJaJu0OT5K3evOviUnUXe2GXyjzw6XxI1QpaJyTaAwPIZVaa9kCzPoY7mZyzPcbTEFvkZsm676lWpEXg1bByyPCmEpXICdvrwLq/fIXLquG5Pf10soxNO8HkgxTGgrAWMUKxa6QDzB73620g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756193981; c=relaxed/simple;
	bh=OXv6h16dfjmKpvPXbWekd18jZy8dArhzITkeeRAJORI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FhGtOG/y+0b91zZrXa+In6vUMj1S7j91E3+/NSGqwCYLaIGA7/xZ+xkmGZhVauBsKxmPoyW+KQEsoi9Py3dTW2jyUAurEgbLQkL5mb1HFj0PYHM94mg8uN1WnG2tSUPuMOhWDju/sBBe7QRQOTN53NsRpY7aOy4ZuKcyA/MYfig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Vz2RvEQd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756193977;
	bh=OXv6h16dfjmKpvPXbWekd18jZy8dArhzITkeeRAJORI=;
	h=From:Subject:Date:To:Cc:From;
	b=Vz2RvEQdkeXiWNn5E9pY+JTxBJN6tYnGg95IpWV4j0HsMPw6mF0YOYS9yOwm3ackm
	 ieiSWSImeFuZ2A9xET7hXQVWco3je+9E5houg4d4tcW5AZL74CKtPAYCuw381zBLKZ
	 uAm6Uppm8JkVY0pX/iDl3zYWNpaasr6MpkvkFHETliw3aciigP0b/LN5Udly1AowfO
	 UxUA0cBwdxSAQpd0DiucRMPzVn+QEaCxyD9PJ/WwvRw8OcBeJJGz/c6dvp7dS8R0Ba
	 sSywsbE5asDSHHIynRYB0HCedCONAGTQomIVBAsWqbzsBCDrOFet/Mgb8f/NNz111W
	 nzMdfMt3zV+hw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600C8F85cF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89E9417E0985;
	Tue, 26 Aug 2025 09:39:36 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v3 0/6] MediaTek devicetree/bindings warnings sanitization
 second round
Date: Tue, 26 Aug 2025 09:39:33 +0200
Message-Id: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALVkrWgC/33NQQ7CIBCF4as0rMXAlErjynsYF0CHlljBQIOap
 neXdmWMcfm/ZL6ZScLoMJFjNZOI2SUXfIl6VxEzKN8jdV1pAgwa1jJOb9OVdpOmDxW9832ivJG
 dsIYzKyUpZ/eI1j038nwpPbg0hfjaPmS+rn+wzCmjB60EihoESH0yYRyVDlHtTbiRFczwgQD7g
 UBBjBUSODatFfiNLMvyBvGL2zL5AAAA
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

This patch series continues the effort to address Device Tree validation
warnings for MediaTek platforms, with a focus on MT8183. It follows the
initial cleanup series by Angelo
(https://www.spinics.net/lists/kernel/msg5780177.html).

The patches in this set eliminate several of the remaining warnings by
improving or converting DT bindings to DT schema, adding missing properties,
and updating device tree files accordingly.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Changes in v3:
- Mostly cosmetic updates.
- Patch 1/6: fixed the commit reference in the 'Fixes' tag.
- Patch 1/6: not mentioned in v2, but this patch changed quite a lot
  since v1 after applying Angelo's suggestions, so I dropped Rob's
  'Acked-by' tag.
- Renamed commits from "YAML" to "DT schema", and avoided repetition
  of "bindings".
- Patch 2/6: switched to the generic node name "audio-controller".
- Link to v2:
  https://lore.kernel.org/r/20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com

Merge strategy:
- Patch 1/6 can be picked up independently.
- Patch 2/6 is standalone.
- Patch 3/6 depends on 2/6.
- Patch 4/6 fixes the DTS node name as expected by 3/6.
- Patches 5/6 and 6/6 are independent.

Changes in v2:

- Restrict power-domain usage to mediatek,mt8183-mfgcfg only
- Add the MT8183 AFE binding before audiosys (it is referenced in the example)
  and include the memory-region property
- Rename binding files to align with the compatible name
- Drop former patch 7/9 (already applied via the pinctrl tree)
- Drop patches 8/9 and 9/9 until we decide how to represent R0 and R1 values

---
Julien Massot (6):
      dt-bindings: clock: mediatek: Add power-domains property
      ASoC: dt-binding: Convert mt8183-afe-pcm to dt-schema
      dt-bindings: arm: mediatek: Support mt8183-audiosys variant
      arm64: dts: mt8183: Rename nodes to match audiosys DT schema
      dt-bindings: sound: Convert MT8183 DA7219 sound card to DT schema
      ASoC: dt-binding: Convert MediaTek mt8183-mt6358 to DT schema

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
base-commit: 9df95ca9b379cb29aa0f75c4ca86d7b2293d8bf9
change-id: 20250801-mtk-dtb-warnings-157d4fc10f77

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


