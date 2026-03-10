Return-Path: <linux-gpio+bounces-32997-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGzuA/0ssGlHgwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32997-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:38:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F30082522E7
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 128EF3126497
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F27D3E8043;
	Tue, 10 Mar 2026 12:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAx2Cju4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017DB3E8041;
	Tue, 10 Mar 2026 12:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146736; cv=none; b=ec6Ot0NfJKnK2geL8J8cNXW0qUAh8Rnc3gMHDBOlEqmSv73u3E4Vdc1+OzgRzAzQuJ4VnqGl3jYbIpjX7dxKlghn5L0XHsBk2Kl1s28kT9ZwDoGBymHLtCXB3TE2aHa/9JMOab9IJE3/KF00ZdN/293gR8Sl+cRngLBijdG3Z98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146736; c=relaxed/simple;
	bh=tN03Ua8cWGsA+NSmKC8Zbhm98icOQ5fcOhlqL+PjwTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FMSmlkX3x3B96Y/Ngp7L0NQpvc9wbTfaWl88AALVD4oZp635tFbwgxVZOr9b9mwqhNSTI834djQULp5UnQwirz0KCfh07nzFqOp3sxKvnf9yAaqIHOJJyw6XixYnuDwdZna+gK4298H5iyXZij7W1q/P7s/WFmHjTU8uphmot4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAx2Cju4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773146735; x=1804682735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tN03Ua8cWGsA+NSmKC8Zbhm98icOQ5fcOhlqL+PjwTo=;
  b=lAx2Cju4ZKk4fwZ+1IggXmo2ESen23Wc8VjU3ZkqQcC8S0gQCZn7FQTS
   QnhEUM9S0yMDWW5fuZMpVRUT7AnoF7QINg/RNj0lklEdZ4SC/eYD/JLA1
   vMhAHnN5xqIaU3mUvDEavJGB6rSMwcnrO5UXoGdnO0Kt0JB9nDjMs4wQN
   wBi+MdJ2VPl/ceaeRhuT+HEER+cLXtJm1fBBjXxagSomhW12kp7OYNmrn
   CxPgbmsvgBuEM7J+NEfP9Fbqc+K/ARbSnAdKXI4x8xVdaqfKladRbtGvh
   gEKqx2V/ByI9BG42U0SSxYEciR/pm/r43hlXHUOU/LLEIrBOt0DuZPrDM
   w==;
X-CSE-ConnectionGUID: iikKAxMqQMmZM6HJ09VdhA==
X-CSE-MsgGUID: oSh6zKcyQ6GpRfsRfpS0NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74268969"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74268969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:45:35 -0700
X-CSE-ConnectionGUID: dR14lY+ATVqzMmAjTzTJeg==
X-CSE-MsgGUID: M5oRJc/rTEOduIzLV4DDuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="225040264"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO alaakso-DESK.kioski) ([10.245.246.41])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:45:29 -0700
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
Subject: [PATCH 5/5] platform: int3472: Add MSI prestige board data
Date: Tue, 10 Mar 2026 14:44:27 +0200
Message-ID: <20260310124427.693625-6-antti.laakso@linux.intel.com>
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
X-Rspamd-Queue-Id: F30082522E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32997-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.intel.com:mid]
X-Rspamd-Action: no action

Define regulators and gpios for MSI Prestige 14 AI EVO+ laptop.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 71357a036292..fe7c23e72d66 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -232,6 +232,73 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
 	},
 };
 
+/* Settings for MSI Prestige 14 laptop. */
+
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
@@ -258,6 +325,19 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
 	}
 };
 
+static struct gpiod_lookup_table msi_p14_ai_evo_ovti5675_gpios = {
+	.dev_id = "i2c-OVTI5675:00",
+	.table = {
+		GPIO_LOOKUP_IDX("tps68470-gpio", 9, "reset", 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("tps68470-gpio", 7, "reset", 1, GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
+static const struct tps68470_gpio_platform_data msi_p14_ai_evo_tps68470_gpio_pdata = {
+	.daisy_chain_enable = true,
+};
+
 static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:05",
 	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
@@ -287,6 +367,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
 	},
 };
 
+static const struct int3472_tps68470_board_data msi_p14_ai_evo_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:06",
+	.tps68470_regulator_pdata = &msi_p14_ai_evo_tps68470_pdata,
+	.tps68470_gpio_pdata = &msi_p14_ai_evo_tps68470_gpio_pdata,
+	.n_gpiod_lookups = 1,
+	.tps68470_gpio_lookup_tables = {
+		&msi_p14_ai_evo_ovti5675_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -316,6 +406,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
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


