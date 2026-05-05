Return-Path: <linux-gpio+bounces-36122-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGSJDVi4+WmNBAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36122-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:28:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A18FF4C9ACC
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E05AF301024A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AAA31F989;
	Tue,  5 May 2026 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="K0d/xzGG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B884A31619C;
	Tue,  5 May 2026 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973332; cv=fail; b=BIquev+Qsde8KgeIt3vE2f6lahqb5yFLXDJXDV1EiSZvsgSq8B6qYCT1VWqdP2X4WlGL+pAhb76zOSJniyxMHd4wvuGI5Yr5gJu9VE6BHrE7GLc0sQFvJjgAcYrVvDHhE3kds8qbC3zvtAFrcp+xO8ktIYe1H1aDwa+8JdqqNCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973332; c=relaxed/simple;
	bh=C9kIZoif87+rZUlCFaHl4386PNILCnmaK8bSN37cXV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=etiQA1Mlz6cr9NWQ5A4/szoJaXccFzCq21JNpvv9JX1p6mu7ZNRUokQ34Od10+ZZLbttoonX9RL4Xrpg+a9sDk1P4zGEp7TfSZUo7nup2if1YRh+caPbL89kP2RxAKBIM9xsCwW4se0go6CIlS7a1W6hnpYmpQ1AfzPY3TwLCas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=K0d/xzGG; arc=fail smtp.client-ip=52.101.66.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGEM8XKuKVM7qI7hy562/REQ+S06nwWdZblEyOrDI586UkodW44Xk0R9LQgy/QS8pnJB1L6YsPE/q39ArTomkNiTm1M4FE6AyuTHExFQxmjXoV7sVOmNIvYM5d6Tm909eTJepnZSjrhEMkesQW9XoHFAU8IElMc6zlErb8MTljOI2EN3c8vcl3ShAWv5BKhAgOF8+AIiwqT5s98M/uQRR7tyMEAeggyaVl6NMG9eKn9LSH9NgBuNsLCaXsOGLpxDvoaigigW/IrvdJ1YLNoHm51Z1wK2Awgwj07L3JeRpQiRaefV2yxqUTMJIZN4e3LYUvSmkoO2KNtSGCPTScLXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUuOPXwqbdyTVEOXyPKmv+eIDfByYRvI0mKY6TUPQ2Q=;
 b=lG/7diMcKMklU5IiiF1iytScMM/jTu8ce2PRZFGezZOMm7MkDwCYmUvrEFw/CfPTC60kdE4NG3sMf0tktabnhfR2L3cLJ56uSeC+dWGJ7vbrClB4IFsW+M9iRn6QSCPQe4cuF69mmHJj6rb/qGG6OimTuQJflpTPNN+Srj3uvV6sz5wmwCrThFfD4Bvw4yygYnYu1r1r/4OwnqVis8cXRVX7cOzqMVMDXK35zfG1/NnR13qwQFzFdVLA8yuSA9WwN4QP5Vig7zIdqwU7S1hLiQC7YR4OsIj42YcjQGxp7/O5ODBxt1mtZALWRz5oiYU+L+HE3vLPUDZ8uhRrWth1Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amd.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUuOPXwqbdyTVEOXyPKmv+eIDfByYRvI0mKY6TUPQ2Q=;
 b=K0d/xzGGfrs8zNO6hpD9d8DChxk1S4rIQJTm0GF9o3We2CQSlNOJvaIBU4eTHOz4MbDlNBJBBx25O1Te1ztxwt5Dv3VqbdXavsZSHXfJXl9pZSs5XXUxo4k4JhuBgkyi5ZHkeFlw2wmW03CpxJ6dbcg1KFnyw3+m6t/jNNDZbvMnOQ3lIM0ZyTePPjGJkGZXqp7dpbspUTWh9Sxn1gXQJ+B3dDU5riSscYWNK2eMlhhKQReryW9ew89utlasLIqTWX0jXPhWa8IO77Pb3kBH2g655JYvSeoCLyR3Kp4nRdo2PptGk+1TT9ewyN/d4+t6k7sfvfeFlfR11gHLO697ng==
Received: from AS4P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::20)
 by VE1PR10MB3935.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:160::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 09:28:39 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::3f) by AS4P251CA0023.outlook.office365.com
 (2603:10a6:20b:5d3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 09:28:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 09:28:39 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 5 May
 2026 11:32:15 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 5 May
 2026 11:28:37 +0200
Message-ID: <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com>
Date: Tue, 5 May 2026 11:28:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: <tanmay.shah@amd.com>, Beleswar Prasad Padhi <b-padhi@ti.com>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>
CC: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, "Linus
 Walleij" <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
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
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s>
 <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|VE1PR10MB3935:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b485ac-9d0a-4b69-5f04-08deaa88b106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2z0sSNN/Fi29NbS764mMMIXncLX64YPb6S/2L60ShNjPMTuLpNkMErYpULyKtxRdE2Xs/GHXQ43S73KseLG3xVKikZNtds6ZYC9hF9+wq5ep4dWw4/TYbzrgzlx461QlhwR+fuJOUBcqCAB8F8hmtnTLgGPka0ClLVojPyWVHMbwqRPoqi4xNwRwWfq52j5au95VSpHT/bt29D8CqkuydY28WttKkCmyGqhMXU93njnb+G/UyviUIV6KPxhwlTjPmhjmwmbmeT64r94EenwGx8aKDrQuULrd9NB0TDNLp7uX5HzpBVJLEybgNN6po3eJ86B48/FOvVenm/g7KylSWuGvhw1z0eHThhUAl3FdkE1u4u6MLcJvth2M/U9uGBPSy9lkgInojtYz9MuM1x8O6uIkfv6GWgUDQhjy3Ts3kBV/ICfMErTAvnlKLsNF487ySzfqTZLIeK4fp2gmLZXKnrbpRS00Gss/mM4SPvVBzNgoo1uRbNnsHvYZylNS2BOifnWK78Nkq6vGSRkVIQ5XM3ajTK+wEdRAMiHHHSzVbd2pYXB/GW3h89VLIoVizCvjsuiH9e7BW+FDC7CWCF6RJZr0bdwSyjJM5Iy5bc3qn+SFSYZv1uO8CbmC0Zo+gKNzw2H1TKdrQnYIzA4cX5f1M3GWOmyr3+7EwOSgKegBE8ti1qsHIDRNow3gxa+XOBWr
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L/7Ox+RdP5oPgFRGqjEOI6qrAnbdB+lDt4D+xZkJYNXrc9K5EPNxTihXR+7fiZd/uH3rewsAyQ+pDdDL/08Xlp6qwmvhNdLmPIYnPj+oYew8QU4LS7K4HTDrUxFuxjHA99expvSMA8rkkWB/cp80GSqnrf9/DI8L1D6TlNZF4rkhvh28CH9wc7US8UXw63teCBXtTywPsE71oBGrGjrTgYM693DmfoqxmxpWgNZlqeFLjlhgBLP/HZFn+1fTtaDrT7q/jV72uYytvZu1cTgY2Zi+qEOX/e0R2fKc1/IRR94wko6+gGpvewGCf+GZd0uthNawK+3rBLGdZomwSh3mblpmFCxtao5J+DNk8iczUXoE3PQYMxhvSiaR5CND4u1Izw5v4ZPObwyano97O8oVlvlbbmFQKGvX4pycIePEyUxOy7EPu0QwPWT19NhjxyNI
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 09:28:39.4510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b485ac-9d0a-4b69-5f04-08deaa88b106
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3935
X-Rspamd-Queue-Id: A18FF4C9ACC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36122-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]

Hi Tanmay,

On 5/4/26 21:19, Shah, Tanmay wrote:
> 
> Hello all,
> 
> I have started reviewing this work as well.
> Thanks Shenwei for this work.
> 
> I have gone through only the current revision, and would like to provide
> idea on how to achieve GPIO number multiplexing with the RPMsg protocol.
> Also, have some bindings related question.
> 
> Please see below:
> 
> On 4/30/2026 11:40 AM, Arnaud POULIQUEN wrote:
>>
>>
>> On 4/30/26 14:56, Beleswar Prasad Padhi wrote:
>>> Hello Arnaud,
>>>
>>> On 30/04/26 13:05, Arnaud POULIQUEN wrote:
>>>> Hello,
>>>>
>>>> On 4/29/26 21:20, Mathieu Poirier wrote:
>>>>> On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>>>>>>
>>>>>> Hi Mathieu,
>>>>>>
>>>>>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
>>>>>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>> -----Original Message-----
>>>>>>>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>>>>>> Sent: Wednesday, April 29, 2026 10:42 AM
>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-
>>>>>>>>> padhi@ti.com>; Linus
>>>>>>>>> Walleij <linusw@kernel.org>; Bartosz Golaszewski
>>>>>>>>> <brgl@kernel.org>; Jonathan
>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
>>>>>>>>> Krzysztof Kozlowski
>>>>>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
>>>>>>>>> Andersson
>>>>>>>>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
>>>>>>>>> <s.hauer@pengutronix.de>; Shuah Khan
>>>>>>>>> <skhan@linuxfoundation.org>; linux-
>>>>>>>>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-
>>>>>>>>> kernel@vger.kernel.org;
>>>>>>>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>>>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
>>>>>>>>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-
>>>>>>>>> linux-imx <linux-
>>>>>>>>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic
>>>>>>>>> rpmsg GPIO driver
>>>>>>>>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
>>>>>>>>>>
>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>> From: Andrew Lunn <andrew@lunn.ch>
>>>>>>>>>>> Sent: Monday, April 27, 2026 3:49 PM
>>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
>>>>>>>>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
>>>>>>>>>>> Jonathan
>>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
>>>>>>>>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>>>>>>>>>>> <conor+dt@kernel.org>;
>>>>>>>>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
>>>>>>>>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
>>>>>>>>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
>>>>>>>>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>>>>>>>>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
>>>>>>>>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>>>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
>>>>>>>>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
>>>>>>>>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
>>>>>>>>>>> <brgl@bgdev.pl>
>>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
>>>>>>>>>>> GPIO driver
>>>>>>>>>>>>> struct virtio_gpio_response {
>>>>>>>>>>>>>             __u8 status;
>>>>>>>>>>>>>             __u8 value;
>>>>>>>>>>>>> };
>>>>>>>>>>>> It is the same message format. Please see the message definition
>>>>>>>>>>> (GET_DIRECTION) below:
>>>>>>>>>>>
>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
>>>>>>>>>>>> +   | 1   | 2   |port |line | err | dir|
>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>>>>> Sorry, but i don't see how two u8 vs six u8 are the same
>>>>>>>>>>> message format.
>>>>>>>>>>>
>>>>>>>>>> Some changes to the message format are necessary.
>>>>>>>>>>
>>>>>>>>>> Virtio uses two communication channels (virtqueues): one for
>>>>>>>>>> requests and
>>>>>>>>> replies, and a second one for events.
>>>>>>>>>> In contrast, rpmsg provides only a single communication
>>>>>>>>>> channel, so a
>>>>>>>>>> type field is required to distinguish between different kinds
>>>>>>>>>> of messages.
>>>>>>>>>>
>>>>>>>>>> Since rpmsg replies and events share the same message format,
>>>>>>>>>> an additional
>>>>>>>>> line is introduced to handle both cases.
>>>>>>>>>> Finally, rpmsg supports multiple GPIO controllers, so a port
>>>>>>>>>> field is added to
>>>>>>>>> uniquely identify the target controller.
>>>>>>>>>
>>>>>>>>> I have commented on this before - RPMSG is already providing
>>>>>>>>> multiplexing
>>>>>>>>> capability by way of endpoints.  There is no need for a port
>>>>>>>>> field.  One endpoint,
>>>>>>>>> one GPIO controller.
>>>>>>>>>
>>>>>>>> You still need a way to let the remote side know which port the
>>>>>>>> endpoint maps to, either
>>>>>>>> by embedding the port information in the message (the current
>>>>>>>> way), or by sending it
>>>>>>>> separately.
>>>>>>>>
>>>>>>> An endpoint is created with every namespace request.  There should be
>>>>>>> one namespace request for every GPIO controller, which yields a
>>>>>>> unique
>>>>>>> endpoint for each controller and eliminates the need for an extra
>>>>>>> field to identify them.
>>>>>>
>>>>>>
>>>>>> Right, but this can still be done by just having one namespace
>>>>>> request.
>>>>>> We can create new endpoints bound to an existing namespace/channel by
>>>>>> invoking rpmsg_create_ept(). This is what I suggested here too:
>>>>>> https://lore.kernel.org/all/29485742-6e49-482e-
>>>>>> b73d-228295daaeec@ti.com/
>>>>>>
>>>>>
>>>>> I will look at your suggestion (i.e link above) later this week or
>>>>> next week.
>>>>>
>>>>>> My mental model looks like this for the complete picture:
>>>>>>
>>>>>> 1. namespace/channel#1 = rpmsg-io
>>>>>>        a. ept1 -> gpio-controller@1
>>>>>>        b. ept2 -> gpio-controller@2
>>>>>>
> 
> If my understanding of what gpio-controller is right, than this won't
> work. We need one rpmsg channel per gpio-controller, and in most cases
> there will be only one GPIO-controller on the remote side. If there are
> multiple or multiple instances of same controller, than we need separate
> channel name for that controller just like we would have separate device
> on the Linux.

As done in ehe rpmsg_tty driver it could be instantiated several times with
the same channel/service name. This would imply a specific rpmsg to retreive
the gpio controller index from the remote side.
> 
>>>>>
>>>>> I've asked for one endpoint per GPIO controller since the very
>>>>> beginning.  I don't yet have a strong opinion on whether to use one
>>>>> namespace request per GPIO controller or a single request that spins
>>>>> off multiple endpoints.  I'll have to look at your link and reflect on
>>>>> that.  Regardless of how we proceed on that front, multiplexing needs
>>>>> to happen at the endpoint level rather than the packet level.  This is
>>>>> the only way this work can move forward.
>>>>>
>>>>
>>>> I would be more in favor of Mathieu’s proposal: “An endpoint is
>>>> created with every namespace request.”
>>>>
>>>> If the endpoint is created only on the Linux side, how do we match
>>>> the Linux endpoint address with the local port field on the remote side?
>>>
>>>
>>> Simply by sending a message to the remote containing the newly created
>>> endpoint and the port idx. Note that is this done just one time, after
>>> this
>>> Linux need not have the port field in the message everytime its sending
>>> a message.
>>>
>>>>
>>>> With a multi-namespace approach, the namespace could be rpmsg-io-
>>>> [addr], where [addr] corresponds to the GPIO controller address in
>>>> the DT. This would:
>>>
>>>
>>> You will face the same problem in this case also that you asked above:
>>> "how do we match the Linux endpoint address with the local port field
>>> on the remote side?"
>>
>> Sorry I probably introduced confusion here
>> my sentence should be;
>>   With a multi-namespace approach, the namespace could be rpmsg-io-[port],
>>   where [port] corresponds to the GPIO controller port in the DT.
>>
>>
>> For instance:
>>
>>        rpmsg {
>>          rpmsg-io {
>>            #address-cells = <1>;
>>            #size-cells = <0>;
>>
>>            gpio@25 {
>>              compatible = "rpmsg-gpio";
>>              reg = <25>;
>>              gpio-controller;
>>              #gpio-cells = <2>;
>>              #interrupt-cells = <2>;
>>              interrupt-controller;
>>            };
>>
>>            gpio@32 {
>>              compatible = "rpmsg-gpio";
>>              reg = <32>;
>>              gpio-controller;
>>              #gpio-cells = <2>;
>>              #interrupt-cells = <2>;
>>              interrupt-controller;
>>            };
>>          };
>>        };
>>
>>   rpmsg-io-25  would match with gpio@25
>>   rpmsg-io-32  would match with gpio@32
>>
> 
> The problem with this approach is, we will endup creating way too many
> RPMsg devices/channels. i.e. one channel per one GPIO. That limits how
> many GPIOs can be handled by remote from memory perspective. At
> somepoint we might just run-out of number ept & channels created by the
> remote. As of now, open-amp library supports 128 epts I think.

Right, I proposed a solution in my previous answer to Beleswar who has
the same concern.

> 
>>
>>>
>>> Because the endpoint that is created on a namespace request is also
>>> dynamic in nature. How will the remote know which endpoint addr
>>> Linux allocated for a namespace that it announced?
>>>
>>> As an example/PoC, I created a firmware example which announces
>>> 2 name services to Linux, one is the standard "rpmsg_chrdev" and
>>> the other is a TI specific name service "ti.ipc4.ping-pong". You can
>>> see it created 2 different addresses (0x400 and 0x401) for each of
>>> the name service request from the same firmware:
>>>
>>> root@j784s4-evm:~# dmesg | grep virtio0 | grep -i channel
>>> [    9.290275] virtio_rpmsg_bus virtio0: creating channel
>>> ti.ipc4.ping-pong addr 0xd
>>> [    9.311230] virtio_rpmsg_bus virtio0: creating channel rpmsg_chrdev
>>> addr 0xe
>>> [    9.496645] rpmsg_chrdev virtio0.rpmsg_chrdev.-1.14: DEBUG: Channel
>>> formed from src = 0x400 to dst = 0xe
>>> [    9.707255] rpmsg_client_sample virtio0.ti.ipc4.ping-pong.-1.13:
>>> new channel: 0x401 -> 0xd!
>>>
>>> So in this case, rpmsg-io-1 can have different ept addr than rpmsg-io-2
>>> Back to same problem. Simple solution is to reply to remote with the
>>> created ept addr and the index.
>>
>> That why I would like to suggest to use the name service field to
>> identify the port/controller, instead of the endpoint address.
>>>   
>>>>
>>>> - match the RPMsg probe with the DT,
>>>
>>>
>>> We can probe from all controllers with a single name service
>>> announcement too.
>>>
>>>> - provide a simple mapping between the port and the endpoint on both
>>>> sides,
>>>
>>>
>>> We are trying to get rid of this mapping from Linux side to adapt
>>> the gpio-virtio design.
>>>
>>>> - allow multiple endpoints on the remote side,
>>>
>>>
>>> We can support this as well with single nameservice model.
>>> There is no limitation. Remote has to send a message with
>>> its newly created ept that's all.
>>>
>>>> - provide a simple discovery mechanism for remote capabilities.
>>>
>>>
>>> A single announcement: "rpmsg-io" is also discovery mechanism.
>>>
>>> Feel free to let me know if you have concerns with any of the
>>> suggestions!
>>
>> My only concern, whatever the solution, is that we find a smart
>> solution to associate the correct endpoint with the correct GPIO
>> port/controller defined in the DT.
>>
>> I may have misunderstood your solution. Could you please help me
>> understand your proposal by explaining how you would handle three
>> GPIO ports defined in the DT, considering that the endpoint
>> addresses on the Linux side can be random?
>> If I assume there is a unique endpoint on the remote side,
>> I do not understand how you can match, on the firmware side,
>> the Linux endpoint address to the GPIO port.
>>
>> Thanks and Regards,Arnaud
>>
>>>
>>> Thanks,
>>> Beleswar
>>>
>>>>
>>>> Regards,
>>>> Arnaud
>>>>
>>>>>> 2. namespace/channel#2 = rpmsg-i2c
>>>>>>        a. ept1 -> i2c@1
>>>>>>        b. ept2 -> i2c@2
>>>>>>        c. ept3 -> i2c@3
>>>>>>
>>>>>> etc...
>>>>>>
> 
> Just want to clear-up few terms before I jump to the solution:
> 
> **RPMsg channel/device**:
>    - These are devices announced by the remote processor, and created by
> linux. They are created at: /sys/bus/rpmsg/devices
>    - The channel format: <name>.<src ept>.<dst ept>
> 
> **RPMsg endpoint**:
>    - Endpoint is differnt than channel. Single channel can have multiple
> endpoints, and represented in the linux with: /dev/rpmsg? devices.
> 
> To create endpoint device, we have rpmsg_create_ept API, which takes
> channel information as input, which has src-ept, dst-ept.
> 
> Following is proposed solution:
> 
> 1) Assign RPMsg channel/device per rpmsg-gpio controller (Not per GPIO
> pin/port).
>    - In our case that would be, single rpmsg-io node. (That makes me
> question if bindings are correct or not).
> 
> 2) Assign GPIO number as src ept.
> 
> i.e. *rpmsg-io.<GPIO number>.<dst ept>*. Do not randomly assign src
> endpoint.
> 
> Now, RPMSG channel by spec reserves first 1024 endpoints [1], so we can
> add 1024 offset to the GPIO number:
> 
> so, when calling rpmsg_create_ept() API, we assing src_endpoint as:
> (GPIO_NUMBER + RPMSG_RESERVED_ADDRESSES)
> 
> Now on the remote side, there is single channel and only single-endpoint
> is needed that is mapped to the rpmsg-io channel callback.
> 
> That callback will receive all the payloads from the Linux, which will
> have src-ept i.e. (RPMSG_RESERVED_ADDRESSES + GPIO_NUMBER).


Interesting approach. I also tried to find a similar solution.

The question here is: how can we guarantee continuous addresses? Given 
the static and dynamic allocation of endpoint addresses that are 
implemented, my conclusion was that it is not reliable enough.

but perhaps I missed something...

> 
> It can retrieve GPIO_NUMBER easily, and convert to appropriate pin based
> on platform specific logic.
> 
> This doesn't need PORT information at all. Also it makes sure that
> remote is using only single-endpoint so not much memory is used.
> 
> *Example*:
> If only rpmsg-gpio channel is created by the remote side, than following
> is the representation of the devices when GPIO 25, 26, 27 is assigned to
> the rpmsg-io controller:
> 
> Linux                                                      Remote
> 
> rpmsg-channel: rpmsg-gpio.0x400.0x400
> 
> /dev/rpmsg0 - GPIO25 ept (rpmsg-gpio.0x419.0x400)-|
>                                                    |
> /dev/rpmsg1 - GPIO26 ept (rpmsg-gpio.0x41a.0x400)-|-> rpmsg-gpio.*.0x400
>                                                    |
> /dev/rpmsg2 - GPIO27 ept (rpmsg-gpio.0x41b.0x400)-|  0x400 ept callback.
> 
> 
> *On remote side*:
> 
> ept_0x400_callback(..., int src_ept, ...,)
> {
> 	int gpio_num = src_ept - RPMSG_RESERVED_ADDRESSES;
> 	// platform specific logic to convert gpio num to proper pin,
> 	// just like you would convert gpio num to pin on a linux gpio controller.
> }
> 
> My question on the binding:
> 
> Why each GPIO is represented with the separate node? I think rpmsg-gpio
> can be represented just any other GPIO controller? Please let me know if
> I am missing something. So rpmsg channel/rpmsg device is not created per
> GPIO, but per controller. GPIO number multiplexing should be done with
> rpmsg src ept, that removes the need of having each GPIO as a separate node.
> 
> 
> rpmsg_gpio: rpmsg-gpio@0 {
> 		compatible = "rpmsg-gpio";
> 		reg = <0>;
> 		gpio-controller;
> 		#gpio-cells = <2>;
> 		#interrupt-cells = <2>;
> 		interrupt-controller;
> 	};
> 
> Then in DT, use like regular GPIO, but with the rpmsg-gpio controller:
> 
> rpmsg-gpios = <&rpmsg_gpio (GPIO NUM) (flags)>;
> 
> If the intent to create separate gpio nodes was only for the channel
> creation, then it's not really needed.
> 
> [1]
> https://github.com/torvalds/linux/blob/6d35786de28116ecf78797a62b84e6bf3c45aa5a/drivers/rpmsg/virtio_rpmsg_bus.c#L136
>

It is already the case. bindings declare GPIO controllers, not directly 
GPIOs in:

[PATCH v13 2/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode 
support

The discussion is around having an unique RPmsg endpoint for all
GPIO controller or one RPmsg endpoint per GPIO controller.

Or did I misunderstand your questions?

Thanks,
Arnaud


>>>>>> This way device groups are isolated with each channel/namespace, and
>>>>>> instances within each device groups are also respected with specific
>>>>>> endpoints.
>>>>>>
>>>>>> Thanks,
>>>>>> Beleswar
>>>>>>
>>>>>
>>>>
>>
>>
> 


