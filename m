Return-Path: <linux-gpio+bounces-33135-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAQDHdhssWlVvAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33135-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:23:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C93072646AD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6A7E30F15BC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086DC3101A6;
	Wed, 11 Mar 2026 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nluFX0cR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26E12FE575;
	Wed, 11 Mar 2026 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235190; cv=none; b=tsQuqirRIP+1S6kmqa4FxzVjo7Cn0fUOwSpw9BmWCris/2JyT8x4XSzL2WJJ4tfsVkoO7SWJssdhH73BhwoAlNCDQMnCrvO1oPk+7NvVa0a7UpSzDou/6Bwoksmrwph7TquznI8DwQZh74oagNp5/mPf4Yxwfn56R0zqpRQS9Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235190; c=relaxed/simple;
	bh=PHyIEVurNAh8dxKzKN5Zuugg9/nxGw7xTbqPb3W9SSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pu5e2YQpFsepN3InKux7imGleC3deoKRGjCdxYqb0gwevFY5r5aIvxIgubLoCzAxhABjCpoDox0q9Y7cL8h3NjCvaN5RvkibemDEkXEtxUyqhfXOUiHFRA8oANJfNaz5U5ZAqg4de1WWAOyJxSOUYwZbMHgu71bdQSPxGLgxYc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nluFX0cR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773235189; x=1804771189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PHyIEVurNAh8dxKzKN5Zuugg9/nxGw7xTbqPb3W9SSk=;
  b=nluFX0cRvUOy+HtLZJ5VyveZZAmcevooWRODU1R5tloFIR9YeBrJAHaQ
   Zy3yGsIpcu10QHHgiIKWMtrFJCwjWU37f1xRDAdVXeQ2e4SAP8dWJ8eip
   qZ0u7rE+uyS9z9r+Mmvvc7gidhxNjeGLHGpUD+ehoSl+FvdjBxbQtRiZL
   Z6dtrW56y2e3E+ILpLy/0wPLoEew1wnNUD8nCUrkVWq7oOxwxUg0bz55e
   mgT3lI5reW0AvGaRBgt/8Oa+cZEhA7hbsHrRQV34cxEMC7kuzd51PZepO
   7c/qgGOnvSIM9PeTZuGlMAljmQ1mJRjohUBRSpSza/jgyJ51OrOEh0FaD
   w==;
X-CSE-ConnectionGUID: ZczVUHjYSrOmtYtHtBSJZw==
X-CSE-MsgGUID: MbkqX0A2R4mhTItUn9ZMDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74211567"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74211567"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:19:49 -0700
X-CSE-ConnectionGUID: pNPC73VkTjme6GpbiLzetA==
X-CSE-MsgGUID: 4FTu6M85TganqBKAgryLtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217131230"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO alaakso-DESK.intel.com) ([10.245.246.81])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:19:45 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hverkuil+cisco@kernel.org,
	sre@kernel.org,
	hao.yao@intel.com,
	jimmy.su@intel.com,
	miguel.vadillo@intel.com,
	kees@kernel.org,
	ribalda@chromium.org
Subject: [PATCH v2 1/5] media: i2c: ov5675: Wait for endpoint
Date: Wed, 11 Mar 2026 15:19:06 +0200
Message-ID: <20260311131910.835513-2-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311131910.835513-1-antti.laakso@linux.intel.com>
References: <20260311131910.835513-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C93072646AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33135-lists,linux-gpio=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antti.laakso@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Defer probe if endpoint is not yet available. And do it before acquiring
clock, gpio and regulators.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/i2c/ov5675.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index ea26df328189..508149485248 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1181,17 +1181,26 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 	if (!fwnode)
 		return -ENXIO;
 
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
 	ov5675->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
-	if (IS_ERR(ov5675->xvclk))
-		return dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
-				     "failed to get xvclk: %pe\n",
-				     ov5675->xvclk);
+	if (IS_ERR(ov5675->xvclk)) {
+		ret = dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
+				    "failed to get xvclk\n");
+		goto check_hwcfg_error;
+	}
 
 	xvclk_rate = clk_get_rate(ov5675->xvclk);
 	if (xvclk_rate != OV5675_XVCLK_19_2) {
 		dev_err(dev, "external clock rate %u is unsupported",
 			xvclk_rate);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto check_hwcfg_error;
 	}
 
 	ov5675->reset_gpio = devm_gpiod_get_optional(dev, "reset",
@@ -1199,7 +1208,7 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 	if (IS_ERR(ov5675->reset_gpio)) {
 		ret = PTR_ERR(ov5675->reset_gpio);
 		dev_err(dev, "failed to get reset-gpios: %d\n", ret);
-		return ret;
+		goto check_hwcfg_error;
 	}
 
 	for (i = 0; i < OV5675_NUM_SUPPLIES; i++)
@@ -1208,16 +1217,7 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 	ret = devm_regulator_bulk_get(dev, OV5675_NUM_SUPPLIES,
 				      ov5675->supplies);
 	if (ret)
-		return ret;
-
-	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (!ep)
-		return -ENXIO;
-
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
-	fwnode_handle_put(ep);
-	if (ret)
-		return ret;
+		goto check_hwcfg_error;
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV5675_DATA_LANES) {
 		dev_err(dev, "number of CSI2 data lanes %d is not supported",
-- 
2.53.0


