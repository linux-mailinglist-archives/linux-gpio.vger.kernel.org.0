Return-Path: <linux-gpio+bounces-38376-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8xN4KF9rLGqrQgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38376-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 22:26:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D21267C484
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 22:26:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=K8y6RWvg;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38376-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38376-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16CDC3046421
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 20:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4B63A782A;
	Fri, 12 Jun 2026 20:26:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37EE39F191
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 20:26:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295965; cv=none; b=DQQuvb53vP+8KDulDrFHAUcUiV3lKuyqMN61+FEcSO8V7KJniTXN3Y6GoMPvwiiwivvxjGZPeINZrHsvtJzpxuZRDY4xVTDxMj0i9LiZ0NbgVKfVOcH4+bFkbAuhABawLJbzSNrak9Beyo/7uOtx2ZmX+lR7LTiFqsQ35Wy+OPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295965; c=relaxed/simple;
	bh=Cq8cPoBkI+FB/GEbDx3WtxRVRdZkRoFA54OCpSDtqJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pylD5BfU4WgRs9JpaQG2E0axLJ6fEEVUb25qp9+TeM7/4op7FlneUChDOkwn0mr7JxYDfsieB00tprhKbHOHCSHCEH92fZFBK2+AfmRP0qHtWTXWHpXXAoegMw0mvKNnaVaETy49lsOhXDOZ5hbIQ2iGzRi/mPOqvVGrrbk74/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8y6RWvg; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b12270b3so8614725e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 13:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781295962; x=1781900762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8rQCLAIxALSz/Z8tD2vL5V4eDD0YacOILyc6cFmNdB8=;
        b=K8y6RWvg4tLzpXJq9RPzKhkwQeFOMPJRyo/S4I5hrUVeP7lIYA5GAwBMDiA3P9Uz9h
         UlrIzRUGhST1MO055UjF7IOp4NYiJUTGjHHNvzGJWTzbDXKR7PMgvzxjgvLuxhiqIavz
         aBFwyR8Mbhxl6FLkDyK7B9snr/G0mKvokym4bhDLm/Jv73Dnudp3b3A0xT9H1M1E9YxW
         XVW8tZZA0BVKsxpESC2T1D8OJwMyFPy7HLGTD2eRXW77nZ+s6cIjqNVdhzLnnygq8Vhi
         g+Sgsv8hMXIsfAc5GEU4RPlcHjipzeuhpDusCG1QqRUbuGWpVt7jCJyZNFR6daOJpoTE
         wCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781295962; x=1781900762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rQCLAIxALSz/Z8tD2vL5V4eDD0YacOILyc6cFmNdB8=;
        b=qvp+Jito5QlbTz1mbIWdtNmlOlnzHMXWY+kTUDEyzwPGkNkh7taUdxjKR94jm/qXX4
         x8BbxSOyr7E4l+wGw6nNlcpXmfgCxxXDeohdo07xoWRmItnrBDk3eZmWKy1JBlJOgIMz
         oLhFERx/sCWsXBy6m1hlMeyJaSfJjRmaFsyXa3HDqlffB6urDQciNcHz8zVRyX/G+b46
         15VJMuo6kOAGGcUM92Ecu3dDO8Wy+6qt3qcOFGlxYAinU9uPG81rN0TX5WwEFek6219T
         z/7YSL/BTu1MX05VhpssakOkepMtMi8yJu5DqSn6X/Pp39a89EnOyam9qu30C9b7m6JK
         Kdfg==
X-Forwarded-Encrypted: i=1; AFNElJ/QBUrCJcoQLm2rVMTSXjdC9G9VODxdqS3qaUHNvYiD7kXeo6BZk3Fl7A3ZeRN3WnbOmLi9TuJGROXC@vger.kernel.org
X-Gm-Message-State: AOJu0YwiZEwXFWMq8WdU+FD+aadNfS8BWNzEoX4HuU+7CuiRjIvRoJ2e
	BpdkmUpbSkhVmMVDjIDkfh1zxShQl7vcmXdE2KzHQCr3yqwFVHmgWhEc
X-Gm-Gg: Acq92OGETSuJcm9/DhvfM3+7GIix8ziIOwbTsnP1MTHlZL+8mgvN3CksJM8dWP5nzUT
	lKJlgkq7byPjCFLHuM19Vma/lK4flOWqxjZq9z5RXE3as4Dc9qjbpZ8VDGoQWajEjbafpwrFQfk
	UdVy5Iu5V2orrXTtYu/9p5YzE6+eY/2O3CfKOfM9sfgwl1IdX2fpomNkETIeHrteO29Wjf2qKAe
	Wl+3j9GaAyqTcS5qZcPVe1ANzx8OV05BSDpn/v/9T6E9EC+WaUH5AqcAjc6F4coLdelbFjEEcXw
	7DnFopVgVsFUSrxIGvQWw6ywULdpVYdKyGTVzLollzuhvqdwtM9GNOC8uwpCow15fU0w4GR6/Pd
	BjWbWsIqSTUeWZ4SYz9b7+gZWi/K+VxT21gR1rNuT7m+G3pJ7Kw3Ea5xCZtK+Ofw9vYBbbDM5HZ
	upAtpSv0a0CrR3Iq15
X-Received: by 2002:a05:600c:3585:b0:490:b642:ce29 with SMTP id 5b1f17b1804b1-490ec4d4f71mr59232905e9.8.1781295962029;
        Fri, 12 Jun 2026 13:26:02 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:26:01 -0700 (PDT)
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
Subject: [PATCH v6 0/7] Add support for MT6392 PMIC
Date: Fri, 12 Jun 2026 22:04:05 +0200
Message-ID: <20260612200717.361018-1-l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38376-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linusw@kernel.org,m:julien.massot@collabora.com,m:louisalexis.eyraud@collabora.com,m:val@packett.cool,m:parent.f@gmail.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:lscorcia@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:parentf@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 0D21267C484

The MediaTek MT6392 PMIC is usually found on devices powered by
the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.

This series is mostly based around patches submitted a couple
years ago by Fabien Parent and not merged and from Val Packett's
submission from Jan 2025 that included extra cleanups, fixes, and a
new dtsi file similar to ones that exist for other PMICs. Some
comments weren't addressed and the series was ultimately not merged.

These patches only enable three functions: keys, pinctrl and RTC.
Regulators and speaker amp will follow later as I still need to further
improve those two, but getting the main PMIC in will make the series
easier to review.

I added a handful of device tree improvements to fix some dtbs_check
errors, added support for the pinctrl device and addressed the comments
from last year's reviews.

Please note that patch 0005 depends on patch 0004 as they both need the
registers.h file, but they belong to different driver areas. I'm not sure
if I'm supposed to squash them even if they belong to different driver
areas of if it's fine like this. Any advice is welcome.

The series has been tested on Xiaomi Mi Smart Clock X04G and on the
Lenovo Smart Clock 2.

Changes in v6:
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

Fabien Parent (3):
  dt-bindings: mfd: mt6397: Add MT6392 PMIC
  dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
  mfd: mt6397: Add support for MT6392 PMIC

Luca Leonardo Scorcia (2):
  mfd: mt6397: Use MFD_CELL_* to describe sub-devices
  pinctrl: mediatek: mt6397: Add MediaTek MT6392

Val Packett (2):
  input: keyboard: mtk-pmic-keys: Add MT6392 support
  arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |   8 +
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  41 ++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 294 +++++------
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 +++
 include/linux/mfd/mt6392/core.h               |  43 ++
 include/linux/mfd/mt6392/registers.h          | 488 ++++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 11 files changed, 840 insertions(+), 162 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h

-- 
2.43.0


