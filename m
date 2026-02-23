Return-Path: <linux-gpio+bounces-32069-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPmGGaGZnGmKJgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32069-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:17:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8AF17B667
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D6103092C26
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC79533B961;
	Mon, 23 Feb 2026 18:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7Ro6+je"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A2733D517;
	Mon, 23 Feb 2026 18:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870148; cv=none; b=ZoKuao+e9uRZsiKolWVJpze2NAh0pSntF2Lo2b3WhjKwEAW2KNAjoH1mpUhvFV1rdUY/uTEu9PZvunv1ctKNBDXUax5Ystd1YOI9I2i9OfqOHAHAeCpJNQl+8wkt3RHh5F0gWfNU34OIxf9L9xS+K4Elk04ugsf2PMqqbC9JrlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870148; c=relaxed/simple;
	bh=bYfy7MGbL+AsPQ8NsOQsXW3VwjWAqzP7tT/C4sucMUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VzlVUoEZHSLmsYwJLf80JzpY+iVfI92xMkGgWNm2pLCbsgBSASKrKyTYnhQi5d5KzcMclfb6TlXfu4pNQQWXa03FnD75adwzGj8/7bXOvAwZ9kEGkzPPmw2r4xCKuR8PJire5gG41zxSpw/m2407nDDZqjZQOT9RJk4mAHlKKfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7Ro6+je; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771870147; x=1803406147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bYfy7MGbL+AsPQ8NsOQsXW3VwjWAqzP7tT/C4sucMUw=;
  b=L7Ro6+jexZFpOSC+ZZt/kLuiOK+tAN/XL/dbm7XcVu27nb4WwKeSiprd
   9QKEKp4hVkTYIBX+hdTHeQXMAEuIevAodn3fdqSqUCHaePr/HrT7m/fSq
   RecQUTU9ihPVvqZlpENROGgGgeKqTHAmKXPDOgKSMFXrfbga0Mn7+69Nv
   KIKXlmVJEx00OkmiZwFrEmbjfTTool1JOUYzfIp7F2s8ZMQWpWXNZqBgM
   Ia5DWadbiOhZonKXK96YIrZrf+yqgTBh8EzlK5p6wKdoo5gpT6ui+h8sd
   cWTpa12vSmH9/BySbDtK+Us0qDscIp8JHDuwqOy76NjIfHjfmXXGzbkQt
   A==;
X-CSE-ConnectionGUID: BJM9seWhS/i6cC1nNmpxyw==
X-CSE-MsgGUID: LIiBp42yR+i4v0SlJapa/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76737708"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="76737708"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 10:09:05 -0800
X-CSE-ConnectionGUID: FKVmGD3lSvuUZ1MjTC8cyg==
X-CSE-MsgGUID: RSJDdxcpTGmNt0oHgXJokA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="253369516"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 23 Feb 2026 10:09:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3B8C6A2; Mon, 23 Feb 2026 19:09:01 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 6/8] pinctrl: cy8c95x0: Drop unused 'name' in struct cy8c95x0_pinctrl
Date: Mon, 23 Feb 2026 19:06:56 +0100
Message-ID: <20260223180859.2845261-7-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32069-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: BF8AF17B667
X-Rspamd-Action: no action

The 'name' is only assigned and never used. Drop it for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 4f804a9358b7..0bcc9ac19696 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -147,7 +147,6 @@ static const struct dmi_system_id cy8c95x0_dmi_acpi_irq_info[] = {
  * @dev:            struct device
  * @pctldev:        pin controller device
  * @pinctrl_desc:   pin controller description
- * @name:           Chip controller name
  * @tpin:           Total number of pins
  * @gpio_reset:     GPIO line handler that can reset the IC
  */
@@ -167,7 +166,6 @@ struct cy8c95x0_pinctrl {
 	struct device *dev;
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_desc pinctrl_desc;
-	char name[32];
 	unsigned int tpin;
 	struct gpio_desc *gpio_reset;
 };
@@ -1414,15 +1412,12 @@ static int cy8c95x0_probe(struct i2c_client *client)
 
 	switch (chip->tpin) {
 	case 20:
-		strscpy(chip->name, cy8c95x0_id[0].name);
 		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 3 * MUXED_STRIDE - 1;
 		break;
 	case 40:
-		strscpy(chip->name, cy8c95x0_id[1].name);
 		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 6 * MUXED_STRIDE - 1;
 		break;
 	case 60:
-		strscpy(chip->name, cy8c95x0_id[2].name);
 		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 8 * MUXED_STRIDE - 1;
 		break;
 	default:
-- 
2.50.1


