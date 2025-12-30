Return-Path: <linux-gpio+bounces-30008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BED51CEAAA2
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 22:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 379AC30060DB
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 21:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9542261B91;
	Tue, 30 Dec 2025 21:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6lA2ZM9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6456520C488;
	Tue, 30 Dec 2025 21:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767129048; cv=none; b=Jkd4FnTn1c1pbL5Hhw0tehYigVJbJYrhXvvByLcjF64vRK0GOczbE8ColRZLm3mvT2S25GOHi8Xgac9wngm3VdD6I6Ndml3iGbMU9hxtZvpr4Epfx+Ayy0DHrhGpDr4qwmMMk7ntCEb9f9k0Fm/RXwuTgr+5pu3Y3ZuJUESZK1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767129048; c=relaxed/simple;
	bh=0mcZbfrjDeZUFfagm+JwSbwpa29ZbCBGNwEzClbno/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mGNfSImvThbMCusMwoFBlf1fLTOw75DzHMBQWUsOpVaybOxksugLnB1wl2OoYzLUDgSa41WOfhOkVHEy1sndWOxcY7e/evzub91iKa5WrXoyg0i/mahBbv2Z/Ba/BGhwLZGzM01CXFdpoMbdalGKNHdVeaAPRaqcVl0S0bqTj0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o6lA2ZM9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB6DC4CEFB;
	Tue, 30 Dec 2025 21:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767129047;
	bh=0mcZbfrjDeZUFfagm+JwSbwpa29ZbCBGNwEzClbno/k=;
	h=From:Date:Subject:To:Cc:From;
	b=o6lA2ZM9B2+FLZ2A9X3aOGroFGL8Bq2s6xmbRDhLER12WL5sm/L/mZsBixAeKj2wB
	 EW3v8b28Zvl3lNeiHuB6hDufKPQaKmU9IldW9GQDSGZCpNlaG4681TkoGc0F84t2WP
	 Rg87DIlZIEX3U+Gu0D2Hli59OVfJeAf5mV+ZqoKdarR/ipw/2i2Mo7yEfVkXrD/eQK
	 n1fo1+350i5uyCVXvpalyUqGba4H9Dfx+mAPAlj2yZqMqtrmTuMN4olN9iC2EutaoS
	 tGxJDPGSqu+SCDyxwWFnwubruYSv/5xnDt1CP+xkR6aBi1yeTJPckaWZw55dlCUsM0
	 LJfl/Yp/rLduA==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Dec 2025 22:10:45 +0100
Subject: [PATCH] Update .mailmap for Linus Walleij
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-maintainer-fix-mailmap-v1-1-7da300a275d1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI2MD3dzEzLwSIE4t0k3LrABxc3ITC3QtDA2Mk42M0xLNk1KVgJoLilK
 B0mCDo2NrawEu1NyIaAAAAA==
X-Change-ID: 20251230-maintainer-fix-mailmap-8103c23fa7be
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Developers run into bouncing emails from my old address,
so add it to .mailmap. Stuff in the rest of my old mail
addresses as well while we're at it.

Reported-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
I'll just stick this into one of my pin control pulls
for simplicity.
---
 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index 84309a39d329..94130dd3e910 100644
--- a/.mailmap
+++ b/.mailmap
@@ -471,6 +471,10 @@ Linas Vepstas <linas@austin.ibm.com>
 Linus Lüssing <linus.luessing@c0d3.blue> <linus.luessing@ascom.ch>
 Linus Lüssing <linus.luessing@c0d3.blue> <linus.luessing@web.de>
 Linus Lüssing <linus.luessing@c0d3.blue> <ll@simonwunderlich.de>
+Linus Walleij <linusw@kernel.org> <linus.walleij@ericsson.com>
+Linus Walleij <linusw@kernel.org> <linus.walleij@stericsson.com>
+Linus Walleij <linusw@kernel.org> <linus.walleij@linaro.org>
+Linus Walleij <linusw@kernel.org> <triad@df.lth.se>
 <linux-hardening@vger.kernel.org> <kernel-hardening@lists.openwall.com>
 Li Yang <leoyang.li@nxp.com> <leoli@freescale.com>
 Li Yang <leoyang.li@nxp.com> <leo@zh-kernel.org>

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251230-maintainer-fix-mailmap-8103c23fa7be

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


