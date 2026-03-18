Return-Path: <linux-gpio+bounces-33764-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJDqFdLBumm6bgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33764-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 16:16:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C00872BE040
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 16:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7255830584D2
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9916B3E95AC;
	Wed, 18 Mar 2026 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4qPid2+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E135C3E7155;
	Wed, 18 Mar 2026 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846789; cv=none; b=hq6BpYdsQRg+U/dYbiFNiC7y6Xynsuz975lffnQkPz7DyVa0LWvLChkB8PspcbR8XnVRlQsUAmBoRKb6pbGpwYOGjD0DgpPO1qxdAiCJ6Zp0xdFbLMU8RrOvuifkNZy4Zi11RKvsCs8wE9fuke6+xX1a8lnfaDQBDSlDDAen8R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846789; c=relaxed/simple;
	bh=wF4iUZV76f7W3PXuwWxNV/7Gg0YYVO8Px9yNm4Hmdq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJP/TGG1AnhqtQ56he6WUMLnzQdBIf4OIfQuNQ5FR+4Oc4xOWBqx82et/lLy5IIFVWoJ6OoRY3IfZHyDnwBLfRUk9yQxOOD68XPGvLuUlW9oaSOMSeEbjWmsxBaI/5i6qkX4SwzHnmtf+yWUPtTxtR/KuMIoU5QbEkS/tG+yQzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4qPid2+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773846787; x=1805382787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wF4iUZV76f7W3PXuwWxNV/7Gg0YYVO8Px9yNm4Hmdq0=;
  b=h4qPid2+F/Qt8b6LLFS0xWK5cwHS4j8KW2LJs/IJZjEixEwVWhNIMuot
   kTrjsmrx/2rRcCUKojRHyeQ09yxT6Gj1jQ2M2aNEw33VVFre48JOMNVwx
   65Sqc2tBRbInp2QwkQVKCdHh3Tg9iDFQkBNLPzJo5vWpPPZ3IPeaE8jcW
   /eelZw0Y5+/3QzKBcRS19bZHKcJhGPnpQd+uMDtpMqzR1pBxKbLybZ1UM
   skkONboYMnJFlOESmvgM9AFkg7T0595CR3BcIeSVM2KOGUe6myIq+4aSm
   6A2bDuEfBzabs6lmK4KAUlPbMd8FpCq5lQVSo4HlC1B2GWZtJkQkToiXE
   g==;
X-CSE-ConnectionGUID: VviiMuL0QV2WshtWPXKb7g==
X-CSE-MsgGUID: ruKh1qALRsq85MMW022Efg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75084547"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="75084547"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 08:13:03 -0700
X-CSE-ConnectionGUID: l+khbGIXTJyimFpL2g8fCQ==
X-CSE-MsgGUID: eBhFSEgOTQyilBQdH4U1qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="247122458"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2026 08:13:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 219E7A2; Wed, 18 Mar 2026 16:12:58 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 5/5] pinctrl: intel: define iterator variables inside for-loop
Date: Wed, 18 Mar 2026 16:10:19 +0100
Message-ID: <20260318151256.2590375-6-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33764-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: C00872BE040
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Reduce the scope of the iterator variables by defining them inside
the respective for-loops. This makes code more robust against reuse
of the same variable in the future, which might lead to some mistakes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 44 ++++++++++++---------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 7311b787dfc6..c506f9f343c3 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -431,7 +431,6 @@ static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct intel_pingroup *grp = &pctrl->soc->groups[group];
-	int i;
 
 	guard(raw_spinlock_irqsave)(&pctrl->lock);
 
@@ -439,13 +438,13 @@ static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	 * All pins in the groups needs to be accessible and writable
 	 * before we can enable the mux for this group.
 	 */
-	for (i = 0; i < grp->grp.npins; i++) {
+	for (unsigned int i = 0; i < grp->grp.npins; i++) {
 		if (!intel_pad_usable(pctrl, grp->grp.pins[i]))
 			return -EBUSY;
 	}
 
 	/* Now enable the mux setting for each pin in the group */
-	for (i = 0; i < grp->grp.npins; i++) {
+	for (unsigned int i = 0; i < grp->grp.npins; i++) {
 		void __iomem *padcfg0;
 		u32 value, pmode;
 
@@ -909,12 +908,12 @@ static int intel_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			  unsigned long *configs, unsigned int nconfigs)
 {
 	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	int i, ret;
+	int ret;
 
 	if (!intel_pad_usable(pctrl, pin))
 		return -ENOTSUPP;
 
-	for (i = 0; i < nconfigs; i++) {
+	for (unsigned int i = 0; i < nconfigs; i++) {
 		switch (pinconf_to_config_param(configs[i])) {
 		case PIN_CONFIG_BIAS_DISABLE:
 		case PIN_CONFIG_BIAS_PULL_UP:
@@ -1323,9 +1322,8 @@ static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
 
 	for_each_intel_pin_community(pctrl, community) {
 		void __iomem *reg, *is;
-		unsigned int gpp;
 
-		for (gpp = 0; gpp < community->ngpps; gpp++) {
+		for (unsigned int gpp = 0; gpp < community->ngpps; gpp++) {
 			reg = community->regs + community->ie_offset + gpp * 4;
 			is = community->regs + community->is_offset + gpp * 4;
 
@@ -1436,14 +1434,14 @@ static int intel_pinctrl_add_padgroups_by_gpps(struct intel_pinctrl *pctrl,
 					       struct intel_community *community)
 {
 	struct intel_padgroup *gpps;
+	unsigned int ngpps = community->ngpps;
 	unsigned int padown_num = 0;
-	size_t i, ngpps = community->ngpps;
 
 	gpps = devm_kcalloc(pctrl->dev, ngpps, sizeof(*gpps), GFP_KERNEL);
 	if (!gpps)
 		return -ENOMEM;
 
-	for (i = 0; i < ngpps; i++) {
+	for (unsigned int i = 0; i < ngpps; i++) {
 		gpps[i] = community->gpps[i];
 
 		if (gpps[i].size > INTEL_PINCTRL_MAX_GPP_SIZE)
@@ -1476,18 +1474,18 @@ static int intel_pinctrl_add_padgroups_by_size(struct intel_pinctrl *pctrl,
 					       struct intel_community *community)
 {
 	struct intel_padgroup *gpps;
-	unsigned int npins = community->npins;
+	unsigned int npins = community->npins, ngpps;
 	unsigned int padown_num = 0;
-	size_t i, ngpps = DIV_ROUND_UP(npins, community->gpp_size);
 
 	if (community->gpp_size > INTEL_PINCTRL_MAX_GPP_SIZE)
 		return -EINVAL;
 
+	ngpps = DIV_ROUND_UP(npins, community->gpp_size);
 	gpps = devm_kcalloc(pctrl->dev, ngpps, sizeof(*gpps), GFP_KERNEL);
 	if (!gpps)
 		return -ENOMEM;
 
-	for (i = 0; i < ngpps; i++) {
+	for (unsigned int i = 0; i < ngpps; i++) {
 		unsigned int gpp_size = community->gpp_size;
 
 		gpps[i].reg_num = i;
@@ -1513,7 +1511,6 @@ static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
 	const struct intel_pinctrl_soc_data *soc = pctrl->soc;
 	struct intel_community_context *communities;
 	struct intel_pad_context *pads;
-	int i;
 
 	pads = devm_kcalloc(pctrl->dev, soc->npins, sizeof(*pads), GFP_KERNEL);
 	if (!pads)
@@ -1525,7 +1522,7 @@ static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
 		return -ENOMEM;
 
 
-	for (i = 0; i < pctrl->ncommunities; i++) {
+	for (unsigned int i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
 		u32 *intmask, *hostown;
 
@@ -1578,7 +1575,7 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct intel_pinctrl *pctrl;
-	int i, ret, irq;
+	int ret, irq;
 
 	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
 	if (!pctrl)
@@ -1598,7 +1595,7 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 	if (!pctrl->communities)
 		return -ENOMEM;
 
-	for (i = 0; i < pctrl->ncommunities; i++) {
+	for (unsigned int i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
 		unsigned short capability_offset[6];
 		void __iomem *regs;
@@ -1806,10 +1803,9 @@ static int intel_pinctrl_suspend_noirq(struct device *dev)
 	struct intel_pinctrl *pctrl = dev_get_drvdata(dev);
 	struct intel_community_context *communities;
 	struct intel_pad_context *pads;
-	int i;
 
 	pads = pctrl->context.pads;
-	for (i = 0; i < pctrl->soc->npins; i++) {
+	for (unsigned int i = 0; i < pctrl->soc->npins; i++) {
 		const struct pinctrl_pin_desc *desc = &pctrl->soc->pins[i];
 		void __iomem *padcfg;
 		u32 val;
@@ -1828,7 +1824,7 @@ static int intel_pinctrl_suspend_noirq(struct device *dev)
 	}
 
 	communities = pctrl->context.communities;
-	for (i = 0; i < pctrl->ncommunities; i++) {
+	for (unsigned int i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
 		void __iomem *base;
 		unsigned int gpp;
@@ -1915,13 +1911,12 @@ static int intel_pinctrl_resume_noirq(struct device *dev)
 	struct intel_pinctrl *pctrl = dev_get_drvdata(dev);
 	const struct intel_community_context *communities;
 	const struct intel_pad_context *pads;
-	int i;
 
 	/* Mask all interrupts */
 	intel_gpio_irq_init(pctrl);
 
 	pads = pctrl->context.pads;
-	for (i = 0; i < pctrl->soc->npins; i++) {
+	for (unsigned int i = 0; i < pctrl->soc->npins; i++) {
 		const struct pinctrl_pin_desc *desc = &pctrl->soc->pins[i];
 
 		if (!(intel_pinctrl_should_save(pctrl, desc->number) ||
@@ -1938,17 +1933,16 @@ static int intel_pinctrl_resume_noirq(struct device *dev)
 	}
 
 	communities = pctrl->context.communities;
-	for (i = 0; i < pctrl->ncommunities; i++) {
+	for (unsigned int i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
 		void __iomem *base;
-		unsigned int gpp;
 
 		base = community->regs + community->ie_offset;
-		for (gpp = 0; gpp < community->ngpps; gpp++)
+		for (unsigned int gpp = 0; gpp < community->ngpps; gpp++)
 			intel_restore_intmask(pctrl, i, base, gpp, communities[i].intmask[gpp]);
 
 		base = community->regs + community->hostown_offset;
-		for (gpp = 0; gpp < community->ngpps; gpp++)
+		for (unsigned int gpp = 0; gpp < community->ngpps; gpp++)
 			intel_restore_hostown(pctrl, i, base, gpp, communities[i].hostown[gpp]);
 	}
 
-- 
2.50.1


