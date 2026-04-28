Return-Path: <linux-gpio+bounces-35709-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ3jF1PO8GnDYwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35709-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 17:12:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A084879F7
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 17:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF93D300C0C0
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 15:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3324942EEC9;
	Tue, 28 Apr 2026 15:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FipIaiMK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4763CB2FD;
	Tue, 28 Apr 2026 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777389104; cv=fail; b=sI0pD/+i0JJTDdrGRQHkF9I+nBPgOWeL0TF18JXbCTE5XDSXb8/7cAvtrPVqUlvgBZKFey9sTpvGwlzly1IRlJKCjLVTuX1PgexRM5R86eCk8ltpPsPtzmi0ok3dj3dXV3M7va2L9UyArS+08RgirSWYHme23hNtxH3b4/FJtsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777389104; c=relaxed/simple;
	bh=1ZjGeG1pBgb/Nv2ebxYCf6tSwxxTG6+YgGB/Ry0WVA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q8zmDkZAvewP3MmzPvvRPCvk+CIUDbFrEHfiP8/LLTQ+QXALXe1RhdN/a7n5bWVBfHi8BAMm0ek2e31B4211rsj8nb7/wVYeA0q67/Bl8LovqGZmZTxHp3+y2NjaLpUvDDToPOqP+QrGmRVMWVIsqMx7xgpBOITfnWPACOaVXKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FipIaiMK; arc=fail smtp.client-ip=52.101.56.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQTS6Akx8e5lJdZKsXDT9hgdHx0oidbkLH58HKSIgxbBaft+H66C4RzOPpYpYfflTfJ3lHsgmNhFTODMwsZqx+SJhFnWAE6wXJhftLwnLciyU7ITf1cviCjri5kjc443zCoNd8MUmqu8bpsOnNYkKStg8OJd/LhO/LHtsq1cqE9L2/j5/7FCHy/G6uOHlPApXp6T4An98znT9TDFqZ2Tl+FLSqPAoND6m6IvOVzpg6WqZazs4vEOx5q9mL1kQ84/RX4cd+n8XCTddJmszLZ2iYtbgjIuyIJobTkfXhi8BtZbrcwAPpuLer+5wzbx05WaitEToPjasbsRiDiiiRXaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0c+qrs/gClkxq5tXcm9hTzsCZbcAtpodGQaBqTNm8o=;
 b=g7Z386TzHpJi+ot375VInO3rV8Xp77Biye4DWHLQ1fUKkFH/oVLxohcGe98PUq+eQ2uZ8TaIl/Vft01iwlH6P/dT9zuPFXu4NKoxGopSuyJ5FjcS6RJihG5DFyhFHmMakQC8ZzEKSssQWMrPExD1sctRlVX1eBZHY6X9f515253sw0FYBXLGbHL/UreQe73u4jt+dDqD5D8sFHWg9vFNNgajTb+zBSMCKhGaB0IirOAxBEgf/IiLGqBsMyPoPH9pm/h9qQpylSZ8qJGOGFOREBrDIeUORlzm8HpR7D1HnMEuqmeO5GpHKxRrRIbULFH1gT4a1HxeFNoeEEZRDlVVvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lunn.ch smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0c+qrs/gClkxq5tXcm9hTzsCZbcAtpodGQaBqTNm8o=;
 b=FipIaiMKuf6G8RaqN9zPdLQZbo0EnbyMyHx551RcVANun5FrMcXVd4sYxbsAx08twZmUkihH9xv/4MtAPxI3wWK7fcQtSthnGXI3Ra8tql/iUClFKudQjTrIy01Wd+nsMMFbsuTOdlV9bTPDIDMJpAZXcP1uOHQ+LVEla3o/6Zs=
Received: from BYAPR02CA0050.namprd02.prod.outlook.com (2603:10b6:a03:54::27)
 by DM3PPF3F503E3E3.namprd10.prod.outlook.com (2603:10b6:f:fc00::c21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 15:11:38 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::7b) by BYAPR02CA0050.outlook.office365.com
 (2603:10b6:a03:54::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.27 via Frontend Transport; Tue,
 28 Apr 2026 15:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 15:11:38 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:11:37 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:11:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 10:11:37 -0500
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SFBSel1195788;
	Tue, 28 Apr 2026 10:11:29 -0500
Message-ID: <32c119af-96ad-4da0-86f2-cdc4ba57ef0b@ti.com>
Date: Tue, 28 Apr 2026 20:41:27 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO
 driver
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>,
	"Sascha Hauer" <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <29485742-6e49-482e-b73d-228295daaeec@ti.com>
 <PAXPR04MB918568939EC7DAEB4BB6C8F989372@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <PAXPR04MB918568939EC7DAEB4BB6C8F989372@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|DM3PPF3F503E3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 0106b3d0-ef24-49e4-75d1-08dea5387214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|7416014|1800799024|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	FlyLp3yWrAZXBDlLKReKJdGAYPEfzPJQrEbgqZD8yHV9ELM6+9QHcnK+fB+J4ZJHcPRhNzSR/DsPNYR/4LmlMXG3oW43ej/jYa5QiWO37N9G59yVkwYpgfHy4c88h38mjBDM3vhz2MaW28d43Egl4rVYL8y5dUEHIC70XnR0OGjejjyxyOAESnj6P5lQ3kocQ0fHnOgULaj1aSmH3Z5WgAS5Nc6zbkHyYhouhxN8xDs8jIHtY3FlaQASZioeB3OTpdnAOBcveai2KebK4RJuYci4QvYjz0Juo1C3ZrkYBlIcTMo5XedrsU9FRGK7NfC1Nr7NJTTPYUbtrVNw36dG7LeZMg3M6V38pFDGhWOzOYX1XRS6GyBDaGPfp2gI1p9T2aixNCPgZkQH3JzPTPM4bpD/tZdxeqg17P/SBv7bggVc2dDgrn5xfSnwvJcdoVNU+Um0ClRISHQ3/Mw4TbWuYZWG5oLlkFOuDVHb/Zxb3H1C1iYR6ZeItIN5+GdH/K7ybkNDvP894+era3RgBKNBdSFDGAoCIz/2nxqHFgUnEkhoID97aVhLWAV+fZQ0I4pA1JKkxaRVT79POrD0HPSU/MUIars61hNUOUjXUM8MOE6mjo814Tx3/+Okpqx+usMZsowAr2hYOu2ohnsE5fy24wLcPaPwCdQsLS4M1Dwx8DZTcPEAQUJv/3e0fgAu5gXTXMotFi/MgYWNaTbReauM+rRRCvS7Kghy+PjRNcfd8x3OQ0uZRvYN7yMSAAslHjrVIeBZUNuANF9PwmZSIRRtsqVwx8W8ubJFgB9sqXm/Sjz76/k6CCZOyWiObJt2k1JI
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(7416014)(1800799024)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	15IchVaeXB35DYOSULofuzjNXMYdFPuNq5Vieos2zAKAkWDC1/MFKYVQZtSc9Va+poMYZvmQLuNSQfxnVMqqpV96iJZNVUbxO3citwAh0hIr/aO8K6mDTv/gUAyv135eXm9LhFDc3FzIezCR2a2vMcLEeIKUflYyikGsdyXRqpzNqaHz27wzb6qqoQbJl5DkeoSQ9hKOikxZJSQy/9IMw9W+cVtTsImnQHp8Mu0jA0LJaJTQEcDGOcOOiwEleUHwVh2KKpQXTHR8j/IlQosssiTh9SxTATg4FVK7h5xoPTNPJNOVX1IxsiiZpUcuhzg8VvGVWphfBL/LANRnkvgMIsSh4vMVOEVakLVt4IUlKRV1GmD8WADh3WugAGvGjL2srqftugGpssTWhNauwSFj074g7MpHco1TrlslbbuaNJcPQwycFVntFXJuy5j/vAnG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 15:11:38.2595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0106b3d0-ef24-49e4-75d1-08dea5387214
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF3F503E3E3
X-Rspamd-Queue-Id: 16A084879F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35709-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-padhi@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]


On 4/28/2026 8:13 PM, Shenwei Wang wrote:
>
>> -----Original Message-----
>> From: Beleswar Prasad Padhi <b-padhi@ti.com>
>> Sent: Tuesday, April 28, 2026 2:25 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
>> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
>> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
>> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
>> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
>> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
>> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
>> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
>> Golaszewski <brgl@bgdev.pl>; Andrew Lunn <andrew@lunn.ch>
>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
>> On 28/04/26 00:53, Shenwei Wang wrote:
>> [...]
>>
>>>>> +     void *channel_devices[MAX_PORT_PER_CHANNEL];
>>>> So this is technically a rpmsg endpoint (struct rpmsg_endpoint)
>>>> without naming it "endpoint". Every rpmsg endpoint has a reference to
>>>> its parent rpmsg channel (struct rpmsg_device) which represents the
>>>> same information here. So we should use the framework standard here.
>>>>
>>> Yes, agree to use "endpoint_devices".
>>
>> I did not mean to say to just change the variable name from "channel_devices" to
>> "endpoint_devices". Infact you would not need to have this field & struct
>> anymore.
>>
>> Pseudo-code:
>> 1. Add a 'struct rpmsg_endpoint *ept' field to struct rpmsg_gpio_port
>>      to maintain the ept to port idx map.
>>
>> 2. Call port->ept = rpmsg_create_ept(rpdev,
>>                                                              rpmsg_gpio_channel_callback,
>>                                                              port, {rpdev.id.name,
>>                                                              RPMSG_ADDR_ANY,
>>                                                              RPMSG_ADDR_ANY})
>>      from rpmsg_gpiochip_register().
>>
> On the Linux side, we invoke rpmsg_create_ept. What is expected from the remote system in this case?


Nothing extra in my opinion. rpmsg_create_ept() just creates a dynamic
local endpoint address for Linux's usage. The firmware just has to make
sure to reply to the same endpoint address where it received the
message. This should already be in place IMO, because currently you are
sending all messages in the default endpoint (rpdev->ept) which is also
dynamic[1] and is created when the channel is created. And you receive
the responses correctly. (Unless you have hard-coded the default ept
address in the firmware)

[1]: 
https://github.com/torvalds/linux/blob/master/drivers/rpmsg/rpmsg_core.c#L480
(chinfo.src is RPMSG_ADDR_ANY)

Thanks,
Beleswar

> If the remote side does not need any extra support, this would be an excellent solution.
>
> Thanks,
> Shenwei
>
>> 3. Send msgs from local ept in rpmsg_gpio_send_message() by:
>>      rpmsg_send(port->ept, msg, sizeof(*msg));
>>
>> 4. Get the port info in rpmsg_gpio_channel_callback() by:
>>      struct rpmsg_gpio_port *port = priv;
>>
>> Which also eliminates the need for struct rpdev_drvdata as you can just do
>> rpmsg_get_rproc_node_name(rpdev) from rpmsg_gpiochip_register().
>>

