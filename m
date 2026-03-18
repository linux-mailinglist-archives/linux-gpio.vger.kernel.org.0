Return-Path: <linux-gpio+bounces-33759-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IMzIBXGumlobwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33759-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 16:34:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 894942BE4FB
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 16:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A583C31CBC7F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767403E63BA;
	Wed, 18 Mar 2026 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aomogoQb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2543E3D84;
	Wed, 18 Mar 2026 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846784; cv=none; b=lBTFavYEyI8HqohQsSoxajNzrBuufTGL4+8VJLJLG1pOtR7G1oPBvlHMKzFHdJz2j3rrrWI33TXTUCWktJfm0zxdNUIba4mthYeWNPZso3ZPIpoKe+UkQ8WCopYbrEYGAYvy6JgfcN+IvI/wF/NKy4Tl8q7CZ+/XZPhyIJ4NdrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846784; c=relaxed/simple;
	bh=51fda7QAM30p08uZhu0wEnvSa6RBIXMTfne4HtjqSOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qzouxbj56fr6AUnqqwD9OD31gNh2qnhmzy3AXNYUiuCUU+F7x8gZWqeK8fKGdOirleAr4kplHb+PkvgfTsDkqNuP7WifsIU4AutWi02w6BQQ9Aiq6pbZPJ8SkXCvrlnH+d/ise8zp56CvD9WVyNyfKE7IsgP4P9hXn5wufvV3Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aomogoQb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773846782; x=1805382782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=51fda7QAM30p08uZhu0wEnvSa6RBIXMTfne4HtjqSOU=;
  b=aomogoQbWVCHdR3BNDNrOu2dB+i1XLRKYef1spdUGjAsLGJcdos646LW
   dGhMZZIQIriEUJccm7NlGdHr3CaUle8vc+5PKHNXjhqxCMUalurUnhkHo
   Ceizj0L+622W7kAwp/evIQESZ9NLw4Nl97dBVhKb6P8KiFRZSRYfdc4Cp
   p6ldti5II3yznG5vxf9zCGeEVY8l4kazZnW1KLvU7dwWPTBFsvdeQdxlk
   eF48XsqnfLQZ8ZHIdw+UZhXsgXSSILAGsjhU3rbvhGGOfrs4ZdlMtKQ7s
   CI5ii87eNMEo1+y1C7jGZRz09Lq0y64TG7zsWTv1d6sR++mV8INYccSSP
   A==;
X-CSE-ConnectionGUID: DfMjp/nKTJGh+fwlZcWyWw==
X-CSE-MsgGUID: wjzCImMhSwaEWHGGekHTsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75084536"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="75084536"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 08:13:01 -0700
X-CSE-ConnectionGUID: yyRuOcozQ3+CuIjP1kL/cQ==
X-CSE-MsgGUID: IVSCc0f8SGGvDumF8RF6tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="247122451"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2026 08:12:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1D1BFA1; Wed, 18 Mar 2026 16:12:58 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 4/5] pinctrl: intel: Refactor intel_gpio_add_pin_ranges() to make it shorter
Date: Wed, 18 Mar 2026 16:10:18 +0100
Message-ID: <20260318151256.2590375-5-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33759-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 894942BE4FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refactor intel_gpio_add_pin_ranges() to make it shorter in binary
and source formats.

Function                                     old     new   delta
intel_gpio_add_pin_ranges                    219     215      -4
Total: Before=15522, After=15518, chg -0.03%

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 97bf5ec78db4..7311b787dfc6 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1361,16 +1361,15 @@ static int intel_gpio_irq_init_hw(struct gpio_chip *gc)
 int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
 {
 	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
+	const struct device *dev = pctrl->dev;
 	const struct intel_community *community;
 	const struct intel_padgroup *grp;
 	int ret;
 
 	for_each_intel_gpio_group(pctrl, community, grp) {
-		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
-					     grp->gpio_base, grp->base,
-					     grp->size);
+		ret = gpiochip_add_pin_range(gc, dev_name(dev), grp->gpio_base, grp->base, grp->size);
 		if (ret)
-			return dev_err_probe(pctrl->dev, ret, "failed to add GPIO pin range\n");
+			return dev_err_probe(dev, ret, "failed to add GPIO pin range\n");
 	}
 
 	return 0;
-- 
2.50.1


