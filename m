Return-Path: <linux-gpio+bounces-30998-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCoxBE1Qc2ncugAAu9opvQ
	(envelope-from <linux-gpio+bounces-30998-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:41:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E07DA746DD
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D8DB30054F3
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F372136656F;
	Fri, 23 Jan 2026 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="m31D1rxU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADED352F86;
	Fri, 23 Jan 2026 10:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164874; cv=fail; b=sMg96soTBBdRzHZoaNgEihOhsg1/dbdvZwjx5Jw+/S9lvczlq97FWjo4LP70vjfg1mefr4FDj6Fq5x+ghTf7V6irkH0S4wgff5H6CccVZ7/Duf0ZO2mpu6FQ39K/eVBscgix2YiWg8FYUQduNqEXV/IZ/rcAcQrDDLL8a20qbpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164874; c=relaxed/simple;
	bh=YwuY3eV77TPcKFSrVhZROmKvyyKkyyvGJoV68rm43H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=q7/xXKQUx+pdTAsJVRw46yEbQCLiUAf3iHm24Rl4ABzwkp85G2dWVE7Tc1s2XnvBStvaYX5q1vgXZMLyjYZxgZnUKVYvLM+KbM/G5enPc5yV2XierTpTv0fAA/isqawmoW83V1bvVlkAeyTmqYrvlGxNOqL8uIj/wOQfbnHUhUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=m31D1rxU; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAUgbO3445534;
	Fri, 23 Jan 2026 11:40:58 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4buh90vuda-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:40:57 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/17GU8Ii82EmN8vnxCm8nBcDiRZNkqzTjrUQt6wpRhHTR1PbT0Se1gEwvoLKN4ABQPFUBWjpYl3pBbEBBSqerK/9FfsUPRwsiHBN1NPyGvDnb+oM6ed+cE9P23FGrt3msMjHhjGUnSNFYJL9G+fI6sKDj3y+gaIF2bpb8+xSDro1hFBgtQvM/OLFYj4ivZuSpzjSsZWiGqWZUaSDvLRwjV5vGfSFUm/ZkccpyZjzOqLwOZELSnuuO0xwOPC+Te1d8yMWIompW65/FRv6SIuJATjaRNL3bHNONMKkfHm0wKms58ohY9qB/svYNHOxiSCEcsf2bhKVsNNYOrTdEMtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/jJ3nT9dPqpx2WOyU8sSZGS5YZ6LQrAiKlXrEYWtbc=;
 b=VRTyQnq/7s6XI2XipI6mltJ1WTtABENRzom2x7G33CKQCdmue41HaiwxWLKCp6ax3P4Y1VUH9yefbT3wy7XPcZ2JPm4yddhYf/wYn+oBkV+aUl6vsyzAoyW5OoD/N05Izc9PgrAP+8Ps4Mv9/04eHSCruPcRkZRg+lDjH3NlfOzWGjrdKqwujNAakLfqLJJFPdedgiAvW99vKI33d/A1PSkZsZvYwv6Y9F3Vv8h9os9lHwGm2YPAaxA6Akw/KDhrZLvhXfQt4+cWkAphLOeBfWTTP4A4uNhLyzCKqOc5XZdMXCu5FUNXhQz1/YaHE9lMXT48GXuptF+lGsDerMVX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/jJ3nT9dPqpx2WOyU8sSZGS5YZ6LQrAiKlXrEYWtbc=;
 b=m31D1rxU04ZtBtf0LLclIVwZbeeNHJYk4hS9cE6f0WdlIjomqZNKE4e0LkxCmTPP4MMOj9My/oDQaQS8XXfcSDRSx5JxbXPJdyHiEhHnLaEa657al6T2OjN2L2x9E6nei4AbVvosaiTrdzCb+TDav3XzTd2vNoTqEc9w+SMzfZyAioO04n6wz9eQpPiBmXncI3eizBvTmZElfYirNiimhnT+QV7WnoevojIBvzPpebM/ff/hTbLYPAPy1bSZOWI7ytJSQDHrijNu5HO/KwwkFG1lZRX7RMx4pbJOM06gm8Ah3g+8Dpy2l4iIaG3m+caqJm3JMEaTrD/3LcFoQpAnQA==
Received: from DU2PR04CA0202.eurprd04.prod.outlook.com (2603:10a6:10:28d::27)
 by DU0PR10MB6873.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:47e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:40:50 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::1c) by DU2PR04CA0202.outlook.office365.com
 (2603:10a6:10:28d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 10:40:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 23 Jan 2026 10:40:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:42:11 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:40:49 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 Jan 2026 11:39:03 +0100
Subject: [PATCH v5 06/12] drivers: bus: add the stm32 debug bus driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-debug_bus-v5-6-90b670844241@foss.st.com>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
In-Reply-To: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <jens.wiklander@linaro.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|DU0PR10MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f83eec5-4c04-4ade-a2c4-08de5a6be081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REg1b1Nzd3lESEwxQnBWYzM5SlVDbE1ISmZLbDJxOEFwbmtVNzFVSHpkVE9G?=
 =?utf-8?B?ZVlDS0dFYW45Qnh5NERXOXNQay9LZVgzODdmTVZmMDFDcElZMWM1dTJ0Mi9z?=
 =?utf-8?B?YTZFamdleEg0R0RLZm1DMlBCUjRDaTZ4WlpVZ0NQVDJueTdZNWdxMGJheE8w?=
 =?utf-8?B?dmFjbDlrMmtLb2pZZ2xQRHg0aW5BbFdoZ3EweVhhUllORncrdCtuYXlLZ1VT?=
 =?utf-8?B?c2ZQL3FJcU9SQkJUNWZIcUFlNGtFdU13eTZWdEt0dDZjMTBSQjRBSEMzY3Rp?=
 =?utf-8?B?K0RXZzc3WEVOY1hKTzc4c1h6b2ZidnRUZG9zN3Y0VVc4SmxEbWlHWjBnelZG?=
 =?utf-8?B?MjN4RXE5MHlEeDdVQkM4aXREdHg1aGVyMXZ2aGZxdWNCTTEwV2k2WllQdU8y?=
 =?utf-8?B?T1dKRXoxZVdPYnlGYjBNWER1bzYxY2M3TGxMdnZXRUFEZStRb00rRXk1WU1V?=
 =?utf-8?B?SExYcXdlR1RaSmVRZEJ2M1I1OVhLOXliWS9UTmxvckc3ZEZHRHB1THZQQVNx?=
 =?utf-8?B?Q0dycGx0akg5eXNBM1hDWG9BRnpsVGdJODNRWVBNcnAyY2xvb3JnZ2k0ZGRH?=
 =?utf-8?B?SXVIblVQdHhvSWZTSEllMnNJRm1TTm05WDdnZmhGcnY0SGR1bG9JOUVTYVNG?=
 =?utf-8?B?elM5TG4vUUc3bkZJeTFBc29LZUFaL1ZDUDN0SGJNMnh3Z01NQU5ET0dxNVFR?=
 =?utf-8?B?Z2k3ZmFOL1h1alBrc1lCWHBKVzlQc2NnbUVnV0lKam02QlRhdnFxUkZFZGd1?=
 =?utf-8?B?dnJZenR3bjB6R2N5SDFxSzZxVG85MERQK3g4WFhDLzM4V0N3ZlZMNndYUVpa?=
 =?utf-8?B?d0JQdnBhaFEzTk1uUmt0NGVwaTRhVkNaeGwxMkpKc1BCbmxmTk01OTdpSFhS?=
 =?utf-8?B?NXZKUmxaenZZK0IzY1FCdnZNVm5ab2lib3ZVck9SdnZYU3BPVHRpVHJxN216?=
 =?utf-8?B?RlVMTjRtWkRCMG5SQUlCZ0hnRlJRL2w4ZzIzNVp0YUtWYmhYSnhyQ0h2QVQ4?=
 =?utf-8?B?NXhNQk5Wb3VOZDEzdDhQc29vZENyZ2Q3cXBFZ1FlTjdNSFFXc0hDaWpaYXIy?=
 =?utf-8?B?ZFYvL1dWOFdSaVdXRUtUTURSbndaTFYxb05rV0RYdVdBRDJCakNPbXl3RDZU?=
 =?utf-8?B?emk5OXBHVEFYN0dwRVZIbHF3ekEwWGZOWVphZTRvODkvNnZTMGNkeGJ5YjRh?=
 =?utf-8?B?Ti9SMnRCU2ZCTS9yUFpFbGRQdEd4dFVZd0JCTXJnNEdGaVhySTlUY0wyUWp4?=
 =?utf-8?B?d1FndlJwVm1GelRyazNxQzUxQlc3RFBKcDNURWdtU3M5dm5qOFdqNVpES0Fn?=
 =?utf-8?B?WmVwMXB4eEhRY0tRN1NESURaa2dyZVlTTjNTTnM5ZlZjVDg5TWwxbjhPa1ZI?=
 =?utf-8?B?M2RtNEIvQnlMMUx6dVhUSXV1d05GN1JYM0VMWTlZS0FaTUhQbldaaVJMK2Jy?=
 =?utf-8?B?KzIzVDFmTkZXbnBxaHNybC9sQ0tUS29WMDV2YTRFYXkyeU1mbmpNTUlJR09t?=
 =?utf-8?B?WERCZk9HbEdRRlR0UXZHR0tMQkxlVDRoS2piZ0lmY09tbUVYOVB6bE9wdU42?=
 =?utf-8?B?aVlhV0Nkc1RqZ3RlTlc5blg5YU94cG1NQU1WcWVOS3lxQVlYeTd6MzFsemdZ?=
 =?utf-8?B?TzU2OG9ZRXVBZ2JTNVF3UFFxMGFWSExBdjk0cFRnUmt0ZFp5THVQSHEvd2Nx?=
 =?utf-8?B?d3ZZQlNMRDVUY3E0b0tYMWVSQko5TG1NU0VYRkd4NlRzQWZCYmYwS0xPVnpS?=
 =?utf-8?B?WmxSeHBMTHVLYlZraEJHQ0ZTMlB5N1djSXBvRzg5bElYZ0FVbmFxQURldWFS?=
 =?utf-8?B?TjVhZlVrbHBxUmRLOTRtVVlIZmpNY1ZYcnNmQWFQZGppNGRwS1hZZm1TSm1z?=
 =?utf-8?B?TytDejFkeEc5WlFRcGw2d0xyVDhIem1rTE50eGdneDBxZVVvamVCSnREcVl5?=
 =?utf-8?B?NXIvb1F5YUNhbU5tNUtwZHhJcjIvTGFPS2lBdEY1blJtNk5RdEh4M0U4OWJu?=
 =?utf-8?B?ZzVkU0N5YzhUa1FrUlUvd0pJblBUeDNsejFMT2w2eE4wK2Jvb0xCTjZXZTh2?=
 =?utf-8?B?eWpMWE5GVml4NFBZK29SUWpXU3A0ZVVldW9nQkJPdTNiSkdkMHBRd292Ti9G?=
 =?utf-8?B?Ymk3TjE2bDFYOTQvZzFYNEhQaHZBM1FKazAvTTdTM1lwN2ErbS9RMUhKVHFF?=
 =?utf-8?B?VjdpS2YwaTVJT3hhTHQwYm5GTTVFZVlreWFoOTB6VzVCNkRlK1ZSd1dFK3c2?=
 =?utf-8?Q?d5BSPULgcShbY4VPT0D9kpJJcW5R60WM1ad8ApZvx0=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:40:50.6601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f83eec5-4c04-4ade-a2c4-08de5a6be081
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6873
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX6pQe6nTL2Fbz
 hTynTpJYt8vebkPuVQwXA0M5JKaLs7JJCNVYP7yr7NoxNtrk8e5xfoOO7H5/RHxr2Flxgb0JHtr
 gPvP7N5gAnpBhb7KlcUvmACQ+5xAT7cIBz2riYujPprMET/uGPgFmR4zbAKgONeUPQoxKn31V9e
 Q1UF301/eLxVAJTzmKjrNA2c9DpCFeJw+PrsyJc1nHbqLH2dtCSdm4neXq265RZM2P/SmpMpmly
 rVIwZ/zDPvkNcLyUeZ9+KwNZpVuYg6qBx1JcTqJ1/pZkLUD/t9SG2d9vYs4v3ca4miLl0Hme2/A
 tiun69WKXmFfDlE9iF+kr8wn6YiJ4WFT/iwoD2llX6Ry6VIlL31hCnEfnxq5F+S5htqwJks9WZO
 i8Bp+Qae7FCvZSTx0MXH5ZREoT0I3XCV2eklS5GwE+n0fRKSMdkKM1Yvxpod2Csj5zFfEp2+Vi0
 zYpqbFxiE2hwwD8SMqA==
X-Proofpoint-ORIG-GUID: MpeVASLjBrfCS8rTcb5PS3q9cc0WuVCL
X-Authority-Analysis: v=2.4 cv=GbEaXAXL c=1 sm=1 tr=0 ts=69735039 cx=c_pps
 a=RSP5wjQe9cmB1/5ZhXI0tA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=3L3Zm1D9LUX1ZMezbK0A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: MpeVASLjBrfCS8rTcb5PS3q9cc0WuVCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30998-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E07DA746DD
X-Rspamd-Action: no action

Add the stm32 debug bus driver that is responsible of checking the
debug subsystem accessibility before probing the related peripheral
drivers.

This driver is OP-TEE dependent and relies on the STM32 debug access
PTA.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 MAINTAINERS                 |   1 +
 drivers/bus/Kconfig         |  10 ++
 drivers/bus/Makefile        |   1 +
 drivers/bus/stm32_dbg_bus.c | 236 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 248 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..fd8390e02070 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24698,6 +24698,7 @@ F:	drivers/power/supply/stc3117_fuel_gauge.c
 ST STM32 FIREWALL
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained
+F:	drivers/bus/stm32_dbg_bus.c
 F:	drivers/bus/stm32_etzpc.c
 F:	drivers/bus/stm32_firewall.c
 F:	drivers/bus/stm32_rifsc.c
diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index fe7600283e70..c9be21d5dfda 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -169,6 +169,16 @@ config QCOM_SSC_BLOCK_BUS
 	  i2c/spi/uart controllers, a hexagon core, and a clock controller
 	  which provides clocks for the above.
 
+config STM32_DBG_BUS
+	tristate "OP-TEE based debug access bus"
+	depends on OPTEE && STM32_FIREWALL
+	depends on ARCH_STM32 || COMPILE_TEST
+	help
+	  Select this to get the support for the OP-TEE based STM32 debug bus
+	  driver that is used to handle debug-related peripherals on STM32
+	  platforms when the debug configuration is not accessible by the
+	  normal world.
+
 config STM32_FIREWALL
 	bool "STM32 Firewall framework"
 	depends on (ARCH_STM32 || COMPILE_TEST) && OF
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index 8e693fe8a03a..799724cfc2df 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
 obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
 obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
+obj-$(CONFIG_STM32_DBG_BUS)	+= stm32_dbg_bus.o
 obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o stm32_rifsc.o stm32_etzpc.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
diff --git a/drivers/bus/stm32_dbg_bus.c b/drivers/bus/stm32_dbg_bus.c
new file mode 100644
index 000000000000..9427d4da0da7
--- /dev/null
+++ b/drivers/bus/stm32_dbg_bus.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ */
+
+#include <linux/bus/stm32_firewall_device.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/tee_drv.h>
+#include <linux/types.h>
+
+#include "stm32_firewall.h"
+
+enum stm32_dbg_profile {
+	PERIPHERAL_DBG_PROFILE	= 0,
+	HDP_DBG_PROFILE		= 1,
+};
+
+enum stm32_dbg_pta_command {
+	/*
+	 * PTA_CMD_GRANT_DBG_ACCESS - Verify the debug configuration against the given debug profile
+	 * and grant access or not
+	 *
+	 * [in]     value[0].a  Debug profile to grant access to.
+	 */
+	PTA_CMD_GRANT_DBG_ACCESS,
+};
+
+/**
+ * struct stm32_dbg_bus - OP-TEE based STM32 debug bus private data
+ * @dev: STM32 debug bus device.
+ * @ctx: OP-TEE context handler.
+ */
+struct stm32_dbg_bus {
+	struct device *dev;
+	struct tee_context *ctx;
+};
+
+/* Expect at most 1 instance of this driver */
+static struct stm32_dbg_bus *stm32_dbg_bus_priv;
+
+static int stm32_dbg_pta_open_session(u32 *id)
+{
+	struct tee_client_device *dbg_bus_dev = to_tee_client_device(stm32_dbg_bus_priv->dev);
+	struct tee_ioctl_open_session_arg sess_arg;
+	int ret;
+
+	memset(&sess_arg, 0, sizeof(sess_arg));
+	export_uuid(sess_arg.uuid, &dbg_bus_dev->id.uuid);
+	sess_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
+
+	ret = tee_client_open_session(stm32_dbg_bus_priv->ctx, &sess_arg, NULL);
+	if (ret < 0 || sess_arg.ret) {
+		dev_err(stm32_dbg_bus_priv->dev, "Failed opening tee session, err: %#x\n",
+			sess_arg.ret);
+		return -EOPNOTSUPP;
+	}
+
+	*id = sess_arg.session;
+
+	return 0;
+}
+
+static void stm32_dbg_pta_close_session(u32 id)
+{
+	tee_client_close_session(stm32_dbg_bus_priv->ctx, id);
+}
+
+static int stm32_dbg_bus_grant_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
+{
+	struct tee_ioctl_invoke_arg inv_arg = {0};
+	struct tee_param param[1] = {0};
+	u32 session_id;
+	int ret;
+
+	if (dbg_profile != PERIPHERAL_DBG_PROFILE && dbg_profile != HDP_DBG_PROFILE)
+		return -EOPNOTSUPP;
+
+	ret = stm32_dbg_pta_open_session(&session_id);
+	if (ret)
+		return ret;
+
+	inv_arg.func = PTA_CMD_GRANT_DBG_ACCESS;
+	inv_arg.session = session_id;
+	inv_arg.num_params = 1;
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	param[0].u.value.a = dbg_profile;
+
+	ret = tee_client_invoke_func(stm32_dbg_bus_priv->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_dbg(stm32_dbg_bus_priv->dev,
+			"When invoking function, err %x, TEE returns: %x\n", ret, inv_arg.ret);
+		if (!ret)
+			ret = -EACCES;
+	}
+
+	stm32_dbg_pta_close_session(session_id);
+
+	return ret;
+}
+
+/* Implement mandatory release_access ops even if it does nothing*/
+static void stm32_dbg_bus_release_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
+{
+}
+
+static int stm32_dbg_bus_plat_probe(struct platform_device *pdev)
+{
+	struct stm32_firewall_controller *dbg_controller;
+	int ret;
+
+	if (!stm32_dbg_bus_priv)
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+				     "OP-TEE debug services not yet available\n");
+
+	dbg_controller = devm_kzalloc(&pdev->dev, sizeof(*dbg_controller), GFP_KERNEL);
+	if (!dbg_controller)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Couldn't allocate debug controller\n");
+
+	dbg_controller->dev = &pdev->dev;
+	dbg_controller->mmio = NULL;
+	dbg_controller->name = dev_driver_string(dbg_controller->dev);
+	dbg_controller->type = STM32_PERIPHERAL_FIREWALL;
+	dbg_controller->grant_access = stm32_dbg_bus_grant_access;
+	dbg_controller->release_access = stm32_dbg_bus_release_access;
+
+	ret = stm32_firewall_controller_register(dbg_controller);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't register as a firewall controller: %d", ret);
+		return ret;
+	}
+
+	ret = stm32_firewall_populate_bus(dbg_controller);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't populate debug bus: %d", ret);
+		stm32_firewall_controller_unregister(dbg_controller);
+		return ret;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't populate the node: %d", ret);
+		stm32_firewall_controller_unregister(dbg_controller);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id stm32_dbg_bus_of_match[] = {
+	{ .compatible = "st,stm32mp131-dbg-bus", },
+	{ .compatible = "st,stm32mp151-dbg-bus", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, stm32_dbg_bus_of_match);
+
+static struct platform_driver stm32_dbg_bus_driver = {
+	.probe = stm32_dbg_bus_plat_probe,
+	.driver = {
+		.name = "stm32-dbg-bus",
+		.of_match_table = stm32_dbg_bus_of_match,
+	},
+};
+
+static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
+}
+
+static void stm32_dbg_bus_remove(struct tee_client_device *tee_dev)
+{
+	tee_client_close_context(stm32_dbg_bus_priv->ctx);
+	stm32_dbg_bus_priv = NULL;
+
+	of_platform_depopulate(&tee_dev->dev);
+}
+
+static int stm32_dbg_bus_probe(struct tee_client_device *tee_dev)
+{
+	struct device *dev = &tee_dev->dev;
+	struct stm32_dbg_bus *priv;
+	int ret = 0;
+
+	if (stm32_dbg_bus_priv)
+		return dev_err_probe(dev, -EBUSY,
+				     "A STM32 debug bus device is already initialized\n");
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Open context with TEE driver */
+	priv->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
+	if (IS_ERR_OR_NULL(priv->ctx))
+		return dev_err_probe(dev, PTR_ERR_OR_ZERO(priv->ctx), "Cannot open TEE context\n");
+
+	stm32_dbg_bus_priv = priv;
+	stm32_dbg_bus_priv->dev = dev;
+
+	ret = platform_driver_register(&stm32_dbg_bus_driver);
+	if (ret) {
+		stm32_dbg_bus_remove(tee_dev);
+		return ret;
+	}
+
+	return ret;
+}
+
+static const struct tee_client_device_id optee_dbg_bus_id_table[] = {
+	{UUID_INIT(0xdd05bc8b, 0x9f3b, 0x49f0,
+		   0xb6, 0x49, 0x01, 0xaa, 0x10, 0xc1, 0xc2, 0x10)},
+	{}
+};
+
+static struct tee_client_driver stm32_optee_dbg_bus_driver = {
+	.id_table = optee_dbg_bus_id_table,
+	.probe = stm32_dbg_bus_probe,
+	.remove = stm32_dbg_bus_remove,
+	.driver = {
+		.name = "optee_dbg_bus",
+	},
+};
+
+module_tee_client_driver(stm32_optee_dbg_bus_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
+MODULE_DESCRIPTION("OP-TEE based STM32 debug access bus driver");

-- 
2.43.0


