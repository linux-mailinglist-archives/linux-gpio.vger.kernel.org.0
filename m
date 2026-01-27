Return-Path: <linux-gpio+bounces-31153-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGcyCBWVeGnmrAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31153-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 11:36:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B0A92E16
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 11:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07BE3302F73B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB6F341674;
	Tue, 27 Jan 2026 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMpEQGpu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB72330594F;
	Tue, 27 Jan 2026 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510067; cv=none; b=leGZA4zum3ODzt9DtmSNs0NNia7YFj7oCMWiqnhp2fZ3N+PFjMBx2Jud11qSNqx25+IfhFROKiDGF2yF/n6bvCHnmHvE0eWvj5pH3d9DlJIttWDOvS3+llfUubRn3tgkrwz+qG0HNV3heerbFBvY34quMa7ABXMB56pYS4V92g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510067; c=relaxed/simple;
	bh=yp6cq73p/uk1O1TFJ6RmBr3+yKelBL1anGwU/ljcG6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=myYBNXg74fkyo506ImjN3ScmwgJvSh0Uvlz2Kv8EI9a93KAagOMWa5TlipYUveSPKr01gZh9fbBq4S+yHSII+dUMiDq/GKhi6LXg30R17IGIGJEMMt/h7pbiRZ4mMsLYtiXSv4FNJagnApweyCiqnEkZJcANALjZ5QmuBEHbXMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMpEQGpu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769510066; x=1801046066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yp6cq73p/uk1O1TFJ6RmBr3+yKelBL1anGwU/ljcG6o=;
  b=JMpEQGpu3HWrQUCdDRbXOZgNPSv+CJm50bMKAHsLlQiJdeA6eS3+KfeO
   XdQdRmg0iro2OGgesnVyKdpVAk+wDEC8zznCIzqM6eROkMiLSFnz6oGBM
   xNP3Iq82oaicG0iv6nLX78FKN3bemVpHHyzbeNADg50eNi8zAsHvIESIl
   IBKHAPkrXhvCc34iNLBt/+j8+IJgKy/tzn38E3BRaIxWw3BNv9qb0C5pI
   Qsf523eJsonDYUtEBSBLwWhCgtD50nAOjQPEfW/1RqCa/RrWDvJkn55c0
   4XlQLsC1hp3kr8ZNbkDP4y4HvkY6Ofrqv8G1bViw9TrJlA7Wk1ucHPe6G
   g==;
X-CSE-ConnectionGUID: QQELSTuyQVWlFVpv/l9XBg==
X-CSE-MsgGUID: PaUKmJbxQbarkEpPUHq+cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88117951"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="88117951"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:34:26 -0800
X-CSE-ConnectionGUID: wpXaZd6zQ2acKug1vMjGgg==
X-CSE-MsgGUID: d5ofc/8MQlSgLTZZozAtjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207069724"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 27 Jan 2026 02:33:28 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9DDA89D; Tue, 27 Jan 2026 11:33:26 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v1 3/3] pinctrl: core: Remove duplicate error messages
Date: Tue, 27 Jan 2026 11:32:08 +0100
Message-ID: <20260127103325.3925173-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
References: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31153-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: B6B0A92E16
X-Rspamd-Action: no action

pinctrl_claim_hogs() is covered to report any error via message.
Since that it's not needed in the callers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index ebf803bff867..342bda2a1bd6 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2187,10 +2187,8 @@ int pinctrl_enable(struct pinctrl_dev *pctldev)
 	int error;
 
 	error = pinctrl_claim_hogs(pctldev);
-	if (error) {
-		dev_err(pctldev->dev, "could not claim hogs: %i\n", error);
+	if (error)
 		return error;
-	}
 
 	mutex_lock(&pinctrldev_list_mutex);
 	list_add_tail(&pctldev->node, &pinctrldev_list);
-- 
2.50.1


