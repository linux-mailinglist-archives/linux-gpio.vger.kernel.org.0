Return-Path: <linux-gpio+bounces-32067-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ASvF4mZnGmKJgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32067-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:16:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A859517B64A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 664CB308B6CE
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B3C33F381;
	Mon, 23 Feb 2026 18:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TR9tI9J7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF08533CEB0;
	Mon, 23 Feb 2026 18:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870148; cv=none; b=T1NQZpasG4BSf0uqh3HJCX1ubC6p3ISpGOLrNf0/aoJM6qzqbUKpPaiW5DdUu4Vy1/Txy0rpW5Nfbm42efiIL0SNc6+k6oQavwzxLIGNzHK5S8t4ce2RuwSC65opHQku+aJ+Tv3SVhiya/XMWuZ9zN+nvF9WO8heu5e7Ubyv04E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870148; c=relaxed/simple;
	bh=mB4UJPu7ft7xeAi6JUJEU3taIkBlM1htlTm1Pte0Vxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGThpHZ+n7yk4rlrxzfA+tcO1uh4fRC8uaYjDCz9xHBheekaCplfDwtgvf76GQYQ0lmp1IxssTuZ71s2etC6rg5Y7JNqV1xg1JOa8yB4c4HlFNt9VbmTBs52eHS6Ro8HIeHJv0VwtCeZMGcFxUA7X/o+OdfghlPcYtCNRYlRX7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TR9tI9J7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771870147; x=1803406147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mB4UJPu7ft7xeAi6JUJEU3taIkBlM1htlTm1Pte0Vxg=;
  b=TR9tI9J7gLIGb8Iomc206pXuNjabeZMtd1iBTY4uQ67JjxIrEegOOaY1
   wDrTqtc409urDjkhPPW63Ry9SwoYcFfLvKVu8G2aIkwnwrFXh34U0m5bj
   zv9VMBaRBA5yimg899QHy4pk36PWNODK1VlxPV1LHcTUQbjGW794/grma
   wYZ9BnEOo2pqxd1ZlDkCZq/4Y39XDcQvAxoGR1KVtlaAwaQe0fuoMP1Qd
   m43AL0QUbWfjez9iJTDYP9bTJdiyT5oLLfvz37gWdwkXwGa1IVSRdrbxm
   mlVDyiCzXJwDXkIe8zVoWOWwXbuPyjoKFfRunkwOq1cVvvF4QD5+x9dYA
   Q==;
X-CSE-ConnectionGUID: QZu8s1SOSpGUJDOr7eSfgw==
X-CSE-MsgGUID: U5e9eEydROKdKO0EbYVxDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76737702"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="76737702"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 10:09:04 -0800
X-CSE-ConnectionGUID: OVa1yvTwQLitLtSc3ps9gg==
X-CSE-MsgGUID: 76mljHycSjCqLzYVqOTh+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="253369509"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 23 Feb 2026 10:09:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 266B899; Mon, 23 Feb 2026 19:09:01 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linusw@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v1 1/8] pinctrl: cy8c95x0: Don't miss reading the last bank registers
Date: Mon, 23 Feb 2026 19:06:51 +0100
Message-ID: <20260223180859.2845261-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260223180859.2845261-1-andriy.shevchenko@linux.intel.com>
References: <20260223180859.2845261-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32067-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: A859517B64A
X-Rspamd-Action: no action

When code had been changed to use for_each_set_clump8(), it mistakenly
switched from chip->nport to chip->tpin since the cy8c9540 and cy8c9560
have a 4-pin gap. This, in particular, led to the missed read of
the last bank interrupt status register and hence missing interrupts
on those pins. Restore the upper limit in for_each_set_clump8() to take
into consideration that gap.

Fixes: 83e29a7a1fdf ("pinctrl: cy8c95x0; Switch to use for_each_set_clump8()")
Cc: stable@vger.kernel.org
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index a4b04bf6d081..5c055d344ac9 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -627,7 +627,7 @@ static int cy8c95x0_write_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	bitmap_scatter(tmask, mask, chip->map, MAX_LINE);
 	bitmap_scatter(tval, val, chip->map, MAX_LINE);
 
-	for_each_set_clump8(offset, bits, tmask, chip->tpin) {
+	for_each_set_clump8(offset, bits, tmask, chip->nport * BANK_SZ) {
 		unsigned int i = offset / 8;
 
 		write_val = bitmap_get_value8(tval, offset);
@@ -655,7 +655,7 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	bitmap_scatter(tmask, mask, chip->map, MAX_LINE);
 	bitmap_scatter(tval, val, chip->map, MAX_LINE);
 
-	for_each_set_clump8(offset, bits, tmask, chip->tpin) {
+	for_each_set_clump8(offset, bits, tmask, chip->nport * BANK_SZ) {
 		unsigned int i = offset / 8;
 
 		ret = cy8c95x0_regmap_read_bits(chip, reg, i, bits, &read_val);
-- 
2.50.1


