Return-Path: <linux-gpio+bounces-32066-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCr1DU+YnGluJgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32066-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:11:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C267217B517
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B5373035F5E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D0633D6D6;
	Mon, 23 Feb 2026 18:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UllrOkEF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF6D33C522;
	Mon, 23 Feb 2026 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870147; cv=none; b=cJl2+JBdutkkAg/KUX+owBNrzrDz+pGdFJpL8Qc0V4fyBNpkxQaew9+Ysbl8F1ORer3+b7EUePfWB6oqY34jmckoY3Yq3H8byUPHW5ImGFWiyj6SidqQcgiePwzd5TII8JE3yW02Nr0Hi0SwPr9UYJgPnNybzIvBsTSGUeUv9G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870147; c=relaxed/simple;
	bh=jkuthO0ot5cp48bSHyF5g6iI2H7DlYmMluLOs4PFE2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNJTDE5JcL9hI/O/rJCN0ADVPfouBsH7zuinujaLjsT22a3hZEwpsqwn1fbsos2gSCOoyqum6ueQ8jaOMBqaTn8/F5X0mN/W1eykYUnitTN/ndWR041zEbX9sMmQHic0v05aqQ3R1ousV4FxKsPpXfBUW5s3p/5wloBBRq2+hnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UllrOkEF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771870146; x=1803406146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jkuthO0ot5cp48bSHyF5g6iI2H7DlYmMluLOs4PFE2A=;
  b=UllrOkEFuxKbum15i/WQ0+Byq6HMh7KM6t9oZnY9m1viIY2sfHLqsI3Q
   draNbIhoi45vhcqPNLdZqspJS61aWkcgB7FgG2WeVrghVu+SYbONyC6dc
   +TdWAQViiqAmlrvw+hGHZcoK+isz49TrWm3IhtHa0RFwTK3yYLzCracEK
   swEMzI0gZC6RB2jG2CotWuAJmbBngSboib0a0vAQpLxtrXezTqQaE2Crq
   k8+HHR0jH2q4rL5lYyqmrS8myXorVGqrY5Z4Jl5c64FN+w+b/REZG4wz5
   9Xx0Snbjc/9cDHF8P36tZZEjDk3FrG/s9hP4bwUy24YToJwrtZhlZk4U4
   w==;
X-CSE-ConnectionGUID: fUAYk7uDRSO5t9/5XVUMcw==
X-CSE-MsgGUID: fKGz0gpOS3+80kYx4IAGDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76737699"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="76737699"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 10:09:03 -0800
X-CSE-ConnectionGUID: LZsFadAQRQeZchHMf6FDdQ==
X-CSE-MsgGUID: l7t8hejoQC2KDpd2ZKYgfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="253369511"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 23 Feb 2026 10:09:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3317A9E; Mon, 23 Feb 2026 19:09:01 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 4/8] pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()
Date: Mon, 23 Feb 2026 19:06:54 +0100
Message-ID: <20260223180859.2845261-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260223180859.2845261-1-andriy.shevchenko@linux.intel.com>
References: <20260223180859.2845261-1-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32066-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: C267217B517
X-Rspamd-Action: no action

Unify error messages that might appear during probe phase by
switching to use dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 165ccbda035f..94a599486638 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1321,10 +1321,8 @@ static int cy8c95x0_irq_setup(struct cy8c95x0_pinctrl *chip, int irq)
 
 	/* Read IRQ status register to clear all pending interrupts */
 	ret = cy8c95x0_irq_pending(chip, pending_irqs);
-	if (ret) {
-		dev_err(chip->dev, "failed to clear irq status register\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to clear irq status register\n");
 
 	/* Mask all interrupts */
 	bitmap_fill(chip->irq_mask, MAX_LINE);
-- 
2.50.1


