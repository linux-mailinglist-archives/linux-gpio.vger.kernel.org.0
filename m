Return-Path: <linux-gpio+bounces-37843-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XBboEHJHH2oojgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37843-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 23:13:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4318B63207E
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 23:13:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=kie360nq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37843-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37843-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 77010300E308
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 21:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDED34BA20;
	Tue,  2 Jun 2026 21:11:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013007.outbound.protection.outlook.com [40.93.196.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328DA30C148
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 21:11:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434714; cv=fail; b=ewWQeceXvIIsNSU/FT6Q2TsV8UOiM0m0hxQSAmesCbJjXBj1moTfxUpy9oxVqRusySXJYUa7c808SkQ6Qgig8MVpG7mCvMI1S6Gxppb1XHvOmyzf80+VY/lDtUCVYhNS2PIJmL0QKX3AK7cZ9pom5oMFdjgm9qQbNpAFbShSypc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434714; c=relaxed/simple;
	bh=g5WOvaX5wjx65GJKJMrM9hdmIqifKJSrVPwTnUAyMSE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u/WZmPSki9gRcZpeoPMXKPP4kKgUFQzk4G0bPKSTX051Uz45rUtv+LzaLrVH940e3cYb/1VaxJaLySvSAN7hOENgQLrNP+v8IGWPcSV+7Q64AQO/vEXXNj0yWKoXze5rP/teGW7pHq74PNSjFhfB+Du5/C0Ua+IVRMOtIxw7k4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kie360nq; arc=fail smtp.client-ip=40.93.196.7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRMPI4oVtPVyjwq4FoB3g3OM4IUfGoq1HwN4v3eqViY7HM6bbrn5wjrelmkfezs9hn8DCnk9Hk8VaowYpw4ObcXDDL6Z74CLDAGmlYzA6Lcwwy6VJGSibNZ/gdmFHNqUMSPTVrwExojSIIzW/VLyqfqI5FcA3AByhdpj1SeCSKmGS+05fLffWHV451IajGeZIeakgvStWEwGiVzl8jvrjI0v1tmK2FASHE9TPm1LsfcOAOLZK4ehDQf6QDaYgzrZbm5fhT1+fzQRjr+Zx4yoQQOGTCdV8t4054gUpk7SWmVPOVv0U3MD5ZKIl0v7qxZEHBgXMnJColHO9oltKl3mDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hl/cajwRaAUEltlzvq8loFIjDjz7Z49nY3rCfB0mtU=;
 b=DSqoJbG8aSln1AFQj4qPghF+/yYEHVcjXW7xhPJnsklZ1zOBH+uvYQNp9KAYzcG8bcThzjeIHTTUnQxX97wbWjefbyEaAR/xQM7QIhpBLJRdCFaLHyfvF/n+EN3aljOc2Jp7skywqnm5n2sH1tfmTuwPfQ0JHF1NSpiqio4+dZAhqP+hO8Labl0MzG6nZmsbOExpAvpOgP+E7M4/kfGh7VA2xZWdibD7X6ZzuPrfiem7nWOhrxv9ojy8p5vPr5UvPs/yMiIYbrKMhmhDqLIZTuxqTMINdqyN+IkjWvNXgi2aXvtd+qrcFhaIg5RKJMW94tr27GTLhcjBkFTZCmCA+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hl/cajwRaAUEltlzvq8loFIjDjz7Z49nY3rCfB0mtU=;
 b=kie360nqdkuDoAJd2RA6Uocp+FZ8PAYTjS2pGGM75IgQCYjQLGSkdXThq4SLAS2ofsCnXcTX94yyJo+LXLEfxPfCPGGKDiQFC2ujyht2xh0h7GoNqa7d5fDc736cDKjHLW/EipwIwTSpXgI+iIOie10eiHCnTt7aogz+/37YtGrJwwQqDed2HHETTkVf6hoMdFGfbrSU0Lac8d2I4Pj+f2dngELExRbYQbn2wAHzHFEfInrNLEmkYXOZZxdTnWHd79jaqSWH/32ZyIQuRQjpi6lTZ3PT9YsWZvtX3RPyOzJqnfJRdDqPuZEzsG67MA0iaIfTnF2y9LC62MKszlF4eg==
Received: from SJ0PR05CA0177.namprd05.prod.outlook.com (2603:10b6:a03:339::32)
 by BY1PR12MB8446.namprd12.prod.outlook.com (2603:10b6:a03:52d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 21:11:48 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::aa) by SJ0PR05CA0177.outlook.office365.com
 (2603:10b6:a03:339::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.6 via Frontend Transport; Tue, 2
 Jun 2026 21:11:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 21:11:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Jun
 2026 14:11:26 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Jun
 2026 14:11:24 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>, <linux-gpio@vger.kernel.org>,
	<amelie.delaunay@st.com>
Subject: [PATCH] pinctrl: PINCTRL_STMFX should depend on CONFIG_OF
Date: Tue, 2 Jun 2026 16:11:16 -0500
Message-ID: <20260602211116.2033792-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|BY1PR12MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e651b2-5893-4da2-9d05-08dec0eb8eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|6133799003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	wXj5rdmKunTWBmP8hqwV7vVrWV1IFBJ3YT7D4kHaCWgTi8EhdoR9iHtawx7YpwFKsNTvqmHi5rB9EFjyYWhgKRhB8+41LamcZhaFk+yPIQnAIlN27iwzYrCC0N6zxTzFhnxjY9KGp7ORyslIQhCWIJvbNNgmNB+iGh9Gb50mdPg7rVfDe/6XEnVUcx0K8VPDe4zq3O7JmfiVahVnyPju+a9vt2B3uk5NDA7U/KpyoPP11WIoeMdufF8jazHAkNPENzqXaNRpcV9vbsvToWcPnRg/HMzfHHL9GS0Md3JAC+mOKumwZ9UXr9J9F45OFp1Mx4I7kXyHtk9zpHH5Ahk9SqSlcfc3X3Ai6nP5778Oal5Xy5NK5qlap4V6SBQ+QhIH/pQzHE148j29R1pt7Mvq4/6jXmi2MyZ7pmgdYrAmHqIsLMxYYiamnS7gdJfGJb5Hm/FyXYsuAU8OxRXQ3XILSctOjbllKNbbR6wedyJpN/AES89eNOhD6gIXY2WavoKJkJapXitHe/G8KgDgcd1+rSFT+3HqG9EmvJidZ8CHBqLBcdTRmsRw230Y/6Qfx62eiVBGFLK+fxltJmzS7WHew+9IiEE5X+3FZuMU2aUcdPlucjlAqoIgSObqKInLxReg0Ar1xbmqbup28klv2dKtfTPUwJmSqC3AezmS3plGtzXvlAT0+Mnt7hcyUTZVPgG/QsjmCXEaFytUITHBiJoanphIwkj/2Qir+yd7kp2EO9A=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(6133799003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	70JDrujjaKfDcf7NzcTqAmT/gAdNKPfxg9+Xjy1T+ef2dz7f3/gMK1Ob/V/PHB3PxbOgRFUXwTuPdAjukhRQcoqAfDI8EU4U7HrzbjEIvJOUJL/hnsdenAwd5nn2aFCivji7+ZUSHILJS5tFAg8h/crb0KsYhzsFHxCRwOeN/TJAfifPtJX4guL9LhcbisaBYcY6VKo1h3pWdK0x1I7G1IdqmSEvEwOHZX02nqvVD7UY62q2ywuntfQbu6JPUdtFvdxDJ1uS2Rl9RObJepBurl/Dt1Rm81g0hmITsm23LSYt2tK45OdP5GnRsj4xX6h04pB8ibeTgWO2bq9SoaDYvHJUxK/vkxB5wxI65b2gyDh49sVEI7JujFGQ8rk4HfQ81zBIBVHe2MLNxT4efV1eij6SfRjf9nAZ00mV/BS9UkIAUeSQ9gI17hjc87/D84y9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 21:11:48.0671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e651b2-5893-4da2-9d05-08dec0eb8eff
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8446
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37843-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:amelie.delaunay@st.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ttabi@nvidia.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ttabi@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:from_mime,nvidia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4318B63207E

Commit e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies
on OF_GPIO") removed a redundant dependecy on CONFIG_OF_GPIO for
several pinctrl drivers, but this change also removed a dependency
on CONFIG_OF for some of those drivers.

Normally, this wouldn't be a problem, but PINCTRL_STMFX also selected
MFD_STMFX, which does depend on CONFIG_OF.  This conflict allows
MFD_STMFX to be enabled even if CONFIG_OF is disabled.

Fix this by also having PINCTRL_STMFX depend on CONFIG_OF.  This is
okay because the pinctrl-stmfx driver actually does depend on CONFIG_OF
functions.

Fixes: e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 03f2e3ee065f..75131b6e6eea 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -548,6 +548,7 @@ config PINCTRL_ST
 
 config PINCTRL_STMFX
 	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
+	depends on OF
 	depends on I2C
 	depends on HAS_IOMEM
 	select GENERIC_PINCONF
-- 
2.54.0


