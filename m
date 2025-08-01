Return-Path: <linux-gpio+bounces-23939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB83B180D2
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 13:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 874913BF4A3
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 11:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769C92451C3;
	Fri,  1 Aug 2025 11:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TuJJvz8v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD45221FCA;
	Fri,  1 Aug 2025 11:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754047091; cv=none; b=N2NvX9+AjFblsZ74I9AbvUuE+KF3SCUOCLmZkj9bd2te4L08IiaMBojAWULhP96o7+Ro/y5ZjiS0KEUCtcPrrK0aWdRPpt5fkExpbLAAyNbrcD9bJe3pCWbt6fVP9pKRWThngdGB5ozevhWpVxusWGCXGL33SwbHQalL0MqvBM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754047091; c=relaxed/simple;
	bh=PuTz5rP+g1ZNjvUwlN2rQtxoXWKf+C3pIRkEwIk533k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W3KWcCp25vxGpU1w0fu07uuP0Jgqc17jyVtsn5z2IVvorttEKWBVyat8ExlKyL384zfu1hinY5R5qW1/YCDXRaQwBGI85ugsGKA1MAFseH7qXiWpDQrfrVtSKp0sPP/4f4uK9TZrjRdBoUEE5pa2+ci2WWARXwCmNoKk1JvP7Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TuJJvz8v; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047085;
	bh=PuTz5rP+g1ZNjvUwlN2rQtxoXWKf+C3pIRkEwIk533k=;
	h=From:Subject:Date:To:Cc:From;
	b=TuJJvz8vFL99CAaAFlgj7f3CllPTWHCLan9hM0cD1Cjr+Luo0h5MfgVGpC/p2waZX
	 tzMVV5LhUvsYMg7w+rnZpXAupaLFoR7vx0FZbJ78yHPS1MEt7uSm2Ve7suHVi4kG9W
	 D65RdIu23GcUpsaUqewq2iUTaFhHbeR3Mknbz+oDTM5lgbtZgr5UpUGqdGiKiU7REv
	 mDkFkXBDqN4Y094si7k+fx8PG5BHD/bca8u+180HUyGbyQI+wI/FLjnLQOvI3M9Tak
	 F+5a2PqNF1mZ5xjH24e+xoNQTthUuocashNJX8aZnPdovHcBCQBI/aECzBKEckVWmT
	 Q/0VOoew0NODw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ADD4417E01FD;
	Fri,  1 Aug 2025 13:18:04 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/9] MediaTek devicetree/bindings warnings sanitization
 second round
Date: Fri, 01 Aug 2025 13:18:02 +0200
Message-Id: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGqijGgC/x3MQQqAIBBA0avIrBvQKIyuEi1KxxoiC5UKwrsnL
 d/i/xciBaYIvXgh0MWRD1+gKgFmnfxCyLYYalm3spMK97ShTTPeU/Dsl4iq1bZxRkmnNZTsDOT
 4+ZfDmPMHxs4ujGIAAAA=
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
Julien Massot (9):
      dt-bindings: clock: mediatek: Add power-domains property
      dt-bindings: arm: mediatek: Support mt8183-audiosys binding variant
      arm64: dts: mt8183: Rename nodes to match audiosys binding schema
      ASoc: dt-binding: Convert mt8183-afe-pcm binding to YAML
      dt-bindings: sound: Convert MT8183 DA7219 sound card bindings to YAML
      ASoC: dt-binding: Convert MediaTek mt8183-mt6358 bindings to YAML
      dt-bindings: pinctrl: mediatek: mt8183: Allow gpio-line-names
      arm64: dts: mediatek: mt8183-kukui: Fix pull-down/up-adv values
      arm64: dts: mediatek: mt8183-pumkin: Fix pull-down/up-adv values

 .../bindings/arm/mediatek/mediatek,audsys.yaml     |  17 +-
 .../devicetree/bindings/clock/mediatek,syscon.yaml |   3 +
 .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml  |   2 +
 .../devicetree/bindings/sound/mt8183-afe-pcm.txt   |  42 ----
 .../devicetree/bindings/sound/mt8183-afe-pcm.yaml  | 225 +++++++++++++++++++++
 .../bindings/sound/mt8183-da7219-max98357.txt      |  21 --
 .../devicetree/bindings/sound/mt8183-da7219.yaml   |  49 +++++
 .../sound/mt8183-mt6358-ts3a227-max98357.txt       |  25 ---
 .../devicetree/bindings/sound/mt8183-mt6358.yaml   |  59 ++++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  22 +-
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  22 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   4 +-
 12 files changed, 378 insertions(+), 113 deletions(-)
---
base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
change-id: 20250801-mtk-dtb-warnings-157d4fc10f77

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


