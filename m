Return-Path: <linux-gpio+bounces-30856-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBwlFx7KcGkNZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30856-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:44:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC956FA2
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D620B5C1E66
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE3B481AA6;
	Wed, 21 Jan 2026 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AlVeR7Z9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B82747DD53;
	Wed, 21 Jan 2026 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998980; cv=fail; b=NIhvmj6bZL3NaogK5k19esxGD6C4bB33U8OlWJcXQPeVXcV4SogUR/h+NAK6Ph0BU+zZd46zWGUErRZE+JHzYcaxYFiAp5ogAWG1wgDb8sg16qMqbKzoVFfgBOVb9isDxaJQmHoSfSudYTWXoz1OWYjNlzUbmo5YuSY5Fa975V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998980; c=relaxed/simple;
	bh=U8lUaJaGWlAAs2TETk4kOJCGhjfzcuZGqGmxGnfDeIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nuMDFqBcQTnKfQz522U4VjjDLNxE5VTQFh58X1Y1f0/6/LW2Dpz+Ij40MUIr2WrYR0bqe5ViIGJ8i9CtnWmSh3dx49jMRH0p8ncmjPlVmz2NUYlHDhP2UmBOJszGA1P/SFHLRfRyR6fl4t5DCFRhLuS2qe0frvjrKynjRNG59Gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AlVeR7Z9; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LCTCMI516502;
	Wed, 21 Jan 2026 13:35:03 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012014.outbound.protection.outlook.com [52.101.66.14])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btkkxtfc1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 13:35:03 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hoq6yLXALpatL/ElGZFij5sMBykXazl+AoryopRI2KWFRK5xUVTGmLTV8zfR5Um5BZGiL/ZNEwFwkKxYdLlGO67s63VDEst21Ew4Ug9vI94kpkwMMhGvItGL0RfD+H39tHzFmza7QL8AmW+hoLAxrEfLM9dYh1yzLoUe+w8hBeScSxDsTEVmpHt/Bi5ifoa6YdmsR/+6m6khdeXMgE/ju49nFh2KmDGIQYe1CcCkTZI9gotYY3TPKKJrbOFc5AL+Gu8UQb/rIjDgR5TKb3mkThrHwnvmvWY44zTLo1BBlZbTLhkFauen2dTzQIbpV/+vVakYPstn2u1zE73EKdCTYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvKaTpku3+VOMwDHNkY8LHOf5sEYrcrhx0Ez3oSw4QA=;
 b=fUDQnSkQd2GlMjizNr9bd1SrdF6wwX2fBbaKpCSVdhszraffOjXK6QZYq2rFfuUPeLV5rtJ5fUdeocZapvFg75eMtWny4b61Ma/5VUbw4tTnl//czB+RV+9WUyNm23Oljz41KA6I6eXZdUHS3BmoLnL91K74yJH5mZkgGOOUgIpMRRobFw5s+lWE8o24RaI9WsPYdxNmNwU5GrDRSdBHJU+QQA7k257eDGpWMwkdvBfIN+JuAlMqt1MDATK/CyHZgumnRpeVgveelWpMI314w3u27nV0AU1nt+7keMuOJ87cg4VeUPwDf7HJrf7OG4t7sGnuAowQlMOQ/L9/4fn9bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvKaTpku3+VOMwDHNkY8LHOf5sEYrcrhx0Ez3oSw4QA=;
 b=AlVeR7Z9wXGBSDPD75ZobItA6BoaY0SCCx79/g32rYS/i7x4D1XOUf4dVnE0Q0x/D4TmTK2C5Sc+iGqt2gCdbYSqu/ALCxncCfoNmQn1TdXGL+8AUr5v35q8gESggGff1nJAzryyUXoACQzEMhQRlacQFjfwF79iBTQykcveJdXyWUAL94fVwvndVvHFptaMcL6dyGxESMJAxoIIFvoAaa/mKY1JIzRGrtBznh0Hh7HRK2Thb61XzACN0ZXSIgmKa0wzTHv9oGesqN/kyVastYvFZyIpe3HR1ICqE3AGC5vfcosGpmCzBhv3oprpnX7ZYHdTrfYjUzk2i4/AS463Pg==
Received: from DUZPR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::13) by DU0PR10MB6756.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:476::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 12:35:01 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::ac) by DUZPR01CA0025.outlook.office365.com
 (2603:10a6:10:46b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 12:35:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:35:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:36:20 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:35:00 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 21 Jan 2026 13:34:36 +0100
Subject: [PATCH v3 02/12] dt-bindings: pinctrl: document access-controllers
 property for stm32 HDP
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260121-debug_bus-v3-2-4d32451180d0@foss.st.com>
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
In-Reply-To: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009526:EE_|DU0PR10MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ede02d8-75bb-4aa3-5b23-08de58e97ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHkya2tSL25zUnRkM0orK0VTWThIL0E2V2N1bzJSV0t4aWllS3ByN2FJYWdz?=
 =?utf-8?B?TWk2SUlkMVlYNTczZUtnZmhhQU4xUDM0ZGpqZjc1WlExRGxpbUtGT1ZDWGU4?=
 =?utf-8?B?SzZVZ1hPcmJyYnBxQytSdksvYkNidk15bG9Eb0Nzc2IrYWpkSWdXM2tnWmY2?=
 =?utf-8?B?d3g3aHhPdUVQaEhaVVBMMWZmcWk0RGUvZTJ3RnJoSUhmR25oMmZ3bmk0M3hi?=
 =?utf-8?B?cmRmV3F2Sk5hQjNudUpKaHBhM1NocU1POU4rMldMYUVDUjVkaExob0lpWnRN?=
 =?utf-8?B?dVg3STJxMGZLeDNxOVJCSXF5eUZSTi9lNU1CalBuRHN2SkdkUU1mc0ZNMG1n?=
 =?utf-8?B?YzlFVFRMa2t5Y2swQjZRNEZyWHA0UzhlVCtHU3VZeS9QZ0k0bzhmT2srVlBJ?=
 =?utf-8?B?enBuYmJxRkJnL3BUZ3h1M2pIV2dWZ0RoekFjNTR5c3NWbFdDSGZtZWUzZkkw?=
 =?utf-8?B?aEFGaTFEbWZGY0FCaVhZRmNGbEYxcHJXbVRoWjZOcGFYcGo1dmZScXNBYzVz?=
 =?utf-8?B?KzZEZ3kwa0NvMElMdnd0djFXWVZZVzlNZmxJMjJrbXBpQ1JXMFZqR0swZFJ1?=
 =?utf-8?B?ejk5TnNzWkNhQnlnb2ZvalZWY3pWNmU4b29Zd085WXU0RU9kZmhBbmFpbHA0?=
 =?utf-8?B?dklRdFNOTmdoV2drTzlzYWt5TTdjRmR3LzNhVHFKUmdhbTFTSHltZWV1MFpt?=
 =?utf-8?B?LzlTMy9GNUd5dHlMam14MnB5NVRGWWhYMkhZaURrSWNKVEV0R3NlUkpsdHQ3?=
 =?utf-8?B?aHNORURYS3RWS1cxZlZERFVObHRyM0tiUFhubnVjVnliTnR4WHVNVkJJWDZV?=
 =?utf-8?B?cGlpTUJPdXV3bVh6MUF6YmRmRTVTaXNrTDlQU2M1a0lWdXgxZjQ2Ukdkd05W?=
 =?utf-8?B?MnNoL210VmVFQ0U0ak9WNS83aENwdEZWT2xjQk5WK0huWG0yQWVZeWMreVRR?=
 =?utf-8?B?V2lvR1FNQWhjdnJkdldvN3FvMTNTZGhXMUpma291Tm9udXg4TzFuNXdCQTNy?=
 =?utf-8?B?NGZUa3hIOHBEdW82VWVCMjdKVjIzUElITjdpdVZ3ZVd5VEN3Tm10RStJWmRV?=
 =?utf-8?B?eHl4SWZWTS9MVnJVczh0alMwZm9Wdm81ZXF1cE51bjQ5TXo2SHRFYUZPTEJj?=
 =?utf-8?B?bFV6bWd4bGhvY0NId2Jtd3JCT3gwMnNSaHhWZUx6SDRhV0tickJTTmpMRjFN?=
 =?utf-8?B?WGRuMGZrVFhHVk5PY0ZSSXFaMlZYd3QxK3A4c3gzMEFwdmZUcTVRRmljVDRU?=
 =?utf-8?B?TmVidnhiclRUcmVpd0JmSDZlWmJQYVRpTHN5MG4yYklFSzJxZnhUTC9jUG94?=
 =?utf-8?B?MGZUeFAvRU1aOFpTaThHWER3MFNLQ0dyUkFZVnM0dkVMSUNXdElrWFV0eFJa?=
 =?utf-8?B?TWhFNmJmNm10Mjdta1Q5Ym1oMjEwVHVESDkvdkQwUG1ZdVpQRHBvRzNSU2tK?=
 =?utf-8?B?SlZpN2tvTnVmbjNEbXdvbGpDN3k0d2x2WndDSzBvV0JPNDh0TGNJZkVmUWNn?=
 =?utf-8?B?VVlDSkowcEx0b09jcUhheHpWOFE2N1F6NmRJM3dXcmJtVmtBU1o3RVhJYnk0?=
 =?utf-8?B?aDRxVHd0S0VtU0k3K0YxUHZCc1RtcWxZSCsxc2dLSG1GQUl1TzdESUdpUVdX?=
 =?utf-8?B?VEk1RnorWGhIVTZIWmowaEJIdXdSN3VVRlNLZCtTTjcwOHBidEJ3ejA0QWpQ?=
 =?utf-8?B?Sk5KeEpVdUhzU29PeDFCNmRXNXU4cHAwT1VobHFUeW5xOXhvc210ZUxYWDhB?=
 =?utf-8?B?SFdRbGluNU83S3RpTTRMZFZGSFlKcnRhOGc1elZNcjBseXIvbkhuMnFRbkt4?=
 =?utf-8?B?OXFOakJWazFaU1E2SjdEaVZtbnZ6dy96YkhqUEMwM3c3Z1E4YjFGMDJuVnk4?=
 =?utf-8?B?Ri81S0ozMDNJMmFpSzExS2hnK01ldmZKYWlOQ3hjdTlqOUJ3VnhXMnFnNHU4?=
 =?utf-8?B?NWFsMTdTSEE4Z2FhWUpzcXZ4Zm82V3kxUEtSaUFnOTZkT0RBV3d4dDFKSmRU?=
 =?utf-8?B?bEowak9mSW5jZ3gralBEYUlCTjlobXdNcUtweCt1TTZDV2ZsbHJUalF0MzI2?=
 =?utf-8?B?eUZCTDVWWUQwVE1VdnQ0aGJIL2NYK1dJSG9vbFpDb3djS1RndUpqSmgvTUE2?=
 =?utf-8?B?eWZ5cVNDeEN2SXdXS0czd0huTWZFbEt5YnMzNk4xQ1hEUkRoMEpnb0VBamk5?=
 =?utf-8?B?dmlycUl4N3BpRmFTRHZUUmdTbEhlUlZyM1dMOXVqa09KeHBRU0diM2xwbDRX?=
 =?utf-8?Q?1oQbjY1u++KEOukLTKkRTZm+zG0IN5i21QDEP/wMio=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:35:00.9169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ede02d8-75bb-4aa3-5b23-08de58e97ec0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6756
X-Proofpoint-GUID: YlFBOYA1kwYpxni8a-MBfq2mpXyBMuhE
X-Proofpoint-ORIG-GUID: YlFBOYA1kwYpxni8a-MBfq2mpXyBMuhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfX27vQzf5nozMv
 ObMr6Q67SNF+OJrvMxCGmSrdMFXalwB1F3ZK4hzrRJEv6ooi+nGIa3RQ5TBJUKE1DNZCdsNR++y
 KXcR8/dutyUucNAAmBDD/25ZDWdCwTtYCHERgeuT+aRzaqaG3rX3K3mTxSIntfOMY72QD//QEnc
 gaYYBwuYNmzCLWjkX0mEvdu0Ey7gXxtdlH7BDQjQ9QRiLJdcy9L5AQiMmlvC7ZLJpC7Si1lx8sS
 qHSgdhsUTttVcj6arsIgL5RVnq8GE4wD5zPHoAwZrQhPoNxWXDBFIqJqdrJyc5FWOM0EVnbZZ99
 593CUNilPY+VGHfX7yWUJVmFedrmW2LKb//tF9YZRo2g85bD8yZN82vCqPEaTYvE0Ymaxh2N4ai
 RFyVgBmRsENhBm5eF2sUA68+VcACErS3GjGy+DpCqkxJxJBA+ooGhqMD6NwmHvrY5mXE5dQutrk
 lLgiPAOGoQWAu+Q18Ww==
X-Authority-Analysis: v=2.4 cv=F/Rat6hN c=1 sm=1 tr=0 ts=6970c7f7 cx=c_pps
 a=eFpRzQyoWvhnAo4uHDxzFA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8
 a=LS5lh7VHtsIGWKReRLIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210105
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-30856-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,foss.st.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	DKIM_TRACE(0.00)[foss.st.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[foss.st.com,none];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 07EC956FA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HDP being functional depends on the debug configuration on the platform
that can be checked using the access-controllers property, document it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
index 845b6b7b7552..8f8b4b68aaa3 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
@@ -27,6 +27,12 @@ properties:
   clocks:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    items:
+      - description: debug configuration access controller
+      - description: access controller that manages the HDP as a peripheral
+
 patternProperties:
   "^hdp[0-7]-pins$":
     type: object

-- 
2.43.0


