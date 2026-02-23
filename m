Return-Path: <linux-gpio+bounces-32040-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMLaMCNknGkoFgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32040-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 15:28:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C4D17800C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 15:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42948311708D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 14:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4B8285C8E;
	Mon, 23 Feb 2026 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="aPyOv3s2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010057.outbound.protection.outlook.com [52.101.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE2D286D5E;
	Mon, 23 Feb 2026 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856693; cv=fail; b=FhT0dNYELHz+b1Pzw7/+pwYjzw4lrTvazwQwTwKtSCgQyMchJkhBLuNu78IJU9a86yeI5qVTDTQPqMuwu2m2QIl5+ieJeApP+MQZ1Dvtf4qZfUKkpVbYAZswBwRDlq6jWsVSyrOxgWHUo7k7+Ki4shzGy5c/uZr5SRh86XWAfgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856693; c=relaxed/simple;
	bh=02uLXYfv+5QROnxwh5exPesXClFhXtByqrlXY6melr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HrKELdU3Z60WloPp2RQBMtvSx3KOzRt1cbDxqj9jl2ruxVRjVrEKj7KVniZ0tyQHkrGduAfgmjzxS+HEtw9D2itru0IOTjD6J3teupXkSFuYKWViCqHSvMJnZnsi+tReI0WiJsPTaDGHxfLw6wMoQPnS8vcS1TKxEsQBjjVWilU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=aPyOv3s2; arc=fail smtp.client-ip=52.101.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9NdyYP+uky9jVYo+d9k9fmM8/cB/bjL51gppZ6akv72f6DJHVnWY8fHiVUcZDIe0hjue5r5nz94cDX2dBwfyijkuyG8V3Rw9mGvVvtk+Hb6U4REGJBUwl7D1SKKpT/pBhIBDyVDmU6uCxyPwMKxXaP6FAKqkDxU91q2CNA5y/8R0Uxu0v8UIZqfmjCYTUGYJR0H3iT7s7lCER3JNtbLTGzqvUETmTM7rR+V8wRiB82seyOpYabG+lHwKcuG3e+okHFqEqGlV7SP6gRhgj3lQwMW0ANElOL7eSzrH06N56CgfUknt9rFkQX3cCs1N2TiYdzbOE/uesaphVEth5nipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cq9p+Ax7FXrCAL0P83GVe+3Gm53y0Op6mFJvUwrKNyI=;
 b=oUpPurNMVLrh3T2HF+nGtZWfWeob+E2dVizNEbeDxEzeHMyh8/g4C2qIjz1E5JkJ3a8/E5KcAQVBB+AtwH3m57Wx2dcngdK/dc2IrXhYa2lEMKAPA2YXUQ+0jQ4giuYlx/gvRrlJeJO6fhNDhxN/u3J8OqY3+mR7qRsbH9zn5TMJKuPS85IrMakaAJCOYIx3maJmy6YPGEwbIWwZ6lMbyk9bXFlSeXQC1EhDJPLYLwGUkWeYcxi9yxxip0Zih2M97odRArlusW5EuGjikIXgjLVEKMkco2wdus/olvWAilDQcp9ExyfBBK0j3m+OPy9SQhp6JPqL7ac1Hj3ExA45OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cq9p+Ax7FXrCAL0P83GVe+3Gm53y0Op6mFJvUwrKNyI=;
 b=aPyOv3s2/S2if0MHwdtdb7R3LLyJc0z29iQ3UGLypMhcPel/qeAhqMNns3fp0APpjfIP+yJKDAR3esrIinSrt6JEPuIEdiV7g7DhDsyHc304gh4vSEViDIWznNZfnLS2dZ+1bYgeBcbfMrK1qyaVX+vqfE9bPpMDrq6e3rI8YbuJJwSk22mtAgVcDZRQ3AzzemLaqYME/ZFtFSHbl6jgP75ztmPTIdqiL4NihuU5wvemRVqf0/7Rz1PxGbzXQ347Zun/mxGJBvn+zVm+7OVe/FrOq1Qr+vOr6YFWRa/ILi8GOaiRvVKcSIfAyVJ2vddfJxhlgX12q665fC8vCwo05g==
Received: from AM8P190CA0005.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::10)
 by GV1PR10MB6516.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 14:24:47 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:20b:219:cafe::f8) by AM8P190CA0005.outlook.office365.com
 (2603:10a6:20b:219::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 14:24:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 14:24:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 23 Feb
 2026 15:27:01 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 23 Feb
 2026 15:24:45 +0100
Message-ID: <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
Date: Mon, 23 Feb 2026 15:24:43 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Linus Walleij <linusw@kernel.org>, Shenwei Wang <shenwei.wang@nxp.com>
CC: Andrew Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"Peng Fan" <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A791:EE_|GV1PR10MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4d156f-e8e5-4c6a-35b6-08de72e74bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3FOOUR5dFprUGV1U2lGZjV6bGJ3SWlhQWxQMXRQeTY1LzMrNU5PVVBqWGxG?=
 =?utf-8?B?V2dtb1NpWGcyZjdBM3pld1IzYW4yOWY5QnFQOEtNeHBkMFZGem5YK3JhT0Jz?=
 =?utf-8?B?UzVxQXNUMURqMi90bjUrQXp3R2ljalRIQU9VdVRjdnl6MWQ2WlZ5RFZPREpS?=
 =?utf-8?B?bXd2V1ZicVBLNGFMQkp3aGs2YjdWdzdKbTBkSXpQM3daZ3RHYjZHd1hQajk4?=
 =?utf-8?B?RE80TVZBazllYWdqMUFQbnN1UktOUkNYOUlnN28zdzAwU2RPNGZHNXZtR0d3?=
 =?utf-8?B?MmFld0JoK0EvTUdKWnVRY0l6cW5GV3ZlYjVqL2trOWFPZ2N1QlFoS0pJM3la?=
 =?utf-8?B?WG5XYTdLN1pJZ1ZiK0kybmp2bWppQmlwYUlNb2hOamQ4SFUwYjFndllIdGVh?=
 =?utf-8?B?TzNsWDl1bTJUQWppNG1KSEdCV0Y3Sk05NHQ5a1ZIZzRKU0h3VXcxMTYzU0Jt?=
 =?utf-8?B?WENyUWJHbnMxdzRJUjZHV25odmY2MFQ1VHJ0UTlveXBOc1lsV05LSHVJM1JW?=
 =?utf-8?B?M3gvS01xNHluMWFjL25EajlzNmJuVk1TZDNtYjdGWlNVeEFoeVorTlQ1V3pN?=
 =?utf-8?B?TVk5eHZVVnJMKytiSVpTWGJZcjRtTDF5ZzhEQW1nY016VDNRL2MxK2RvSUNE?=
 =?utf-8?B?cUIranluNkpYTmxHYktDa05tV2JOeUIxZXFrU3JKSmMzNFdkT1N1bWlPeWdS?=
 =?utf-8?B?SmdFMldrMFI3cWV2TVhUVVVPaTZQZ0wyK0U1ZG1EQlh4OUI0Nzd4YnVpbzcw?=
 =?utf-8?B?Z2x3NUhndTZ4TnN1Y3p3YVBEZFJhSzJ2elNKTWh6alkzNWNnNWZuUUdIVGl5?=
 =?utf-8?B?dlVBdGh0dUttSzZ3aThjSmtNVDlPQ3NmVVR0RTZMVWtuR1dGcE9kdXIrRDFu?=
 =?utf-8?B?L1RJWlIybHc5N3BZMHFKM01ZN3JtS0JPTG93RHVxOU13N2c0eTZ3T1NVcUZT?=
 =?utf-8?B?WGNhYzJqWTZ2eHB3dWM3TllpWE1KZENMZksrK2Y4cHArWkhTcnBOMTAwNS9o?=
 =?utf-8?B?TERETHZCRGlnWktlc2V6KytQeW8wT0d1Vm45K29HZWR6REJ2SVVDQzZ6VG13?=
 =?utf-8?B?MS9vVnVaekhxU2d1Q1Z5TUtwZGJoTitmYUdhcmFST2xyNi9rZkdBUDJhSTNI?=
 =?utf-8?B?aTNkemU2NHQvUkt1WU0zaFpVOXlEdVF6N0FqQjhkTFh4UWRXYWhnMjlMZ1BQ?=
 =?utf-8?B?RGI4TjQ0cUlXRGkwWVNYU3M5eTZlR2NWS2VjdXV4UUVIRnVEbWZSbG5FOFRF?=
 =?utf-8?B?cEp3SWFwZk05N3Zyci9mK2xCNG1EckVSK3p4TDJHb1dNYzNyaHJLYUtkMjVB?=
 =?utf-8?B?SzFMaWxJdDNRUmVpdlVDekp4aGhUclE5Um11eUdIUXZNY1FmRU9sekJlRHAy?=
 =?utf-8?B?YVp5NmxmajFiZ3VrQmh1bkVZWENYUGhIRUNwQnlTaEFuWmFPOWRNN3JBUUNY?=
 =?utf-8?B?c2tBczNKd1cyOTZ3bERxUXE3MUhqaXhLdzhEdm56Y1RXK2hST2pXa1pYSysz?=
 =?utf-8?B?dmZIUGhLVjJIUTB4aUNZTFo1RG10RWtzR3pPTU53WUNOMFJXY1BGeGZKYWNR?=
 =?utf-8?B?aDZCUDJrZmpyWi9sZmRybzJ0R2hXNUw2OFpMMHVzcDhaTmw4ci90eGUrSmhI?=
 =?utf-8?B?Vk9paEprbVZpNjBvTUlTMFdIQWI1OGtvd1JIZ3NwZmNDeUhRTzdTdGdtamxi?=
 =?utf-8?B?Q3BrakRmTytScUcwT0g0OTM1WnRlbFU5K1RNeTFQN0JpeHVBQjlYcTVrSWtv?=
 =?utf-8?B?ZlhWS08wVDhsb0tjTm5YL3lGM1g1dFlhaVpOR1FUL1dYS2dhdzJQeGZFeUx6?=
 =?utf-8?B?aDF2Vjg1bHdQclpVcnVrZmhVeEUybXlBVThMUER3YlpCdTZqWWhLZitUejhS?=
 =?utf-8?B?M1lvekpUejJsYVE5dkd1S2RiaktBMS9yQXRjbmpIS3FheHZDOGFGZUFaWGdL?=
 =?utf-8?B?U1FRZHNRK1E4VG5aV0cweC9uVStNQ3F0M2gyVk1WMjJXZEtjR0tLTEp3UXZi?=
 =?utf-8?B?UlgvQjgyTmp0cUpzVHlhWFk2aGdQRkMralV3R2MyaGowcXVkNFkwZ25EUEMz?=
 =?utf-8?B?SVducVJON1BQYldVeExnRE1xWlZZdmlXS0Y5bWE2RlpCNGdlOGJib0dNYmRB?=
 =?utf-8?B?QkpwQ1RxZ0p0UHBnZDBPYm1IRU1rM2NJN2M1YVlkY3R5bTd3bW9RK053UXht?=
 =?utf-8?B?azlTcEx0aGxwMUhjNDhsdG5ha1FLSWg4YWsyL1NSYlllMk0rL21yaGRmWHNz?=
 =?utf-8?B?MThDTHNUYmg2MjRoR3pzSStNNHBnPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ikV5BsX8SRIQc/UE8inwvpvw13u35cjAwxqTIkoM6AVKhOMXAuvsCKwkL5DnmbjJb68fmH6G5qqtYdxp+67BXAmsiQ3WoDrRz8exODpGGiWMiR9cm9dbkPvr8iA5d9Wd0MMz9YDkkYAM97RAhp0qsT5vtGp0NOzwyzKtFbPjT1x1XfaFl4l8RJXqtfEtWrA/QvaB+KuaGG+5mYkmFGXulrmiTgSEEgEOgn+gKmzM1+gdlWnjOu7+SUN2u7idLRwdGan8CaCRD/OUkxxXkvDxAWf/tuGZtAsEf7Hb3mPn0cdOc+pcmp/jyrQcFuotUX5lEJDDoZPJeay13QHbKiTkcoT6MZqAeXB6Ko4kM3SeNIGD9NbEZ3j3ObuEBNYEzvnrO1RrvmP+SYeyxQ8+MDz35yGT9TYMDk4uMWfkFHHymLtioq1vrdLnb29X/7icEenf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:24:46.5702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4d156f-e8e5-4c6a-35b6-08de72e74bb8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6516
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32040-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 59C4D17800C
X-Rspamd-Action: no action

Hello Linus,

On 2/22/26 15:48, Linus Walleij wrote:
> On Fri, Feb 20, 2026 at 7:57 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
> 
>> Given that, I’d like to hear from the GPIO subsystem maintainers — @Linus Walleij and
>> @Bartosz Golaszewski — on whether a driver that works with the current hardware/firmware
>> design could still be acceptable for upstream inclusion. My understanding is that upstream
>> generally supports existing, real-world hardware as long as the driver meets subsystem standards.
> 
> What a swell party this has become.
> 
> In this kind of situations I usually refer to
> Documentation/process/management-style.rst
>

Thank you for pointing out the document, I was not aware of its 
existence. Very informative!
That help me to understand you proposal below.


> What is the message I as a maintainer is getting from NXP regarding
> "gpio: rpmsg: add generic rpmsg GPIO driver"?
> 
> Arnaud, who is the only person in this discussion who actually wrote
> a standard RPMSG driver (drivers/tty/rpmsg_tty.c), must ACK this
> patch if it wants to call itself a "generic" RPMSG GPIO driver, if he
> does not, then it isn't.

In Fact there are already 2 "generic" drivers, the second one it the 
drivers/rpmsg/rpmsg_char.c, both are used on several platforms.

It is in my plan to test the rpmsg-gpio on ST platform if we go with the 
generic approach.

> 
> Is it generic? If it is not, let's call it "NXP rpmsg GPIO driver" and rename
> files etc accordingly. Maybe it can share code with the actual generic
> RPMSG driver once that arrives, that is more of a library question.

I would like to (re)express my concerns regarding the creation of an 
NXP-specific driver. To clarify my concerns, ST, like probably some 
other SoC vendors, has rpmsg-gpio and rpmsg-i2c drivers in downstream 
with plans to upstream them.

If we proceed in this direction:

-Any vendor wishing to upstream an rpmsg-gpio driver might submit their 
own platform-specific version.

- If NXP upstreams other rpmsg drivers, these will likely remain 
NXP-centric to maintain compatibility with their legacy firmware and the 
nxp-rpmsg-gpio driver, leading to platform-specific versions in several 
frameworks.

- The implementation will impact not only the Linux side but also the 
remote side. Indeed, some operating systems like Zephyr or NuttX 
implement the rpmsg device side (Zephyr already implements the rpmsg-tty)

Maintaining a generic approach for RPMsg, similar to what is done for 
Virtio, seems to me a more reliable solution, even though it may induce 
some downstream costs (ST would also need to break compatibility with 
legacy ST remote proc firmware).


In the end, I am just trying to influence the direction for RPMsg, but 
based on the discussions in this thread, it seems others share similar 
expectations, which should probably be taken into account as well.

Thanks and Regards,
Arnaud


I just want to

> 
> Yours,
> Linus Walleij


