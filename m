Return-Path: <linux-gpio+bounces-28474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C427EC5C3FA
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 10:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7CAF44F33AC
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 09:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0C03019B3;
	Fri, 14 Nov 2025 09:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="D8pnqvue"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9B42F6567;
	Fri, 14 Nov 2025 09:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111794; cv=fail; b=W9xUBKCOgYPWIkEjwMTG0Q1Meq+R9riXBtw732IzN1me9gk7RlxM9LNjqKWwZvjHkR3lwU/C/VBZt3Z8Xb4fd2KCMUIFss5IG8C/lCR0YB6bFqwAXxMB68P64XKgUt78K6C3WstpDIU0Crn3Fb/pKvPZj6MUMtGepAk5/LAGDfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111794; c=relaxed/simple;
	bh=PYcmvjT0CF0pQiMOQY0iuRjiMGXMudQJeyIAqTOIYXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YW7QrjEGSscTN1fliqkJwtSSiY7ohTYZxC/yKmFkvN3AVpN4vXYmcrPwpEGGL19a2ALIK+xtD8pDnT0njWCa1U1QfXM4UTPZH8xC+neThrc77KWR5ItbFJT3xKQCQ8k5Slq888/RkTDhj7euA2HNUUd5n9gbxgnkTMkL6B2dQJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=D8pnqvue; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE91DDs2168964;
	Fri, 14 Nov 2025 10:16:21 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013042.outbound.protection.outlook.com [40.107.159.42])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7kj31f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 10:16:21 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhPJFMnOLwrpp938LWLtwBqPtEYpuI40CeKkuUSEfsE2jNObDNTNjA0vuvmoKNYBownvqTijhojn5qmcfLvJysju74r/MNLKREWm9VktSrrsHkQ9G9CJnh1yfQ4vHLDxNDYlNke3bl4eG233kHxph+GH/6K2h6dxFmgWig2SV9oW7qmH9RdITOBvOOjO74ycVg1vQRbrkr9skzN0xCdA8Srg3IO080EAgJWGMUCjVpqoNoMisU0IYXAHaQ44A/t/ZL+uRJkYwpHNmhmB/ADn0ylE0tcnz4urUPxbPfbYw59a4fNm516VCBn0UCpWn6YOOkv7g0EcT7PlBc/n4sjHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4lCS6xCRhVFRmV1tj7/lMJCr1j42f0wRGyWNU9ggs4=;
 b=b1KPvBVrHuJZZvr0mBKKBQ2pO4MnNFCPgimTIJO1U8qH/miVtivBZlNWlNQswVaimWhmFek+gycwu2DmvVnSJW8Ykp2Y93dI0hojItCmwf73FY+ajnGvA7aOWIb0TVvf0WJtqO/KGsw5J/rNVQ+VU6Iew0lzUXi0DXDlUKSxn+r7cd58Dr/xUowzj6t/zbskmuCEZvXXx1TvKoQoiuEDZwEgpxyW5R8IOvt0tUoGxIKqhs8JfD987RE5RRxJJrn9StB0lsDOl0fxl0Z+fGm0vQUAjsd1eXC1z55y9Id5y3bXWjeEfkDxlYtV1MHFeBeGtfw46Y6eAR0q3bzDq4KJmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4lCS6xCRhVFRmV1tj7/lMJCr1j42f0wRGyWNU9ggs4=;
 b=D8pnqvueWbXdiuYKSp93iZoNTFZE5LEVX+mDZlTHkM7tU2oNKA8SDzHAW8R493nWsm62QgzBtS+wjJbNS0YZcsbfjbKla+XA/8HChFrdpYvpwe0mYaoSQ2dJfc0gIa9sjw+dEffwIHBLmjkjb5iydmpYYf8Wd1w0tGigOHGATHjdFW5LapAdOylQnIIOtQK1POQ3cSC0HsGH8YQnBuRrRzcgyIfHZE6vIOMLItVS/2uCr/kHoftXli8hJindEQixLFLO9m1TYTVZ01IPDQGdX/eOARRPROLzSB5PuUegJyxMq+NMQOhqjdcgJvFNOsk2capSYWTWxvLHkSue2efv7w==
Received: from CWLP265CA0301.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5d::25)
 by PAWPR10MB7818.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:363::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 09:16:18 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:401:5d:cafe::c6) by CWLP265CA0301.outlook.office365.com
 (2603:10a6:401:5d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 09:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 09:16:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 09:35:41 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 09:35:28 +0100
Message-ID: <c1b9c5db-1096-4c7f-b89a-0fa7e8ffcc84@foss.st.com>
Date: Fri, 14 Nov 2025 09:35:27 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] arm64: dts: st: Add I/O sync to eth pinctrl in
 stm32mp25-pinctrl.dtsi
To: Antonio Borneo <antonio.borneo@foss.st.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
CC: Christophe Roullier <christophe.roullier@foss.st.com>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-13-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251023132700.1199871-13-antonio.borneo@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|PAWPR10MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 29bdd014-7845-4cd9-e126-08de235e77e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHUwSkJmRWRwQ1lTN0xHa3l1b2xLTzhYYWJsTVVZQnNXK2w0WkswQ08xMWZR?=
 =?utf-8?B?RjFzUDNWQVFHc0xyQll4TGpna1dNMFpvVkg2NGxjMnJEemNneHZoaGtxMDRB?=
 =?utf-8?B?VTZ1TG4yZ1hGNUlSN0ZGM05KRWhkTmZFSndQSWtBaEd0aVJtbDhOSzlFUG02?=
 =?utf-8?B?Yk1WSk5qajk3ajVSaG9hZm1HV3FVa3I2WUZmVnpvenBudzdvRkIwd0gxaWNS?=
 =?utf-8?B?WkVhSzNvbStnVWpCaHNOL0lZRGtaNDhkcnBtREd4cVJEelhYU3dHeUFRYXZL?=
 =?utf-8?B?ZVMxaGRLdUZnTENkZzM2ekFOb3RaeEhnMlN0MTByQmlaSjhtc2xSb250Q012?=
 =?utf-8?B?dTdWWi9NeTRPVlNwd3BXMEwwVWdRTjFwSy8yYmR1Vjl6aEh3Qk9zWENHQUVZ?=
 =?utf-8?B?bllCVmJlN2ltRXdXWUdkOFQxZWtDMGR4Q1ByZ0tkdjJldXZTMHZEaVVFNlBx?=
 =?utf-8?B?ZlN5NVVBNmsvZHpWR3Exanp2LzEyUUJFSjdPY2ZqMlhVVmd2WXFjOFRLMkRk?=
 =?utf-8?B?ZkUydUhxV1V5c0piWHRlSFgxSG5XTml5alJEUllPNjY2RWhjdEVPTTZwa2Zn?=
 =?utf-8?B?OEFKMnpGS2lTNUdRMkpSMEN3TEF2YXd1SkVpRk5LVHkvUmw4K1JsUWJrdjMw?=
 =?utf-8?B?SXllNVNPQXZCRFc4cW54WGxmN0d5WlE5UmpTSStkVzJ6RWgwV1laVWVzNXNk?=
 =?utf-8?B?ampaTmpWTXcwMStVYnFtT1BYbld2TzRRT3BqQTRKVlNQOFZrcll2UVVzUFVt?=
 =?utf-8?B?VEVXTzg3TVlEb3FFTnppenZ0ZkdkMFNVU2Exelg3NXViSzZSdUUydEhpUXQ3?=
 =?utf-8?B?cnVBQjF5Y1grczJ6eTErM3dMNGh1OWt4TTVQdTgwY21lWnNZVzBwam5DMEl1?=
 =?utf-8?B?ZlJPTHR6NldYdWlydTNYekJrLzVkL0xxRFhiWjVMaXVmSlcwL0dScU1kejNZ?=
 =?utf-8?B?ZGlQV1cyb05EMHBmR21KU0lZcnkzMGVHakt3YTRsWkV3WjkrVmcvelRMTjdH?=
 =?utf-8?B?eDZudWoxaGI0aHhvcitqS1FRMWJ6azIvcG5Yd3R0OU5aZzhwRndLZnFyWHJm?=
 =?utf-8?B?bFpaT0UvdVE5TkQ1QUVoSUhOZlRzY2Vrc001cWYwUVhiWEZibGx3N2U0dDZY?=
 =?utf-8?B?bTJFWFJTWXBwbFNQOGRnWm5yWXFDMlp2ZkZWWGxYVSttUXFKR3F3ZUtmbFA5?=
 =?utf-8?B?SlBxSnFHTElISFFaYzIxSnB5Qnk1SHlVbzk3WU9mRlhRQ0tzOWhNa2gvclp2?=
 =?utf-8?B?eVhLbFoyQWZaQUNsejZMeUpMUzJSeGxJTkYwNjN0d3p4TE5LZXRzUnlDZGly?=
 =?utf-8?B?a01XUHd3Y3Y0eUJjOGJVY2Vwcmtzcmx6SjVlOUgrOVlmbjhFYkNWTk1mckJs?=
 =?utf-8?B?QzBBaXhtaDJPYjhiN1ozNFBJUG5VUFVHVUVwMnpBVEsxdDAyQ3BwVkczeVY0?=
 =?utf-8?B?a0F1ZFBwT0ozc2cvRVdUVTJjWEZKdDNZbVYxVjdhckh5eGh4TFhNaG1BQmk3?=
 =?utf-8?B?TGZXSy9zTUVjMzNlaUtMdHlETnVWY1VyVzA3YlJOSS9NK2hpUTFsaFJSclEw?=
 =?utf-8?B?bkltQm5pc013MmlLTDNNOGNVMXI2WFNDMVBTd0JUZTY1eGJHWWdUd2F1Mk85?=
 =?utf-8?B?MDRoMVNMeFpHUldEOUpzaU5CZzZxV0krdkRuNFBkN3RWTTJrdkh1MGxYZ3dr?=
 =?utf-8?B?WjNiVzBiOExtTlFNZnFvV1ltN0hPenIxTENiUldiOWdOOXo2aUphbG9vYVZI?=
 =?utf-8?B?K0wwR0JqMlJLc1duTlBHVTZjd1RNalhmUGh2U0YraFltL29la1B1dVYvNUtk?=
 =?utf-8?B?RU9ISVJOSnhYMWtwdHJaQ1QxdmNibUR0eUpIZEh3V01uWEpnUFVjTkdhVEg2?=
 =?utf-8?B?M3BRbmlWdzJORWRJc0REU2E5UkdmTmNsY3h6Mk1aaVZzend1VkVDVDZBeklU?=
 =?utf-8?B?ZnprTTBPaEtrMlRMN1V1SnV3MzlwRDhiaUtDVDlwSnZmK2l0NlF6WTJCajh2?=
 =?utf-8?B?N0Q2dEk3dk1tNm9mN3hEZ2dtbllTR1E5TTZ2cjNRSkJtcWpORXVXekZYWWUv?=
 =?utf-8?B?TEY0OHhMV3FZMzhzcHlLQlk2b2lxb2hBaGlZRHZxUlpmN05hN1pTV2x1MHlv?=
 =?utf-8?Q?kzvtWTjMBrheIxD4iVDDHLI7M?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 09:16:17.7963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bdd014-7845-4cd9-e126-08de235e77e8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7818
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA3MiBTYWx0ZWRfX+GfPt81hTmZG
 48XKBzk5RbfEWvFl7CDUfe1GXFqBe9GEBtu/Qi6lN5dkJgbjekTfSfzQRMCB9pdMdzXcxunRSAw
 RkVuvtgfyeZWaBZ0cFEUCyGkRgj80FdMaVCJfjCGlWrMXzr1nZA5YSf8poKSkPYaiDQudm29NMD
 XEWPFTT6QHuXEZjKPBmUV/2s+V6j+kZP4CPVodplI3vhGBxCHS0uPCsVKKdfaEoxQsJguTOU9ck
 rnKpv7LNkrN9YQf2KqVkKh4ipFt+9mxWwDzWQKp7ZHp1QYmBrtAYCyn5/YRNgyQv2eKXvRTQqw1
 NPbqZ8nGDyyxA6wx4RPBu+uleIWUnwow/W9gwehUlchXsMOKSuscKE+qpiB+VeAasp+LBCaDg+j
 TweBMlnYLdBkvUfWdGOO7C7IyAtV4g==
X-Authority-Analysis: v=2.4 cv=Xsf3+FF9 c=1 sm=1 tr=0 ts=6916f365 cx=c_pps
 a=uqI48Og7j01sfHQdf+PlOw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=bEdzbQPX-lmQyXBs-psA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: VnvxG2HBi8uwcqe4K-rmMAQBQJWjLuXT
X-Proofpoint-GUID: VnvxG2HBi8uwcqe4K-rmMAQBQJWjLuXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140072

Ciao Antonio

On 10/23/25 15:27, Antonio Borneo wrote:
> On board stm32mp257f-ev1, the propagation delay between eth1/eth2
> and the external PHY requires a compensation to guarantee that no
> packet get lost in all the working conditions.
> 
> Add I/O synchronization properties in pinctrl on all the RGMII
> data pins, activating re-sampling on both edges of the clock.
> 
> Co-developed-by: Christophe Roullier <christophe.roullier@foss.st.com>
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> index e0d102eb61769..c34cd33cd855f 100644
> --- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> @@ -38,6 +38,7 @@ pins1 {
>   			bias-disable;
>   			drive-push-pull;
>   			slew-rate = <3>;
> +			st,io-sync = "data on both edges";
>   		};
>   		pins2 {
>   			pinmux = <STM32_PINMUX('H', 9, AF10)>, /* ETH_RGMII_CLK125 */
> @@ -53,6 +54,7 @@ pins3 {
>   				 <STM32_PINMUX('H', 13, AF10)>, /* ETH_RGMII_RXD3 */
>   				 <STM32_PINMUX('A', 11, AF10)>; /* ETH_RGMII_RX_CTL */
>   			bias-disable;
> +			st,io-sync = "data on both edges";
>   		};
>   		pins4 {
>   			pinmux = <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */
> @@ -142,6 +144,7 @@ pins1 {
>   			bias-disable;
>   			drive-push-pull;
>   			slew-rate = <3>;
> +			st,io-sync = "data on both edges";
>   		};
>   		pins2 {
>   			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* ETH_RGMII_CLK125 */
> @@ -164,6 +167,7 @@ pins4 {
>   				 <STM32_PINMUX('C', 11, AF10)>, /* ETH_RGMII_RXD3 */
>   				 <STM32_PINMUX('C', 3, AF10)>; /* ETH_RGMII_RX_CTL */
>   			bias-disable;
> +			st,io-sync = "data on both edges";
>   		};
>   		pins5 {
>   			pinmux = <STM32_PINMUX('F', 6, AF10)>; /* ETH_RGMII_RX_CLK */

Applied on stm32-next.

Thanks.
Alex

