Return-Path: <linux-gpio+bounces-25636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B123B449A2
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 00:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07F92481EB0
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 22:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784902EAD19;
	Thu,  4 Sep 2025 22:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="e0ZRpMNR";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Y0gx2hsF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EFB28C5B8;
	Thu,  4 Sep 2025 22:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757024911; cv=none; b=L0pYGJA4VuBY8vPh0OnsatqUDhGxdPYDHt7sAFXmHu6NQp1qS1O0oWk3jv2MBhLRjH8OHw3XQVen9pmL9p53PFtWur7eUQvrf/5tvnmyZa1v2a4nvEuxYDESWa747xzuGw+XTP9GkNZAt9RcozIcDSxEfMrVSAzQrdcsIVSnKWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757024911; c=relaxed/simple;
	bh=VxaipZE/W9XDe7UN0GNULCEQrSK6FRSQCfMldl/qMCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XPkUn4FdX2/14Oo3FQIAD2UFQynJjrmTCyF71VaI1teGrpyERBCDZb84EeE+djcLmdlK0ndzmPOJYEUB8hKsZP7sVi2N9WyGY1VT2OIAv8N9AQ0r2MNxN32bMQaZ5x6A0JE/DyfLtZHNUgnftgxDQ+MH6vvzDLNey13g5XBF1dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=e0ZRpMNR; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Y0gx2hsF; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cHvJP30QXz9tVN;
	Fri,  5 Sep 2025 00:28:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757024901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JCfZDqOW3xYUnS4qfRX3DC2JgwtDWIhIkGDWmHc2PpA=;
	b=e0ZRpMNRQGLryewqCpS/3+JvA4D/B76+kiY62TbaQSEtIdzxeLh2h+L8AxGfXWGDRLjWmF
	G89G8/IurSpsEWUpnRNDuUDgrGyQeNyutJ/IQcgm8EYqkV9IEstP8W3PzEyeETAmxndt/s
	fjZ20uwJuLRLd8xTagw/wwl9JBo69/yUZbTI+xq7+oaUyqWDk4X40AObNsmJT+cQ5oszO7
	K96EMAUhJtaU0Ihdqp9gmrScU63ksE8a3qP3dS7mN7d9EdgOxonAVJL64PUA0mscddinMd
	sADb6Kv28ucvA1Q+9+9begb2RB2FrES3V/ykve6eaB9wzem2pQef6vONbrgVoA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757024899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JCfZDqOW3xYUnS4qfRX3DC2JgwtDWIhIkGDWmHc2PpA=;
	b=Y0gx2hsFq+4s/uYCQxW/jpI5/1KPUQbGGRMcfJwvzmywREFGxImjit8pGMVyPJPOBc2wYv
	DzUgx0acsiLf48xZWHcy84RGx5DJutoT/YCIa3H4/FqAbh9oHzOI1cS/HKx8xeBMBTA0Fb
	6RNCIc3FdVqzwFtCUQeHG4gFNeRXbEv82+XqGb1G/pLt05aquC9gBY5dhMuK/Q+pJMp6Vy
	dY8pYlZQ547oAhcQD2HGX/U8achT67f8tL9hjx14m2N7CQR5213tRgosKzKrzaCcgyESaQ
	glzYmR/4V9QyQqmVllMnlEZ+8mDiKr/SLD0A7dGeURqy9uOozvHWfJojwEsZuA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] pinctrl: renesas: r8a779g0: Fix trivial typo in SoC type comment
Date: Fri,  5 Sep 2025 00:27:44 +0200
Message-ID: <20250904222806.193260-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: mfes1j688q8wf3wu6ec8ger8k67kyhis
X-MBO-RS-ID: 139fc08f7d3b6ce8f2e

Fix SoC type comment in the PFC table file, replace R8A779A0
likely copy-paste error with R8A779G0. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index cae3e65534997..218c5eff9b67f 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * R8A779A0 processor support - PFC hardware block.
+ * R8A779G0 processor support - PFC hardware block.
  *
  * Copyright (C) 2021 Renesas Electronics Corp.
  *
-- 
2.50.1


