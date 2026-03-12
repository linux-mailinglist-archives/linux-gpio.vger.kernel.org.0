Return-Path: <linux-gpio+bounces-33212-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHXPIAs+smk6KQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33212-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:16:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA1E26CFC0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A4A9301F3AD
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 04:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22C53932FB;
	Thu, 12 Mar 2026 04:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVnf3XYp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFCB33F596
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 04:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288966; cv=none; b=mS5t3++AEK6tZs6Ekzb2OATZDiamrhrAWBrNAKRYOt57EvnYsHUJDo7d6KGCHtLcopAs8BrTHYJHoV+QDtfWMZmrC+9PeXjI+6cUQpf1Uy79Hw6pLxdbgHewgwUbm+81FnrZR28lJ6QhsUDDWLmWWVQ1XBlNEAVBLksGV3lOWoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288966; c=relaxed/simple;
	bh=cC+zW/Sj9PJ7nLrSakL9rgqT9FTttPmJVG/fATkFEO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4CEIq0Fs1HoEFIRRA9e7s4QZo0leRkApX261Ca+1zHZt+sdOsT8o97QC6VF7S2qZhpgkZ4v/H+vKC+ov5YvUkH5ALtH4YBLEtoDcXFhm2kdKCe70fKxZF9eaRZMoSwj3fUHVUIBsD4lHw4YNs6+G2hVOo128Qb2Wmyq11c7aNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVnf3XYp; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so255399a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288965; x=1773893765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/CLgwAizLdgwnVah8slW2Wa5Fqh07xJoE9OJwqSRCXM=;
        b=LVnf3XYpZwL26vx6/rSfkI5dHpHWNFcRQmOfmcmBw+fmXeSvOTrxA6dWKZ6dAusVN9
         Bd7LCCcfHKbO8arCpA5Rl2706pzE2A2R/Tnns8Tx3g4Cs/6pDEjhDnEg7/5Pu7Et/hn+
         QfBWn4gorzuDlurq7dv2f+nb1nvJ5WmFpFnYy+pkzrTCsjXIA2AlmGjxl9lM6An71cat
         Jo6pOvm+cLmOanRGtlKCquirntlJb76omw4TPMXG8gVLqGDfhGmrxQ7Q3IEJKr5O3jsi
         QkEJN/0H7Q4IkbQQ8SXj5elwcEXOgaR/yFbB4yvFx7sTgiBBjyt8VdC69WiW3hOyQUuc
         OK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288965; x=1773893765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CLgwAizLdgwnVah8slW2Wa5Fqh07xJoE9OJwqSRCXM=;
        b=aQv7p6zg8t8IysA1hRATnsyOnEiF/R78jzDd0g8Oq+w5kDSAljc1WCkVRt51TZ79Y3
         fUvvj8uE1FPWSy+arbK35OI4rVEMUKha22NKWWrkug2yb0vgaE7/DN9XqfmtV0EQovXH
         Mop0ZBY7fj4gYQ3tcE/fY1sG1h8xNHv+TF1AY99bHMeq8vMHMU6w2Ln+F4Mux7fVzLzk
         lj50rtaAu5kiM0QWOPJjs2ZVPG5klN5tK5lfKpKaWczjZ2wPHeavc6j9RznBkqmqp0iG
         E7hklukL3PL1FRL5L6QSDG32e9qTQVoE/hV2XgWcnsbybi7tclfZvzKcx2SiEWIxKVuj
         wFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsaQpsOKsl8/8AIXnFK/xDhN/xJLNqJDDlWxJu9zzOQoRF1dup8yv6aD0YEF2kUAQtkzDWgH2YXcgv@vger.kernel.org
X-Gm-Message-State: AOJu0YyLFzI2f4IBTwYvEY7hechlDzx3+2SiAG1a4azdZr9m5kSTF5LS
	ffsuCJLX3FqvryUFs7PS2YU6QtphTkRR+sI89YgRTvJdff7/SDEPzHBx
X-Gm-Gg: ATEYQzyVCGOlzdWVoGhb8nomiEMHigzkLSYD33DZMkKFv9UuRgcamDP0Ue6UgAr1GZ7
	ymP/5M1aq9XxGjLI7vE3g/+yTMFTFX+B9Id+QtIyW9FBo/k5tTsWiqfm2F3ouKQNMW1hf1+eLQJ
	Bi1JRdtROIKU/K7CuCACfNqyPc5GH+gvWWZMFTefr4J/gSgdDCwor/iivxzck/pR6129GUbxG5h
	RhFlT6inXXWPCj0Sb2ww8xHERd6HhWn8XKp3MWtBp3rFXWFcmrppn5BhHU3DC63qYOXCRDXnnjY
	s2TAl+nl5YhlKTwzpwxNRcXKpAI7WG1N0xDMwdMcRKJiNAyJI0swCTVnJHsFUi3/qUMPpXny0uA
	pJTsDfpqg80nECJc00igFt1Yq7QH04kpRNEuQ/an0jKofD+9QVyEKHNFUzij9vxBu+YXHZ0/E9l
	opf2J1FVM82LXXy6eCyve5CQju2KpkgyNMafadl5UVaYYA19aTDjrqz/iF1S5yvbgy8T4J8dRVo
	qTOo5w=
X-Received: by 2002:a17:90b:5445:b0:359:7a1f:1b83 with SMTP id 98e67ed59e1d1-35a01323909mr4580458a91.26.1773288964582;
        Wed, 11 Mar 2026 21:16:04 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:04 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linusw@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	hui.liu@mediatek.com,
	nfraprado@collabora.com,
	linus.walleij@linaro.org,
	mars.cheng@mediatek.com,
	andy.teng@mediatek.com,
	hanks.chen@mediatek.com,
	sam.shih@mediatek.com,
	rafal@milecki.pl,
	ben.ho@mediatek.com,
	erin.lo@mediatek.com,
	zhiyong.tao@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 0/6] pinctrl: mediatek: Fix gpio-ranges and include guard issues
Date: Thu, 12 Mar 2026 13:15:27 +0900
Message-ID: <20260312041533.187553-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-33212-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,mediatek.com,collabora.com,linaro.org,milecki.pl,baylibre.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[akkun11open@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DA1E26CFC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While looking at MediaTek's Pinctrl driver and device tree, I discovered
that on some SoCs, the gpio-ranges count was a little less than the pins
defined. This means that the last pin will no longer be available.

And fixing this issue, I also discovered that the #endif comment in the
include guard for some header files was different from the macro name at
the beginning. These issues do not affect the compiled kernel, but they
affect the readability and consistency of the code.

This series addresses the cases that can be confirmed correct without
requiring datasheet verification:

- mt6795 : gpio-ranges 196 -> 197
- mt7981b: gpio-ranges 56 -> 57
- mt7986a: gpio-ranges 100 -> 101
- mt6779 : include guard #endif comment fix
- mt8188 : include guard #endif comment fix (two files)

The following additional issues were identified during this investigation
but are not included in this series as they require further analysis
or datasheet confirmation:

MT6779: gpio-ranges = <&pio 0 0 210>;
    This matches the number of pins, but GPIO203 to 209 don't have
    GPIO function, and the driver also has no control over those pins.
    Probably needs to be fixed to "gpio-ranges = <&pio 0 0 203>;"

MT8183: gpio-ranges = <&pio 0 0 192>;
    This seems correct because it matches "pinctrl-mtk-mt8183.h".
    But, mode/dir/di/do are defined from pin 0 to 192.
    "pinctrl-mt8183.c" looks wrong.

MT8188: gpio-ranges = <&pio 0 0 176>;
    According to "pinctrl-mtk-mt8188.h", GPIO0 to 176 have GPIO function,
    and GPIO177 to 189 are EINT only pin, but mode/dir/di/do are defined
    from pin 0 to 177. "pinctrl-mt8188.c" is likely to be wrong.
    At least "176" is wrong, probably "gpio-ranges = <&pio 0 0 177>;"

MT8192: gpio-ranges = <&pio 0 0 220>;
    "pinctrl-mtk-mt8192.h" defines GPIO0 to 227 which have GPIO function,
    but mode/dir/di/do are defined from pin 0 to 228.
    "pinctrl-mt8192.c" looks wrong.
    Also, probably "gpio-ranges = <&pio 0 0 229>;"

MT8195: gpio-ranges = <&pio 0 0 144>;
    Like MT8188, GPIO144 to 164 don't have GPIO function,
    but mode/dir/di/do are defined from pin 0 to pin 144.
    "pinctrl-mt8195.c" is likely to be wrong.


Akari Tsuyukusa (6):
  arm64: dts: mediatek: mt6795: Fix gpio-ranges pin count
  arm64: dts: mediatek: mt7981b: Fix gpio-ranges pin count
  arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count
  pinctrl: mediatek: mt6779: Fix include guard comment in the header
  pinctrl: mediatek: mt8188: Fix include guard comment in the header
  dt-bindings: pinctrl: mediatek: mt8188: Fix include guard comment

 arch/arm64/boot/dts/mediatek/mt6795.dtsi              | 2 +-
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi             | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi             | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h         | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h         | 2 +-
 include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.53.0


