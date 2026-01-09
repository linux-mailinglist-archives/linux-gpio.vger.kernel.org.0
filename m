Return-Path: <linux-gpio+bounces-30327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FFFD08C27
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 11:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B842309AD89
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3E633985F;
	Fri,  9 Jan 2026 10:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="F/gOgggu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0CE26738B;
	Fri,  9 Jan 2026 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956187; cv=fail; b=cuOcIidmBsPG8cke0xG9vt3lKF0Pbe0l6VMvUxrpEJFldPv4LPwP49KqW817TzzuPRW1oURON1kjSuY+CvzamDj+VLBcbnFNam0V8Sp8uYLeiGBbz0lV5K+tFZO4K5CQGv49hnot7M982dVwKPQP25LQNDZrJiexUmUNYwHctgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956187; c=relaxed/simple;
	bh=unhgi9vGORL3IM+gzW0jfc/3jGDmEpTAvmmulX8anCI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=rUDywfusY9SO5pR0wwNsqR9XmE6QXto1Nd3mmOSQc1DiZZ3KWJ0E3jax9DhWMEGQ37xWFq495M782Qk+uz8olb0ED9zSGPDvYpRgpOJhIUE2Q5ieFTQqInOv13sdBy4S1X3eahkUgFpdTKqnjflaQNiaO+VkK03bzT/GRsHPX3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=F/gOgggu; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609ArtSk011276;
	Fri, 9 Jan 2026 11:55:58 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011056.outbound.protection.outlook.com [52.101.65.56])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjv2212tj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:55:58 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsNV1HHSAqFtvjfWIr3vluIyOGwc580jOYyRUSvNgrnUUzP/2bdxbVOINlSQsX+tn9LrneKwhzUc5BzCqUcTm+wjuIvDDS+KzLYMv7HF87yJfFpAzyOIWXKk6W7ElDViF+amiA1hKDhLKjxrM01WbqdOmJN2EKh+OSKlZ8xjeHfhjs6D9Gg4RHCOEhC9Pq7EVsSmHWNrYHkuZp+HyrHP+/U+6vB1L36sDjAvsDAKmNzczfXK6UFRK/yHv/TWUqmHjQMBdFIU5+pKagQJb08F/zzXzC5NyBMbOF40D3r8ygvikc+ThcfoYDdVltrul7WX/9sOPeo51sqZQcnd1T5UYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hs49s1S0w7flFCSV0bhPRzbmCwwrX9036EkAQFhufJE=;
 b=A2EkGttJcKw1Z4d5+LB9HrYZIdnr2Cl6Wdt4+bWwyH01y1ZsYsvYLJSHmVGYTeGNoNRV2uuMx2GF1s96kG1WEUUtVFuDPI8eULupNZMxrPQeW8QtOTOOb6U+vK7Z6UI2WH04QImQKhrgB78DptSr38yyigPvYOFFk2Iu0VH6hjJV64+vr4dmJB1ug0HayCNC9Yb5w1Z5//DNXSbdOEaRkyxiaeBOFWsmRcBPzkZWtskM/EZj5CenofD32OudHD7zWsgojEQIq3zI0btheRdOVSKEgeVwLM0Tj+TnF6fRS+TydGOe46HxLvuBLNRn3xPBtEg/b0AarPyeP4ry1MmZkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hs49s1S0w7flFCSV0bhPRzbmCwwrX9036EkAQFhufJE=;
 b=F/gOggguhfAAo3sau0yp8vt9t5F7mw36SweOjsfWoSz6+UY2w3CzLACG6OIkcZgYYfeH+aU0lPKaRe+b+E2sA60kewJ8P9Rp6CuhVrkcauXNpB+cwCQnguOVc/PVZYT6cjgA1carwHw50HWvOufQFQrE3vd3ZrcGpwRxQub19Hc8mHGxXH349QrbJ39Hv+yNzMg5gaF7i6tys2d4QGiFRSi1Q2GnmO6U/dFBrw+L/oF3bsgqZi5YTE8CMi226Kac5kmPPqN/jhTAHM8R46gh7FDnTespD4iJvKRHfeN54/37lI6sor46oPY1uPoQikNb3fYHd4phhqV7rtA7veLfjw==
Received: from DUZPR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::12) by AS8PR10MB5950.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:529::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 10:55:54 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::25) by DUZPR01CA0022.outlook.office365.com
 (2603:10a6:10:46b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 10:56:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:55:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:57:08 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:55:50 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH 00/11] bus: add stm32 debug bus and coresight support for
 stm32mp1x platforms
Date: Fri, 9 Jan 2026 11:55:00 +0100
Message-ID: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAITeYGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwML3ZTUpNL0+KTSYl1jSyMzM7Nk80TjxEQloPqCotS0zAqwWdGxtbU
 AdmAExFsAAAA=
X-Change-ID: 20260108-debug_bus-392666c7a3aa
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E0:EE_|AS8PR10MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5ff5e0-3d2a-4c4c-4e0f-08de4f6da8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkpIUUdYc0F4anlPamZnWlVJNTJid2txcHYxRDB3dmhDNFdCUlcyWFhEQWxO?=
 =?utf-8?B?c05aUG1xVzV3WmJ3TGdCbWFZbmlPa2YrazE0K09WYnJVM29jc3U4bkRndGJu?=
 =?utf-8?B?WGVCbHFTUmVLbldZUm9XdEhyNnJPM1dHMGlndlY5ZDluSUYyUXVRN1hUUnQv?=
 =?utf-8?B?WG15L1BkZWk0bzBZUUgwK012MDNNUGRPTzg2cmZqdHowSzlKV01iZmVzQnNW?=
 =?utf-8?B?cUlJMGZuZytrVWJsMUNpa3Qza0YwTjRrNTNaS0llUjJ6RnYwOVRvcGVSdFIw?=
 =?utf-8?B?TXNNVmRVa0JmVnJOVy9WUkMvNUlVMkNZdkFQR2pzUE5lak9COFFOV1Rhendh?=
 =?utf-8?B?Umk2dHZvQ1BGWE84K1czVXlSYVN4VitWYmNHd3EweUdZU29qRmJrOWF0YUE4?=
 =?utf-8?B?OVlqWWxoSUxFNWtjcmw1SW5ZeGJNMXZIWVpraHo2Nk9XQ2VqOG9KdEUxS05p?=
 =?utf-8?B?TnlNZlBzYUZua3hXNGlFUXNjeTlYL0ZtQUFWZDVFRHV6RGYrNVBBSXJjUVlF?=
 =?utf-8?B?amg4RTZ6bG44OFpjaHpMRis4SDhHZzVFMHh6N016R28rdThSNzFhMWZlL0p1?=
 =?utf-8?B?TmJEREREOGZIQlJXdG9VU2RZVG5MOU1nQXJtVXBqU2pMTmc5RVJUcjFmYkw2?=
 =?utf-8?B?TjJTMU5GdTdrcXdteWlvOVB3SHhZSTRibGdNUlJYS09yUUVLWGY1YXpNbG54?=
 =?utf-8?B?MUpqQVR4YXY2L2lMd0ZvUGI4bkxoQmJGVlZmVWNlZkVuOVBBbUp6V0w4STcr?=
 =?utf-8?B?eE1rN2VGL1FmeEt1ZklMbkkwZGdRZlRkeTFLZ1hKanhWU2pMUTZEaHdnOStk?=
 =?utf-8?B?cHgwTWdteFpWU3l3WGliOGI3RHc2MUQ3a2VYK3VRVHRCMTd4WlRXV21KRjJa?=
 =?utf-8?B?NDAzT1JLczBVYzJpM1JNdGZScUhzTzhiYmpndzhmbmt4UVIxOW90T3F0M1JQ?=
 =?utf-8?B?aFRoWWxYV1RaSGRUNnVxWnV0amZxQ2o0N3VOL2I5UXpoeWIxdGRONWQ5WmpP?=
 =?utf-8?B?MERjaE5vQ1hqbXdHRmdxNGhJNG0vU29hYkN2eW94SnU0b0hQODB4T3dQQ05t?=
 =?utf-8?B?MzZUYTg1VjJwL3hRVWhjZElRSGJFR0VxYUYranZPUm9CVUMvL2gvODFGVXdh?=
 =?utf-8?B?ZXlsbGxwZEx4Tmoxdm1LQlFCcnR0RExoeEk1UUZxME1CV1V6NFBPMG1DSngy?=
 =?utf-8?B?Rlc1c0IzdDZ6MnJkY3BJRWk2UlFIeFU5NjRsUG8xZkluanI1cm1ONGFHajVW?=
 =?utf-8?B?QVRyd1M3Rk1oSzFuL1RxVXRjSEhtWDYvK1AyeGRzYWN5djF2ZnlhbGdTNEtN?=
 =?utf-8?B?TzFrV0E3THQvMzdDaG5tVzFZMHp6bmwra25UU2lQMVAzc0RuLzhpUjg5b25G?=
 =?utf-8?B?UDRPVkZ4MkJWdk1Jcyt3TVNtVzh5dHZPVDdYd0NudUp0S2l5bG53QzZwLzZ0?=
 =?utf-8?B?WUxZVFErR3hIcEFzTkNiaEd5WjNOL3RPRHYwMHl0OGtxRGRVOTZlRXIwYXN0?=
 =?utf-8?B?VnVZWnRWSmdIYkxici9POVVaZTZia0x4TWhBRVlmaDRUblFIUDMrcHhLbU5M?=
 =?utf-8?B?ZVNUYmE3Qis5YnJlWDk4YmRZNkFhSzdLTXdjdWtBL0cvOWl2c2o1WDN0bGRP?=
 =?utf-8?B?TVY4bEZLWlZZVTBzMDRTQkdyR1hJWGlEcW1LcnE3ai8wU1ZmZEpjajVXajJW?=
 =?utf-8?B?MnkwaHBRR0syaWkzbkZhblc1eFdmaWdMc1NVNGdwS3hrN1BvalgxclhaazFG?=
 =?utf-8?B?Wm9kTGVjeUFiNlFNTHZpUkVHZ2wzU1ZTaTR1UGtRQnVKN01qYU5kOG0rcDVE?=
 =?utf-8?B?WmVuc0poMFJtNVJxa0FFZU1yUWVaeWlhY09wL1hMdGJ3TSt1L1dQdTZEY3Yr?=
 =?utf-8?B?K2dpQzFDdTVtUEwyOG1Ea2llSUpJVkE3cmpRd0ptMStvN3h3S09iMXhjNkNm?=
 =?utf-8?B?SVBSN24zOXQ5RFFuTkFWY1FseWdnd2V2cDI5amlkdnQ2d3d0U0dpSlZacHg4?=
 =?utf-8?B?bVk0djUxNEtxMGY3VWlmbHBJaCtDZnlNTC9JdG5JU2RzdmJGZEhCbXZqV1lZ?=
 =?utf-8?B?YVEzMTd2dER1UVZiUnpKSmRiODVYaTdhZHN2LzJRSExyWTA1RENTY2grWi9m?=
 =?utf-8?Q?gWLY4PTZUQREYobX6vtrRv/+h?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:55:53.1798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5ff5e0-3d2a-4c4c-4e0f-08de4f6da8ab
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5950
X-Proofpoint-ORIG-GUID: NCDqUX-TK_ElScMylCQC-z2gA6jGY98D
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6960debe cx=c_pps
 a=1vQRXpsGNmEGKh2qpy4sKg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=8b9GpE9nAAAA:8
 a=ypHp3MR7veaYCG1KK1EA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: NCDqUX-TK_ElScMylCQC-z2gA6jGY98D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3OSBTYWx0ZWRfXzrnexqe+TyRn
 xDQhctX94Vqs5uYqgNYRY+ECJlu7AE9reQW6UMFmK6t5pZRwUcs5M0mNx39MzTlX8JEYtcCXRgJ
 kq+yRM8Da0nQLDR8SyFR29dFVC8vvCjvTQo5G4I8sppEkE1tAwuGA/zfFyOSZSe3cYl0TYaiHwt
 UjFNk8J3YgC3ymQwY6rnkpz34E6c8377W8q9qJ3TtAVEzNcUmyUFgkvQmgmUMRjUfy5uiCPrGVf
 zHn+zUfUFvKrUHg2/akYnzK4CfGocfFpPHdOxCg5HkanlaZMzjZ/p3dBhmch33kl+R59zyKdTjE
 hvhKAFL1b53J2rPwQ4jnUii0Y5GvGLdkQqlS5u6g2EwrieqI1s9l+x58a3A5x8q9AnyP6PLnK8r
 RJGVt9/rdpukZ+rHkLIOOVAI3rY8AiMjLqI4sC7QU1+xkKUK8wx06x0qzlRdhzGJfkDTMmm4+kv
 Z8SUNZ0X7i7S01zBzFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090079

Stm32 SoCs embed debug peripherals such as Coresight. These peripherals
can monitor the activity of the cores. Because of that, they can be
used only if some features in the debug configuration are enabled.
Else, errors or firewall exceptions can be observed. Similarly to
the ETZPC(on stm32mp1x platforms) or the RIFSC(on stm32mp2x platforms),
debug-related peripherals access can be assessed at bus level to
prevent these issues from happening.

The debug configuration can only be accessed by the secure world.
That means that a service must be implemented in the secure world for
the kernel to check the firewall configuration. On OpenSTLinux, it is
done through a Debug access PTA in OP-TEE [1].
To represent the debug peripherals present on a dedicated debug bus,
create a debug bus node in the device tree and the associated driver
that will interact with this PTA.

[1]: https://github.com/OP-TEE/optee_os/pull/7673

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Gatien Chevallier (11):
      dt-bindings: document access-controllers property for coresight peripherals
      dt-bindings: pinctrl: document access-controllers property for stm32 HDP
      dt-bindings: bus: document the stm32 debug bus
      bus: stm32_firewall: allow check on different firewall controllers
      drivers: bus: add the stm32 debug bus driver
      arm: dts: stm32: introduce the debug bus for stm32mp1x platforms
      arm: dts: stm32: enable the debug bus on stm32mp1x boards
      arm: dts: stm32: enable CoreSight on stm32mp15xx-dkx boards
      arm: dts: stm32: enable CoreSight on the stm32mp157c-ev1 board
      arm: dts: stm32: enable CoreSight on the stm32mp135f-dk board
      pinctrl: stm32: add firewall checks before probing the HDP driver

 .../devicetree/bindings/arm/arm,coresight-cti.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-etm.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   3 +
 .../bindings/arm/arm,coresight-tpiu.yaml           |   3 +
 .../bindings/bus/st,stm32mp131-dbg-bus.yaml        |  86 +++++++
 .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  |   4 +
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               | 119 +++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |  24 ++
 arch/arm/boot/dts/st/stm32mp151.dtsi               | 173 +++++++++++++
 arch/arm/boot/dts/st/stm32mp153.dtsi               |  68 +++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  40 +++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |  40 +++
 drivers/bus/Kconfig                                |  10 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/stm32_dbg_bus.c                        | 285 +++++++++++++++++++++
 drivers/bus/stm32_firewall.c                       |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          |  41 +++
 18 files changed, 905 insertions(+), 1 deletion(-)
---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20260108-debug_bus-392666c7a3aa

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


