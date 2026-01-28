Return-Path: <linux-gpio+bounces-31246-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC6DBAYdemlS2QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31246-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 15:28:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 882DFA2C3F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 15:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8736305148D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970C026E6F0;
	Wed, 28 Jan 2026 14:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="S4SOxhCq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B20E241663;
	Wed, 28 Jan 2026 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610265; cv=fail; b=p6kPrK/q7AfXAYC/R8vor2Fyc7QLjf5exRcb3T8i30vscPSRFscCZeNo/nAivcMdUOcmuND4j4gQWyyneKYpStCaIJgGkBk9Se0Hy6EcPsgQ1rBlRhvJDwVTbrgoUhCd1ksJU8S2KAcMadeTS0R+a35tossNtzW47QAO5H5Cre8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610265; c=relaxed/simple;
	bh=9tdOmJvmDM68d3efAio4oZSWIrKs7n0iKmXr5x2C3i8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=URiIygbSXPZKfkd3nBJpXuoG/rajuIGVUDGt1u26wdP8A766rjfvUKZnMrF+t0IPy4GrDDH4nNc3Gdx4wmsX46lCHLBZImHhf5Hv3u5BvbmielA7fF0VTGCRT7GOyv66u/wgjSmfOt53C26oh1/cGZqC6x1Z2fy+IXFhzFq2Cyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=S4SOxhCq; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SENwAg1879419;
	Wed, 28 Jan 2026 15:23:58 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4by7qrju57-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 15:23:57 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y50j7fJnVPG6opPbeTnPxhQj/DapL6C4Br+7/l9yBBgMIUyJo628jmV1v3Q02V6ztLN9VTpT88WabQwp4WK8Ng6fQp0bM1vmcRizn8vlY3i07150N2xvCRIJhyMOqHJhbJtx1A/y29+EfN6idEr3eKcshDhvWn8XwnPi3ScbWm0fGPLM9O51ohYW2LgojRTU2POjmSidMyNuyUy37uxt6NUvibVYAlFlBDiYPzn6yINdzGiiMXNRia83MvW/tF2KDfOJ9+CNseuDpNpb/NuWmdXLmWDIupKnENjvunFd89tm1Oe7lehPa1ULoCoWK/tuoWxGCB9ZPM4zdDqFB3vSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSsByna+3EOBAQ4u24lZoWXeWlHVuaT6+ZzPeUT93Os=;
 b=iSdf58eGYNfSPYZK6wYKE+9ZGzyrSK58/TGMz0lCT4XS2wJwpsqq8KG6mPBb1Lm9QCCDLJgJvEWMuX51w9pZVvqT3cuFk/zWjFtljJb5cOHdXsAeNS9zuIkJCbtH6bEUljlMvpEz79uLWyp+/6myFnxhhwyxWx8A6kT2wOPYvAl3m73eERnV/8jsf1Hp8mcgA54e4G9Cb7UXrFyXbcrNUU+zLJYKafO419RyGVKDOEJd2RXh5GPKfCS2qlGlIT9T2laGd3zNEM4ikaLi9oBzFBouCQVKAqtMmJ2thbe/f5bg6rFVZ7PtDUsXnuKklLzicbJpscZJQOflzpHwOrScdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arm.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSsByna+3EOBAQ4u24lZoWXeWlHVuaT6+ZzPeUT93Os=;
 b=S4SOxhCqYDyjT55nTnwDuMvctBWKvB/gMx/4WLr1OVoCHtkKxKbpdxsSKQU1t9qJDiuPWNGwUQyiLiICaEwWSTvaApPmNC6nDWPjgPBz5DQ3FQ8gnM2sweq88jVxb2jz0b1T+5itRR0v1FwmFoSoK1VvCkd5DTM9tPgFxR8I8o3EmDCkI5bvD+axAEXTr8GOLvu5e3QMLfxQF12GqIUn3Qyu39vuYOWQ5NQsGbTzH69ICrpJavm7y76FjUSGq1t4LhAN9cIQnE55dKaVg4LzrJLAaWru1ub3afOyiicxFgoRl6AO3YLQb/3cEXdEPbqd0fJW8Nedl8MPyXfqJEpXBg==
Received: from DUZPR01CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::16) by DU0PR10MB5172.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:344::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 14:23:53 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::65) by DUZPR01CA0071.outlook.office365.com
 (2603:10a6:10:3c2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 14:23:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 14:23:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 28 Jan
 2026 15:25:34 +0100
Received: from [10.252.24.160] (10.252.24.160) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 28 Jan
 2026 15:23:50 +0100
Message-ID: <089559fd-3c9a-4ff4-8732-bb23fa907be8@foss.st.com>
Date: Wed, 28 Jan 2026 15:23:45 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/12] dt-bindings: bus: document the stm32 debug bus
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
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
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
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-3-90b670844241@foss.st.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20260123-debug_bus-v5-3-90b670844241@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|DU0PR10MB5172:EE_
X-MS-Office365-Filtering-Correlation-Id: 00396c4e-7e4d-4f27-1ed2-08de5e78dce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2tZL0x3dW1rV1RsK0plMEViMU54K3k0WS9rUlVuclZwbzdNMlhIRTQ2WFFP?=
 =?utf-8?B?NENTMDU1dTlSeHBMWno1d082V3VUeVVlTGdiQklvYnovbDVhbnRKeHJ5akFV?=
 =?utf-8?B?Q1hKbWRVMTVHMXBsd3MwUy9aaGxxdHg3eXYrb1FHSHVOSGhTUzROd0xqVENv?=
 =?utf-8?B?Yi9QdnN4Ym9rcTB0WkdoK3NtRzlFRVp1ZGJobUtWMFlkY2JGTG5TekFadEs0?=
 =?utf-8?B?cE1wZE1UNDlGU1BwazlkQnJiRkxITHRtWlo2SmVOWHFMa2VobWRjeXFPN09R?=
 =?utf-8?B?K2hndEZWQ0V6SHpFc21JMlhpR2lMNnJqVVg3MUtaWjlwcVpHWElGTlpNTjZ2?=
 =?utf-8?B?bFFNZndzM083TjVSVDI2RkF3aTVkNzlHeFJ5RHBhUE5pQjNucG03UFptL1Fz?=
 =?utf-8?B?OUg5Y1J4eWllRFhLUHI1MUZRaVo3Q1ZmTFNJMlRnYXU0VjRIdmdNc05TVms4?=
 =?utf-8?B?RHk3d1k0UUM4dWNxeFRkN2g2dllXblV0TGVMcEc1MWU1SnNpekVXV2NtSC83?=
 =?utf-8?B?NXk4RFlHRkNnUzlmRXdVR1BTcnVSWWVMVDR1T3BFRC9FK3VMN0JHV2xIYTYz?=
 =?utf-8?B?TnIyTXRxZ1VpbGF6UzdHQ0dxMElyOTRPVFVsZnQ5M09GR2FzT2NqQnpTcXJV?=
 =?utf-8?B?L0pZTHBycmdJL3BxNXUzQll4OGtxRzBpNWdicStrWG1HRms2WTAwcklsOHVy?=
 =?utf-8?B?NUVxOVk5bEJyd3luZmlTcDBwazFweHVUNURnSm9wRXhyMlMvZzFsOEk0UlJM?=
 =?utf-8?B?MER2Z3JmMzBKOXJOd2xqalFMK2Uyd1IrRkN4UDNBQW5ZZGFZYngvdnBKL0x1?=
 =?utf-8?B?bXNBUDhTNW1qaGVtUXlHMVptTDFCaUd3ZEduaE54S3Z4ekREaVRxSzVIRlVW?=
 =?utf-8?B?SXQvNGd2MklYT3ZUaUJMb3hIUWNpRzJCZnNpNmZjb0I4UlBySklORElmV1BB?=
 =?utf-8?B?WEdqZEhxRis3b1RRMk1DdlJmaXQzQzJUZU1meEdzbHE2VHlaSklydldQWWtY?=
 =?utf-8?B?WmVQU1lEOXh4TFpwbUhiL0JxS05KOTFtZGd0dTB2N3lvTTdVQTZNYklDOG1N?=
 =?utf-8?B?dGxnKzhCTk1TcUdZK3BMZXczZlU0V3hRb284M1Jra1hwcmtVZ1ZZaG9maWtE?=
 =?utf-8?B?TDBENGE2WU9kbGZnb2JmMFhmellxczNYNWxZRW9qTXRXcXhzYlUxVjhCRHVE?=
 =?utf-8?B?TEpwc1JTZ0FtM0FwNk1Ua3FCZ1RucmRJdDZqaXlCM2poYTgvWmxDRGlPT1V3?=
 =?utf-8?B?Yy84S1d5dHpqZ2cvNTU0R3R3NjRheWxXakdEMzJ2a09EUjcyZjAzY0ZoZDM1?=
 =?utf-8?B?UHhhMUNtUUIxS3h4TEw5YVMwQ3RvQVZGZlFjVHNzeEcyTlh3UUFTdUZJOUJz?=
 =?utf-8?B?NThHRzJUQnI1dTBDSmlXVkdOc2xPNEoraVdnNkJBRDJiTWFvVGhJbjI0c1Nj?=
 =?utf-8?B?NHg2UVVUOEZwNUV5QVdCcXZWV3kwanBxNGZKNjNpNitHekQ3Q3d1SmdzN0pM?=
 =?utf-8?B?azI4dUc5eU1OS1QvRXg3a0ZPMzFUYkViU05mTmNBV2x0aURzTWJ2OGZMOGgr?=
 =?utf-8?B?NXIrWWppeSs1V3FtWS9IT3R1dHFaVFJDYTdmLy9zQXhFOHYvWDQ5L2Ixc2tw?=
 =?utf-8?B?ejBkK3BmMm5tL3FzZ0VyQmZXenNDenQvNUFGWkhuT3V4V3I4ZGRNMVVIY3F5?=
 =?utf-8?B?cWdlQnQxTTczVC9MeXJONU9zVE56clBqb2pCWmpwc3QzeTNvMkxqYVZNM0g4?=
 =?utf-8?B?RmpWSHEyZ3AyODdwVEFnV28rODdweVJITE5FeVR5Zld1MGhHcWNkcUozN0dj?=
 =?utf-8?B?MWVjTnVaWWlHNXNwdFdSTVFZSGFNVld5aGpZMm9tWHJnQnRlR2RadllzdjRm?=
 =?utf-8?B?UXpKc0Roa2xpbzNHR2taYWFiOUJyNlZpdjEzTnBqbjAvRmM2eWVZcU5CdDg2?=
 =?utf-8?B?OWdwdXJkYnJTZGs0QWFQQlJFVXJwcDB6a0sxcS9oakREekpZS2RxTTRBY1U5?=
 =?utf-8?B?ZWYreVJmNkNScU1OMDRHbHBjMjE3ZENRWE1EWlJHc05VUmRmTzRveTZNTk1q?=
 =?utf-8?B?ZUkvYjl1VTRLM0g3b2ZRcU5jVHRxNXQ4azdFWU9yQjNoaStSTFJDZVVhOFJW?=
 =?utf-8?B?eVo0dUhKK0V0b1BObG9zakxYanVRUU0xZjRuaHN1MWZaUEcyWEZTcUZ5ZjMw?=
 =?utf-8?Q?ZWQ3VbKr+x/gfobF9k3A4hfKh+xxXdvdqpysEqteWu9c?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:23:52.7010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00396c4e-7e4d-4f27-1ed2-08de5e78dce3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5172
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExOCBTYWx0ZWRfX7qvRay5fbKSU
 Vmof64jd4f6GrZbx67ccNBgJr1n+cLtdHZwD1SFLnMvncwBny9GcdIfNkbKaRCeRyzaF4HTczKt
 q8rzGchz68Px0St4q7Obf35+nDSw3BsEDhR7CLvqNZpDKzyQQXH9U63qGqverQf32OjfKAMwmB9
 XOgJw+vF91Iw7k33X3b7tMtQl4jzXbCT0HEr1gA6x9T/+dDOK5AE1CUpmUMTJPmHltDoNEfbRAP
 gYFTBIcMAp7KojaEAc7FJPHPVj5g+1DYN2JG+AdHKXqLGTJadpTA81+RfuH4SQBJo1GCmtK60mD
 ECDfvYRwRsI32BXFm8a/HwvrBq7RezTeIv3Cc+EpbizQyiiwsWPTgPoCEurG3+bXdsk+8o7O7rW
 vjmSfULScJ2Bt8L0dCm1g3KoPjitBZXyr57Xww46xMtyRaa7YHFn9MeIhdxW+I6MTaE2dIgvBQa
 +rAnt7RwFjf7bRsZxjg==
X-Authority-Analysis: v=2.4 cv=GrJPO01C c=1 sm=1 tr=0 ts=697a1bfd cx=c_pps
 a=u8ACBDucoOS8YlAhSULG+Q==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Zux3bmLXDHQA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=8b9GpE9nAAAA:8
 a=kNDfFFd5X_yhIQaZrEQA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: KKgZwB2jAHHxXd8f6Yl-Mqiw8pLQtG1E
X-Proofpoint-GUID: KKgZwB2jAHHxXd8f6Yl-Mqiw8pLQtG1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	TAGGED_FROM(0.00)[bounces-31246-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,foss.st.com:mid,foss.st.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	DBL_PROHIBIT(0.00)[2.252.41.0:email,2.252.95.176:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 882DFA2C3F
X-Rspamd-Action: no action

Hello,

Does this binding file satisfy the feedback received?

Thanks,
Gatien

On 1/23/26 11:39, Gatien Chevallier wrote:
> Document the stm32 debug bus. The debug bus is responsible for
> checking the debug sub-system accessibility before probing any related
> drivers.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>   .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 76 ++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> new file mode 100644
> index 000000000000..6c74433efbe3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Coresight bus
> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +description:
> +  The STM32 debug bus is in charge of checking the debug configuration
> +  of the platform before probing the peripheral drivers that rely on the debug
> +  domain.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - st,stm32mp131-dbg-bus
> +          - st,stm32mp151-dbg-bus
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges:
> +    minItems: 1
> +    maxItems: 2
> +
> +  "#access-controller-cells":
> +    const: 1
> +    description:
> +      Contains the debug profile necessary to access the peripheral.
> +
> +patternProperties:
> +  "@[0-9a-f]+$":
> +    description: Debug related peripherals
> +    type: object
> +
> +    additionalProperties: true
> +
> +    required:
> +      - access-controllers
> +
> +required:
> +  - "#access-controller-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +
> +    dbg_bus: bus@50080000 {
> +      compatible = "st,stm32mp131-dbg-bus";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      #access-controller-cells = <1>;
> +      ranges = <0x50080000 0x50080000 0x3f80000>;
> +
> +      cti@50094000 {
> +        compatible = "arm,coresight-cti", "arm,primecell";
> +        reg = <0x50094000 0x1000>;
> +        clocks = <&rcc CK_DBG>;
> +        clock-names = "apb_pclk";
> +        access-controllers = <&dbg_bus 0>;
> +      };
> +    };
> 


