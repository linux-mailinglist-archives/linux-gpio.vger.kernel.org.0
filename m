Return-Path: <linux-gpio+bounces-12619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B149BE3AE
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 11:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35083288939
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 10:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF09A1DCB2C;
	Wed,  6 Nov 2024 10:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="X7uhEJLK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch [185.70.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC831DCB06;
	Wed,  6 Nov 2024 10:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887691; cv=none; b=oCCfImFIzBloVIU0tJCpIT8/ziWBu+hWLox49mLYEdoTEkw/0pfxIhvMc5vn5Kz1BPr2rWvGU8ReC1bccxRhVRhmFrzemWqFfp+4dOfN2BUmFO1dSdoSQHTvMozALod0BuesdxemM2TQguyzoZnprrxTOlkXU0fB5vXSuecwfQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887691; c=relaxed/simple;
	bh=DioRjFg2BsUD83/DwMDVpmXfis+iVFsiJb7QBbbqNv4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DsnqKN5yoBYrfSdim6E4iAF9UZfm9iXbcyWZdocAGj188hPqZKB9UtgmQC+GtbF1Yjd9yPUd5g7dv11s947K88Jngwf8fBwpufTfKGzpTMA/k+0ym5IH574bzH3NYDNJQYujM8cDd4RLEDw2NWcWh3kki41NgLoUEPdBMOf183I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=X7uhEJLK; arc=none smtp.client-ip=185.70.40.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730887681; x=1731146881;
	bh=V8yMZc9Tul1bQH+c+HZBXPgZ3WGspgX0f/zhkZDPElE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=X7uhEJLKYzJHzSA4QegoCAPrW1f9UZGo6GqvYkQ6T3FY2I2maGlcTtqYcc3FwfeWJ
	 rK7FiGLqhKAUQMCU8ADy91h3fZsO19l1iGkp3pNG8xt7k/1BTKXO9koumDYu1js+OS
	 rzgr/I+y+nEoZQm8UL8irCqpeYWlIZkcoA9Xl2ylqV/RW0zg1WBSjQVVC6So2sCSLt
	 fK7PtN7hnGoCEBkZGnmBA1u0GewU8kUValFwExEZKsawFP07/q/mv/OkeDEu4Ty2UJ
	 dW8oIgiKrQHtgiMmMmDYRCBmcxS6zcb2fWpy17ymidRgF+WQPWExXxT0rb0ucIJIdK
	 fy3gkY8CGsGYg==
Date: Wed, 06 Nov 2024 10:07:57 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 0/7] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Message-ID: <20241106100741.173825-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: b1fe9a94280e119d52a160e45965c4ac9782960b
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

These patches are part of a larger effort to support the MT6735 SoC family =
in
mainline Linux. More patches (unsent or sent and pending review or revision=
) can
be found here[1].

This series adds a driver for the pin controller found on the MediaTek MT67=
35
and MT6735M SoCs. The two differ in the last 6 physical pins, which are use=
d
for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist o=
n it
to begin with). In preparation to document DT bindings for this pin control=
ler,
the existing documents for MT67xx SoCs are combined into one in order to
eliminate duplicate property definitions and standardize pin configuration =
node
names. Necessary cleanup is done along the way.

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Changes since v6:
 - Mention changing MT6797 DT in 1st patch commit message.
 - Squash MT6735 DT binding patches.
 - Add debounce time to eint_hw struct. MT6735 supports the same debounce
   times as MT6765 so reuse debounce_time_mt6765.
Changes since v5:
 - Revise and fix all register bits for all group register types (IES, SMT,
   RDSEL, TDSEL, PUPD_R0_R1, PULLEN and PULLSEL).
 - Add pull_type array.
 - Use proper getters/setters for bias and drive.
 - Add minItems for MT6795 interrupts.
Changes since v4:
 - Remove patches that were applied previously.
 - Define interrupts items for each variant (bringing back maxItems: 1 to t=
he top
   level definition then adding maxItems: 2 under the MT6795 condition caus=
es a
   dt_binding_check error for some reason)
 - Move example changes to the patch they belong to
 - Don't unnecessarily move the allOf block.
Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.
Changes since v2:
 - Add interrupt descriptions.
 - Change interrupts property item limits.
 - Move pinmux examples from node description to example dts.
 - Properly add myself as maintainer for MT6735 pinctrl driver and DT bindi=
ngs
   document.
 - Remove tabs from a few defines in pinctrl-mt6735.c.
Changes since v1:
 - Combine other documents into existing mediatek,mt6779-pinctrl.yaml
   instead of creating a new document with wild card in its name.
 - Split first patch into smaller patches focused on specific changes.
 - Remove syscon compatible from MT6779 DT to avoid a check error.
 - Fix interrupt count for MT6795.

Yassine Oudjana (7):
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node
    changes from MT6795 document
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode
    and property descriptions
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
  arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT
    bindings
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin
    controller
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add bindings for MT6735
    pin controller
  pinctrl: mediatek: Add MT6735 pinctrl driver

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  191 +-
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      |  228 -
 MAINTAINERS                                   |    9 +
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |   20 +-
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  881 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 .../pinctrl/mediatek,mt6735-pinfunc.h         | 1148 +++++
 9 files changed, 6223 insertions(+), 255 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt67=
95-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinfunc.h

--=20
2.47.0



