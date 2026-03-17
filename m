Return-Path: <linux-gpio+bounces-33614-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FsaFeUwuWn4uAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33614-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:45:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B7E2A830A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFE7B30E26CC
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDD33A6EFB;
	Tue, 17 Mar 2026 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YyvT5L48"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B6A372B2D;
	Tue, 17 Mar 2026 10:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743902; cv=none; b=oQOMurWYkHVFR4xKuLPWCu9uSOuhva0Hdx+tVEwr1mjjb9U70d9cTFF3Ttn+5OkMna+ZA5xzD3hn/57xYm7gRuejV9/n1jbGlp7rTdoOtVKTKrflq9QIOk8LEGrojOY4qgSm+V5ifw/Thrxe5X3NP+fLnpdPhvcaC8hHasq7k7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743902; c=relaxed/simple;
	bh=x68RDYlGTfvYu8lOql1gO5B3Aj+IyfxAdN+QGhbOWjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TgNK4Kic4oR2736FATxfmyz7o4kptq20/qBPcQfWEKhvqe7/xlE4+20cL3Bsv8xy/0za7gWYjcR//4KGDtpcIkG5l2QZmj/BcfximKEnWE48d3cyKiYIExGXc9K2WY+fbQUxiyaITIR9gr+aCKX/YtO1jm8Zma1k+32sUfgP8Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YyvT5L48; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773743901; x=1805279901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x68RDYlGTfvYu8lOql1gO5B3Aj+IyfxAdN+QGhbOWjM=;
  b=YyvT5L48Mwr+MrZKXyhRWhO4OVl9n3snjyZCilJkYpRjqaaU/HUl8shT
   38U25iNUOFkjYTI6kVnaXtkUGUBqYdc+lQfc9RaVZhwQ9BeOzDi24x86O
   51J6aanZTJqU82kqOUeNhFHPNR7U59OIHWJLc1ojlanm8OWRGELYiSZtK
   f2570UkiLmrrNCDwh+EifIbuZ5OZ/hXXjyUN6gOa2D3TcgR8x3v+GhNVa
   U2r3oZsky/w1SmKDorPc+zwCFS4gLXi6inGwUbjUMLCTGEEEZbAxvfLQk
   HxF3UPnL8W1JHDiR6/hVE7VZCXwVp8fxxFuPIe4JuJk5tPfvzg84ACldE
   w==;
X-CSE-ConnectionGUID: PfS1hrhwRre/W3Mor3gkqA==
X-CSE-MsgGUID: YRhnuYgCS7KFZP7erHIMtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74659056"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74659056"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:38:21 -0700
X-CSE-ConnectionGUID: gomoqs+8RKCpSfEgPdpXHg==
X-CSE-MsgGUID: yt5QwSVkRgq6Be4z/l1+Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="252713535"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 17 Mar 2026 03:38:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3A3D099; Tue, 17 Mar 2026 11:38:18 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] pinctrl: pinconf-generic: Fully validate 'pinmux' property
Date: Tue, 17 Mar 2026 11:36:11 +0100
Message-ID: <20260317103817.1982584-2-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33614-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: A7B7E2A830A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pinconf_generic_parse_dt_pinmux() assumes that the 'pinmux' property
is not empty when present. This might be not true. With that, the allocator
will give a special value in return and not NULL which lead to the crash
when trying to access that (invalid) memory. Fix that by fully validating
'pinmux' value, including its length.

Fixes: 7112c05fff83 ("pinctrl: pinconf-generic: Add API for pinmux propertity in DTS file")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinconf-generic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 61b5b3fb94ce..d0b825ff52db 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -325,12 +325,17 @@ int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
 		return -ENOENT;
 	}
 
+	npins_t = prop->length / sizeof(u32);
+	if (npins_t == 0) {
+		dev_info(dev, "pinmux property doesn't have entries\n");
+		return -ENODATA;
+	}
+
 	if (!pid || !pmux || !npins) {
 		dev_err(dev, "parameters error\n");
 		return -EINVAL;
 	}
 
-	npins_t = prop->length / sizeof(u32);
 	pid_t = devm_kcalloc(dev, npins_t, sizeof(*pid_t), GFP_KERNEL);
 	pmux_t = devm_kcalloc(dev, npins_t, sizeof(*pmux_t), GFP_KERNEL);
 	if (!pid_t || !pmux_t) {
-- 
2.50.1


