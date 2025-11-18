Return-Path: <linux-gpio+bounces-28686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDC7C6ACFD
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 18:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 8869B2BAFB
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 17:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CAD36CDF1;
	Tue, 18 Nov 2025 17:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TnwETzlx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602983A1CEF;
	Tue, 18 Nov 2025 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485553; cv=fail; b=BNPguK1CCsCdmHBexE0YDwvVHmSJxaD2TqmFUolZe8m2WI20nAiHJaaBdFnUT93g/vUjLvLiNG6B4rTLB5XkigVWG5eeGG7SrV+wn0ilMUUJpmkUNtBBQPJantj/hKH5r/IkWVnwwwod1WiIICYVuPiGcrA67hB+XzPs3ix+HX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485553; c=relaxed/simple;
	bh=Ymtu4tnjcX6hsdQO7k9GZxNNjU+6Nksxxq+ymI/3d3k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=leDN3vOfvjonUBY4ff0oKJ6Qs8txWDhuxwIHAS74NLPxip+3f3hdRMV6eY0bTEOuphKfi+xviNZZXydRsfux5Gktj7RfXh4lnWTDVSSQn6KVYDtNnefrAs8effAsn/FqxjZ2DdumC5/3ZQy/Bp7y+H5Os9HR/8sQC1evlruSkf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TnwETzlx; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGsp9C177696;
	Tue, 18 Nov 2025 18:05:16 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013058.outbound.protection.outlook.com [52.101.83.58])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agrub938t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 18:05:16 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGsd+vrXoIWPLpZlvZyayBcj9xmtwt/VbCIA+TrxbEYYckRVg2HIZ+wHgEmVCymJELxSYhN9j4csDoRwQwqhNy+OoG5LRb5O3BLIrVhFUj8qHvjuqVjXOYdnHoE0vjdJVDRKOidmxYUmM6yfrAcJ8a3sbllXdx+TTzmBQNsOtUHrSy1xx4uqhMsaTs1mOyVB6K4vfnT4e1YMsM+jbf5wh1tFtr6J/Vz3T3BQdw3fzI56lCdtSqgPEJoBIA09Wv3QNn1jEtPGKItgQfarNTnnvNe7hwo+GyObsmforzYlokjpn9fYKegH1quq9qlteyOwFTU2fdBpPzHoC96t42FRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIi/l1+pNF50cE6Pi7PqN/SUM8qTn6hWYAWUzvJzj7E=;
 b=DCXBRC5p7teFeV4wwpIjmTvqjoT2W4r1ETV1Zp5rPvplmDoa+nCdSALDd3DN8T5ukRE2tq9xs5E0RBPXHToz+O9y2pH543T4ZqbTnKNJ0xgQpzqGjUie1bbcg3P2Q9JNLUjG7gqUuMILINoIBMV/vG/k9g9r4tdwwswTooliHDNOIIN2+7ukhD9g63o1KGkOoOOQvEzJriHmuKOikOi1jmOZSHKj5i7UPjOqcm5kfPUgsYnda1R1jaGFDeKWJItwWXcj3Rsy3rJSIGvr5QpMr17Ie1QCHSNDhdcfTkJm9BLUL/i7bX0EzbnSifsfMsV/kJAavp2g/XnlkIBCZ66iQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIi/l1+pNF50cE6Pi7PqN/SUM8qTn6hWYAWUzvJzj7E=;
 b=TnwETzlxB7V/3wFWLIRwLSHCvTpelH4s+uwTdBTJEHhjKIVWE5Mo1ZK7sxYyvCTJbJO2WT6SaGlgbI9xaox7uW8D6Fxd979ey5uNKsC/jT4YyZDcb3o3y5pf0k7MhPQO5C6wv/aZdBX83qyNSl2LPn93tNIQJdfSIWgNFWPrQPP5bWDqrHdU6KydIVlV+ysHkuQGcl+0fMWRW3CYLk8eHad1hfgrjALwA9eMK33b/Q/ihSRXG7IPGB9YPkub/3ULHiRc8vatG+6/ibS12Mf2X3j+G2E0aqXF320SZJn+rcqOuUQfWqT25j72C8dYBgjaCOE8y8eawwN0jNrdP4l3Xg==
Received: from AS9PR05CA0358.eurprd05.prod.outlook.com (2603:10a6:20b:490::25)
 by AM9PR10MB4054.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 17:05:15 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::4c) by AS9PR05CA0358.outlook.office365.com
 (2603:10a6:20b:490::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 17:05:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 17:05:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:20:16 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:51 +0100
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
	<p.paillet@foss.st.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>
Subject: [PATCH v2 12/15] arm64: dts: st: add exti1 and exti2 nodes on stm32mp21
Date: Tue, 18 Nov 2025 17:19:33 +0100
Message-ID: <20251118161936.1085477-13-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|AM9PR10MB4054:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c37e74-dc11-490a-76ff-08de26c4a49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0czTFI1bmRuN2hFWnZ5eFg0NDR3MEh4akpjTCtETHZlTEx1b1pzWjRVbERX?=
 =?utf-8?B?akRvckVGZGthbkxPY0dMK293cC9IWWxmT3cxdTJ1WlNNVWtrK0dNZkQ3SXJU?=
 =?utf-8?B?M3NxQVZ5eFF0N1l3NjZISkY4NWw2S2c5MWx1cktMdE90ZjFGN2NJejFXQlFL?=
 =?utf-8?B?aW4xUlVCc0V0M0ZjS3J2YlZzUVNFclR2VWZHQTZzckluMENHNlZUTFJnOCts?=
 =?utf-8?B?ZXRQejk4L1daRU1jQnh0c3hlbWMwWmZMLzUzSE13Q0Nxb2dMWVRSOGlZTGpB?=
 =?utf-8?B?QjZWV3ZDSVhPbC9RM2cvTFlHTG9CRkVyNHQ4WWNLajNUa1MwdTMxdkFzYldM?=
 =?utf-8?B?bXlXVmxKd25oM0NyRVk5WHpoNWc4a2ZNQWVCdlJDL3NVWE5GSVBkU0VWdnZ0?=
 =?utf-8?B?SXNBVWliNVZLRnRWUW9CRy9HQ1crMUFNMm8wMTdPVTBTYlNEWnErczE0ajdp?=
 =?utf-8?B?bmhTcE1HVUpNenpJVTNUMVJhM2tlRGMzNkM4dE5icGVXYWNITlhCRTREK0Vr?=
 =?utf-8?B?YzhsdWc2UmVyNFZtSjE1NGhOdXFvVGh0UjVqMklHazQ3YWRRSFFVcFllRnk4?=
 =?utf-8?B?K3NJaTVtTG1OalRGaXgyUUZndm41NDMySXlsRjlzaVo0LzJCdFNxcm04amg0?=
 =?utf-8?B?NkRXSG05Zkdzd1RJaTJVZlExaTUrWTJ2VWVxZGdRdXZIVU9adWpXZ3dqdCto?=
 =?utf-8?B?Q1dqUndlNHc2VzBYa0R3T3p1MVFpelhKQXl2dEJFbGt5ZHFkRDRkbTd2OEF6?=
 =?utf-8?B?NWdmQmFSbmlveVE0eDJ2NkZBcm9TSDZnTXJsVWIvTHlLWjZVeDZwb0dDZUJC?=
 =?utf-8?B?ZTlyaExsNEl4TVhDVERVSXEyaGd2RzVYM1pJbkc2SlM0R1MwWDlWcVJUbkRE?=
 =?utf-8?B?ZUo5c005bTBuQ1picEFSdzV4SzFzZ1hxNHE0OTJMWFBCM0pFb0dnbXFDd1pV?=
 =?utf-8?B?STA5Q2NtQ1JPRGxwaFNsMVhjNG04T0xvSHRrV1BqM2xrb2R1RFViZVhnZzdD?=
 =?utf-8?B?UHVsdUdYM0x0amVRT0VPK1QwNmZaMWhkanExdUhLeTdPNXNVaWlOWFYrUm9h?=
 =?utf-8?B?YTRRSk5Pem9KbHhMMTVDc1FsMzA3NHhqNTBOR2E3R09aZVRockZrL1ZIL3Ix?=
 =?utf-8?B?a1ZKWUxtSUlKNnBzWVZoY1U4YndLSUVlYTZacnVXOC9CbTRWaGYwY0lxd1dq?=
 =?utf-8?B?VjV0bUlsQWV0c3NuOTlxRTBWQlJndnVjUTZoeFprNVh4WUttcDRuQkttRTFQ?=
 =?utf-8?B?VWFOQW1oTnlTOHJuTkN3WlhyUWJ3TWxGOEJGTDdaR3VIT0FKUDN1Vk5YTHZq?=
 =?utf-8?B?cnBNVTdwcGp5Y0toQlNNektNOVFHZFdrdjJNVlRLcGNtejRLcFllclhHM0Nw?=
 =?utf-8?B?bnEzc09ZWGs5UlNOTDQ0aTBTSG92Vk9DMVhSN1lsY1k5L0JlQ1B3MnN2bDZx?=
 =?utf-8?B?dHk1VkppVGJTQjJ0N01uVFFTOFZ3K1VkMmdLa1ZXaEswRHR2ZXU1MDEzanhw?=
 =?utf-8?B?a2w0bmhHb2tGY2dmWWg0VnJVV2oweURSenYweEZqazVhOFlrMWhEbjAzZmlj?=
 =?utf-8?B?dFNISllDNzFlQ2hERjdQSjZGem8yUjg5WUZjUzlFSDV1dmlBZldMVkNiY2hw?=
 =?utf-8?B?RmozYkRLWHVFeFFJT0xpRS9RVHNjVTQ3U3U4S3ZUdEZzNXdnK29NWW9KamJV?=
 =?utf-8?B?Zk9MVFp0cFgxVDkwbEsrOVh6M0FhRHh0eWhnRnloRkVTdmNBZSsvS0g2cWJw?=
 =?utf-8?B?dnRsUzBoQzRaMXBRMGY5emxLUzFFQllxbXpQV3JQN1FZVXZBY01aWERnVXhy?=
 =?utf-8?B?aVE5R0VrR2x5UEtvZ2sxVnd4WFpMbzdRcThoZm9sQ1JTelBTUXNta1hBd002?=
 =?utf-8?B?d3dOYXV0ampuRVpuVXFKeW1Lby9GSCtrV29HeFBJaVBwNXdpMG1OTkdRNlBj?=
 =?utf-8?B?VU85bW9YYzNXakhTNEFNalJ6cU1nVWdJM2RNS0E4MWdWeENtWnErQ2x4czVp?=
 =?utf-8?B?ZVBWQUQ4emxNc1FoVm96bXI3MnZBaGgza2JxdXIxd2ZFZUg3NitlVzdpM1Q1?=
 =?utf-8?B?Z3Bkc2hpYjFKb09ZOC9jTDQ3MmkzUkpDNnNzOXo2SXBQWUVkL0pHY1AreDdT?=
 =?utf-8?Q?/n4+ZUetjLkE+np319t9GPE+i?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:05:14.9720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c37e74-dc11-490a-76ff-08de26c4a49e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4054
X-Authority-Analysis: v=2.4 cv=LKBrgZW9 c=1 sm=1 tr=0 ts=691ca74c cx=c_pps
 a=xFT3qlHD+1xS+TaMy1FbcQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=ypDJklmpTWrOYmW8PNMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: n0gY9CBKmhF42FXNjnWxYawIcVxUVTjX
X-Proofpoint-GUID: n0gY9CBKmhF42FXNjnWxYawIcVxUVTjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzOCBTYWx0ZWRfXw34SUBxyrVa1
 PFJeQoBWEKw/WYrsK1/2sjmY/FqinscwFs8pciXeqiItZagVylNlQ9M2gvL/mW/DduRyApS/9VK
 sv59OCr20T5I3erDfwG47VfvYbCeSeoBl2JRfMCPjQfppquxxRHUUj0L+fyxzBuQVrFGb9bamHY
 IYUYcYY7/JNJ40b5x6yUNop/VB8kUGH4VGqXIoodwRHJ1MtOFwVneM76jN9cQTNWKqSBsDY9DP6
 iJeMs/tOCqdO6/W4Q5MlOapfUUl4ReBe/ShJ3N1yAKeQH1breaXeqfIR+kAkvFA/W3UHYOrrZSV
 CLLzgw6HIZUFPDFkAmV3i9ShX0JbLgjuKhj5VF0MJt5KpjicBGvPAnIC2NW0deeikzB+Arlk7go
 t6f15vTFAyHHsU+3EMMfceJdqlHbTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180138

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Update the device-tree stm32mp211.dtsi to add the nodes for exti1
and exti2 interrupt controllers.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 150 +++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 1f234c987dbca..4bdf4b3a39829 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -112,11 +112,161 @@ usart2: serial@400e0000 {
 			};
 		};
 
+		exti1: interrupt-controller@44220000 {
+			compatible = "st,stm32mp1-exti", "syscon";
+			reg = <0x44220000 0x0 0x400>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts-extended =
+				<&intc GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,	/* EXTI_0 */
+				<&intc GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,	/* EXTI_10 */
+				<&intc GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 0   IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 1   IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,						/* EXTI_20 */
+				<&intc GIC_SPI 95  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 97  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,	/* EXTI_30 */
+				<&intc GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 99  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,	/* EXTI_40 */
+				<&intc GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<&intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,						/* EXTI_50 */
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,						/* EXTI_60 */
+				<&intc GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 9   IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<&intc GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,	/* EXTI_70 */
+				<0>,
+				<&intc GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 96  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 98  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp21-syscfg", "syscon";
 			reg = <0x44230000 0x0 0x10000>;
 		};
 
+		exti2: interrupt-controller@442d0000 {
+			compatible = "st,stm32mp1-exti", "syscon";
+			reg = <0x442d0000 0x0 0x400>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts-extended =
+				<&intc GIC_SPI 15  IRQ_TYPE_LEVEL_HIGH>,	/* EXTI_0 */
+				<&intc GIC_SPI 16  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 17  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 18  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 19  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 20  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 21  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 22  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 23  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 24  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 25  IRQ_TYPE_LEVEL_HIGH>,	/* EXTI_10 */
+				<&intc GIC_SPI 26  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 27  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 28  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 29  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 30  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 10  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 11  IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,
+				<0>,						/* EXTI_20 */
+				<&intc GIC_SPI 12  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 13  IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,	/* EXTI_30 */
+				<&intc GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 5   IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 4   IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 6   IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<&intc GIC_SPI 2   IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 3   IRQ_TYPE_LEVEL_HIGH>,	/* EXTI_40 */
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,						/* EXTI_50 */
+				<&intc GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		intc: interrupt-controller@4ac10000 {
 			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x0 0x1000>,
-- 
2.34.1


