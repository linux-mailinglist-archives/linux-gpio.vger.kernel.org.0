Return-Path: <linux-gpio+bounces-30336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA9BD08C92
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 12:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 854BE30369BA
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C172633B6D1;
	Fri,  9 Jan 2026 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cPCLNu1j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5F333A715;
	Fri,  9 Jan 2026 10:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956315; cv=fail; b=WF9vxJ0h76WDdeatHlCjNBkbUgCivTKOFc7/zIyMcSDkUrCJN326ArEWWzr4bHTrHPfBeZ17Zek8zCP0/wGOO2K0LSF+5PMTlR1ohuVEfzl0Wv7it39KCV++SkKn0bke7C0tC776vW4r0tFNqL7KORN/XPYs4U/lgrgYnIWrU5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956315; c=relaxed/simple;
	bh=xbgh1CCIgcEFj9WeothPqUmM2N2sWTN9TRalHeX1drc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tIUSkdG3ZAJP78mCMTGMckt35VzTCsY8N0zs4VjBZNs7u/Hdm3oBHm60+TKb79iCcKY/cH2kR6i5WkLPtof5dgVJY4xxQSUvRNu9aFq4gOt049LVNYt3dPRRkhUp6aFiO0ny34iYBs0nV/ZwGC4N+jfFsUeBOUrSeGcNrRre++0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cPCLNu1j; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609AkDgM4181151;
	Fri, 9 Jan 2026 11:57:12 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjm9v2abu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:57:11 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHSQ+BFF1jxyX9m3VeJ1rXZ+O6/0Tq2oys3waL8NEtBVyhVPlT5cvLIqf+2MomhVuJZsPKoOXLa9Xk5Q11hQQb0Tq+cfkhmDqVYQDLsOf8tEXTozGxd7/OmQsTiQpJAOmer7gmZYy18lT5v97wmryfArLiyntLUdabvcMRxZrl45ckiQJJPDbgYqZEYbQdorfckcjoIIYFStN5a/2Y7bTzhj204WkpeXwnFQ+3sCV229wUnvU8NAH4Usw7DILSc9kgaNmISdW3tscBOwm0+TiDZb+be8joOiX3QWJQYsVKdI52X70FA3a8R/G/Ah1u0vfs7mr8poXixTXaCb+2nhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bwxk81WusWTFK/a9r7vinmm1wcowOubfgfecTr4+eB4=;
 b=OHJ1gHUbHrUGUXOgR7VmNaxqMTiZoNdKVFrQ/52pdz8Ms6rL/zntXJrD04TqnacYgbviJzVlfFsMAP4gvhiRX/JpB2T6Hss8N5IrSJA/DtDhih1at8Mj9tAA93uGYCf4rLyLrtlGGIysB7SE5j0ceK8+zE2xC7mb3pidauQ7XjcC4ycehjXAJVcVXgpRnoyquYNua34ScPKVkBKf38zCFj+vj432+qeZcOHWqe7Au+VuFrRH7fjzMIczHsj1GNFTp1jNw6KAPltV709rwx3vRnQn8a7XDdYCLSnSYQmEjgCw3DixenM9GASX9VB2uug5cZ+I8uvdnRGGTILUYuY1SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bwxk81WusWTFK/a9r7vinmm1wcowOubfgfecTr4+eB4=;
 b=cPCLNu1je7ZuwBD2uI8JB5RTiWMS428AYN6kotWxrliQ6//0M0IYPGco4zoB7kSMEVc780nqAl/MlQ0kxcM7mA5as7n5qYk7gydQZgSXIh9IacR4myPBm4KZjsmKIy5dxhEBJbZ+be2GP87RePH/Ytbd/C83EXKTV976kp3CmsaXmqFpzJpWzE2sGjylO7n4e2p8VzY3d1EQSdijSIJsbgSXJA+Pr4hV5ApEgQ2XKtC6v0I3X+ENiUtRIYGbTFPqz2g70wYNR6NbYKrrYjMvzRRXwsNQZOPPuq1v7g9e2xMR6+DexdUZGI6QMFZE/wY6DRrG9kfC3P8PLj5lxOH8Sw==
Received: from DUZPR01CA0125.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::17) by DB8PR10MB3164.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:11a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 10:57:07 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::a3) by DUZPR01CA0125.outlook.office365.com
 (2603:10a6:10:4bc::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 10:57:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:57:06 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:58:23 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:57:05 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 9 Jan 2026 11:55:07 +0100
Subject: [PATCH 07/11] arm: dts: stm32: enable the debug bus on stm32mp1x
 boards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-debug_bus-v1-7-8f2142b5a738@foss.st.com>
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
In-Reply-To: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
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
	<alexandre.torgue@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|DB8PR10MB3164:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c1ea22-e736-4a5d-b7c0-08de4f6dd460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTUrOEN6dFVFUWUxMVF2Z3RlN0RhT2RmZHMydjFDeXNXTFRrYnF0dHlVOEZt?=
 =?utf-8?B?OUlKQ3FHNWdXYmoxSExJVUZCOEFqdmQvZWFMSU5uUnUrVGtLdklPZWN6RDdw?=
 =?utf-8?B?b1k4VklialJlVWJGK2RJeXY1YUpJckRqdVRlR1pvVGpjcjc5QUhSMU1WVkVR?=
 =?utf-8?B?Rm5hdytCRWRkbXZkNklvRW9Zc0ZwaEloTHh6ZWlLc2RXUTErWEtGendmZ2Ni?=
 =?utf-8?B?cTByMExHcS9XYUlsWXpKNVMwaEd0cGhsSVFRVWhhL1pEbDdzY3gvcjc1cjZj?=
 =?utf-8?B?dFBnYWtNSS9HTytuMVN2ZWJnUFl1RXQrVmZnMCtwaS8zbEo3SGJFQWcxTjFT?=
 =?utf-8?B?VytocXpYNnR6TzNEd0ZXbFFCQUZSU1RmSVp1Z1IrcU5XTDh1YWJmc2NGY3RZ?=
 =?utf-8?B?MWRrblc5UTJPUVltS1hQTDdpeEcvY0xhUzBIeDYxVy8rNW5WaE5DcnNNOFhP?=
 =?utf-8?B?ZWRWRXN3QW5jVXUrREt2M3F2bmdMZlhTTGs0QnRyMVg4SWJudldjUGV3cmph?=
 =?utf-8?B?T1J4SmVmaVBZNUtBM2xNQmhFdWdmYTNZRnhZam83YjMxZEdzUFRWeWhacTVi?=
 =?utf-8?B?M0JnMFhKZ1pHbm5jWGlDeStsUkwvb3ZIVzA5dnMvRkR6YUtmd0FQeG9LZFRr?=
 =?utf-8?B?NnVhVk9Oc0xNMmNCakJSc1dLb0prZTBuZWZ0S1RiaGN3UFI4QlMzWWxIbjN4?=
 =?utf-8?B?VjhteEwwMWVjMGJUa1kxUUNtNnVwcnB1NWF5MG1lU2xIekJleWNJRW1MNVVX?=
 =?utf-8?B?QjExTGRRcVFseFAyZnNpK3F4QzhXSlNDcmhqNkIwTHZqR1N0K1I3T0ppTnJF?=
 =?utf-8?B?K25JR0lTczBEZDhTcVlncjZ5NDVJeWhtcXdvcWNBNWN3RHd1MU55emhjbzYv?=
 =?utf-8?B?MDNUSmFxNVNPekt2N3Z1K2JJa3B5RnNFdnpqc21uVktvak5kQXVjUDNPcjhX?=
 =?utf-8?B?c1Nsam9KMXcyOW5ZSGVMMG45ME1SbjM5cE94bDBscGNIZDNMeDYyWm5PSkt5?=
 =?utf-8?B?a0lxcnF3Z0pSMWFGZjlBWHZWTytickRMQXhpMEhwNzkzT1NpTHhYL2xqaS9S?=
 =?utf-8?B?S0doUWNYbXBRRFRoeDhiQyt1am1XWjZpYytXS1dYUFdRempWT1ZqMGtkR3l1?=
 =?utf-8?B?bkVNV2h2QXhBMTQxVUdzdnhFU2RKeVRlcjRFMEZCQ2RnVk44YUVsS1J3QllW?=
 =?utf-8?B?S0g5eWFCTnY3d3F0K0FnV2xJeG8yOTVod3paWkhFb3hZUlNvT2hWdTRBRXQ5?=
 =?utf-8?B?RE5uVFY0aldEcmFJYTBHWURwbFpJWXJYYit3WEtwZFR5R0hkN2lyUWl2VUdN?=
 =?utf-8?B?MHFmSGUyNCtYZWl6TGxnaE9pM1FHbGhGMTJTZmhEMDE5VzJVNWpwRDZmc28x?=
 =?utf-8?B?SWJSN3VYOUVQYVRva0JyYThvbTZTTVd6VlhEdWIvWW01cGo4dXlGWGRzd2py?=
 =?utf-8?B?K0VLWXJPZ1NzbXQ1eGo5R3l5SE5tYmZ5OTlXSWVBR1lnVGRVaWNXdkUwVHlC?=
 =?utf-8?B?TE5oZDg5SWZlS2NwcnRLY3RIZjZNTXl2RW92TDJQVU9PUmpxZ2V2S1pPNVlj?=
 =?utf-8?B?WkJ4aDRMdUFMK25zdmdkZlVIVmt6VzErTzNlS3ZsYWhmeEhCU2xuc3lDM1lq?=
 =?utf-8?B?bG0reStwY3BxbjExY1FXTzl6OXN1SXFpNzZVNGlxZVUzcVFsNVNpdjRzdnJE?=
 =?utf-8?B?ekdyeGlBeDFRc0RaZlhpaVBTdnIrNUxsYytldTJqUll3cHkrTGJWNlVBdG51?=
 =?utf-8?B?VkQ0T0p6L1ZSN3lzcS9lTDduVGp5S29FUE4xeGxJQzIrUEdRelVIYmVxMDBS?=
 =?utf-8?B?UGplWmhpN01JaEY0ekovVUI4R1dFWTdqQlhkUXdaS05iNXBJTTgyWjg5elFa?=
 =?utf-8?B?UUluTHRpUVZTcFNSc20wejEwb1UwZjhITVVZeDBMMU0wMHhWQ3VFaHdQSzhq?=
 =?utf-8?B?c2VBVkFGVVBDVWloR1N5OGtVOGFXREtoYm9LMk9ta2NhN3hCSEZpUXRhekRT?=
 =?utf-8?B?NGlVbFQvRUZIUmYxbVRZTEJLdW4wTUE3SUZoazRPaEp2Yjl2dVo1WHY3ek8w?=
 =?utf-8?B?Rkdld2FoT3c0aVNuRkdya0pNMmdWdEZDekVGazV1cm5SNlNHUHVlZk12a0s5?=
 =?utf-8?Q?odha4/e1caAGMS06SNj2dCC6m?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:57:06.5238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c1ea22-e736-4a5d-b7c0-08de4f6dd460
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3164
X-Authority-Analysis: v=2.4 cv=F4Nat6hN c=1 sm=1 tr=0 ts=6960df07 cx=c_pps
 a=2Ek2h33k5Of0QfAOorftPg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=mOgyZ-Q4tP4zXMNofoEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 0v5uzsc3VRDX9DcnRk2KzMnbAUszqox2
X-Proofpoint-ORIG-GUID: 0v5uzsc3VRDX9DcnRk2KzMnbAUszqox2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4MCBTYWx0ZWRfXzwxrg2ygLtMp
 PZ1IsFkP082pFlZ/+Zd3aYoMVnSwzTg46pQWcex1gVCq82RlwZnxOIbkGP7NOR3hCTEl3AWI3Ye
 gt8o3XRL7PJSxruZ+/eSf5a73xxP0DUg8hIZGENHP1CCFCskIUHkHpFhDJg22jf5efPkj+n39pi
 UEK09V1Je72bOIU9ic8FNsJmg49d9hiD0tu1zzUpkFeUtmMSo+WwUhZpX2O5dVBEu2jLj5NIwMY
 MrY5nDfiJDZkrigd+yCeu+UlwQFQHk0DufbqXzdOvFaC18ARe4EKHt9scizOjC/kV+LAaxNqWr+
 EKsJt3EbVAI+3JfU74C4rLisPe5tQkA5m3Bxl0Qn/3YxBlR8+oyctyhN8pdal7+yxqiWildxcz7
 jUXUuz403vijKhQsorcoTOAbwsDDUa/Ed3L6t+OtEss6GJbqRE9rPkPqxdKdZ4VmiVKUSVJiyjn
 47kyJacuT2kGPCiFIMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090080

On stm32mp1x boards, enable the debug bus so we always try to probe
the debug peripherals, if their status and the debug configuration
allow it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts   | 4 ++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts  | 4 ++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index f894ee35b3db..ebc719797271 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -174,6 +174,10 @@ &cryp {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmipp {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dcmipp_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 8f99c30f1af1..e69c8e282c8b 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,6 +81,10 @@ &cec {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmi {
 	status = "okay";
 	pinctrl-names = "default", "sleep";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 8cea6facd27b..fe2ab07ea4a8 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -140,6 +140,10 @@ &crc1 {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dts {
 	status = "okay";
 };

-- 
2.43.0


