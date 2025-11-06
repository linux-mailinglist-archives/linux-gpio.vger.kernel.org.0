Return-Path: <linux-gpio+bounces-28159-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE96C3A3CC
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 11:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDA721A424F1
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 10:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A9E271A9A;
	Thu,  6 Nov 2025 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Z9t715dy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E7C2309B9;
	Thu,  6 Nov 2025 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762424288; cv=fail; b=DdU1e7MkI7Guz9z8p2rlsmpqZpESvdSPXq9+HBbyed7mxEFBXdih85M4kjaBGvZlZwQwUYpwEtyTolwTVZ2rq+r5JnED6WSgUjXrk7gok2UIpFBJCBRQfVr4ZVz4CPhXLNr+Jk5/3jy8A02nlDFjfL4gZWqtMD/RN/CM3tiXnIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762424288; c=relaxed/simple;
	bh=nOexW13r3GuxFsUsmf2GsX8F46xtYZ+n5TACb8pfn5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FoTBJ5igdSnn0Wuulk8sgGyHf+Hy19zWfBbwHP8q7H8NHm/Clos/pIcOhCDl/3pyhwbRM1lSB/SYUt6XJYzhYP9Ga40YYA6y5fdSDKB26e3o1hZXxleoN5AZG/+seuONde3rEV9nQIdFWNizoFt8wTLFMuKWYxdJ52Xs0NXJshc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Z9t715dy; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6A5UMc1422413;
	Thu, 6 Nov 2025 11:17:18 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013034.outbound.protection.outlook.com [40.107.159.34])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a8e57tq52-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 11:17:17 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLI+b9/2+KY7m+uIYDhugm4J5tNtwRdeMe9GWsu8st6R0O1PBuzzjSoY3p68vx0DWvT3CSu+IIOkfrmzbFXCS5BXdmiqgfkmoxHMhpX+J3Fb/B3UNiT5X97AwylCoib/Pu/qv+uc2t4HpVWQWlJF1Iv/XtwdB10HS0oPAoPoRzzTEAJlEawzgx3C+BF1JzaUKec7sSrkhk+UdAi7ldgHstlQpFVfGWrmKjXZB3AuY8oqwmtcsQbiUrEos2Psb73isPZ2n+4mZey/qT42BSV6yE1HkY7Z4YPnY034hKC1+AEYTytmNcoiMvVVohIbO9+DGIy+Ry1Zw+ouBkzpWY2XDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LPwIjnDbBwbClFrNFPJK371RcwxKeQqm0SqrsJvzPc=;
 b=M2VF8G77C1kCJQZHSFx6gYW68lp6I2awYniM8ju32MTbCb9kaSVOTJF6z9z1i9vJXRKJZMUDsQ3pJz29umNyxSrpVQwtCo+Pvpl9rOWUi9PVVozAx8XJa98eUNC3kJEmMTyY7BYOgc7UlBSMSO0vDEM32fQqxLZctGshOaBosQB1Fff4OMiuKHyv0lpu//dFLVFtPw/LSlpHWT2+j2igPFKDeGgz200wx6vz847yHkqic7HmEaU0p4ZuF4/ctfX5fWpn1THq2P41sUtlmSS9QBs8WuBJztTDm10L2fdjlBCp0NAk0abEp23kxgQdOrxP20M4vJGbWTCflQ2pHZdlFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LPwIjnDbBwbClFrNFPJK371RcwxKeQqm0SqrsJvzPc=;
 b=Z9t715dy93VxMKeKbZEx4iMKTk1aF+/88U2R9NejuqQJxF2EVWHim+VDXPwYIxyveIw+K0PJq02jyX87AUPhYaml5wj/6sRVLnfGXavkuUNT3tZ3G+KiHcij3b4QT/lq4aJeKvZCD9xYGVxEEwaOwq0p943LLUYiZX/gkRJAcyU5pQVDD/SthW3hW7UVa8FfqvnrVjTwWUvJTU76d184QkCz5QOXEFewMmezzFU1dIkN/aEjkc84bMcpAKayJ3Bfu5aJ1aIMlbqeJg8JdbdsYZQQQIw8KNMLbcLop8TWtliSV3omgtn8gxoa3e51avfjNQjLWVB+KhlzwRzr5U9HTw==
Received: from DU7PR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::17) by AM0PR10MB3505.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:15a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 6 Nov
 2025 10:17:15 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::e4) by DU7PR01CA0003.outlook.office365.com
 (2603:10a6:10:50f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 10:17:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 10:17:14 +0000
Received: from EQNCAS1NODE4.st.com (10.75.129.82) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 6 Nov
 2025 11:09:53 +0100
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNCAS1NODE4.st.com
 (10.75.129.82) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 6 Nov
 2025 11:17:12 +0100
Received: from [10.252.17.135] (10.252.17.135) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 6 Nov
 2025 11:17:11 +0100
Message-ID: <aff734de-0d61-4239-9e67-78a4ab258c30@foss.st.com>
Date: Thu, 6 Nov 2025 11:17:10 +0100
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
        Conor Dooley <conor+dt@kernel.org>, "Shawn
 Guo" <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Jonathan
 Corbet" <corbet@lwn.net>,
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
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <PAXPR04MB91858EA1057672295ECF793889C5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EA:EE_|AM0PR10MB3505:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f0b9171-d950-4481-aa7e-08de1d1da879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N256N2hNaEdvRXl3NG4rZ2hwc0tjb3Ftd2U0bXRIZkc1T1MxeTdIRGhlQlU2?=
 =?utf-8?B?V2l1L3dDRytpU3lKOHdveEVYZk13RmNOMitZY0E2WFljM1paZ0dyR1l0UEhW?=
 =?utf-8?B?UkpJV1pqQ2duV2RoUGRsV0FkZU1CNXBybXpnVXQrMy85b3VPOWNmaHFndVNk?=
 =?utf-8?B?ei84MnR2N2JNd2x1dE9JSGJyVllYbVRGTDNtUGs4empQQ1pzUFU3Y3dwWU4v?=
 =?utf-8?B?QURocDgwS2o2YmFkLzdKZjFIL29RTDcxUHNhUkRkRmM5OUI0c1dlcmVpNXhJ?=
 =?utf-8?B?Y1ZQU3V4OHQ2NVFQa0dTSm0xNEFpb0M5anM1OVJnS1BuVmp6ZCtHdVV6UVFl?=
 =?utf-8?B?UEp0UzRRYmZHRFN5UjZoa1pVSTdjTmxSc0k2WmtTajFwa2ZtcUFUZVJvM0pw?=
 =?utf-8?B?cUYya1YwN09TSDJhNjVKeWxwNXpjRUR2Y29JazFDZGRuaEpucVVjTXJWcDFW?=
 =?utf-8?B?aWl6SkRoNW5ialBNRUJLSENjcmpwa3hGLzFta2hSRmhHTnJLVzZKaVBJbXdk?=
 =?utf-8?B?WWxTLy96anlrcUg2MzY0RCtwdnFjR1lOYlBXQ1NQaFllZXJTYlBJTDA4RUNh?=
 =?utf-8?B?Z01sblVjRE5VeDNITzZzbytKdC9yRmRndlZtOWd1aXBBUnFvTDgyaG93VnRm?=
 =?utf-8?B?NCs2M3N5cENTblpHeW4xU1M2MTFReFQzTzN1RSswSzlnMS9meDM5UnF2NlFB?=
 =?utf-8?B?RThGKzUvWVNVVDhTMnl2eWJUSWRYSFI0UVFncFk4anlPWVZ0bHNLN1J2Z3py?=
 =?utf-8?B?SFNaSGFSL08xeFRRbG1sa3llVk5LeCsvL2RCMmJoOGRLc04wVUF5OWEvNnlN?=
 =?utf-8?B?R3dLT1VaNW94Uit5SUxxNTRLOTE1bjh1R3A5OUVDVG5Vb0VuNVc4VnFHQThF?=
 =?utf-8?B?TElHWTVxcEZmU1N3ZmdIYXRtbVhtY1UvMDlSb2g3bTZhRXFtMHZKRUJIbTBk?=
 =?utf-8?B?UVJaTjl3VHZ5dFIrd2E0MW5rczlDa2xML3AxaWZTT3VCRUY1ZDV5V0hMc1BK?=
 =?utf-8?B?U3pMSjduL0ZuVzV1SnRGTzhxQTJIWVZIK0o2ek5DYXlMSjBRTDlTTXZ0eEw3?=
 =?utf-8?B?U1lZQlExN3BocGJFcEEwdHIrZGpMZEFvUmswa2dTYlBtUVBUWHJsT0M0VWFG?=
 =?utf-8?B?NmNvYzcxWFY1MTVrSFJ0M210QURWa1dQQzBFSlB5b0RmZ0lnc1g3Q0hyaFFM?=
 =?utf-8?B?KzAxVTRuM2VicDQzVEo3UGcvNVRHTkt3Y1ZWMGpySm1veVZqbW96NURGM29s?=
 =?utf-8?B?VDhlMEZZNEx1S2VKVC9lQVNzRE1wcnZOUGRRRXFqd0Q5Q3pOWGxhMVhadCtL?=
 =?utf-8?B?NEV3SjI3OFU1MFRCMlQ1a2UwNEthdEdCTUNKS3BaZlpmWTlmTXZGclQ4aHpI?=
 =?utf-8?B?eUxmUXl1WFZVT21PZ0R1aUJacXhXUnZWczZCbXlGald4WWZHVkJPdTJNa1JV?=
 =?utf-8?B?VjNmckwrV2VRZGtLeDVrL1BKUkFCZ1gxRU9rallVTXNRTUJTVzE0YWNIcTJ2?=
 =?utf-8?B?WDFBYjJVdGFYOVdsejhVQVNUNHprTUZVZVZ5RnBGWlZuY3RLMVFSbzI0blJa?=
 =?utf-8?B?M1pYcDNZaTNnVzJPbE1ZN3pYMnVpYWsycjduV1hsSjY4TkFpZ2t1NGpKSnlD?=
 =?utf-8?B?OElJM0NRTk4vUVlScU16RjY3NmswTlFLTm85Q2M1VTZRdGRLeFNhc3NLaGcx?=
 =?utf-8?B?U0RhSFdvSUFieWNjQm90NmJEYmUwUzZaM3c1cDdjaE9TeUdBdTJoVzg0YzZQ?=
 =?utf-8?B?ZXpLMURLUXpicG52QldOV0J5dkdZbk1MTEZvNnBpZEEwQjE5UDZlZEdRU0xK?=
 =?utf-8?B?dzl2NVBUQ2NJWjhjSTFGOE4rcUJFMkRKdEFYR2dzZUhuSmZwbnJJNEtDRzhY?=
 =?utf-8?B?VXl4ZmdkTnFoeUhWUFg1QUo4OTk4ZlpUdzFlOVhjMmgxWjdOaGdZa0lxQWgz?=
 =?utf-8?B?TzByeEJPSXpibVlTZmVTeTk2aXR0Z2JsRnZHN1JIZ3NtNzNQbnpTUXJWeitI?=
 =?utf-8?B?ektJMDczUVBaQmlnUnd5bDJOdVZRVkphK2tYcE1vY2pTbVN5L1Mrb3J6b2Qr?=
 =?utf-8?B?Z2JoSUx6K2FBZ0doNmw0MUtMY015ZTRwQkYvcHhRMEMwd2NCTFNpaXdyb0I4?=
 =?utf-8?Q?kWL4dWsDmWfN3zCAKXc8k6wwj?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 10:17:14.9745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0b9171-d950-4481-aa7e-08de1d1da879
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3505
X-Proofpoint-ORIG-GUID: 2R9hU18N5EFlUZduFRlGv1sgGl6ujz7T
X-Proofpoint-GUID: 2R9hU18N5EFlUZduFRlGv1sgGl6ujz7T
X-Authority-Analysis: v=2.4 cv=QuRTHFyd c=1 sm=1 tr=0 ts=690c75ad cx=c_pps
 a=sVz80lr63r+noJKTyf6duQ==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=i8swKbHhBpcA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=07d9gI8wAAAA:8 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8
 a=yGR9Ld5_Y51QbCr_SjcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22 a=cvBusfyB2V15izCimMoJ:22
 a=e2CUPOnPG4QKp8I52DXD:22 a=1CNFftbPRP8L7MoqJWF3:22 a=HhbK4dLum7pmb74im6QT:22
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA4MCBTYWx0ZWRfX5Bm0EnE1pnqB
 JLQPiKh2htH4p+6uucevcqem9AOINgeGS2CCxe2k7a7KdkfHEgs648p2tLjmlirRUwrglnNBKLU
 KQI3jrc5R/7s1l5Wr6+Pg/7/5AzA+LKOzNh2sqxCa+UdQ1JrXxGohviAo5bZumP3QO+MGD64psT
 xiUefgyGjxQElf6NGC14fQVNdB4twtWJ7PiLYiZDdRTPuh9/BjGoRxIf1+fBu1LP6ZhjTCgy4hj
 4y414y4YB8oJK5dtEzhTN/7t22/pFl8XAgdDwN3F9rHdmxomF8inI8n4Ga1ZYZM8o+wo0/IozmA
 XRfNNbmRK7EBQJf4iyWy3n2JwvIrRTyMqfTVoCnpUchzbpBKvidPeAP2f53tsiq5xH7new6AYdK
 pAob8hmNuChmFqyI+VvvRjQakw1m9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060080

Hi Shenwei,

On 11/5/25 15:12, Shenwei Wang wrote:
> Hi Arnaud,
> 
>> -----Original Message-----
>> From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
>> Sent: Wednesday, November 5, 2025 4:26 AM
>> To: Peng Fan <peng.fan@nxp.com>; Shenwei Wang <shenwei.wang@nxp.com>;
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
>> Hi,
>>
>> On 11/5/25 02:12, Peng Fan wrote:
>>> Hi Shenwei
>>>
>>>> Subject: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX
>>>> Platform
>>>>
>>>> Support the remote devices on the remote processor via the RPMSG bus
>>>> on i.MX platform.
>>>>
>>>
>>> I have not look into the details of new version, but before that, just
>>> want to check, have we agreed on what Arnaud suggested?
>>> or continue to proceed to be this as i.MX specific?
>>
>> Thanks, Peng, for pointing this out. Regarding the V3 discussions, it seems that I
>> am not the only one suggesting a generic driver.
>>
> 
> As I mentioned before, the only i.MX-specific part is the transport protocol over the RPMSG bus.
> In this v5 patches, we’ve included detailed documentation for the protocol in a separate file. Any
> platform that follows the same protocol should work right out of the box.
> 
> If you spot anything that could be improved, please let me know!

My concerns remain the same as those shared previously:

1) The simpler one: gpio-imx-rpmsg.c should be renamed to gpio-rpmsg.c.

2) The more complex one: the driver should be independent of the 
remoteproc driver. The rpmsg protocol relies on virtio and can be used 
in contexts other than remoteproc. In other words, the struct 
rpmsg_driver and its associated operations should be defined within the 
rpmsg-gpio driver, not in the remoteproc driver.


Thanks,
Arnaud

> 
> Thanks,
> Shenwei
> 
>> Thanks,
>> Arnaud
>>
>>>
>>> Thanks
>>> Peng.
> 


