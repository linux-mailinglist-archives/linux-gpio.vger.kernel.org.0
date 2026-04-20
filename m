Return-Path: <linux-gpio+bounces-35276-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNTGAi6d5mmeywEAu9opvQ
	(envelope-from <linux-gpio+bounces-35276-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 23:39:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C38E434487
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 23:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08499301F1B3
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 21:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C87382F0A;
	Mon, 20 Apr 2026 21:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ET5GGz6P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641F337B033
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 21:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776720970; cv=none; b=Hp/VkVcjutGYHTiMx88HpBKjYpIHW1u2zRCOC/LSdmUVBuOEcnpjkxYCXMHyYcf6xE1PNBeKrDurNf5GVVAd7EQoVL7irXzQxc++L9yg2dwMvIuhHEdTVdK25bgVjP/WfH5j1eITQm/EWHvGD7fRK2v09/ivGpStVOOdoPkbGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776720970; c=relaxed/simple;
	bh=UgW3k1vXeuAXYJVVUE3uw4fYebqcjx6HXfLWRx4YEts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m70xeY3ili8Vyl4YKizfsTlqIywF9ALOpFhnmoXxZ2LhuKX3Ef/rTszi8uZn+QxL1mt3AjNzWUdK8WLy9OG8BHQzJq2wPpDGbg9nwiab11Y0UekcN6EZzROWfRbPWW3N7FrAje5OMDS5nnsZIvl1QuC0DCayYSwgZVPVGXh99k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ET5GGz6P; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso11822955e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 14:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776720967; x=1777325767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yKbbLjMj5a+s95ZY4aMoYwg6sSM5rUeqb55KfE7XVeI=;
        b=ET5GGz6P3Sud7C9voRyK0mRbRtxGpYw+gBrgsLLVB+Cy6JlkzDDMT8BK3XvP+yYEek
         P4OvBv9lVEj0oVUt8YiG7X/XXmyZO3etqGaGAwvYuE7bmD4TMtWrJ49hJSnYDLU2S+3n
         TiaRPMAbeL75wRAlIgU4iDTq18x2ns/JCqV+YpWu7nVRuG7++m31eQgtQHqQsfOAQzpL
         m5Bucd48Wruf6zFk0IA/F5PhHG5jGiz2ickyidvabpUOHG2CHfIMr5FVH2NTYatXtIsG
         MLCL7xM5x+21r3QsGGJyEQgNz6YKqwOevNUdyAUJlRhICL+/iFjqqPbNSs3gBmeWewzV
         Raug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720967; x=1777325767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKbbLjMj5a+s95ZY4aMoYwg6sSM5rUeqb55KfE7XVeI=;
        b=jmSTJzqwsB3u0NWQVx44Cov3D1tvDqLe1waGXK1I5vPauxkDqa284DdFkwibawt/+N
         CTLGBKODAd4aZnUrTcrrwMdHDJLux1OixldDDdjeqyO5dr6T4F7KUaYHA3wUFOL24thR
         sVER3Yqx2afnLFQ1FCODs4rlYV8vD+xrZL/lUuGvqPvbf2H1Cf6nILOGojACvXhgA1pN
         GT7Vc2pIiWJ4pKUlooBZszvIyjxL6M/z2fkoQu7VTi8PZmOSj97+T+TtcuTp8IERoGge
         1978F0RabTSXLUDfqDCPXeWSQ+XAOXNpvKjXGMT/NWRexvJb16kip36kA0Yrux8emI5c
         jHLA==
X-Forwarded-Encrypted: i=1; AFNElJ94KliWzKm3n+HkLzyQ8DG65Y6gLq3YKPkn8rpAV96Cx1Z4ZZPA+i639fKKQSZ4CI1Ny70CNgqnqK3C@vger.kernel.org
X-Gm-Message-State: AOJu0YwOhnl9ujwHCuzGdrm91daHJdovUu+BEmYpmNipkSk5hiqHBqUV
	/aSB5D5agTIr9DS/X2QWFltviZLOc+VYjcV4UsiPf4JHlpO21KaOoRaw
X-Gm-Gg: AeBDiev92VF5B9gtI9+01Zc0Ag42NLuPKqgF3Kv492HfLqLa2sMDv+eIL/6oz3lHj/X
	nuvH0XUSRGX/JAO0EZCHyqgvrsTxMEGdHonV6gshzT6lvqAzUMPQSHj8u+AtrjP6Ui80rfjc1w5
	TQ2+LNL4o++2beFjPxcgVe1HB1eY6XZC1pZYe95P8WUEySSaX5hJJvIHpM7Zi6X5yvu9AMk06JS
	dIMsINL3uV4ty7F31l5OUzQz6I6tka/4qOZnToujTzE10yS0WKB0VlfuHS2eZAIq1y6QfTnSUSC
	X4pwezG68+8AHQp0Gi4L+xfV7MQIfpVNVv6lvfotDmdsSjmk0iO5rVrLsJWBVJA0v4e6CIjh7q+
	AQsh6c+O8/PTrTmdBGQO61q/9YKP9GRnPNjdT5csIwlLoGYgLQoGDdsWo/WiXEInrskxAgxotPl
	y+O/Reyreo7NjM5tBJmFuDZAkGJCMQ8w==
X-Received: by 2002:a05:600c:34c3:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-488fb792dd0mr216654415e9.23.1776720966527;
        Mon, 20 Apr 2026 14:36:06 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:36:06 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Val Packett <val@packett.cool>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 0/9] Add support for MT6392 PMIC
Date: Mon, 20 Apr 2026 22:29:59 +0100
Message-ID: <20260420213529.1645560-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35276-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[154.61.61.58:received,100.90.174.1:received,209.85.128.44:received];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7C38E434487
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MediaTek MT6392 PMIC is usually found on devices powered by
the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.

This series is mostly based around patches submitted a couple
years ago by Fabien Parent and not merged and from Val Packett's
submission from Jan 2025 that included extra cleanups, fixes, and a
new dtsi file similar to ones that exist for other PMICs. Some
comments weren't addressed and the series was ultimately not merged.

This series only enables four functions: regulators, keys, pinctrl
and RTC.

I added a handful of device tree improvements to fix some dtbs_check
errors, added support for the pinctrl device and addressed the comments
from last year's reviews.

The series has been tested on Xiaomi Mi Smart Clock X04G.

Changes in v5:
- Double checked regulator driver with data sheet and Android sources.
  The data sheet I have misses a lot of register descriptions, but
  Android sources have been helpful to fill the gaps
- Reintroduced the required attribute for the regulator compatible
  in the bindings
- Fixed the missing reference to the MT6392 schema
- Fixed casts/unused vars reported by kernel test robot
- Removed Reviewed-by tags from the regulator patches as they have been
  modified in this version

Changes in v4 [4]:
- Dropped usage of the regulator compatible
- Fixed commit messages text to properly reference the target subsystem
- Added supply rails to the regulator
- Reworked the regulator schema and PMIC dtsi. Now all supplies are
  documented and the schema no longer includes voltage information
- Removed redundant ldo- / buck- prefixes
- Renamed the pinfunc header to mediatek,mt6392-pinfunc.h
- Modified the MFD driver to use a simple identifier in the of_match
  data properties

Changes in v3 [3]:
- Added pinctrl device
- Changed mt6397-rtc fallback to mt6323-rtc
- Added schema for regulators
- Fixed checkpatch issues

Changes in v2 [2]:
- Replaced explicit compatibles with fallbacks

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/cover.1771865014.git.l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260306120521.163654-1-l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/20260317184507.523060-1-l.scorcia@gmail.com/
[4] https://lore.kernel.org/linux-mediatek/20260330083429.359819-1-l.scorcia@gmail.com/

Fabien Parent (4):
  dt-bindings: mfd: mt6397: Add MT6392 PMIC
  dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
  mfd: mt6397: Add support for MT6392 PMIC
  regulator: Add MediaTek MT6392 regulator

Luca Leonardo Scorcia (3):
  regulator: dt-bindings: Add MediaTek MT6392 PMIC
  dt-bindings: pinctrl: mediatek,mt65xx: Add MT6392 pinctrl
  pinctrl: mediatek: mt6397: Add MediaTek MT6392

Val Packett (2):
  input: keyboard: mtk-pmic-keys: Add MT6392 support
  arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |  27 +-
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   1 +
 .../regulator/mediatek,mt6392-regulator.yaml  |  76 ++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  73 ++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 118 ++-
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 ++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 740 ++++++++++++++++++
 .../pinctrl/mediatek,mt6392-pinfunc.h         |  39 +
 .../regulator/mediatek,mt6392-regulator.h     |  24 +
 include/linux/mfd/mt6392/core.h               |  42 +
 include/linux/mfd/mt6392/registers.h          | 487 ++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  42 +
 19 files changed, 1776 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0


