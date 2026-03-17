Return-Path: <linux-gpio+bounces-33617-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A/mKKgvuWkYuAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33617-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:40:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 531952A81A6
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D1823046201
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15013A8720;
	Tue, 17 Mar 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QD2FTsD1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6223A6F1D;
	Tue, 17 Mar 2026 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743904; cv=none; b=Q1oEN7QiB6RcsF8I3srWF+sTr2EVbqcdjQJsKdS0h7iuz2Ozl0DbIq+UvQEPVYD5fuDPkVKQFY5zRNmDj7mZ4MYqr0enQwq6XMxJaTBXUKkvPTxegIlSJNKZgwZkHHWZZazYL3bD+EgHJwznpQPEAYKGF2HQfvu2HYJXJaEPnWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743904; c=relaxed/simple;
	bh=T0SRPM6/sTrNxUml9I3UmGm3cDD5/1UB3PFQKW7oWh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3xJ2aOVnhHYMujolrEt4pRabtOG30kjU2TVArcncR+q6HuYC72YQ64Gu0LOLXou+N72RJ8WTVy1TKX2TtW2evxUyxM5vKWcwptuniQhroHwh/SeB+g09HK4V0f3CpUGbEPyVlTPfORvFf65tb055XDEfqzhkvF5JD08H+/xhf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QD2FTsD1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773743903; x=1805279903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T0SRPM6/sTrNxUml9I3UmGm3cDD5/1UB3PFQKW7oWh4=;
  b=QD2FTsD1G2zln3aTVYHjQ7Br4pKTHr2BkQuWnHv9H7bEddPpVP7sS2yS
   8lD4hevdgpeii7TuliuB4z14XbneELAnh4fsyMDKvAUMXIJaL1aI2VlIO
   17N9AKrClEi6L/D9wy6JwZv1k6F3T1B8UYvJZ5M4KZWFU3rw5xuaHL5R7
   ss7LxkEM+VZda4B6JEFnppVu1TN9nLX5lWbuFgrYhARMYghJiqXCLMsXR
   vQZ5VCmWoRPQpH+8Qrm9lMH3W3E9rtN5xBjsnac4wwqgZhdEVnkT4BkUb
   A/usC6bJcbNcZ0i2imxE67lk97sBK/rZnZFV+fusgQDtSKixxv/AYUJ7c
   w==;
X-CSE-ConnectionGUID: CZP8kqFASsq0xnfLcRO6qw==
X-CSE-MsgGUID: Fb8FMCShTyy7zttvxQr5sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74889861"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74889861"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:38:20 -0700
X-CSE-ConnectionGUID: elcTDcIBTxWjQEVRPH+hfQ==
X-CSE-MsgGUID: vC+o2wEnTaGgtLYHaFhNSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="245243179"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 17 Mar 2026 03:38:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3E53C9B; Tue, 17 Mar 2026 11:38:18 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] pinctrl: pinconf-generic: Validate fwnode instead of device node
Date: Tue, 17 Mar 2026 11:36:12 +0100
Message-ID: <20260317103817.1982584-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317103817.1982584-1-andriy.shevchenko@linux.intel.com>
References: <20260317103817.1982584-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33617-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 531952A81A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently we convert device node to fwnode in the
pinconf_generic_parse_dt_config() and then validate the device node.
This is confusing order. Instead, assign fwnode and validate it.

Fixes: e002d162654b ("pinctrl: pinconf-generic: Use only fwnode API in parse_dt_cfg()")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinconf-generic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index d0b825ff52db..0ed57720ae61 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -377,12 +377,13 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 				    unsigned long **configs,
 				    unsigned int *nconfigs)
 {
-	struct fwnode_handle *fwnode = of_fwnode_handle(np);
 	unsigned long *cfg;
 	unsigned int max_cfg, ncfg = 0;
+	struct fwnode_handle *fwnode;
 	int ret;
 
-	if (!np)
+	fwnode = of_fwnode_handle(np);
+	if (!fwnode)
 		return -EINVAL;
 
 	/* allocate a temporary array big enough to hold one of each option */
-- 
2.50.1


