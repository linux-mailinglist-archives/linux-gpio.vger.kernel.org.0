Return-Path: <linux-gpio+bounces-38449-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q0s2Ml+nL2qEEAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38449-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:18:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EEE6841C2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:18:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NM+29sei;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38449-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38449-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FC3F300D174
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F63A3B14B9;
	Mon, 15 Jun 2026 07:18:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523B82580F3
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:18:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507930; cv=none; b=nxFm7Ge+JLuMiYTa2/MGPEuhzxNMslBRCmuM2aXwBZpGf1MtfmrL88h1ksZVY7WdpKS9N00mPpXIyBtCIvu5zQH3npjGN0iD8GVjsxqkmC2gf8ss7+H9aGuNu6XkIkY3PFyfQYzXc9qZaD4bgD0xMgGT1u2Ubq+fEJ4703HOyY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507930; c=relaxed/simple;
	bh=Tp6cmU/RGc1ogH1+TBTz7hZfRd5EAUlMRrlBwPLgtGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P39PXWM413oCpY2ThKcZfeF/EgFsyRpOr0pfgumbAWUH8CLbRfrqfvMo5zLk86bJD4KXyuyETxDWU18ZA+r6Q7E5Hkbm5trQCZb8JbyKAdIrGsyDsLjk0WU7xovL1QnJQMIigvj46gb9nTyYTX4cmFHHzbdEfXsvI1BDnwSNIFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM+29sei; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so22688445e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 00:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507928; x=1782112728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kB/u4VLuYTRIxSTjaGgA4kG1SxYpk8i9RP3w3UDvgAY=;
        b=NM+29seiNbwymV1yYBHyPFSlzKBvEyxBolZKRo60z2aBQ6gvEzFT9YiQA2W1IDiLqo
         DwQnhGqe6NJMVGX5nGpF8967fOniDTP9BVIaTbzRQdq1i5MKFbXgJa7rL3EzfWuWJCYH
         RWbtpWB5I1YVIJGUgenFXVePiUF0l5iXvGslw0Oh67YrHquVIDu84SE81hXaUTb+6p8V
         WV7F1hfbSIevMabejyUQ9ot2EnuTWfKThPtOTMHJ6DWukGP6XV6esxzbpo/elb/HrDk+
         ztWl5LeMWaphmjKQ+gUGT5Y53LXMTxB8pOhlViESdUKlca+8JT7hHXCJYwHDOJbjuNNJ
         QKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507928; x=1782112728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kB/u4VLuYTRIxSTjaGgA4kG1SxYpk8i9RP3w3UDvgAY=;
        b=OUxwAL5r1srf3nsNNSxTcxKUUP++pgT+HIhs/QOtUoDAMF1A347K0PZKDkIPMZrRIA
         0/VIhTgAj9dEbhaZbZH79WU2I+H31lxrrdGyeFGJoNCW8goCOanPlBpqpmcvLcakseYT
         ejm3CVZsRMSWM496QXiAM07Dan+bDcQcykXNEInNbrk3iKPoZmi4rBN/w5vNetmwALJe
         yfzvvGuPWQSfd3+kTcppOkzBx4jGu2lpl71NW2C7QirWtIGNQCTp0+0liNnImJwKhnZc
         TJcS+YvfEYm4fChMtS9iNQbIdFRQ+TLS1viHTKJPNXjczNVukLR7VLkQnyiPB5ZqXec9
         WbxQ==
X-Forwarded-Encrypted: i=1; AFNElJ837gv3lp+tWS3c/hFUC5VdJtigjj6+YLNDZGAd9yTb5cUPPueYk49Yvxj6fDtz1B4NxVdFRyEBv8dp@vger.kernel.org
X-Gm-Message-State: AOJu0YwGVWCK64HY8b+5DLnbIPJ7vhMl4D38/DNok3k40Li9Orx9i131
	GztNgXTKI0BwaIPhsTLysu/cclPrAFV30nszoZ0F1xeTUtMTD1LCbKs6
X-Gm-Gg: Acq92OFQdquZSB1Y+iGqpank//Vv62hc36dNLIY3fHnJ+IEuRn/CHSzrO6CaukyIwac
	3b5Zo+uMjT43JvESBlScKSL5ahCgOv1GHbUMoRNwlNQWYItAj3GS9aitwYfgTWE38AD5nn3TZEu
	bPZrvmaJWt78awVeMmmLq0R5mju2qtsAsW5tReAlKO7GFb811JtzCSjEJLTTgJUXuzbC2WilmRp
	Zf+MNF0ex8Fskszh0zahTD5mLSyy5BqcVqVMsRcIG4CvluAz3gc5ilofJoWxc3hkjigVCtFYgTf
	JbKokYru0Lh6FWOluurTzXDLuH9qZNEFR0VtbIUZ90QVb8P+wrSr/WNtFDHrGsAAQFN5B35+XhD
	LrKzEFU4EF6isTQZKE5E9DU1tBcOzA/gUCBqTNnh0AZmJNbp45Zgh0cGMzkZb7XgrSvcjvQJ2zU
	VRRVvPZoVb0Bb4849F
X-Received: by 2002:a05:600c:820c:b0:490:e913:6564 with SMTP id 5b1f17b1804b1-490ec4cc6d8mr166377465e9.3.1781507927328;
        Mon, 15 Jun 2026 00:18:47 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:18:46 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 0/9] Add support for MT6392 PMIC
Date: Mon, 15 Jun 2026 09:16:06 +0200
Message-ID: <20260615071836.362883-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38449-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:julien.massot@collabora.com,m:louisalexis.eyraud@collabora.com,m:val@packett.cool,m:parent.f@gmail.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:lscorcia@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:parentf@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38EEE6841C2

The MediaTek MT6392 PMIC is usually found on devices powered by
the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.

This series is mostly based around patches submitted a couple
years ago by Fabien Parent and not merged and from Val Packett's
submission from Jan 2025 that included extra cleanups, fixes, and a
new dtsi file similar to ones that exist for other PMICs. Some
comments weren't addressed and the series was ultimately not merged.

These patches enable four functions: keys, regulator, pinctrl and RTC.
Mono speaker amp will follow later as I need to work further on the
audio codec.

I added a handful of device tree improvements to fix some dtbs_check
errors, added support for the pinctrl device and addressed the comments
from last year's reviews.

Please note that patch 0006 and 0008 depend on patch 0005 as they need the
registers.h file, but belong to different driver areas. I'm not sure if
I'm supposed to squash them even if they belong to different driver
areas of if it's fine like this. Any advice is welcome.

The series has been tested on Xiaomi Mi Smart Clock X04G and on the
Lenovo Smart Clock 2 CD-24502F.

Changes in v7:
- Removed patch 0008 dependency on patch 0003.
- Reintroduced the regulator driver. In earlier revisions of this series,
  it was proposed to remove the dedicated compatible for the regulator
  device [3]. The driver does not use actually it, but it is not possible
  at this time to remove it from the bindings since it's a required
  property.

  Making the regulator-required property conditional was NACKed in [5],
  with the suggestion to create a separate binding altogether for devices
  that do not require the compatible property. I tried implementing this,
  but since the parent device needs to be declared as compatible with
  mt6323, it leads to a warning in dt_binding_check since mt6323 would
  be declared as a compatible in both mt6392 and mt6397.

  In the end the only regulator driver from the mt6397 documentation that
  still declares an of_match is mt6397-regulator and it does not seem
  to be necessary, so it should be possible to remove it and make the
  regulator compatible optional for all regulators, but that change would
  probably deserve its own separate patch series.

Changes in v6 [6]:
- Dropped the regulators driver for the moment
- Explained the FCHR key name origin in the commit message
- Introduced the MFD_CELL_* macro in the sub-devices definitions.
  A separate, independent commit introduced MFD_CELL_* to all the
  subdevices in the mt6397-core.c file for consistency
- Replaced of_device_get_match_data with device_get_match_data
- Removed the mfd_match_data enum in favor of the preexisting
  chip_id enum
- Adjusted the error message if the device is unsupported

Changes in v5 [5]:
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
[5] https://lore.kernel.org/linux-mediatek/20260420213529.1645560-1-l.scorcia@gmail.com/
[6] https://lore.kernel.org/linux-mediatek/20260612200717.361018-1-l.scorcia@gmail.com/

Fabien Parent (3):
  dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
  mfd: mt6397: Add support for MT6392 PMIC
  regulator: Add MediaTek MT6392 regulator

Luca Leonardo Scorcia (4):
  dt-bindings: mfd: mt6397: Add MT6392 PMIC
  regulator: dt-bindings: Add MediaTek MT6392 PMIC
  mfd: mt6397: Use MFD_CELL_* to describe sub-devices
  pinctrl: mediatek: mt6397: Add MediaTek MT6392

Val Packett (2):
  input: keyboard: mtk-pmic-keys: Add MT6392 support
  arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |   9 +
 .../regulator/mediatek,mt6392-regulator.yaml  | 234 ++++++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  75 ++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 295 ++++---
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 ++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 756 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  24 +
 include/linux/mfd/mt6392/core.h               |  43 +
 include/linux/mfd/mt6392/registers.h          | 488 +++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  42 +
 17 files changed, 1942 insertions(+), 162 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0


