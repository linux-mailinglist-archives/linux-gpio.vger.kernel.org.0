Return-Path: <linux-gpio+bounces-35094-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHZ/ETv53GnXYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35094-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:10:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0503ED133
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E5163046EAB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DA73CEBB7;
	Mon, 13 Apr 2026 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tk154.de header.i=@tk154.de header.b="qAnkKP3I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp6.goneo.de (smtp6.goneo.de [85.220.129.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1073CEBA9;
	Mon, 13 Apr 2026 14:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.220.129.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776088955; cv=none; b=PAiwPzBwBcwo6MLrhtFbuPJk98HTAJZMIC7NImmNwQ3lLhzqwKCf/LI0yYbCIEdbWVNE/xdJPyW41f94z62qcDzr6dtOUDptiO0nvb04b1yRKmWUVkktceXK0PdWZsTpQfF/JCuGvtimChkWtRr3Obla3a8sgHpB/FE4Z9MDWbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776088955; c=relaxed/simple;
	bh=U4yl6IJ0xPqDdadjbaM2BrsEcT2xQbYLoYAGSi4cbaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jMu0j7XbKTzMq2BEbdJo9cE17wvrBECW3cEp+cBPsVB6XcGdfv+UB4kmqZAp87F7/Fc12BnUS5rPhyf5sNZQZdARVcA9KKpgPBJ+bTJcCI4NuM+zZh/ft9pvMN4tk/KfhY74YhdqM5rxuqBcdEYD0C61Sln5P0Urm6rlZfGNsi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tk154.de; spf=pass smtp.mailfrom=tk154.de; dkim=pass (2048-bit key) header.d=tk154.de header.i=@tk154.de header.b=qAnkKP3I; arc=none smtp.client-ip=85.220.129.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tk154.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tk154.de
Received: from hub2.goneo.de (hub2.goneo.de [IPv6:2001:1640:5::8:53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by smtp6.goneo.de (Postfix) with ESMTPS id 9614024095D;
	Mon, 13 Apr 2026 15:53:18 +0200 (CEST)
Received: from hub2.goneo.de (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hub2.goneo.de (Postfix) with ESMTPS id 5D5252400EE;
	Mon, 13 Apr 2026 15:53:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tk154.de; s=DKIM001;
	t=1776088396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=24AXtsu9nDzvup8XfLHaKXM36uG/XOpm7O1cB4AmO1g=;
	b=qAnkKP3IRcTWtr9pNvmdDatPzfnUHcitZyZaB4hwJZEStDgk8xGDNFIy5rIUENDe1mvI89
	GybCEPymUW/ILLXe4A1SHVBh6bOFj8TdJr0P2TMz4M+/89WQ3U/o+LD2G9TcrJnexnjn0R
	T/X3lHXgMPeVgflJrRvwuIq9rBTe8sQblXgWVqTLggRgq/XTqyCmD4KtN/rAbwl0KBR5UV
	APhdyt4ti1WF8+ITH53yVX4RJpm9vfdzRCusUaqgU11/PDTOPmidBpzdD6gnc98LzTbD2i
	A2r8xfPUQVdJzwcE2o2udVl/DjHvtZz0mQCS4ZgZb8mLsLTEKMj/ANmjT5+vaQ==
Received: from Til-Notebook.meshlab (unknown [195.37.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hub2.goneo.de (Postfix) with ESMTPSA id AEA5F240025;
	Mon, 13 Apr 2026 15:53:14 +0200 (CEST)
From: Til Kaiser <mail@tk154.de>
To: andersson@kernel.org,
	linusw@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: ipq4019: mark gpio as a GPIO pin function
Date: Mon, 13 Apr 2026 15:52:34 +0200
Message-ID: <20260413135234.4067548-1-mail@tk154.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-UID: d068c0
X-Rspamd-UID: f61d5b
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tk154.de:s=DKIM001];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tk154.de:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tk154.de];
	TAGGED_FROM(0.00)[bounces-35094-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mail@tk154.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tk154.de:dkim,tk154.de:email,tk154.de:mid]
X-Rspamd-Queue-Id: 8E0503ED133
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The qcom pinctrl core supports marking functions that represent GPIO mode
via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
GPIO requests for pins that are muxed to the GPIO function.

ipq4019 still describes its gpio function with QCA_PIN_FUNCTION(gpio),
so it is not treated as a GPIO pin function. As a result, GPIO consumers
can still conflict with pinctrl states that select the "gpio" function.

Add a QCA_GPIO_PIN_FUNCTION() helper and use it for the ipq4019 gpio
function, matching how the msm-based qcom drivers handle this.

This allows ipq4019 to keep the GPIO-related pin configuration in DTS
without tripping over strict pinmux ownership checks.

Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
Signed-off-by: Til Kaiser <mail@tk154.de>
---
 drivers/pinctrl/qcom/pinctrl-ipq4019.c | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm.h     | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
index 6ede3149b6e1..07df812fb728 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
@@ -480,7 +480,7 @@ static const struct pinfunction ipq4019_functions[] = {
 	QCA_PIN_FUNCTION(blsp_uart0),
 	QCA_PIN_FUNCTION(blsp_uart1),
 	QCA_PIN_FUNCTION(chip_rst),
-	QCA_PIN_FUNCTION(gpio),
+	QCA_GPIO_PIN_FUNCTION(gpio),
 	QCA_PIN_FUNCTION(i2s_rx),
 	QCA_PIN_FUNCTION(i2s_spdif_in),
 	QCA_PIN_FUNCTION(i2s_spdif_out),
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 4625fa5320a9..120217012a9f 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -39,6 +39,11 @@ struct pinctrl_pin_desc;
 					fname##_groups,		\
 					ARRAY_SIZE(fname##_groups))
 
+#define QCA_GPIO_PIN_FUNCTION(fname)				\
+	[qca_mux_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,	\
+					fname##_groups,		\
+					ARRAY_SIZE(fname##_groups))
+
 /**
  * struct msm_pingroup - Qualcomm pingroup definition
  * @grp:                  Generic data of the pin group (name and pins)
-- 
2.53.0


