Return-Path: <linux-gpio+bounces-31229-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IxjBDYFemlE1gEAu9opvQ
	(envelope-from <linux-gpio+bounces-31229-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:46:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFFFA18A8
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 596FC3030B22
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 12:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D443330B14;
	Wed, 28 Jan 2026 12:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ia24RyMN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2FA20C48A;
	Wed, 28 Jan 2026 12:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604321; cv=none; b=aR/Ss/vRitC+i0Vc5KMtJjEc5ZtripRCsKTUUuOMJpM7U2z3WqBMyUtQESgS7YmdC4NdckWAaYCh7nllL0d7y/pL0SJn1TxUTFU4hQtMFG+4ImC6E56LnTDxV8CZgungj8p6ncPp8jj1KRBq3U4F84MwwDDxSiHUn2KSIh+FlX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604321; c=relaxed/simple;
	bh=+M3aB0Vcgcp7FT4HdlKlf6HyWrOspAKQ/189q0yp7ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OnyJ9rA9lV/D4xjWiu34eCQwdxn8pdqoLFxAff+SMcKR0zakaVW7fX0Gta5XKt+Dzkney4BBQhr6RFZnjlgb01ipNGVo/KhW6bkM7hCuHd7Qh6Sn8MNQZx6kL9ZK/zYc7Z5Z4XLSK86AGHCkfp4xzs5jq1LK+Cg4NGREAQx9s/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ia24RyMN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769604321; x=1801140321;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+M3aB0Vcgcp7FT4HdlKlf6HyWrOspAKQ/189q0yp7ZI=;
  b=ia24RyMNZKYfPDg5QnwUcJlrpkxJIOuqkv/PU0Hd5g8ezDKyvydK7YY2
   3n7HxjtuHXEgPJUCCyBTdHaJIJAJFmMlYaqgcPZbzDjXLLZqFqX+3qCSu
   7eTbkRmv7+KT9w3rrC3auknOGY7/fcrslunrDCFOtcFmZ3nMzpmLYkTOM
   f6TVVEsB9PImFmIJXcbYUj43N+8IVDq69qp2EsjfcYaAIOADSeKfOorHN
   ANP2mzx9Za0VEb3qWK1HTNsqToR2lM8bjZAOckIsK5Tj1o7NGRfPDIMJv
   gApEIodKJS/R2KGt8BoTOW/JKpCBkiqciwQixIf4TWAkpwzGa9QIaMdCD
   g==;
X-CSE-ConnectionGUID: JxUhovxVTEqyeGmLhr/1ig==
X-CSE-MsgGUID: jaNlnGMPToKE9xrdSl0NaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74663224"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74663224"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:45:10 -0800
X-CSE-ConnectionGUID: OgFrLLOLSCe6QraR0SJF+A==
X-CSE-MsgGUID: WdMbkrIoQgmjwB8RxcMI4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207500812"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 28 Jan 2026 04:45:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 62AF398; Wed, 28 Jan 2026 13:45:07 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 1/1] pinctrl: tangier: Remove duplicate error messages
Date: Wed, 28 Jan 2026 13:45:06 +0100
Message-ID: <20260128124506.40882-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31229-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 9FFFFA18A8
X-Rspamd-Action: no action

The pin control core is covered to report any error via message.
Since that it's not needed in the callers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-tangier.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-tangier.c b/drivers/pinctrl/intel/pinctrl-tangier.c
index 44b333d6c7cb..e1af1ddfc951 100644
--- a/drivers/pinctrl/intel/pinctrl-tangier.c
+++ b/drivers/pinctrl/intel/pinctrl-tangier.c
@@ -566,7 +566,7 @@ int devm_tng_pinctrl_probe(struct platform_device *pdev)
 
 	tp->pctldev = devm_pinctrl_register(dev, &tp->pctldesc, tp);
 	if (IS_ERR(tp->pctldev))
-		return dev_err_probe(dev, PTR_ERR(tp->pctldev), "failed to register pinctrl\n");
+		return PTR_ERR(tp->pctldev);
 
 	return 0;
 }
-- 
2.50.1


