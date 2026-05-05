Return-Path: <linux-gpio+bounces-36230-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHdzCPwY+mmWJQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36230-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:21:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B808A4D1284
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C5893080F08
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 16:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637F348B386;
	Tue,  5 May 2026 16:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KuTGe84i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010001.outbound.protection.outlook.com [40.93.198.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688FE3ACF0F;
	Tue,  5 May 2026 16:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997617; cv=fail; b=iD9WSw+wWcmSZ7hx64RBUYLIBM+/1azsGVvwaIO2DpljwWsMgjeeOL9YBLMNomqYPf8Iadks+tT2KxWgCI7CLKNtioOCzw9Ot2uP9AKY5EucQ6euukxT9cmarYcqO1mdDbmKnFMUiGHfcBcRabvfucPN9EKxW2JFtc/pFgdx6Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997617; c=relaxed/simple;
	bh=wVsAw8rVVaoDXNS8e7hgpKdHZ5+b4u/HI5QdXLlokmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZQyXoDyaaGF9j3m4yu+0zUJucPX3E2+QTVRiT7wOOHCEymHDhQ91N/vGRfIVba9V7dXSJTfCNnLj8kHGJlX/V3JFRNsL5Z/I1Qo8DIAelHdvUEiqsZfzLsL1cElojO68rGFLcl9eSDCO0mtITEsgfvGi/IW2Qz69HhtUX0RZrXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KuTGe84i; arc=fail smtp.client-ip=40.93.198.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlUamzFFevUgBwDI8k9iDCWYM4qYnq0q10zWN5hY7+bb2IgpATaJQ2pfx6FGqZ/HnHkGptOEa5Q0d7+MCFJ9B/dAigOfVsvVZv8uKHunj0XRW96oo3aA+1B1ReHH0cApbJs5yR6ZrVYXfK5pvstFNB5syyjX/Q9x6urHBFg7GpZrGeaiUaZD5q8Ogw6/OUGVmuZchmfHencHJOZkIXW57g3yt3YSIIyCd1hYVzAjCiewUsYpJnlyZiiYESTP+kfFVqLbw3IqvvyneAlXS1sm/tkqMXAqEHdDjacVmFmDABpz8t1aiYUnN/MVZWM4JTp4DpEIEztDNSpk7N3UeqGM0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LKoOaDpW+6gIkaLt2BcWVeBNSCUDhUWqdZNsoWNjIM=;
 b=hjzDet5nuk/B5mDib3iSYUrwCQGb4rS4udoGjvaSno8fpFL/pIDB4m7AKcfKUzhcIvW0Wb8cpX7ZdRnRQVLuro8b5MRwrHp5xugh2gWgbVSmpwLrUNbNeg6HH4lXkoxdxU2KV6uHI4+N/juf0uYokU0U6SG+4H4CGdhABUPeK+eSuNxI5kaafGadtM9Puucgy6hyDhLZkiiNhIsqSpnEzvaCGv7w90YEfHVhxxQkZMQP/HLbOMvk24hX+VxvAp+prxHp5vJaIMuaotviSBmxoTrHgnap/adj3ui8IX5boX//xNMw+cVcIUzUOax5ekMTyGQLgVTNpjUd37E0AROT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LKoOaDpW+6gIkaLt2BcWVeBNSCUDhUWqdZNsoWNjIM=;
 b=KuTGe84iqbcvTNu0TtUNSdIj8/BxcC6ObxSuCnADdn+HdE6W5vyUYSxsSdFwlaSt2BPzOOU9gshTIRzUngpU6U6tb9koP+NwID1MySfkZCYsN0oB9y3Mo188xVWwjzY/H+JP/bunnJw7ElS+BLx2BS7+/kIqN5s+DUUGBsQSOIo=
Received: from BN9P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::11)
 by MW6PR10MB7638.namprd10.prod.outlook.com (2603:10b6:303:248::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:13:32 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:408:10c:cafe::b5) by BN9P222CA0006.outlook.office365.com
 (2603:10b6:408:10c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 16:13:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 16:13:28 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 11:13:18 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 11:13:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 11:13:18 -0500
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645GDAO73329317;
	Tue, 5 May 2026 11:13:10 -0500
Message-ID: <9a249ea8-5279-4698-a93f-2e91e2b8bf8f@ti.com>
Date: Tue, 5 May 2026 21:43:09 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: <tanmay.shah@amd.com>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
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
 <4b622824-0073-4c6a-8525-248bd484c3f0@ti.com>
 <a5012462-9953-424e-bfa0-427e7b07201e@amd.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <a5012462-9953-424e-bfa0-427e7b07201e@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|MW6PR10MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: f0595e92-5529-458e-fae6-08deaac13e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lC/nT6G2+8MHvwnMeqhhKmBlG8jKaCuh4rZWqaK/6m0nzFnO7iqqP493ydDjL0MjpTSf88wWWaEWQ3nXJkhnpHGJYJnFSUHZdc+7WXAHaHv6+GasRrN5qGvB+7FtFzZl7n2trVY7LAJq/IkKgaa7xwkBMP1CbSIAitNmkZ9bEhtfljOJruUzJ9UgscIt8Qrgcy+wVDA4XhCmiZiOlPbKrZvKr7LV0KNxFy4aarpglcjjbtvUH4QlkGfJhteCEZ37ARAvjckPS4JntPme65Y/yn/S8v+Yg2A71u73vdPEvUSDEGWyRy14U3q66A6A+IYYfd1RuyEUnvCy9s7hp0GKe8pRrcudH1Jxt0quMm0RYV5hAi6W+2gAULwqzEGfPtmNYyDS/JOX+WoSqF7vqvwnWctYrv3CeXR8gsusi4+bhd8pVapS4ml12STkRyGqTLYCbiWdgqOeQSqpTSPMXWD0JI7Ow42I5r/QvHSvbubVF5wSdL+DtMVup3cB2IRT6Gx5LoJsYFaIoaXWxHgzVhA5wZh2yjsJHi0cun8Ae7dGnt8YTY4ERED1BkPDSK24opyv1ZbrRLH2TUY21mQexjpgbXOB5wWsI3a7mCwZ7eDxgwMP6UFQHZNQSxni8Mkr5mHc7LdkRaJBU3VQmYGxmbAxVv8RqjxwXLeu4xdja2E/AaF4bHbswj/WtuwMt3R5Nzt2vp+yqfI7+rAc9hPurWCsILgMYybAsrj2/xIqTA5Tm0I=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z0IuSX4riiF10GzL7WzJnGD/UKZvkWBk3hS1RFv9iFi0zXuiVlPi80OoDUlgEhg5VesXwKlTgRGp5a2WBgl3CBmtyy7DfUsJw9pY3U4Ca85fDFUw56Pv+rib9PwYtrVb14d4g5HflCGFwauXifdjmG4mOx/nrJiNM5WNlDleAEBmMNv0V7HcwlUQJ6Br4cnrcE+IRN6ZxIHykTM2Xico5jJfcHsJpsuF6maoowg+93e9iD/6zNhgxPM/2lXuyV4gz2YRo0mo1qYr7IScgYNskgA9tLim/3cdrome/nSuDEHa7AjhvSExcus45Ttlihh0DmGbDb0EYlwN8RuPFCiAS/0zMidenEirpp9HZQ49aVsAOXJYr9yVWJu44yMcY6CBrNZejPoRmcnpGa/kgfk6T5qruFqmqPTnx0WjMHLXgxzoFxyUNwe1z+4tB9LNMsWv
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:13:28.5464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0595e92-5529-458e-fae6-08deaac13e76
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7638
X-Rspamd-Queue-Id: B808A4D1284
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	TAGGED_FROM(0.00)[bounces-36230-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xyz:email,0.0.0.1:email,0.0.0.2:email,0.0.4.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:dkim,ti.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-padhi@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	DBL_PROHIBIT(0.00)[0.0.4.1:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]


On 5/5/2026 9:08 PM, Shah, Tanmay wrote:


[...]

>
>>>   If there are
>>> multiple or multiple instances of same controller, than we need separate
>>> channel name for that controller just like we would have separate device
>>> on the Linux.
>>
>> Why so? I think there is some confusion in the terminology:
>>
>> GPIO controller = GPIO port (gpio@xyz) defined in the
>> Device tree = struct rpmsg_gpio_port in code
>>
>> GPIO line = Individual lines within each GPIO port (max =
>> GPIOS_PER_PORT_DEFAULT) = struct rpmsg_gpio_line in code
>>
> Okay, I understand now. So, same gpio controller has multiple instances.
>
>>>>>>>> 1. namespace/channel#1 = rpmsg-io
>>>>>>>>        a. ept1 -> gpio-controller@1
>>>>>>>>        b. ept2 -> gpio-controller@2
> So, In that case above mentioned approach doesn't work.
>
> Because, this approach is mapping endpoint to the gpio-controller.


And what is the problem with that?

>   From
> linux's perspective, it needs to map rpmsg *channel* to the
> gpio-controller not the endpoint.


Can you explain why it *needs* to?

>
> To be more specific:
>
> Linux:                               remote:
>
> ch1: rpmsg-gpio.-1.1024 ->     gpio-controller@1024
>      - gpio-line ept1
>      - gpio-line ept2    ->     They all map to same callback_ept_1024.
>      - gpio-line ept3


This is a weird mapping. I am not suggesting one ept per gpio-line,
rather one per gpio-controller. You can refer my detailed proposal
here:

https://lore.kernel.org/all/268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com/

>
> ch2: rpmsg-gpio.-1.1025 ->     gpio-controller@1025
>      - gpio-line ept1
>      - gpio-line ept2    ->     They all map to same callback_ept_1025.
>      - gpio-line ept3


[...]

>
> On the remote side, we have to hardcode Which rpmsg controller is mapped
> to which endpoint.


Not necessarily, we can exchange this info at runtime.

Thanks,
Beleswar


