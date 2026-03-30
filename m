Return-Path: <linux-gpio+bounces-34391-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6F8kL7M1ymnn6QUAu9opvQ
	(envelope-from <linux-gpio+bounces-34391-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:34:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 622763573C3
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A462300B1BC
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAFE3AE1A0;
	Mon, 30 Mar 2026 08:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJLHg8Ru"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8BF3ACF11
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859689; cv=none; b=i1ihuJl9yqt5g1+NBrXLHktElb33gBs4HibvyLKgEBENV0O9VPPUYs0SWctQvSaUgNtMgtQoikZKaWEc8v4i1lP4VY7yQldhMKsrtT3hfFzlcPvaYS23Y0KXek4/YhplP9lajMDm/SKe+/0kVn7txB9vqg1LVTjU9dnVD0TUA/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859689; c=relaxed/simple;
	bh=S/riY656uNQaeNQIky9DTnq91bWvKnSdxYdiKTr3GZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gh1c5vMQw7XsuqOwommyOio8t9c8P+JUcxqd4/kuiZexosM+YyJ7lc9ImcI4A9pDPcOPPVIrL/Rq0Da4IkYrfGgOXJNCma4/AIo5MkPmSPXZVYVEp7vkcPdoeI71g+doeRZTxkaMLsa4r5LZbSzLGSUT3GX50yPu/erynrAxqew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJLHg8Ru; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so40953105e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859685; x=1775464485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ffjqD22wwfmhO+ld9/luMon3GDz24nlqdVKsWtkc/0=;
        b=pJLHg8RuVw6tBdC1BFRqcf+pLBJ06iKWnzRW+K61Cz9uvmpI5VXT2FrXFZtB0JPhHC
         P6svvq/BvO6JKr56uFBtV0+T+4IrH9KMuxxbjMqtGXZ1sjZUodGSrbp9aMjlO69up1Et
         SUKVWZf8qaFcYSWDfjGH8OQSVUQN7vDLoGfCbqK0jTbI5SNrr0zIGx7cYH0uIktY0EBa
         Ao8E+8gd2tmjtxecJ0qAQWv24dI3oiLMmVWp8RHkLgw5qy7jjk5KAQwsB2m6DVeGyacP
         Eejnz/mzMhjCIm9yeKjGQ0e5jILrj9bv+jdnCkUuBTkMTlrkM7ODJJ60GdYrXv7f0AwU
         vlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859685; x=1775464485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ffjqD22wwfmhO+ld9/luMon3GDz24nlqdVKsWtkc/0=;
        b=aROeV0CCOt+4Bi0A9VtCIdMv2KwXlRvJzp73VMeu9U4MUtduk89VTrCnW/mgRZ8PAj
         Up5JscQBJZEeQ0qMiDbO3HLAWhSOaN2OGa9DC7EndkFvQZn5yfNLKiyDJB37LOOT3rs3
         NJVhfnMT7KZ7K4EVDsSw6pQLOG8hjK030w4P8EDb55fJ3xhdILgc1Ouxq8LtBjh/ON1U
         fHEcWpHSF03VIh1Zf0tgbxoUBdTieaaXdD6o4ShY1d0IShKkV5wn7hVZvAN8UM98bPVc
         RFgO6LZY0Z3H6bUnfRTgNV/amiLQRwyu0yd8mRbgmrdBgWbp8ReAnPQkmIzBOnUMXT0t
         UPKA==
X-Forwarded-Encrypted: i=1; AJvYcCUH33mIbKKPTxoDqlsBiy7DkJxJ3DEX0+DFXGybfMnfHbVBcVQVZkSlLaT6g43M8ayBXFIn5VRYY1JR@vger.kernel.org
X-Gm-Message-State: AOJu0YyTcNcoGMz18zD9wd3Sl8Mtn3g4YcQZFPYDeYKDIDdU8E2QzPEu
	5yB6OxRFvmK9/SkMme5EnbGy0uegxxn2lhexOl7vmeg0oM9ycYn8Rxev
X-Gm-Gg: ATEYQzx0DyA8tQ9s2wMHb5Zosd2b/s1VCJcglhpiNmloEaWkvtGEDPSJ4XknovoEXZz
	DqJAhOPLLMyr1k+kBT5cr84226h46rVs0c6fAOF5SSVrhjXLnCWRVZtsAi3vPAC4QL6PTLRkKx3
	B9ioKr1nifs3buybvg2h7SCKP+KXI068c1Elw5QTBfGypHewlbaeI+4AtfGCXDCibE1I/mC7yW+
	Z1tKcpGngcajsFRHZPryVeVjtxVLn2tWF8Ix5WgoFc/zmCAtmQdBh+DQ/JiwyEPswj+cvqQ9e5K
	qxkJQRyA60NIfOVVvn9ftfZGSLkKmDOA3Ui/rBkcdxqpU3HUete2Y+FEeM3RN+gwXVEWExUolJs
	lnP8mZjG8puWDvUleNsl9nllEEWMxHLc3fCcu8yYPwH5sHCFG1veNW3Hx+EKJtEgihFk8J0V1DV
	wPwxhWo/bFkgJS1lWkXXI=
X-Received: by 2002:a05:600c:6287:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-48727ef6617mr197260045e9.26.1774859684663;
        Mon, 30 Mar 2026 01:34:44 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:34:44 -0700 (PDT)
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
	Gary Bisson <bisson.gary@gmail.com>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 0/9] Add support for mt6392 PMIC
Date: Mon, 30 Mar 2026 09:29:34 +0100
Message-ID: <20260330083429.359819-1-l.scorcia@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34391-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 622763573C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MediaTek mt6392 PMIC is usually found on devices powered by
the mt8516/mt8167 SoC and is yet another mt6323/mt6397 variant.

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

The series has been tested on Xiaomi Mi Smart Clock x04g. In order for
pinctrl to probe successfully patch [1] has to be merged too, but
each patch set is independent from the other.

Changes in v4:
- Dropped usage of the regulator compatible
- Fixed commit messages text to properly reference the target subsystem
- Added supply rails to the regulator
- Reworked the regulator schema and PMIC dtsi. Now all supplies are
  documented and the schema no longer includes voltage information
- Removed redundant ldo- / buck- prefixes
- Renamed the pinfunc header to mediatek,mt6392-pinfunc.h
- Modified the MFD driver to use a simple identifier in the of_match
  data properties

Changes in v3 [2]:
- Added pinctrl device
- Changed mt6397-rtc fallback to mt6323-rtc
- Added schema for regulators
- Fixed checkpatch issues

Changes in v2 [3]:
- Replaced explicit compatibles with fallbacks

[1] https://lore.kernel.org/linux-mediatek/20260317110249.391552-1-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260317184507.523060-1-l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/20260306120521.163654-1-l.scorcia@gmail.com/

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
 .../bindings/mfd/mediatek,mt6397.yaml         |  11 +-
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   1 +
 .../regulator/mediatek,mt6392-regulator.yaml  |  74 +++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  73 +++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 118 +++-
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 +++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 509 ++++++++++++++++++
 .../pinctrl/mediatek,mt6392-pinfunc.h         |  39 ++
 .../regulator/mediatek,mt6392-regulator.h     |  24 +
 include/linux/mfd/mt6392/core.h               |  42 ++
 include/linux/mfd/mt6392/registers.h          | 487 +++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  42 ++
 19 files changed, 1527 insertions(+), 31 deletions(-)
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


