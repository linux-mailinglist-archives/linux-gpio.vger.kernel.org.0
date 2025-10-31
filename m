Return-Path: <linux-gpio+bounces-27901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E774C258CC
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 15:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BE5456746E
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 14:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D046934C811;
	Fri, 31 Oct 2025 14:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lwcGBhEk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010015.outbound.protection.outlook.com [52.101.193.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796134C14E;
	Fri, 31 Oct 2025 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761919707; cv=fail; b=OioZJaHcUjZRpX5q2qCQvCt4iWoDkX7m46AfbqSkAt3ERy0uCG6fwGSvr2O8bWa+jDl6l40TaArIFFJpOozvwRYmAGnIpb0tNHOkVbmWCg/JnGxz9iuVZ3xoVY3UH+CZyqOWjuIjyo4zHs6oBHKskg3FK6dCV5ZEcqY++XbzN54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761919707; c=relaxed/simple;
	bh=GnfqOjhwo52s9Vn6O5zSpQcswrR9NYm/0MficsYPISc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DGqwXca2z2e3cFXCAZ+c07kmDe6//K9tIeSykacGaJ2qbD6vDRHCMekyelyB2pPaLQSZk5kLnfsogsth120Nm2s8I+YS8h0lqRHASDg4ixd22LLQs5d0VMTJr2hMYqFqmlUde4gYLQVvWL5qRVOEnfwGx6aQ6mr9DNhkmnvpsZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lwcGBhEk; arc=fail smtp.client-ip=52.101.193.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0co7Z0E4rj7T7GFMt054JpEcpc9ZqsOxgQNmncWT3jvm1uJtqGeftRqlyKskjSndu/RNs+qu5uEfe1LQ6ayhBAyU4sk457oMq8AdKITG+xvQRVptU8HrO60y/uh+9IE34I7QNXVpdxJlon/E+KAuWa3ib1t9rdOk7cj4iXTST2q7s+SfIBFCvFn8jMFxPCMyYslkMM3svQNcYU20Q7JLX/mqCLHGJFxYPyFshkDBN20DwRhHmNJxnLnKZGP2lzj7PCkWvRZDJ46puCADgMnZj7ob+pV2ctn4Y0KeR9vCrcjn81fLm0xEslYy5tfZ7WGDn1Uw/CtggRH2+McaPa4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6WjVVJvEkPHES7+SGevJfBvd/Y5Tl+FMVNIGv/kEPY=;
 b=Wwxn0Oqkeospqb/jrQsaPagPRAei7pL8H2X/Xov/MWmQnWBM7dpScX4lrkEQH6Y7Uza8+dVQQeHSsjIcOc5V82MRojhj/vpPh5k+ukt8NkPJUE8nQV/kxaie8p2FurcqKkbc2P5ygz+QtsXgStx6ggBbSOjU6eZ6sBtKpptFKhlnOUdFI8CBrVwWH2iOenrgWCCkrOx6xXjHTa/974a/Sw1jJMpfYetHavBQnvh4Q3qe7qllgQRYKYyBi5qXTsJ5wH4L6tLluK7CCvc3EHybf1AosoQ+R+2vZwptG/TZ1salRM6smP5Cg8L4BNeXdTARx3+7GbdfqQTZw6QztGiNxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6WjVVJvEkPHES7+SGevJfBvd/Y5Tl+FMVNIGv/kEPY=;
 b=lwcGBhEky6+fcG75Zf8UFqBgRABoQL/QiobbeXL6Fr3vzkG5Jkb7sTDqihJCVmysLj7G5Szt/GshWU0aSSsGq118irAQTFVMmESieWwbRIXp60HLYizDz6mXYvxn9lLXHbDaLasdNNLslJW6BoX09MPOg1fkU8e4vSpRiCcos18=
Received: from BL0PR0102CA0010.prod.exchangelabs.com (2603:10b6:207:18::23) by
 LV8PR10MB7727.namprd10.prod.outlook.com (2603:10b6:408:1ed::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.13; Fri, 31 Oct 2025 14:08:22 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:207:18:cafe::47) by BL0PR0102CA0010.outlook.office365.com
 (2603:10b6:207:18::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 14:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 14:08:19 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:08:07 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:08:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 09:08:07 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59VE87JB3982032;
	Fri, 31 Oct 2025 09:08:07 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Fri, 31 Oct 2025 09:08:04 -0500
Subject: [PATCH v7 1/3] dt-bindings: arm: ti: Add binding for AM62L SoCs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251031-am62lx-v7-1-cb426be9d6ee@ti.com>
References: <20251031-am62lx-v7-0-cb426be9d6ee@ti.com>
In-Reply-To: <20251031-am62lx-v7-0-cb426be9d6ee@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Andrew
 Davis" <afd@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Tony
 Lindgren" <tony@atomide.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	<linux-gpio@vger.kernel.org>, Bryan Brattlof <bb@ti.com>, Dhruva Gole
	<d-gole@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050; i=bb@ti.com;
 h=from:subject:message-id; bh=GnfqOjhwo52s9Vn6O5zSpQcswrR9NYm/0MficsYPISc=;
 b=owNCWmg5MUFZJlNZPaFqrAAAYX///vZv3+16vx/L7avTnf6ji3+25Nz9rXtp/u7Ps/9U72+wA
 RlpRhQAAAAaaNAAaDQDQAAAAPUAAaDagMhoHqNDQaNqADCNqGanqeAohkaNGgZBpiAaAAHqZHqA
 NNDQADQYgDEwRkwTEB6I0ANBppoaaYgDEx6och6mTTJoepoNAAYmnpA0NANBpoGCaBkxHqDRkAD
 T0QAYjJhADRgJoaGgNAADPFH3X4TjMmLkI6RGhGkQqgGvryjNELjWRywIpwLzpcECbNvhfKXCvx
 HD+z2OvBwo8m1ITRkyp9ex/Xw5hp9+DVeo3kFFP8fwPKbZffsq2sp0+OvCOBiAzP8H5xAvD4fZX
 Xsu7JYpf/Zi2eZDjxEGu1UYPI1h1AAo0WtIPH3V+qyb1a6qYM9G59PWnWQFvPsh5yvanW1MbJre
 jf1AMn9UxEPJ3sX9mZytCjengfYgZPilYNupZhaDqIWf6zyJGkn/0f5CXqjhhg1Y+miewSiVtt5
 Ehps7bPYRwGYoafzQlsKxXBrC5NA5ANP3AGbHfX65oQRhitTASzMj0VTIeEJGJASjW9Kc9EAo+g
 xKb4APQI8whmjYgoDpXCHwigdZan7uCmb/A1CAKMKiT5WjZmSmKKYtzTYg6A9TVnYIOgWl/xdyR
 ThQkD2haqw=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|LV8PR10MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: d58078c9-570a-4e9f-8e43-08de1886f1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|34020700016|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NE80WUd3SzE0cnFKWmoxSHRkZ1VJZlRFSUltT1IrUHd6WjVpbXRBeFpFZzBI?=
 =?utf-8?B?VGlDRXRreklHWjRIbW9hU2VhNzA5QnNEeit3VHZBZ1hlak5GV1k5a3dWUXVF?=
 =?utf-8?B?WUlUb0dWNXBJeXhobG5KM0tZWWJobFNnUUpnZGRZdlR0ckFNK3p5MWVQWThr?=
 =?utf-8?B?NUI1OElhSU1HNWZQa1hYWkYrR0o3R0l2SnFUTWRwak9PM05yekE1MmZmYi92?=
 =?utf-8?B?eEJrclZzeVJSTS9IckNXcUp0QnE4L1VGTWZrd2h1dnFDdnVUV2lZREFkdFNt?=
 =?utf-8?B?ZnlLbkFudWhuVHViblpKb2RIclAxcGt3QUgvTmVERFI4VzZaR2NDUlliRlZs?=
 =?utf-8?B?R2hNajVNUUdmbG9jeUtZNDVzangwTkNmVWFnRU5YUm5DUzRqaEFpS1dxakEx?=
 =?utf-8?B?a1FzV2FOQ05tbVlMM2ZIU09MRzQxZk5xSXBLOU42ZEwxL1lqSEFVdEw4eFU5?=
 =?utf-8?B?eEZUVTNPN3RNV2tKTWthZVUwaGxtdDc2SGh0TUJPMDJYclpZWnpINWxCN2VU?=
 =?utf-8?B?d21iT3MxdzZPS1Fqd1k2bHZOVHRBMk41NjkrcGRBU3JySWhjQTFVWFUzVXEw?=
 =?utf-8?B?blNGa2Z5eHRWejBmbWxSTk53ZWlBRlRSY3pabHhUYTZZbWpVQVRENkFSQU1U?=
 =?utf-8?B?ei8zR09iWGhyL3ZWQ3M3VUZ1cTN0VFR3bTRBa0JYRUVidm82TGU2aGYzOStS?=
 =?utf-8?B?ZkxMMEFxTUZHeXY2T0hPdTB3MFIrcUxSM2xRbVVsRlhFdGNxZE9JS2hhMlRS?=
 =?utf-8?B?ZmlwNUxMcm9BZ0lsbGF3czlMNU5nRi83dExiK0F2MmVhYzIrejdkenM5SWJy?=
 =?utf-8?B?dm1aelpYRStaT0prMTM3LzZYQXFzekNuSk1ZQUJVZnRyS2l0ZEorRmQvSmZM?=
 =?utf-8?B?aEhQRDNzS3phUnFkSmRyTitnWHJrUm00TURMNjdlaG5wYXlrN3Y5NHFqTnZ6?=
 =?utf-8?B?L1dxUzhEaVpkYUVtZGpMQnVxM01vUXFYZ0N1bXpFdHhvUWRQbDJIMUlJSU5S?=
 =?utf-8?B?cjhkUUIvM3hIV3lJTjh5aGRXVXJISUZmSUVaWGJhNFY3L2EzczUrdGYvQ3Fw?=
 =?utf-8?B?SmgvUUkzeUJmZFUzOFNPMXRtTDV0QjJ2QW91YUtHN3lBbzVPMnZSdXVuWnRk?=
 =?utf-8?B?emNMS0dTb0FBVEpYNnRjdkZKOGF3ZXp6MXdtbkJUWkNRdlhBSnpKRlp5M2J6?=
 =?utf-8?B?a1BMdUcxalM4bTBHN2dDTWJEQlZpMWxiWEphWGxOeDVxYzdaVkMzV0E3Yy93?=
 =?utf-8?B?RmxTZ2twMEo0WUJQNHZndkdWTFNWb09iUEFiWU5RS0VzWVJTU3Y5NVFvNmRH?=
 =?utf-8?B?TXQ4dDIwSUpQVVhnbXh1ZjZTTFNJazV2RTFXTmxkRnd6OUIyODNma21WWWFk?=
 =?utf-8?B?YWtHYndkYnZUWDl3eG9pUWN0bkc2Mld3Y2JkZFMwdWFDRzh2L2tzdk9CYmNh?=
 =?utf-8?B?M05lT0tPbnFxSkE1c0lqT1Z2ZW9QU2xaeHZoQUdkM3JTSGc1ZFEzQ3JJQVFS?=
 =?utf-8?B?NGMwVzRMVzV1T1hoeHBqTW5sNjIrcEpXakVTZ2t6V0dyeFpwOFQzTEc4dnZO?=
 =?utf-8?B?OFhsU3RaZ1l0Z2YrY1RzNEhFV2pkd0t3cUpDa2hsQ01FRTMrYVVmSkorTnN4?=
 =?utf-8?B?MWxuTWxkeHZRSXJDVUV1bWROd0oxbDFFSmNlT084MkY4MVE0bHY5eXRteVRF?=
 =?utf-8?B?TVViWE5WSW1VdzRaV0xwZTBpbW85UHdHbTgwdXkwRGx2STZweGFNRDFITjdz?=
 =?utf-8?B?dGtncnJIanB5ajZDL1VRYmdKYXhpUUZYT2szdi9qcmlvcXl4Nmp2eC9hbHR5?=
 =?utf-8?B?VUVKdHUrc2g3b01rMlduY2NQTnZoTTU2R1ZKVTdkZUxTOVd1dEFPK3EvL3p6?=
 =?utf-8?B?SlpBbE1lVURRVmJtY0VEd1VZTzM2S0pSMUpoY1lQT2xGcUFjVXAzV0kra1BE?=
 =?utf-8?B?K0gxczlrRmMwYU4rYm1GY3MxNzVrUFFqeFJHb2lDQy9SU2JKM0p6QkhpcWd4?=
 =?utf-8?B?QXhuSi9jajhFTWtOL2c4SnlxOU4xL2x1K1E4U3pSVHdnK0dhZTRnbXNCUFhq?=
 =?utf-8?B?TUUzbmxnQUdrV0ZvYUhmZzVRTDBtNU5TekRmTEJjMG5iNExHZnJzUVczUXhm?=
 =?utf-8?Q?Xs38=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(34020700016)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:08:19.1933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d58078c9-570a-4e9f-8e43-08de1886f1ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7727

Add the binding for TI's AM62L family of devices.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes in v1:
 - separated out devicetree bindings
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 0105dcda6e04d5423c9a06cbcbc6f090a79b33f5..6142e12e2a412eeaac833acae5c1ba71bdaf0a54 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -37,6 +37,12 @@ properties:
           - const: phytec,am62a-phycore-som
           - const: ti,am62a7
 
+      - description: K3 AM62L3 SoC and Boards
+        items:
+          - enum:
+              - ti,am62l3-evm
+          - const: ti,am62l3
+
       - description: K3 AM62P5 SoC and Boards
         items:
           - enum:

-- 
2.50.1


