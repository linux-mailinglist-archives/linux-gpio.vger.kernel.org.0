Return-Path: <linux-gpio+bounces-31231-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEbjD1wGemlE1gEAu9opvQ
	(envelope-from <linux-gpio+bounces-31231-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:51:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8F7A1987
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B3B0300290A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 12:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946CD350A2A;
	Wed, 28 Jan 2026 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBh6Il+R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73691F19A;
	Wed, 28 Jan 2026 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604693; cv=none; b=Ft87q2AFGWO7afCrY+ouNarXxVy5W2l4BQg97E5bQSWBfuotLmZ6YClAge/OcbEZRucAdnbhTlRE5HrQM1fvKVqQMm/AtHnOM411MVefjmZqG2T0YmO1vMVCJWU2NYOAnLICZRtagZKcj2Ep9gxAW8RUo5ux4wrsZbE0cnyDmeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604693; c=relaxed/simple;
	bh=pn5lfb6maqiFM7lvzCM33guyVd7uFvDlgiQT3zUqWgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YszuW0WcezZecgISw9C+keBGYTV9dPqBVn4O1xH+GHcyNQ79b+gpBZFf7VSM4MNWOov34Aq/4xTgVVacMG71JO2r96ZfY15B+96W5nVUOSK7I1zhA2Wuq5ccspfUdEY5Es+1OHKlGLaVlUbxNIysY7nlUZmISp/M0dfU+UFnC5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBh6Il+R; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769604692; x=1801140692;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pn5lfb6maqiFM7lvzCM33guyVd7uFvDlgiQT3zUqWgs=;
  b=iBh6Il+RDbdHcvX07eSN2tq3Ir4lyiWZcznM/YbGKHPzmgwvUS3DV5qJ
   zAgn/dSoOw2PkQIgfI3E4vtxQ181h9/ZWscYOee0cbnJlb8YgrR7/+0QO
   0rOWaHZH/g9Av1/p2iT7fs1s21cLn99suq0JVLZnbI1mjxcLbNe84ynAr
   1G3uq8nb9nrKv8ML/+0Y9ycMOllYmTgJ0gsXITwmPufGFFL268vwM3os4
   OLs1PjvFl6LrzqJ8ucA+yAljzXO+zfbq1uw1tSGXcRA3wM8Wz/eXr0Vz1
   NaAACgDyIpbq7dC0EM++n7dc81CvHKcpT8pCm83ZHfqcarS8P6kgQG28B
   w==;
X-CSE-ConnectionGUID: P95o3yi7QQe7ePO5/VJ/gA==
X-CSE-MsgGUID: hZpg7ZpFTEG6eVDrNgFmYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="58393108"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="58393108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:51:31 -0800
X-CSE-ConnectionGUID: 8AKTdJavQe2bMcYT/N32wQ==
X-CSE-MsgGUID: QSoocxW5T9aovmXpUp4ugA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207884500"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jan 2026 04:51:30 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E15D398; Wed, 28 Jan 2026 13:51:28 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 1/1] pinctrl: baytrail: Remove duplicate error messages
Date: Wed, 28 Jan 2026 13:51:28 +0100
Message-ID: <20260128125128.44508-1-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31231-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C8F7A1987
X-Rspamd-Action: no action

The pin control core is covered to report any error via message.
Since that it's not needed in the callers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 663cb4e9a5fb..aec2f31eba7d 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1616,7 +1616,7 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 
 	vg->pctldev = devm_pinctrl_register(dev, &vg->pctldesc, vg);
 	if (IS_ERR(vg->pctldev))
-		return dev_err_probe(dev, PTR_ERR(vg->pctldev), "failed to register pinctrl\n");
+		return PTR_ERR(vg->pctldev);
 
 	ret = byt_gpio_probe(vg);
 	if (ret)
-- 
2.50.1


