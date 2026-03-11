Return-Path: <linux-gpio+bounces-33139-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMlpNFttsWlVvAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33139-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:25:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75770264787
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CE1932075F4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B79031327A;
	Wed, 11 Mar 2026 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DI80JJAa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514AC313520;
	Wed, 11 Mar 2026 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235210; cv=none; b=m+4Fl/PlEjSw9gZfPAFsbQAHBudcuG+qNlD8KTfk2HWSnZtFAvSMiCP2a7zn8xj9+vv7FmxaZge9M+3Vr+Bdr0FXixkCOajVFlU8Bs/AoJUrTyOkoqhKqsaK1NopZNN3LVtQAfGyiobEBqHf3AQPKoEXarF6fLfJ5wNkKiWQ5+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235210; c=relaxed/simple;
	bh=CQ8Cm5vR63jWP3/NDOVeQAOYgMxpGV7BYmnp92v/zeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8JtdctDLYClMc0QdzbjaGTZXSOKI+zN+al8+6RlkCr4jToWacdSwVu0HsMk5QoP5HxR+Fo7YmBvqJH1UnC5Hvq+UfyBNRWRQyjr76sIiA9fE9M/Tas03dG+MWGueA62Zd4gQ76bJWdQ2WaFW79qdAhDJ+ow5gwDup+xAwO3Awc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DI80JJAa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773235208; x=1804771208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CQ8Cm5vR63jWP3/NDOVeQAOYgMxpGV7BYmnp92v/zeU=;
  b=DI80JJAaZYPYTAOz6xASCjxxpdR+en05XxJtCTla++bsslZVNEIINEjn
   L+NDSZG3qWdER5ImhVE5BXoLMGG9C0A+UU1imaAKI1IeQWgSWZBSuP/X2
   uCuHuVPVEnB7H9PtzUbJyohvNd2JwguurcR7JnwcNgx2HsPC+BgGp+kVF
   vq0PKpsR00BnmGYWx5oWELgbqigDmrAEdmwV7UhSfjem/MvyNSgCGTMY3
   2Uh87eMY8CttLa/pbNBfOeNCf6/gsaagLHOPXj8/tMbV/pZfgmHMW9ALQ
   Zxc2XRReQdTJ9Vquakp96ntAb0vSXJt4n2y8LEYR2sCP1ofvkR945ANtd
   Q==;
X-CSE-ConnectionGUID: iaMx9xeeSlqp53PS6GYYFw==
X-CSE-MsgGUID: g9yjclQGRtG23e0WU8Sw4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74211598"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74211598"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:20:08 -0700
X-CSE-ConnectionGUID: wWIPPsqITC2IUMFNhJ+KBQ==
X-CSE-MsgGUID: wY1TjB17RvGMovcHlVK7Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217131307"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO alaakso-DESK.intel.com) ([10.245.246.81])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:20:03 -0700
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
Subject: [PATCH v2 5/5] platform: int3472: Add MSI prestige board data
Date: Wed, 11 Mar 2026 15:19:10 +0200
Message-ID: <20260311131910.835513-6-antti.laakso@linux.intel.com>
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
X-Rspamd-Queue-Id: 75770264787
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33139-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Define regulators and gpio for ov5675 in MSI Prestige 14 AI EVO+ laptop.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 71357a036292..6892d6e98072 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -12,6 +12,7 @@
 #include <linux/dmi.h>
 #include <linux/gpio/machine.h>
 #include <linux/platform_data/tps68470.h>
+#include <linux/property.h>
 #include <linux/regulator/machine.h>
 #include "tps68470.h"
 
@@ -232,6 +233,72 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
 	},
 };
 
+/* Settings for MSI Prestige 14 AI+ Evo C2VMG laptop. */
+static struct regulator_consumer_supply ovti5675_avdd_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-OVTI5675:00"),
+};
+
+static struct regulator_consumer_supply ovti5675_dovdd_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-OVTI5675:00"),
+};
+
+static struct regulator_consumer_supply ovti5675_dvdd_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-OVTI5675:00"),
+};
+
+static const struct regulator_init_data msi_p14_ai_evo_tps68470_core_reg_init_data = {
+	.constraints = {
+		.min_uV = 1200000,
+		.max_uV = 1200000,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti5675_dvdd_consumer_supplies),
+	.consumer_supplies = ovti5675_dvdd_consumer_supplies,
+};
+
+static const struct regulator_init_data msi_p14_ai_evo_tps68470_ana_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti5675_avdd_consumer_supplies),
+	.consumer_supplies = ovti5675_avdd_consumer_supplies,
+};
+
+static const struct regulator_init_data msi_p14_ai_evo_tps68470_vio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = 0,
+	.consumer_supplies = NULL,
+};
+
+static const struct regulator_init_data msi_p14_ai_evo_tps68470_vsio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti5675_dovdd_consumer_supplies),
+	.consumer_supplies = ovti5675_dovdd_consumer_supplies,
+};
+
+static const struct tps68470_regulator_platform_data msi_p14_ai_evo_tps68470_pdata = {
+	.reg_init_data = {
+		[TPS68470_CORE] = &msi_p14_ai_evo_tps68470_core_reg_init_data,
+		[TPS68470_ANA]  = &msi_p14_ai_evo_tps68470_ana_reg_init_data,
+		[TPS68470_VIO]  = &msi_p14_ai_evo_tps68470_vio_reg_init_data,
+		[TPS68470_VSIO] = &msi_p14_ai_evo_tps68470_vsio_reg_init_data,
+	},
+};
+
 static struct gpiod_lookup_table surface_go_int347a_gpios = {
 	.dev_id = "i2c-INT347A:00",
 	.table = {
@@ -258,6 +325,23 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
 	}
 };
 
+static struct gpiod_lookup_table msi_p14_ai_evo_ovti5675_gpios = {
+	.dev_id = "i2c-OVTI5675:00",
+	.table = {
+		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
+static const struct property_entry msi_p14_ai_evo_gpio_props[] = {
+	PROPERTY_ENTRY_BOOL("daisy-chain-enable"),
+	{ }
+};
+
+static const struct software_node msi_p14_ai_evo_tps68470_gpio_swnode = {
+	.properties = msi_p14_ai_evo_gpio_props,
+};
+
 static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:05",
 	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
@@ -287,6 +371,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
 	},
 };
 
+static const struct int3472_tps68470_board_data msi_p14_ai_evo_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:06",
+	.tps68470_regulator_pdata = &msi_p14_ai_evo_tps68470_pdata,
+	.tps68470_gpio_swnode = &msi_p14_ai_evo_tps68470_gpio_swnode,
+	.n_gpiod_lookups = 1,
+	.tps68470_gpio_lookup_tables = {
+		&msi_p14_ai_evo_ovti5675_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -316,6 +410,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&dell_7212_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 14 AI+ Evo C2VMG"),
+		},
+		.driver_data = (void *)&msi_p14_ai_evo_tps68470_board_data,
+	},
 	{ }
 };
 
-- 
2.53.0


