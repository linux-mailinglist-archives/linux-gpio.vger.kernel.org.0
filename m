Return-Path: <linux-gpio+bounces-31005-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNkFH8FQc2kDuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31005-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:43:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7C1747A3
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F53B3016D1B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C16C374738;
	Fri, 23 Jan 2026 10:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="aPsWXaRe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE3C362141;
	Fri, 23 Jan 2026 10:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164936; cv=fail; b=tjtMpda1gH56oG6mqZ6hQVPgcuOoFUMytsINLZkQ9p4Rodz3hEW/dunhYiKd4hQpE13nWu2qQMVoiEqw/oZsJPu5clKKddJhbcfNJ36FSbb1R4Cf63VFyZXz4+jmm5hBGF8lEHCaKzuHUjT5etB45b93yYBAdNYXTAIWUgyfCjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164936; c=relaxed/simple;
	bh=ioy0+3FF7QhFQeInyzlQQC0YpF84Z2hqHUsncFcgBUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=koMbJ+HoIlSCDtfNj/amnYRopWhViTW28bNpY0bO+tJtr6DA72QOo99UQJBp2D2yS8BzExATWQFfFHGSGTp/1InXmBfj9GnTC7iiC3xlbDTEmCgy+B6WThI/eioWae/FHWPSPBBmOAzJaMosKqilIc1OAyPYccw8n8RGHd0WagE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=aPsWXaRe; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAXUuO2700580;
	Fri, 23 Jan 2026 11:42:02 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bv3yp10te-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:42:01 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAcMo4+hHUkCaTJln5pE0gbSu/8cFzpmmpaPgxwM/E+o0AhHNYPYy4UxtF39AqNOA9gECYTHjG9h+bWofpB8vAsHASF42fb9kuO+0uvfRfu2tUJGyT7sPVa002cV3/aWPQxHb4UDRzWRZPBiiZ6zWJJDB6YIG0OA0UO/+NlBP6VOi1d88RoDpOe0e/Q9xkv7ANm5rXjgBPvfs79kjJrl8eWBpyQHlkzT7hqyrnCNl03NTbk9b/AgNxL17psjeZWtHoAjAs0cRC/BTY4WF56CpN5drVoqRGtNJj2mI6ERV399g+WYSr4KQ//qBxp0EdMG35/xuGLbPLKJfBINRcpwug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFR9s3knidTh7f75ywsXqW9oZcytAjSEBTQf3YUrRKY=;
 b=GafoV3QRndRdWIASVyCb8fQJ/Ihn5xAOsTbgOe4cspl1yD9RBGAs0DzCUwJWkamVj6m8QoNNDfnsDKRuSahU0hO6p+IgjbFL8v+sIlb2kREjF3r7RFC7bmrGRXYiOD54r/lCpl/0HJo0c4kPNQLfbfPWZVGLD5IFR2tqx6OOIhUVVudc7rLrV8+2xFS4oDsb9/HodZ/IhWggBhJl5FVBWntaf7U9oheuSdPt5xTX6sGiedwVUuMeYR/TOMrUyFXFTIdVsJzjEe6hESrN/4kY3gfTKY+5z3uxLK3O486RS79Bw9ooZPtcwUzx/LOD84RrVG5xZDy0x0SbMA+Y1X12pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFR9s3knidTh7f75ywsXqW9oZcytAjSEBTQf3YUrRKY=;
 b=aPsWXaReNtPR12sywbwcCUwmlgMqtj6c/aZVETyiWYifmq5gfo/+QO6u54dDRG5jyXDyiarLl6CP8xqQJDM0Wr1IjhcClAd9pGTQDFbCfteLqR4ery0lBmZcM7TtFY15DNwauoQiidRhlwtU27i5Uqp9PYiHNUPZBVsxsmjtHBeW3yFpvhwk4CapW1GNH0+QvtjIhIokewYBIj510MRCFdS+LIjs5PD5VeazKgPQvujJx+xBbR7evib6x6dXsM3KlarG9ww29A++MasgM8DzA7PAHO9ZEq3WytLl7cNI009t5ehpxMAqFZh3G4YoCXWQ9Pp/HspJyrP4YPuhmpFKkQ==
Received: from DU7P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::28)
 by AS8PR10MB6970.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:57e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:42:00 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::93) by DU7P194CA0024.outlook.office365.com
 (2603:10a6:10:553::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:41:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:41:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:43:26 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:41:54 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 Jan 2026 11:39:09 +0100
Subject: [PATCH v5 12/12] pinctrl: stm32: add firewall checks before
 probing the HDP driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260123-debug_bus-v5-12-90b670844241@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8F:EE_|AS8PR10MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: a34c05eb-b494-4efe-d778-08de5a6c0967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnFYWUtQUExSdnZpUUhnMVlBQk9ldGl3emlqRXllYnV6SjFTRTlRUWtWWDI2?=
 =?utf-8?B?bUNLRmVZWUxMR0J1WmhvbnNZUVk1MnhSYjRhRHlxTk54d2IwcFRzcUJrZmtj?=
 =?utf-8?B?MUZIczlLRi9ucnVsQkxxbHhTdkY4MVF3L1Y1VVBnY2pNK0xTTUsxZlRvYk5W?=
 =?utf-8?B?RHQ0YVlUYndnaDFVY0htQVZ5SDFldGRTeDk1MVhkMS9LYkcxcm14a3JHQS9h?=
 =?utf-8?B?MXVwL25FUmpIaVA4M05FUW10UVJaUnE2cmZNbDFyQVN3cUY5eCtCR1IyMTZF?=
 =?utf-8?B?SXdyTGlLclcwYXdMYTFlRU5ScFZWYjBVMnpLQVQ2WWRRTmVCZHMwK3dYYlR4?=
 =?utf-8?B?akZxU1ZvQytTRzlYL0hnWGJGemV4bTF0cHNTdjhtWGdkLzh1Y1d2T0EzdTlN?=
 =?utf-8?B?TkxhVThmeWYxZ1pSOGtTNVpqcWdrOGFuQk91Q0JuM2FUVUIzZlhQV0R6b1c3?=
 =?utf-8?B?NVZKdlJTQ0JJODE0dFFoanlKVEdNNDlIM2ZJSTR4aG1ZQ0ZxODJ2TDNVMG9X?=
 =?utf-8?B?TnBhejkzNzVycDYvWWc4SnFGWHdSRlpXNnEvK1pETXRJbzV5ekwzRWFYcGJu?=
 =?utf-8?B?WDN6V3B0L0pYT3JtZUN4NHZjeW1UZmJZV2pwd09YZGhWYk5NUkdYNStyUk9k?=
 =?utf-8?B?ZXE4VHVUUlpXdVlqc0Q1ZWkxdmxaU1JPSXBGdm5RcUZ5MEYwYlVKd25udVIv?=
 =?utf-8?B?M3VNSlBDUUhkd1pGcUdobjZZOUtqK0hIWDh2eEo3UmJ3YlBtZGhJZDdTVmNu?=
 =?utf-8?B?clAzRUh2dFdEU2g5bFJiVGRKSWIzS2RtakdSQXdrdFVveXlHbndFQnZjL3hk?=
 =?utf-8?B?TTFIZFRaQUhkVVBCLytUajh5aHVneWVGWDgwYlQ2TzZVN3lWb2k4TTVCYTVm?=
 =?utf-8?B?ZFg1RnY3SWhsamN2Y2lZU2J4ZEVZd3Y2THNsdWtyQzlNUGJRQ3lFcFc2Y1M1?=
 =?utf-8?B?R1E3K1lLM3dkeHV5ZUNvWmhFQ01wZHpqempaRHZ2Q0NYblprc0tXcXNsRFZ6?=
 =?utf-8?B?aUtMdERvRlBFdTh4aG8wV0FSQjEwbTUzY05PV2QrRy9yM3lJZlpHTis5TlRI?=
 =?utf-8?B?NTRTaWRDVVVyUVhJdFlNNGVTaXpoK0piL096QUFBVU1qL0dMMXVGVUFXVXFK?=
 =?utf-8?B?Mnk1ZDRRekJSTG10TXRjbmVla2FYTlRuRVlkeHhONkZrdFJRZzNiZ2pyUm1a?=
 =?utf-8?B?bExIT2JodndsR2dlUy9kSndUNVBZY1dOREQvZTk3KzgvbDhndEw3OVF3cVZq?=
 =?utf-8?B?NHNyWVpVWVFzMTZZdG1PV1BKUWwwNkIrRzF3U2xDYzFmL2tnWVVQbHlzemhX?=
 =?utf-8?B?cmdLdzlvVy9DcklkZ0Y3R2ltVldza2xHTHlWbjB3YW8yWGdwV1dNRE84Uk81?=
 =?utf-8?B?Y1pMMTdDL0tDUzZITmRGWUxoUEVvNU15MG9hc25lTmxJc1FKaVFXdXlsbHlz?=
 =?utf-8?B?SnRZZlJQVUtVbm5hcDZaVEMyNjllK3RzbllJdkVCR1JUYVdaU2MwMnF0YnJ3?=
 =?utf-8?B?YXVYdm5vMFFIWmVkM3NGSElDMHpzOUFRVlNBcyt0ZkVMa3RPdWQ5OEdOc0I4?=
 =?utf-8?B?Vmk1V2owcDlQdElyUFMvUkdDZEQrNzc5YzVoZGJ0RnI1cDlpYUMyWENVOFRM?=
 =?utf-8?B?N2pnZmZBL1NVSDNGMUxTOXUvREhLcGFUVVNqTUZtU2N1bXZsTVlUTTdBOUIy?=
 =?utf-8?B?UEVaTDE3MnA5QWo3eVJIbDdvS2RJQ2cxQVp1dStyQWNsMytYUS8rOXJMM0xn?=
 =?utf-8?B?YVJMOUZMd2xBWVdrUXgxZGRYK2dkL29qa0VKZDQxc1RQTVRRdnlLOURtNy93?=
 =?utf-8?B?ZjM4RjRHc3AxK3ZraUVRZjl0YWZ3VnZFOFZqcnRXZlQ2TURNUHByWnM5SkNo?=
 =?utf-8?B?Wmo3cy8xclliY3RSbERJc3lPYnBSa2JzckpseVVmRmJKOHZPc2hIT2pBdVNL?=
 =?utf-8?B?ektYWVZCaXA3anVMdEVQLzI1ZGZVWUd5RWYzRVdaVlJMV2tiRFlMS0FiRW0w?=
 =?utf-8?B?dlppc0s5ZEVVYVI2MEovREZNVkxjdHZPeSs5S3AzUmpJL3hGYVU2VXZsSmZ0?=
 =?utf-8?B?L0RUanhuTmkrMzI0L2lIb1RvWjdoZzlLSXpUZVZlaVdld0hraWgvVUdUYTlJ?=
 =?utf-8?B?M3BTVXF5WUd6Qzd4WUxEMysxTEFNaUFuTytqTzRXQi8zVUNuS3E4VkNsMWo0?=
 =?utf-8?B?YkNXMkJEU1huZ0Y0TEtONXRoU0dLaFREbXlGSmFLbHZWQUFlRG9XV2hXRmVv?=
 =?utf-8?Q?YIl3BhzWSq+eikjJhU5WOQGw7r/IzVqlYst78RsOIU=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:41:59.2857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a34c05eb-b494-4efe-d778-08de5a6c0967
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6970
X-Authority-Analysis: v=2.4 cv=DLiCIiNb c=1 sm=1 tr=0 ts=69735079 cx=c_pps
 a=q3CUEi5PZ8FXU+N3jHbiIQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=prQzqxCaf5vTWlbXWNoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 5wtEQKNc7ZE4nRtI4rfS7JhlLNjpT6kj
X-Proofpoint-ORIG-GUID: 5wtEQKNc7ZE4nRtI4rfS7JhlLNjpT6kj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX/lCFw9xUYmMP
 lN3R1I2ttAZQCkpRscOz+6+ZwOChAkUB7WWr+a9Z42axeYmU2/xsIYF3Kos27csTi+AUkd/syrn
 9oKyi6YRicUpKeE2NdlEE3hgYXs4srGp+LhR4uHHllZ0Gbek7YY7boyyeGGpxa0mgTSy/28hLPR
 92m2OEpyzcHIQy6WzQSrVW83oAyDsabydi1MPIiwuvbrmlAu7c/mhydffnmlErHN5tjwOHRz/tA
 l8KU/UwzB5ofb/suxddH5Ut3aFW03pq189Npkf4hmTESaqmwh50RQR0xxYpkiDXKxRtvmiwaSnD
 SiPTJOIwuAgLNs+DJLMPF0MmtDqnrI1EwGrU0noy8r0J3JsEJym8Oi8kYf/qO/ORsdSXARBlm/E
 HHzoFptTqfiwBPsBdkY81hYO94VBKDaVFn9NSQkd5WHgGZnHaTet4p3ZY2URFyx/qCEZ51Qkb0g
 4cX0SOIhTUVagvAHnxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31005-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,st.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3C7C1747A3
X-Rspamd-Action: no action

Because the HDP peripheral both depends on debug and firewall
configuration, when CONFIG_STM32_FIREWALL is present, use the
stm32 firewall framework to be able to check these configuration against
the relevant controllers.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index 0b1dff01e04c..cce477e86ef9 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -4,6 +4,7 @@
  * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
  */
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
@@ -46,9 +47,11 @@ struct stm32_hdp {
 	void __iomem *base;
 	struct clk *clk;
 	struct pinctrl_dev *pctl_dev;
+	struct stm32_firewall *firewall;
 	struct gpio_generic_chip gpio_chip;
 	u32 mux_conf;
 	u32 gposet_conf;
+	int nb_firewall_entries;
 	const char * const *func_name;
 };
 
@@ -615,6 +618,13 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	hdp->dev = dev;
 
+	if (IS_ENABLED(CONFIG_STM32_FIREWALL)) {
+		err = stm32_firewall_get_grant_all_access(dev, &hdp->firewall,
+							  &hdp->nb_firewall_entries);
+		if (err)
+			return err;
+	}
+
 	platform_set_drvdata(pdev, hdp);
 
 	hdp->base = devm_platform_ioremap_resource(pdev, 0);
@@ -670,8 +680,12 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 static void stm32_hdp_remove(struct platform_device *pdev)
 {
 	struct stm32_hdp *hdp = platform_get_drvdata(pdev);
+	int i;
 
 	writel_relaxed(HDP_CTRL_DISABLE, hdp->base + HDP_CTRL);
+
+	for (i = 0; i < hdp->nb_firewall_entries; i++)
+		stm32_firewall_release_access(&hdp->firewall[i]);
 }
 
 static int stm32_hdp_suspend(struct device *dev)

-- 
2.43.0


