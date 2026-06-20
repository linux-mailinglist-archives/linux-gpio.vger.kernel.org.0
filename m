Return-Path: <linux-gpio+bounces-38740-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SXM2K4PxNmp1GwcAu9opvQ
	(envelope-from <linux-gpio+bounces-38740-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 22:01:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1DF6A99AD
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 22:01:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=I5Ra+fP2;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38740-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38740-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C78CF301C169
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 20:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC23282F0A;
	Sat, 20 Jun 2026 20:00:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E231B2F0C79
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 20:00:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781985648; cv=none; b=SGZft3JE5yeJTKxZL3P75IF7hMXMHh2ugVgm2uz8uY5lzjCazuhLTvQzcTm8lOw+YlHR/iKGd4dcYtvxlqr5KG6e8CeudXUDZj8fi8oM36PvDwsHWOMUHcVtprSaSIuTeE5lC68GEXWBHX1+hQ9vMllRtxkTkfUt9QW7rpieAS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781985648; c=relaxed/simple;
	bh=D5wiJHXN4VMCPb9AryAfo92/6R00Yh2A1Qg2GNP/pVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vc/olZCKzsZ0LZdAC3PLiQsx6QfzQ7u3gQkkVmknwGas4GmQBSk+5A/B0Z4ZvZug6sg9EJ2XyT7YsOE/f/FVgRI47TsAIEgjS+aWtjZBh9i1g1whyHBNkzxAkK8J2cojW+xAQdRpLe+3PhO4V4jtBJkLQz5HSs+dZVNi6KuflSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5Ra+fP2; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4601949975dso439411f8f.0
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 13:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985644; x=1782590444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YuckR/NZ8exY6f/XTl1lDY68jOPxEhNdZ4x63rZXPCE=;
        b=I5Ra+fP2qJNz637wuQ681uKVMZRPUtRLvuqU7DwJlIykbWkt9E3/Rl3CRx8/wDgHgH
         aXgOn5iLxOqlgIlxU6srpYnwtcHNYZuk9LfR5SAaGe4vkcMobVMjaQXWoKVSavmIIOe3
         TmR57IeErB2gxaPLeNo7sbwJYvHDUMfEQz9NhRDAlaCLvedN0HNcRl5YYNi1pG01dCGK
         T9Hvvu25nRSnWTXIMD7Q9v2KgNe/aWZm7/pTigo4GX9b/0wKjApHnt23kF04cwDHzfCx
         PpudN8OsPa5pHQBhP6gNqf9zGxeVeHaImBA/dRq1/7/YEirbHkp17wRrcAtMJ5fl6q/l
         uKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985644; x=1782590444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuckR/NZ8exY6f/XTl1lDY68jOPxEhNdZ4x63rZXPCE=;
        b=FHvrY8qNkciBM93igp2cpWQwFUeRsUruQ7RnHoOPEJ43VjqhTtV/fUJuBctcx1RO8j
         siwK/x2idk2Dss0gCFWEa7h6HNje85aQs0iq12cizDcHCj+yga+wwqCahx4+vQIcV2QX
         KWTu9lqM0/x9s4RKZxzC13WIBPIVsf4vtqtB5ybhu0UxcBhVQfzyyBXvrAobuKKVUUU9
         grEtV37phH+BEJr0qC2rNfhfXR7uJU3L0Ncq0t49MaT5HC/tvIQjC2GPP+RD4HRxLGRz
         pnHxqmdaMpRqRIG56cL9dJwTsY9MOlvLfsWuz4WSp9ETTMQcABKdLFctD9g1lEm34ZkD
         kHXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhFqQDWTmn9pmgm4cFyLTR+3w9e7SSysq5fP/WP9FKsNVViEevyLoM0IPQv7IEGcKZIIFWDiV20lNv@vger.kernel.org
X-Gm-Message-State: AOJu0YwKMz6NYyH0d26TvMF/QxTZ4g9RN3eNMCxCTutappiNh6KPSAlJ
	gcjhWY6DJ1n8dJz6TghHCPfyXr9RjW1JZnSiZP2XpEkFO4GpwEHZiFq4
X-Gm-Gg: AfdE7cnEpajIZMjGJjwJEHjA4D32e03PYmZ5SI/fpvzyq0GxlcW9F7zip0Py5fXaQHS
	2GwCI+19hZCxAHk9e4UX7e2foKAbccekotR5uZl6aLsSkXEaXtO0BGxGTQ9xSN+K8xlbE0xPp10
	wxCu61BSV3lq6ipHz1whitSMxLauves2yquE9nWn2Uy6iaNe3Nm+JaJoAqVb8IkLjX4b7+2daAJ
	/ki13AbUOfLuHS5rnohniBtYnC6V6vfvEGThoVyk4WK+qHlmTOYsEy83eVBxjMA4AkHhZxK7+bB
	7wG+0giK24AO1C0jCyWwGKehgwoOAfTPkraX/ZqCFUvIqo61MTvF9Q9ySFoIUHXThQVilFlV++6
	3G/E1EkdxVjAPEbCExwId3K503fLr2JGeBZconfkcASoFSFyUNOmeN9dgWZeLKo589Bmfv5ULNG
	iiFhX01Q==
X-Received: by 2002:a05:6000:4902:b0:463:a7e3:9f71 with SMTP id ffacd0b85a97d-4656dd09554mr11611148f8f.15.1781985644072;
        Sat, 20 Jun 2026 13:00:44 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:00:43 -0700 (PDT)
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 0/9] Add support for MT6392 PMIC
Date: Sat, 20 Jun 2026 21:56:46 +0200
Message-ID: <20260620200032.334192-1-l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38740-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:louisalexis.eyraud@collabora.com,m:val@packett.cool,m:julien.massot@collabora.com,m:parent.f@gmail.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:lscorcia@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:parentf@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A1DF6A99AD

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

Patch 0009 also depends on patch 0003 because of mt6392-regulator.h.

The series has been tested on Xiaomi Mi Smart Clock X04G and on the
Lenovo Smart Clock 2 CD-24502F.

Changes in v8:
From reviewers:
- Added example code to the MFD device binding, removed it from the
  regulators docs.
- Added minItems/maxItems constraints on the regulator mode definitions,
  improved the mode constants.
- Fixed formatting issues in the regulator binding.
- Import the mt6392.dtsi file in pumpkin-common.dtsi, as it was originally
  meant in [8].

From sashiko:
- Added more explicit constraints on the regulator modes definitions.
- Use the appropriate modeget register for LDO regulators, Buck registers
  don't have the corresponding register according to the data sheet.
- Added the missing of_map_mode function.
- Removed some debugging code that had no use and masked error codes.

Changes in v7 [7]:
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
[7] https://lore.kernel.org/linux-mediatek/20260615071836.362883-1-l.scorcia@gmail.com/
[8] https://lore.kernel.org/linux-mediatek/20190323211612.860-25-fparent@baylibre.com/

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
 .../bindings/mfd/mediatek,mt6397.yaml         |  74 ++
 .../regulator/mediatek,mt6392-regulator.yaml  | 118 +++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 148 ++++
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   2 +
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 295 ++++---
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 ++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 764 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  23 +
 include/linux/mfd/mt6392/core.h               |  43 +
 include/linux/mfd/mt6392/registers.h          | 488 +++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  42 +
 18 files changed, 1973 insertions(+), 162 deletions(-)
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


