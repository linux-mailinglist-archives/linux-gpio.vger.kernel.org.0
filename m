Return-Path: <linux-gpio+bounces-33247-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFNCHTylsmnwOQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33247-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:36:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3160527113B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B9E43091CBA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 11:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E153BF67C;
	Thu, 12 Mar 2026 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="YYI6SNlv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03EB33A9DA;
	Thu, 12 Mar 2026 11:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315220; cv=none; b=eKaWZXL1DRtR/j6uj0LAqNoIt0iVNq5btw9Uj+/+eA0uvnyzJ4ZXOjiCG0i49c0fvWOyZLMXmj8EVZdH8jLy1weQ6Gpdr0KI6/ja9pKCOMofIRy2Pm5rOoL2t+CGjTvnCMZUCFvG2EIKnpLwyoNXw5QUr7EffoIaCWkRrLPp0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315220; c=relaxed/simple;
	bh=D8XdDuUL2ST2ckmwskDyB0dWTl/eL4CVa+Gu6IGGM8M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dvDC16Rpdx7O7YIiUugtbgCgLi5zKU0+1VoEebSQLS3e7gS+CHbibfoxkGdJNxcECE7Yf+O3n1MZypQSmCtzHYRchFv/Nw3YxN0H/VIPloe+tzTPRC5bHWWV4UDJo4H1bQ6ZSrrCUQjxmzCSAehoS6TZkt+6I9Ji8CUUatcVnZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=YYI6SNlv; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62CBUgewE2456779, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773315042; bh=EVHQ/SnT7bdzWKDzLR6MojRjnreQeJEQzzaw3Vz1TyE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=YYI6SNlvjwviXv53KR2FmU/Oii7CMXY73+ZkFquJvON+KHXB3r4ikhbhFS50imStQ
	 oS4csFv5j3hjQVQw0KUddMxN8fWUpLDsD2Cs5IMvTwciEF3IJliyqxyyA/LJCCSxfH
	 xmX50RtOGof4y3kMzMCfoPw2pF4X7JyahIoL9PFj5FViBHwcGrIbpzmbEQEEaFDK2/
	 PhFIf738S2cbTn2RoldHJW4Ezg/Zf9HThH+bgGo/mszQa1VNZhYuxm4O3YL1Olf0Sy
	 VU+KnU4MGf8gMGGbDCy3FvhZ6CpHmE06BVFXg+g8AIHOQTWO3EuweRRnWOF9/aopyA
	 fXTFh57BoEBpg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62CBUgewE2456779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 19:30:42 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 12 Mar 2026 19:30:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 12 Mar 2026 19:30:41 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 12 Mar 2026 19:30:41 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v3 5/7] pinctrl: realtek: add support for slew rate, input voltage and high VIL
Date: Thu, 12 Mar 2026 19:30:38 +0800
Message-ID: <20260312113040.68189-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260312113040.68189-1-eleanor.lin@realtek.com>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33247-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[realtek.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,realtek.com:dkim,realtek.com:email,realtek.com:mid];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3160527113B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tzuyi Chang <tychang@realtek.com>

Add support for configuring slew rate, input voltage level and high VIL
mode. This involves updating the pin configuration parsing logic to handle
PIN_CONFIG_SLEW_RATE, PIN_CONFIG_INPUT_VOLTAGE_UV and the new custom
property "realtek,high-vil-microvolt".

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:
- Changed default value of realtek,high-vil-microvolt from 1 to 0.
- Synced with binding changes to handle PIN_CONFIG_SLEW_RATE as valid numbers.
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 66 ++++++++++++++++++++++++++-
 drivers/pinctrl/realtek/pinctrl-rtd.h |  3 ++
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 60dfb39bc986..c5e44e29bab1 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -37,11 +37,13 @@ struct rtd_pinctrl {
 #define RTD_DRIVE_STRENGH_P (PIN_CONFIG_END + 1)
 #define RTD_DRIVE_STRENGH_N (PIN_CONFIG_END + 2)
 #define RTD_DUTY_CYCLE (PIN_CONFIG_END + 3)
+#define RTD_HIGH_VIL (PIN_CONFIG_END + 4)
 
 static const struct pinconf_generic_params rtd_custom_bindings[] = {
 	{"realtek,drive-strength-p", RTD_DRIVE_STRENGH_P, 0},
 	{"realtek,drive-strength-n", RTD_DRIVE_STRENGH_N, 0},
 	{"realtek,duty-cycle", RTD_DUTY_CYCLE, 0},
+	{"realtek,high-vil-microvolt", RTD_HIGH_VIL, 0},
 };
 
 static int rtd_pinctrl_get_groups_count(struct pinctrl_dev *pcdev)
@@ -288,7 +290,8 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 	u16 strength;
 	u32 val;
 	u32 mask;
-	u32 pulsel_off, pulen_off, smt_off, curr_off, pow_off, reg_off, p_off, n_off;
+	u32 pulsel_off, pulen_off, smt_off, curr_off, pow_off, reg_off, p_off, n_off,
+	    input_volt_off, sr_off, hvil_off;
 	const char *name = data->info->pins[pinnr].name;
 	int ret = 0;
 
@@ -409,6 +412,67 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		val = set_val ? mask : 0;
 		break;
 
+	case PIN_CONFIG_SLEW_RATE:
+		if (config_desc->slew_rate_offset == NA) {
+			dev_err(data->dev, "Slew rate setting unsupported for pin: %s\n", name);
+			return -ENOTSUPP;
+		}
+
+		switch (arg) {
+		case 1:
+			set_val = 0;
+			break;
+		case 10:
+			set_val = 1;
+			break;
+		case 20:
+			set_val = 2;
+			break;
+		case 30:
+			set_val = 3;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		sr_off = config_desc->base_bit + config_desc->slew_rate_offset;
+		reg_off = config_desc->reg_offset;
+		mask = 0x3 << sr_off;
+		val = arg << sr_off;
+		break;
+
+	case PIN_CONFIG_INPUT_VOLTAGE_UV:
+		if (config_desc->input_volt_offset == NA) {
+			dev_err(data->dev, "Input voltage level setting unsupported for pin:%s\n",
+				name);
+			return -ENOTSUPP;
+		}
+
+		if (arg == 3300000)
+			set_val = 1;
+		else if (arg == 1800000)
+			set_val = 0;
+		else
+			return -EINVAL;
+
+		input_volt_off = config_desc->base_bit + config_desc->input_volt_offset;
+		reg_off = config_desc->reg_offset;
+
+		mask = BIT(input_volt_off);
+		val = set_val ? BIT(input_volt_off) : 0;
+		break;
+
+	case RTD_HIGH_VIL:
+		if (config_desc->hvil_offset == NA) {
+			dev_err(data->dev, "High vil setting unsupported for pin:%s\n", name);
+			return -ENOTSUPP;
+		}
+		hvil_off = config_desc->base_bit + config_desc->hvil_offset;
+		reg_off = config_desc->reg_offset;
+		mask = BIT(hvil_off);
+		val = 1;
+		break;
+
 	case RTD_DRIVE_STRENGH_P:
 		sconfig_desc = rtd_pinctrl_find_sconfig(data, pinnr);
 		if (!sconfig_desc) {
diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.h b/drivers/pinctrl/realtek/pinctrl-rtd.h
index 7fb0955ce749..02e2d8d269b5 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.h
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.h
@@ -34,6 +34,9 @@ struct rtd_pin_config_desc {
 	unsigned int smt_offset;
 	unsigned int power_offset;
 	unsigned int curr_type;
+	unsigned int input_volt_offset;
+	unsigned int slew_rate_offset;
+	unsigned int hvil_offset;
 };
 
 struct rtd_pin_sconfig_desc {
-- 
2.34.1


