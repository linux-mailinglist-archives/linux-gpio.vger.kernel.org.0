Return-Path: <linux-gpio+bounces-29741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CB5CCB874
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 12:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B27B304C1F6
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 11:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E7C313E3B;
	Thu, 18 Dec 2025 11:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fTFjypfw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999F4313E30;
	Thu, 18 Dec 2025 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766055870; cv=fail; b=KEHoVDlCQktnu34mDgT1k+vqNog1iNRDD4MThoWxafh1/V0mlVlQbGbertz5cN7B7v8hHclovtu61tPtYo9v9Lvd9FSIzHAIXAoYyH8PuF0Q0kgsRSNiS4a9PsDlbsQiqmn6T7qDVP/cBERzGb3r51e2oLzhU8vdX3mTy50vyg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766055870; c=relaxed/simple;
	bh=anzloxbiXUn+hhu+ZtEUkDPaKrCh2105lRstLjnC/kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TJ3I5dJSM3qAasVb+4XZUFWqlCwODkVARq630zQvGGKVRpyOcz+/wfMFklmuxKAHdu+XNHCGszVnSwmHvGfTkAGXjkDKs+LnangS/Accqa/WHIEE8ZHclmDcomsInlawRe/XLMWrLHcdsBZDd7TAsNPrh0sUWPutYPt09B95URw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fTFjypfw; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIB3KiO2162569;
	Thu, 18 Dec 2025 12:04:03 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b3xb741d8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 12:04:03 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVonMDuggA7LkWtM+9T/5Ev4GvSxSKnkz82dtPS5l01pmxAW/OaHGltiFVMVeCvWmTyRYKjqISvBjPCy3o4g4jh/mwK16FLGhNIcQPG/THpB+wE729D6LIlPyHJet4SIQ0CZF9rK6BWidyUBzoH8z9uxmabVvW7W01heWTiA12edGxvHG9jCKrxa+FtLi9gWG0yWqREOAEX6G0yOcGcAMNr8dWtfGsLdRfVUG9HYJnvZQHMG81usN+d4Ran5AYfsR0rQnp1X2ZxujNdeWo7saAvRYlHDKbDe2lYcnw56MuEtqWpGevIdR1w8SVcHIRbknzHPrcqMxqnQYha1pft57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiLhqw8kNlLFEFtzfbidAWm03srbXyXpAgRspgW5fZs=;
 b=G3mIM7wXiuunvJsckElf5lQNdYVak6Hg+ADmepw9mc7goz73aeIqCkuHePJwx8KLSzLwONOeAfNf0q2XthIPIQ1mcZQH/JBlOmfhkr52Z0XqjPa+KexnicthoCoFxh8TyNfYJASrT9Xmo/ZrbswjFrYdY969gMGGMNhiJrh2f7df8XIFLZssJnrfBDehyA4fn3JI/2399/Sd1PNrTnJuuihrJmQn0RDmQu6Nq/9BW8ozOVAT6BfRCJaQsupBz5Xn0cFnTHwBAvBeoE5Phg/pSVkIpDYuN2Y5SzNo4Rq5z3QczUgMBz1AvjTBoYsIeq5Uk0ZlPIbp6pEZPwDW9wt6AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiLhqw8kNlLFEFtzfbidAWm03srbXyXpAgRspgW5fZs=;
 b=fTFjypfwBRPn8tu1+xC/v09gyBgK/NIkDlCK6Ars4y3CmiLgRsipHGgS7HsPS78eRAp/8Ksvn2NVo0raNZqP9zoPp3iKI6FafiaSn/8jvRRoObok6AeOcvNPq8knaRmByylbgFIqQmvRRrON3mYcmj2VRKdVAPAr7vcQUE/X8ISKpCoWEwwsiAXMQzGmY1ot+3ZX88vptFV8OW1+LEFuxcAKtBy3rLrYi0jJU00SJ08et3fPGkGU1/EziFMRAs8pWI0OaTz5/d0SYwlfIqwvKHx2TWXkTONNkntkKralIANNGX+Y29LvSLgrD71JJKddKxWhbzkDHC3DwngDFrkpXA==
Received: from AM0P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::11)
 by VI1PR10MB3151.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:135::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 11:03:57 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::2f) by AM0P190CA0001.outlook.office365.com
 (2603:10a6:208:190::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 11:03:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 11:03:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 12:04:28 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 12:03:41 +0100
Message-ID: <805c9dd5-50ca-4e2f-8fe8-b8a601fe4428@foss.st.com>
Date: Thu, 18 Dec 2025 12:03:40 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
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
 <20251212194341.966387-3-shenwei.wang@nxp.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20251212194341.966387-3-shenwei.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|VI1PR10MB3151:EE_
X-MS-Office365-Filtering-Correlation-Id: 867413bd-81d1-47ce-2419-08de3e2523ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXEyY0txdFpBYmJucE9pTzlpY0N4YUZRN3I1ck1ZV1dOckhmeWN3em1KMEhh?=
 =?utf-8?B?SWlNL2kwSHpFNTJ2c3JOQ0Jvd09KcUgvT05NbWI2Um80NlFYYUVoZm84T2di?=
 =?utf-8?B?UjRSU0tBUEFDMGVaSHlKNC9QaGVLSGNUTDFOL0dvRDRsZlRYSjhRa2Z6bDI5?=
 =?utf-8?B?RjVuY3puWkhwaWVTU0xCY3N5YnU4M2NvckEvR0dIZktYblFnckRrN1EzT3FM?=
 =?utf-8?B?Q0RwUDJuWGFxTEF2M1cvSFVGVW95clIvRGdrMTJDajN5SXZNNVFtVy9NQWh0?=
 =?utf-8?B?Z045UmF3QkhEVFo0ZjBxbTVWUUtoOEtra2VDL0FTdUt2bFF4WEYzWGRKYnpT?=
 =?utf-8?B?TVZSYXJWd2FJRHY5dkttWmxqM3ZZdjBrNFF1U1VlN1N2b0lIWVJSVjBoV243?=
 =?utf-8?B?SVErS25GWkJxZlVuOEFEbnpZWFlGWUkzbVBHWmNPNVJjeWVPZFNSbWt1K2JD?=
 =?utf-8?B?YXFqUzlaNGZsNktQTmJXZGppTHNpUUFIaUJFYlJCRUNCWThHNGsxTlZ4Z1lV?=
 =?utf-8?B?cVRMSVJlY0ptQkQwb250RmZNb2NSZ0c1c1g5ZFEvcDlsdmdBc1gxRTNmNGM3?=
 =?utf-8?B?MTE3S3FQQjZ4ZVFHQ2V2MGxqdTZXeGI4R3Y2ZXFxMEorWCtBcWtUWG45anpw?=
 =?utf-8?B?a2t2U1EweHZjZ0FIOWcrT1RNSG16NHdMdnhua0tEc2J5aWlNRzJuVUZ3N2h0?=
 =?utf-8?B?Zzg5cmpxb1RRVmdkazd5ZXhueGZ2SHYyOWFlb1g3VllORWNGbEUxTTU1Y0hl?=
 =?utf-8?B?NXQxdER3eEdRS1RPQzNIY3ozOS9VcUFiYmhlRGdsN0tpQnRPYUJJdVVMR2FT?=
 =?utf-8?B?clVwL1U1bnplZzVha3k1TURsd1hHVkZMVmdGQkFmcUgybzdyOUM5NERGK3ZD?=
 =?utf-8?B?OE11MnhQOWtReUttemdweWRRWG5ZdHlsT2RxZ2IvRU0wNmJsaEIrOE5TUmEx?=
 =?utf-8?B?dDlUT05QNWRmbXVYUGhYM240cWRSU0xSZGFvNklOYzkzVGJJQ3dWRVhBUFV2?=
 =?utf-8?B?TGFUaVk5TS9Bb2tqMm5MeTRRcFBmSnp6WVNCK1EwRUl1TFZLdm0wSFVRVisx?=
 =?utf-8?B?R1R2YXVNVjVwYlZIRWxtOUZWRFFkd3EyV1V2TWU3Vm1JL3hkbHdyQmpwYVZJ?=
 =?utf-8?B?cW4xZEtIL2h3VkdXMWpndTc4R3ZseWJWbmxBY3QxQUIyOGRqOXZiL21mTjcr?=
 =?utf-8?B?Q3p3RnNXaEhzWXVlRDY2K3V4VVBBdkhKWFNiR2liMXVBemNLUDcrYy9RYjJM?=
 =?utf-8?B?dFYrNG5lL2hTek5wVjliNUFkMUg3YklvbkFEM3FnaUljdEQvL0RzaHByZnVk?=
 =?utf-8?B?Q1BYYkVNSUNsM3llWDY2REZoMXg1SzdtQVlLZVVXQ1pacXZRaE9RMkRtVkI2?=
 =?utf-8?B?cnBWSUM1eTh6dVdIV1M4T2txRTFKUTI0VlBqS25VSWZtRzRpMUtFYkcxdVpQ?=
 =?utf-8?B?emNtaUJVanpndXVHczFISFlmbFJuN2pJdWRJYmdpWDNoc0FmOXFUcVpJbE92?=
 =?utf-8?B?djZYYVVpTDlodGswS0U1d0QvK1hjT0RXcnJzeXBjK1A0VkkxMVRQK3dHdTZW?=
 =?utf-8?B?Q0thbkQrRlNyS1J5U0EzWWJPZWFhNVp5alBwVSt3UHJPc1lMZTNwU3REUk96?=
 =?utf-8?B?V3psK2c5S0FBUkdMRVFvRHN3alNDeE4rNElVbnpFWTE1cjFEYmdwSjVGYk1y?=
 =?utf-8?B?ZDVxOVVUZDk4M3M0ZTF6M0owT0ZFTG04Mnp4V1Ftbk1lamw3VkpjU0JhSnE4?=
 =?utf-8?B?Uk1xSGpkWUJLVHJEZE1mVlRvOHBhSGZFamlNaFVoYW5hL3ZoQ3M3UnM5anFN?=
 =?utf-8?B?eWxTZGlNeDFVdjU4SnJSS3RvUVJDbG1IbTQranUxUTlXenFiMzdYRWRpNnk0?=
 =?utf-8?B?cWRWTzZrRU1QSDM2QjlNWS9QK2o5SFJ3VERPeitidlB5emFsakJnS0xEMU9r?=
 =?utf-8?B?R1lCZExGTmxIVlpNU0VpR2d1WWJyMDhIQmIwVUw0S21pa25laEErRzBFeXZ6?=
 =?utf-8?B?cXFYZXVPRktQY2hkMzkxWHJhV1RKVUZPN0NvTjNyN1R3aVhacDVUeElFZUFr?=
 =?utf-8?B?ait5aWhxYTBobXhwc0YvVzY4dFZlcmtLdmkwcWlMcm00cm9jc3dLRWFHQ0xE?=
 =?utf-8?Q?I/Lk07vE/W+0YKBeCspmd31mn?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:03:56.7751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 867413bd-81d1-47ce-2419-08de3e2523ce
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3151
X-Proofpoint-GUID: UkBs4YjPTR1nED32d0clusSCkHGc9HKo
X-Proofpoint-ORIG-GUID: UkBs4YjPTR1nED32d0clusSCkHGc9HKo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5MCBTYWx0ZWRfX7ZRcxlD1i6T3
 Np2Pn0oxeCl2IsZ2qo+Qso6sCSOXS5TCb24GC/6FZF+1E0+BsNMttW5Yo+NQjPJo85mjcqc3HSK
 alXtKJbMNdobualgyMBlQnoe/9gaSU392/EphWWiujgev3+ol8T1qzxHMzRmrUy6+dRWv2CclM0
 ka00ARYPGXAXluMOCIoiW+ywGdHOokVCkM+n0PuNqXExakc2Sy4PwE1D3pm/3+HdLb5Mz5l+MSg
 VPmlNcXLo+PUDRl38yiKWIWRHgxkK098JFQYDOB9E6i413sVlWLBJM07C6sds5B8dks/CCbru/N
 pYoBKMVTAPc3PtD+AlSMigws7kcXk3A838Xi4A/Khr7kFURg0b+4anAKVhw+LqGiJpfaWnfUKWX
 GBuC/VQ0RjmTIzd2/PTd0TwB55vPCw==
X-Authority-Analysis: v=2.4 cv=NZfrFmD4 c=1 sm=1 tr=0 ts=6943dfa3 cx=c_pps
 a=YgCVrCdv7G7y5nYQ0Hvsxg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=AzxG5ITMclMtBxL0GHoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512180090

Hello,

On 12/12/25 20:43, Shenwei Wang wrote:
> Register the RPMsg channel driver and populate remote devices defined
> under the "rpmsg" subnode upon receiving their notification messages.
> 
> The following illustrates the expected DTS layout structure:
> 
> 	cm33: remoteproc-cm33 {
> 		compatible = "fsl,imx8ulp-cm33";
> 
> 		rpmsg {
> 			rpmsg-io-channel {
> 				gpio@0 {
> 					compatible = "fsl,imx-rpmsg-gpio";
> 					reg = <0>;
> 				};
> 
> 				gpio@1 {
> 					compatible = "fsl,imx-rpmsg-gpio";
> 					reg = <1>;
> 				};
> 
> 				...
> 			};
> 
> 			...
> 		};
> 	};
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   drivers/remoteproc/imx_rproc.c   | 143 +++++++++++++++++++++++++++++++
>   include/linux/rpmsg/rpdev_info.h |  33 +++++++
>   2 files changed, 176 insertions(+)
>   create mode 100644 include/linux/rpmsg/rpdev_info.h
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 33f21ab24c92..65ee16fd66d1 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -15,6 +15,8 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
>   #include <linux/of_reserved_mem.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_domain.h>
> @@ -22,6 +24,8 @@
>   #include <linux/reboot.h>
>   #include <linux/regmap.h>
>   #include <linux/remoteproc.h>
> +#include <linux/rpmsg.h>
> +#include <linux/rpmsg/rpdev_info.h>
>   #include <linux/workqueue.h>
>   
>   #include "imx_rproc.h"
> @@ -1016,6 +1020,141 @@ static void imx_rproc_destroy_workqueue(void *data)
>   	destroy_workqueue(workqueue);
>   }
>   
> +struct imx_rpmsg_driver {
> +	struct rpmsg_driver rpdrv;
> +	const char *compat;
> +	void *driver_data;
> +};
> +
> +static const char *channel_device_map[][2] = {
> +	{"rpmsg-io-channel", "rpmsg-gpio"},
> +};
> +
> +static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev, void *data,
> +				 int len, void *priv, u32 src)
> +{
> +	struct rpdev_platform_info *drvdata;
> +
> +	drvdata = dev_get_drvdata(&rpdev->dev);
> +	if (drvdata && drvdata->rx_callback)
> +		return drvdata->rx_callback(rpdev, data, len, priv, src);
> +
> +	return 0;
> +}
> +
> +static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev)
> +{
> +	of_platform_depopulate(&rpdev->dev);
> +}
> +
> +static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpdev_platform_info *drvdata;
> +	struct imx_rpmsg_driver *imx_rpdrv;
> +	struct device *dev = &rpdev->dev;
> +	struct of_dev_auxdata *auxdata;
> +	struct rpmsg_driver *rpdrv;
> +
> +	rpdrv = container_of(dev->driver, struct rpmsg_driver, drv);
> +	imx_rpdrv = container_of(rpdrv, struct imx_rpmsg_driver, rpdrv);
> +
> +	if (!imx_rpdrv->driver_data)
> +		return -EINVAL;
> +
> +	drvdata = devm_kmemdup(dev, imx_rpdrv->driver_data, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	auxdata = devm_kzalloc(dev, sizeof(*auxdata) * 2, GFP_KERNEL);
> +	if (!auxdata)
> +		return -ENOMEM;
> +
> +	drvdata->rpdev = rpdev;
> +	auxdata[0].compatible = devm_kstrdup(dev, imx_rpdrv->compat, GFP_KERNEL);
> +	auxdata[0].platform_data = drvdata;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);
> +
> +	return 0;
> +}
> +
> +static const char *imx_of_rpmsg_is_in_map(const char *name)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(channel_device_map); i++) {
> +		if (strcmp(name, channel_device_map[i][0]) == 0)
> +			return channel_device_map[i][1];
> +	}
> +
> +	return NULL;
> +}
> +
> +static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
> +					  struct device *dev,
> +					  const char *name,
> +					  const char *compat)
> +{
> +	struct rpdev_platform_info *driver_data;
> +	struct imx_rpmsg_driver *rp_driver;
> +	struct rpmsg_device_id *rpdev_id;
> +
> +	/* rpmsg_device_id is a NULL terminated array */
> +	rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL);
> +	if (!rpdev_id)
> +		return -ENOMEM;
> +
> +	strscpy(rpdev_id[0].name, name, RPMSG_NAME_SIZE);
> +
> +	rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
> +	if (!rp_driver)
> +		return -ENOMEM;
> +
> +	driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
> +	if (!driver_data)
> +		return -ENOMEM;
> +
> +	driver_data->rproc_name = dev->of_node->name;
> +	driver_data->channel_node = channel;
> +
> +	rp_driver->rpdrv.drv.name = name;
> +	rp_driver->rpdrv.id_table = rpdev_id;
> +	rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
> +	rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
> +	rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
> +	rp_driver->driver_data = driver_data;
> +	rp_driver->compat = compat;
> +
> +	register_rpmsg_driver(&rp_driver->rpdrv);


I still believe that creating a dependency between remoteproc and rpmsg 
is not suitable.

Please correct me if I’m wrong, but since you define gpio@0 and gpio@1 
in your device tree, you call register_rpmsg_driver() twice, creating 
two instances of the same driver. To differentiate both, you fill the 
rpdrv.id_table with the node names "gpio@0" and "gpio@1".

In a topology with two remote processors, each needing rpmsg-gpio, the 
same situation would not work because you would have two "gpio@0" entries.

What about using the ns-announcement mechanism on the remote side to 
address GPIO port/bank instances?

In the rpmsg-gpio driver, you could define:

static struct rpmsg_device_id rpmsg_gpio_id_table[] = {
     { .name = "rpmsg-gpio" },
     { .name = "rpmsg_gpio-0" },
     { .name = "rpmsg_gpio-1" },
     { .name = "rpmsg_gpio-2" },
     { .name = "rpmsg_gpio-3" },
     { },
};

Then the match between the device tree and the rpmsg bus could be done 
in the rpmsg-gpio driver by matching the rpmsg name with the compatible 
property plus the reg value.

Example device tree snippet:

cm33: remoteproc-cm33 {
     compatible = "fsl,imx8ulp-cm33";

     rpmsg {
         rpmsg-io-channel {
             gpio@0 {
                 compatible = "rpmsg_gpio";
                 reg = <0>;
             };

             gpio@1 {
                 compatible = "rpmsg_gpio";
                 reg = <1>;
             };

             ...
         };

         ...
     };
};

With this approach, rpmsg management could be handled entirely within 
the rpmsg-gpio driver, avoiding the need to register multiple instances 
of the rpmsg_gpio driver.

Regards,
Arnaud

> +
> +	return 0;
> +}
> +
> +static int rproc_of_rpmsg_node_init(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const char *compat;
> +	int ret;
> +
> +	struct device_node *np __free(device_node) = of_get_child_by_name(dev->of_node, "rpmsg");
> +	if (!np)
> +		return 0;
> +
> +	for_each_child_of_node_scoped(np, child) {
> +		compat = imx_of_rpmsg_is_in_map(child->name);
> +		if (!compat)
> +			ret = of_platform_default_populate(child, NULL, dev);
> +		else
> +			ret = imx_of_rpmsg_register_rpdriver(child, dev, child->name, compat);
> +
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int imx_rproc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -1114,6 +1253,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>   		goto err_put_pm;
>   	}
>   
> +	ret = rproc_of_rpmsg_node_init(pdev);
> +	if (ret < 0)
> +		dev_info(dev, "populating 'rpmsg' node failed\n");
> +
>   	return 0;
>   
>   err_put_pm:
> diff --git a/include/linux/rpmsg/rpdev_info.h b/include/linux/rpmsg/rpdev_info.h
> new file mode 100644
> index 000000000000..13e020cd028b
> --- /dev/null
> +++ b/include/linux/rpmsg/rpdev_info.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2025 NXP */
> +
> +/*
> + * @file linux/rpdev_info.h
> + *
> + * @brief Global header file for RPDEV Info
> + *
> + * @ingroup RPMSG
> + */
> +#ifndef __LINUX_RPDEV_INFO_H__
> +#define __LINUX_RPDEV_INFO_H__
> +
> +#define MAX_DEV_PER_CHANNEL    10
> +
> +/**
> + * rpdev_platform_info - store the platform information of rpdev
> + * @rproc_name: the name of the remote proc.
> + * @rpdev: rpmsg channel device
> + * @device_node: pointer to the device node of the rpdev.
> + * @rx_callback: rx callback handler of the rpdev.
> + * @channel_devices: an array of the devices related to the rpdev.
> + */
> +struct rpdev_platform_info {
> +	const char *rproc_name;
> +	struct rpmsg_device *rpdev;
> +	struct device_node *channel_node;
> +	int (*rx_callback)(struct rpmsg_device *rpdev, void *data,
> +			   int len, void *priv, u32 src);
> +	void *channel_devices[MAX_DEV_PER_CHANNEL];
> +};
> +
> +#endif /* __LINUX_RPDEV_INFO_H__ */


