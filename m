Return-Path: <linux-gpio+bounces-33615-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBpcG2AxuWn4uAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33615-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:48:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7BE2A8368
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E96AA302C167
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1C03A6B7E;
	Tue, 17 Mar 2026 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdXmsbtV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2C03A640A;
	Tue, 17 Mar 2026 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743903; cv=none; b=YgQ4G9I0+nz3uy/E2w5RhQmX8cCz6KoV/sXteUACAo0Ppo6G1519Rnt6jfEAVgdlAKw9yS/10XkhFWsMu8f9wS8R4SVFwTQAAkq3A5FdKB+w/F8ahN5ZWipLry+tAcwKppL2DRRmD6c5ofiwGP3Jhjw5A2RsXqBbfuTbXyzo6QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743903; c=relaxed/simple;
	bh=cGzMZ9JtGT36Qn1Zexx/gT8Un2Y2TM5eZ7Egijqx0ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSNE26TDhJtkm9LdeIiXLxMvntM56pwV0kfK5EJWTxVzSp3qhNVdoopsJPaZuDFocvDjP6uTpf6YwaP7CGPN7+r8P3y++EZPe2QuzCq3fF+U1xkRvnOtCWH0VcFvmE4JgSPzjTxEr9rjASDOw567pKe39uZ0/9HzY9dPICUGbbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DdXmsbtV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773743901; x=1805279901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cGzMZ9JtGT36Qn1Zexx/gT8Un2Y2TM5eZ7Egijqx0ls=;
  b=DdXmsbtVZkui/OGoWE8mxWY5bifU2BRq0p24wfnEJro89u+4sVstDikd
   +0mKmyCaiq+umdsH4//xBMQznFRjQNmIYvO1+b9bhqTCn1caGTdqenkMb
   6FL1Wu9CFo4A6HMWqu2qiZ4e0DSC5CQrGtj4+WWTm+WqsJKVyrvnzm2ag
   XcyYGgiSqdvsXDccWGky8Ofovrqq8G2XVvNYGfr0HB4o4qZ3JjmzlO/nK
   fq1EUu8uY7XQVqfiQVfbGZ71IbHEzioy8S60F4ArGQv1kIGe/xjViDWUO
   N9XfC+Vq4rY1xjVo7QIfUFbXUYjh4H/hPcihyqKLwoMVk89A1nwALvqTJ
   Q==;
X-CSE-ConnectionGUID: +ggBJpfuQqKIzeWVgALwBQ==
X-CSE-MsgGUID: oMnVppyDSsKZitGrY6YtRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74889859"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74889859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:38:20 -0700
X-CSE-ConnectionGUID: 3TEEc9qIS3Ka8cMEgkWF4Q==
X-CSE-MsgGUID: bZE3CJ9vTryPKCvsRrWv8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="245243178"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 17 Mar 2026 03:38:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 42D0D9D; Tue, 17 Mar 2026 11:38:18 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] pinctrl: pinconf-generic: Convert ..._parse_dt_pinmux() to fwnode API
Date: Tue, 17 Mar 2026 11:36:13 +0100
Message-ID: <20260317103817.1982584-4-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33615-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C7BE2A8368
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert pinconf_generic_parse_dt_pinmux() to fwnode API. This makes code
cleaner and potentially reusable for some other types of fwnodes, such as
software nodes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinconf-generic.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 0ed57720ae61..88eacd1aa2de 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -312,20 +312,19 @@ int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
 				    unsigned int **pid, unsigned int **pmux,
 				    unsigned int *npins)
 {
+	struct fwnode_handle *fwnode = of_fwnode_handle(np);
 	unsigned int *pid_t;
 	unsigned int *pmux_t;
-	struct property *prop;
 	unsigned int npins_t, i;
-	u32 value;
 	int ret;
 
-	prop = of_find_property(np, "pinmux", NULL);
-	if (!prop) {
+	ret = fwnode_property_count_u32(fwnode, "pinmux");
+	if (ret < 0) {
 		dev_info(dev, "Missing pinmux property\n");
-		return -ENOENT;
+		return ret;
 	}
 
-	npins_t = prop->length / sizeof(u32);
+	npins_t = ret;
 	if (npins_t == 0) {
 		dev_info(dev, "pinmux property doesn't have entries\n");
 		return -ENODATA;
@@ -342,14 +341,16 @@ int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
 		dev_err(dev, "kalloc memory fail\n");
 		return -ENOMEM;
 	}
+
+	ret = fwnode_property_read_u32_array(fwnode, "pinmux", pmux_t, npins_t);
+	if (ret) {
+		dev_err(dev, "get pinmux value fail\n");
+		goto exit;
+	}
+
 	for (i = 0; i < npins_t; i++) {
-		ret = of_property_read_u32_index(np, "pinmux", i, &value);
-		if (ret) {
-			dev_err(dev, "get pinmux value fail\n");
-			goto exit;
-		}
-		pmux_t[i] = value & 0xff;
-		pid_t[i] = (value >> 8) & 0xffffff;
+		pid_t[i] = pmux_t[i] >> 8;
+		pmux_t[i] = pmux_t[i] & 0xff;
 	}
 	*pid = pid_t;
 	*pmux = pmux_t;
-- 
2.50.1


