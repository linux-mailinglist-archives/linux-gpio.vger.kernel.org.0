Return-Path: <linux-gpio+bounces-32993-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YISMKsUhsGkkgQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32993-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:51:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEFE250E30
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E8D0326CF75
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040383E3C43;
	Tue, 10 Mar 2026 12:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iM/o/ptV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D403B47FF;
	Tue, 10 Mar 2026 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146712; cv=none; b=gxUBzMqlWEJnumHu1WvMnP7E1vznbGEe2o9rdVQKwN91NsQnAZYW7mAgJkstzBE1hijwrFnWDr80HyhtkAKKkyB1jfPya+xj1Q5FrNXCi1sZz6EOYYYB+fbRSX3Bbbg/Kilh8ooVqjL33whoDTON3l/UxfMm2egCuieKFq9QrXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146712; c=relaxed/simple;
	bh=1rn86nhgBECvZOeO619kSGbXp+mZw09nRb53WGmwnUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WfFgF/IwtLXT1c+eQRWQuYkxJ6PFwWj5G0by+GFx3r7O1BApDtoqp+uzBMnIPtIf2i+sHRM7E1kG0kUdJsM1FDC5rzG9qwF27H6eiZh8ihoq9YYPCvoGpYFISGJgXyehNLqsW1zy8cEVooiSbsnRxqlHpCh5tAY+vf/W7WM5znM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iM/o/ptV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773146711; x=1804682711;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1rn86nhgBECvZOeO619kSGbXp+mZw09nRb53WGmwnUM=;
  b=iM/o/ptVDZjr7HtImb9uXHSsc6Bn9Y1eBeGI6TZPhCixw4TIEQQMMIYn
   Qe01LyhoUda1EuaiYbF0ufWfIzABbLkr0t7Jcg9RnEmKp74tKY8cy/tuR
   /7rl2EvDSvAPxuQ7AupEUjjhw2sVThwJCLRcu3uB89vGSooCFoOg+1DSa
   okaJ0FGhXoMgJsYvkseIdQ0o/JwnhRdBqiuhNFBDPkKjn/h1p0vQygETM
   lJywEpXTfyqA+fIeNipW2wAdup1kZsyCqIwGG7yuwBkTq2yeBcsC7XtZw
   M2S15Um+iYurcfmKrXYlikjgpSBnreVibi3ugwpdTTuNurKFOvN+j8LHx
   A==;
X-CSE-ConnectionGUID: Ec2qmTfJTxOeP6ebA9mOfw==
X-CSE-MsgGUID: zXjZonyHQQWRsyja/EHo8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74268922"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74268922"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:45:11 -0700
X-CSE-ConnectionGUID: h4kBjhnPRYOrIw6SkbvxBw==
X-CSE-MsgGUID: XPnHU+I9TLqlqZ1g+tswNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="225040211"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO alaakso-DESK.kioski) ([10.245.246.41])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:45:05 -0700
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
	jason.z.chen@intel.com,
	jimmy.su@intel.com,
	miguel.vadillo@intel.com,
	kees@kernel.org,
	ribalda@chromium.org
Subject: [PATCH 1/5] media: i2c: ov5675: Wait for endpoint
Date: Tue, 10 Mar 2026 14:44:23 +0200
Message-ID: <20260310124427.693625-2-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310124427.693625-1-antti.laakso@linux.intel.com>
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6DEFE250E30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32993-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Defer probe if endpoint is not yet available. And do it before acquiring
clock, gpio and regulators.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/i2c/ov5675.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index ea26df328189..81916fa8c117 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1181,6 +1181,13 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
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
 	if (IS_ERR(ov5675->xvclk))
 		return dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
@@ -1210,15 +1217,6 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 	if (ret)
 		return ret;
 
-	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (!ep)
-		return -ENXIO;
-
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
-	fwnode_handle_put(ep);
-	if (ret)
-		return ret;
-
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV5675_DATA_LANES) {
 		dev_err(dev, "number of CSI2 data lanes %d is not supported",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
-- 
2.53.0


