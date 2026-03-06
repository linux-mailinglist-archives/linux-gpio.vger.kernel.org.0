Return-Path: <linux-gpio+bounces-32631-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEa0B3qIqmmjTAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32631-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:55:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BADE721CA9E
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C41CD301C8B9
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 07:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A279837418B;
	Fri,  6 Mar 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="khOkR6PP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C285736AB43;
	Fri,  6 Mar 2026 07:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772783729; cv=none; b=t3avicsfZVtN+RjORNjDdgVwMhdbv16TlRtmaiTKC1eV9TiDHfYLcTNQvslOOTKeVkFYXcAh+u+kgmRkVTBGbBjBRAbNOSfqU6tAEw8k059rh0j+DxrSMMZgX1HYCz6h4JDFcZRk9Hb1QHGlypLH8kRDfJk+TfIcIgqR/j4aSXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772783729; c=relaxed/simple;
	bh=8T9Y/hqMCcDWGDxgc54VDK+Ny7vZzjU+/tzQ6/TIp18=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XGzkzNAKnpAgAXrfV4CIT97cDSpQaODc9gAbxtmNcX8b/w/mkt1sWrwqstvBUt/kWIYdzxAXU4YTEDFdnBm5QD4UoM5VNgxSlv0mjyAYa4ooi34mMUesTz2XyzT8zP7bk3mh2cZ7lnoLYG4CTJ52h+hCrodHU5YVdG8Mqh3vkGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=khOkR6PP; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qjE332977152, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783565; bh=mNZL6ywL1OAuIdWm+yAfpw5UV28qpCGV8xcIfaqxSBI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=khOkR6PPGzyIr9BpGf8AHDm/0ktqKuW0BitpmO6K23Mjfvtm3kfODL5eG8odiK+t4
	 XVmGRRidw12rR716sC/sHdKhF+rZKZ6DFz0qWEyZHi6iq8Y4J2kIYZ8e/ztgZCvvG+
	 lVP1l+eSfNnYsdIl/bQ/i2OBxUklAzzIWAU6cpfwEnGr3FfhcIe5fOLT4zzB+0ce68
	 TWkYdQteoqDc+bjgRi0TiNJb18KAaUwzVv3mQv/vrTQD0mt4LpQfB8+S3RyEmb5uVB
	 ZfUknCI9QYTUj5cXlgPSxw9czLTBRVLIHBh9gIzLuncnNcu+eSNVE+7LVkCyHsuZD3
	 EwFIiiuei0BJA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qjE332977152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:45 +0800
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
Subject: [PATCH v2 03/14] pinctrl: realtek: Switch to use devm functions
Date: Fri, 6 Mar 2026 15:52:33 +0800
Message-ID: <20260306075244.1170399-4-eleanor.lin@realtek.com>
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
X-Rspamd-Queue-Id: BADE721CA9E
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
	TAGGED_FROM(0.00)[bounces-32631-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Simplify the probe() function by switching to devm-managed versions of
ioremap and pinctrl registration.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Use devm_platform_ioremap_resource() instead of devm_of_iomap().

 drivers/pinctrl/realtek/pinctrl-rtd.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 41e7f5c2bf74..56fd3093c206 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -543,13 +543,12 @@ static const struct regmap_config rtd_pinctrl_regmap_config = {
 int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_desc *desc)
 {
 	struct rtd_pinctrl *data;
-	int ret;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->base = of_iomap(pdev->dev.of_node, 0);
+	data->base = devm_platform_ioremap_resource(pdev, 0);
 	if (!data->base)
 		return -ENOMEM;
 
@@ -570,25 +569,18 @@ int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_des
 	if (IS_ERR(data->regmap_pinctrl)) {
 		dev_err(data->dev, "failed to init regmap: %ld\n",
 			PTR_ERR(data->regmap_pinctrl));
-		ret = PTR_ERR(data->regmap_pinctrl);
-		goto unmap;
+		return PTR_ERR(data->regmap_pinctrl);
 	}
 
-	data->pcdev = pinctrl_register(&data->desc, &pdev->dev, data);
-	if (IS_ERR(data->pcdev)) {
-		ret = PTR_ERR(data->pcdev);
-		goto unmap;
-	}
+	data->pcdev = devm_pinctrl_register(&pdev->dev, &data->desc, data);
+	if (IS_ERR(data->pcdev))
+		return PTR_ERR(data->pcdev);
 
 	platform_set_drvdata(pdev, data);
 
 	dev_dbg(&pdev->dev, "probed\n");
 
 	return 0;
-
-unmap:
-	iounmap(data->base);
-	return ret;
 }
 EXPORT_SYMBOL(rtd_pinctrl_probe);
 
-- 
2.34.1


