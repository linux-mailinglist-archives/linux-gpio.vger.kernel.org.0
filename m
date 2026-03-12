Return-Path: <linux-gpio+bounces-33245-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNxOHyClsmnwOQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33245-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:36:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 319D027110D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 164E7308C12F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 11:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F833BE638;
	Thu, 12 Mar 2026 11:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="fTeBKPVQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D6814EC73;
	Thu, 12 Mar 2026 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315219; cv=none; b=VQC4zLSuWpk2JZCDGU05ykNdWj+Esy44gMZtXvVhJ7WwGWe8/nSY9A8QPbEq1lCoKjPNnArY9XtYk5+Ni/TlFUn7AHK55UUjUqptvAy2TJz/68IMz7X1eIgZwGTxRFDGIfcxXSYf0w3sR1TAU+47dYCi26CL72G8mGFgx3oQrIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315219; c=relaxed/simple;
	bh=yAq61GEXGUfmgY+M6PUHpACkLuS+LieRic850eDJ1OY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eeeYquwtVWxHnSsAtbr9Ssra9zb6WCc5MYYVNl0hvYbLEIdQFsyXnI8YRBj3aXW+N51aP5TVmtfDhi7PxEiISuOn4ic9pPXOic9JzOyC8B0UeWuW9BoDSvOGQeifBOaK5Ygs6w99+Vcp2y2QZ4MlmvSC3uiYWtRqHtZEFvQsBXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=fTeBKPVQ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62CBUfC222456773, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773315041; bh=QYviwW8kDKrW3gTfMtQDJZ0P+wnpGdcbPJFi/LTFUFo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=fTeBKPVQjLYVgnKOKIAtEgat3A+N9r1D9qpYnRrDF2kze2v13cFlMxQDAzdu1gXyA
	 I+fOviJxy61j+5PplY1+QyNRrhs7GDYvypDRXj3eGuGUdkNIz3eMS0/AjkB+Mqj+J4
	 Mb/+6mGvpd0lXFM+4a6Y9QqqJUUBXE4vmdW8qtZXv21YGY10N0m0cnKNhNRFFQt2nF
	 btpXJnZKCkk4DZXsI9IH6jm3vLgsIReWtnHNUA/jUjArqOt6K1TeE3730rt7LmXciY
	 0dwinGT5o45r6TxmJbB0Tgjqr9j9OHHdPRm6gqt6fx4CAtUm+cDBfwHV5sjsC8ZeDB
	 KIDyEEy0kJFuw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62CBUfC222456773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 19:30:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 12 Mar 2026 19:30:41 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 12 Mar 2026 19:30:40 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v3 2/7] pinctrl: pinconf-generic: Add properties 'input-voltage-microvolt'
Date: Thu, 12 Mar 2026 19:30:35 +0800
Message-ID: <20260312113040.68189-3-eleanor.lin@realtek.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33245-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,realtek.com:dkim,realtek.com:email,realtek.com:mid]
X-Rspamd-Queue-Id: 319D027110D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tzuyi Chang <tychang@realtek.com>

Add a new generic pin configuration parameter PIN_CONFIG_INPUT_VOLTAGE_UV.
This parameter is used to specify the input voltage level of a pin in
microvolts, which corresponds to the 'input-voltage-microvolt' property
in Device Tree.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:
- None
---
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 855ca973a1c8..06cdc885a442 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -57,6 +57,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY, "skew delay", NULL, true),
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY_INPUT_PS, "input skew delay", "ps", true),
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY_OUTPUT_PS, "output skew delay", "ps", true),
+	PCONFDUMP(PIN_CONFIG_INPUT_VOLTAGE_UV, "input voltage in microvolt", "uV", true),
 };
 
 static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
@@ -203,6 +204,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "skew-delay", PIN_CONFIG_SKEW_DELAY, 0 },
 	{ "skew-delay-input-ps", PIN_CONFIG_SKEW_DELAY_INPUT_PS, 0 },
 	{ "skew-delay-output-ps", PIN_CONFIG_SKEW_DELAY_OUTPUT_PS, 0 },
+	{ "input-voltage-microvolt", PIN_CONFIG_INPUT_VOLTAGE_UV, 0 },
 };
 
 /**
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 531dc3e9b3f7..a5d4b2d8633a 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -83,6 +83,8 @@ struct pinctrl_map;
  *      schmitt-trigger mode is disabled.
  * @PIN_CONFIG_INPUT_SCHMITT_UV: this will configure an input pin to run in
  *	schmitt-trigger mode. The argument is in uV.
+ * @PIN_CONFIG_INPUT_VOLTAGE_UV: this will configure the input voltage level of
+ * the pin. The argument is specified in microvolts.
  * @PIN_CONFIG_MODE_LOW_POWER: this will configure the pin for low power
  *	operation, if several modes of operation are supported these can be
  *	passed in the argument on a custom form, else just use argument 1
@@ -145,6 +147,7 @@ enum pin_config_param {
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT_UV,
+	PIN_CONFIG_INPUT_VOLTAGE_UV,
 	PIN_CONFIG_MODE_LOW_POWER,
 	PIN_CONFIG_MODE_PWM,
 	PIN_CONFIG_LEVEL,
-- 
2.34.1


