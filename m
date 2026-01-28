Return-Path: <linux-gpio+bounces-31233-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJm3H48Kemk82AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31233-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:09:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28185A1D92
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62EF3300103F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCA0352927;
	Wed, 28 Jan 2026 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GH+YYtvq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D05934D909;
	Wed, 28 Jan 2026 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605770; cv=none; b=MjFipNydjXS6Oroy1+uOG8pD4vFIRqrv43N8rH2PuKOTh0mWO7tfOwf4y9Ll+GBfvOIVqIG2PBv6MNGIb+cx79PSCQTxkgmv80HTAFfAc4xTMWMfHwbYKcoD7GtDOVx0oHWusv680Au9/ciqC8CVwO3BuWqwY7VybdB+tOXOFPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605770; c=relaxed/simple;
	bh=lhPGm/WDrZ1ptS5v0M+lrQSAY1UdScNdFcyHIHY/t7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=slZ7Jt22dYgpM+TdrttTXmweiKA01ajc9dV3eGiYC/0OczFpJ16sjHYcOLS2tvD0edUkqGnF0dFsrOYwbyzL0VtWGTtJz92FqrxEny3pNumAc8moyZTcPvXDap0BYY61cSTOBVmD65KTh03N3Nt0bB7WQNQXWze90kTtStEi/vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GH+YYtvq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769605770; x=1801141770;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lhPGm/WDrZ1ptS5v0M+lrQSAY1UdScNdFcyHIHY/t7Y=;
  b=GH+YYtvqmrJbzLyB45hVka1L+fVNtSxxq9F4QqnIKvJoKIkSysPTERCo
   DroDO0emukpIGzFtk0pEzzIjSHBw5wkPiXOoHiXycNVRnsQLWgbf+x/7O
   sQcqCNxZCmXD6hvtE9ILUYJOdifICnRGzsHcdfcpI/vbyQySjSKdM235Q
   zmNqr0nukZy2WXc6GqcIVjlTh6K/0CxwNqMhTR56uo0tQh05Qub319cjp
   IyeOIiclE1MDwkRWwU+fFg11MOx3yl3fy6lmxEsBHD4q5Hwv70T43/xFS
   Z7s+SU8f8AeRKefacEAb3BD5AFg03ddfWlWBbSayK8V1KE5JcZvBKnjWE
   A==;
X-CSE-ConnectionGUID: Icz2I1MWSLeiJH/uffBpmw==
X-CSE-MsgGUID: Sde+3g/hSNWuy5r/jXmopA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82244553"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="82244553"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:09:29 -0800
X-CSE-ConnectionGUID: /oLBtMdCR6qlBIYDTXUTjg==
X-CSE-MsgGUID: j0Gs0Qq9TpKjLY6X3f6xlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208635120"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jan 2026 05:09:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 4416D98; Wed, 28 Jan 2026 14:09:26 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 1/1] pinctrl: intel: Remove duplicate error messages
Date: Wed, 28 Jan 2026 14:09:25 +0100
Message-ID: <20260128130925.123823-1-andriy.shevchenko@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-31233-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 28185A1D92
X-Rspamd-Action: no action

The pin control core is covered to report any error via message.
Since that it's not needed in the callers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index fb664e738de1..22b60ba3198e 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1680,7 +1680,7 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 
 	pctrl->pctldev = devm_pinctrl_register(dev, &pctrl->pctldesc, pctrl);
 	if (IS_ERR(pctrl->pctldev))
-		return dev_err_probe(dev, PTR_ERR(pctrl->pctldev), "failed to register pinctrl\n");
+		return PTR_ERR(pctrl->pctldev);
 
 	ret = intel_gpio_probe(pctrl, irq);
 	if (ret)
-- 
2.50.1


