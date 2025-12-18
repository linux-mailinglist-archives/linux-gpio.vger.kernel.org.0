Return-Path: <linux-gpio+bounces-29740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71113CCB7B9
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 11:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BF7530A9240
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 10:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DA6311C15;
	Thu, 18 Dec 2025 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cJmp9h4H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B952244687;
	Thu, 18 Dec 2025 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766054747; cv=fail; b=XZqMGvdr8ns6hdz9TymAVjNhieiqNvrQxsL//zYmjtjB6qaiZ9CTyoGo3kJPztv5JSqztrNbOGlsqnYQ1BYIDCVbcRuwSbtS2cy6n29vmVntqFCAY+0R2p+aU9ZBbpUoi4iHPEpCzmhTd1o5gkaf8Cok1ryIocrpHFsLyuQ3geQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766054747; c=relaxed/simple;
	bh=e59ikCxB+qP/3ps7GDnTUUMvv56MG/Vyc9DNIkBYEMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y8I+gGNV5z9P6qdjM20icsZU7kdqbTB/QGHIaRI+olH6dv2133o+mXkTQM4YHfJI94OeJK57ReKVM80c1YmN7/h77sZm1xMwk/k6E3+zn1ZbEwXbBCB3iLNZBC4YBymcHl8Ig6stEZ28JBpD8/P57yy1EAfCD+qgRpS4orxviEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cJmp9h4H; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIAi40v2124646;
	Thu, 18 Dec 2025 11:45:17 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013061.outbound.protection.outlook.com [40.107.162.61])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b3xb73xuv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 11:45:17 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clKciOaXfynuNTmK0GU/9pIVgenBtSMLZWJg5ZXG/UtdjF3iZrOeflobJP23Tj7/IketdEa0lNmAHWx4QwywhZBymmRojc9c4IKfUl+f7QgW/NyIZLFfombZww6oitStJwBzEPHFgOWVBQhVyoRdiTZ89T2rdlBZbKlGEucBJ/atLKUewkK9FlUjXEdmOFu1iWnd+dZyVib81YhhjnpHs/hBN2VdNWUwNsU92I7dWAwrO2u1NfE6Kg+4Gw0glvPxXUxS0ZWT/NACkDdL89B0UoGEX6KK0X5cs6Qb5fl7cQchX/Pueroai+Ew0PdktzF6W7QfGadIIm9F3GyMgZ7shw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV/MF3Q4sG6PCEjbsBMobGqfsFYm8F1ojMI4fPO8Np4=;
 b=N8BOqj8QBVvTlTZ+LYhi1EvlTXjeSQbbjk0pmVzlTvkrnJzD3wMs/F/gvSmDLOGJVs3XcJ2myDM/SJtz9/+F6R8JcupmgpzB+fW+VJ7Rt2KpCmyjk/teK3qihgrNSAOrWJi5HyKf0yIvmYgY89XuobyaCkoPBMlJPeWpKWfpjPy9xlpQND7N9rby/b+WfC0Yz3LV5Gz+0hF1+TJ3HmYfbvJS8m3D6LlVJ5G3dFwazFK6dZ1PS+1F4iAXdzB8UGuEFlf+9NzjGY8Hf0c4O9aIr8JCrxg3/DO1YwfFc0y4dgug6Lm+i8pCrTpbduCjATFNN7q8U42Ucb0PymNZpcmXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV/MF3Q4sG6PCEjbsBMobGqfsFYm8F1ojMI4fPO8Np4=;
 b=cJmp9h4HfToTbJsRHx6aEk0TBZ7BNRwN+EA2pxMyLZTJ6h3zOTGuqWb+f9vi4Rk1Kl8Ie06JIhUDdVi/os5Bj7u+mrwuIMeWcwhxMLMqeJ4ANGWByOA0U+iwoTpAKCQXiz88pk3ikcq3nX5vamx0R9EWyDYKt+04bDjM6SD5U2MGBjo+byAx+HJdRf+u7qVVuxm530zM7BPWoMhUv5zQ2XAz+u5fWKpp5DejREmKmLECBKVgpng91CrsJZ1twrZHaq4g7llPoytPjrQOFQ1UH0s5Jxn1ioMiPt2QAGIpzhPID1uykMUoK0U5ohcG21RRX1ZRgsNtLICIN3mEBGX+Mw==
Received: from AS9PR06CA0156.eurprd06.prod.outlook.com (2603:10a6:20b:45c::13)
 by DU4PR10MB8513.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:561::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 10:45:13 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:20b:45c:cafe::d8) by AS9PR06CA0156.outlook.office365.com
 (2603:10a6:20b:45c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Thu,
 18 Dec 2025 10:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 10:45:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 11:45:57 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 11:45:11 +0100
Message-ID: <86f7f157-d25f-48cb-806c-c8dc914033f1@foss.st.com>
Date: Thu, 18 Dec 2025 11:45:10 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] docs: driver-api: gpio: generic gpio driver over
 rpmsg bus
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <linux-imx@nxp.com>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <20251212194341.966387-4-shenwei.wang@nxp.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20251212194341.966387-4-shenwei.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019C:EE_|DU4PR10MB8513:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a586b06-369e-4814-edd9-08de3e228634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGZKMURJVExocnRqTEl2UmVxVWd2VlNIdDVEcnBjdnpGRE5WK2tLL2RPbXh2?=
 =?utf-8?B?L1hJVEtGUTFyemM4aU9VcDVnd0pZRy91ZXlvd0VET3VuY0p4eXdtN05WUVMz?=
 =?utf-8?B?Z3BvRDJkRFdTbkJKRzdRY2pxbkRFV0VhUnpnaFBpdEt6R1VmT2M0UkhwQzFm?=
 =?utf-8?B?YjRVQW5OS2FSeWRkYy8vbmQvUTZURE80bUNVY1Y3d0szWllSUktrTFhwbXBu?=
 =?utf-8?B?VkJPdkQxYzhyZVRwZEh2UkhLeXBuQzEzcGtHbmorSy9DTU1qSmVIOXpYT0lr?=
 =?utf-8?B?UmZxb0Zwckl0M3MyMGdyNWJJYkNZK28vZVFZaVE2dFI1eUJJc055Uy9MWWZ1?=
 =?utf-8?B?NU1QUkRVaUFYQUVFZnZ2ZG1GL2dPSUFSRDNmUGVwb1FoYkxXK0FYcVFHalBj?=
 =?utf-8?B?aHd0c0szT0F6THhrMnpkSlVpOEFQY2xCN0RHSmUrR3JVL2I2b2haQ0JacGhO?=
 =?utf-8?B?QngvMHY1cXpvb2J6NFY0RGF4SExDRGlxZ2lwS2R4Ujk3eWJvbmZJc09RMjUw?=
 =?utf-8?B?djM2R3p0ZGgyc1VLaWlDMlhjR0lCL1p2V25DWHloMjdIRGpZR1ljR2U4ekls?=
 =?utf-8?B?U2lMclk3NjlDWUFQOVBLK3huK0JFM3phQXVrZ3ZqSEp4dGlseUdmZUtLRFNl?=
 =?utf-8?B?ZWFQbUZIcVM1ZFg4TVZzcGtOYi9HaUYyalc0MlJwVGwxK3RKWkQ3TGZuZjRE?=
 =?utf-8?B?ZFY3VENkbWdpNVBIYXlQM0dnU04xNHlBUEhjVG8rd0ZucDlzc1QybXpwVDVK?=
 =?utf-8?B?VExEVUJ6MUtkVndZN1JSMkoybGxPdStxVWljYVhXamFscW9RSldNNGl1b1B3?=
 =?utf-8?B?TjE5dVMvSkpSU0p0NDk1TkpNWlZRWkdET0lya1VOM2h5Q2lZbElHclVHS3p4?=
 =?utf-8?B?WjhucnF5M0hLRTB6U2N0TTQ1ZzRJS2trOXVCWXljWW1rTjdkZmU1NktSdFhW?=
 =?utf-8?B?amNFQUxESjV4bWZZcXR5OVU2VVl5RGh6dW9aYld1OFBTWGxldm92RVBINTk0?=
 =?utf-8?B?RStoY05sWmJyT2JEQ3IzR2JMcDhlOVRTcDRpMXBsVDZxVkM3ZThMVVFqOTA4?=
 =?utf-8?B?UEdSMDEwdFRHYXhKM21ERUN5MnpMUGsvalBhRC90TGMzQ1Njd2IvQkgvZXM3?=
 =?utf-8?B?ZFJhMnJZYTZDdUcvbEFrTm1qTnhIbzVldy9vN280KzFZRXhvR1dPMkl0VmFC?=
 =?utf-8?B?S0N0ZlZWMGNNTU50RHhua3VIL3NvN0xZTFIzekYrNVREMHJEdGlmSEdpeVlU?=
 =?utf-8?B?S1Ezcm1iVmhBSEN4ZERXWm1ibnZKeDk4NFlISjNKbEs5bll0NW9xMm1mMjF5?=
 =?utf-8?B?MHNOME1uSUNPWDNhVExJVk02Tm8ySXp4aUltTy92WHBGZ0NwSVlydU56Uzk1?=
 =?utf-8?B?MUFEakloZjFISUs5cFdYbkxXVmR5NndZR1doRnMxUDRmWWgzcWdhK0RoYXJT?=
 =?utf-8?B?TXlBbktYS3hGL29nRmQ2M2V6WENNUkVMalVhRXhHNGtBSTdPMG0vN3FBS3Zr?=
 =?utf-8?B?Q05RUy8xRDBEZE1HcUxFTUx4bW1PUGRETmFqUVJKSnhCUFgxc20rQmMzTktk?=
 =?utf-8?B?eU1sNlcvZG1ML29nTjE2andZV0JncmMrQml1bmZ1dGtEQUptaHNVSk9PN2pv?=
 =?utf-8?B?d0hwRzEraERLY0hVeUtHcFl4SUEzalJvS3NMZm92V2xSTW1vU25mSDJUSUF2?=
 =?utf-8?B?RWtSU2tQN2YrdVM2WmhSZzFqNVg2OFVPR2xSZ3h0bTdLQXVNREtvWXZNcklR?=
 =?utf-8?B?Y0p5QUlnZnRxQlVOV01rZ3JpTWdHTWpaUGxmZW1KWW1NaW1xVm5Oc3kzNERD?=
 =?utf-8?B?NzlvWHN3dSszRXNLUmFITHRsRHp1TXJ5WEVuQjIzRi84OUNIZisxTDVBYmIv?=
 =?utf-8?B?ZFpmdVo0d0U0bmhZQ3Z2RmFaSkhDbjhMTWpRRWZqRVJDS0x5WGZ3L1VidHgz?=
 =?utf-8?B?cmV0cyt0aUxzcWpHbWI2L0RYV3RyNGJ1ZWU4Vk1VMldBb2JWbUpjMktwT2Rp?=
 =?utf-8?B?RjRwSmlSTktZMEJJTXUwYVE5WDhSc3FrTnZBMTlVMytwc3dqQmJUZDhXMlRC?=
 =?utf-8?B?RjVRZ0NZTGg5ZzFYN3JWaVk5U2dRWEt5cjZiSC8rcldoQTRSL252OTNMK0Fq?=
 =?utf-8?Q?+db9t2ngeQFzjxRH6CEPMW1iU?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 10:45:13.3758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a586b06-369e-4814-edd9-08de3e228634
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8513
X-Proofpoint-GUID: 8oxAEIlomwSxT18_Ycf0nY80LrRqgDuw
X-Proofpoint-ORIG-GUID: 8oxAEIlomwSxT18_Ycf0nY80LrRqgDuw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA4OCBTYWx0ZWRfXz+e3putZKuPP
 3nIJsMHfOFyxy1GrFLjGJ+GP2XPim+w1smy9JYDRMAfXHC6KxO62p4cNKvXaSQ86WJFhP+Pr2Gw
 +W5jufAJg01OoNMSiQDJA7/pjnF7fpOjCmNA5e0htQRDYSvLJhExJ8U/KPAGR6+kWC6vUlbsmOi
 /TuPULC+t2bcTkTT8VHH1zBuygmbS3jcwCRyAiKeaozCSNURDG9kmeAdjyx2uw7350S3UyY2KfZ
 c1AQ/fSOjY3Djse3LPdkYcmohgk/mZKWu1XYQvvlTZUAcdO87KXd4TJjl1WNpN6oBcLgMk+5+ZG
 pSug89yAwYWwmjNs100zeyoZehQWkMR6tgKLxFvit2EnmPgdWU+O1Y4bvF25A+cG5ZCJeC08b3A
 0elsfSubx3xd/TNqP7wIaHrOy++fbQ==
X-Authority-Analysis: v=2.4 cv=NZfrFmD4 c=1 sm=1 tr=0 ts=6943db3d cx=c_pps
 a=ryZca31HZVFZanq5R5fIDg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=Oo59olN8hpwiS3SpakEA:9
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512180088

Hello Shenwei,

On 12/12/25 20:43, Shenwei Wang wrote:
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the cores.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   Documentation/driver-api/gpio/gpio-rpmsg.rst | 232 +++++++++++++++++++
>   Documentation/driver-api/gpio/index.rst      |   1 +
>   2 files changed, 233 insertions(+)
>   create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> 
> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 000000000000..c78d10a9a85c
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> @@ -0,0 +1,232 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG Protocol
> +===================
> +
> +The GPIO RPMSG transport protocol is used for communication and interaction
> +with GPIO controllers located on remote cores on the RPMSG bus.
> +
> +Message Format
> +--------------
> +
> +The RPMSG message consists of a 14-byte packet with the following layout:
> +
> +.. code-block:: none
> +
> +   +-----+-------+--------+-----+-----+------------+-----+-----+-----+----+
> +   |0x00 |0x01   |0x02    |0x03 |0x04 |0x05..0x09  |0x0A |0x0B |0x0C |0x0D|
> +   | ID  |vendor |version |type |cmd  |reserved[5] |line |port |  data    |
> +   +-----+-------+--------+-----+-----+------------+-----+-----+-----+----+
> +
> +- **ID (Message Identification Code)**: Always be 0x5. Indicates the GPIO message.
> +
> +- **Vendor**: Vendor ID number.
> +  - 0: Reserved
> +  - 1: NXP

These two fields above seem useless for the rpmsg-gpio. Is there any 
reason to keep them?

> +
> +- **Version**: Vendor-specific version number (such as software release).
> +
> +- **Type (Message Type)**: The message type can be one of:
> +
> +  - 0: GPIO_RPMSG_SETUP
> +  - 1: GPIO_RPMSG_REPLY
> +  - 2: GPIO_RPMSG_NOTIFY
> +
> +- **Cmd**: Command code, used for GPIO_RPMSG_SETUP messages.
> +
> +- **reserved[5]**: Reserved bytes. Should always be 0.
> +
> +- **line**: The GPIO line index.
> +
> +- **port**: The GPIO controller index.

The description of port and line should be OS-agnostic.
The notion of a GPIO controller index makes sense from a Linux 
perspective, but here you should provide a hardware description.
Additionally, I suggest reversing the order of port and line, as a line 
is an instance within a port.

Suggested definitions:
   **port**: The GPIO port(bank) index.
   **line**: The GPIO line(pin) index of the port.


> +
> +- **data**: See details in the command description below.
> +
> +GPIO Commands
> +-------------
> +
> +Commands are specified in the **Cmd** field for **GPIO_RPMSG_SETUP** (Type=0) messages.
> +
> +The SETUP message is always sent from Linux to the remote firmware. Each
> +SETUP corresponds to a single REPLY message. The GPIO driver should
> +serialize messages and determine whether a REPLY message is required. If a
> +REPLY message is expected but not received within the specified timeout
> +period (currently 1 second in the Linux driver), the driver should return
> +-ETIMEOUT.
> +
> +GPIO_RPMSG_INPUT_INIT (Cmd=0)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> +   | 5   | 1   | 0   | 0   | 0   |  0        |line |port | val | wk |
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +
> +- **val**: Interrupt trigger type.
> +
> +  - 0: Interrupt disabled
> +  - 1: Rising edge trigger
> +  - 2: Falling edge trigger
> +  - 3: Both edge trigger
> +  - 4: Low level trigger
> +  - 5: High level trigger
> +
> +- **wk**: Wakeup enable.
> +
> +  The remote system should always aim to stay in a power-efficient state by
> +  shutting down or clock-gating the GPIO blocks that aren't in use. Since
> +  the remoteproc driver is responsibe for managing the power states of the

s/responsibe/responsible

> +  remote firmware, the GPIO driver does not require to konow the firmware's

s/konow/know/

> +  running states.
> +
> +  When the wakeup bit is set, the remote firmware should configure the line
> +  as a wakeup source. The firmware should send the notification message to
> +  Linux after it is woken from the GPIO line.

What about the other direction? The remote could also need to disable 
message from Linux, right?
In such case the remote might need a message to get the GPIO value on 
wake-up.

> +
> +  - 0: Disable wakeup from GPIO
> +  - 1: Enable wakeup from GPIO
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> +   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +
> +- **err**: Error code from the remote core.
> +
> +  - 0: Success
> +  - 1: General error (early remote software only returns this unclassified error)
> +  - 2: Not supported (A command is not supported by the remote firmware)
> +  - 3: Resource not available (The resource is not allocated to the Linux)
> +  - 4: Resource busy (The resource is already used)
> +  - 5: Parameter error
> +
> +GPIO_RPMSG_OUTPUT_INIT (Cmd=1)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Does this means that we can not change the output level during runtime?
else this should be renamed GPIO_RPMSG_OUTPUT_SET

> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> +   | 5   | 1   | 0   | 0   | 1   |  0        |line |port | val | 0  |
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +
> +- **val**: Output level.
> +
> +  - 0: Low
> +  - 1: High
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> +   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +
> +- **err**: See above for definitions.
> +
> +GPIO_RPMSG_INPUT_GET (Cmd=2)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> +   | 5   | 1   | 0   | 0   | 2   |  0        |line |port | 0   | 0  |
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
> +   | 5   | 1   | 0   | 1   | 2   |  0        |line |port | err |level|
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
> +
> +- **err**: See above for definitions.
> +
> +- **level**: Input level.
> +
> +  - 0: Low
> +  - 1: High
> +
> +GPIO_RPMSG_GET_DIRECTION (Cmd=3)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> +   | 5   | 1   | 0   | 0   | 3   |  0        |line |port | 0   | 0  |
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
> +   | 5   | 1   | 0   | 1   | 3   |  0        |line |port | err | dir |
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
> +
> +- **err**: See above for definitions.
> +
> +- **dir**: Direction.
> +
> +  - 0: Output
> +  - 1: Input

So here if I well understand, the list of GPIO are defined in DT and
This command should be use to check the direction during the probe.
Could you document its usage?

> +
> +Notification Message
> +--------------------
> +
> +Notifications are sent with **Type=2 (GPIO_RPMSG_NOTIFY)**:
> +
> +When a GPIO line asserts an interrupt on the remote processor, the firmware
> +should immediately mask the corresponding interrupt source and send a
> +notification message to the Linux. Upon completion of the interrupt
> +handling on the Linux side, the driver should issue a
> +**GPIO_RPMSG_INPUT_INIT** command to the firmware to unmask the interrupt.
> +
> +A Notification message can arrive between a SETUP and its REPLY message,
> +and the driver is expected to handle this scenario.
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> +   | 5   | 1   | 0   | 2   | 0   |  0        |line |port | 0   | 0  |
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +
> +- **line**: The GPIO line index.
> +- **port**: The GPIO controller index.
> +
> +The reply message for the notification is optional. The remote firmware can
> +implement it to simulate the interrupt acknowledgment behavior.
> +
> +The notification reply is sent with the byte index 0x4=1.
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> +   | 5   | 1   | 0   | 2   | 1   |  0        |line |port | 0   | 0  |
> +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> +
> +- **line**: The GPIO line index.
> +- **port**: The GPIO controller index.

The type seems strange here, it is a reply but tagged as notification, 
what about adding a type 4 GPIO_RPMSG_NOTIFY_REPLY ?


It might be useful to specify the GPIO level as parameter, especially 
for  "3: Both edge trigger"

Thanks,
Arnaud

> diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
> index bee58f709b9a..e5eb1f82f01f 100644
> --- a/Documentation/driver-api/gpio/index.rst
> +++ b/Documentation/driver-api/gpio/index.rst
> @@ -16,6 +16,7 @@ Contents:
>      drivers-on-gpio
>      bt8xxgpio
>      pca953x
> +   gpio-rpmsg
>   
>   Core
>   ====


