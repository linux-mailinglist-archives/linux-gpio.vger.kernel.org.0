Return-Path: <linux-gpio+bounces-28134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E6CC3695D
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 17:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C8761A44E77
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 15:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC33433A003;
	Wed,  5 Nov 2025 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NjuJilWY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011067.outbound.protection.outlook.com [52.101.62.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7B7338F38;
	Wed,  5 Nov 2025 15:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357628; cv=fail; b=n9zqHOTIya/xWjLeeCaEBZwUPNA5MKBh5fr0dGfxhLUzuWti2n1RgQ9XEzn86KP+Z5NsFswW5WOU+WRx80n2PXNGDqQG30FuGOZQlrwxNOMPMu/NId5E1cwl54Lfjb2is4/GdutOZMu+oPlfq+6NnnTwMupvnaCYGbBYhJQFCbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357628; c=relaxed/simple;
	bh=HLSe0V/aaV3UYz3R+2Lbeo5CHvDaJajbNDS4rcpVKCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=piedEXdkL+MrnMWkwxjHtI03wgu1ujcTrkb7QGbhLtMb+zJTswycdxhaK/EkOt1gSgivwq9n8gU6AA4TKtgyItscn0OJIKe3eEOsJ7nRlWsf+ItUnWCHU1cyT4kCUB88wDsvKFn4JVxYn0j79inNevbhIpjBRerp1IQo6IRidlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NjuJilWY; arc=fail smtp.client-ip=52.101.62.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3tRUS/M4Pge2mnuM4ai7eX5XD4S+c9A6M5NSvtsnxtvISP7u/GElaEkAl+CIrp/sC9EBqHbdQbktidyf5qCmqo4iSXoS1khURL7rh1Kc0aXYoK+Gop4Elc3s1C0jDk/THEQKxsZwjCrExtQUUD7gWgOVt/oBhZwyoeLyXJ5ULQf7ioQOkFNrtgResjUnDWWOL1hmTmaCGdsU4t0ci7+MFYFrY8cEwP2IB39aAH1/G43pzdmT0gEuByHsREEPYf1QYV6iJrAW3XcRifhM07d0BCWnXi5JWOTWBl7iwJyDRWgENKqRLBaF7gCoXqHE0HkvZMwmYm0wgfyuIDaFg7ixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h962CRkL+ysz6qrjulF5cjWF6J9POgfjZSQqPYVjs1k=;
 b=vMbQFOb/ABouGvZAYj9Ni/pi16d5yOpHzt89OmPwrGA30sQu4EXytcAYCQyJjTJP4C6OKZS4JTykRwhCR8FO5AWWVVlTajGfUyZsS6zJsKCYTa+Ygaz8o2SB3+gd+T3zDV63LARxmg9bhsr6O9TnaylZKjzj2u3HNoOES+ZnNthy2AHJSiIwAVVC2DsxuVnb2j5lSV/lAVW6SUAL4/sJ3cpy3OB1Rp0AIBkP4XmCS3iu4pgeAKLOqrcXg7XjdsVNcLdqbzvLGyjoAwPcGKZUC/BhERZ8UtJ0MK89rETNBniftCpYcHGajJnX9R9i2SEHJU9vcvQb5zTCelQE8pem6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=atomide.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h962CRkL+ysz6qrjulF5cjWF6J9POgfjZSQqPYVjs1k=;
 b=NjuJilWYk8+wAjTKIaycq1wuNnqEsbU1H6g3hJUz8XSndQ7lptJKCPrh3hCW8J9jpDH1AMw85sYG+nd2bY3XLJ2+M+lqyOBlsSgP+OdYp1EYACjFkayMgBEEXvOHQO4AYuh7x+gk0425rjGoHfnDkNIzyqVGki5KCwnUe9caowY=
Received: from BN0PR03CA0011.namprd03.prod.outlook.com (2603:10b6:408:e6::16)
 by DS4PPFAEF42CAE1.namprd10.prod.outlook.com (2603:10b6:f:fc00::d40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 15:46:56 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:e6:cafe::bf) by BN0PR03CA0011.outlook.office365.com
 (2603:10b6:408:e6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Wed, 5
 Nov 2025 15:46:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 15:46:55 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:46:46 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:46:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 09:46:46 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5FkkXM3944727;
	Wed, 5 Nov 2025 09:46:46 -0600
From: Bryan Brattlof <bb@ti.com>
Date: Wed, 5 Nov 2025 09:46:43 -0600
Subject: [PATCH v8 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251105-am62lx-v8-2-496f353e8237@ti.com>
References: <20251105-am62lx-v8-0-496f353e8237@ti.com>
In-Reply-To: <20251105-am62lx-v8-0-496f353e8237@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Andrew
 Davis" <afd@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Tony
 Lindgren" <tony@atomide.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	<linux-gpio@vger.kernel.org>, Bryan Brattlof <bb@ti.com>, Dhruva Gole
	<d-gole@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=30096; i=bb@ti.com;
 h=from:subject:message-id; bh=XdzSspuPw9vVmPnBN2ufG7WchGTRk/evCM90SFWosTo=;
 b=owNCWmg5MUFZJlNZrjRevAAAYf///v/503//i3j8lcyjtOunvw//+f3ff/fjx//bmvje6d8wA
 RsZpA0NAA9QaAA0A0DQBiA0aZAwjIyMmg0AAA0DTTCBoDI09TEDTJo9I9JtMkOTQGhoaZAGgDJo
 DT1ADIAB+qMhhAPSPUDQAyBiekAMg9Q0aG1MgYmgxANAzVD1AZA0aNNAGjE00BpoyGgaaMI000A
 yABhMTQwTIABoAxGmQZAGmgGg0DDNRBpVCYIcWIJYwqgMzULqQMPGiQrMJp1ATWNdJoH3gAkeVJ
 +ioSCKYVyLV9oFxI4j+QjMVhMYBTIpaEqXytjDJmi+t7YVhFzZSiCxHEeIjAplxGi5U9DtCyVyw
 7lpt2DPpGtqBkn1xVTeSzhDnweCmk6E6PMpvDBFIHezzLTvAICWcvLJBIP9uv3ExAMWcD2o0qNz
 VyjnWaI+/9tb1slYqfmFgehcvh1vpYnNKn+g+FRcu3FsGSelKr7pcRi59NrDpATey6ddkayYzhW
 oB8WjufUUeD/N1AHhyPrRO3+kEJHCdwoPx5trIALVDV7jjrxZERsF39RRrqJy4onyK7uoULj7SX
 PFnnM8X/D4YzJJ85GKnAMmHBeA+AcTH1/Cuda1Y4J8e1uU2CpglL+8+nFOd2jtem85Xm/lpMg/A
 MNIATAz24/xdyRThQkK40XrwA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|DS4PPFAEF42CAE1:EE_
X-MS-Office365-Filtering-Correlation-Id: db4d605f-5308-478f-4ade-08de1c828c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|34020700016|7416014|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzlMUTdiUzlvdk5tVlQvUk45QythUE1uNXpVbFA3UlhqaERseUY4aWM3M2Fx?=
 =?utf-8?B?ZVdscmNDQVZYc2J5RHB6MTN6eW1iNEhIQm4wR0J5Q2dYM0VNazJ1UnBzR29r?=
 =?utf-8?B?YzdrNWg3bncybm1ad1dvS2Z4eFVnK2dEd25JUVNiN2ExWFZVcHNoOWJ6SW4y?=
 =?utf-8?B?WUVEZCtqY2ZSNC93MzJRSmNERlBpbFZqeW4wRWs1aEpFSmlZTHNNOHdpQ1pT?=
 =?utf-8?B?RUlHcm00YldBQ3daalI0YStiV3J2NmFrbnA3Z0hmL2g4V2twUHdTOUhhdTBj?=
 =?utf-8?B?OWY4akM3TXg1RnFKOUxRQ3d3bzV5amdzcjlVREZKRWNsVVNlSG9VL2hGVlBY?=
 =?utf-8?B?cmZCeTM3QnAyT2d3cjFlc0s1ajhmU1MzYXlLWk1lWDd2MjVOVmlnU05ldGFB?=
 =?utf-8?B?eWdpOHJPOVo3cFFrMnBzdW9hU2VaS3NoN0poOTduTnlNK1RtY092RmEyZ0pR?=
 =?utf-8?B?MVhoc2FYTllzY2ppOVJDSVN5b3pVNFMzd1l3RkV1ellyakZsQlY3V1VwU0lY?=
 =?utf-8?B?S3JUWGN2dzQ3S0xnQ2x4Mm9GYUNKL3BVUnBFTEZqSEdsKzNIKzJvaGh2dGkz?=
 =?utf-8?B?ZGVTSlZZeHZPZE1TUEpvN0FSUk5EdmM3R0pGblI5aVE5Q2YzcU5EMUx1ckgr?=
 =?utf-8?B?S3AvMlNGcHZ5SENOYlliZGM4bHBGbmd0REgrdW40QXlzVnhkWG04N1BXZm8z?=
 =?utf-8?B?WXcrVklZM3lRK2hJTDIzWm9BOENMY1IvVTh3MFJBMTVMZmRuOVVKblgvK1Vt?=
 =?utf-8?B?Z2MreWJaTUJZY0pZTkhqNmlWdDJWVEwxQUptckFKaFQ4bXVYdkNGNnhiOTd4?=
 =?utf-8?B?SndMNlNEZVFzdWU3VmZ3NWVON2tSSDg0b1ppMDFSSWtVSnlxZ0xXTmdwOFM5?=
 =?utf-8?B?cVNvMWxGcWpQOVBrcytoaDhjYXhpTkJyWFhoTEVqckkvV2lobGU0UFhibXNM?=
 =?utf-8?B?bU5rS2ozSHJZeFNveWlVWm5zZmoxUTBISHcxWkI1USsvbGlKejk0RDNscVdE?=
 =?utf-8?B?Ly9pVnVVWXNFSzBVMzVlVzNubTcvWExEWjJvbTdyQTZIYThRQkl5UGlWTE9n?=
 =?utf-8?B?RVZlYXhyUVNEZk1QdzVWSm5LOGNEd1BiMmpmSWxaYWtsa3NobTY0NGRXL2Vm?=
 =?utf-8?B?bnFZaTJvc29ldzVDMmlPYmcvOVFJMVIzRVlGcnF3UFZhSWx4NDFSTWRQVmFU?=
 =?utf-8?B?OHI5V1JOeCs1TGV1N0l2aXZPWHh3RlhDN0FSMW1qK0swVmtjYjRGOXBWcEV3?=
 =?utf-8?B?U2F6WHpRd2xrMW10Y0VEa3dSREY0bFJwOGdlSjJvbjdkNWw1VlllQlVvU3JV?=
 =?utf-8?B?UnN2ZGh4V1NlSEtpOTM1SkptSUZIZ2hpL1RFRStocy8rVllpZXVvaTc5Tmtu?=
 =?utf-8?B?bThCb3kwRjZkbnd0QWUxY2tuRVNxa21xS2JpODNxUHdIUVg2ZUlhRmpYY25p?=
 =?utf-8?B?bzlpUTZiemFYSUt5Rks5NjNyVzdjUUx3WDg1MWJlQjI3dTI1bEFWdHJNQ0Zr?=
 =?utf-8?B?dnRhVTFuMVNFVkI2RlVqY213OXllblRhclR0MUxKMzk0a0pDUWs5NUhPa1F3?=
 =?utf-8?B?OWFsMCt4TW51TjJHVnY5OEd6YnFuc0l5SkFxYXlFTDQxYkRtejYyVXhWeWJq?=
 =?utf-8?B?MEFraGFGbTE1Wm1XQ2c5QWpUL2RxYTRjdUxKTzArdVBDeWwyMG1zOHZ2Uk9P?=
 =?utf-8?B?SHVFSG9CejdkMXJrV0dZYjFsc3pjR2FDeVdaaENpR0o3UVFkVkMrcktua1Vo?=
 =?utf-8?B?OG1EVWE5VkVtMEoyMWRKdU9QYkVDOVJqalArZmlDMktWc2xYZWZXVGEyWGhY?=
 =?utf-8?B?N2RFUnRkRmRERGZnNEZmU1ZabXhrdGpUWnUvazh1WFVJMFBuVHdHa25QK2cy?=
 =?utf-8?B?cjhvUmt5U2UzZzRPVGxkdnZzWVpITVZoVzhMZFMrR3lrVmNEV0NRdGcvc0RZ?=
 =?utf-8?B?R25ZVXdNMktrQWo5eEJFUzg1U0hGaHh4ZFVBb3ZJQXlheWJlNFhISEhJZmJh?=
 =?utf-8?B?UTFIZTA4MTV6Q1BWZmEzZlY1d2pYWXYwbHVGakZtVW9wa0o3eU55TytHV0Rm?=
 =?utf-8?Q?HsQa3X?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(7416014)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:46:55.5703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db4d605f-5308-478f-4ade-08de1c828c36
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFAEF42CAE1

From: Vignesh Raghavendra <vigneshr@ti.com>

Add the initial infrastructure needed for the AM62L. ALl of which can be
found in the Technical Reference Manual (TRM) located here:

    https://www.ti.com/lit/pdf/sprujb4

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes in v8
 - Enabled &gpio0 and &gpio1 by default

Changes in v7:
 - Removed dss{} node until binding doc can be updated

Changes in v4:
 - Corrected Copyright year
 - Used 'ranges' property in the fss{} node

Changes in v3:
 - Added more nodes now that the SCMI interface is ready

Changes in v1:
 - switched to non-direct links to TRM updates are automatic
 - fixed white space indent issues with a few nodes
 - separated out device tree bindings
---
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi   | 580 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi | 141 +++++++
 arch/arm64/boot/dts/ti/k3-am62l.dtsi        | 118 ++++++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi       |  67 ++++
 arch/arm64/boot/dts/ti/k3-pinctrl.h         |   2 +
 5 files changed, 908 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..883beb76ba9c48c87e256b0d72e7f938239d0a4f
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
@@ -0,0 +1,580 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree file for the AM62L main domain peripherals
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
+ */
+
+&cbass_main {
+	gic500: interrupt-controller@1800000 {
+		compatible = "arm,gic-v3";
+		reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
+		      <0x00 0x01840000 0x00 0xc0000>,	/* GICR */
+		      <0x01 0x00000000 0x00 0x2000>,    /* GICC */
+		      <0x01 0x00010000 0x00 0x1000>,    /* GICH */
+		      <0x01 0x00020000 0x00 0x2000>;    /* GICV */
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		/*
+		 * vcpumntirq:
+		 * virtual CPU interface maintenance interrupt
+		 */
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+		gic_its: msi-controller@1820000 {
+			compatible = "arm,gic-v3-its";
+			reg = <0x00 0x01820000 0x00 0x10000>;
+			socionext,synquacer-pre-its = <0x1000000 0x400000>;
+			msi-controller;
+			#msi-cells = <1>;
+		};
+	};
+
+	gpio0: gpio@600000 {
+		compatible = "ti,am64-gpio", "ti,keystone-gpio";
+		reg = <0x00 0x00600000 0x00 0x100>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 260 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 267 IRQ_TYPE_EDGE_RISING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		power-domains = <&scmi_pds 34>;
+		clocks = <&scmi_clk 140>;
+		clock-names = "gpio";
+		ti,ngpio = <126>;
+		ti,davinci-gpio-unbanked = <0>;
+	};
+
+	gpio2: gpio@610000 {
+		compatible = "ti,am64-gpio", "ti,keystone-gpio";
+		reg = <0x00 0x00610000 0x00 0x100>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 280 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 281 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 282 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 283 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 284 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 285 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 286 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 287 IRQ_TYPE_EDGE_RISING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		power-domains = <&scmi_pds 35>;
+		clocks = <&scmi_clk 141>;
+		clock-names = "gpio";
+		ti,ngpio = <79>;
+		ti,davinci-gpio-unbanked = <0>;
+	};
+
+	timer0: timer@2400000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2400000 0x00 0x400>;
+		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&scmi_clk 58>;
+		clock-names = "fck";
+		power-domains = <&scmi_pds 15>;
+		ti,timer-pwm;
+	};
+
+	timer1: timer@2410000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2410000 0x00 0x400>;
+		interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&scmi_clk 63>;
+		clock-names = "fck";
+		power-domains = <&scmi_pds 16>;
+		ti,timer-pwm;
+	};
+
+	timer2: timer@2420000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2420000 0x00 0x400>;
+		interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&scmi_clk 77>;
+		clock-names = "fck";
+		power-domains = <&scmi_pds 17>;
+		ti,timer-pwm;
+	};
+
+	timer3: timer@2430000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2430000 0x00 0x400>;
+		interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&scmi_clk 82>;
+		clock-names = "fck";
+		power-domains = <&scmi_pds 18>;
+		ti,timer-pwm;
+	};
+
+	uart0: serial@2800000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02800000 0x00 0x100>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&scmi_pds 89>;
+		clocks = <&scmi_clk 358>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	uart1: serial@2810000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02810000 0x00 0x100>;
+		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&scmi_pds 77>;
+		clocks = <&scmi_clk 312>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	uart2: serial@2820000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02820000 0x00 0x100>;
+		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&scmi_pds 78>;
+		clocks = <&scmi_clk 314>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	uart3: serial@2830000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02830000 0x00 0x100>;
+		interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&scmi_pds 79>;
+		clocks = <&scmi_clk 316>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	uart4: serial@2840000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02840000 0x00 0x100>;
+		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&scmi_pds 80>;
+		clocks = <&scmi_clk 318>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	uart5: serial@2850000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02850000 0x00 0x100>;
+		interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&scmi_pds 81>;
+		clocks = <&scmi_clk 320>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	uart6: serial@2860000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02860000 0x00 0x100>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&scmi_pds 82>;
+		clocks = <&scmi_clk 322>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	conf: bus@9000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x00 0x00 0x09000000 0x380000>;
+
+		phy_gmii_sel: phy@1be000 {
+			compatible = "ti,am654-phy-gmii-sel";
+			reg = <0x1be000 0x8>;
+			#phy-cells = <1>;
+		};
+
+		epwm_tbclk: clock-controller@1e9100 {
+			compatible = "ti,am62-epwm-tbclk";
+			reg = <0x1e9100 0x4>;
+			#clock-cells = <1>;
+		};
+	};
+
+	usbss0: dwc3-usb@f900000 {
+		compatible = "ti,am62-usb";
+		reg = <0x00 0x0f900000 0x00 0x800>,
+		      <0x00 0x0f908000 0x00 0x400>;
+		clocks = <&scmi_clk 331>;
+		clock-names = "ref";
+		ti,syscon-phy-pll-refclk = <&usb_phy_ctrl 0x0>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		power-domains = <&scmi_pds 95>;
+		ranges;
+		status = "disabled";
+
+		usb0: usb@31000000 {
+			compatible = "snps,dwc3";
+			reg = <0x00 0x31000000 0x00 0x50000>;
+			interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>; /* irq.0 */
+			interrupt-names = "host", "peripheral";
+			maximum-speed = "high-speed";
+			dr_mode = "otg";
+			snps,usb2-gadget-lpm-disable;
+			snps,usb2-lpm-disable;
+		};
+	};
+
+	usbss1: dwc3-usb@f910000 {
+		compatible = "ti,am62-usb";
+		reg = <0x00 0x0f910000 0x00 0x800>,
+		      <0x00 0x0f918000 0x00 0x400>;
+		clocks = <&scmi_clk 338>;
+		clock-names = "ref";
+		ti,syscon-phy-pll-refclk = <&usb_phy_ctrl 0x4>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		power-domains = <&scmi_pds 96>;
+		ranges;
+		status = "disabled";
+
+		usb1: usb@31100000 {
+			compatible = "snps,dwc3";
+			reg = <0x00 0x31100000 0x00 0x50000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
+			<GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>; /* irq.0 */
+			interrupt-names = "host", "peripheral";
+			maximum-speed = "high-speed";
+			dr_mode = "otg";
+			snps,usb2-gadget-lpm-disable;
+			snps,usb2-lpm-disable;
+		};
+	};
+
+	sdhci1: mmc@fa00000 {
+		compatible = "ti,j721e-sdhci-4bit";
+		reg = <0x00 0x0fa00000 0x00 0x1000>,
+		      <0x00 0x0fa08000 0x00 0x400>;
+		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&scmi_pds 26>;
+		clocks = <&scmi_clk 106>, <&scmi_clk 109>;
+		clock-names = "clk_ahb", "clk_xin";
+		assigned-clocks = <&scmi_clk 109>;
+		bus-width = <4>;
+		ti,clkbuf-sel = <0x7>;
+		ti,otap-del-sel-legacy = <0x0>;
+		ti,itap-del-sel-legacy = <0x0>;
+		status = "disabled";
+	};
+
+	sdhci0: mmc@fa10000 {
+		compatible = "ti,am62-sdhci";
+		reg = <0x00 0xfa10000 0x00 0x1000>,
+		      <0x00 0xfa18000 0x00 0x400>;
+		interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&scmi_pds 28>;
+		clocks = <&scmi_clk 122>, <&scmi_clk 125>;
+		clock-names = "clk_ahb", "clk_xin";
+		assigned-clocks = <&scmi_clk 125>;
+		bus-width = <8>;
+		ti,clkbuf-sel = <0x7>;
+		ti,otap-del-sel-legacy = <0x0>;
+		ti,otap-del-sel-mmc-hs = <0x0>;
+		ti,otap-del-sel-hs200 = <0x6>;
+		status = "disabled";
+	};
+
+	sdhci2: mmc@fa20000 {
+		compatible = "ti,am62-sdhci";
+		reg = <0x00 0x0fa20000 0x00 0x1000>,
+		      <0x00 0x0fa28000 0x00 0x400>;
+		interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&scmi_pds 27>;
+		clocks = <&scmi_clk 114>, <&scmi_clk 117>;
+		clock-names = "clk_ahb", "clk_xin";
+		assigned-clocks = <&scmi_clk 117>;
+		bus-width = <4>;
+		ti,clkbuf-sel = <0x7>;
+		ti,otap-del-sel-legacy = <0x0>;
+		ti,itap-del-sel-legacy = <0x0>;
+		status = "disabled";
+	};
+
+	i2c0: i2c@20000000 {
+		compatible = "ti,am64-i2c", "ti,omap4-i2c";
+		reg = <0x00 0x20000000 0x00 0x100>;
+		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&scmi_pds 53>;
+		clocks = <&scmi_clk 246>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
+	i2c1: i2c@20010000 {
+		compatible = "ti,am64-i2c", "ti,omap4-i2c";
+		reg = <0x00 0x20010000 0x00 0x100>;
+		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&scmi_pds 54>;
+		clocks = <&scmi_clk 250>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
+	i2c2: i2c@20020000 {
+		compatible = "ti,am64-i2c", "ti,omap4-i2c";
+		reg = <0x00 0x20020000 0x00 0x100>;
+		interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&scmi_pds 55>;
+		clocks = <&scmi_clk 254>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
+	i2c3: i2c@20030000 {
+		compatible = "ti,am64-i2c", "ti,omap4-i2c";
+		reg = <0x00 0x20030000 0x00 0x100>;
+		interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&scmi_pds 56>;
+		clocks = <&scmi_clk 258>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
+	mcan0: can@20701000 {
+		compatible = "bosch,m_can";
+		reg = <0x00 0x20701000 0x00 0x200>,
+		      <0x00 0x20708000 0x00 0x8000>;
+		reg-names = "m_can", "message_ram";
+		power-domains = <&scmi_pds 47>;
+		clocks = <&scmi_clk 179>, <&scmi_clk 178>;
+		clock-names = "hclk", "cclk";
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+		status = "disabled";
+	};
+
+	mcan1: can@20711000 {
+		compatible = "bosch,m_can";
+		reg = <0x00 0x20711000 0x00 0x200>,
+		      <0x00 0x20718000 0x00 0x8000>;
+		reg-names = "m_can", "message_ram";
+		power-domains = <&scmi_pds 48>;
+		clocks = <&scmi_clk 185>, <&scmi_clk 184>;
+		clock-names = "hclk", "cclk";
+		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+		status = "disabled";
+	};
+
+	mcan2: can@20721000 {
+		compatible = "bosch,m_can";
+		reg = <0x00 0x20721000 0x00 0x200>,
+		      <0x00 0x20728000 0x00 0x8000>;
+		reg-names = "m_can", "message_ram";
+		power-domains = <&scmi_pds 49>;
+		clocks = <&scmi_clk 191>, <&scmi_clk 190>;
+		clock-names = "hclk", "cclk";
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+		status = "disabled";
+	};
+
+	spi0: spi@20100000 {
+		compatible = "ti,am654-mcspi", "ti,omap4-mcspi";
+		reg = <0x00 0x20100000 0x00 0x400>;
+		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&scmi_pds 72>;
+		clocks = <&scmi_clk 299>;
+		status = "disabled";
+	};
+
+	spi1: spi@20110000 {
+		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
+		reg = <0x00 0x20110000 0x00 0x400>;
+		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&scmi_pds 73>;
+		clocks = <&scmi_clk 302>;
+		status = "disabled";
+	};
+
+	spi2: spi@20120000 {
+		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
+		reg = <0x00 0x20120000 0x00 0x400>;
+		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&scmi_pds 74>;
+		clocks = <&scmi_clk 305>;
+		status = "disabled";
+	};
+
+	spi3: spi@20130000 {
+		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
+		reg = <0x00 0x20130000 0x00 0x400>;
+		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&scmi_pds 75>;
+		clocks = <&scmi_clk 308>;
+		status = "disabled";
+	};
+
+	epwm0: pwm@23000000 {
+		compatible = "ti,am64-epwm", "ti,am3352-ehrpwm";
+		reg = <0x00 0x23000000 0x00 0x100>;
+		power-domains = <&scmi_pds 40>;
+		clocks = <&epwm_tbclk 0>, <&scmi_clk 164>;
+		clock-names = "tbclk", "fck";
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	epwm1: pwm@23010000 {
+		compatible = "ti,am64-epwm", "ti,am3352-ehrpwm";
+		reg = <0x00 0x23010000 0x00 0x100>;
+		power-domains = <&scmi_pds 41>;
+		clocks = <&epwm_tbclk 1>, <&scmi_clk 165>;
+		clock-names = "tbclk", "fck";
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	epwm2: pwm@23020000 {
+		compatible = "ti,am64-epwm", "ti,am3352-ehrpwm";
+		reg = <0x00 0x23020000 0x00 0x100>;
+		power-domains = <&scmi_pds 42>;
+		clocks = <&epwm_tbclk 2>, <&scmi_clk 166>;
+		clock-names = "tbclk", "fck";
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	ecap0: pwm@23100000 {
+		compatible = "ti,am3352-ecap";
+		reg = <0x00 0x23100000 0x00 0x100>;
+		power-domains = <&scmi_pds 23>;
+		clocks = <&scmi_clk 99>;
+		clock-names = "fck";
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	ecap1: pwm@23110000 {
+		compatible = "ti,am3352-ecap";
+		reg = <0x00 0x23110000 0x00 0x100>;
+		power-domains = <&scmi_pds 24>;
+		clocks = <&scmi_clk 100>;
+		clock-names = "fck";
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	ecap2: pwm@23120000 {
+		compatible = "ti,am3352-ecap";
+		reg = <0x00 0x23120000 0x00 0x100>;
+		power-domains = <&scmi_pds 25>;
+		clocks = <&scmi_clk 101>;
+		clock-names = "fck";
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
+	eqep0: counter@23200000 {
+		compatible = "ti,am62-eqep";
+		reg = <0x00 0x23200000 0x00 0x100>;
+		power-domains = <&scmi_pds 29>;
+		clocks = <&scmi_clk 127>;
+		interrupts = <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>;
+		status = "disabled";
+	};
+
+	eqep1: counter@23210000 {
+		compatible = "ti,am62-eqep";
+		reg = <0x00 0x23210000 0x00 0x100>;
+		power-domains = <&scmi_pds 30>;
+		clocks = <&scmi_clk 128>;
+		interrupts = <GIC_SPI 163 IRQ_TYPE_EDGE_RISING>;
+		status = "disabled";
+	};
+
+	eqep2: counter@23220000 {
+		compatible = "ti,am62-eqep";
+		reg = <0x00 0x23220000 0x00 0x100>;
+		power-domains = <&scmi_pds 31>;
+		clocks = <&scmi_clk 129>;
+		interrupts = <GIC_SPI 164 IRQ_TYPE_EDGE_RISING>;
+		status = "disabled";
+	};
+
+	elm0: ecc@25010000 {
+		compatible = "ti,am64-elm";
+		reg = <0x00 0x25010000 0x00 0x2000>;
+		interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&scmi_pds 25>;
+		clocks = <&scmi_clk 102>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
+	gpmc0: memory-controller@3b000000 {
+		compatible = "ti,am64-gpmc";
+		power-domains = <&scmi_pds 37>;
+		clocks = <&scmi_clk 149>;
+		clock-names = "fck";
+		reg = <0x00 0x3b000000 0x00 0x400>,
+		      <0x00 0x50000000 0x00 0x8000000>;
+		reg-names = "cfg", "data";
+		interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
+		gpmc,num-cs = <3>;
+		gpmc,num-waitpins = <2>;
+		#address-cells = <2>;
+		#size-cells = <1>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		status = "disabled";
+	};
+
+	oc_sram: sram@70800000 {
+		compatible = "mmio-sram";
+		reg = <0x00 0x70800000 0x00 0x10000>;
+		ranges = <0x00 0x00 0x70800000 0x10000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		scmi_shmem: sram@0 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x00 0x100>;
+			bootph-all;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..494b299a0e651da992966f09db189302d9ca6ab2
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree file for the AM62L wakeup domain peripherals
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
+ */
+
+#include <dt-bindings/bus/ti-sysc.h>
+
+&cbass_wakeup {
+	vtm0: temperature-sensor@b00000 {
+		compatible = "ti,j7200-vtm";
+		reg = <0x00 0xb00000 0x00 0x400>,
+		      <0x00 0xb01000 0x00 0x400>;
+		power-domains = <&scmi_pds 46>;
+		#thermal-sensor-cells = <1>;
+	};
+
+	pmx0: pinctrl@4084000 {
+		compatible = "ti,am62l-padconf", "pinctrl-single";
+		reg = <0x00 0x4084000 0x00 0x24c>;
+		pinctrl-single,register-width = <32>;
+		pinctrl-single,function-mask = <0xffffffff>;
+		#pinctrl-cells = <1>;
+	};
+
+	wkup_gpio0: gpio@4201000 {
+		compatible = "ti,am64-gpio", "ti,keystone-gpio";
+		reg = <0x00 0x04201000 0x00 0x100>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 704 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 705 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 706 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 707 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 708 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 709 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 710 IRQ_TYPE_EDGE_RISING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		power-domains = <&scmi_pds 36>;
+		clocks = <&scmi_clk 146>;
+		clock-names = "gpio";
+		ti,ngpio = <7>;
+		ti,davinci-gpio-unbanked = <0>;
+		status = "disabled";
+	};
+
+	wkup_timer0: timer@2b100000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2b100000 0x00 0x400>;
+		interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&scmi_clk 93>;
+		clock-names = "fck";
+		power-domains = <&scmi_pds 19>;
+		ti,timer-pwm;
+	};
+
+	wkup_timer1: timer@2b110000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2b110000 0x00 0x400>;
+		interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&scmi_clk 98>;
+		clock-names = "fck";
+		power-domains = <&scmi_pds 20>;
+		ti,timer-pwm;
+	};
+
+	wkup_i2c0: i2c@2b200000 {
+		compatible = "ti,am64-i2c", "ti,omap4-i2c";
+		reg = <0x00 0x2b200000 0x00 0x100>;
+		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&scmi_pds 57>;
+		clocks = <&scmi_clk 262>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
+	target-module@2b300050 {
+		compatible = "ti,sysc-omap2", "ti,sysc";
+		reg = <0x00 0x2b300050 0x00 0x4>,
+		      <0x00 0x2b300054 0x00 0x4>,
+		      <0x00 0x2b300058 0x00 0x4>;
+		reg-names = "rev", "sysc", "syss";
+		ranges = <0x00 0x00 0x2b300000 0x100000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		power-domains = <&scmi_pds 83>;
+		clocks = <&scmi_clk 324>;
+		clock-names = "fck";
+		ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
+				 SYSC_OMAP2_SOFTRESET |
+				 SYSC_OMAP2_AUTOIDLE)>;
+		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+				<SYSC_IDLE_NO>,
+				<SYSC_IDLE_SMART>,
+				<SYSC_IDLE_SMART_WKUP>;
+		ti,syss-mask = <1>;
+		ti,no-reset-on-init;
+		status = "disabled";
+
+		wkup_uart0: serial@0 {
+			compatible = "ti,am64-uart", "ti,am654-uart";
+			reg = <0x00 0x100>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk 324>;
+			assigned-clocks = <&scmi_clk 324>;
+			clock-names = "fclk";
+			status = "disabled";
+		};
+	};
+
+	wkup_conf: bus@43000000 {
+		compatible = "simple-bus";
+		ranges = <0x00 0x00 0x43000000 0x80000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		chipid: chipid@14 {
+			compatible = "ti,am654-chipid";
+			reg = <0x14 0x4>;
+			bootph-all;
+		};
+
+		cpsw_mac_syscon: ethernet-mac-syscon@2000 {
+			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
+			reg = <0x2000 0x8>;
+		};
+
+		usb_phy_ctrl: syscon@45000 {
+			compatible = "ti,am62-usb-phy-ctrl", "syscon";
+			reg = <0x45000 0x8>;
+			bootph-all;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62l.dtsi b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..25a5f15a8960e755cb151cb99af90d51861ab91b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree Source for AM62L SoC Family
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+#include "k3-pinctrl.h"
+
+/ {
+	model = "Texas Instruments K3 AM62L3 SoC";
+	compatible = "ti,am62l3";
+	interrupt-parent = <&gic500>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+
+		psci: psci {
+			compatible = "arm,psci-1.0";
+			method = "smc";
+		};
+
+		scmi: scmi {
+			compatible = "arm,scmi-smc";
+			arm,smc-id = <0x82004000>;
+			shmem = <&scmi_shmem>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+				bootph-all;
+			};
+
+			scmi_pds: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+				bootph-all;
+			};
+		};
+	};
+
+	a53_timer0: timer-cl0-cpu0 {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* cntpsirq */
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* cntpnsirq */
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* cntvirq */
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* cnthpirq */
+	};
+
+	pmu: pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	cbass_main: bus@f0000 {
+		compatible = "simple-bus";
+		ranges = <0x00 0x00600000 0x00 0x00600000 0x00 0x00010100>, /* GPIO */
+			 <0x00 0x01000000 0x00 0x01000000 0x00 0x01b28400>, /* First Peripheral Window */
+			 <0x00 0x00a40000 0x00 0x00a40000 0x00 0x00000400>, /* Timesync Router */
+			 <0x00 0x08000000 0x00 0x08000000 0x00 0x00200000>, /* CPSW */
+			 <0x00 0x09000000 0x00 0x09000000 0x00 0x00400000>, /* CTRL MMRs */
+			 <0x00 0x0e000000 0x00 0x0e000000 0x00 0x1a001400>, /* Second Peripheral Window */
+			 <0x00 0x301c0000 0x00 0x301c0000 0x00 0x00001000>, /* DPHY-TX */
+			 <0x00 0x30200000 0x00 0x30200000 0x00 0x0000b000>, /* DSS */
+			 <0x00 0x30270000 0x00 0x30270000 0x00 0x00390000>, /* DSI Wrapper */
+			 <0x00 0x30500000 0x00 0x30500000 0x00 0x00100000>, /* DSI Config */
+			 <0x00 0x31000000 0x00 0x31000000 0x00 0x00050000>, /* USB0 DWC3 Core Window */
+			 <0x00 0x31100000 0x00 0x31100000 0x00 0x00050000>, /* USB1 DWC3 Core Window */
+			 <0x00 0x3b000000 0x00 0x3b000000 0x00 0x00000400>, /* GPMC0 */
+			 <0x00 0x45810000 0x00 0x45810000 0x00 0x03170000>, /* DMSS */
+			 <0x00 0x50000000 0x00 0x50000000 0x00 0x08000000>, /* GPMC DATA */
+			 <0x00 0x60000000 0x00 0x60000000 0x00 0x08000000>, /* FSS DAT1 */
+			 <0x00 0x70800000 0x00 0x70800000 0x00 0x00018000>, /* OCSRAM */
+			 <0x01 0x00000000 0x01 0x00000000 0x00 0x00310000>, /* A53 PERIPHBASE */
+			 <0x04 0x00000000 0x04 0x00000000 0x01 0x00000000>, /* FSS DAT0 */
+			 <0x05 0x00000000 0x05 0x00000000 0x01 0x00000000>, /* FSS DAT3 */
+
+			 /* Wakeup Domain Range */
+			 <0x00 0x00a80000 0x00 0x00a80000 0x00 0x00034000>, /* GTC */
+			 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
+			 <0x00 0x04080000 0x00 0x04080000 0x00 0x00008000>, /* PDCFG */
+			 <0x00 0x04201000 0x00 0x04201000 0x00 0x00000100>, /* GPIO */
+			 <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00100100>, /* Wakeup Peripheral Window */
+			 <0x00 0x40800000 0x00 0x40800000 0x00 0x00014000>, /* DMA */
+			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00080000>; /* CTRL MMRs */
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		cbass_wakeup:  bus@43000000 {
+			compatible = "simple-bus";
+			ranges = <0x00 0x00a80000 0x00 0x00a80000 0x00 0x00034000>, /* GTC */
+				 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
+				 <0x00 0x04080000 0x00 0x04080000 0x00 0x00008000>, /* PDCFG */
+				 <0x00 0x04201000 0x00 0x04201000 0x00 0x00000100>, /* GPIO */
+				 <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00100100>, /* Wakeup Peripheral Window */
+				 <0x00 0x40800000 0x00 0x40800000 0x00 0x00014000>, /* DMA */
+				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00080000>; /* CTRL MMRs */
+			#address-cells = <2>;
+			#size-cells = <2>;
+		};
+	};
+};
+
+/* Now include peripherals for each bus segment */
+#include "k3-am62l-main.dtsi"
+#include "k3-am62l-wakeup.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am62l3.dtsi b/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..da220b85151227c63f59b2b8ec48ae2ebb37e7bf
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree file for the AM62L3 SoC family (Dual Core A53)
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
+ */
+
+/dts-v1/;
+
+#include "k3-am62l.dtsi"
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0: cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a53";
+			reg = <0x000>;
+			device_type = "cpu";
+			enable-method = "psci";
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a53";
+			reg = <0x001>;
+			device_type = "cpu";
+			enable-method = "psci";
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_0>;
+		};
+	};
+
+	l2_0: l2-cache0 {
+		compatible = "cache";
+		cache-unified;
+		cache-level = <2>;
+		cache-size = <0x40000>;
+		cache-line-size = <64>;
+		cache-sets = <256>;
+	};
+};
diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index e46f7bf527019f46fbd8bcf037467af8a55b373e..dc8e03ae74c897fc95d1fe8f0dfb42ae9c00df12 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -123,6 +123,8 @@
 #define AM62PX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
 #define AM62PX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
 
+#define AM62LX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
+
 #define AM62X_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
 #define AM62X_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
 

-- 
2.50.1


