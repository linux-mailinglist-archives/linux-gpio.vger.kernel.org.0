Return-Path: <linux-gpio+bounces-33624-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOAQCatBuWnp9wEAu9opvQ
	(envelope-from <linux-gpio+bounces-33624-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:57:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7B32A95B6
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1D4F307BDBB
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C539F3B7B7D;
	Tue, 17 Mar 2026 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="P2Spfh1x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120953B5831;
	Tue, 17 Mar 2026 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748619; cv=none; b=jpiHvBd4dgMbTpKAEvyhi0ct0OsjVNqy954eN4X5GXz+SQKqQJwDVvPeHuzkwYsLru0a1Td1H7EZyrmkJtve3GnS9JXB4P9SpM0siKWv6LPRX5MWYTDR65i0c1jGyjquEg8/+t5ECnF8tbJuETahl1nS5kbq1teYzx8ri4Ry7/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748619; c=relaxed/simple;
	bh=wRHHH2xTqvd3TfDUnwnT7B5NTWQMMSlubBbw66+rw7U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M5fGBc6wZ77WLmeEk7DmBE7PJJPSFkrae12+FyHLz97rXFEGKQkdvTG2rS5F6hdBVYaQcLGpTK9nI8JF3V47M6X6aX0y4SOqJBHJq6DUqWQ/3Y8IWm/66dklq5NmlIOLBFi/SXP0RlypMTt+KPLfMTqvR8v+q0gfmEFOfMOVSlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=P2Spfh1x; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62HBsCIs93851632, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773748452; bh=IdmzHmBgDKqciU8FWsE6Six4Htcy+tUizytLGb7E7Q8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=P2Spfh1xWlqdW7cTmWJwO7fDRqpnNg6LivCrFDo82CrdS2qDn+0w1PH76MdPXfF43
	 CPuxxcKphFLDR8Qu/3R0twSAcpBxAwRxi5hAjpm6kdzAy2bvqcJEznuBT7Ju1nPskC
	 fGpsIG/p5HL/MDr1Q67Qmj33spWnfP4L6uijgKyvbl/g9z23qD6EgKeEPP8+worIdG
	 K5Go9R8bMJRis/zdjZBgHHwmcdwGmFAy00uK8o5T4ufVSVqsuTGX3r2vS8eQFQd/OV
	 wTqQGD3xzrLwUZ7nB72SaKcQ3gxnNIhHHpae5PLg6AWzMuC4oGSQz0DJmugX3r/T9j
	 drpm8KbUxGDig==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62HBsCIs93851632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 19:54:12 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:12 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 19:54:12 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v4 6/8] pinctrl: realtek: add support for slew rate, input voltage and high VIL
Date: Tue, 17 Mar 2026 19:54:08 +0800
Message-ID: <20260317115411.2154365-7-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317115411.2154365-1-eleanor.lin@realtek.com>
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33624-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,realtek.com:dkim,realtek.com:email,realtek.com:mid]
X-Rspamd-Queue-Id: 8F7B32A95B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tzuyi Chang <tychang@realtek.com>

Add support for configuring slew rate, input voltage level and high VIL
mode. This involves updating the pin configuration parsing logic to handle
PIN_CONFIG_SLEW_RATE, PIN_CONFIG_INPUT_VOLTAGE_UV and the new custom
property "realtek,high-vil-microvolt".

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- Add Reviewed-by tag from Linus.
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 66 ++++++++++++++++++++++++++-
 drivers/pinctrl/realtek/pinctrl-rtd.h |  3 ++
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 16cee851393e..ec266c5b7fa1 100644
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


