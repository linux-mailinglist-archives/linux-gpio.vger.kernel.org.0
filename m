Return-Path: <linux-gpio+bounces-26426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE38FB8D9B3
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 13:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 176887AE690
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 11:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3790D219A8D;
	Sun, 21 Sep 2025 11:16:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14A51B81D3;
	Sun, 21 Sep 2025 11:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758453373; cv=none; b=OiljHHAKvme+DATfNlWnSndoyRpUOgIxw92ZJj+e9J/IOo9SjrBxlizmc5wDj9w1wpqUy3AgY3cn0ueLmVQlHjVwMKN3YjF01zCrBuZb3jhU2HOGA+/Kbu6Ijwzf9o4Q4qwhVAPdHIQM2I6bDlD+htVYdFIwJWTLDIJlmcgNk08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758453373; c=relaxed/simple;
	bh=2LfdbEHL4vk8Rkv+233QDSONET350HYC3trGdHp1rPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J87dLvdB+KDbTh5jPeaV3hvPy/R+N8HVsC8SNS9e4nNJ8CIX4zS5e/hZnBoFv0k7KHU6qb2OSYij2gEIt9gOfxvbAO5lDycw6X/uM/Lbqf8iM8HfrCxTbyO/Onx3C3g3db3amARDXXncsB4QfPqe4lzMujxr5We6z8dut150z/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: /ZAO/P+CRLuatSHs3X1hnQ==
X-CSE-MsgGUID: Ky5KTXJcTCSdPHSMYAaUQw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Sep 2025 20:16:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.3])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2927140061AE;
	Sun, 21 Sep 2025 20:15:59 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/2] RZ/G2L pincontrol improvements
Date: Sun, 21 Sep 2025 12:15:51 +0100
Message-ID: <20250921111557.103069-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch fixes PMC restore during resume as it needs to use PWPR
register to unlock it. The second patch drops redundant configurations
during resume.

v3->v4:
 * Prepared as series
 * Added new patch for fixing PMC restore
v2->v3:
 * Dropped extra space before the == operator.
 * Moved spinlock acquire before reading pfc value.
 * Make sure it is configured for function in PMC register for
   skipping GPIO switch.
v1->v2:
 * Updated commit header and description.
 * Added check in rzg2l_pinctrl_set_pfc_mode() to avoid unnecessary
   configuration

Biju Das (2):
  pinctrl: renesas: rzg2l: Fix PMC restore
  pinctrl: renesas: rzg2l: Drop the unnecessary pin configurations

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 28 ++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

-- 
2.43.0


