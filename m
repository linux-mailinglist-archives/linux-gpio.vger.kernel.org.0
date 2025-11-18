Return-Path: <linux-gpio+bounces-28672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A653FC6A9E7
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 774F93616E1
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 16:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7AC36A01E;
	Tue, 18 Nov 2025 16:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LmK0NR7S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAA9350A1A;
	Tue, 18 Nov 2025 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482817; cv=fail; b=GDa9PFs5XripAJF7TCziydwh637cWD+Sfy0MZPBObkX1FwSU4MEGwMIrZgUNiJUw7j3zH+FgbF3WEy+ccniDHBcuPE5YI+B/sLbpFSvb93Zrla7I9JmEJ0ZhkJW43mV5sbICu/5T+HQ0RGUzVZuXaoUVql1HO1kAnBp1cIDsueE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482817; c=relaxed/simple;
	bh=cSnhB1/tfeqAm1vuwpZ6jS6ubJ+7CPtYlGFnwXBT0fk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gC8RvYRgUo6SI4DEjvHNc/c502qm2saLDlmovXCPTkYpynGr0+7v+6T3rA3OS53KUHEmwcCd7pLKxthK/k3aN7kSR8gWyqRzizFBUUY6eGoCAdhL7tklpiwBzPfEOFgfrEYvn8TBZT2iVhuld6ovPWNtv/3KY2TQGaEGl3w7oPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LmK0NR7S; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGHrLN414293;
	Tue, 18 Nov 2025 17:19:49 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agndtj26q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:19:48 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdEGjd6IK/XbLv6gfWCbVICCDqfZJ79lCsGz/G8v8SKyzpyqxr8pt6uqFtZF/wuZgKL2GgsooFCvKRlZC1zONWYVswK4W0ySlqqAQu8Q4SPVFuCyP0+hpsUxDKVqyep2PW8xdDWWXIMsOJ/w4kTAYtv3vVKaUkiUv0rADQL5ZMLZI88wK6QNdL1pyAL7iVf8qK3Aig+d/gbo4JVWxjyXQ6g3/VT6wMPjyOxNyAZFX6diZ3wurAy2rqhTaB3WHqFVxVaFbK1hL3ltAMffGb+qx9VgWZXYL1cmLztDG6c+w4GThbVwrFqVQo3NdYzOibTXY629ze4uGkVOODVgjO8+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbtycFlbNUPUuIqzvpz735DM2l8j5LKUR75TnWyK1r0=;
 b=sMG4rd2Nd2NB4VAv1+hgidD8s0VlIUzNWVVNuTIFkX0GuLctsve5MHaTkziXl6BmO1QxzwdiBBCUVvyic5Nl3sIMgpxUswoTLlnltRRGd9yydXW2UN0SllwqFwlejMIZXzMpltWNixQjBJo5rc7Xk7gnEFB69672wCI8kGux8og5uNYAgO8OQQu23CrfCmAETGiMDj7h7Hda/IdN2K4os5GWu2Ec01PW+YPJk8cjBA4mMacrA38RnjZiFiM4CI9mXcMKPlwnMY33wJHVpVGUVmtyoA8WimBDHES3PjspGvzwRkpW9SPDatxSWPWiPQ4j1C1Jn84QR7l2tb2sHZziUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbtycFlbNUPUuIqzvpz735DM2l8j5LKUR75TnWyK1r0=;
 b=LmK0NR7SJ/7BeIlBIMzCE/qHms+xmvByIqPSuZJumWjnzzzclntHVUEKkEyAkfZdKoLRdwfdMWQwg/xx6qXYG2qzmwmFkPlQOO3AxE2Ctgy/90KB/NJtzihr7+qOBuIYgidxY+iqW92QbbF4wDKDFPlmmoSVKrMnrHmPyhtaqHoSSxaXbc5F9NyQvGEfu8cwORHfdRmh/5sDma3JJDJgB8BFnIKxk6ArWZVDipZbQf3Sz1BzBLJAyFkkaQ6fDK5xD6gz1+RpzbVMMEyr3fzoddVp20+Mxqo8ek0+iM/3Zza9uI9wSXl3asQ1n2cb/4k+/zAyV8/jusLZS6/5x2YQ8g==
Received: from DB8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:10:110::11)
 by GV2PR10MB7605.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 16:19:43 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::86) by DB8PR04CA0001.outlook.office365.com
 (2603:10a6:10:110::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Tue,
 18 Nov 2025 16:19:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 16:19:43 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:56 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:42 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
        "Amelie
 Delaunay" <amelie.delaunay@foss.st.com>,
        Pascal Paillet
	<p.paillet@foss.st.com>
Subject: [PATCH v2 00/15] pinctrl: stm32: rework SoC package and add STM32MP21
Date: Tue, 18 Nov 2025 17:19:21 +0100
Message-ID: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039233:EE_|GV2PR10MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de02919-5330-4c99-dfe7-08de26be4844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|36860700013|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTllcXRla1pPREI4TjhRa1Qvc0EybWZGemxmTEIreStVczB5SGdRRVBxRTZa?=
 =?utf-8?B?NXIyaGJUemVGOHBUdktyZTNOYUk2bW5SZnp5OFU4NjdHdUtIQ29ObDcvOGtl?=
 =?utf-8?B?SlJncUI1UmJLbU9EekhuTFRIUDgrdEQxMjI1eDUwZGtPeEsrNDlRMHFlTFBE?=
 =?utf-8?B?NFNVczlnQ1A1L3ZrSUlHbmFQSVRsYlZneDdKZlNjYm9td3pHTjBTUlZGeGx0?=
 =?utf-8?B?ZFZwcEg1WDJhY3ptYVByZFd4Mm5sNHdyMlNTN3N4VDZuSzRVVENCTk00NldL?=
 =?utf-8?B?WG5aU25jZmlMUVc3Z3ZtZkF1b3hMb1UwSnVPSkhxRll2WE80SWsrOUNlSGpE?=
 =?utf-8?B?SnlCeDdJMi9uMktoRHRtUW5rektLWnViRGpyWnpXL0daVlN4UldmWUc4cG9m?=
 =?utf-8?B?QWNkVlZ2TndadW9zMmFuelFTWHZnbXJhNUs3OS9nZzNNaTloSEpNa2thaCt0?=
 =?utf-8?B?QW4waVhVRlZlOXlBS3lPanJvSS9HUDVmRnZXcHVhQUJ6dlMwclo3eGk1NS9M?=
 =?utf-8?B?ZmdPclpJR1lzMElFODcxc3lVNSswaW41c2R1cEUyMVpqVlRjMXVoUTgzbElM?=
 =?utf-8?B?MHRDdUFkS0Q0VFV4SEVmM054RHhTVy9sdHd4L2lWN20vRml4NVRGQk5VWGxl?=
 =?utf-8?B?SVFDYVljdWJNL1dCbVlENHV0WUorenR4VnN2TVZ5UmhvK1RJM3BZQ2Npd1pZ?=
 =?utf-8?B?U2VtY1Rhc0F2dlFLbXRRTHhCa3l2Ri9QUHZuTEVXZFFuWFpuQytpVlJsR0VJ?=
 =?utf-8?B?THcxU1BiR05lclp6N1lKUTAxUUJ4Z2JodEtIR1lnNWJObTNOWStBMHM4R3Jr?=
 =?utf-8?B?dUlyaXY1ZkZlQWR6NFJOc01jR1lMT2FmV1oyVzJHMm9jTk4wU1dKOWtGV3Ra?=
 =?utf-8?B?dXg2RWRud3MyeVlsU0R6U1VGcStVNVgyS2lNUWp4WjBQOTFwV054T1kyYjVK?=
 =?utf-8?B?ZE9oRnBjd3VMak1YenE2Z0lPcWpHZTFxVkYrM200TmI4UzUxR05lUXpiUWZJ?=
 =?utf-8?B?Vm5iVy8rcWZSUHBKdnhVVVV5ZERTVURRbVlGcEFaK0Q4TW56dWRLSkE2NzVS?=
 =?utf-8?B?RjNQTStGMVVoaGRydDl2ZytkdU9GRk9hbG5iK3FUTWZBaU1US3FCRXhSS3lG?=
 =?utf-8?B?ckt5M3pqSTQ1MS9vNmV5RmliVFA0ckcyQTczaHprTEJxVUxVaWl3QlpiQ3Mv?=
 =?utf-8?B?N3UvdE42N3V2Ym16aHJreGVQUDZURWJQOW5KbmdOUncxT0V1aUNETWxTSnVD?=
 =?utf-8?B?b0ZWV3doTlpJNEtOZXYrc0JqbnpnMnNUUEtPL3o5Myt3d2JFT3NSYjc3RTZt?=
 =?utf-8?B?SE8vVXV2NGMwRk9XNWRxS05YODEwbUV2a3QxUHYrSmZoZ2RwYUNuQnVRdmJE?=
 =?utf-8?B?akMydzFkNFFZQnZuUzl0UkZRVWlZcEp6Wk9YTDJsRlNGYmdxdWY5NmdUNWxu?=
 =?utf-8?B?amdCN0QvSXM0Yit2Z1FMUkludzVBczRteEViTSsvWTc0ek5Va3FjVnhUVGxS?=
 =?utf-8?B?b0NpQXNJVnhydDZKcHFkQkN1eVhQdDhwRC9zcDZmZzdodnp4L0RKLzYzZUV4?=
 =?utf-8?B?NGpKRzl4aW13aUZwa1JrU0hxaDB5VEJheEdGa2FNMkNiMjdpM2Via3lUbkxR?=
 =?utf-8?B?TUczUzhOT0VKeTF0ZUsrbzRobWN1MGVEV3NjUG95WXNKMUV1c01FUll4TVhI?=
 =?utf-8?B?UzlQWk1DaHdGOUxzc1g4b1p3Ynp0a1ZRVGlYYzdIT3FmQlFpMVN6MEtnWktp?=
 =?utf-8?B?V2M5VmRqZTFHSmxXbEdrcCttNlFJSGRMalpRUjRnWUR1ancrdHdUQUJ1b1FQ?=
 =?utf-8?B?WnpFM2kxK09USUVoQmVPTXZNSFlOQ0YvNG9yZ0Voem5EYUcrZi9qM1JwWXZl?=
 =?utf-8?B?dkQwdU5DTm51MEJPclJEZkJjakZnQlQ4WmxaWVl6bWk3N1FJd2JMU0puc0oy?=
 =?utf-8?B?NFJKMGFZeEQ1WjB0aTQrZFR0dHlqU2FKN0ZyNHp3bGUxQ1FVd3VYeGdKaXJw?=
 =?utf-8?B?SHA3YTJvVkt5bnVGTmxNVEYxRTRCTHFsZTZDUWwzbEJPZEc5bXpRU3daZmhn?=
 =?utf-8?B?bWJUcW9hcVQ0VytaQkY2ZENqVklqdjAvVHdnaERaSGFIOVpWRWloUEVyVHdx?=
 =?utf-8?Q?y2MfbJvC9QxrH0qN1iCj1HJIU?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:19:43.0221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de02919-5330-4c99-dfe7-08de26be4844
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7605
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzMSBTYWx0ZWRfX9ogwA9BFtOJP
 JronamUQFHyVTt8HCWlTGmgjA6fwXM2cnSd+7Goet3aPkTB7bA101RMtKxL7x38cpY5h731v6Vm
 GfFHrrUtoMDIypcNNPT2s6pj8CUVQaX8E9lzz6/KlhNvchTFnpnel246fPeNSIR4ykmseTAGbuH
 jRXgvmRNa2HTu4KymT4HKboyGAXY81B1CcwfJu3fDankbcH/+9FRMuMh7AL48nNhhqEsfforadu
 SlEjqRBFOyU7YZ9y0vXulP1OT0LcSNM9+xa2sNfCsWQzHWiZFFrxYAokiphGIEI/CPH1Eqzh3+X
 eDzGxElSLNmiHDpn5ogkHQDb0O3Hq984WyxSsVrnUOvmA0cfaOL/YhwY7z8c5Jj258ggl6Ru+/y
 j7E94U0zYPzBiYMkjr+wlxTu4VJMlA==
X-Proofpoint-GUID: LmUsbQSHjwJNVmqbpSi17NvqmOKxM6yK
X-Authority-Analysis: v=2.4 cv=Uqhu9uwB c=1 sm=1 tr=0 ts=691c9ca4 cx=c_pps
 a=AOycmoUevleOEOAMEpukkw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=3TsN7hw2_K0hBqRFV8MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: LmUsbQSHjwJNVmqbpSi17NvqmOKxM6yK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180131

This v2 is a subset of the v1, split-out to simplify the review.
The old patches concerned in v1 where 10/14, 11/14 and 14/14.

This subset:
- obsoletes the numeric values of the property 'st,package' in STM32
  pinctrl and replaces it with a string value. Keeps backward
  compatibility for old DTs;
- updates the DT to use the new values for 'st,package';
- add new packages to STM32MP25;
- add pinctrl driver and bindings for STM32MP21, including the extra
  dependencies of optee and exti nodes;
- on board STM32MP215f-DK, use the pinctrl driver to properly setup
  the UART and add the heartbeat LED.


Changes v1 -> v2 subset:
- rebased on linux-pinctrl branch for-next;
- replace numeric values of property 'st,package' with strings;
- add users of pinctrl driver on board STM32MP215f-DK;
- Link to v1: https://lore.kernel.org/lkml/20241022155658.1647350-1-antonio.borneo@foss.st.com/


Amelie Delaunay (4):
  pinctrl: stm32: add stm32mp215 pinctrl support
  dt-bindings: pinctrl: stm32: support for stm32mp215 and additional
    packages
  arm64: dts: st: introduce stm32mp21 pinctrl files
  arm64: dts: st: add pinctrl to usart2 on stm32mp215f-dk board

Antonio Borneo (7):
  pinctrl: stm32: accept string value for property 'st,package'
  dt-bindings: pinctrl: stm32: use strings for enum property
    'st,package'
  arm: dts: stm32: update property 'st,package' to new bindings
  arm64: dts: st: update property 'st,package' to new bindings
  dt-bindings: pinctrl: stm32: add new package to stm32mp257 pinctrl
    support
  arm64: dts: st: add interrupt to optee node on stm32mp21
  arm64: dts: st: add pinctrl nodes on stm32mp21

Clément Le Goffic (3):
  pinctrl: stm32: add new package to stm32mp257 pinctrl support
  arm64: dts: st: add new package file for stm32mp25 pinctrl
  arm64: dts: st: add exti1 and exti2 nodes on stm32mp21

Pascal Paillet (1):
  arm64: dts: st: add heartbeat LED on stm32mp215f-dk board

 .../bindings/pinctrl/st,stm32-pinctrl.yaml    |   26 +-
 .../boot/dts/st/stm32mp15xxaa-pinctrl.dtsi    |    4 +-
 .../boot/dts/st/stm32mp15xxab-pinctrl.dtsi    |    2 +-
 .../boot/dts/st/stm32mp15xxac-pinctrl.dtsi    |    4 +-
 .../boot/dts/st/stm32mp15xxad-pinctrl.dtsi    |    2 +-
 arch/arm64/boot/dts/st/stm32mp21-pinctrl.dtsi |   38 +
 arch/arm64/boot/dts/st/stm32mp211.dtsi        |  294 +++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts     |   31 +
 .../boot/dts/st/stm32mp21xxal-pinctrl.dtsi    |   71 +
 .../boot/dts/st/stm32mp21xxam-pinctrl.dtsi    |   71 +
 .../boot/dts/st/stm32mp21xxan-pinctrl.dtsi    |   71 +
 .../boot/dts/st/stm32mp21xxao-pinctrl.dtsi    |   63 +
 .../boot/dts/st/stm32mp25xxai-pinctrl.dtsi    |    2 +-
 .../boot/dts/st/stm32mp25xxaj-pinctrl.dtsi    |   71 +
 .../boot/dts/st/stm32mp25xxak-pinctrl.dtsi    |    2 +-
 .../boot/dts/st/stm32mp25xxal-pinctrl.dtsi    |    2 +-
 drivers/pinctrl/stm32/Kconfig                 |    6 +
 drivers/pinctrl/stm32/Makefile                |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32.c         |   36 +-
 drivers/pinctrl/stm32/pinctrl-stm32.h         |   29 +-
 drivers/pinctrl/stm32/pinctrl-stm32mp157.c    |  352 ++--
 drivers/pinctrl/stm32/pinctrl-stm32mp215.c    | 1807 +++++++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c    |  344 ++--
 23 files changed, 2958 insertions(+), 371 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp21-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp21xxal-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp21xxam-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp21xxan-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp21xxao-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xxaj-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32mp215.c


base-commit: 61cbe48d9d1ff277bc54051fbab8b733b2e64ccb
-- 
2.34.1


