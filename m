Return-Path: <linux-gpio+bounces-29490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2662BCB8DCC
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 14:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB57030A2167
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 13:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF0E3233E3;
	Fri, 12 Dec 2025 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="fIPv6M7t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020094.outbound.protection.outlook.com [52.101.84.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F382218AA0;
	Fri, 12 Dec 2025 13:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765544624; cv=fail; b=D5WA0nuTVxvVdp+/XXwFqvY2mgagvDsZdJxZEgKNO9SlkKNzNwStBSG4fEUeD16dNk8ZORbiQwux0GtBespAx82L4MOthfYT8LuD42o6MMHsm5nDykn7PpclVRWFqXMJe7Pv8e/+IoAyX4KwUrTdEoUi4LGvPnkZrGPFad5lop8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765544624; c=relaxed/simple;
	bh=dpv/bDSax0c0B86GdLRpFpHsBS5zS4r3RE+yILawXM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HWOX0+f4gJgrU3eq0XKJDv0pw6B26DrDyTJ8+UYGC3Cjwb0QR7qB4ogLS3iGnzOorCaKJ/ztNck9VspKp3U2G31zqMrFLBTO3DKLQm0A/ImKDX5RWHRiV/3oNrJKPXMurSONn95Bc7QFsHY5rO/j+If7hfcBYR9zAZTPT4C1HU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=fIPv6M7t; arc=fail smtp.client-ip=52.101.84.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjumeooGdHldO3AbeYNyszs8Tfs7XUnaY/Si7ihKLr9leiVifiiipuIQ4rDhYwTIsSaQlUOvT5SMIF+fr22QXU3e0r+xYrK9kwEg4zv6OgFqAub4eIg5+fazlnUE97LRGpS459h4ZJsQ9y9m3HEUyrY+3LAVgeEI9/FhGAxk1oVcjK6xnhUxqX72U7QADAv4NHKgOW2mv8Irt+cVtb/we/tvf44dy41VqzG6c7i9cZEeKxQy9+FJ5EFo5L5hGFFoBnqgMWxborACPugQ1fqHlu9QXLpSfX7q7apG5bl7WplI5ODyawJ0aZ6nDCiFg0LpJKxWPYfwhoU8vwg7Iq2wnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AINkJf2s08O2FpIdaqOK6YljkOE8ZozmTnApmE8eDmA=;
 b=jc3toszZyPMejD66b4QALMDBDiRH7hKk5oXeSVY0ikJCWCzBnboafuYe6F2i7whLJOPjDmd2JZOT+c+7uUoWHenwIcB2HvqqcwPtddaEwioYffmzjmADUfbiauTkfiDxnf5nlSkqmwA6s1+c3SleodtPBD8Z4RUk0ZeFr6oKYcGC30JB/KQhtjOE8xd/YPQSAP+7LSBVAk/YaCgRZht5b48n1g6s7Frs1sfqXUJJE9y1c8cSnnsIcNRXeEZXtDPu4LdGbBQv0fmwIy7Pbl5RXbk90VqVZU49QzkQHeHWtvztsCtF5mAWnTXX5IeyRO3PdJYv8fCQVtRNuzaBLQ7b0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AINkJf2s08O2FpIdaqOK6YljkOE8ZozmTnApmE8eDmA=;
 b=fIPv6M7tGG/RNUC8pjLRLti2x9KYvbnZN2zqOKo9AOI/FSuPXpUNmTrrgRu2T7gxSLzuG6Ot+iw/IpP4KA0kUYOJqXaL6NnzIkO/J8pkCQls+anVLv8EXDM4HgNAo+TanLzfOq+G6RzLs+dRSZOeY30mZWEsXzPP6dlaDETRoeTKpOUn27E18dytRl4sWau0EuDffwmrgAIAYpdJyiGn6TmqW2qoXl31O9m+S8X6KkPY7okquTK7vVdgtRcf8fg1Ccp720kx7CA3GXG+Te6t1h8CLetHwK7tQ2rKaZTc9OsEngRaiydK+Q133GGa4SoHHu0s9Y1lG79gbFSAkeB6bw==
Received: from DU2PR04CA0212.eurprd04.prod.outlook.com (2603:10a6:10:2b1::7)
 by AS2P195MB2248.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:59f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 13:03:35 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::49) by DU2PR04CA0212.outlook.office365.com
 (2603:10a6:10:2b1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 13:03:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 13:03:35 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 12 Dec
 2025 14:03:33 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Fri, 12 Dec 2025 14:03:17 +0100
Subject: [PATCH 2/3] Documentation: gpio: add TCAL6408 and TCAL6416
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251212-wip-jremmet-tcal6416rtw-v1-2-e5db1b66d4cc@phytec.de>
References: <20251212-wip-jremmet-tcal6416rtw-v1-0-e5db1b66d4cc@phytec.de>
In-Reply-To: <20251212-wip-jremmet-tcal6416rtw-v1-0-e5db1b66d4cc@phytec.de>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Levente_R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>
CC: <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	<devicetree@vger.kernel.org>, <upstream@lists.phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B96:EE_|AS2P195MB2248:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd8ffef-8388-42a5-11c5-08de397edbe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ME05SXlPdUpWNEIxYUxXNkEwV0JDY0dmMUt2bUh2NjgwczN5U28xbE13bDlv?=
 =?utf-8?B?NlQ4d3R2ZFFvK2E3bXBQMkcyTFA4QjE1MXZhNTUrOU1lZURYVVV0RW5ic081?=
 =?utf-8?B?cUFKdklFa29YM2l0cndHN3JhTi96emJId2JVWVRnNHR3cHN5TjgxNXNEM0py?=
 =?utf-8?B?VlRlbitORE9LZEMxK2U5REwzdmdRN3ZCaXJ5b2JMelVtZjROUzNnUVpHSkdI?=
 =?utf-8?B?V3NrSnVIMEVDU0hBQmU3VWJRWHFwZlVla2c1UnRKWkxSckgxUkFnajg4am1v?=
 =?utf-8?B?YTNVV0htYjFNSGhNci9meGRsNGJZc0orTGo3MGU0b3ZVYVVnSjh0bE5xRTR2?=
 =?utf-8?B?QkNLbFI1WmRYVWZIUFc3ZkVNMXMvRVllYzJiZlNWTFdEN1JoMjZrL0ZQU3lX?=
 =?utf-8?B?NTBoSW9MWVR4aXg0Z0Q3SjIvYjh3MnpqTEVSbXMzTnpRWlRnV1poVTZtUHBt?=
 =?utf-8?B?RUZZYVhQQjNad2d5Q1Q3MkRjVCsxYWt2ZDN2OEQrR1dKQnZBTnQ3ODF2RXU0?=
 =?utf-8?B?T3R0MVZoaERqeXMzMmI2emt1c3JDN1FWbkRwNDBxVGpWeG5SODg3UU9RSFlh?=
 =?utf-8?B?VUc2MncxK21UN1ZNL0k1RXFyVjFoYi9EWkRlNExMWG1PL21MR0hvd1pJMVgx?=
 =?utf-8?B?SnpzeDFsSE9mYytnZEh1dkNNMW9GN2FjcXo1UVJzcUJjT0pvKzRkaUpFTUxW?=
 =?utf-8?B?S2FsdVdTdkFwTlBsV082RW9hVHc3Smk1VklFaTYyNFptWm9meFNvaXl2Rkdy?=
 =?utf-8?B?a1ZnWS96b0pVMW9qeHZxZVd2djhyU2pGVnlWNlV1bkxWd2tkTFVPQmVyd0Rm?=
 =?utf-8?B?QkE1UHZUemRIanpXTXhjeEpYL0pkRGlrL1hzTldTK2FsZ0tjYlkxQ1JtZS9G?=
 =?utf-8?B?UGNmajZSRGxYU2liYUp3bkU2SjdGWWNpZDVYMFZ1TTFIY0p5WkVxSHY2V3d2?=
 =?utf-8?B?TlBmVmRxaUFjd1lVU3JISkNGNXdVSUkzYnBpOXlpU2loZzBUclRqejRiOW5r?=
 =?utf-8?B?M2ltbytJOE9PUlVaY2cvUVhhNGFNSFh2KysrZWZwYUV6NklyQiszMUh1R2lO?=
 =?utf-8?B?eFBzWW5nYW1Od0ExOFJNQTZSL0d2SGExTVRrZnZyVGFva0Y5Rjc1U2dDOXRy?=
 =?utf-8?B?a3UxWmlrVXk4YUU3ODVSS01kZkZlU2tmalE3SU9LTUtURVNOdW1ic0FicTRB?=
 =?utf-8?B?WUdzUm1ON3YvVzU0Mk01TTF1VkJTYStGYkorbVpIRWhueHg1OGlnKzBzSSty?=
 =?utf-8?B?c2taWjV2aXExVWs0ZncxeGZXMGF3VXk4QllQTVFNakdKdjh1TXFRbktpK3Zm?=
 =?utf-8?B?SWRFV01UTU8rREJlMVVJZEpVdUluY3B2UGJuOEw0QzZlajdqUXc4VnpEU0dL?=
 =?utf-8?B?RlY3aTYwdGs4d2ZHL2ZsVFR3RDRrVUVyVEJLSjA5VUVVZnBhZnlHUjVWdXhM?=
 =?utf-8?B?Qys5UFNYclJ3bkxKcWFxTlpjOCs3Ny9FVnpTSnI2MDlRbnJiRkhuN1hwNU03?=
 =?utf-8?B?QnRlTEtWcEJIL1RvK3Y5U3o3b0tETDdGNUdKTkdjTGZYQzhvblE3RlV2NWln?=
 =?utf-8?B?c3pENUF3VFh4UkVZdzBTdm5Hck9ZTXFUR3VNcjR3YlFWbHJ5WW54dm5wNjkv?=
 =?utf-8?B?MHRLWmM2dG9PU3EzcjJYQUxVbVBCeFZPd3FPbnl3L1M1cDI5Y2RBYWZaVjRv?=
 =?utf-8?B?N1o1ZlBLa2pCckhhbElvcUlUazArT2V5WGlBbUlmdm03UkRWVnFXVzZGU081?=
 =?utf-8?B?S29OSDQzTEU3WHkvN2s4OXdBTG1FUG9PM0tKT08yRFFpTDg1Zmd6QjVRSHJF?=
 =?utf-8?B?SlBIVGx4bVdGeW9UdzVtS015ZUJOTDF1anNYNW9nTHBPQjlGYnM0OUwzbi9M?=
 =?utf-8?B?b0hqWktsZVFraWhxOWZKSXR5ZFFiUVp2bVI5Q0w3amRyL2ZlcGlEWnluN3Ba?=
 =?utf-8?B?ck5LTE15RnhVdnBScHF0UndiTldvWXhOSHVhSEpLUkRodzd6MEV3dDdoRS9l?=
 =?utf-8?B?QmlHNzAxM3BiM2IxT1JmUUNtVXhDVzlEbmhoQlV5RVkwY1doNEFrbFhzamZs?=
 =?utf-8?B?Yk9VdUFwaGlZemM2V0NxWUFxNlZockIyWVhBQWZTMC90bkU3cDlhMWNHYW14?=
 =?utf-8?Q?bVCA=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 13:03:35.0360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd8ffef-8388-42a5-11c5-08de397edbe5
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2248

Checked datasheets, the offsets are identical to pcal6408 and pcal6416.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 Documentation/driver-api/gpio/pca953x.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/driver-api/gpio/pca953x.rst b/Documentation/driver-api/gpio/pca953x.rst
index 4bd7cf1120cbaccfaefc346195d87d927c3afcdf..53f25fa03072d95d47443e30c89720a98f8c5561 100644
--- a/Documentation/driver-api/gpio/pca953x.rst
+++ b/Documentation/driver-api/gpio/pca953x.rst
@@ -178,6 +178,8 @@ pcal9554b      8       yes    00     01     02        03
 pcal6416      16       yes    00     02     04        06
 pcal9535      16       yes    00     02     04        06
 pcal9555a     16       yes    00     02     04        06
+tcal6408       8       yes    00     01     02        03
+tcal6416      16       yes    00     02     04        06
 ========== ===== ========= ===== ====== ====== =========
 
 These chips have several additional features:
@@ -196,6 +198,8 @@ pcal9554b            40       42      43       44       45         46       4F
 pcal6416             40       44      46       48       4A         4C       4F
 pcal9535             40       44      46       48       4A         4C       4F
 pcal9555a            40       44      46       48       4A         4C       4F
+tcal6408             40       42      43       44       45         46       4F
+tcal6416             40       44      46       48       4A         4C       4F
 ========== ============ ======== ======= ======== ======== ========== ========
 
 Currently the driver has support for the input latch, pull-up/pull-down
@@ -332,6 +336,8 @@ Layouts:
         - pcal9554b
         - pcal9555a
         - pcal6524
+        - tcal6408
+        - tcal6416
 
     2. base offset 0x30, bank 5 and 6, closely packed banks
         - pcal6534
@@ -390,6 +396,8 @@ enabled.
         - pcal9554b
         - pcal9555a
         - pcal6524
+        - tcal6408
+        - tcal6416
 
     2. base offset 0x30, bank 2, closely packed banks
         - pcal6534
@@ -462,6 +470,8 @@ Layout:
         - pcal9535
         - pcal9554b
         - pcal9555a
+        - tcal6408
+        - tcal6416
 
 `PCAL chips with extended interrupt and output configuration functions`_
 can set this for each line individually. They have the same per-port out_conf
@@ -505,6 +515,8 @@ bits drive strength
         - pcal9554b
         - pcal9555a
         - pcal6524
+        - tcal6408
+        - tcal6416
 
     2. base offset 0x30, bank 0 and 1, closely packed banks
         - pcal6534

-- 
2.43.0


