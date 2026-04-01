Return-Path: <linux-gpio+bounces-34561-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJTfFfoizWnOaAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34561-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 15:51:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD77537B98E
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 15:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E595630FF280
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 13:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C5843C05F;
	Wed,  1 Apr 2026 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YMp/iGbi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011028.outbound.protection.outlook.com [40.93.194.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C47D402B90;
	Wed,  1 Apr 2026 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050510; cv=fail; b=LZbct1TsWwrt18ZG0WfaJ6qn3eBSUblfeUodmv6cVpnhGo9CIBEOvmpv7+8EtY7oxbVhWbUlcGEQuf07I8oL+HMozmCshwyC8c9bfbN5wAzP3ZBgD+hqrqviZ4Nn6GqqBnM4a49FWRrMVaFo0nj4WK6/bD9aqjZGLERlHojZD/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050510; c=relaxed/simple;
	bh=M0YLvF7m0XDd8rmayXEQ4GGGBIws8Gll5c0jXEAcWqw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QX8Ia5nhraH8TaPjjp7Z9pv6p9xHuVJZYOO0vWUAnoQwaK2SQLWWt2xctuGP2fSHbBRkXhKFNBQCpeOOwRKVtrCWrvpExDbm9nzb8j39HRrFnp7dWwn2u6GfbWJuMistsAcflw/oHEtXDQ9ZTuxXNppi3GsbuvqLrXQKEklS81o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YMp/iGbi; arc=fail smtp.client-ip=40.93.194.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vs+H9MpMAdCGOINftFYyi+Lpe8PWknINzSesuilmDIdmj6FwOlcvSgamsTAk0abjadWOu83ijEioIYmJk5O+qDqtRsSw71NrpxZD/1EGEQeWQnothKqJQBgy+C2Hw2gyFomFPN9kc6wzWrJL1wQzQowbIfDkCx4rb05o008z28L+zMNfgn9RVB75pyJkVKtNSvKtMSTor8J7XS2YfOD1eJWrlld6fi5rUBLZZO6M3G+MyXRNCQZIfMb7cjt/BazR7AeVCAME3CAQJ+ji7atBzLmKxrzZtw3dzVc0OC+s0lM+Xc9tTr6ijR2FM8ZFSRhVF9+O7L8yi+oOr/oWm6m64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu6yMklk7c77W8cqczSAT3K9SbpmhEGc2yHlpdwxWfc=;
 b=sHuaOtRcivo8etDXutw76nm20kllZZbf2XqbeAYgEX76wbmxEnC+ZntyHmEly3Ebp9IJuNRL1CulMGOeVsrk4SvGgbD8zrRV8NRdXpcz+MC69D23zDhEXPim53QTk/YgIPH5tbI05WFrD0X6ajUbPlZAc1ZLCOmfQEGobrYg5oAbh0l3ED5nKoUzyuHNcpa2HnITw62ZfXhY0OhAlMMWl3rZOIwf1uWf/jAIZWrNNYztJ1xU3mYRuAdMO8G+hKlugJoyuG68EZ0PpJli1ZCqHotfE04/PxMTtSacJoPBortgVqWLerswK8qHQKo3t0EhmEwP4xLr/CseCa7d75vCYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tu6yMklk7c77W8cqczSAT3K9SbpmhEGc2yHlpdwxWfc=;
 b=YMp/iGbidV0Vu1ZK1ZpQnnHySSfg8h7l+uzKqHwUvJwaC7KmF6iBT5toxRNoMkV+81GQPc/1rEB7/qx+1Owfa4nhVqInqr8J2cy8qxK1+GsCUS/pLzl32t6Cu724HXN7HfhvEGVAdn/NNlfiLJEnXXYxVkVpxFsgHVduIshuA/tf0FGFXO7wOhUH3Cwbam2Vs8UKPxx9MFRcgiD2M2V7q4zAO/WN31IpE97KoCxkzfP8+/H0PZBzdVDIl9d8W+E06NpiS3iAQKh7gAFRoRmHThpZQDxtNC8p6c7fcGv73p3VsR2XS04RNoL/Ol6wd9oh1KYfOUBk33xVrE6bvS37AA==
Received: from BL1PR13CA0256.namprd13.prod.outlook.com (2603:10b6:208:2ba::21)
 by SA3PR12MB8046.namprd12.prod.outlook.com (2603:10b6:806:304::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 13:35:04 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::5a) by BL1PR13CA0256.outlook.office365.com
 (2603:10b6:208:2ba::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.16 via Frontend Transport; Wed,
 1 Apr 2026 13:35:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 13:35:03 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 06:34:53 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 1 Apr 2026 06:34:53 -0700
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 06:34:51 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH] gpiolib: Make deferral warnings debug messages
Date: Wed, 1 Apr 2026 14:34:41 +0100
Message-ID: <20260401133441.47641-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|SA3PR12MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: b386b3f2-fc67-46aa-90a5-08de8ff37b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AQF6Wb4+UxPbb69zUF8cMjIJtbnHKxMRAREIBE0JsHZAh1K6d9IE8k3LS01rwe2Fq+7VVNe4VEgwpUYO+OZtA2t89RuY/GCogJuz/ud4IQk5aY6l4onrZBV6d5qm3M1haFDJLoIVyb6qfeSyaudOYJyy31Yzz1PUHrl13JBs2FQwfjn86u2nYHDe2eCP+A77LI0IfHJ8xINwvuRM8R5bgGnYTf80cuiAFhwBJ6lVeCxd5OdonjVKEGzqoMlBZAG9SMl2lACid+Bnr4bDfKzLkrvRCyLHNE0n9DZCmKEU9nExEN55F2sXaBaHVd0AJM/+WBxbPejaAS+0JG+95wJO+1L5+8WvdpmaQByIA1AAeOEg7K+4Lq/fKZqTcX/isfi0WgYZYBFFAXPlHYx8C3KzX6Y7GIrAeFNrpOYXDy9/oVW4Jr0XA6LaTMGD/AixZ3MeWvLrmN+GC8La6WF1S55b2Lyx7ota0ad43dQVQ4+035lp2Hh9YNHMBBFpDuHrIO0zevCC/GXM2OkdAqXehgTxOgubokps7k2GhxmrpI3l/HJ0fLJuvzOMezO80z3lgldsW3ql5tB57oR2EgTmJUofHN+iTphmnOrA/0UCV1eYn/vUwW7CKnn5AQC9xUPSzqJK+hgYJALpPjcG9Nz+QC/A3F5U9o5Y7pVwGrWOhE1byP4yvGTMtcL8FoPJwtyUvqjK2uCtp8DXkT6P+Jy4wuBFdfOZ55ObwbcRVukwCnoF7vhirz9XcEFVW+1t97IgdYe9lDRAl0rsvxRhXGvx8XAPtg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kJ9e8z7FAMjiwE/jZzmXbYtHuJYjbyFfUdcdulsdr4Eq+56z4RsfmBuH2ZW4lQN0xqADkdYkMRbrgfG9JMVB1WjKy1bkWRjKN4Itl72sNuDKGFzRurK689VmdcuoLKnB6ujoS8nDhR9QV56E8h6bo8lNyCbAgr0lXsg6pdp4WP7l9rhNhzceJF/OAyLLZm6Gop0nVhTrNgaofEkWzK0GCMTZbOklh6CU90tra5mHq/r1XBFWCu21H7/iEHiZ83/L5z3nA4dC4C3FWy+aj/mbyeJRF7b2uQkTtmxR2KtbHaFp3RhnrvxMIFZUFk31tEmG9DSAG1Hr2rgWyqT9CQoTJgraoH+XXsBxOLRVYfQ9biylQaqvUpFszDcA3MXxK7LhT0VXobiS2lcjURYs14NfAO0xDhk+S9U4dsNl8JhiyFGPEKkF3w0WlK/9oSY/4uN9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:35:03.8684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b386b3f2-fc67-46aa-90a5-08de8ff37b36
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8046
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34561-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: DD77537B98E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the recent addition of the shared GPIO support, warning messages
such as the following are being observed ...

 reg-fixed-voltage regulator-vdd-3v3-pcie: cannot find GPIO chip
  gpiolib_shared.proxy.6, deferring

These are seen even with GPIO_SHARED_PROXY=y.

Given that the GPIOs are successfully found a bit later during boot and
the code is intentionally returning -EPROBE_DEFER when they are not
found, downgrade these messages to debug prints to avoid unnecessary
warnings being observed.

Note that although the 'cannot find GPIO line' warning has not been
observed in this case, it seems reasonable to make this print a debug
print for consistency too.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpio/gpiolib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 96c776ff2669..1e6dce430dca 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4624,8 +4624,8 @@ static struct gpio_desc *gpio_desc_table_match(struct device *dev, const char *c
 				return desc;
 			}
 
-			dev_warn(dev, "cannot find GPIO line %s, deferring\n",
-				 p->key);
+			dev_dbg(dev, "cannot find GPIO line %s, deferring\n",
+				p->key);
 			return ERR_PTR(-EPROBE_DEFER);
 		}
 
@@ -4639,8 +4639,8 @@ static struct gpio_desc *gpio_desc_table_match(struct device *dev, const char *c
 			 * consumer be probed again or let the Deferred
 			 * Probe infrastructure handle the error.
 			 */
-			dev_warn(dev, "cannot find GPIO chip %s, deferring\n",
-				 p->key);
+			dev_dbg(dev, "cannot find GPIO chip %s, deferring\n",
+				p->key);
 			return ERR_PTR(-EPROBE_DEFER);
 		}
 
-- 
2.43.0


