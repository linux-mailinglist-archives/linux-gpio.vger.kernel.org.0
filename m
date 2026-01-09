Return-Path: <linux-gpio+bounces-30338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE70D08CA7
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 12:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0062C30053D1
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3587133B6D3;
	Fri,  9 Jan 2026 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Yh1S36AK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F323833ADAB;
	Fri,  9 Jan 2026 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956363; cv=fail; b=EzpkFugQt1ZVepnRXJgWEiv26rxjjbaP/e+metsMPgfaaM4pYkMs6aBA3z9LUtmKYd9a1bnhSkNIbnjTYa8rJUO7/8dtnC421DcqAI3xWnXm3BGyvc6upJG/ipTn7h7G1oVKb1dprkmYo4u2EqfedIb8iB7bejgWraJoPJ2O8bA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956363; c=relaxed/simple;
	bh=3UX3g5ikLgSvn9iKXJurueWktUpR4s237gynxnhQTAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pL4CX71II6ZFYkO4YTd/Rs2w4TlzcZwMC1H2FZMiv+pfCdPfCPMdRk0ilB0pbMW0QOMozEqYF3Na84Wk6lGGlShVsjbBruySgvH/LMDI5Iu06WK+LhFtAw22CPug4YA1zScDQiOGGGTb11/8XE76MegS4EVtofgcLiro39bnMYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Yh1S36AK; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609AoV9B455833;
	Fri, 9 Jan 2026 11:57:02 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjkxmt4h8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:57:01 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AP4D08qKczrV0yaJ6UMph0falDDe54vsbLOLY994iJ1VIrsIiiNzGgCYe6tnDW0qpEpY9Ba9SpkUZH3s06vFt5RkC0wL8hdNdA+bbH1gxKW8H3wtNSY9dD9UL9Wwumgt/8lnkQ8U9L0V4iUBQL7Uc6oUvtX7aDdJLnjhHGeL+cvApeXOXqzDiOOUAYa8B2NSibckHBieGSZUOFbE08N+8N19rbpN4+mM/IJ82doHf4Ztyr08zHYxYvprXfOpjFMJBpeUVNDQHnkrqlAeFm1Rb3VByljsl3IGC/mh4wyCzGVH1JQzxwnzv4xajiWWkZHksuYBYUiPI7/zvMqpn3qtXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPMDfOopHDYYsgVHr3lA01xSO6tov7iYp2Jhz4+My7w=;
 b=gIJtIY+aFaf4o9K8sftpTrL+qAZ5topaToXKd7SH79Mulxw2qrkq6FZLn36ay2MdNp9syZT9/xSqpMjBLTfuCk5wOX5pnZ/4z/OSGuxs2dHj8C6kOLOuA+U3Rm18lT71FAhs0kpPWYd3UymTqGgTZ3G5th54PJVbaAmnDjVOin9OThPsMhPCyEMo+Zr3q+ZlpvhX/mTCkkeu7Wx9YUDkotpl3l/4VF1m1UsWRFlw3VIdjVTUyh5H+9YBqXKO30zy7Zj4u29kvdgGYOkK3QCXLUXfIG9JeDgx6t2kH+i2Cem66gthPvz5Py/jqpZ10+ZTHja3pS2OMv6aveWFMv749Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPMDfOopHDYYsgVHr3lA01xSO6tov7iYp2Jhz4+My7w=;
 b=Yh1S36AKITdBKU3UeVi7vZ8DhuT2q0qTEQAjwaCDfdEt25RiGpZmupq/8G/WnkkfGS//PcPuqUmLa2CdzCGabkgxmCPmRQEUmZRpe2YdLGmiiUXE2zakZS7Oq3JFNlU/rsmdu06k+4g8XE2OKCjTYtMjQFmMtPmwnkOx3p2G4vkCwr6HHbJmrOx+lLPbTeLpov0TXDEjtLfyhSLcyFXUkQZSn3T5FMNEuZyWJ5gBohI5KyLVlZUHqnPuEVRwmcWDCA1Q74bhVqV+AVqHbTK6c0zglOu0+rIySZ/wFFn3Ctp+T4ct+6XrbS07Km9252xBX7E0AdGMF2Y76q/1mLYxTw==
Received: from DU2PR04CA0209.eurprd04.prod.outlook.com (2603:10a6:10:28d::34)
 by PA2PR10MB8578.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:41b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 10:56:57 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::48) by DU2PR04CA0209.outlook.office365.com
 (2603:10a6:10:28d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 10:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:56:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:58:12 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:56:55 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 9 Jan 2026 11:55:06 +0100
Subject: [PATCH 06/11] arm: dts: stm32: introduce the debug bus for
 stm32mp1x platforms
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-debug_bus-v1-6-8f2142b5a738@foss.st.com>
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
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Antonio Borneo
	<antonio.borneo@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E1:EE_|PA2PR10MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: f38abc2b-c045-4583-06e5-08de4f6dce9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFpVOUpiYXJQWjF4UzJYRURxMk45Z2h3QityYVFiWjc0UzhkUXVvaWZZYmVV?=
 =?utf-8?B?T2E1ZGNrQmVqcU85MkZHTjNUaDdhbzUyRGFOcjNndHFHdUVSVmFzSmFhQWhR?=
 =?utf-8?B?ZlRqb1M0cS9vcVFHYkR0bmtnL2RaTHlQKzhCd251VEg2Sk5OT0VPSFgxQzhG?=
 =?utf-8?B?YjJaTEpMWUxRc0dGNnF4c1g5azRPNDVtbExhU01OaTRSc1djT2hWNFlvTnZ0?=
 =?utf-8?B?RnhDbkFLeFlZc3RWbHJUaFFlakpZaWoyYWJhVnZqTHpsMy9GR2xvNnAzVEFY?=
 =?utf-8?B?Sll3UDR0b0FhYzFnTkx3MC9CRFVBdHo5SGpXWXIyMUp6c2o5Q1J1M1c0b0pv?=
 =?utf-8?B?SDlPZGU1RjBLOGMxd2dKS2RZeVpQWktWckV3eVR2QTk2VGdsV1Z5T01RVklQ?=
 =?utf-8?B?NVA2NHovdjd0NnNzNW5xL3hJTGMrTThJazBOTTRKVThlVlZzeGlmNXpsV051?=
 =?utf-8?B?cTY0bzdWSlljMTdIUUovbG5zUE1wOUh2UVJhVDRxOVc0OGtDaGxmZW1zQ2JB?=
 =?utf-8?B?TzUrbFMvWi96UTFKSXlXd01rN0NKcHpOaFpiMkhKZDhWVWlsVGthTnFtanpE?=
 =?utf-8?B?QW4vaEl1MktUb0hnTmxPdXRMcjQ0czZLcXQxVHNScTlkeU8rcnB2cWtnL2Z2?=
 =?utf-8?B?alk0bUkxRElkUTJpYldHNGpSLzI2dWJkekxvTlZVQVFjbytRN2hLSnR6UlRl?=
 =?utf-8?B?NG82VkxWb3MyWXRFd1AvTVRhU1RYelFzM3Q1YkFySlpwamFiaXJKMmRGcStQ?=
 =?utf-8?B?M0NCSDlscithT0xtS2hwVnVpaUpyMHF5cndHdlJjcFczek9rNmdBaElqK2dq?=
 =?utf-8?B?bXI5K0wzVVlSTkVlcUpkam5LMHVkMnB1bFEzRGdpNS80V1dvMmdYbzJmaUpR?=
 =?utf-8?B?Y3piUWM4Wm41eUIwQk5qNXE1Tld4K3dHRzAvbWdyZmlWNjFGckxVazRzKzdF?=
 =?utf-8?B?L05nM2JGQitFVy9xTmRDVkt4cms2Qk90ZjhCL09aY1dhVGRiR1RDYk1yQ0FH?=
 =?utf-8?B?QTE3RC9ZQ29idWJWUFVhUGpyRHBxaFJUYkIwMXVsUXFudmIrM2xKcExVUWFj?=
 =?utf-8?B?VVZNSzBGRnlGNk91NlQwMWtCV0E0ci9Ld2FHbmFpRkY0enNIaW8vVExLVUFu?=
 =?utf-8?B?VHlXVVFhYmZqVmwwR0UvK0c1czNta2RnZHZpd0tDSzdjeW91dks1RE9aNFo0?=
 =?utf-8?B?MUxTc0ZwSnYrV0x4azVWNkkwYjhoRnYwcDVTbU5VSFNoc1VlNjd6K01kbWQr?=
 =?utf-8?B?b1ZSVitzZXpIRDNSZTBVSnZ4Z25FeTdEbndCT3M3RytQVGJKTjdjZFVreTVT?=
 =?utf-8?B?bEVJQTl4MEhWRmpQNndCN2ZhdmJZWGdjSUIrTXI5Z29SYVRTTWNZL3N4SVRr?=
 =?utf-8?B?L1RuRWN3VmFDSlg4Uk5ZSUtjYUsrZEZERUM3MkdlSndrcm4vcGpWL3BLRTVv?=
 =?utf-8?B?R2E2UlhvNjJVamowNkd4eFZOK3M1bzJQRG1lSGpUU1diMldITWhHWi83bU00?=
 =?utf-8?B?WXdCbGNaWTdNNFFvdE9OU3ZxUCtzMWNVditCeVhXS2ZlN0FtdUdwcEEwVSs3?=
 =?utf-8?B?b1VQV2szSnFIT0tSWHd3WXZjdERhVHRTZUx6VTRNbndHWHEzNUNDcXN4Q3NU?=
 =?utf-8?B?V1RrVzR5elI4RW8rTWd5S00rQW1HbnFzOXpWeVU2VXhwLyt3dGdmTjhoaVhs?=
 =?utf-8?B?U1B3YmJiQWNBNW5SdHRtdTRyV3ZwUzJDNWZMeC9OSEhaMWxkbnIyQ2x2RVlo?=
 =?utf-8?B?VklQUkF6RzczcytnclR6N0pKWXdjZ0dPaDRqL0w4ZytMSnB6bDlzSUZSUUdq?=
 =?utf-8?B?eEJkZExidmFHQVdVRExvVVVpTHdreGpvNEdtb3kvcFBteVN3MzdYMVY0MWdB?=
 =?utf-8?B?dktMd1JFZCtXNEhxS1JNSElxN2grV3gwcnpsTjhwWUlzQlhhYjlQL3hFaWVm?=
 =?utf-8?B?K0tEeFpCL0M4NlBEN29LZFhuMEFUS2NoOFhjZ3N6NDVkWHZUUzB1K2dsWlds?=
 =?utf-8?B?Y1JTUUZRdStFM05XY0tzL1duT090TlpKQllOZjFrYU1Zd2tLVDl3cjNzQit4?=
 =?utf-8?B?R1JBSTBkQXh6L00rU25uc0tDSVRuVGtLc1hFSmFiK0JTNDZQdmdIVEtMQnk1?=
 =?utf-8?Q?Y6Nq48pBpWT4d78FzW4pfY/K3?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:56:56.8205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f38abc2b-c045-4583-06e5-08de4f6dce9e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8578
X-Proofpoint-GUID: pws8IPg-OeZy6oH1-B5FMN5Hb-3R09-U
X-Authority-Analysis: v=2.4 cv=O9s0fR9W c=1 sm=1 tr=0 ts=6960defd cx=c_pps
 a=SAiMG8OwZveQWcn0e0GJXg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=-E33GuBO8opgirhHEr4A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3OSBTYWx0ZWRfX9JmaN3VyVARE
 LpsMBXBTzvcL6q3Umn2+GHGiE1QaXOth2t1zrUcYB9N2v7MdPnwRJEhkdebpZJicSf+9WN5Gp6R
 WZpzUnsmJG/Wx1dv+29RMkj8NEnBGDPdXTis5lSKJWEhcbs5tMdPmKZk/N2WJAoji0qoIAd+DeJ
 l2+VfKD66rbNf5ZSzBJ2JDNvhXjzXuZ5onEgDPqLLJNV145RPbxcXmpFHyg5i4PoPsZt1M8vclv
 zKrMmMNKpFfpe4HLAXrikAnQdXRZKuW4I8F7yinbXJw8fVNjAtANqu6TiP/5ugvpcjOyBsGgK7d
 wusMcsNevgeUhyRus2x1BsY7Qx+EXgm91qGNxomFBfER276T1yq/VVknh1WltTuBdpLGRYzo9vx
 SAM1ztN9BHbvrTAenET61tpF8ZYgPQp2cjM6Vu2NPL6RGjYvc4mmu2YLrZO1KTtpjXDMURk9WF4
 pjdBmDNBSke2TpN5Q4g==
X-Proofpoint-ORIG-GUID: pws8IPg-OeZy6oH1-B5FMN5Hb-3R09-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090079

Some peripherals cannot be probed if a debug configuration is not set
in the BSEC.
Introduce a debug bus that will check the debug subsystem accessibility
before probing these peripheral drivers.

Add Coresight peripheral nodes under this bus and add the appropriate
access-controllers property to the HDP node.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 119 ++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi | 173 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp153.dtsi |  68 ++++++++++++++
 3 files changed, 360 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index b9657ff91c23..d394061b85ac 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
+#include <dt-bindings/arm/coresight-cti-dt.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/stm32mp13-clks.h>
 #include <dt-bindings/reset/stm32mp13-resets.h>
@@ -964,9 +965,127 @@ hdp: pinctrl@5002a000 {
 			compatible = "st,stm32mp131-hdp";
 			reg = <0x5002a000 0x400>;
 			clocks = <&rcc HDP>;
+			access-controllers = <&dbg_bus 1>;
 			status = "disabled";
 		};
 
+		dbg_bus: bus@50080000 {
+			compatible = "st,stm32mp131-dbg-bus";
+			reg = <0x50080000 0x3f80000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&rcc CK_DBG>;
+			#access-controller-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			cs_etf: etf@50092000 {
+				compatible = "arm,coresight-tmc", "arm,primecell";
+				reg = <0x50092000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						etf_in_port: endpoint {
+							remote-endpoint = <&etm0_out_port>;
+						};
+					};
+				};
+
+				out-ports {
+					port {
+						etf_out_port: endpoint {
+							remote-endpoint = <&tpiu_in_port>;
+						};
+					};
+				};
+			};
+
+			cs_tpiu: tpiu@50093000 {
+				compatible = "arm,coresight-tpiu", "arm,primecell";
+				reg = <0x50093000 0x1000>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						tpiu_in_port: endpoint {
+							remote-endpoint = <&etf_out_port>;
+						};
+					};
+				};
+			};
+
+			cs_cti_trace: cti@50094000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x50094000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+			};
+
+			cs_cti_cpu0: cti@500d8000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x500d8000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				trig-conns@0 {
+					reg = <0>;
+					arm,trig-in-sigs = <0 4 5>;
+					arm,trig-in-types = <PE_DBGTRIGGER
+							     GEN_IO
+							     GEN_IO>;
+					arm,trig-out-sigs = <0 7>;
+					arm,trig-out-types = <PE_EDBGREQ
+							      PE_DBGRESTART>;
+					cpu = <&cpu0>;
+				};
+
+				trig-conns@2 {
+					reg = <2>;
+					arm,trig-in-sigs = <2 3 6>;
+					arm,trig-in-types = <ETM_EXTOUT
+							     ETM_EXTOUT
+							     ETM_EXTOUT>;
+					arm,trig-out-sigs = <1 2 3 4>;
+					arm,trig-out-types = <ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN>;
+					arm,cs-dev-assoc = <&cs_etm0>;
+				};
+			};
+
+			cs_etm0: etm@500dc000 {
+				compatible = "arm,coresight-etm3x", "arm,primecell";
+				reg = <0x500dc000 0x1000>;
+				cpu = <&cpu0>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				out-ports {
+					port {
+						etm0_out_port: endpoint {
+							remote-endpoint = <&etf_in_port>;
+						};
+					};
+				};
+			};
+		};
+
 		mdma: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;
diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index b1b568dfd126..a6371d626a2e 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
  * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
  */
+#include <dt-bindings/arm/coresight-cti-dt.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/stm32mp1-clks.h>
 #include <dt-bindings/reset/stm32mp1-resets.h>
@@ -274,9 +275,181 @@ hdp: pinctrl@5002a000 {
 			compatible = "st,stm32mp151-hdp";
 			reg = <0x5002a000 0x400>;
 			clocks = <&rcc HDP>;
+			access-controllers = <&dbg_bus 1>;
 			status = "disabled";
 		};
 
+		dbg_bus: bus@50080000 {
+			compatible = "st,stm32mp151-dbg-bus";
+			reg = <0x50080000 0x3f80000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&rcc CK_DBG>;
+			#access-controller-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			cs_funnel: funnel@50091000 {
+				compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+				reg = <0x50091000 0x1000>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						funnel_in_port0: endpoint {
+							remote-endpoint = <&stm_out_port>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						funnel_in_port1: endpoint {
+							remote-endpoint = <&etm0_out>;
+						};
+					};
+				};
+
+				out-ports {
+					port {
+						funnel_out_port: endpoint {
+							remote-endpoint = <&etf_in_port>;
+						};
+					};
+				};
+			};
+
+			cs_etf: etf@50092000 {
+				compatible = "arm,coresight-tmc", "arm,primecell";
+				reg = <0x50092000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						etf_in_port: endpoint {
+							remote-endpoint = <&funnel_out_port>;
+						};
+					};
+				};
+
+				out-ports {
+					port {
+						etf_out_port: endpoint {
+							remote-endpoint = <&tpiu_in_port>;
+						};
+					};
+				};
+			};
+
+			cs_tpiu: tpiu@50093000 {
+				compatible = "arm,coresight-tpiu", "arm,primecell";
+				reg = <0x50093000 0x1000>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						tpiu_in_port: endpoint {
+							remote-endpoint = <&etf_out_port>;
+						};
+					};
+				};
+			};
+
+			cs_cti_trace: cti@50094000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x50094000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+			};
+
+			cs_stm: stm@500a0000 {
+				compatible = "arm,coresight-stm", "arm,primecell";
+				reg = <0x500a0000 0x00001000>,
+				<0x90000000 0x01000000>;
+				reg-names = "stm-base", "stm-stimulus-base";
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				out-ports {
+					port {
+						stm_out_port: endpoint {
+							remote-endpoint = <&funnel_in_port0>;
+						};
+					};
+				};
+			};
+
+			cs_cti_cpu0: cti@500d8000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x500d8000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				trig-conns@0 {
+					reg = <0>;
+					arm,trig-in-sigs = <0 4 5>;
+					arm,trig-in-types = <PE_DBGTRIGGER
+							     GEN_IO
+							     GEN_IO>;
+					arm,trig-out-sigs = <0 7>;
+					arm,trig-out-types = <PE_EDBGREQ
+							      PE_DBGRESTART>;
+					cpu = <&cpu0>;
+				};
+
+				trig-conns@2 {
+					reg = <2>;
+					arm,trig-in-sigs = <2 3 6>;
+					arm,trig-in-types = <ETM_EXTOUT
+							     ETM_EXTOUT
+							     ETM_EXTOUT>;
+					arm,trig-out-sigs = <1 2 3 4>;
+					arm,trig-out-types = <ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN>;
+					arm,cs-dev-assoc = <&cs_etm0>;
+				};
+			};
+
+			cs_etm0: etm@500dc000 {
+				compatible = "arm,coresight-etm3x", "arm,primecell";
+				reg = <0x500dc000 0x1000>;
+				cpu = <&cpu0>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				out-ports {
+					port {
+						etm0_out: endpoint {
+							remote-endpoint = <&funnel_in_port1>;
+						};
+					};
+				};
+			};
+		};
+
 		mdma1: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;
diff --git a/arch/arm/boot/dts/st/stm32mp153.dtsi b/arch/arm/boot/dts/st/stm32mp153.dtsi
index 92794b942ab2..17d52d93695e 100644
--- a/arch/arm/boot/dts/st/stm32mp153.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp153.dtsi
@@ -30,6 +30,74 @@ timer {
 	};
 };
 
+&cs_funnel {
+	in-ports {
+		port@2 {
+			reg = <2>;
+			funnel_in_port2: endpoint {
+				remote-endpoint = <&etm1_out>;
+			};
+		};
+	};
+};
+
+&dbg_bus {
+	cs_cti_cpu1: cti@500d9000 {
+		compatible = "arm,coresight-cti", "arm,primecell";
+		reg = <0x500d9000 0x1000>;
+		clocks = <&rcc CK_DBG>;
+		clock-names = "apb_pclk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		access-controllers = <&dbg_bus 0>;
+		status = "disabled";
+
+		trig-conns@0 {
+			reg = <0>;
+			arm,trig-in-sigs = <0 4 5>;
+			arm,trig-in-types = <PE_DBGTRIGGER
+					     GEN_IO
+					     GEN_IO>;
+			arm,trig-out-sigs = <0 7>;
+			arm,trig-out-types = <PE_EDBGREQ
+					      PE_DBGRESTART>;
+			cpu = <&cpu1>;
+		};
+
+		trig-conns@2 {
+			reg = <2>;
+			arm,trig-in-sigs = <2 3 6>;
+			arm,trig-in-types = <ETM_EXTOUT
+					     ETM_EXTOUT
+					     ETM_EXTOUT>;
+			arm,trig-out-sigs = <1 2 3 4>;
+			arm,trig-out-types = <ETM_EXTIN
+					      ETM_EXTIN
+					      ETM_EXTIN
+					      ETM_EXTIN>;
+			arm,cs-dev-assoc = <&cs_etm1>;
+		};
+	};
+
+	cs_etm1: etm@500dd000 {
+		compatible = "arm,coresight-etm3x", "arm,primecell";
+		reg = <0x500dd000 0x1000>;
+		cpu = <&cpu1>;
+		clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+		clock-names = "apb_pclk", "atclk";
+		access-controllers = <&dbg_bus 0>;
+		status = "disabled";
+
+		out-ports {
+			port {
+				etm1_out: endpoint {
+					remote-endpoint = <&funnel_in_port2>;
+				};
+			};
+		};
+	};
+};
+
 &etzpc {
 	m_can1: can@4400e000 {
 		compatible = "bosch,m_can";

-- 
2.43.0


