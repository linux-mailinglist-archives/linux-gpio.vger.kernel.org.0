Return-Path: <linux-gpio+bounces-30941-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEAWA6VUcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30941-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:47:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1216A3D7
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E6E8230A44CB
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A3C3DEDB7;
	Thu, 22 Jan 2026 16:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="EmlMXVLi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B43A89C9;
	Thu, 22 Jan 2026 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098955; cv=fail; b=D0KOoMjESJEt/lRqL408oTAn/8CZFwfmj/1qKd5FiGuVk+CV94dKlBKulaKLSGGAQQ67xLG9tnHmGXUjYTRUJZbR7YN9cOK42f4DOoS+GpLMzLWD8yBbVeRpvUS9fgg7VqH4B7VwCvuMqKPno5yRcFWUfYu348Viuc5j7Pvi6Cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098955; c=relaxed/simple;
	bh=xbgh1CCIgcEFj9WeothPqUmM2N2sWTN9TRalHeX1drc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=j4r2EVsKyNVrIFuDZ/Or1dOx9tvXPXM7ZRhSoFn6daTNajR0d5KQAqeIV8U3C5VqaRKcP11oJyvxo+V93nuaGp+hlLxZCzIA904hfaxJeBWM87XR+4fUMPx7sOYplTCWguLxi2mZ8iJAZW8Q+v50zKPvHyapHUDJWcsBhpmNwkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=EmlMXVLi; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MG8XNu771318;
	Thu, 22 Jan 2026 17:20:59 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011007.outbound.protection.outlook.com [52.101.65.7])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btcn510t7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 17:20:59 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4n0JXzcU2wCgZ55bwA662WOEtiE1W5pTQAOeB/QAz2FjMqBZv8D2PPVdYiIIYLrKab5F8q6oUAoQ11+YMRgOvdm4t7IQa0VEbsIkGgZaiEVrmyZQo3rSyqiWFaN0d1mWj62zmhIk5m6sIfQkFwXhtBRmCGupiDfDvbAzjYnJC03+dIDyhlZA53JZ4zlK71yYvsZW7TGpCJ3WYGXHr3ANbgYOpvEUob6yahNZVClklbOifRabbjMFyaz4r/zk+qBx3HgCXhkL8uK0e2SiLyzC60GCM7mCxy4AyCdIRJxkj/pvvYG7qPrqABSQeHXLkNdvz9lLi6zAmV/V1v7K09+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bwxk81WusWTFK/a9r7vinmm1wcowOubfgfecTr4+eB4=;
 b=XiWHPQv8b2f1VgRflxDWyc4GzG18KtibbK2Gka4Xe/3fTTXlVQb5HGmd8vwL5TSja7Q40tcgvLZO6vsz5xvZSgDdF7Aip0QUtG6XElY0bc673qupxVpU8BSMiKHNkCsWPzmtlUkWpoRYWtvle5J0OZq1s47zDwNID1ER212b2Ubyd0tHjP1CpftGvLa9HSksO2a1bSFCebgGpwCAuVo4rECoslEf4Rdtc0Uyagdbu6bGxFaCxyJixCfq3Aluqqt5cRkubZydLiPwYWEL0dCeuYnkGfbbUoIZgbJq/cB8ZlfiB84/r2G/jkOLg/QwEJfiMn8UtKK86H1FsrOhaoCW/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bwxk81WusWTFK/a9r7vinmm1wcowOubfgfecTr4+eB4=;
 b=EmlMXVLiaQfr7KreZ+M0spQ+l0gWajVwULpwvEwT8AT2rGIwYB52bR9jWJdSIZ8vSi/Pt2KhbXfADejFO6alZZIwBzYmTuOWzjKLhGx7Djwc1E4vET+iYQ2bYYnWAL9UKgGu6xctvslpMZGo/yU+BMvRQfPwFkOf5jO7u3vXahhZDI7VF3i76zyQx2GOn+qIXd9f53cGhFx6qBYZk7fq8FegpuPzo9Jk3HoP1ltxqD3Qtd3PLRk9pOMvdtFnRgQ9GlQDuOHbLAoO5iUmXV0u8Pm8sfyHqNNK255tcB4tk1bqcdqsLArpzvdaacSNORfm+bvEw5/cDVMdvdJuv+3Wyw==
Received: from DU7P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::28)
 by VE1PR10MB3933.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:169::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 16:20:54 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::34) by DU7P194CA0024.outlook.office365.com
 (2603:10a6:10:553::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 16:20:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:20:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:22:13 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:20:52 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 22 Jan 2026 17:19:21 +0100
Subject: [PATCH v4 08/12] arm: dts: stm32: enable the debug bus on
 stm32mp1x boards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-debug_bus-v4-8-28f0f2a25f2c@foss.st.com>
References: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
In-Reply-To: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9C:EE_|VE1PR10MB3933:EE_
X-MS-Office365-Filtering-Correlation-Id: 2728b54b-2b25-4d51-4e6d-08de59d23733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHBVTzkwSkljR1Y0aWxpOUlyWm0zUVJmZ293YXZEVGFNc0tJRFBlZFlMemZp?=
 =?utf-8?B?V1E4NDlRNXQySFQ3M21CSFd6RXp6d2d3VGNBTHpxQXo3eXBreTdieXd6YUFq?=
 =?utf-8?B?bWM5cjRzK2NBZGx2TnJpVExLbTVSemFCK3Q1bzNQMHZ2dEg4eWo3RnpEcXI1?=
 =?utf-8?B?dkpWUnJwTDdXU1NBZVBLTkg2UnI1bnFkdGhqSTJ4dVlDUGthbkcrQ05oZ1VK?=
 =?utf-8?B?bGg0T1dSdE1tRHpnb0tacE8zN2JqREpTTFErS1Z5Vzc4a0h4WFRIdDY5K1kr?=
 =?utf-8?B?aVRycHczVXJveTlCWCtWa3JqeGNaYWtrNm9WVGZOcVh5RTU5TlVKR1prUXE5?=
 =?utf-8?B?Q1BvRzRzdEZXNVBFc2VsV3JUNjNBRWhJNWtNOGdIeUdMaGk3N0Rxa3N5cklF?=
 =?utf-8?B?dzlaR1VoNjlGeGsyUWVDbnVvOWg1WFg2U1QyWjJROFhnM2lLUlk3TldqMnN5?=
 =?utf-8?B?Q2wyZ0FGK2ZoRDNZSTBkc1lGbThMSlNVWERLbSs2VGFmdlUwUklpb1kyT0dM?=
 =?utf-8?B?b1doVEcrWGhISHFpN1JCcHU2VXh3TFE3Y1daSkJ4d2QxRFhtbDlER01RZXNU?=
 =?utf-8?B?bGNsQjBaWFlNWjVZSmZWUzUyOGdMR1Jlb2dwUDkwTWgxNXBKZHFYT3l1dFpq?=
 =?utf-8?B?RTkya09JWlB4VFg2VVlkK1hyeTRDTFJlclVWcE9paEJwbUt5WHlsWFY4WjNF?=
 =?utf-8?B?TU1YYTBaOFhpMzIyUzVrNlloK21obkI2Uk5Jb2tPQXdLbVRqRTVLald2T0Zo?=
 =?utf-8?B?aXR2V1hhcSt1UzJiSzRUZm83aUd0Z2RuOURMNmd6M3hpSnhDbFFnL21weHlk?=
 =?utf-8?B?dFBmV21sWFJTRnBCMlZoVEluQzlGYjBJT2VKcVN1aUhUcWlzSHc2cENWZ2kx?=
 =?utf-8?B?cU0xSGxITGVleTA0T1hQR0FrM292K2p2cUpYOWZ5OVpQN0V1OTBET1lSaHBa?=
 =?utf-8?B?YW5VMUdDMnE3VXZ5SEZaRk5oWkQzdkxJNFJUTXRyU2RHUGRlTG8zOEtTQzRu?=
 =?utf-8?B?aVM4QVFSbm9RTEhSb3JWSjN1NzN1TW55a2wvZzlwZzJJMTQyUlQyK1pGbFpB?=
 =?utf-8?B?SzZIYXNEcVFoc1VqYkY5TWdqV3E5aWJnNFRxNWxseVI5WWEvK3Q4dCtVRHo4?=
 =?utf-8?B?WWtvdU42d3Vlb2hLMzVVeXAySW5Sc0JlcTdEU0FiK0NyWHVQN01NaHhwS2VC?=
 =?utf-8?B?SUdrYzhUbGE1U284WG5tcXBWcGNaMUtTbDJhQW5yVnlaWk16SWRKKy9FVzRl?=
 =?utf-8?B?bjFPMERSQUljbFZzSFNGYWZHeStwM0xIT2FMRjJWSCs0YmhOcFNpb1p2WlBm?=
 =?utf-8?B?bUlzUnFGWjZySlhLQnpDcTIxd3ZjRm11VmY1UkhxaFpmSHFkNTRScGVqSUg4?=
 =?utf-8?B?MFZGSXRBUytKYjdwWEY0NzVWdVE0bnNoZEZzVEhIRUdaL0hObWExWVdZMWxE?=
 =?utf-8?B?QWFHQXZwNHoyMzkwTmk1MW1YR3dxM1lVUDRxV2UyT3cxVlcwMEtvWDkvTW9n?=
 =?utf-8?B?bWJoM2l0U2FKRWFKeE9aWC9BVU8rS1VwVFkvaHgyMWxkS2Y1YjVERVNDTXVw?=
 =?utf-8?B?K2tuQUVrVG9mZUhzMUhUMkJKcGNVVkh4SlNPbDBDcDRDTGUzZGNkeU9aaHpB?=
 =?utf-8?B?SmZMemw3ak9QN1hIcXQ3alpNQWRGeXRNTldBWjd3b21MQ1lpenFURkhVRzl4?=
 =?utf-8?B?OFBnTXNwaWNMTUpXZDZFdnRQbjBQbU9LNHV0OUc5SStra0U4Mkx5WTZJMnBh?=
 =?utf-8?B?Zmg0aXpxQ3lkN2NnZ0Rjcm1nVmJVQU91bGpPcGIwVGFua1BWdVdsMTZqL0xY?=
 =?utf-8?B?dHRkNmhmc2oxNi9PbU5CZDY0bisyZEhlVFVZaXFicWNaK2RQUHRjRi96eTR5?=
 =?utf-8?B?RmVSMm5tUHRYL1EwdWVwT2N0UUQyU2ZERjZGZWhWb09oci9obGloRzAvQlUx?=
 =?utf-8?B?UlFjTWRyZldhYW5kV0lVTFdLUlNTajAxaTloM2RpVVBvNHErenpqZXJZcHlz?=
 =?utf-8?B?M3JhUmtON0VsbmNkMHRTMlhCS1BGMnh0SmZTVll4WTRoTkFXem5jV1RMYkFy?=
 =?utf-8?B?cmZQZ2JxUFBwQU4yb2RieUE5MXdITVRGOFArb21yN3Q0a3VFV3QrRFBha3JI?=
 =?utf-8?B?UE5tazBsbG1VazY5aFBjQ3hSM04xYzJiMVB4aFdtVVV2VGtnMUxuc3orKzFL?=
 =?utf-8?B?cTg3VHVieDRmTjl0dFlodlBhejNhZmNHN0VHYjN6b2FIWHNNQlBUdDJHY29X?=
 =?utf-8?Q?eIOz8H/S/cog9AmoTcTbhEjdRv2SNVFO1Nql8tCiX4=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:20:53.6214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2728b54b-2b25-4d51-4e6d-08de59d23733
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3933
X-Authority-Analysis: v=2.4 cv=Fec6BZ+6 c=1 sm=1 tr=0 ts=69724e6b cx=c_pps
 a=AeQ0znSE+p+lBnVhk+Jsqw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=mOgyZ-Q4tP4zXMNofoEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfXwQIMeffROgJL
 2Xy22vrOWxqUeriEmkqbQswZuEG1WI0Yibj+xWtIEKYShERp041QncG628FL0qT9sfiqdCIxJCs
 AeCU/ky+gILsPLZkoxgcHkQ6AROQQzx+7Pf3g1tYjrorQv9vMzQff5ZhzOZiws2GY87DrLrCU24
 nhDjCrQjIzfmKQzU5q77cCqLOVY0S4nqZn+Ve+WaHyB/SSdwlPZBqZ3oEKTACzheU5LZmonZbl8
 1ld/qWrFYJbMe9hq8ddZOaMSc/IQGuWyCRI9jCcgSc/rT/twyqaAt1IKUG/RSAiYB+19iSuG6NS
 WFIIAeWPvSREfOBs87VtGC+GhaPxR5d75i/3nIzRcP89vEFl+UGwEu3gWDA2Q8bMgrH2l+vJKUW
 8gndPYjDijmd6f1qG0Bbl2S8tHUhGtoNc7UW8wJ+Gd2xcYbZFVLr8Zbu0o3SE0hq9ELeP3S5LBc
 0RdYReAtJODKcjBn6vQ==
X-Proofpoint-GUID: vXFEMzdplI-TU7CfDUyuViVgBr91fgQZ
X-Proofpoint-ORIG-GUID: vXFEMzdplI-TU7CfDUyuViVgBr91fgQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30941-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DC1216A3D7
X-Rspamd-Action: no action

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


