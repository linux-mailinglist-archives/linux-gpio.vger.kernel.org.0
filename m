Return-Path: <linux-gpio+bounces-30992-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGU9C+RNc2lDugAAu9opvQ
	(envelope-from <linux-gpio+bounces-30992-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:31:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5817745C1
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D44893061D14
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F15536D516;
	Fri, 23 Jan 2026 10:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ka/vzG3G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C20C339B34;
	Fri, 23 Jan 2026 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164066; cv=fail; b=eOowaewWfuwyw/dlPaeOXDvEilwnjTicSjqufPWvsSD5MLfcjglfyBOsusbUnU7b85jHvFFGqLfAVSv51d9a39vr8Qqmug2Z2jI6ZI42pcerbJyYtvji0iu2SiCTBTVE2ulMvDYuRgL7ZU/S+5USCeXT/u8JPdIfrnsZnfWQUN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164066; c=relaxed/simple;
	bh=DZFB5BFdSEnsukeByM2WJ+F2MKP/BROtkd4zuhti34s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DmrtkLL3ZyMhfCi2QldlQ0v8784y1/rsWl7cGgRaPQchZpePrzv2CINs08UcfYaiwqJUodczdLNCy962im1Ft5YHjor2emKIZDT1radsqWiU+LGObSx/+xIHSfaf5gIIXnmWbX79Z5AdHxM8JVyTrK5uCfd/Y21w1Abi0BrFJNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ka/vzG3G; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAOALB2226706;
	Fri, 23 Jan 2026 11:27:21 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011026.outbound.protection.outlook.com [40.107.130.26])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bunggkgwr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:27:21 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBZdAExv1ELyXyUHp8cx1zxDE1UkGoRzA50kr+v7svbsCVt/Soa9rBWGBZrouH5ySOiS+znk2N5lE4Jz74TRxMvRFmaa40J/p18fHekCkIzI1JlnKEY9e7fqah4V6BWS/7sayGZOOLtZeTl4c5c20tygWM030/fvebIYxBYKHUomx9j3ozhib16MC7ygHd0ZoNdllfwqPvhmm7axt9tVddNd15OyHApufxdxznmQZaefPpmy0CYJQCn9ddlKTfC0nFj0+fJ/FMgHOru9QCjFiHqtgSygyMBHuPH02lPYzDqaQdcjYEGk0D9N4u5bv8WKd28368i8ad1puA9g/M0rXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOLE4r0ybgkKTXXlFIJ8UaMQWbIr93PBBgeK20WQGT0=;
 b=TMs+sHDqurxLiTcXLNmgaoPd+vYUIVb/YGKDI/+I2kRkmJhzIrd0RrwMHLQr7wC2vg7aeSGN3pGpxGuYrMdCK6DTRU++fsyHahgJ67vqEAajQmukdsksBm49O/0q/mnVLQ6T9gGpfv4WiPQ4ioJ3zSa+1ifiDBcE45c8KlKDLSuXn5u+TnX6SI8v0qP926fXcET7LVMTZShycGZ/dlGC6tpMtSv6j2aE3/GYFgnvtfcgF2/5MmJDgfSNYleLuEyT51q7ss6f4SjWOhyoGvXbl9b0nqKg1mt2NivBUVxIHN6LzGf9eu/WZMXoIpZuKd+uDbUHfr5ZkRklkdqLLcYS5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOLE4r0ybgkKTXXlFIJ8UaMQWbIr93PBBgeK20WQGT0=;
 b=ka/vzG3GLkKmcomEPVMQBLnADfqD0OKIh70mOUKOG+6kunzJNHIiFpdz8pPFFJCtLe1Y2O34ludNKI2HWOOAatfrJqLwTN3wUgtDxzg4oPho+BrPQDHprej4vGF0oSs+EhQ9X5urqNf/qeL2DQ6Icw/xH34g0pTpZU9przV6sp5FdHEdkchB/xCVxbTDTwOb47ZxREXpFGduBqLrRWYrtClk1beQbVq/IhhYXe3Hqh6JRYD7qrF+4gAvddUL2T2JQ9jwSiqwQ2SpH7PYAsnBX70T9PR21o/hKWOBzoY9RRif0ARgys4c862JYd1cCEn8R6J43vMJ/5bQ44DS0Wkq2Q==
Received: from DUZPR01CA0183.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::21) by GVXPR10MB8222.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:11d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:27:16 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::1b) by DUZPR01CA0183.outlook.office365.com
 (2603:10a6:10:4b3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:27:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:27:16 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:28:47 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:27:14 +0100
Message-ID: <c66f60ef-851a-4037-8233-58f0bc3d2314@foss.st.com>
Date: Fri, 23 Jan 2026 11:27:07 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] dt-bindings: bus: document the stm32 debug bus
To: Rob Herring <robh@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Mathieu
 Poirier" <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <jens.wiklander@linaro.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
 <20260122-debug_bus-v4-3-28f0f2a25f2c@foss.st.com>
 <b8175f5e-f6fc-43ff-a36a-dfb8e15230da@foss.st.com>
 <20260122232139.GA3717629-robh@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20260122232139.GA3717629-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|GVXPR10MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b3c3de-65ea-4b81-7a4f-08de5a69fb1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlZZV1U5UXhTSHRaajRLbGh0UkJtWDIyenlWc25HcHIva1dZZlJuMXAyaWxH?=
 =?utf-8?B?QjQvTnNJUHp0NktVZ2hjRzAzLzcrZEVBTlZ0M3JHWWRoU1NyV2V6YkMwRjFn?=
 =?utf-8?B?U2U2N2hQaXduWEtDZThCMHV4R2xWSFhCNWtKY3d5NXptSi9xY3lTYXlTS1RJ?=
 =?utf-8?B?RG9HOUp0bE1hanhmZDhuVzZ5Q1JkOFh5Q0V5VWI2YW41YVhtZy9ndFV2WEwy?=
 =?utf-8?B?QjllQU9pd2huOWViNUxnZDhQYWRiSUJCWWt2eTl4dVdoNXhVWnNpUEF6ZHRP?=
 =?utf-8?B?NFVuNEFlcE1mNHhyTWh6OWQ2b09MR3NuSjBkbVptbHY2VmJTTUxWYWxzMFBS?=
 =?utf-8?B?cGlVL3ZxOTl5T2ZZMWZ6TExLREFtQTZnY3pVaXdJVUpoS1QzYzNoNG95alJM?=
 =?utf-8?B?VW1oWTMxWGtCZC9XeGMwZGZDVGZ3dGxSdEsrSGtuTksrSTVNL1liU0pxS1Bz?=
 =?utf-8?B?RjJOREhoWklKV0x2SXVSNUgvWDVzNitzeStQbUJmN3pBaHZYTkNFa3Nhc2x0?=
 =?utf-8?B?Y2VmU0xFWjJ6Z1VmRGdWNmZwUlFFVnZ0Q05KQ2t5U3BTQjBnWGd0cUhibVNs?=
 =?utf-8?B?d3pyeXJVZlV4Tm52em5LTk1ydGNqbkxFVDZKMDVaOVhKUlVuWnYyVnJnSHdU?=
 =?utf-8?B?V3ppYVpodm9jdW4ydnFNMk9ZNzhja0ZLTDlQMXFLQnZUSWNkZG5tZnRNV21p?=
 =?utf-8?B?cmpsNVdCL2VlcnJtYVVHVGdSV3RKYjR4d280K1hiZkdVRmtwVUN0Tk5USGxr?=
 =?utf-8?B?dkkwZm5JVThZb0s5eVRmM0lSdXZrM1ZtY1IrbWdSdzZsVmZQMnZrY2c3Y3Zp?=
 =?utf-8?B?ZE1ETTJvczFjUGI5bzVtRU1zYnZIcDNyZDRLSGlwRDg0a2hidEgxdEp3bDdn?=
 =?utf-8?B?TjVCM2tRMVdxVTRzVFltZjZaeHlrcm1VZFB4SFBONXIzVUZraEFWS3dnRTRH?=
 =?utf-8?B?VTZLVGNVL0EwK3BqK2lvd2ZEKzRNS3dWd0VBUlVKbDQ2bW43cWhhUkdjcVpK?=
 =?utf-8?B?OXdjU1lmVjYzQVBiTGNUY3B1cXk4ZDR1VFVrTDBmOGFkNUJkdUFhSFRROVND?=
 =?utf-8?B?bk05M0pZZ0xxR1AwckpvL0VKQThxR1ZYTGhBODdjRSthckd0ZTBUS0wvYWp3?=
 =?utf-8?B?TTJlcFl4V3B2NW55R2Y0V1lsaDRETG05SjA1UGUwdmg1WmF3RzlmTU9ZaVFa?=
 =?utf-8?B?YkRBMDkyV3YvWktMbkRWSXV4UU1GTnZqa3dRTGE1V1l6THhLYXh0bTluZERC?=
 =?utf-8?B?bE9tVXVoUFZBYVpFMllLcDhNcWZtb01NenZBMU5tT2Rzb25xbFVwQ3hYVUdN?=
 =?utf-8?B?RXU3YWdSWG9GZkFPdmlmejBGWU1DRFpzS1MwSjI3UFArOUE4cy9JcEtqeUhr?=
 =?utf-8?B?dXZoTzRjUEFEZHpLMlZBbXAxc2JEV2pUVkdYNGkrcEMxQURzY25oVTNvZGtl?=
 =?utf-8?B?QjgzNmJocE8zUEFmRmVJNlIvVWtad2MrUzRlcjZZUE5zY1QrZVh0bFQrTEtq?=
 =?utf-8?B?UXlXQmlSSk92c04zdERHUmUzQUw5d3BwSTg5cDVVLzV2a3hYakFXUDdpRHJQ?=
 =?utf-8?B?M0ZTMTNPV3h4UkhPQzQrK1lvOHM1bHJsSWFFd3doYVM2UkwwU0tTMTMyeHNL?=
 =?utf-8?B?S3VubzkvbW4yTGFkeDRTeUJoekQwSXBhNDhCNFpUUmR1am40YzVHN2xPOXNv?=
 =?utf-8?B?dXB5S0plMlZKdEZqaWpQZ3RnR1QzNkhCRTI0dEFDeTZLSEdEN2hPdlVZWVM4?=
 =?utf-8?B?NWZxaDRFdk45OVJGSGZXOXlPSkVZNElZSVpwRXp5Z05wc1I3TkFzVFhzQ0kr?=
 =?utf-8?B?YWFkVFo5TG13aG1HM2VQaUkzVlkrc0cycVdIR29FNmRMWGN6VzBMeTNPOUdL?=
 =?utf-8?B?K1lSQmNvcHFwRmx1UG5oUzR0aGE2ZVZjeU4xRk9jeDlOaGtMRmZabVBRVGg2?=
 =?utf-8?B?blgzUUJHQjUzTG1XU0g3U2xBZkM1L0FRNXczTzZDUVdmZkZOTS9vSkY4WHBk?=
 =?utf-8?B?bHo2ajV2bHNpSmRHUmJHWGtnNmRBcVp4NVVzNlZyd3h4WGRyeStNdFMwUlhG?=
 =?utf-8?B?VWUvMmtiOWlob2dpMGhrNkdjNmxTekh5QUlzSmZNNEYwcExOUC9NbGV1dXJq?=
 =?utf-8?B?aVFMeE4rU3p2enJEc1BmSElESzc3aHE2RGVhSUswY216OVM3THJCVVVpY09F?=
 =?utf-8?Q?q4GZ79tsiUgZAFZO/4Sq8GU=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:27:16.3220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b3c3de-65ea-4b81-7a4f-08de5a69fb1e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8222
X-Authority-Analysis: v=2.4 cv=VdD6/Vp9 c=1 sm=1 tr=0 ts=69734d09 cx=c_pps
 a=eE+qLHXDGUwwSs2WNjMcQQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=8b9GpE9nAAAA:8
 a=iZZOVQa0wO8LDaThZ-YA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 5E3YeN7SsctKCfU2v5djwDqJu-tFQDNY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NCBTYWx0ZWRfX8g31ASTlhpF4
 AhiMvxN7Oi1r/oS9cUcino4pYtF/dxOv2se528e5Tfap47kMy8zmGwvJvUEytTY0eZLAR9AQHxd
 kbTa8sgmy+S28OWTKy/mfR3PxNa4kAY+DakNhggkes/gTsCobbwYZlpd2XPKXH2tnql6X2TMLQm
 Uf1Ft/MPHiNn41h9G2f/4WahFcsTPo6xMg7hFZ2sE9RqlykgeATvyelZ5l/zKHusvX0A7WyZH58
 UeF74cEMgq2LVdXXYdfff0alEkmZRtnDI8zbUQhUq260dvbFk+eymd7QWpekSRsBMQ77nYJp0lD
 UOzII3x6ASBUE78c3UsBgN+DIYJSUMTu5EIwXHDmho9w70NdE+axuoYQ0ZOBkrD9rnTkTY2otzp
 NpvyRbv1L3ELh0TUGvyjKUUPrrXQj61EiI0KTLiPln5MPmwL18BSn+9mA12gyMpun8IsSh3J1hx
 QkVshAjVhS1G0RaL6rg==
X-Proofpoint-GUID: 5E3YeN7SsctKCfU2v5djwDqJu-tFQDNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30992-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com,lists.linaro.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,2.252.95.176:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	DBL_PROHIBIT(0.00)[2.252.41.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A5817745C1
X-Rspamd-Action: no action



On 1/23/26 00:21, Rob Herring wrote:
> On Thu, Jan 22, 2026 at 05:22:21PM +0100, Gatien CHEVALLIER wrote:
>>
>>
>> On 1/22/26 17:19, Gatien Chevallier wrote:
>>> Document the stm32 debug bus. The debug bus is responsible for
>>> checking the debug sub-system accessibility before probing any related
>>> drivers.
>>>
>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> ---
>>>    .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 77 ++++++++++++++++++++++
>>>    1 file changed, 77 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
>>> new file mode 100644
>>> index 000000000000..57f01d301e75
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
>>> @@ -0,0 +1,77 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: STM32 Coresight bus
>>> +
>>> +maintainers:
>>> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> +
>>> +description:
>>> +  The STM32 debug bus is in charge of checking the debug configuration
>>> +  of the platform before probing the peripheral drivers that rely on the debug
>>> +  domain.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - st,stm32mp131-dbg-bus
>>> +          - st,stm32mp151-dbg-bus
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 1
>>> +
>>> +  ranges: true
>>
>> Maybe maxItems:2 is preferred here, no?
> 
> Wouldn't it be 1 as there is only 1 range? Up to you whether you want to
> limit it or not.
> 

Hello Rob,

The Coresight STM on stm32mp15x platforms needs to access the stimulus
area, leading to the implementation of 2 ranges.

I'll change that for V5, I don't expect more ranges for these
peripherals.

>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
> 
> Should be dropped?
> 

Yes, no point of keeping this.

>>> +
>>> +  "#access-controller-cells":
>>> +    const: 1
>>> +    description:
>>> +      Contains the debug profile necessary to access the peripheral.
>>> +
>>> +patternProperties:
>>> +  "^.*@[0-9a-f]+$":
> 
> This can be: "@[0-9a-f]+$"
> 
>>> +    description: Debug related peripherals
>>> +    type: object
>>> +
>>> +    additionalProperties: true
>>> +
>>> +    required:
>>> +      - access-controllers
>>> +
>>> +required:
>>> +  - "#access-controller-cells"
>>> +  - "#address-cells"
>>> +  - "#size-cells"
>>> +  - compatible
>>> +  - ranges
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/stm32mp1-clks.h>
>>> +
>>> +    dbg_bus: bus@50080000 {
> 
> Drop unused labels.
> 

The "dbg_bus" label is used by the child node in the example.

I will remove the cs_cti_trace for the example.

>>> +      compatible = "st,stm32mp131-dbg-bus";
>>> +      #address-cells = <1>;
>>> +      #size-cells = <1>;
>>> +      #access-controller-cells = <1>;
>>> +      ranges = <0x50080000 0x50080000 0x3f80000>;
>>> +
>>> +      cs_cti_trace: cti@50094000 {
>>> +        compatible = "arm,coresight-cti", "arm,primecell";
>>> +        reg = <0x50094000 0x1000>;
>>> +        clocks = <&rcc CK_DBG>;
>>> +        clock-names = "apb_pclk";
>>> +        access-controllers = <&dbg_bus 0>;
>>> +      };
>>> +    };
>>>
>>

Thank you,
Gatien

