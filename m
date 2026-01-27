Return-Path: <linux-gpio+bounces-31103-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBiDNdh5eGnBqAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31103-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:39:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D519912CA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89265304520E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 08:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0744A2BE644;
	Tue, 27 Jan 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFQAWE5x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4081329B233;
	Tue, 27 Jan 2026 08:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503160; cv=none; b=GogFR6thecjRxe8zpUI5i/cd2aKBMTA5ewVx5+9cpabo1xPgyW5OjthoWlgVniFgKldvr12ahG65sfr1iQpECQaPD/kaYBecAzw2ZG17Fspq/DeDGAns9njSsRoGJO2+F8sPqurf1/PrAvK641LYN20UVBg0RkjSLiCOUjJj290=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503160; c=relaxed/simple;
	bh=QVd/DKyZRzs/A0NzPB9q2aJ9P6IS677HzngQavLkSts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JtEYtEAhGHrTZHJkv/KKIajZcA60rgHaM7vwoBIyBc5zsfPYiqbCrNohum/UE8ie00Lzk4Xu26K0LfHsCrguL8xnvUXqee/TOu10um9hX942NoIEp0eyXaJ2J+UUHB7EmwNEoQm4nfudcp+ycI46CQKPNf/XqsWO1iMexaKWjJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFQAWE5x; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769503158; x=1801039158;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QVd/DKyZRzs/A0NzPB9q2aJ9P6IS677HzngQavLkSts=;
  b=FFQAWE5xt/SiPQ5yf1NVFXte5SYQiVrQxGPNljM+8MpAgJIZUT+g2ovF
   Pa5ymfrxufoOHxGp9Zj1NyNXJ6jkApI31oKYzAfeN3JANoEHo6LEsHeSZ
   Lf0kvUs3+zsOIeMzFsvasHdRZIkEeKnw43KwrREiLSuahyoFHYOaGphdr
   rMhafH1VwtZC8fa1gE8k0rFFnIKkIcJRWU+cmTscvNn7rnTN0BjWDyNPe
   CWdqoqyKnMdfGU06xcwqeq8K9oE5fmjFshA4OWq+AcNt6dEzu7dutYT7W
   uhVtornSmqcMiCO/kqfSQA0mRF8ynm4zoLx5AHT29cupm584+dAhuzSpu
   g==;
X-CSE-ConnectionGUID: BMVnOBVFQJyOUQXa9U36Qw==
X-CSE-MsgGUID: 7cDIpRvMT7GMhR0rRG/HDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88107412"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="88107412"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 00:38:50 -0800
X-CSE-ConnectionGUID: EXY1dUkQTlakiKqIc4IJ/w==
X-CSE-MsgGUID: A8Xsw4xUQrKZjaShAxDQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207974764"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 27 Jan 2026 00:38:47 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 89FC598; Tue, 27 Jan 2026 09:38:46 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 1/1] pinctrl: tangier: Join tng_pinctrl_probe() in its wrapper
Date: Tue, 27 Jan 2026 09:38:45 +0100
Message-ID: <20260127083845.3681331-1-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31103-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 3D519912CA
X-Rspamd-Action: no action

There is no clear sign why we have tng_pinctrl_probe() in the first
place when it has already been using managed calls. Join the function
to its devm_tng_pinctrl_probe() wrapper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-tangier.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-tangier.c b/drivers/pinctrl/intel/pinctrl-tangier.c
index 5f0b7334a489..44b333d6c7cb 100644
--- a/drivers/pinctrl/intel/pinctrl-tangier.c
+++ b/drivers/pinctrl/intel/pinctrl-tangier.c
@@ -518,15 +518,19 @@ static const struct pinctrl_desc tng_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
-static int tng_pinctrl_probe(struct platform_device *pdev,
-			     const struct tng_pinctrl *data)
+int devm_tng_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct tng_pinctrl *data;
 	struct tng_family *families;
 	struct tng_pinctrl *tp;
 	void __iomem *regs;
 	unsigned int i;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODATA;
+
 	tp = devm_kmemdup(dev, data, sizeof(*data), GFP_KERNEL);
 	if (!tp)
 		return -ENOMEM;
@@ -566,17 +570,6 @@ static int tng_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
-
-int devm_tng_pinctrl_probe(struct platform_device *pdev)
-{
-	const struct tng_pinctrl *data;
-
-	data = device_get_match_data(&pdev->dev);
-	if (!data)
-		return -ENODATA;
-
-	return tng_pinctrl_probe(pdev, data);
-}
 EXPORT_SYMBOL_NS_GPL(devm_tng_pinctrl_probe, "PINCTRL_TANGIER");
 
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
-- 
2.50.1


