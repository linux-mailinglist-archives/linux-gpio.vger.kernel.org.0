Return-Path: <linux-gpio+bounces-31230-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE/KNTMFemlE1gEAu9opvQ
	(envelope-from <linux-gpio+bounces-31230-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:46:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15939A1853
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2FA2030065FE
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 12:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC7B350A0F;
	Wed, 28 Jan 2026 12:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKX9+Ya5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9343009E8;
	Wed, 28 Jan 2026 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604400; cv=none; b=TVvEWRP+CyPOkei+T+0rT9e+2QBW8NlGORew7rGeFO9IoyBYgBV3i73aF1m616DeO2SdU/7tymvH5RnTsMosmHz+ww4KL/aU4jsdxJ7JIh8sYbJ0WaXoXpIfjT+47EZn9FyxH3iuKMt/UTJacBTvrKj7A1/QrSEq0wd60HhDYKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604400; c=relaxed/simple;
	bh=GozZGR7Bk4mGciQMEfVIzJeZFg38nqcy5ubvIz0u99E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C6UcFrMI43cWdtilxnRxsQ3GnlgRUfVB+qyKPiYgJa/6cHbXuKWplGc/msZ4FjOwgiylLcqKnFvw8lhoN9g6IXMLfZpBJ8CYSuuYQkVMGKwFyBgA2Ba0yyU2umDUyzc8IrKjBxVMyUFrePUvL2FYeCMdJk3S5885+PiFycXOxcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKX9+Ya5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769604400; x=1801140400;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GozZGR7Bk4mGciQMEfVIzJeZFg38nqcy5ubvIz0u99E=;
  b=nKX9+Ya5uvvN2K/OAD4TsEaKTHXHz9GG2MCaq7cnfcfftLprjMZteK0U
   mzGp8vZmbycOiJbgjvEmbsx5wZ0CtGq+WTbxCaTKe3ajYu6nMPCbCDWuA
   un1SepRptoSTA/PKvI6POcIVHrki/nyCtHX75vvSDeRJPxclkY4vFacnu
   O30JDwc2zbbX5dBFr6KwQK8YrZSKLG60R9D5Lo4YDLTsNM7AvUpqI3/4b
   4T//C/PIfDyhpuDY7DYpVJxo+bxzkbAP88vPCRNRTu7KQvjrzQfXmwPex
   O4FrAByAd3tUYA8eb2DpCRZzS3yDeiPnks0u3YSxiGHnxyxdRZeCbf/Ts
   A==;
X-CSE-ConnectionGUID: uV6fZ5nHQYS5HgkzkVZd5w==
X-CSE-MsgGUID: LduAwFk8Qay6e7qijMRcfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70709955"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70709955"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:46:39 -0800
X-CSE-ConnectionGUID: 7/z32HZUQXOggAAOnia3ew==
X-CSE-MsgGUID: GmtKQMwWTxGxvqmpyt27Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208275927"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 28 Jan 2026 04:46:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CD00198; Wed, 28 Jan 2026 13:46:36 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 1/1] pinctrl: lynxpoint: Remove duplicate error messages
Date: Wed, 28 Jan 2026 13:46:35 +0100
Message-ID: <20260128124635.40980-1-andriy.shevchenko@linux.intel.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31230-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:email,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 15939A1853
X-Rspamd-Action: no action

The pin control core is covered to report any error via message.
Since that it's not needed in the callers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index e9233c12e824..c80ddb5125b4 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -735,7 +735,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 
 	lg->pctldev = devm_pinctrl_register(dev, &lg->pctldesc, lg);
 	if (IS_ERR(lg->pctldev))
-		return dev_err_probe(dev, PTR_ERR(lg->pctldev), "failed to register pinctrl\n");
+		return PTR_ERR(lg->pctldev);
 
 	platform_set_drvdata(pdev, lg);
 
-- 
2.50.1


