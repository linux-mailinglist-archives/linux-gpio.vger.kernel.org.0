Return-Path: <linux-gpio+bounces-29207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91070C9ADB4
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Dec 2025 10:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81A454E01C2
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Dec 2025 09:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3243309EF0;
	Tue,  2 Dec 2025 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LockMcLK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100ED25B31B
	for <linux-gpio@vger.kernel.org>; Tue,  2 Dec 2025 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764667830; cv=none; b=paQPodWMLtgV/yk0Qz5puYS05RFVPKrYjRwDAL52kQGd4xjLokTvC9apzWQ5eoSM1MG2inQUZdCcvwwIhTVLPkURwyo25gAHP4DIrCKeDejffPqdnsw5tzYkZVvRE11aGumBeRwLxccqVU5cZpsnPDFOmJ1n0dyM1H3SEsGaPMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764667830; c=relaxed/simple;
	bh=523W9k3a1vFky2+bY7jK0eqnyoZyuuNWrBcmQbPl4iY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=nUVcQ1ItmaTyi1pIsbMN5bwCZiMjeDcifATP1kBV/2VEl6TxdlE8K1hzBITQN022n3h+RqWsUDti+WGWe5eqB/XSWfKPARyrl7p2pPjMgSmvEcbsGb7+kZGpVwVZ9kzkd3CiqU51WrfkExpecqAF+KicbmwD0UrYEcN8SzIM9ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LockMcLK; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251202093025epoutp03d4090de115b4094464a9caa609636865~9XAnCXpGv1963019630epoutp03H
	for <linux-gpio@vger.kernel.org>; Tue,  2 Dec 2025 09:30:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251202093025epoutp03d4090de115b4094464a9caa609636865~9XAnCXpGv1963019630epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764667826;
	bh=ddem7pRfXjH2CsY6jhzQQzzqAVw4nJRV9oahcR7IXNA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=LockMcLKH7V15WqJ2iRMUoPkRCoPWY1oj6CMYOjFkzKzLDUlUBwVHuLpbN0VL/3Ul
	 zxoTJWn8xaoCm81Ijq9stnr22vXoBLdsBwNRKDBXNix3mVO1enYbcyFEEb1gKt9dB7
	 8qsw4JIDKbi9js2EkCw8yTKysADeexTA/V0Jf+lg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251202093025epcas2p135ab56fb84d8bad6f905880addcb2e57~9XAmehDkm0391603916epcas2p1K;
	Tue,  2 Dec 2025 09:30:25 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.203]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dLFqj0V6Nz6B9m8; Tue,  2 Dec
	2025 09:30:25 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251202093024epcas2p1567dddf09e3599867e9dc14a9a234d38~9XAlhC1440393603936epcas2p1h;
	Tue,  2 Dec 2025 09:30:24 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251202093024epsmtip1f37c0608a18fb17f998cf72feb2edadc~9XAlbrQhs1253612536epsmtip1V;
	Tue,  2 Dec 2025 09:30:24 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org, ivo.ivanov.ivanov1@gmail.com
Cc: ryu.real@samsung.com, d7271.choe@samsung.com, shin.son@samsung.com,
	jaewon02.kim@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH v3 0/5] pinctrl: samsung: exynos9 cleanups and fixes
Date: Tue,  2 Dec 2025 18:36:07 +0900
Message-ID: <20251202093613.852109-1-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251202093024epcas2p1567dddf09e3599867e9dc14a9a234d38
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093024epcas2p1567dddf09e3599867e9dc14a9a234d38
References: <CGME20251202093024epcas2p1567dddf09e3599867e9dc14a9a234d38@epcas2p1.samsung.com>

Several SoCs carried near-duplicate pin bank macro families, making
tables verbose and hard to share when only the bank type (alive/off)
differs.

GS101 had its own helpers even though the newer EXYNOS9_* helpers cover
the same semantics, including per-bank filter control (FLTCON) offsets.

Some pin-bank tables didn't match the SoC TRMs (bank type, EINT class,
or bank names), and FLTCON wasn't always at a contiguous offset from
EINT.

This series does
- Consolidate on EXYNOS9_* pin-bank macros. Pass bank_type explicitly.
- Fix table errors on Exynos2200/7885/8890/8895 per TRM.
- Add explicit per-bank FLTCON offsets and update affected tables.
- Drop GS101-specific macros in favor of EXYNOS9_*.
- Rename gs101_pinctrl_{suspend,resume} ->
  exynos9_pinctrl_{suspend,resume}.

This series was based on the pinctrl/samsung tree [1].

I tested on Exynos850 through boot and verified the pin values as
follows:

$:/sys/kernel/debug/pinctrl/139b0000.pinctrl-samsung-pinctrl# cat pins
registered pins: 42
pin 0 (gpg0-0) 0:gpg0 CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) PUD_PDN(0x1)
pin 1 (gpg0-1) 1:gpg0 CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) PUD_PDN(0x1)
...

Additional testing on the affected Exynos9-era platforms would be
appreciated.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git

Changes in v2:
  - Added base tree for this series (pinctrl/samsung).
  - Renamed the macro parameter from 'types' to 'bank_type' for clarity
    (struct member remains 'type').
  - Reflowed commit messages (wrap at ~72 cols).
  - Replaced non-ASCII characters with ASCII equivalents.
  - Collected tags:
      Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
      Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
  - Normalized hex literals to lowercase and removed double spaces.
  - Aligned backslashes in macro definitions to form a vertical column
    for readability.
  - Added missing mailing lists (including linux-kernel) to Cc per
    scripts/get_maintainer.pl.

Changes in v3:
  - Collected tags:
      Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
      Tested-by: Peter Griffin <peter.griffin@linaro.org> (tested on Pixel6/gs101)

Youngmin Nam (5):
  pinctrl: samsung: Consolidate pin-bank macros under EXYNOS9_* and pass
    bank_type explicitly
  pinctrl: samsung: fix incorrect pin-bank entries on
    Exynos2200/7885/8890/8895
  pinctrl: samsung: add per-bank FLTCON offset to EXYNOS9_PIN_BANK_* and
    fix tables
  pinctrl: samsung: fold GS101 pin-bank macros into EXYNOS9_*
  pinctrl: samsung: rename gs101_pinctrl_* to exynos9_pinctrl_*

 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 1069 ++++++++---------
 drivers/pinctrl/samsung/pinctrl-exynos.c      |    4 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   97 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h     |    4 +-
 4 files changed, 562 insertions(+), 612 deletions(-)

-- 
2.52.0


