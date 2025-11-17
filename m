Return-Path: <linux-gpio+bounces-28559-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27554C62BDE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 08:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DECC93A1C65
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 07:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6740131985D;
	Mon, 17 Nov 2025 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uCJhrwVX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BB230F55E
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 07:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763364970; cv=none; b=X+uOcSIBO1JCzZGo4jzHlwrZG3aqYf7StnTPoViDnVWJMFBiiGHQCAhdLiWKRv5kaELysLCr8AMoyMj8T27MtbfH4M4SHjv+y8swNYIR5IS4zGumRiu3YYaBCcNoO1OlPHFixu8TqOJyCp8PyBR11c3zsiYQQJJaz3luMYfXnLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763364970; c=relaxed/simple;
	bh=1mFHx+aetKsXMuOxNltEn+EtdRINe/7IYC6uKNwY1ak=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=TqiTvp0Zv9kROWLW367sAxZBi2UFyCzlA2x3Tdi9xIii/IUDdP7grNSpPdbzJUHq9DtOQAFrjoc9xQykgtmFbVbgqkoMzk96ZHmZNOBTXyzo97m1uZYXod/ljks0LS5918f4AHeBrUEGMoLmgvQH1fnS+ZK0+EfXUJRcXmDfNWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uCJhrwVX; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251117073602epoutp03e86c3e17da08dbbe77a2f80ab0d30329~4uxdPuJwj2228422284epoutp03d
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 07:36:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251117073602epoutp03e86c3e17da08dbbe77a2f80ab0d30329~4uxdPuJwj2228422284epoutp03d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763364962;
	bh=YfbyNU/WDrACGa9gZEO0KE1YKBb0kDp5Qr5x8yIXP2Y=;
	h=From:To:Cc:Subject:Date:References:From;
	b=uCJhrwVXyC9h2xnoAtgnSfUBg8l2l70bHMAdlYG8Q6z8j/QCaO99OiJQ0rg3lpPa6
	 JPoi47YiApVgfc96H05Ni4Hhw+8cSd8YSrardgk9egbDZR+khKvS2mXBdJeIcTk59Y
	 dojUaC5zVHJtuPbex5p/B2Z45KkC817di3izBRX4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20251117073602epcas2p2a4b606e03c7f58de4b9a9b27bbd0e196~4uxcpum4w3033030330epcas2p22;
	Mon, 17 Nov 2025 07:36:02 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.207]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d900d6CCjz3hhT9; Mon, 17 Nov
	2025 07:36:01 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251117073601epcas2p2c72bdd8689a69b35b988894653300c75~4uxbglRB-2295022950epcas2p2a;
	Mon, 17 Nov 2025 07:36:01 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251117073600epsmtip2759c2dd2e0aa2012b3224edb98a17730~4uxbaiPwM2830128301epsmtip2u;
	Mon, 17 Nov 2025 07:36:00 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org
Cc: ryu.real@samsung.com, d7271.choe@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Youngmin Nam
	<youngmin.nam@samsung.com>
Subject: [RFT PATCH v2 0/5] pinctrl: samsung: exynos9 cleanups and fixes
Date: Mon, 17 Nov 2025 16:41:35 +0900
Message-Id: <20251117074140.4090939-1-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251117073601epcas2p2c72bdd8689a69b35b988894653300c75
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251117073601epcas2p2c72bdd8689a69b35b988894653300c75
References: <CGME20251117073601epcas2p2c72bdd8689a69b35b988894653300c75@epcas2p2.samsung.com>

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
2.39.2


