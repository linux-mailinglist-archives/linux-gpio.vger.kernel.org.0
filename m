Return-Path: <linux-gpio+bounces-33137-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLjaEgxssWkuvAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33137-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:20:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB57826456A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AE9E301ABA3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52718316199;
	Wed, 11 Mar 2026 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euXNNuR5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B2330FF20;
	Wed, 11 Mar 2026 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235200; cv=none; b=g/QZpHFa+0yRZLL/wEJJMbgHCfwQNFKDid2KqyjnsGH40sbIc5n6Q5lKdwiS8dmmTZH/uU/DhP8oESkadtYU6TyRtYPibjVxxyDScvJgyIh7JwtuseXJr2hcjlfilP1B2hz4cGlS/kEf7R37MRV4U0sjMYVSVoUozBxQPNL08ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235200; c=relaxed/simple;
	bh=kBLYXveyRzkLWwiLZFLVLCPdX2czsB0pOedpIrKLOXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsHVNECnAZ6k7J4dC1dnP/qU0/X7rTQaVN6YuMvYvuhlziONCVO/WBOSev2n0FNfv0luXDTMh2CRUeJyyuFLthL+an9sJncQsWB+QL4GWpHVtqa6DgL+AkzNd/gx4JSEsUwzsIiMPVhZRtTvBBVbCuS2lJ4X1ctnNm0I9upPiG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euXNNuR5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773235199; x=1804771199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kBLYXveyRzkLWwiLZFLVLCPdX2czsB0pOedpIrKLOXg=;
  b=euXNNuR5H7+jodU3m5+wbtwWSknPsaGkjI/FPPV4PLkrletl/GwrPjYA
   JHzwgeFDnQDyr1J9kc/KqfLgkvRljT2fUBCjhajSbNYz2AmIKA4DcoLC/
   4HzcQJQV81tXARdqV8pHnYce3z6jip98kFHHRoCkxJc2kr0chg0RMz4T7
   cJJwS2vom9PMLSvyml+Zmvc3jYcUL/9DJdAjmCCAOmhvl2a6V23kyNpT8
   Mb5q2AuLAiO+7ItrM0B/xRa0DeROIlnOn6he2EUgLsI0gyWEfQ4KRa2tE
   La2c4HEjh+8fvnTqnHcqKDGH91f2TuPesmLpo73EAn/mhAgBPeJQK/aL8
   w==;
X-CSE-ConnectionGUID: J5nLcfwOTVmpaXo6Mhjkdw==
X-CSE-MsgGUID: q+90Hfe9Q8SOQPRNirz0vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74211584"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74211584"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:19:58 -0700
X-CSE-ConnectionGUID: Wj/nuLE1SE2iyLr8uW+aJg==
X-CSE-MsgGUID: ndKQFo2NTi67Q6hRdNnkEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217131249"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO alaakso-DESK.intel.com) ([10.245.246.81])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:19:54 -0700
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
Subject: [PATCH v2 3/5] platform: int3472: Add gpio software node
Date: Wed, 11 Mar 2026 15:19:08 +0200
Message-ID: <20260311131910.835513-4-antti.laakso@linux.intel.com>
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
X-Rspamd-Queue-Id: DB57826456A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33137-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,ideasonboard.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

The tps68470 supports i2c daisy chain, which need to be configured by
gpio-tps68470 driver. Add daisy chain information to software node.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 1 +
 drivers/platform/x86/intel/int3472/tps68470.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0d2a..a77ed32abe55 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -197,6 +197,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
 		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
 		cells[2].name = "tps68470-gpio";
+		cells[2].swnode = board_data->tps68470_gpio_swnode;
 
 		for (i = 0; i < board_data->n_gpiod_lookups; i++)
 			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
index 35915e701593..3bbaade96c57 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.h
+++ b/drivers/platform/x86/intel/int3472/tps68470.h
@@ -17,6 +17,7 @@ struct tps68470_regulator_platform_data;
 struct int3472_tps68470_board_data {
 	const char *dev_name;
 	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
+	const struct software_node *tps68470_gpio_swnode;
 	unsigned int n_gpiod_lookups;
 	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
 };
-- 
2.53.0


