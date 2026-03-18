Return-Path: <linux-gpio+bounces-33762-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAJ5DIzDumkGbgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33762-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 16:23:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B642BE1FE
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 16:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB7E132BFCBE
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41D83E8678;
	Wed, 18 Mar 2026 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8B1/GOa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875DB3E63BD;
	Wed, 18 Mar 2026 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846787; cv=none; b=gDjQyCY+PBSETpplXuSxdlc1mLpEcJGG38iFgQ5iBUhnpz221Y96duE/dmJsw61gv94x9MyLAhk0oFyCaPprVkeiO0bjKUPru4OqJnyYuBV3OFv18aZj60n6XC+lHLKK3CgoQm9PtJ2jUDHQ5k3e4mZGd7H+0YQiwYLnRR0TNu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846787; c=relaxed/simple;
	bh=7mKQR6uTf2Wsf//NUwbsAaj+ayneo7o3k7ijJkC7Gqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aW/rdSJ9hYcSPF2H61i/ieIcYNESCXjoIoxICzKbaNyHldlHnGa49qkQhdI/AIRjNco9GtF2YVHDDmmWGZyF2Qy4n78XoFk07yaDn4JHt+Fj6aeuJ8zBjSMpMpL0dnrxT96nPUlghA88vq8wCYG7wHK8UV5fkKnWzVnQK9TRAoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8B1/GOa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773846785; x=1805382785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7mKQR6uTf2Wsf//NUwbsAaj+ayneo7o3k7ijJkC7Gqg=;
  b=T8B1/GOa1rP8YrMgJaka5wgxyhUZ9StNopJ+CvPn6qZ+P6KSMB+mMCQ1
   MoiI/9KyMvYuTf5sDyrjohI8bI4AEEE0qrPpFTvzI4k6nwPl57gfHAdAw
   wgFskzRK7vwCQyKnA1hyemQExLNX3W5M6BFoMbWNK4mOsPPNEaNRg73WK
   t4WToOa+KYG69MkklY+AbUgiXWX5dbkqO46En1EIekFPxBbM2KaJmNaTv
   qHS6FnFKNf1MnTCWI/Cat2N9I/BDv9vTIeHOIMQZONbXJGbRMI9owehsF
   WfAlGgTIB46FX2l3hwt63GMohLBNbolQO3xiAbnYOhunD7PWxC9hH1MBH
   w==;
X-CSE-ConnectionGUID: bKzhH/+vQHmSjo0pN0JwtQ==
X-CSE-MsgGUID: Xr+4GNUSSfiQgeVs6bjfvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75084542"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="75084542"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 08:13:02 -0700
X-CSE-ConnectionGUID: AUdx3uOuRc63fPqVlBQQuQ==
X-CSE-MsgGUID: kXsgylgVS++3PGq6F02fCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="247122452"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2026 08:12:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 18AFD9E; Wed, 18 Mar 2026 16:12:58 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 3/5] pinctrl: intel: Enable 3-bit PAD_OWN feature
Date: Wed, 18 Mar 2026 16:10:17 +0100
Message-ID: <20260318151256.2590375-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33762-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 82B642BE1FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Starting from revision 1.1 of the Chassis specification the PAD_OWN
is represented by 3 bits instead of 2 bits in the previous revisions.
Update the driver to support this feature.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 21 ++++++++++++++++-----
 drivers/pinctrl/intel/pinctrl-intel.h |  1 +
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index a5a264ba6fbb..97bf5ec78db4 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -203,19 +203,25 @@ static bool intel_pad_owned_by_host(const struct intel_pinctrl *pctrl, unsigned
 	community = intel_get_community(pctrl, pin);
 	if (!community)
 		return false;
-	if (!community->padown_offset)
+
+	/* If padown_offset is not provided, assume host ownership */
+	padown = community->regs + community->padown_offset;
+	if (padown == community->regs)
 		return true;
 
+	/* New HW generations have extended PAD_OWN registers */
+	if (community->features & PINCTRL_FEATURE_3BIT_PAD_OWN)
+		return !(readl(padown + pin_to_padno(community, pin) * 4) & 7);
+
 	padgrp = intel_community_get_padgroup(community, pin);
 	if (!padgrp)
 		return false;
 
 	gpp_offset = padgroup_offset(padgrp, pin);
 	gpp = PADOWN_GPP(gpp_offset);
-	offset = community->padown_offset + padgrp->padown_num * 4 + gpp * 4;
-	padown = community->regs + offset;
+	offset = padgrp->padown_num * 4 + gpp * 4;
 
-	return !(readl(padown) & PADOWN_MASK(gpp_offset));
+	return !(readl(padown + offset) & PADOWN_MASK(gpp_offset));
 }
 
 static bool intel_pad_acpi_mode(const struct intel_pinctrl *pctrl, unsigned int pin)
@@ -1597,6 +1603,7 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 		struct intel_community *community = &pctrl->communities[i];
 		unsigned short capability_offset[6];
 		void __iomem *regs;
+		u32 revision;
 		u32 offset;
 		u32 value;
 
@@ -1611,10 +1618,14 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 		value = readl(regs + REVID);
 		if (value == ~0u)
 			return -ENODEV;
-		if (((value & REVID_MASK) >> REVID_SHIFT) >= 0x92) {
+
+		revision = (value & REVID_MASK) >> REVID_SHIFT;
+		if (revision >= 0x092) {
 			community->features |= PINCTRL_FEATURE_DEBOUNCE;
 			community->features |= PINCTRL_FEATURE_1K_PD;
 		}
+		if (revision >= 0x110)
+			community->features |= PINCTRL_FEATURE_3BIT_PAD_OWN;
 
 		/* Determine community features based on the capabilities */
 		offset = CAPLIST;
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 2f37109d5860..b5476b9de0db 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -150,6 +150,7 @@ struct intel_community {
 #define PINCTRL_FEATURE_PWM		BIT(3)
 #define PINCTRL_FEATURE_BLINK		BIT(4)
 #define PINCTRL_FEATURE_EXP		BIT(5)
+#define PINCTRL_FEATURE_3BIT_PAD_OWN	BIT(6)
 
 #define __INTEL_COMMUNITY(b, s, e, g, n, gs, gn, soc)		\
 	{							\
-- 
2.50.1


