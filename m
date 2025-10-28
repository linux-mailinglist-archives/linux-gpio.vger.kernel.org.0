Return-Path: <linux-gpio+bounces-27746-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E0CC127C8
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 02:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F09F94EBBF5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 01:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674241758B;
	Tue, 28 Oct 2025 01:04:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022129.outbound.protection.outlook.com [52.101.126.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD981FB1;
	Tue, 28 Oct 2025 01:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761613488; cv=fail; b=L1gtsMNFF+jSb5moC++ATV8NwepE+rjL4VdMognWtUtlDby8eVJmJYKe9Iv6QrIA0ReKRk39CvHjeiN/cy3shFEZi4bRGpEyX1yuUmI3ep320MMHwy6xT/5kTwfW+KdveTSU84xJmo9EvBx/HGTiGt6i3BMJbar/XiOkTSvFgZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761613488; c=relaxed/simple;
	bh=gsr/7gMWonKMOLVyDfd9RGYZHM+vOoqa90iJ8Yy9x/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tT373PJLnmFCk3gnbTu2zinez/HNmHBEfKD8lX8Hm3u96V0s3tkvw8z4uZqEeHw/swJpc1VF/huwqCCWaTDDMyJU/HxaWabIiRKi2nNT0LBqM6QeTlhHZZ+u8ITWaLV+N6AEQC9UXIjwmFlPJVP3y2idpkglJsO43c48mSZIymI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8sHOM1O/C6YAOOjHaZ6dz1c3nOH9aHA0bdDbNTunm0ndVhPGczIezQpJXv2vnP/tWUB+iANAyvMwRxFvxpj+w+CSI0aqJEsIlXPxqtMbKpmRXYc/hgdNT+mejnZFheryb+rBGzcxDtKGyn+EgjCaOIJDqf5cS1ZF6ZKCxn4g/pyGkA4jlogyNJx2NFYYC1QJkvDLuyh7ODXLhJ8do9c5z72y7yXPE48EUcLxpE8dS9WhqvaLMXJhMMhgAm8teYGWvapTzlqAw1Nzczhanc7RhnympwLLLGFu1jPNvgQM2pDbrdGj4SylmKpCq0YzTL6/NwtgP9kFvOAM/Sf0kPoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1b0T+zNG7FX7853CAhm9h6srd+70AMfgMEadt45RMs=;
 b=v9pTlq8PZqTmw9Geo8rupP1uqMYeMBSC+KWHmJv/lMjWBJ4dnyBCsrd3TfywOSUjaoOPaUnyyezINIMXBtXz4naSGf9OEpPSMNs+XqY3rZiBgzXt/LHHiBS7eeTx9v6UNABYI5EVeftN5kK9haGiwBSZCTlu51CNyPWlE2ojbUrrTz0JbjuJ6pUSQG/lYZcpHTpSiTnY9MKE3CPor0lpOF2RQgskpM//dm2ja58knCA0h+5SZgoS3AuQIJnJ7icgEur3yhvvW1xPbcuob8tmZYn6n4FsEqBGEDdJb2EaJuuI/JmlN9KlGFYDUq9S2PUqFlqa1qQa7RoK+2wNyR3GoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0089.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2c2::15)
 by TY1PPFC6318BE81.apcprd06.prod.outlook.com (2603:1096:408::924) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 01:04:41 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:101:2c2:cafe::a4) by SE2P216CA0089.outlook.office365.com
 (2603:1096:101:2c2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.20 via Frontend Transport; Tue,
 28 Oct 2025 01:04:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 01:04:40 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6779541C0143;
	Tue, 28 Oct 2025 09:04:39 +0800 (CST)
Date: Tue, 28 Oct 2025 09:04:38 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Gary Yang <gary.yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v5 0/3] Add pinctrl support for Sky1
Message-ID: <aQAWpkIXhsMW6ggo@nchen-desktop>
References: <20251021070410.3585997-1-gary.yang@cixtech.com>
 <CACRpkdZAaEim0yJLkXNctJA0jBFj7LGyTGVvy7_mMf5G+vUWOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZAaEim0yJLkXNctJA0jBFj7LGyTGVvy7_mMf5G+vUWOQ@mail.gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|TY1PPFC6318BE81:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb0977d-a22f-430c-0df0-08de15bdf912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dE0xTDBWNTAxcVAyL3RNM1UxOWZsb21ibEtHS255TTJHWENmTVJ0Q29LTXNU?=
 =?utf-8?B?VEo0dDFxY2YzYlNzOTF2WDhIVk5HL3JJYmd6dVovazVxUSt1WnRSNW9FWDVV?=
 =?utf-8?B?TmhVT3hxZ3BBamV0S3hVYS9FV2NnZW82N2VPTWZRaytPRkpYdlFyaExhbWJC?=
 =?utf-8?B?bXVCQzV5OUNLS2NCN1JuMHlxS1BBWklHcjQ0MU81ZGR6UzFtcjNVTVBZZVlt?=
 =?utf-8?B?SWQ4R0hhVHZvbXFxQzduR3pjendCVEovK1duc1NIV0htWmdzOWJSRFlnRTJG?=
 =?utf-8?B?Y2RhZkw4ZWprVHM2N1dhRmN6bG53NUVmYTIrcmFzQW1LQWorOGRzMC91b2hk?=
 =?utf-8?B?TG5hdGZ5N1NoMWRJVHlCNWw4ZXJPVXZDRFA4QnU4QUcwalRmdXBLVXIxVHVT?=
 =?utf-8?B?cWtXZ0xNZUpYS3BWak9wZnBaNkdvWEo4MFhJRUxnZ2ZsNXE1ajFCMTNHZnl3?=
 =?utf-8?B?TU9xVUR3ZnlLekgwZXJGeStTQ2o3UDdiNEtoRm96OW5USk00Si9DOUM0NDFN?=
 =?utf-8?B?YmxYV1NUcVZ3WDRnbkFwWE9iU3BhekV4YzdqSk1MSmVaSGNjcmd2Wis3bEs5?=
 =?utf-8?B?Y2FVYVdQT2tjQ3BKRGJkREdXTCtKaTd5SVg5T1BvdGhoZUExQUFaUzBRenpY?=
 =?utf-8?B?MlBBWVp6UWduVlYrWUIwRUVFMGRZZkRTTGpGOVZBYnNXZTFHa0ZrYjBYSG56?=
 =?utf-8?B?OWZCTHBMbWdSWDMzd0xPYzlkTGpKUk9XUkg0T1RNT1dKcWlYdVFxZTd2TDhp?=
 =?utf-8?B?QXdFTFhZUlAzZEY0TFpaa1U2Unp4dHJXLzUxMFI3Zlg0cUFnbHpBYi95L3NI?=
 =?utf-8?B?VUZpT2FsMDdyZjFVeHc4YlFkWUFLR2Z3bHBYN1hXQVBpNkR2SGRqVWs2ejY3?=
 =?utf-8?B?WFVKWU4zNjhNSS9zY3BwTE5yUTRiZTNkMExuUTY4OVRHNEovSS9IanVIaTVp?=
 =?utf-8?B?U0hYVjFCRHcvemt4YVYzMTVLT3Q1ZytFVzIvQlVjeEhuM2x4YVJhKzNMaEk4?=
 =?utf-8?B?NzBwa1NSOWJWMHRVQlRkVENzTWZtT3V5TTQyblpCbGxFMjcxYUhpREVxOVAy?=
 =?utf-8?B?bXpTSUk2RTcrbkdwaUo0aG84VEplL015dVNZZzd5OHpsSlpuNWlTc3M2V0Vi?=
 =?utf-8?B?VVNEMGNtTVUraU5GRnVHRjZEMDFYZWl0R3FDcFh5ejNhU3YyWW9vUU9ickFy?=
 =?utf-8?B?aVNhU0NFazd6VmptMFF4dW5VY1lJektiMDVxZkVBNFlqV3laMDFJNmF4VCtl?=
 =?utf-8?B?NU9YWGV1S1ZoQmhtZ0hOakRTeW41N1c3WmlPRmV3NmpUY0RSdGVHdVZVSXdH?=
 =?utf-8?B?RFBiYXI1UEtmclVPTjFFczVRS2x1YzJ1a0dLT3BPWU4wRVdxSE16YStUWXdo?=
 =?utf-8?B?ZUc2ZG9BUUFxb1Z0S0VETTRmWmtneE5SM2M0UGdvc0Z0cDNiUVhLY3VUSCs5?=
 =?utf-8?B?WnpUSDBSK3N2SzlUVHJHeWJOM080MzRpZmVjQ3QzNmJlUlc2WlcxNmcvUWlZ?=
 =?utf-8?B?aktEcG5tWjlCWlk3S0sxSHBvMXBBZHJTMU9mbGwzY1IzamQ4SFV2RE5Sbits?=
 =?utf-8?B?SHNGTDl1YnlRQXZkTGl0Z0NvQVZZWjdkRGJ5NWJsd2d3LzROamVBR3FuZmNI?=
 =?utf-8?B?Z1l6NytCZGJ6ZmNBaXk5V3piY0VhNVA3ODZmNmp3eVlxZ0NjTGNmZkE3VnNO?=
 =?utf-8?B?V1l4N2huVXRCay9VSzBjS3pyU2ZMblpXQnZmV29EZHhkVEFpMWdQakZ6eTlG?=
 =?utf-8?B?dDJsb3NjTUl1bEhzZWx5TGVyU0o3SUkwb1NoVHRrcUU3K21RZVhuSXVRV0ZC?=
 =?utf-8?B?NTFodGt2d0l4UFZzSU9kQ2ZMQWlSUFdqemowV1kxRXRQaFJnQmFOTHl6WjA1?=
 =?utf-8?B?a0RHS3l1eks2eTRrcHRXMmJsMzBzWHNhamFqWkpOYkJNaFZENlRlTHp2WGU3?=
 =?utf-8?B?M2tSWmthTExyOU1KeHdXcFU1NDhTdHVEaDRoeHRtTk5JSExseTI0ZElhZSs5?=
 =?utf-8?B?dWNKSkFCWFU1dHA4R25FN1VPN2EwMjhQU0p4bmpEUkpBNkRsQTdDWUtyT0xo?=
 =?utf-8?B?Y09PaGw1cmJFTHRpL1phT3lMMERVbFIrV3FGb2xLWVJ6Ti9rbytyK2U3K1o4?=
 =?utf-8?Q?TaPs=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 01:04:40.2859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb0977d-a22f-430c-0df0-08de15bdf912
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFC6318BE81

On 25-10-27 22:56:56, Linus Walleij wrote:
> EXTERNAL EMAIL
> 
> Hi Gary,
> 
> On Tue, Oct 21, 2025 at 9:04 AM Gary Yang <gary.yang@cixtech.com> wrote:
> 
> > Gary Yang (3):
> >   dt-bindings: pinctrl: Add cix,sky1-pinctrl
> >   pinctrl: cix: Add pin-controller support for sky1
> 
> Patches 1 & 2 applied to the pin control tree for v6.19!
> 
> >   arm64: dts: cix: Add pinctrl nodes for sky1
> 
> This third patch should be applied to the SoC tree, Peter Chen or
> Fugang Duan takes care of that I think? Not sure.

Thanks, Linus.
Yes, since you have applied driver and dt-binding patches, I will
apply Dts patch to CIX SoC Tree.

-- 

Best regards,
Peter

