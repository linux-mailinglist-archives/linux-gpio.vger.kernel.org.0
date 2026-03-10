Return-Path: <linux-gpio+bounces-32995-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE0yJ9shsGkkgQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32995-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:51:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F43250E68
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EEB2327E0AB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88073E63A7;
	Tue, 10 Mar 2026 12:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0D8TZNd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CE13E4C9C;
	Tue, 10 Mar 2026 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146724; cv=none; b=uCCYhorEikjqjEZoeO9NGFxxwgXF5/MQkKGVAB8IZ0JRw28tldOiEpayPerE3DS75G9W73+Rgx2QmGPc0ksqJOf6kxsOdWHpQMTa38Nc+iAC4JyIA5HtK8klO8Du6kpcUCQdBQpf9fvTsVtfdewnfxEX9MbD/C/Lcn/aewG2X40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146724; c=relaxed/simple;
	bh=xDxGFiNie59RzGUcXIKy3fyvwvGWfgbZbYPZS7gRRQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bP3x6ROgP33g/6luFknwR5TJu1jsSoy0jKNk5MoBxx7vuA9fiVFoqhnOH8DHvQi77gQhvCzn12HidkN76GApWYOJOwzkFw6QZtl0QrIc3rMlVNomS/8/n8U3u6f3mP1Y6gaK6pbPpL9lDbjKU6K7dJ+XdwjGLW7gkj8RMrzSfv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0D8TZNd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773146723; x=1804682723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xDxGFiNie59RzGUcXIKy3fyvwvGWfgbZbYPZS7gRRQY=;
  b=i0D8TZNdfrS/hV+hP4YGEKlHJkZuH/vVI05MW3S+FXqhWQupedmqK0Cw
   UpppgGUWFsEZM4iDakNH5B0SeqnrXWT4L+cZtwrYw6rxrLDNRWWZuqZiK
   ERdk/bXTkI8daENFhVbTzgPp1PcxOVLvvY6Od0l64YLCMQGXTfd3yYTMF
   L0uAvImfOEnqML/3Y0PQvAs7urjGZoa6mh9wLSpsQ45Duy832142NwlWZ
   inRTchwTs+JdRFMWDunZCErUx9AKXKo90LF+QSMwGywYEJXerSdyYa1vq
   0IQtu/I6ZfIYMFNRBC0rhXF12PyXgz7lJZjKi23lAmg8UiHBKZF4UvPlj
   w==;
X-CSE-ConnectionGUID: MnD0P4dwT8GwSad73KhA2A==
X-CSE-MsgGUID: NnvxHOhmQBCskfTSqOlSqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74268945"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74268945"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:45:23 -0700
X-CSE-ConnectionGUID: SDlUvSDxTm28XrkAKyzAlw==
X-CSE-MsgGUID: Uogk5UlcQUSLOS0dheK27g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="225040241"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO alaakso-DESK.kioski) ([10.245.246.41])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:45:17 -0700
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
Subject: [PATCH 3/5] platform: int3472: Add gpio platform data
Date: Tue, 10 Mar 2026 14:44:25 +0200
Message-ID: <20260310124427.693625-4-antti.laakso@linux.intel.com>
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
X-Rspamd-Queue-Id: 53F43250E68
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
	TAGGED_FROM(0.00)[bounces-32995-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

The tps68470 supports i2c daisy chain, which need to be configured by
gpio-tps68470 driver. Add daisy chain information to platform data.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 2 ++
 drivers/platform/x86/intel/int3472/tps68470.h | 1 +
 include/linux/platform_data/tps68470.h        | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0d2a..b02bc675cabe 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -197,6 +197,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
 		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
 		cells[2].name = "tps68470-gpio";
+		cells[2].platform_data = (void *)board_data->tps68470_gpio_pdata;
+		cells[2].pdata_size = sizeof(*board_data->tps68470_gpio_pdata);
 
 		for (i = 0; i < board_data->n_gpiod_lookups; i++)
 			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
index 35915e701593..c1c4290eb6d5 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.h
+++ b/drivers/platform/x86/intel/int3472/tps68470.h
@@ -17,6 +17,7 @@ struct tps68470_regulator_platform_data;
 struct int3472_tps68470_board_data {
 	const char *dev_name;
 	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
+	const struct tps68470_gpio_platform_data *tps68470_gpio_pdata;
 	unsigned int n_gpiod_lookups;
 	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
 };
diff --git a/include/linux/platform_data/tps68470.h b/include/linux/platform_data/tps68470.h
index e605a2cab07f..7330dab7a711 100644
--- a/include/linux/platform_data/tps68470.h
+++ b/include/linux/platform_data/tps68470.h
@@ -27,6 +27,10 @@ struct tps68470_regulator_platform_data {
 	const struct regulator_init_data *reg_init_data[TPS68470_NUM_REGULATORS];
 };
 
+struct tps68470_gpio_platform_data {
+	const bool daisy_chain_enable;
+};
+
 struct tps68470_clk_consumer {
 	const char *consumer_dev_name;
 	const char *consumer_con_id;
-- 
2.53.0


