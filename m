Return-Path: <linux-gpio+bounces-32642-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MBsFs6JqmlDTQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32642-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 09:01:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E327B21CC23
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 09:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B0FC3109CA9
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 07:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723773793A3;
	Fri,  6 Mar 2026 07:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="qUokxQYA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4414B378833;
	Fri,  6 Mar 2026 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772783741; cv=none; b=QAV+Rw7ghyicE7p0AgWbD653C/0f/rk+bJgKqs8Qz4a9b/srP0RgmSM9O+F/hPICD4gUtmurKGTsP65tPFeXrgqec9CzINBtCk4eWNJ6dcFKIvHPv0f2GW5q0l/jxFu+eBMWWHhQJ7Uv9VbL75j80MrmZbmvWRwfS0Tl0il1zKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772783741; c=relaxed/simple;
	bh=V3wZ+MYuq1e685qmdvgAJk53iq7woSdGaKdaRCcr+a4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UL0kEpYhhScV66DWEDOv0UNjHbqwqwMXQ4Wfugk5jSUzwr/RaZ9lqyuMf84Xs9P0BErYO7QaRbwK22/CCT9CW+hN5y1yxkii7OZOrlh/0VnHxaD6FvDr/FpkTEFrqnbLD8xP5ZLdfUvGkJTpCKY2bT+tVrfi9AVcpOckjKFCFuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=qUokxQYA; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qoYrB2977173, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783570; bh=hgh76Icjq5aZcxp8xesBqY6XMC0lsZ0EPMYpuiDqgnU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=qUokxQYA7yCqoHpx7zkUrFj3qEDl7dULVzFnFm1NIqEIIvavZCGkC5FFZPKi2gYuj
	 H9TkxVnyZ6BVyxJd1G81sC17HTYKyhuLLTo13lutUnNcu3qnoilMcPOn26Moh3N4K2
	 mIP3dyfUXcTHXt66tPwX8lCKZAq/9rWAlF8sFo8FfgghLJB0TzI5K0RwO/hNh6l8rU
	 fGNWNyHMDerhWKUOxwTpOwZwgz6GY2bTmsFi8kbScYJbmgbqDjblOVaX0fVz1TeG1q
	 FGF8qM6CrPcKArybEOHiu8dNiYEKmOMgAcq1M0jBdryoDzR0qTN/kE7KfAtTs+p9Dv
	 lMzsOnFzq51sQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qoYrB2977173
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:50 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:50 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:50 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bartosz.golaszewski@oss.qualcomm.com>,
        <afaerber@suse.com>
CC: <james.tai@realtek.com>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <tychang@realtek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v2 12/14] pinctrl: realtek: Add support for slew rate, input voltage and high VIL
Date: Fri, 6 Mar 2026 15:52:42 +0800
Message-ID: <20260306075244.1170399-13-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Queue-Id: E327B21CC23
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32642-lists,linux-gpio=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[realtek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,realtek.com:dkim,realtek.com:email,realtek.com:mid]
X-Rspamd-Action: no action

From: Tzuyi Chang <tychang@realtek.com>

Add support for configuring slew rate, input voltage level and high VIL
mode. This involves updating the pin configuration parsing logic to handle
PIN_CONFIG_SLEW_RATE, PIN_CONFIG_INPUT_VOLTAGE_UV and the new custom property
"realtek,high-vil".

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Adapt code to match the new binding properties
 - Switch to handling values instead of booleans for VIL.
 - Move property parsing logic to the appropriate location.

 drivers/pinctrl/realtek/pinctrl-rtd.c | 48 ++++++++++++++++++++++++++-
 drivers/pinctrl/realtek/pinctrl-rtd.h |  3 ++
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index d9456f3d908b..51fbf02710e6 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -37,11 +37,13 @@ struct rtd_pinctrl {
 #define RTD_DRIVE_STRENGH_P (PIN_CONFIG_END + 1)
 #define RTD_DRIVE_STRENGH_N (PIN_CONFIG_END + 2)
 #define RTD_PULSE_WIDTH_ADJUST (PIN_CONFIG_END + 3)
+#define RTD_HIGH_VIL (PIN_CONFIG_END + 4)
 
 static const struct pinconf_generic_params rtd_custom_bindings[] = {
 	{"realtek,drive-strength-p", RTD_DRIVE_STRENGH_P, 0},
 	{"realtek,drive-strength-n", RTD_DRIVE_STRENGH_N, 0},
 	{"realtek,pulse-width-adjust", RTD_PULSE_WIDTH_ADJUST, 0},
+	{"realtek,high-vil-microvolt", RTD_HIGH_VIL, 1},
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
 
@@ -409,6 +412,49 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		val = set_val ? mask : 0;
 		break;
 
+	case PIN_CONFIG_SLEW_RATE:
+		if (config_desc->slew_rate_offset == NA) {
+			dev_err(data->dev, "Slew rate setting unsupported for pin: %s\n", name);
+			return -ENOTSUPP;
+		}
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


