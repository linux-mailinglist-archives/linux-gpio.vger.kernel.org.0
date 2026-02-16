Return-Path: <linux-gpio+bounces-31696-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLlqJCSkkmmnwAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31696-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 05:59:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC41140E88
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 05:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAE7A3007954
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 04:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17132DE6F8;
	Mon, 16 Feb 2026 04:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZVabthOj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013023.outbound.protection.outlook.com [40.93.196.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B97944F;
	Mon, 16 Feb 2026 04:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771217950; cv=fail; b=tWs4FszkHC2Qdq4JBpFITZiUE+8PfRG3wyPlV9q7zDVo+DXk6oZ0BQMYmDzIgSJ43S1TuNyQY4fQ61flaSEJC6y/UYFEhJcKeXesg/bd6bcDhsLvfpjdztZ7D2uWPb/oUwPKBrVno3di2LiKt57t+dbj0YSOUaatxlydNGbDhaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771217950; c=relaxed/simple;
	bh=l4xy+9ZqoW/1KZjKKvbSY6PUxB8zf4FzFmhcPu21P0w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dAlXj775IDTU2mN/3srNRSrCnWP7lq/Hzh/ogLik5Pj9K5hd8srp0HoP2s/a1JWkv83avEfAh2RJ2p1MWSf8imaXinnGN1kac2uSRufSbQJJSeVIxDFp3x6HDQyp0uJT2fbmmn5mWnEJLWo4fKpIrb3ihyTN6iCIrtvOSPAPodE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZVabthOj; arc=fail smtp.client-ip=40.93.196.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/0hOH4/ALqMqWaSfuo6/OalSIKYBraskKt7bJePwWOULXqaOJS+hEhRvVEpgzNPeo0zwj9nrqSldq5KkNan0L22hA8B6P42zPK9tTP1VRChLH2tvN7wY0QrOt+U5gEXP52aNaOs5RKaZeEGBV+DTg+xBmfnFohMCTG+lB5aV0Omx4rW0NHlUSexOeIWzoLMifambRd0Jl8/aaaSdjrL7Si9MPT1gsyJLtFVXsIdcYfrNDE2PKU+JEYX32jvk7q/HboAMS8QNf/UpdE5gBJXwEWAoS5aXfqHgxRQePT4pH5KqQXwwCu5L8EsNMoE3c1o79U3PVYrDthQuUGt73UwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xR2WEXIqaARDJUyDr0sqZIOxbhfnSZndsNj11TE6t1Y=;
 b=rxQ16GqhfyCx+z75i/UhXjQ4XKVv2gz9JNVX9KOlWcfwSVfjAmthV+w6RporzrOyizmMzHDkwR7H7wzFE65+1XLDhgXSXo7sexntD5g4H0lRbfHwgCF3gsUi7QkJirDVIJJWk7WuMacD47nhaAJzqqWeMDsOhsUn8Ltj5pn0J//c7YInZX/kjGUCtMxLgpVn7HgNSieX//6tQffDeL5Y7iSIj/CSAEwOY6rKA0edK41lqXwItKqxfQs4T2aGo4D4S5jNN88iQR+m/EpfqvlJul4EEQ67GUjaCcFxDV4+zUMyeeDfXFalp2nMroamEilLQB+WzvgJKLpeU5cwawXw0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xR2WEXIqaARDJUyDr0sqZIOxbhfnSZndsNj11TE6t1Y=;
 b=ZVabthOjMkmt7ORjfl3togBzmok+867vWE0aQQgeGZFmDxlMGJL+CiLVTMTs7dgFO6piz6uJPgrqcayfDRicJU7t2cBsstjm184ToM7GQzMeaEAKJbzJ8QjrYFtYVRTJ2a6hg1wpwCegJRcr6gDC93UHf3+aSa9tYd2BGbM4ePr/EjMfg2NbJE45jbvPx2czHj/0V7f5vZwQUUw0hkk6K22TdBhiMq90uKpS4P1OUGB/GDrskMcmcZxCqgPN+PtaBKCzX9DUHNpbQ8u3LWAJadPvcBgK8/iaMNvOfkbMaUzXI/MtsARWji3jW8sllvZSFUhxms//BBN6DAqae+cz5w==
Received: from BYAPR06CA0034.namprd06.prod.outlook.com (2603:10b6:a03:d4::47)
 by BL3PR12MB9052.namprd12.prod.outlook.com (2603:10b6:208:3bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 04:59:04 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::91) by BYAPR06CA0034.outlook.office365.com
 (2603:10b6:a03:d4::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 04:59:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 04:59:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Feb
 2026 20:58:49 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Feb
 2026 20:58:49 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH] gpio: tegra186: Support multi-socket devices
Date: Mon, 16 Feb 2026 04:58:42 +0000
Message-ID: <20260216045842.1206350-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|BL3PR12MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b94cefa-e677-448e-8fda-08de6d181b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9X4m7fez47zMQaJ+VAY4hG1773ATgtXKTJothoGeeK+4E4UBUZ3p0PGk6We6?=
 =?us-ascii?Q?/vPd9DgtrsP7Xak9cyOdFxC/NOzi2VMMEOqUePy2RjXALTVQRRTMwR6PfJk1?=
 =?us-ascii?Q?9dBxLGnxOkzsDkpyorvRKPIId2yUBDlugP2Rp+VMhu4Dbz4E6Y47paAE0QRb?=
 =?us-ascii?Q?w+oABWHYMEzcqa98gp2GpTnbev0+BkBm0tnZBzHiXBssR6Xdjlq5zKIjVrK2?=
 =?us-ascii?Q?TWPthVdW3EsJw66LdCRkGOjYKqv3xXIR25pZa4Wt/bmHqox8vGhH+g2WAKlV?=
 =?us-ascii?Q?PmTNv1Heli/6C1giFq900bUeDDQ+256zizvED84AtRi1X9/3+FTWuX17ugbZ?=
 =?us-ascii?Q?Cp8yOpyF839YgpEfyF7t2CG5FGNv0R66nc1WbPbhjnoQ/G31SNCoINGLRFxX?=
 =?us-ascii?Q?NB+PUGKlgze5c7Q7qzIghzOzZ75+t95iikqBVcSLlxw5d6PSxn+PKQSdRjii?=
 =?us-ascii?Q?YewLE/Kqnp171PvWwIIlOuuolH7xQJ+H5GsGHEadlbKDQ3psJrQSTt678l7Q?=
 =?us-ascii?Q?1W0Fql1NiKIA/xGVC3eAUDphaB29TF3idMUL1x+6mRvwmyiC0A4+h++XiIgL?=
 =?us-ascii?Q?y1DaFy9syf1pd9skhC9Xf+aDn0Wos8dDjlYFGcjhN4aLUrGVty3F+TIp/Tkl?=
 =?us-ascii?Q?6+P56feBaR68cOGGUcalLyR73wxmoVtTuCmkWgcvr8W8rUx662r39Sw2HVg1?=
 =?us-ascii?Q?FKOI4jnZzKq1oyxybEkDUUIhXIgXMG2+yn4bgprbROjp0rWRpUXXHqYQuJ9G?=
 =?us-ascii?Q?9ZgZm+pPxmeny5V98v35Rqf3+ycG11hdnsOO0l+c+e1St5304FzkNhga+qkf?=
 =?us-ascii?Q?AKo62MRgX1mikVNNZ5dBPdXJfDtAlcPMx6w05WLga03s9pgKPDWkyIDaZrSw?=
 =?us-ascii?Q?AoNL1SE5+i5vneAKwGqJincmJPmbRt2+OaMzPUbggmeBbPKTJosuGj2jLtLs?=
 =?us-ascii?Q?OAGVSK8UuPyKaMU5L8+4KK4w/PMSBKmYZx3iHwN7mqqhTgqQtxWait5yg3xu?=
 =?us-ascii?Q?G1pL+82M+okP4wsOyIe27KMpvU7wxMDIW92jt38OpCBSBf+PctZzyLuBVOz9?=
 =?us-ascii?Q?ld4UyINDmOezP9qH/JROkaZmqyIQiPx7G/OMldwN2Vj+4kSIc/CBc6nPlxgb?=
 =?us-ascii?Q?DKrA2LjzgoUTJzaPWfZkyk/1kdo2SBrtFECJDHr/y+nJMNBYbiqfw7v06QIW?=
 =?us-ascii?Q?o9IsKajAJhFrq4ZS/1BfNa5GSH/p+apMKaJ/iYmjCX0sJXW/Mc9HuSBOkfhV?=
 =?us-ascii?Q?l+eG5lqAg/X/mrG2hGymSH0u95k/XlZOlA4f+PAMALCFEOLeMHMZqtEj9ony?=
 =?us-ascii?Q?l0dND4JyE5STI9k24yhqqXMx1IO4LFZxnK3g58o3EVyx/TD+XTmj6tKvkc+v?=
 =?us-ascii?Q?X789dRas9mof7ndTpFyyP2ZuiqqY40p87ZCzQNPRvaLMyPxinMrUsW55IlNA?=
 =?us-ascii?Q?IBuP39AQUkqyZlP/jvFYRIJKUinvnJ7Rxd71/cPR3L0IJO1YxDBSYku67xdr?=
 =?us-ascii?Q?UHMdPY9FJcnAGvhSAxl6iuAip0F7aQkny8Li8Cm5JrByESmyaaywUVIfSkmv?=
 =?us-ascii?Q?b6nQ1x3xsU+Ta3i2fvkrmfE+r3p1RLKNOH23xu2iXty0WL1KO7ai7JQ2YvSS?=
 =?us-ascii?Q?A+viFYIjluEo+Y82LttgDggzIS85hG5BAIkGdIUORQoE3zijYArHvVN+XJ1o?=
 =?us-ascii?Q?ib0HWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZtmMFtxRmf6uDn8QAAZoQPX6ut1y58jMT15W012vqBmLVJZw7gbgUkQjFfPqHOIgIpUM5ypRMSlVPOqGsvsOZn9WZUmwElrM0MOgqUx+9bDJmIBWdtbtkM7pOib1nMloscrDKDQ+Pk91ITxzFhDJHgf70CUqDRVqHnUHUl3ptn3mc7WHzvPqIrDuoESfHHLPbUzBOycpj2ZbeycSEAQJ+3BEImhvIWYdn5iUjVDFEspj1bGsp1gRLDNvGay3pzSdoN995oeYG7yCL5mqn0+nZKwFEn47BnvVlrg3j9DZA7rKEDBDqg0zL5VPLuxczHzmmPnGIvMf1VD2pBeAbyxhQXRhnMf/oJ6aeFg7rXSCMjY+7A8Sf3joAeW03JrPuR50D+4C9rnxnbU/mHc7F1NVmt3WknloHsdoXPhJgy7KuyIMmO0Ka+o1hx4HG8YmP8Ht
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 04:59:03.3314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b94cefa-e677-448e-8fda-08de6d181b1c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9052
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31696-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0CC41140E88
X-Rspamd-Action: no action

On Tegra platforms, multiple SoC instances may be present with each
defining the same GPIO name. For such devices, this results in
duplicate GPIO names.

When the device has a valid NUMA node, prepend the NUMA node ID
to the GPIO name prefix. The node ID identifies each socket,
ensuring GPIO line names remain distinct across multiple sockets.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 9c874f07be75..daf5aaffa28a 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -857,7 +857,8 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	struct device_node *np;
 	struct resource *res;
 	char **names;
-	int err;
+	char *instance = "";
+	int node, err;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -937,17 +938,21 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	if (!names)
 		return -ENOMEM;
 
+	node = dev_to_node(&pdev->dev);
+	if (node >= 0) {
+		instance = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%d-", node);
+		if (!instance)
+			return -ENOMEM;
+	}
+
 	for (i = 0, offset = 0; i < gpio->soc->num_ports; i++) {
 		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
 		char *name;
 
 		for (j = 0; j < port->pins; j++) {
-			if (gpio->soc->prefix)
-				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s-P%s.%02x",
-						      gpio->soc->prefix, port->name, j);
-			else
-				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "P%s.%02x",
-						      port->name, j);
+			name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s%sP%s.%02x",
+					      instance ?: "", gpio->soc->prefix ?: "",
+					      port->name, j);
 			if (!name)
 				return -ENOMEM;
 
@@ -1373,6 +1378,9 @@ static const struct tegra_gpio_soc tegra256_main_soc = {
 	.has_vm_support = true,
 };
 
+/* Macro to define GPIO name prefix with separator */
+#define TEGRA_GPIO_PREFIX(_x)	_x "-"
+
 #define TEGRA410_COMPUTE_GPIO_PORT(_name, _bank, _port, _pins)	\
 	TEGRA_GPIO_PORT(TEGRA410_COMPUTE, _name, _bank, _port, _pins)
 
@@ -1388,7 +1396,7 @@ static const struct tegra_gpio_soc tegra410_compute_soc = {
 	.num_ports = ARRAY_SIZE(tegra410_compute_ports),
 	.ports = tegra410_compute_ports,
 	.name = "tegra410-gpio-compute",
-	.prefix = "COMPUTE",
+	.prefix = TEGRA_GPIO_PREFIX("COMPUTE"),
 	.num_irqs_per_bank = 8,
 	.instance = 0,
 };
@@ -1418,7 +1426,7 @@ static const struct tegra_gpio_soc tegra410_system_soc = {
 	.num_ports = ARRAY_SIZE(tegra410_system_ports),
 	.ports = tegra410_system_ports,
 	.name = "tegra410-gpio-system",
-	.prefix = "SYSTEM",
+	.prefix = TEGRA_GPIO_PREFIX("SYSTEM"),
 	.num_irqs_per_bank = 8,
 	.instance = 0,
 };
-- 
2.43.0


