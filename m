Return-Path: <linux-gpio+bounces-32643-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ImwIsmIqmmjTAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32643-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:56:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C2221CB3B
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1702A301CC70
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 07:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802793793A8;
	Fri,  6 Mar 2026 07:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="gkNeZCYK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35AC378D71;
	Fri,  6 Mar 2026 07:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772783741; cv=none; b=UtulPP5tdXw7bdUCOPYEw0YRx1DP/ELgDwXPpoSlXoWdg6HJ1KDtn3KwBRT6jxn5RuUR39+KyHdoprnlt9Yf6DNPwEBbOlhlQGyYw/fMBhbSOOy4H0nEAR7BeAlx+uJdwDuqmA7tjfoUDxgeB/zhaq+zCFGRj38j+sKrC08ZH7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772783741; c=relaxed/simple;
	bh=pQYxHoI8rATXbQ6bN7Xuu1ElfXD2Vud0syGkJjISLrg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mDswIoFzLhZG/nb4zGqAFz9QQMZu6CBFbLIh7C9OOioQc9mk8o4j8gWIZLoZVzoFBls2NGYNb+sq7ZHDwg29lRrK/HJ761cE5zY84AKRHRwSepv87g0PnWyEU8FGMAOjj5us2WKofVBFpLneqz5yqowOsky/gDOhs2RpTMwlhQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=gkNeZCYK; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qkunF2977157, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783566; bh=fqong6ONpLV7i4pGQx7rPiXI4yfULcIEHX9UrfhOolE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=gkNeZCYKpgdHd0vqbMG7lRGCvKE8g34E5N8OPNrA7k4ttWahPbyGPMcszVf3ClWqm
	 gjusY4q8pN1GlsPuDcIFglvuACMW/kkbppEVfpWHx8M4ZDExwSWpfoOoCpuzVOBdRg
	 AbdQPO8h/ObMA+n+USgCkKsn98QeH1ZmDz++B6DmTB3noZCoiNkm3jV7Fal1fupEdZ
	 HsJzShQQGdVLh6WtC/aGEQ2Xgs3Vl6MZh7dzFoe7BjfqLFQ5faZwLPEKCqf7HK8SuD
	 AGlyEd7CjVkrU/vjOA7JeYf6rEw92bNC7l4/fl/EOFHc8f5HH7k/zoJbUYvo9K4Z+q
	 JxjOUKJ1QUUVg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qkunF2977157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:46 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:46 +0800
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
Subject: [PATCH v2 05/14] pinctrl: realtek: Fix grammar in error messages
Date: Fri, 6 Mar 2026 15:52:35 +0800
Message-ID: <20260306075244.1170399-6-eleanor.lin@realtek.com>
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
X-Rspamd-Queue-Id: 90C2221CB3B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32643-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:dkim,realtek.com:email,realtek.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Correct the grammar in dev_err() messages. Change "Not support <feature>..."
to "<feature> unsupported..." to improve readability and comply with
standard English usage.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 382bdae54bf3..5888a36babba 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -293,14 +293,14 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 
 	config_desc = rtd_pinctrl_find_config(data, pinnr);
 	if (!config_desc) {
-		dev_err(data->dev, "Not support pin config for pin: %s\n", name);
+		dev_err(data->dev, "Pin config unsupported for pin: %s\n", name);
 		return -ENOTSUPP;
 	}
 	switch ((u32)param) {
 	case PIN_CONFIG_INPUT_SCHMITT:
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 		if (config_desc->smt_offset == NA) {
-			dev_err(data->dev, "Not support input schmitt for pin: %s\n", name);
+			dev_err(data->dev, "Input schmitt unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		smt_off = config_desc->base_bit + config_desc->smt_offset;
@@ -313,7 +313,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		if (config_desc->pud_en_offset == NA) {
-			dev_err(data->dev, "Not support push pull for pin: %s\n", name);
+			dev_err(data->dev, "Push pull unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		pulen_off = config_desc->base_bit + config_desc->pud_en_offset;
@@ -325,7 +325,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 
 	case PIN_CONFIG_BIAS_DISABLE:
 		if (config_desc->pud_en_offset == NA) {
-			dev_err(data->dev, "Not support bias disable for pin: %s\n", name);
+			dev_err(data->dev, "Bias disable unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		pulen_off = config_desc->base_bit + config_desc->pud_en_offset;
@@ -337,7 +337,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 
 	case PIN_CONFIG_BIAS_PULL_UP:
 		if (config_desc->pud_en_offset == NA) {
-			dev_err(data->dev, "Not support bias pull up for pin:%s\n", name);
+			dev_err(data->dev, "Bias pull up unsupported for pin:%s\n", name);
 			return -ENOTSUPP;
 		}
 		pulen_off = config_desc->base_bit + config_desc->pud_en_offset;
@@ -350,7 +350,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 		if (config_desc->pud_en_offset == NA) {
-			dev_err(data->dev, "Not support bias pull down for pin: %s\n", name);
+			dev_err(data->dev, "Bias pull down unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		pulen_off = config_desc->base_bit + config_desc->pud_en_offset;
@@ -384,7 +384,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 				return -EINVAL;
 			break;
 		case NA:
-			dev_err(data->dev, "Not support drive strength for pin: %s\n", name);
+			dev_err(data->dev, "Drive strength unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		default:
 			return -EINVAL;
@@ -394,7 +394,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 
 	case PIN_CONFIG_POWER_SOURCE:
 		if (config_desc->power_offset == NA) {
-			dev_err(data->dev, "Not support power source for pin: %s\n", name);
+			dev_err(data->dev, "Power source unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		reg_off = config_desc->reg_offset;
@@ -411,7 +411,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 	case RTD_DRIVE_STRENGH_P:
 		sconfig_desc = rtd_pinctrl_find_sconfig(data, pinnr);
 		if (!sconfig_desc) {
-			dev_err(data->dev, "Not support P driving for pin: %s\n", name);
+			dev_err(data->dev, "P driving unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		set_val = arg;
@@ -428,7 +428,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 	case RTD_DRIVE_STRENGH_N:
 		sconfig_desc = rtd_pinctrl_find_sconfig(data, pinnr);
 		if (!sconfig_desc) {
-			dev_err(data->dev, "Not support N driving for pin: %s\n", name);
+			dev_err(data->dev, "N driving unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		set_val = arg;
@@ -445,7 +445,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 	case RTD_DUTY_CYCLE:
 		sconfig_desc = rtd_pinctrl_find_sconfig(data, pinnr);
 		if (!sconfig_desc || sconfig_desc->dcycle_offset == NA) {
-			dev_err(data->dev, "Not support duty cycle for pin: %s\n", name);
+			dev_err(data->dev, "Duty cycle unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		set_val = arg;
-- 
2.34.1


