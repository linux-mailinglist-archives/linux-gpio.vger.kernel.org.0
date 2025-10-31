Return-Path: <linux-gpio+bounces-27900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18016C25845
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 15:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A2CA64F925F
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 14:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B40834C12D;
	Fri, 31 Oct 2025 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="w1YUgW7I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F4734B687;
	Fri, 31 Oct 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761919703; cv=fail; b=TXaBXYqEfvLNuppjPlmcmwh9oH3mqreeLzt+fxrADrNKRlPFxrp9A/ekiOglANnXV3WXaDQOnSIOFa0qJOWo+kQR5CeqlZCP1+SoE96bL8KXbmEplOkbF4DwywBXBFV4ChqkzRIgoRlDdKhnsLnV0G+jNK/QUH4QPrdJHvpQ0ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761919703; c=relaxed/simple;
	bh=BCS7iuQUV23Is9WtqxAcp+3If5ckg6r7UJw+s8+umh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WLFIQdxP9dRlTk8i38v+dNgUhjiIZfA03V6Uv9bb+ZqF++bEmf1loeqkV3wxkg312bZxOznn1snhoFWNbbhUx4HfR/y8eHZXlT1vgDruX5g6O9s87RAQLbWn83ATmLNFm5f7tlVTGK/8FzfFGZVXXeLdHzoljpa111grguI9BB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=w1YUgW7I; arc=fail smtp.client-ip=52.101.46.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCklIIeT/JQZ9F5iizzj4c4VPoYK61oEIWKYOImjZ/d+zUiQIZahcBMw4dCyaw1OCzWKHSPNWvyIqGKae9EoYM7P4/ZDC6ZFxLRrWy7oINjHjjrTMax7Uwwl8EQEzdgd1ItoODIiS5Nz/hmZWlGXnSBLBRFG//QD8yLiwpQ2yYr2EJB+4dD23gN/nAPM2/j6frpmLjtVi14ajJtMgq6+oec0ppToc5KpZ68wcl37C8TmjVDbY2Fuo1foU75ZGhw/6k8B/izYJRDz9vu5iSznkJwqnW4Sn4yB1mjMablGrTyjx4PAZVo4kWhXojs86OkE3nHZb1IJqYYTk/Q/0tl1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUtBur7YWg+mh/3jvEN0etOHJ4zv6oKEaZiXbTina5k=;
 b=wZ7Nh5kVciXn4I/BSTuG68191I1gru0x7uTdCmsCLbzAboRPqdr4nCATVSe9Ht3htXy7D+tOrRZRX94BujNyUMzUaXcMPFHlZWOGxYAGa6m6YpiWfL4IuyCIeCoIFhKboeI5waaTZDt2OBttwRmANsH0yB7dZaI4B6JScAeYvP4BIHW1xEiTNhIMAoDBc9nitqUOy5nxMaErTcYsQeYLkXEdK/L/9Z3xRQe2SjAx7aOn+XhMXxvhCVPDeeux6IAieMKaRRNI355SbkzHzjm3+Nqa2nRPdcX9IyyLVdFFHyRW/K7JXjFaAxUSH5Tfvj7xO8EXLrgPSEi/gxmE/tnf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUtBur7YWg+mh/3jvEN0etOHJ4zv6oKEaZiXbTina5k=;
 b=w1YUgW7IQtM3ECBBupDZbl2weqhWTU8GuqVRHU6Do8yFh+Actm1bh+uYdVRBKy5qCEA2h4fYw7SEC6rcuCZIOfXP/bAuFnCpDvlvqVndB0F9NHXoakB8LQGJKXw4n4YUaWAOG4Ign6EeVNSWIrK1+8CLkQ2QdynQD6YlU4m1MV0=
Received: from MW4PR02CA0002.namprd02.prod.outlook.com (2603:10b6:303:16d::10)
 by SJ0PR10MB6431.namprd10.prod.outlook.com (2603:10b6:a03:486::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Fri, 31 Oct
 2025 14:08:17 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:303:16d:cafe::b) by MW4PR02CA0002.outlook.office365.com
 (2603:10b6:303:16d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 14:08:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 14:08:15 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:08:07 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:08:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 09:08:07 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59VE87NA3982035;
	Fri, 31 Oct 2025 09:08:07 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Fri, 31 Oct 2025 09:08:06 -0500
Subject: [PATCH v7 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251031-am62lx-v7-3-cb426be9d6ee@ti.com>
References: <20251031-am62lx-v7-0-cb426be9d6ee@ti.com>
In-Reply-To: <20251031-am62lx-v7-0-cb426be9d6ee@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Andrew
 Davis" <afd@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Tony
 Lindgren" <tony@atomide.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	<linux-gpio@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11025; i=bb@ti.com;
 h=from:subject:message-id; bh=kdjZp1KpTXRzZNbfrBHx2SSKNXQd+XJrbQLD+cUnViA=;
 b=owNCWmg5MUFZJlNZfcObwAAAZn///vfv73V3n9/ees1+supn047rybb1y+a5939d/N/txn+wA
 RssEPU09QBoB6gAAA0A0AAHpDIAA0AaA0HpNDQaZAAGn6oZGQxPU0PJNG1MaaiBoZNGRk0aBo0a
 aGgaGhoDRoaDEaD1NA0aAaNME2pkPU0NGmgZDIaMJoyGQaA9RgyE09Q0wgDAhoBoBiZDCaD0gHq
 BoAAekA0yGjIDIMg00PUAABkHqMQHoTJuCgoYN6tgTBX7h5xzagL5WDCwxwGIReNiAGEdY9RDLA
 96ldFDyZwTGdEA27dUisAQWNavPl+fLoienirrRBrBAPtpxzDIqnBaVCUM/F3KDkFcdK9CCDVWY
 E36F9Tg90WSwDn2mJune6AD0h9r1hjZsAr83oCs0xSjE56Syu9c/6Ar5+kj5HPS8tAMU68xWXEx
 dY3fJ/UEcWZBMbO7cXQr2bG3Dj3zJCTX/+4jePQaAX1LVvadJPKwy7FcSQ1jgdo5AH9kq8WFVCj
 Q0mkEWJBxpJ1CXhp2bBqaWCgPN9cmKB7Pypv3CLaRe4H60HHxFHEONXpXRkp5tDLnZXOaGqcmzb
 B4AwnQxF9SBLAVm5qwnLTCC/WNsUoPqI0ss7thJ1Ow2zynlE4RmFqzJr4REIT62HoIgIsyjOJV2
 0jQGUoP8XckU4UJB9w5vAA=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|SJ0PR10MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a72f8f3-e91d-4728-4e59-08de1886ef91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|34020700016|1800799024|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S05pOC9hTC9RbTQweWF1cGpJRmNPUEdZRE8wNXY1QURHbjhnZlYvWlJkcU8y?=
 =?utf-8?B?U3ViWUZybmpxWS93UytOSksyV1Iyd3hHbEM2NHNCVTI5SkhzS3MyaHhlYWI1?=
 =?utf-8?B?Z1BzZ2IzMmc2MXZGUElvQTREVE5TU29iOGZ6ei9vOEVIVE9FeEpsZVV1N0ZQ?=
 =?utf-8?B?WVI3aU1ic3BjNk1iZXBOT1VqM0NnTjJ5V3BYdU5XcEV3ZVBSNzJiNDFkVE8r?=
 =?utf-8?B?SmJhSC9PaFBWZEp0MmlwakNJdXdybUpwbEc0YmNZVW1lb0ZhYTBkQ3VwZ2k5?=
 =?utf-8?B?U1lwNVFmZGpaMFVEUnY2c1IvY0FObGgwYWpDRjAxblVzT3hzNk5RTGZrNm4v?=
 =?utf-8?B?dFB0dFBjTThpc0E3RkhPS2YxNmlZdGlxaloyNEdNd1pWVTBWMjI1aUp6OXV4?=
 =?utf-8?B?RkNhYnBid3JqTWFRWlFmV2kzZ1RUZFdPZW9GTHZlSXRteWljK2tWY1RLWlZv?=
 =?utf-8?B?dkVjRnhFWTVFZkZLZTNOR1FUMVE2UGVlV0hFWDAwVlkwYUhiZTBaTnk2Qmhq?=
 =?utf-8?B?S21LU1laaVFyc3VYWGd1ZW0vS3ZERTkyV2VCK2NoRW5jWnpQV1VTYUx3aCtR?=
 =?utf-8?B?TXpTaGNxcmRTZGpXUU1uUi9Vc3FIaFdPblNEcEMzbEI5ODBnelJYZFROa1hI?=
 =?utf-8?B?dm56ekhhdzd5Smd5eGNrbklWWnU5RlFmTkVPVzVGM3ZvejJtWVRrSmJlNnRH?=
 =?utf-8?B?OVNBbXAvU3ZwOWltaTMwaVFOdUVYV3VuZEFNWnYxOWpZcWVzSFdzdFJCMXNX?=
 =?utf-8?B?SFZ1UEE2SGZ1YlpUaG1CdStpMjRSS2x2TGZTT2h4NjZ4QmhkeVNFOXlwUCs1?=
 =?utf-8?B?SHVBSElWZjBmZHltYldha0RsMlpnZjFXYzYxUFA1TXNYYUxHZGIxb1B3cFVv?=
 =?utf-8?B?Tk5tTDFuUzhpS1hZRzVDdVJpdDRRUC9aaGxSMEV4ZW5qQTZ3NC80dWEwUm5y?=
 =?utf-8?B?cnZRK1ZDMnNSWUFaSVgwK2M3aEMrcERXWXFpSFM3bjhUN1JwZUlLODhWZitz?=
 =?utf-8?B?MUdOdi8xYkZsVGp3Q3crOGZIRFNwR0pEREVBYXlPd0pscEE3TnhzVzByekx0?=
 =?utf-8?B?V3lVWHpCUHUwN3B5cGNJOU5BcVFlazl5SkZ4UzhmeW02eVJ3YzkvSTA3VDVj?=
 =?utf-8?B?bDIzeFgvaTlpNitxKyt3cFQzV2RGS3RFUXEwWkpRNTNEalA1N2sreWpnTzVk?=
 =?utf-8?B?bDJCQlcxdm4rYkZMc2UxaFVYaitaMG5zdXNVN3R2UW84Qy8rZjBhWFlNbkF1?=
 =?utf-8?B?TDFTVTVHTUZQUWk0dWJuV3dNR0hvNGRyVkFsUVlTa285bFpGZTNHTzNsVUxp?=
 =?utf-8?B?N1VyVkRUT1hrck1rSjkvWjJ5OWNvN3FzN0Z2Y0p5N1E2Vk1QdmdIVGxLQVEx?=
 =?utf-8?B?Ym05c1pIU2R5OENucEw0cHFJSTVVUWU4TnpZM3V1TE9CMjFua2FFRmppWkpG?=
 =?utf-8?B?RC9XMEp4TS9jZDJrNGttZHkrVWlRK05OVjF5RVIxbGZsancyNDVsb0MxcVpj?=
 =?utf-8?B?dDJEbVRON2pOeFQwM295M3dYdjY0WVZ4VU9hZTZFKzZ1SGNZK3Z5aWVSMFFT?=
 =?utf-8?B?ekFUZnYvOEU5aXJteEtvTUtxQ25YQUh2OWxuWnpUd0ZIUy9SVmRGQjk5cWFo?=
 =?utf-8?B?RWdXUmlGK2JKRk5rNVI0dE5zMzM1UUVueHdWVzZUTG9UbnpCZkVDanpYZkIy?=
 =?utf-8?B?dUdiNllsSlpONVNlSnVGaGdLZGFaUEZzUHNnRjFrdVFsMW52TEd1RHR1cHIz?=
 =?utf-8?B?WFZ4dEJSdnp6SFhvckZHLy9pUWUzVkhucnZtNllwSTBicUsrVGNrbWszSHFD?=
 =?utf-8?B?R2h1VnVmSG1lbE94WjNPV0NYdmZUcWp6SVhBd2hRbzBsSWJOM3ZEdXBVSXBs?=
 =?utf-8?B?OGNwMDd3MW9kRDVTeWlaNVhOVXlUZlJPamJGV3BXSFp5L3dNOHV0T29JZFVV?=
 =?utf-8?B?TGp0MU1uN0diWXdvejdtODdpd2tWeWZsWm9SWWdDN2xmVTNIcDJ0dGVyM2RB?=
 =?utf-8?B?OVA3a2lPaVNaL3VHMWk0dHladXZxQllrMG8vTzU4UEV4d25XOFlFOGwwUm1a?=
 =?utf-8?Q?zSJyQo?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(1800799024)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:08:15.6371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a72f8f3-e91d-4728-4e59-08de1886ef91
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6431

From: Vignesh Raghavendra <vigneshr@ti.com>

Add the initial board file for the AM62L3's Evaluation Module.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes from v1:
 - switched to non-direct links so TRM updates are automatic
 - removed current-speed property from main_uart0
 - removed empty reserved-memory{} node
 - removed serial2 from aliases{} node
 - corrected main_uart0 pinmux

Changes from v2:
 - alphabetized phandles
 - corrected macros and node names for main_uart0 pinmux node

Changes from v3:
 - added and enabled more nodes that have been validated
 - added link to data sheet which is now public

Changes from v4:
 - Corrected Copyright year

Changes from v6:
 - moved thermal-zones{} into the k3-am62l3-evm.dts to allow other
   boards to selec whichever trip points they wish
---
 arch/arm64/boot/dts/ti/Makefile          |   3 +
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 362 +++++++++++++++++++++++++++++++
 2 files changed, 365 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 743115b849a7ae58c1d0577f54810a9940d4136f..fb656dd19dcb5551036916dd961d981047ce7519 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -37,6 +37,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
 # Boards with AM62Dx SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
 
+# Boards with AM62Lx SoCs
+dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
+
 # Boards with AM62Px SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-var-som-symphony.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
new file mode 100644
index 0000000000000000000000000000000000000000..ab72174124c89b36f20a8542e1cf0ee9869a7089
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree file for the AM62L3 Evaluation Module
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
+ * Data Sheet: https://www.ti.com/lit/pdf/sprspa1
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/thermal/thermal.h>
+#include "k3-am62l3.dtsi"
+#include "k3-pinctrl.h"
+
+
+/ {
+	compatible = "ti,am62l3-evm", "ti,am62l3";
+	model = "Texas Instruments AM62L3 Evaluation Module";
+
+	chosen {
+		stdout-path = &uart0;
+	};
+
+	memory@80000000 {
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
+		device_type = "memory";
+		bootph-all;
+	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usr_button_pins_default>;
+
+		usr: button-usr {
+			label = "User Key";
+			linux,code = <BTN_0>;
+			gpios = <&gpio0 90 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usr_led_pins_default>;
+
+		led-0 {
+			label = "am62-sk:green:heartbeat";
+			gpios = <&gpio0 123 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
+			default-state = "on";
+		};
+	};
+
+	thermal-zones {
+		wkup0-thermal {
+			polling-delay-passive = <250>;	/* milliSeconds */
+			polling-delay = <500>;		/* milliSeconds */
+			thermal-sensors = <&vtm0 0>;
+
+			trips {
+				crit0 {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
+	vmain_pd: regulator-0 {
+		/* TPS65988 PD CONTROLLER OUTPUT */
+		compatible = "regulator-fixed";
+		regulator-name = "vmain_pd";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		bootph-all;
+	};
+
+	vcc_3v3_sys: regulator-1 {
+		/* output of LM61460-Q1 */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_sys";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vmain_pd>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_mmc1: regulator-2 {
+		/* TPS22918DBVR */
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_mmc1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		enable-active-high;
+		vin-supply = <&vcc_3v3_sys>;
+		gpio = <&exp1 3 GPIO_ACTIVE_HIGH>;
+		bootph-all;
+	};
+
+	vcc_1v8: regulator-3 {
+		/* output of TPS6282518DMQ */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&gpio0 {
+	status = "okay";
+	bootph-all;
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins_default>;
+	clock-frequency = <400000>;
+
+	eeprom@51 {
+		/* AT24C512C-MAHM-T or M24512-DFMC6TG */
+		compatible = "atmel,24c512";
+		reg = <0x51>;
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins_default>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	exp1: gpio@22 {
+		compatible = "ti,tca6424";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "", "",
+				  "UART1_FET_SEL", "MMC1_SD_EN",
+				  "VPP_LDO_EN", "EXP_PS_3V3_EN",
+				  "UART1_FET_BUF_EN", "", "",
+				  "", "DSI_GPIO0", "DSI_GPIO1",
+				  "", "BT_UART_WAKE_SOC_3V3",
+				  "USB_TYPEA_OC_INDICATION", "",
+				  "", "WLAN_ALERTn", "", "",
+				  "HDMI_INTn", "TEST_GPIO2",
+				  "MCASP0_FET_EN", "MCASP0_BUF_BT_EN",
+				  "MCASP0_FET_SEL", "DSI_EDID",
+				  "PD_I2C_IRQ", "IO_EXP_TEST_LED";
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <91 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio0_ioexp_intr_pins_default>;
+		bootph-all;
+	};
+
+	exp2: gpio@23 {
+		compatible = "ti,tca6424";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "BT_EN_SOC", "VOUT0_FET_SEL0",
+				  "", "",
+				  "", "",
+				  "", "",
+				  "WL_LT_EN", "EXP_PS_5V0_EN",
+				  "TP45", "TP48",
+				  "TP46", "TP49",
+				  "TP47", "TP50",
+				  "GPIO_QSPI_NAND_RSTn", "GPIO_HDMI_RSTn",
+				  "GPIO_CPSW1_RST", "GPIO_CPSW2_RST",
+				  "", "GPIO_AUD_RSTn",
+				  "GPIO_eMMC_RSTn", "SoC_WLAN_SDIO_RST";
+		bootph-all;
+	};
+
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins_default>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	typec_pd0: tps658x@3f {
+		compatible = "ti,tps6598x";
+		reg = <0x3f>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			self-powered;
+			data-role = "dual";
+			power-role = "sink";
+
+			port {
+				usb_con_hs: endpoint {
+					remote-endpoint = <&usb0_hs_ep>;
+				};
+			};
+		};
+	};
+};
+
+&pmx0 {
+	gpio0_ioexp_intr_pins_default: gpio0-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01b0, PIN_INPUT, 7) /* (B12) SPI0_D1.GPIO0_91 */
+		>;
+		bootph-all;
+	};
+
+	i2c0_pins_default: i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01cc, PIN_INPUT_PULLUP, 0) /* (B7) I2C0_SCL */
+			AM62LX_IOPAD(0x01d0, PIN_INPUT_PULLUP, 0) /* (A7) I2C0_SDA */
+		>;
+		bootph-all;
+	};
+
+	i2c1_pins_default: i2c1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01d4, PIN_INPUT_PULLUP, 0) /* (D7) I2C1_SCL */
+			AM62LX_IOPAD(0x01d8, PIN_INPUT_PULLUP, 0) /* (A6) I2C1_SDA */
+		>;
+		bootph-all;
+	};
+
+	i2c2_pins_default: i2c2-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01dc, PIN_INPUT_PULLUP, 0) /* (B8) I2C2_SCL */
+			AM62LX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D8) I2C2_SDA */
+		>;
+	};
+
+	mmc0_pins_default: mmc0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0214, PIN_INPUT_PULLUP, 0) /* (D2) MMC0_CMD */
+			AM62LX_IOPAD(0x020c, PIN_OUTPUT, 0) /* (B2) MMC0_CLK */
+			AM62LX_IOPAD(0x0208, PIN_INPUT_PULLUP, 0) /* (D3) MMC0_DAT0 */
+			AM62LX_IOPAD(0x0204, PIN_INPUT_PULLUP, 0) /* (D4) MMC0_DAT1 */
+			AM62LX_IOPAD(0x0200, PIN_INPUT_PULLUP, 0) /* (C1) MMC0_DAT2 */
+			AM62LX_IOPAD(0x01fc, PIN_INPUT_PULLUP, 0) /* (C2) MMC0_DAT3 */
+			AM62LX_IOPAD(0x01f8, PIN_INPUT_PULLUP, 0) /* (C4) MMC0_DAT4 */
+			AM62LX_IOPAD(0x01f4, PIN_INPUT_PULLUP, 0) /* (B3) MMC0_DAT5 */
+			AM62LX_IOPAD(0x01f0, PIN_INPUT_PULLUP, 0) /* (A3) MMC0_DAT6 */
+			AM62LX_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0) /* (B4) MMC0_DAT7 */
+		>;
+		bootph-all;
+	};
+
+	mmc1_pins_default: mmc1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0230, PIN_INPUT, 0) /* (Y3) MMC1_CMD */
+			AM62LX_IOPAD(0x0228, PIN_OUTPUT, 0) /* (Y2) MMC1_CLK */
+			AM62LX_IOPAD(0x0224, PIN_INPUT, 0) /* (AA1) MMC1_DAT0 */
+			AM62LX_IOPAD(0x0220, PIN_INPUT_PULLUP, 0) /* (Y4) MMC1_DAT1 */
+			AM62LX_IOPAD(0x021c, PIN_INPUT_PULLUP, 0) /* (AA2) MMC1_DAT2 */
+			AM62LX_IOPAD(0x0218, PIN_INPUT_PULLUP, 0) /* (AB2) MMC1_DAT3 */
+			AM62LX_IOPAD(0x0234, PIN_INPUT, 0) /* (B6) MMC1_SDCD */
+		>;
+		bootph-all;
+	};
+
+	uart0_pins_default: uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01b4, PIN_INPUT, 0) /* (D13) UART0_RXD */
+			AM62LX_IOPAD(0x01b8, PIN_OUTPUT, 0) /* (C13) UART0_TXD */
+		>;
+		bootph-all;
+	};
+
+	usb1_default_pins: usb1-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0248, PIN_INPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (A5) USB1_DRVVBUS */
+		>;
+	};
+
+	usr_button_pins_default: usr-button-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01ac, PIN_INPUT, 7) /* (E12) SPI0_D0.GPIO0_90 */
+		>;
+	};
+
+	usr_led_pins_default: usr-led-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0238, PIN_OUTPUT, 7) /* (D24) MMC1_SDWP.GPIO0_123 */
+		>;
+	};
+
+};
+
+&sdhci0 {
+	/* eMMC */
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins_default>;
+	non-removable;
+	status = "okay";
+	bootph-all;
+};
+
+&sdhci1 {
+	/* SD/MMC */
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins_default>;
+	vmmc-supply = <&vdd_mmc1>;
+	disable-wp;
+	status = "okay";
+	bootph-all;
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pins_default>;
+	pinctrl-names = "default";
+	status = "okay";
+	bootph-all;
+};
+
+&usbss0 {
+	status = "okay";
+	ti,vbus-divider;
+};
+
+&usb0 {
+	usb-role-switch;
+
+	port {
+		usb0_hs_ep: endpoint {
+			remote-endpoint = <&usb_con_hs>;
+		};
+	};
+};
+
+&usbss1 {
+	status = "okay";
+	ti,vbus-divider;
+};
+
+&usb1 {
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_default_pins>;
+};

-- 
2.50.1


