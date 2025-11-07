Return-Path: <linux-gpio+bounces-28249-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 804E1C4101D
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 18:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00FE51894631
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 17:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7117A328635;
	Fri,  7 Nov 2025 17:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HZFRCpqU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81C1C3314;
	Fri,  7 Nov 2025 17:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762535931; cv=fail; b=uzq+uGLTN0rfJuuQmXO3+UyBzO4ehvRriRIZo/BBZVbrcnbfGraFkakCk+fNuQfmY7KjF9zmi9sOvTnq6Cw2ir5n+AUE/fC6PJor1d30qK4n1KH5/M42aQYfPUorMs907EUh3vA9BqYjeGPNmNeRv9itFC/6WEVwFGGf4f+YBjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762535931; c=relaxed/simple;
	bh=Qrtxomsdt10ToLqj7IFx7BjFWFMcVNw3JF9WGA+m+3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jg0Y2V41GGH6Dd8IW7fK/1SoVOhQBcaqY4oDOdKLYpOhxJwH5FTy/7v81bOS5zJnBVwEttJyLCEYtIdfbSEfpyuTZzwTCEokF6RB3i6903IEbx08C1Pdj/e1JWgjC/idKkaJTFVz4zItxb2+36o2JlQmplBTjnv0Fv4wBTUjSNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HZFRCpqU; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7H7nYV613495;
	Fri, 7 Nov 2025 18:18:03 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013053.outbound.protection.outlook.com [40.107.162.53])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a8e5818jw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 18:18:03 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ye3gCN2InVpRqtQrKismp6rUBL/8BRg2JwSfk92uUlizlKYotqrclXpktDPdg4Zr33m4A9NcIs6BvrupTYL0tNTzCLXr+74lQndFktq0wheKhLytiWR+uGXViF8u3OKKOpUiYbqFKQLBcaynstYfWbuw6JSBDIL4Y1SsohkfAXy/U6wRgypn/8LxJjDFbGJTZOv7CQ8n2ROP9/9ZCcRqQJXxYBk07E6qRxi5zNyn4GuXaMZpRE8byO6Xd9wu/HsGyXfkTo5Ca5wqb3nqJE0WmxiCeRWalHLV265zuHo1bZq+jICpSkTk9c+2Mt1kQQK8Nra2yezBaK+qMml49q+Ucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AW79ZD/FbkkktiQ9UllVxny9QSCXfvdhm+ZitVGQL4M=;
 b=IrRrkqyWJUpju0bbeR6M23T9E4FCy/kEvT8l6Qrn4WtoPQwzKTTPd+3t1vzvuZik7Gc2ZlPAYz0bxM+RlqgChZ5A6HrH2wdavsM6mdWHDSJweGXLX50QDozgEHtnIN2sutOhs1v2iG4UPZCoxrHvE1k8WYX0L/NjLdcJmVf36iXfrDeskyA9ORvX1k50gtmCrBqj38slWrux1emkg7ywsIaRypE9QqVatbT/Dip8tYCi9ntG59f5FqTnxIec9+qeZ8Q1sm/Bq6nSvFnQVUqMeRGCHQJ/F/cKLwgpZ/jYIuuYM0eVekOq/K3/QGz+iDdrgvpu5K3w/QyL4EXIOpG4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AW79ZD/FbkkktiQ9UllVxny9QSCXfvdhm+ZitVGQL4M=;
 b=HZFRCpqUQSNLj/V1e5RoFaLNJVjQIg2mmT1jkQNxsEPeiI9WHMAvc4BLf8jNzkZogdNt42iNmkobKzyRksFFozLPIgAr1xiixqb1YJEvBxxfHaot3/zBW9B5Ob/mN5gj3cv10zak6M1WMkpcNsAvwBBRGJQLmRNtScT3I0zLPsGQe4fPL0Fx8YE/3Skc1IJRtWrTDV7wMQ4dCBypRZu2Av+r1yZ9khVBcvsXrdZusexcsoSG2pJmknIqtcXYtxCYshLjYbsb3rP5Qm878IBWvFyECZpumnUPg185XgN6pwud3LGCSM0BvjNejGftg1gV2JqTZ+SIxklHn5pFrOxD5A==
Received: from DU6P191CA0070.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::18)
 by DB5PR10MB7823.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4a4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Fri, 7 Nov
 2025 17:18:00 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::28) by DU6P191CA0070.outlook.office365.com
 (2603:10a6:10:53e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 17:17:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 17:18:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 7 Nov
 2025 18:18:07 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 7 Nov
 2025 18:17:58 +0100
Message-ID: <734f830c-947c-495b-ac9f-98d439e821f2@foss.st.com>
Date: Fri, 7 Nov 2025 18:17:57 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Jonathan
 Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Bartosz
 Golaszewski" <brgl@bgdev.pl>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam
	<festevam@gmail.com>,
        "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Randy Dunlap
	<rdunlap@infradead.org>, Andrew Lunn <andrew@lunn.ch>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <PAXPR04MB8459C54EAF106184E7A378D888C5A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <05a0c630-3bd5-4307-8b94-1889ba191c33@foss.st.com>
 <PAXPR04MB91858EA1057672295ECF793889C5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <aff734de-0d61-4239-9e67-78a4ab258c30@foss.st.com>
 <PAXPR04MB918581030A9FC05E13874BDB89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <PAXPR04MB918581030A9FC05E13874BDB89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DE:EE_|DB5PR10MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 08bd935b-86ec-4221-3129-08de1e219a4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|13003099007|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDFLZDB5Vi9tcG1ZeDJDaHBEQ2pkb3dxR01JbG05YkdaWTM3ZWZLdk5MYWNE?=
 =?utf-8?B?TjFxVEY1R1dXaUFiSURRR0k0dExOemF4R1dzdTBrU3l1eVFoKzRyVG1MUm5H?=
 =?utf-8?B?K0Z6a251NXVYU01jQTFBa0lkTlp3QURJeHRTUlk1Mk5MQ2c1bWdRRHRhZkZ0?=
 =?utf-8?B?c1RZK09TanVhbGU5Y0p1a01ueDkxTldDVXdwMzN6MXVpNWZueUdWcGZPY25z?=
 =?utf-8?B?aGpTcGRDa3gyUWJlaTg4ejFNTmd1dUt5aWJMVlFWRTZjY3hGakY5OTdpMVYz?=
 =?utf-8?B?RGJWaHZKbGY1cmxyZ0dWcm5jNFc2MlY3MWdjS0xhdDhGYkxZM1lTaEZ4VHFa?=
 =?utf-8?B?WU5zWkhrcWFleHZEYTZxd05QQm1EVmNySlR2ZkVpZVJqZGtReW8zcEJhMzhu?=
 =?utf-8?B?elVUMVRnN013bnd5N1JlMUNvZmJjelgwR1NIa2FqRkROdVBlelNwRHRwTU53?=
 =?utf-8?B?NEh5RVNnQ2Z4OE1VMWE5bU1BOUcyaXA0cWxKQW5MaTU3YkRla3RwbmdiTHFs?=
 =?utf-8?B?T1ZzOFZaeENyNVpLRkViMTR6NUhKRzhZTkdYbE92VTNKbEtvREFXeExKcG9k?=
 =?utf-8?B?WDZZVm9SbWI2TU5QWWlDT3o5RXZMVzM1N1lRMW04akQ4RTQ4cFFYaDVFUlRw?=
 =?utf-8?B?T3pQSGd3STZLZjhsZWMrZnVYcmFaNFNVNm9zYmlRdFViNWhZcE5RVlFZNS9w?=
 =?utf-8?B?TjdOQURoRzRVUkJUTjBMZVJoTXIwSGk5RENrVldlekRpYTFUMS9wejdHMVFT?=
 =?utf-8?B?bjIycjArbzNOcE50enlnYm8wRWVWNFl0SERTejlveFBDTVBqcmVWU3Blem1W?=
 =?utf-8?B?dlJWRHp4TGtIMC9PbVZ6RW9KeGg0M2FMSzcxMC9tV0lWK3NKOU9ZN1Z0WHhM?=
 =?utf-8?B?R0habHpPcGNIY2hVZm55clJzNXVOcDYrWHdSRVN1TjV4c2lSdVZPbmtIejRj?=
 =?utf-8?B?TjBXSndJVHhRdWxGejQxZGtZZGp3QXVwcjZTSXRqWFVnUnVBS3M5UHNHTlJs?=
 =?utf-8?B?R2ltbm54bnZkamNHUnhkUktxTGlLV2M4K1BRaVhGRW82bVRDSzRDd2lGK24w?=
 =?utf-8?B?YnJIR0VwNEVydVUyRXdUMnlkbzhDcVhXc2xYRlUrRGVNZUVkbTZKYnNsQUxu?=
 =?utf-8?B?ZzVvZ2o3UVBzUGZJMUZUSTlsVDVQQ0FQOVpIR1RkMjBFRGszcElpYkxpYzFw?=
 =?utf-8?B?WTd3YTZlbDNEZVRLRTFtcUtvWUlnRENKb0NiWGVKV1A5UFhMd1hHZHpiL3R4?=
 =?utf-8?B?RkIwOXlOVnprZjlSbUgxOW01RDA5djUrSEJVTlYzOFBFU1pyT2pxT3BvKzFT?=
 =?utf-8?B?Q1lJTlpFVHo1QlFhYllpYkpzU3VYY215M1hCSWRPM0I3NEw4V3lPWC9EZEVG?=
 =?utf-8?B?aFJZdlMreUh2SzBtY3VPQ3MrY2RkVjIybnZXZGR1Vk1GeXprNWpuZ0tPdDZr?=
 =?utf-8?B?SmZsMnArOUt4Q1pNR210anFaeTJ6OVloWnIycW5HSmNHNWRINW1ob2lPRGJQ?=
 =?utf-8?B?OWtoT3pPR0s3QUN4NVN1RVRRVXBkaGdiUzBUc0RQb3FHUmZiOHhqWWlWU1FD?=
 =?utf-8?B?c2RQbVlET3ZBSDJ1cWZzOFE1MlF1eUFyYlZaWmk1SWlCQ2ZjZjUrUmpDUXU2?=
 =?utf-8?B?dFFQNHVRYnFTcVZXOHRFdFhYaTZ2a0NjamYrRnFPb2EyZC9FNWRBRTRiYlcv?=
 =?utf-8?B?UFduTFcreVRYNFJKWEhpanVsOGRKdFdXZmhPbWF4MVlSd2VuQ3BGUmpKeWVY?=
 =?utf-8?B?R2IwR3BLcHN6QjNaZzA1NWlBLy8wNWw1RHJYVkFhTG1UNlJiem9HVkpJdjVm?=
 =?utf-8?B?ZVdGeVM3WDVDWnFlNGtZcnkvdGFYS1dZSWJsODZNa2pVdnRQV25YdEkrelZ0?=
 =?utf-8?B?VUQ2SDZLTDR6Y2laREowVk8zVDJiZFpWa1ZOd3BCem5ESW1ibUNzNSt2ZTBM?=
 =?utf-8?B?cXR3aHc1dGJIWTRWNGJab0ttWC9kSm1LOXpSbFh2d2Ziek5kZGc5RTN6WUFq?=
 =?utf-8?B?dFQ1MFJHVW1meDNGMnFIRElPM2ZMOXdNQmJFU2xWWWU5SEVrOE1OVSt1ZUpw?=
 =?utf-8?B?NHBRQ3pBdHpUM0pTZkJERU5MN09QTEdHdFRNT1hldjdDbkRrUTdxellFYXdT?=
 =?utf-8?Q?PU8SvH50vvGec0RF056Z4JO76?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(13003099007)(921020)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:18:00.3496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bd935b-86ec-4221-3129-08de1e219a4b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7823
X-Proofpoint-ORIG-GUID: RXcPG9rDqH30y6nXnblajuK1qsFiKTAL
X-Proofpoint-GUID: RXcPG9rDqH30y6nXnblajuK1qsFiKTAL
X-Authority-Analysis: v=2.4 cv=QuRTHFyd c=1 sm=1 tr=0 ts=690e29cb cx=c_pps
 a=u/VjwGDIQwVVfJn6M+ag/w==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JfrnYn6hAAAA:8 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=07d9gI8wAAAA:8 a=pGLkceISAAAA:8
 a=CVH9J4VzQPHUzZAsogMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a37Z7SghD2UA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=T3LWEMljR5ZiDmsYVIUa:22
 a=ST-jHhOKWsTCqRlWije3:22 a=cvBusfyB2V15izCimMoJ:22 a=e2CUPOnPG4QKp8I52DXD:22
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE0MyBTYWx0ZWRfX8aRb0+4GAgvl
 0oIdoBuEN98KCYL3lxeMhHUlEzwFkeIWkPranaKQ91iRuKZiDy1cfc07dST5St1sDt2/QY1Tk1R
 I0NHr2Ejmr642RxWROLBRtMLrw8YYf78nkVD90QWrTW8xpIhNbyTRI+jfRDebolns8UJ7xoiVOS
 QbJoPLuSfUwnVO4fXR/33+cmU+8NVdH2g1Dn0oUFIz7ZNbBE/0KJFUnL08ctKyAkrhcDmGY5ZIO
 kMfgSmoexJ7dwJ4wtqg2v9qDOmPXer6OkjXw2IWHjVfSOCIGRLf1VuBEKmU20cHHLpn7ggZXv0O
 YbNb9eYp3LJofw2rINKpONtf5mOCzCLMoqP1mkZMtqpLkcX+Km5z3SaZiyRo8n7KVTmN8M+116s
 isyjIfuXqUsNcLfiKzLkMC9G8EvGDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070143

hi Shenwei

On 11/6/25 17:26, Shenwei Wang wrote:
> Hi Arnaud,
> 
>> -----Original Message-----
>> From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
>> Sent: Thursday, November 6, 2025 4:17 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
>> <mathieu.poirier@linaro.org>; Rob Herring <robh@kernel.org>; Krzysztof
>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn
>> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
>> Jonathan Corbet <corbet@lwn.net>; Linus Walleij <linus.walleij@linaro.org>;
>> Bartosz Golaszewski <brgl@bgdev.pl>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>> <festevam@gmail.com>; linux-remoteproc@vger.kernel.org;
>> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
>> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Randy Dunlap
>> <rdunlap@infradead.org>; Andrew Lunn <andrew@lunn.ch>; linux-
>> gpio@vger.kernel.org
>> Subject: [EXT] Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX
>> Platform
>>
>> Hi Shenwei,
>>
>> On 11/5/25 15:12, Shenwei Wang wrote:
>>> Hi Arnaud,
>>>
>>>> -----Original Message-----
>>>>
>>>> On 11/5/25 02:12, Peng Fan wrote:
>>>>> Hi Shenwei
>>>>>
>>>>>> Subject: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX
>>>>>> Platform
>>>>>>
>>>>>> Support the remote devices on the remote processor via the RPMSG
>>>>>> bus on i.MX platform.
>>>>>>
>>>>>
>>>>> I have not look into the details of new version, but before that,
>>>>> just want to check, have we agreed on what Arnaud suggested?
>>>>> or continue to proceed to be this as i.MX specific?
>>>>
>>>> Thanks, Peng, for pointing this out. Regarding the V3 discussions, it
>>>> seems that I am not the only one suggesting a generic driver.
>>>>
>>>
>>> As I mentioned before, the only i.MX-specific part is the transport protocol over
>> the RPMSG bus.
>>> In this v5 patches, we’ve included detailed documentation for the
>>> protocol in a separate file. Any platform that follows the same protocol should
>> work right out of the box.
>>>
>>> If you spot anything that could be improved, please let me know!
>>
>> My concerns remain the same as those shared previously:
>>
>> 1) The simpler one: gpio-imx-rpmsg.c should be renamed to gpio-rpmsg.c.
>>
> 
> Agree. Will fix it in the next version.
> 
>> 2) The more complex one: the driver should be independent of the remoteproc
>> driver. The rpmsg protocol relies on virtio and can be used in contexts other than
>> remoteproc. In other words, the struct rpmsg_driver and its associated
>> operations should be defined within the rpmsg-gpio driver, not in the remoteproc
>> driver.
>>
> 
> The GPIO driver operates independently of the remoteproc driver. 

The channel_device_map table in imx_rproc.c would give me the opposite 
feeling

It functions based
> on the defined GPIO-RPMSG transport protocol. Any remoteproc that supports
> this protocol can exchange data with the GPIO driver via the underlying rpmsg bus.
> Placing the rpmsg_driver (which manages the rpmsg channel) within the remoteproc
> driver is more logical, as rpmsg channels run on the rpmsg bus. This bus is defined inside
> the remoteproc device tree node and is populated by the corresponding remoteproc driver.


Regarding imx_of_rpmsg_node_init(), It seems you rely on device tree in 
the rproc platform to register rpmsg drivers. This implies you are 
creating drivers based on a device description. To me, this does not 
appear to be a valid implementation, but perhaps such an approach 
already exists in the Linux kernel?


For your information, I'm facing a similar issue with my remoteproc_tee 
series [1]. The advice I received was to look at the PCIe DT 
implementation (I haven't had time to explore it yet). This advice also 
seems relevant to your series.

Do you also have a look to rpmsg_virtio_bus ? it seems a good candidate 
to match the device tree properties with the rpmsg device?

In the end, this is my point of view. Perhaps it is better to wait for 
others before deciding on the direction...

Thanks,
Arnaud

[1]https://lists.infradead.org/pipermail/linux-arm-kernel/2025-October/1069154.html

> 
> Thanks,
> Shenwei
> 
>>
>> Thanks,
>> Arnaud
>>
>>>
>>> Thanks,
>>> Shenwei
>>>
>>>> Thanks,
>>>> Arnaud
>>>>
>>>>>
>>>>> Thanks
>>>>> Peng.
>>>
> 


