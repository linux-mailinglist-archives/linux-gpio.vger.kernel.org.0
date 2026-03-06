Return-Path: <linux-gpio+bounces-32633-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAtjJYSIqmmjTAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32633-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:55:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2400521CABD
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADE403026AA2
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 07:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B97376493;
	Fri,  6 Mar 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="WLT1etob"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195EE343D9E;
	Fri,  6 Mar 2026 07:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772783729; cv=none; b=EBSl9q1kuopIf4CStpodGxZVllHzC0BPGqVpSD2NIWMavUJc5FuWrECNvAdtL4VYQ3xBhw1Ol49mw+DNGJR2uFDi/LSQVgOo1C/khseHc9sqmLG47wxWo6Gh32StMSndI1ZWt7p/joiWpNf0oKFSmOdxIHjym26Nd+xog1xJB9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772783729; c=relaxed/simple;
	bh=GMW5B6JMgI6j9/cDHFQ4K87UJU3ZWkxxvDTWvZBAAGo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TmBuNek8MDc1p2q0qbuuQ/TFeCmncpqcRlvDj6MfKJ+E0I/LTIzOGWcoQVhRO9Zj5o85A2pl0ASV+TXwOIqtb4l0QSckwgJgzgkc0H6Q+PGgKrC/FFTuevlQK3Zgy4A9PgxJUXVR7IRKwlP+iDqBMjV5UMJ2KbzPQZFYTM7MBCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=WLT1etob; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qkHU32977155, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783566; bh=km0x8u84UprX6FKm0eCiSzTfi+chOgnkYlBpdfCRF1w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=WLT1etobrskNSLFgL4x45S6Ky1Cm9gNTB+vnKSIkod9CeqM9cOCCzKdrAEgHipxWr
	 BdlOc9I2pTzQM3iK0lKibDnU0KNUWBa67kd8n8GNC/jwsOoct1MGAgsptQMaXEc/Hx
	 yaiojwYtdIIjgcnts0x86B+HztlPNQqRqajMp9zTJbKm/T00OprrKM75piso7CdMfu
	 DCRyTSs4uj1c2CxvnidR7Or8gDCsoWaOO8ZNHrBaNS3RbNceurLNXiXayExji2cMyj
	 CoAzSzm5WOA/EujpgFVQOfFu08J0iuIkfUmJY2kzRLtSTLC+InM9mJ/1wVQwcoAclf
	 Z5C4Pc9tK9MIA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qkHU32977155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:45 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:45 +0800
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
Subject: [PATCH v2 04/14] pinctrl: realtek: Simplify error handling with dev_err_probe()
Date: Fri, 6 Mar 2026 15:52:34 +0800
Message-ID: <20260306075244.1170399-5-eleanor.lin@realtek.com>
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
X-Rspamd-Queue-Id: 2400521CABD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32633-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Convert the error handling code in probe() to use dev_err_probe() to
enhance semantic meaning.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Add Bartosz's Reviewed-by tag.

 drivers/pinctrl/realtek/pinctrl-rtd.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 56fd3093c206..382bdae54bf3 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -566,15 +566,14 @@ int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_des
 	data->regmap_pinctrl = devm_regmap_init_mmio(data->dev, data->base,
 						     &rtd_pinctrl_regmap_config);
 
-	if (IS_ERR(data->regmap_pinctrl)) {
-		dev_err(data->dev, "failed to init regmap: %ld\n",
-			PTR_ERR(data->regmap_pinctrl));
-		return PTR_ERR(data->regmap_pinctrl);
-	}
+	if (IS_ERR(data->regmap_pinctrl))
+		return dev_err_probe(data->dev, PTR_ERR(data->regmap_pinctrl),
+				     "Failed to init regmap\n");
 
 	data->pcdev = devm_pinctrl_register(&pdev->dev, &data->desc, data);
 	if (IS_ERR(data->pcdev))
-		return PTR_ERR(data->pcdev);
+		return dev_err_probe(data->dev, PTR_ERR(data->pcdev),
+				     "Failed to register pinctrl\n");
 
 	platform_set_drvdata(pdev, data);
 
-- 
2.34.1


