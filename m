Return-Path: <linux-gpio+bounces-36030-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO3TEyNW+GnTtAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36030-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:17:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB654BA0F0
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D8E13003714
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 08:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3685031960A;
	Mon,  4 May 2026 08:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iCo0mqWc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF26313547;
	Mon,  4 May 2026 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882652; cv=fail; b=VQcWB699BR3BAJWFP1y81XjcdI4iRsblifOH7Lh0RsbIlUrr0h25LKMxGpup1hBrzOqLZ5CI3nfHVdBJ1C98F32E4p75ZtjSBAj73/8KdgVu7yRaLYbAL0oJiCGPAV5cIJI1eKMC9pn0Y1Azgo1jQgQxSbQ3dd1WP9DqxXZpqa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882652; c=relaxed/simple;
	bh=uFWMwqz9/f7739K/vMYM4ATZ3+2X4p5l/K9VKY9kAM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fCFGOfN1WAM7c8arg1BZLeA53eQwemX4eVSIkDSdtcABJebc9aISyeq1HE62ERm6jn/KFEXiS8TARxB4grLZdIGwYvfMi0YqR+t+/fPEwT/HdJbmJhgJdPUGx6GWj3zWikTaLVc2DqH41ly3NI32bGmHD5j1HcnO9+SiGxGjrjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iCo0mqWc; arc=fail smtp.client-ip=52.101.56.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OT39AL6sGryphLsuguAGHg0FLHOr/N9/HIRnFNXb3UXifD5WjT437BC8QfdOvvvq3dA1Ms6SarCH4ycXp1AEj8L4KbZY3AsGC7bitIFwwQ5F2BzqNkIRzu+VZfoIDBdpNI+5UDhuv5RMF6TxdDcGa10DgFuVGBR0lrAYz0LAew7Xm0w4+MOpLbcei8uPH2DFpVFb4r/eLHw5DPI+aj4NmVTM12CHx7s8sz4wvIUem3zkOQH5SrK04IbW9N0yCJ9FHaJA2TKzhVjx+NaTwy45uTlkoMcqOOCJxw8bB8z9HpXaImZkGDoAUT6XLb8giPIlkFzO+OxX02Cz+j7FBIdQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFWMwqz9/f7739K/vMYM4ATZ3+2X4p5l/K9VKY9kAM0=;
 b=OPTQeIeGj8ZIUHU4ObCqQ9q4Iw/rR+A9mCcXGr31CMNIY0OZYfJqY6jzp6/F3nKnSszXXQNk3n8ycAXySAx8eTsKlbezb664H5544hzvTPVPVG6afsUUNfPg5zIC4/JMm3Zh3TDot5CwXVqb2yt1kaB/+bbt10c08CePIao8w7M4s+pY01V8w8TkzF/bQxrNi0eNyLP452nMBOmxl+AYrM162eg2rzHXL7PojWxy2XYTYqnqd9a/ltbjL7QBwpswrhRkGS0e3V2C/7xoQli+u2js9u/Hf4ZpnnZy3dP6kzuw72iyy+l4IDDeDs0zVE/83vK+5M7tMS4nLNTT8beUhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFWMwqz9/f7739K/vMYM4ATZ3+2X4p5l/K9VKY9kAM0=;
 b=iCo0mqWcDs46jQKH1HueVmMXxuq8R2Vy+srAJ+myUYzYo0zrOjd9nVQWWCfHPeizbG+Uw3VF9/VJYwgxiC3ss3Fmpo/Fjd9+6BMKIdlSpqBnqsk2j4xBmt/100f6UkNZXemlBOOlgWkiC9DYNYLQCaZ5yeGyctypUZo3l7nMNso=
Received: from CH2PR10CA0005.namprd10.prod.outlook.com (2603:10b6:610:4c::15)
 by CH2PR10MB4279.namprd10.prod.outlook.com (2603:10b6:610:a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 08:17:26 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::53) by CH2PR10CA0005.outlook.office365.com
 (2603:10b6:610:4c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 08:17:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 08:17:25 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 03:17:25 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 03:17:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 4 May 2026 03:17:24 -0500
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6448HIoM315577;
	Mon, 4 May 2026 03:17:18 -0500
Message-ID: <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
Date: Mon, 4 May 2026 13:47:17 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
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
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|CH2PR10MB4279:EE_
X-MS-Office365-Filtering-Correlation-Id: 5837698c-300b-42b8-41de-08dea9b59346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ok8Hj+WTKlk8ITVti4Kjks9KIMd69Qg9bvCUa6UgeERm6Ipv3gdWZPULmBs1C1NOC/mi+OLTVNkS3uGIWUp4nopVvGKqA61VRZ2jhR4mpuBNJx0yk2FwYh7rivvbTkfjNzARgxdbe9L9jXfvyjy0A3crsPQWr5wb5eekSZvq94EcH1OrrrTGjWfSmGQiD3QVCAAXt3WyJiQvG2W2onCz7J6o0DJ6TumeZJ0sMi0ihumLkG8PiODmzCRq2o02MCTuUlBviFHon/8OKqq3oyFO8/Mn+Hg5TM5Yr60DrztCXnP9cxuGQHKS8Fq5yuGS7qvxK9l2WpEbF+I0Ah8ThbZ+bw55JhxPTOjle+8SfVfnjKIDbBQBS/wjxpA0xqNlnzJHdzpT2RFvHi2+tT1CSBXZz/xcqvcLZgmShZbS+wW7YN5z6rjMnqxzgqn3OODhhHy5fAlrG7pzILa9jnq7adugOkuID/+nAN82g+lv0WzJV1RBEEnmOq/egyw8gi6yy54gOzMUkJA2mFg/LZnZl2PdnwDA65zq/rmSaJUCBsjnW3Xal6YN1jRZ7Gdjzu3PEmplSgZRq7vIqbkeUDuDbaNBYPb21yeqd72gxWlYOC9AJc7WYfjbVeEQe2/h3IIvdvi3qOhwlWMxG4K9hGHQqhqzw50UZVrKJginAmC57YsWFK6l7aTI9GZw0dp5HZRrVa8ijLZG7d3u2IDiC7J2qPL3HqOmGUJ+/YzmAF6I7XTwglU=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y6l7q71oq/H/DV4pei70b/ErNEYYsBOKcLvvRwJ5eMf27NTbAZE2qFUU83oyYeav5trVOzEeuhjtxQbGZ7bltzFIBO+qpL96OlIFKTmzotTBTACww20OhdU6f7YgO7F9xh+ItAvCrccMZiTiRSfkPGxnyFOedy3dio3bPcWUYnpI9/jlUoJAHQ27POHZmeZ2rVpyKZxK5q3xDzEwtPSps9AT1qHsPd03rWuAZ2nErZHxiMGQLWS9rIrunHLKVhNhACDI9LSgNJYSLamW7U+hsGF8592J2UZ0bT14VU1GLRA0acKqEL2rhRsCRD7fYDlkzFxwEcWSkzVt+eShMQw3noG/7oAUCo6WlSYhjk2BCdZUd088ckwm93ol5qK0z+H2rEAEv3DS+jTbyoLMg8RNQMJpxsdK9NAvGfJDujVEi6P84NrJg85hlzwO8ekHYu2T
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 08:17:25.7227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5837698c-300b-42b8-41de-08dea9b59346
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4279
X-Rspamd-Queue-Id: 4AB654BA0F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36030-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-padhi@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]

Hi Arnaud,

On 30/04/26 22:10, Arnaud POULIQUEN wrote:
>
>
> On 4/30/26 14:56, Beleswar Prasad Padhi wrote:
>> Hello Arnaud,
>>
>> On 30/04/26 13:05, Arnaud POULIQUEN wrote:
>>> Hello,
>>>
>>> On 4/29/26 21:20, Mathieu Poirier wrote:
>>>> On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>>>>>
>>>>> Hi Mathieu,
>>>>>
>>>>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
>>>>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>>>>

[...]

>>>>> My mental model looks like this for the complete picture:
>>>>>
>>>>> 1. namespace/channel#1 = rpmsg-io
>>>>>       a. ept1 -> gpio-controller@1
>>>>>       b. ept2 -> gpio-controller@2
>>>>>
>>>>
>>>> I've asked for one endpoint per GPIO controller since the very
>>>> beginning.  I don't yet have a strong opinion on whether to use one
>>>> namespace request per GPIO controller or a single request that spins
>>>> off multiple endpoints.  I'll have to look at your link and reflect on
>>>> that.  Regardless of how we proceed on that front, multiplexing needs
>>>> to happen at the endpoint level rather than the packet level.  This is
>>>> the only way this work can move forward.
>>>>
>>>
>>> I would be more in favor of Mathieu’s proposal: “An endpoint is created with every namespace request.”
>>>
>>> If the endpoint is created only on the Linux side, how do we match the Linux endpoint address with the local port field on the remote side?
>>
>>
>> Simply by sending a message to the remote containing the newly created
>> endpoint and the port idx. Note that is this done just one time, after this
>> Linux need not have the port field in the message everytime its sending
>> a message.
>>
>>>
>>> With a multi-namespace approach, the namespace could be rpmsg-io-[addr], where [addr] corresponds to the GPIO controller address in the DT. This would:
>>
>>
>> You will face the same problem in this case also that you asked above:
>> "how do we match the Linux endpoint address with the local port field
>> on the remote side?"
>
> Sorry I probably introduced confusion here
> my sentence should be;
>  With a multi-namespace approach, the namespace could be rpmsg-io-[port],
>  where [port] corresponds to the GPIO controller port in the DT.
>
>
> For instance:
>
>       rpmsg {
>         rpmsg-io {
>           #address-cells = <1>;
>           #size-cells = <0>;
>
>           gpio@25 {
>             compatible = "rpmsg-gpio";
>             reg = <25>;
>             gpio-controller;
>             #gpio-cells = <2>;
>             #interrupt-cells = <2>;
>             interrupt-controller;
>           };
>
>           gpio@32 {
>             compatible = "rpmsg-gpio";
>             reg = <32>;
>             gpio-controller;
>             #gpio-cells = <2>;
>             #interrupt-cells = <2>;
>             interrupt-controller;
>           };
>         };
>       };
>
>  rpmsg-io-25  would match with gpio@25
>  rpmsg-io-32  would match with gpio@32
>
>
>>
>> Because the endpoint that is created on a namespace request is also
>> dynamic in nature. How will the remote know which endpoint addr
>> Linux allocated for a namespace that it announced?
>>
>> As an example/PoC, I created a firmware example which announces
>> 2 name services to Linux, one is the standard "rpmsg_chrdev" and
>> the other is a TI specific name service "ti.ipc4.ping-pong". You can
>> see it created 2 different addresses (0x400 and 0x401) for each of
>> the name service request from the same firmware:
>>
>> root@j784s4-evm:~# dmesg | grep virtio0 | grep -i channel
>> [    9.290275] virtio_rpmsg_bus virtio0: creating channel ti.ipc4.ping-pong addr 0xd
>> [    9.311230] virtio_rpmsg_bus virtio0: creating channel rpmsg_chrdev addr 0xe
>> [    9.496645] rpmsg_chrdev virtio0.rpmsg_chrdev.-1.14: DEBUG: Channel formed from src = 0x400 to dst = 0xe
>> [    9.707255] rpmsg_client_sample virtio0.ti.ipc4.ping-pong.-1.13: new channel: 0x401 -> 0xd!
>>
>> So in this case, rpmsg-io-1 can have different ept addr than rpmsg-io-2
>> Back to same problem. Simple solution is to reply to remote with the
>> created ept addr and the index.
>
> That why I would like to suggest to use the name service field to identify the port/controller, instead of the endpoint address.
>>  
>>>
>>> - match the RPMsg probe with the DT,
>>
>>
>> We can probe from all controllers with a single name service
>> announcement too.
>>
>>> - provide a simple mapping between the port and the endpoint on both sides,
>>
>>
>> We are trying to get rid of this mapping from Linux side to adapt
>> the gpio-virtio design.
>>
>>> - allow multiple endpoints on the remote side,
>>
>>
>> We can support this as well with single nameservice model.
>> There is no limitation. Remote has to send a message with
>> its newly created ept that's all.
>>
>>> - provide a simple discovery mechanism for remote capabilities.
>>
>>
>> A single announcement: "rpmsg-io" is also discovery mechanism.
>>
>> Feel free to let me know if you have concerns with any of the
>> suggestions!
>
> My only concern, whatever the solution, is that we find a smart
> solution to associate the correct endpoint with the correct GPIO
> port/controller defined in the DT. 


In my solution, there is no need to have this map of endpoint to
GPIO port at Linux side. This aligns more with virtio-gpio design
as well.

>
> I may have misunderstood your solution. Could you please help me
> understand your proposal by explaining how you would handle three
> GPIO ports defined in the DT, considering that the endpoint
> addresses on the Linux side can be random?
> If I assume there is a unique endpoint on the remote side,
> I do not understand how you can match, on the firmware side,
> the Linux endpoint address to the GPIO port. 


Sure, let me take an example:
Assumptions: 3 GPIO ports in DT, 3 endpoints in Linux (one per port),
1 endpoint in remote (0xd) and 1 rpmsg channel (rpmsg-io)

       rpmsg {
         rpmsg-io {
           #address-cells = <1>;
           #size-cells = <0>;

           gpio@25 {
             compatible = "rpmsg-gpio";
             reg = <25>;
             gpio-controller;
             #gpio-cells = <2>;
             #interrupt-cells = <2>;
             interrupt-controller;
           };

           gpio@32 {
             compatible = "rpmsg-gpio";
             reg = <32>;
             gpio-controller;
             #gpio-cells = <2>;
             #interrupt-cells = <2>;
             interrupt-controller;
           };

           gpio@35 {
             compatible = "rpmsg-gpio";
             reg = <35>;
             gpio-controller;
             #gpio-cells = <2>;
             #interrupt-cells = <2>;
             interrupt-controller;
           };
         };
       };

Code Flow:
1. "rpmsg-io" channel is announced from remote firmware with unique dst
    ept = 0xd.

2. rpmsg_core.c creates the default dynamic local ept for the channel
    ept = 0x405.

3. rpmsg_core.c assigns the allocated addr to rpdev device:
    rpdev->src = 0x405 and rpdev->dst = 0xd.

4. rpmsg_gpio_channel_probe() is triggered. For *each* of the GPIO ports
    in DT, it will trigger rpmsg_gpiochip_register() which will now:
       a. Call port->ept = rpmsg_create_ept(rpdev,
                                                                   rpmsg_gpio_channel_callback,
                                                                   port,
                                                                  {rpdev.id.name,
                                                                   RPMSG_ADDR_ANY,
                                                                   RPMSG_ADDR_ANY}); 
           Ex- port->ept->addr = 0x408

       b. Prepare a 8-byte message having 2 fields:
           port->ept->addr (0x408) and port->idx (25)

       c. Send this message to remote firmware on default channel ept
           (0x405 -> 0xd) by:
           rpmsg_send(rpdev->ept, &message, sizeof(message));

       d. Remote side receives this message and creates a map of the
           linux_ept_addr to gpio_port. (0x408 <-> 25)

5. After this point, any gpio messages sent from Linux from gpio port
    endpoints (Ex- 0x408) can be decoded at remote side by looking up
    its map (Ex- map[0x408] = 25).

6. Any messages sent from remote to Linux for a particular gpio port can
    also be decoded at Linux by simply fetching the priv pointer to get
    the per-port device:
    struct rpmsg_gpio_port *port = priv;

So Linux does not need to send the port idx everytime while sending a
gpio message anymore.

Thanks,
Beleswar

[...]


