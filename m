Return-Path: <linux-gpio+bounces-33665-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBSSAnqhuWmiLQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33665-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:46:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A41B42B119F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B1BC30B0C1D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 18:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898D537D121;
	Tue, 17 Mar 2026 18:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1yasjep"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E59176FB1
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 18:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773773131; cv=none; b=rWnmG9jtfs0zs30rFFE+GgxkObzMRWlN+PSBTyzcZ1Qm0VPCOJzEPgZNaqKxLMjG2w5Clz7rzbdgjsu1XXSm1xbaMPbk0nYq6ScIX/Kqtsx6wiPREsxWaOrqnCKZRH15Lsk1bbgjgOu6k/TB268g4q1kK42hkjqUNiGnT8fwOq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773773131; c=relaxed/simple;
	bh=23lDuwiMBcQoU8N9rqzbooiORZF0W9JIIdfd/pF8Z3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dTur7ncKODQtuaW4gaPrrYbDp0MWmRupndY03/muu8ZNIAQazzQLbYJ56eiyhwOhERveL1gkHyso0dhGtldGVA6DfArjvXYCuNkKMvYFHHVrxxhv8nkE5h1ou9W+bXctcpwLYvH+4LQAZauBmVVh5eA96TVNGtTGRrZaC9aFJ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1yasjep; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48539cbb7b1so36610915e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 11:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773128; x=1774377928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L3B+l1nCm3FNhk4kBJBwRpPq14NGITcxDK6Zz7w/Wh0=;
        b=f1yasjep3jkdPbWLcpNonfqPp60E0QH1oZMh43Olt1XVx5ODaGOkjmS4suHC9/6bbF
         eg4gMObHdgn4wLWAXZBgmaPefWlEwVkdWgn420NF9MqiOi8pR1qek1IHwr4Ltjg11ufd
         njpisY3sf/qIKm1wqDo9Pez9bseAQcg3FHXfMSaClxszUkypJydDtdJlduKqtlFKbvOS
         Oa280ublF9moJEzJWkMO5QnBYpXn9FgEc1K7VkZ2ri1cEjJiuehmbluKUn9mADmGmf43
         zEjtDiSTe/+qWU247ngEKzNG7qgcjAdZkc9bSANM8l541Pw+x7kCgxkoX42D9ocwWu1f
         dpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773128; x=1774377928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3B+l1nCm3FNhk4kBJBwRpPq14NGITcxDK6Zz7w/Wh0=;
        b=OAj/8LJ0ietIsW4xmeh6HzGD7zSCULtABMbSoscevW20pgeXL8TL020soOqBPmWnPa
         S5MhA3givVoF4I0kOB+KJbnRNI7dGriTLw8vHNNpUHP3ItvFyZrW2VZXcG2MlHyZusaH
         Ecvsvxg9fJYLYabOacVq0VtY7Y5phTwIX2k7TxVVFhfDaekhNH9PDjBQ8V1YzznesJ9A
         urzVPUD3XymG6oYFaxkGuvIaH2gUm9vqUiVCj5v32q3KyqLl2IjC1ZAxBX0QiE9crGkc
         GlIEM2uyBedIy/FNNz4UVHPZP/fkMdisjoGNlCAlBRLCCTKGWogM4TEGCtwtdqIMH5fx
         kP+g==
X-Forwarded-Encrypted: i=1; AJvYcCWRfml5FLCZpByECCstJwxl3fw0dMFehXnphsDn/hjJrlTz5zFP0mPYDMa5bFTG5PonA5uEDOUWFGGT@vger.kernel.org
X-Gm-Message-State: AOJu0YxkHAYslQaBIln3N4TK2b4CYYHyl3zmFCPkjgbAxVK0Y8tEPYjn
	teo+RYQnBEQRBjftHjV8+hH6kby9yLH3V8t8p5ltldgZMLK+5uk95IjI
X-Gm-Gg: ATEYQzwapo2p6dHOaWEhHw5En1JL0e1FcDzNUtMJ+D2Wr0/VQhYhEAXTlZqkxBIudcg
	sGLltF+QdBc0Dp5HkGkuhPaYlw8rbwGmca1xfOCpVz/QfolTQXxwmhbQqnjEFtRUywp8Dg+sWQQ
	4Ol5szVhok35ewBAmM/OqF9Ksyck7mTUckki5TBsan5q3BevBsphLkVLFg06NCt6v19asGTze82
	Yqou3waowT/twlHBLdt9ELcadrf1s214dNxW/7BuNgN/YpxbaxYuYHutOFR4Fff/kGPD1rrI4lJ
	ceeEt/Nu3lMH3wJhWTRzBMTo+LQ1bC/sxf7s4PwptYti2tTMXtOnFkkzv5n2Y771k0wd5EoI62D
	rXQYwJBmPbKRqYgvdhGWSfp5RfH+vK+v7dIAVo/1swgH+7Vad5vW8kjy3Zri/hOxllqzxviZfBv
	nRk6I4lQVQLtpgnOOXDaE=
X-Received: by 2002:a05:600c:198c:b0:483:7980:4687 with SMTP id 5b1f17b1804b1-486f457232dmr11065415e9.17.1773773127876;
        Tue, 17 Mar 2026 11:45:27 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:45:27 -0700 (PDT)
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 0/9] Add support for mt6392 PMIC
Date: Tue, 17 Mar 2026 18:43:03 +0000
Message-ID: <20260317184507.523060-1-l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33665-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:url]
X-Rspamd-Queue-Id: A41B42B119F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MediaTek mt6392 PMIC is usually found on devices powered by
the mt8516/mt8167 SoC, and is yet another mt6323/mt6397 variant.

This series is mostly based around patches submitted a couple
years ago by Fabien Parent and not merged and from Val Packett's
submission from Jan 2025 that included extra cleanups, fixes, and a
new dtsi file similar to ones that exist for other PMICs. Some
comments weren't addressed and the series was ultimately not merged.

This series only enables four functions: regulators, keys, pinctrl
and RTC.

I added a handful of device tree improvements to fix some dtbs_check
errors and addressed the comments from last year's reviews.
The series has been tested on Xiaomi Mi Smart Clock x04g. In order for
pinctrl to probe successfully patch [1] has to be merged too, but
each patch code has no dependency on the other.

[1] https://lists.infradead.org/pipermail/linux-mediatek/2026-March/105005.html

v3: Added pinctrl device, changed mt6397-rtc fallback to mt6323-rtc,
    added schema for regulators and fixed checkpatch issues.
v2: Review feedback - replaced explicit compatibles with fallbacks

Fabien Parent (4):
  dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
  dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
  mfd: mt6397: Add support for MT6392 pmic
  regulator: mt6392: Add support for MT6392 regulator

Luca Leonardo Scorcia (3):
  dt-bindings: regulator: Document MediaTek MT6392 PMIC Regulators
  dt-bindings: pinctrl: mt65xx: Document MT6392 pinctrl
  pinctrl: mediatek: mt6397: Add support for MT6392 variant

Val Packett (2):
  input: keyboard: mtk-pmic-keys: add MT6392 support
  arm64: dts: mt6392: add mt6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |   9 +
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   1 +
 .../regulator/mediatek,mt6392-regulator.yaml  | 318 ++++++++++++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 141 +++++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     |  46 ++
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 +++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 487 ++++++++++++++++++
 include/dt-bindings/pinctrl/mt6392-pinfunc.h  |  39 ++
 .../regulator/mediatek,mt6392-regulator.h     |  24 +
 include/linux/mfd/mt6392/core.h               |  42 ++
 include/linux/mfd/mt6392/registers.h          | 487 ++++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  40 ++
 19 files changed, 1770 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/dt-bindings/pinctrl/mt6392-pinfunc.h
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0


