Return-Path: <linux-gpio+bounces-31735-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAJpE6AjlGnXAAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31735-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 09:15:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 696A2149CEB
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 09:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AE623004609
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 08:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686612DECDF;
	Tue, 17 Feb 2026 08:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aNI0KVNL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010012.outbound.protection.outlook.com [52.101.61.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E6815746E;
	Tue, 17 Feb 2026 08:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316116; cv=fail; b=lpcK9kIs7Zrk+J4NX+d55GSj9aw9oQazVxbPdmOMVSdJMsDJ/qq8NTdivO6s7AKGjHEmnLO31JDb7ibigDuPvV2Cc8xkiancq/Euwky6PMoDev1fvvGXw6yQOhDRM1b1tO32JTQEcYuWEV4QZDowi2FzNxdpL++kj2jjSldGLJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316116; c=relaxed/simple;
	bh=W1Q60ku/SeduzVmAV5fb8Mld83dcDLvh+c79a/hU8u4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bJnAcohCxnC3juvV3iilDgvA8KKN6lr7ngue2fLUoaTdRGl42SBQiwamTs4A6VkJfgxfo8TnX8Syy5wF8yuub1uTrx6wkTxRNbrCdmoI4XhGeUUO+sDbmo/sn4INytWBjcw3+4xlIg5RGlHbTVC1LhAk9+rm6mgBNDiRH86DqaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aNI0KVNL; arc=fail smtp.client-ip=52.101.61.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEgGJNpPnts0jvdg81qZZypHRvoLWhrgkX6CZuy/qEVHcKMTZRsJ0VhrqrMaT19hH37ch4S+qCJyWbFfXfkaTfuD5pj8qjz8WUrBfDb8fp8TbQUtqgyMknzbFzbzfYvmXVtgU9IIWlJg7IU/iY9lnCZRO4HNext5Nkm/WcAQJiIceJ3jwQn4Wc/2LsPHMvr4eoOkXLt5PNkNhAlVGIUqZxcZ/K1PA8oMrEaUViYFvyUKlB/c13VUDdI+J+QshjCIKfazHSmbxuWfvBZVOJh9sQxJcSwFIpyWxYeHGFZ03KP+ZZyk58eD1hQCVFpZQaRM1Qaw4bwUJVjDjr7EoekVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yyx1+N8D3hxo0vIt0ldTmqRHJfj57BeIbEFGj2rB5G0=;
 b=HV4VNVWxlIO9PQ1O5SP/RSLxu4/PP2QZgHsnf9LFdkdgeKamoe/JPI82O1qZRKBvJ1UNE3BAjpSD/pEehKXec/PuT7BVwlx4TryyB5O1PCzHtRX9xM5cA3VVE5vxJvVyHTXFA+4U6+7GDiMuiDqhHW412Ewfh8jyu3AUmGVzESV8cWCzSz2xCad4W2Q7yM/WaO/JGS5B7gF9iEFGHffpXt3GmHDeZoa4Utlg9Y9WMfJyN8+k/WYl1ycdEAW38HAfYOiCBi2h4Be8qUO6co9ArIE6GAPCa9xM3iFPNV1b/Z2UWJ8LLHsGHxx/Yt7ag33rhOvI2WMtL4gCYGONG1zNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yyx1+N8D3hxo0vIt0ldTmqRHJfj57BeIbEFGj2rB5G0=;
 b=aNI0KVNLjba/4Y8ngJoYPJVMuIgZe4U6P52Gl2ImvO9xCNXAY5AjE1T8FlH+A5JEeaOUV4OphdhjDP2snFkbpO8Qonn1ni8P8sMhCkGot7kxTUYnVh1CfdwA67UO1wNcGui9ghA4MweJSpEHP7V0XtjEIUMobxEppxHI8L1l8xaSxMR7BZUKVS5UafeTcFuQf4DbkHXqbCRXhv9/6VV/xVKR0RQiYtuNoXd7nNhrHYVdGTLa7ruYgxJiYjfCanBuaRxiT053Z8w/hyy/MFflW1NOsAep7XhPP/cWwldYN9a+TSAKeJ4msV+1Poe/fi68BAoRBh1Tah8ob/ir2xqNdQ==
Received: from CH3P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::32)
 by IA0PR12MB8088.namprd12.prod.outlook.com (2603:10b6:208:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 08:15:08 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::b5) by CH3P221CA0006.outlook.office365.com
 (2603:10b6:610:1e7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend
 Transport; Tue, 17 Feb 2026 08:15:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 08:15:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 00:14:54 -0800
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 00:14:53 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v2 2/2] gpio: tegra186: Support multi-socket devices
Date: Tue, 17 Feb 2026 08:14:31 +0000
Message-ID: <20260217081431.1208351-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260217081431.1208351-1-pshete@nvidia.com>
References: <20260217081431.1208351-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|IA0PR12MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 0946c61a-05a0-4810-2792-08de6dfca9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hD1b2nmiqJs0aqrzgxf484dtz4CQo7gfGBn0XynJu+lY/fj5SM9wTbADdNN8?=
 =?us-ascii?Q?FZ/rtzmLAG08GDLod9AfX9S2why5xZNcRdzcSnQcTwLKzFSoztIFHpSzR+YT?=
 =?us-ascii?Q?kES0kUOyUkMA1wQc++d8QchXbs9mGBX1UBwP/ESPIkcAbtG6FDSi2Dk9nZiF?=
 =?us-ascii?Q?Vf8u0KhoYRhz2vFw1xWoJJWW98pY3Kf/5cn6KGN1kT8Yvzy3I36UPzk7exKK?=
 =?us-ascii?Q?58j2YvVt9mcwJA1vEsQbOZdNIeb81aotfA7/E6ZZN6+DThCBiJ10/1aS2Yq9?=
 =?us-ascii?Q?6aQjhHd0TTaMkMWVg3XzE9FBJVCQLOPYGKXyaZUsA3gjohknj7w+OS7dGbYs?=
 =?us-ascii?Q?FmF//rhn+sQa74GUjLwxytNPUpjsM3Zimp1GDIMDku3d5G3mpIq5zRT8K9C5?=
 =?us-ascii?Q?S5jPjEUth9ixuGUSWK2jA8SCvU9MDvLNhbLgB2NzJ/mCmKApBJ0YioMzwE/I?=
 =?us-ascii?Q?BZfGe3QjKFeozCo+uZtaEqL5zJ68FDrnxx2/YCC1aiPxDGz91pth1dcGkRt4?=
 =?us-ascii?Q?lsbYNihqvMuRtGPt1Y7rvUQfvra4LxVafZb9lnp1UMkQd7szWEryU9YuIhUk?=
 =?us-ascii?Q?i4tlU7SyOa5y3Et4gOVZrFuX9FLS5vWVOaaehQZqRT4tPkXkC9uCrazWzo7L?=
 =?us-ascii?Q?Jxz8HL2V376QfeUtdFE9FBVyWjhl9n8xfx2LuZQC8XCRwI1SnYcXZfofaWq4?=
 =?us-ascii?Q?3qP0tELQ9VvvVXYOWproH4Ug/qIvnKPubIxL8moh0Y/8pLUxkototf9LLA1O?=
 =?us-ascii?Q?KTZo1RXMdBSwHFpr8EavsxdOmOT0WJcmKzyUxCK9/qK1/XkUh6RkEWFqayK5?=
 =?us-ascii?Q?aGRsPS/0+e0g4doq3iTs/wVeLytYYsuz3fFh6TIJJ1lPVkaXguFdmHK1Dqhg?=
 =?us-ascii?Q?gAioxv33VCax9h18da6Zs9FIyZupXZSuiPfPQO3frQuX33Jn75QzBRCAk8zM?=
 =?us-ascii?Q?mYEcOTvJFnMFwJmxFmeEJ+OP9Cvyj1uoHi/4QWefxpnDh0XU544SEHH0HaFD?=
 =?us-ascii?Q?/mouVLebxlEs9+o8xtRRs3LTnKf1ojPGIE+C9KJPyA/hB7K2atMdijIn3h1o?=
 =?us-ascii?Q?YlV7WpTG45j8IeMzGkbSNAUNgNWF7vCKI4haUb5h2AJFj51r94ZljHAltyrs?=
 =?us-ascii?Q?im2QOy4Hp0yKxOxBSDkAyqbIu2TdHW/FT9HX4rB787FyXjYDMlxmBIdntZvq?=
 =?us-ascii?Q?nfs9vLhN7eBZvbwzh3Il5dx5TF9Qlc3KI2VTpWchDF87cNgzxQZnfRopXpDW?=
 =?us-ascii?Q?mLjFLNPMRqZnBMAV4LMDT4u+YJeXUW9yKtJUffghKYqtbcwp+cYx1hf+wuk3?=
 =?us-ascii?Q?0XNugjC4iDHGxJCJLI402OUaT9vkS2pcVWXZqNSF4duI8kQZhEut7Ql3w8ZA?=
 =?us-ascii?Q?f7RBCNUAoLn8yjPOyPWXLvjz99v3cjzlyDRoKFGrbh3Zbm70A3yCCQHgShXo?=
 =?us-ascii?Q?JEeo5r5QEX6QHTmYQG8SJncrtYDFY/2LoQRTpAB5brcc1cV3YLGvU6UMzX8w?=
 =?us-ascii?Q?0vONSiu09pfRWedz8J0B9ZmEdGIyjSVb01koR8ld1Sg1fIu4WePxEgxK09fm?=
 =?us-ascii?Q?af4FCq7zXcow85iyWsyXvT6KaVz43RBJl9Usdp+fWeCFU/+8XknuMOHiiBbI?=
 =?us-ascii?Q?TSfU+Inc4TGXQwjrb9n0bcrudVsMYOzP0HW4YLhOkX7JpkiznrLPeWYjONZv?=
 =?us-ascii?Q?igaA+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y65CdTfs889aXsGvXNFG/0VYVdk51JPe7O8RRIwVTO2HR38oeFsSGm8r/uNB8T8ZreoWMP3zkZRDDTx1Pmb2294cTcrHKVLthtgTDpGeZWIiiybRYIV1CtFrmcEX1/SlUcIhzvHJyT7Yr6SRN6jS/bmEVTGUyAd2zYeeceeTnLmFNxs7t4IYmKHrUXiPbXcUlznFL2M6VN45nvCv2QhNsBH7Ou38pXQ59XS3BPn17FDPArPXtsKSCh+58odpMFiLy/e7qnAm1VTyoi6NF4LyU3CF0FvMhWp05Rf1mX3z/7T1luMI2MeTsOuIR8A+bUzwZVL7WQd3FvPf/cA9FsmmTggaF6duAFDqnkH9H0IwB+rtBT6VuuJQtW445+lY9tVw7Ll0Wun5i+chzYLEq6Y6u9/RB/VEha9H97b9YSAtPIcYGgECBmRbz8k9+vkg2vh4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 08:15:08.2594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0946c61a-05a0-4810-2792-08de6dfca9fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31735-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 696A2149CEB
X-Rspamd-Action: no action

On Tegra platforms, multiple SoC instances may be present with each
defining the same GPIO name. For such devices, this results in
duplicate GPIO names.

When the device has a valid NUMA node, prepend the NUMA node ID
to the GPIO name prefix. The node ID identifies each socket,
ensuring GPIO line names remain distinct across multiple sockets.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
Changes in v2:
  * Split the v1 patch into two; this one to support multi-socket devices.
---
 drivers/gpio/gpio-tegra186.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index f04cc240b5ec..fb26402b6c47 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -857,7 +857,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	struct device_node *np;
 	struct resource *res;
 	char **names;
-	int err;
+	int node, err;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -937,13 +937,23 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	if (!names)
 		return -ENOMEM;
 
+	node = dev_to_node(&pdev->dev);
+
 	for (i = 0, offset = 0; i < gpio->soc->num_ports; i++) {
 		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
 		char *name;
 
 		for (j = 0; j < port->pins; j++) {
-			name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%sP%s.%02x",
-					      gpio->soc->prefix ?: "", port->name, j);
+			if (node >= 0)
+				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL,
+						      "%d-%sP%s.%02x", node,
+						      gpio->soc->prefix ?: "",
+						      port->name, j);
+			else
+				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL,
+						      "%sP%s.%02x",
+						      gpio->soc->prefix ?: "",
+						      port->name, j);
 			if (!name)
 				return -ENOMEM;
 
-- 
2.43.0


