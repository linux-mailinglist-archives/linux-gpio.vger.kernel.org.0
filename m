Return-Path: <linux-gpio+bounces-30431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E8D1134E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 09:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6D37304F2CF
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 08:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6C93314D7;
	Mon, 12 Jan 2026 08:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kB66ScJP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8D340A46;
	Mon, 12 Jan 2026 08:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768206377; cv=fail; b=Y94tb0ormkERsIhixa/jI45qOJAKl7yh/H0O5/lZvONhBYY+9dMiAOTxprV5g0InnpLHQAFG6CVMdRrdVtCXuPMKTUB/aQs4AyTs1gwSiE1uk1jbYfCcM5EBY0g5CAt6MSIvrh+ir5X1iQoBQK0mJdfLbbVQQKAcLxWrWoV5tKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768206377; c=relaxed/simple;
	bh=sEwWJfXsVLvwj/hul9IEw+3wDilKdZkaG3ofIBawKNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k1Vw2pH8Fb+wt2IxD4OmCe5ed455MIv9/sf3ehHL8gjyedU5mqEWhF6fLH6qeZwt+D8cP51dGh9IE5EGeVujlF60WwAyq9f6aIZXSU2JHEYk9peBRrLLRxXlw1cx5+/fj/4+225s+7W266bEmITZaVFLQjNU3VYo6IlOyPonfaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kB66ScJP; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8Br9q2662266;
	Mon, 12 Jan 2026 09:24:47 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bkehfvkjs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 09:24:47 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeD2u4q+0Fn7b5bLpRbUacbOccm/s58aWQgaPD9NmR3VkvdwyGHAtDH9HsSK/TJAp9xlQ4Bh6Css/LyRzwBbdLTub6F9Ocu4yErjbPz+Mdvx3iVKG3yfbLw30120+2BizXDbs4G0j+cXm1mRm2cTRHiyDfuYQ+PJmcaIs2Q8L+kC8LYu31CLwl+2nCyF5Gt7b9STbbOsdrXdXM1DZdrWPtytsgXBNWoiBkB7U1sCFr+3e1Y0COUhPGrPQuylGbrrCGgiGZk+L4TosTVOSLzSSh/xdmLcyO1gAfIFwMVahiAsbQ9Bn3+ohVg64ch3i5WMwo6Nk+nYi728twoS2bua2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2lv3jKz8d9VgW0yEz9CuQ7DPdpsHmotlZH1gTM8Li4=;
 b=WX6GBleuUbbYFKdOxC80MMjb0gaA4m86W5nSFGS5MHg9LVIdSM/ztrUmDQCODyCoyNv5F3pqWk/tKhL/vPcvWdsM+j69OQWvzpr/XrHSgAgwF+ETNHOJ2YoXhYF3LSxgcAT0J7fTD0eQqiKG/6JVKotO8o7RWuaRlJz+49vGAisd4sfgG4A3x07AD12ghknlg6TmqSoc01aItn17bpHS7PS0Y+98hjzzerSIigIl2138hOZajMf80agS9YBKQulV9ACJCdWYl2uFXOfXhd2IHw7kXuep7paXbjL0V9090CRZSMKcGFW3TnKcsELfi+1p/TvsN+wKdFljNvzHO7QMRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2lv3jKz8d9VgW0yEz9CuQ7DPdpsHmotlZH1gTM8Li4=;
 b=kB66ScJPoudAxCHAeWsrXGbbt6tuW+ZMn6E+nncBxtBH+jsiKQ5eLvHz50zaBtQZVQKN3IxcrVkfmEgK+fj408wIwbb6KUu49T04i511szhLR164sOEKZzv391h2JMuQN/1dT6r50aEgdHAc447sSxcgAZ4/L0meLm1uVYTTJ9mEivK6MwEmFA5PPIOWswO01cbeu3B4i8qhQDczGX2N2XvXf6TqkwbKJ3rXN9w4wLm1Yqr8JY6+3jK/RrE8KVuJyLmDCo0eJ/XhXkhK1uUWgJ8YFEWVQrFSupOjptHYRkM8mG1HMCCyY2+H5vFZWhfbVKgQped9wRmZvIoxIYsoUQ==
Received: from AM7PR02CA0025.eurprd02.prod.outlook.com (2603:10a6:20b:100::35)
 by GV1PR10MB8567.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:24:41 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:100:cafe::2b) by AM7PR02CA0025.outlook.office365.com
 (2603:10a6:20b:100::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 08:24:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 08:24:40 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 12 Jan
 2026 09:26:04 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 12 Jan
 2026 09:24:39 +0100
Message-ID: <09845133-5f71-4e1a-af0f-f90ad80ed8bd@foss.st.com>
Date: Mon, 12 Jan 2026 09:24:34 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] dt-bindings: pinctrl: document access-controllers
 property for stm32 HDP
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
 <20260109-debug_bus-v1-2-8f2142b5a738@foss.st.com>
 <322e13df-5146-4dab-8f2a-6c635c82eb70@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <322e13df-5146-4dab-8f2a-6c635c82eb70@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5E:EE_|GV1PR10MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8d2625-1a18-4d71-3a3e-08de51b4080c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3YxbDJPYXNqUDZoVlhlQnZtU3Y1K0JVMVZxL0xFNUFmSEFtS0NBcFhhTHRT?=
 =?utf-8?B?Z1VaU2RaV09mYkx1bWxKNytUcjUyK1Z5ZUhva0h3c1ZVTnpBeW55MlVyK1h0?=
 =?utf-8?B?MzVkMnBmeVFWTm5jMklWMkdtZ1FzLzg0VE1POEFpajBoVE9oS1B3STVIQm0x?=
 =?utf-8?B?WlI2a0MxbjNkYXovOEpTV1BNTzQ5OWNTa1hVYTJoY1N5NHBTeDJKemV5UGUw?=
 =?utf-8?B?b2NqRjdUcHVKZ1ZBd3FRZXQ5YVRJTlhkRG5KRnBJMW15NHpkL25LTXRhNnFx?=
 =?utf-8?B?VlFJYzc3WlNGRlNvUGtkdEpBYVVpN0NZVmRkd3lDQ2lDT0VyT1BNRUNrV2JT?=
 =?utf-8?B?RTVZSXhocmxJSUZPK3Y2ZHNTRDVidkY1REpET2ZNSkc5Rzh1NU5mcjlGVkZk?=
 =?utf-8?B?YlZUUFhNTSsyY2Z3cXoyMExIMDYveGpqS0d0RXorU0s3RVBQUklyUnBwZEdU?=
 =?utf-8?B?eEwrY3BDQ1RkWFpsR2Y0N1ZMeTVTY1lCSU50RFI2dVVFalk1ODhkZDk4WlNV?=
 =?utf-8?B?aG91bDVvVVowN1ZkZmRlR2NINCtOZ3VmbHpUenkySHVaQkFwc2ZwSStqZ1Zz?=
 =?utf-8?B?NFZhUE5QY0lmUmtpWVlaQnlUTG5kZ0c0clNwRUo3UW9mNDJvZy9lN20rYXZG?=
 =?utf-8?B?ZWtoZUh5OWFkcm9HcERoRnNENkVzRDRMTHRLTjVBY3lTMFlKUUQrcDNxTnZY?=
 =?utf-8?B?VVFxdFQvbWRsVXljL1lSL0NDRUVlZEJObnZoRlJ0d2l2YnV3d3lJczgySWtk?=
 =?utf-8?B?b1UxTzd5aUtJMjZKaWgvWnB3bE5JRHp1TU9tcUkvTWo3ZXJMZGJlWUo1RUc1?=
 =?utf-8?B?NDRYNXNlUDMzNHNvblJQSGk2b2tJU2N4OXBEYU5RK0g2NUYxUm1Hc2dCM2t3?=
 =?utf-8?B?MVVhTnlFeitKWUpPemNjbzVoTnFXTHh5SlJkU2xEd3diVGYvQ1FlUTFzVUZr?=
 =?utf-8?B?M0Vpb0hndVNqMzlxWG51OFltZUZaVElJKy94VDMrQ3JJU29CdXdUQXRGSU54?=
 =?utf-8?B?ZFc5YXVGcldjL0lHUml3WWhLeWFnN3VsekFqdHEzT0UzaFd5a3Y5MWRoYVBK?=
 =?utf-8?B?RGIvU0NTVVVYT2h6Sk5SMVNHVm01c1BhNGRkak5NOEs3eW1xVmIvMXFCVEM0?=
 =?utf-8?B?QWxkV29uaUY0MHViQXZSNVZoMWE5MWQ5Z0l3N0R0T1ljUEZGNGhkYW9oNXdw?=
 =?utf-8?B?RDlyakl1UGRPekhNdXRsSkxUdEpQTzdQendpQk1TR1JIYnZrSUJXOWdaWGFU?=
 =?utf-8?B?TVdiN01hRWJyQTZQR0RrOUpHaGY5N3BYN05nZnFCT2Z2cVAxdWNqSlJmNm5M?=
 =?utf-8?B?b0wwTmpKbTVUbXcxUnBocjhGSHRKMEZDWGJnOStLWm1JVVV3NDNTNlhjcHll?=
 =?utf-8?B?amlja1AyditCUkliOFV5TERFZ3lDcjUzQnFKTm40SVV1ZXphS2dYYjZtWFEv?=
 =?utf-8?B?V1MvSW1xc1YwcUlHRHdzSW1ieDI5dDFnV2hRWjNNS2V1YzFDY3B5MjFvb2Zl?=
 =?utf-8?B?bUNpdlBwKzJJZ3BvYXVTVTVVY1RReDdWbXB4TERIWE9BdkZpUXoxYTI4YW1j?=
 =?utf-8?B?RzAycWlpOGRUV3B5YVc1ZWE1MUUrU0M1SnRlSVMwOTFDMHlscWROSldPQ1Ev?=
 =?utf-8?B?dDhpSEdYNitxUVhkZXZLWXd3VkVzQmZzcC9hYzhNWUxGQmVqREVzemhzOVhS?=
 =?utf-8?B?RDdEcjg4WlJxQXpMWHZUeUkxRERweUdValhPekNIcTdUay9VL2FzaTlhREJM?=
 =?utf-8?B?RFlaV3pZaVBCTmVwdDQzWnZDQ0JwVHVBdkswRTVNZjRiczJkc0tCYS9yckp1?=
 =?utf-8?B?ODRFQnQ3VVlRQjBLZTlnM3ZxSzNlN0NuL1VXc1RENGNPb0g3WFhMcWNwc3FG?=
 =?utf-8?B?b2JnWnRyNHZqdkhlOUM2VWFTaW14VmZDUGs5MWlJRk9Id09JR3cxMXRUZmpR?=
 =?utf-8?B?Zk5rRnpNaURZTVZ5QnRjZjREK01HWHVpdjRJc1JVZ2VoTGpJb3ZMcEY3SVlM?=
 =?utf-8?B?WkgvcWdkaUdWMEFDTGRndHRYaTJTRTlTZ25Zcmh4ZWhNcVJZRnRneHF3bi94?=
 =?utf-8?B?dlFZeTgzY0t2VFdZNlVvRFl0aHozQ0pPd09Dd2VrbGt0OFBrVkRBc3FjdnVk?=
 =?utf-8?Q?2kyous0Yj+Y0saVDWHxGeZuOS?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:24:40.3425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8d2625-1a18-4d71-3a3e-08de51b4080c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8567
X-Authority-Analysis: v=2.4 cv=ZOzaWH7b c=1 sm=1 tr=0 ts=6964afcf cx=c_pps
 a=KHLnCchuSInU2gMlOa4qhA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=cQ_HLDSLojFr3SNbX4AA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2NSBTYWx0ZWRfXxbxJ2q6BpySH
 YtMXvbGodjYdKmoX0I8rjE3kpieZWFD0Y+WAaOLtn7J9CSS/7aq9RwnIoARYR70Vb2/un1byPLz
 kADPP94N1Fa4c3PuITBuKhNaDlttvGSUnIEYonXUeIysnA66Psq2G43+iZNPfBdV9wq9vnULYQf
 ZXnZpKWfvwf9lYTwWMl4jDjfwbYx6PY+u1N3PbU5sgCW8sCmP7EoqKxhwT1Lb3rB0PELcVSKScr
 A6irLzdKU3E9FGZUqTn5OimLOt2MdUwIjf41df32Z7lAg/8TpXzKSKt0wRLhgY2434szGJTCdr3
 XYogrBjmWab3VEiBlpg/XC0Yp5gdkpEA5So+5QfeQp7rixaR+ToUaIcdMnxAybMemPD172V2PCg
 /KuPKzMcRgzxxFpyxFzSfeRtFflQOp5xurzsjquN8BLdofMk+SurEUYJpm1rnrAQqvlK2eMh4+s
 EMt68NMZ0qatEEViM7A==
X-Proofpoint-ORIG-GUID: qZtdV3xd0eBYFOlSRX9yfDb-x1_SSrmH
X-Proofpoint-GUID: qZtdV3xd0eBYFOlSRX9yfDb-x1_SSrmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120065



On 1/11/26 12:27, Krzysztof Kozlowski wrote:
> On 09/01/2026 11:55, Gatien Chevallier wrote:
>> HDP being functional depends on the debug configuration on the platform
>> that can be checked using the access-controllers property, document it.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>   Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
>> index 845b6b7b7552..75054c1e4044 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
>> @@ -27,6 +27,10 @@ properties:
>>     clocks:
>>       maxItems: 1
>>   
>> +  access-controllers:
>> +    minItems: 1
>> +    maxItems: 2
> 
> You need to list the items. Why is this flexible?
> 
> Best regards,
> Krzysztof

I will need to list 2 items (2 different firewall controllers)
for the stm32mp2x series that I planned doing in a second time.

On stm32mp1x series, only debug configuration needs to be checked
for this peripheral. On stm32mp2x series, both debug and RIFSC
(which is the peripheral firewall) configurations need to be checked.

By listing, you mean adding the description of each of the possible
access controller, am I right?

Can I keep it like this or do I introduce the flexibility when needed?

