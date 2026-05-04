Return-Path: <linux-gpio+bounces-36084-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO/9IdTR+Gm41AIAu9opvQ
	(envelope-from <linux-gpio+bounces-36084-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 19:05:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E44C1BB5
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 19:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64ECE301BCEE
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 17:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825983E3D9C;
	Mon,  4 May 2026 17:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="FuUNdI4n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC12322068D;
	Mon,  4 May 2026 17:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914258; cv=fail; b=qlO8zuC707Cy7x41PnQz5qeZ0wFh38wgmVqXlsmpuhM32R7bf0qjooCUmae289QhDCb6/pbFa7QnYb7FeN8Ys1fgD7NArOClmUCujwYwnD5pU5KGD/IMvX8p4Dfb4adKYV6II7x0AFY33Igqq1ZER/tMse+vQGvesTfg1sxVil0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914258; c=relaxed/simple;
	bh=L09bSN3Wza3eJ8NrAXnACStBbeIUUTEhrU8bd2uN+dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hh9hMdwiKmkz/f5sOBpWBM/1iNw5uH4uuCPkUoCXG/gIGvqFcGrrFHAKC/p5Ep+wV5FUZrR9jvyHqBHkTtYmUE7NCv7Bnj3w2ntrlP3VZoyk7AF0HdegeulxL3bs+o2lJuKYkxWKpXE/VPKIxmViC6C+gtCPC2hseOY9Tq+QE24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=FuUNdI4n; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voWBL1yQ9Azl4lw/Inq7BFqn1RVawmi0zGvmspGYZzWY3+t1AgbWcsoztRDKdKHcRkxCYzhhEoDxrqQVSX482SdRu90FHX8pl6arlOZVqg7xFVTlIfmBGs3tHjEaKQVrfN5fgOzc+hLl3TOnO/SHd/qoIwijlnTcbYftgJh15KOfkLyLa5HzplnrZkRh1ROmhHqTL2tdWNpjTEH5kduwT5a8nwjwcSG6UPv1Ur6QXVaNvtjtF0yesGPDng0Svq2imhPB2qNt7Bm1u4O3HozJKy0jrgTNey3gP2sSRzDn4cUJMHXdulErkF6m43KT2eAHt0FRYVLkqTMuQAvnaye2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DewmIMK1E+PrFwRSO/i7NFmJvmMUtxZon64RWouJSSM=;
 b=ixKIadAZXi/XcJcXWL4XNe5robnbvB1aOyLE8tgrCfUDyjMnNaTRK5Qm5BGLviQF4JGJ6yzICeGr1efd4oY/ZriLvqQ+1xnjSekyYb7rJCNyDSUZzx2dkHEWVDF8YuX2iJNGA/lXTZGlMt7VaHzzwImqAQHZTUtPYB9Ja2OO2WGGzOlH2AE06zEo1zM1MX+INU2e6xkUr0aFmCmwlbTK0fxP09GDHcAnkNfbxLZrHhkZIIRwmd30H5nz/X/ne+vOq1o8G8K+S1rRmMwP2N4JXhhnJuzz8ShcfIlS4u320rclKoDAHxCX7W+RTdNF7IvBt6+jP2hGKqjmbpCo0PPp+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=ti.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DewmIMK1E+PrFwRSO/i7NFmJvmMUtxZon64RWouJSSM=;
 b=FuUNdI4nYAtfDsvORbeUPqwbEtQ0OdE7UpngWmXyiBRsnX0WBQ2CihbnQt3+GH4uckUPorAIy9h5W4Q+EGsTObfUx/4zkBDVy8F1zN3EaC3RVgM2/CscmDMWR/kJ2LvRZTA5S3xM+GcJQhBJHQMJOEAR7RBfSNKS2J0UfskkOmh+ooNegaZEsGVnairRaTYH0HMOezzawULxLWN2FE8quGI0oJ90G+iAm9J/DSUDNkkLxtVIUjNf7DlgKW8HBHk7+DnZGEnQyzkzomdPQWvrGv/jws4vSMSoK/mp7JCn0wYXcdnzknKN+V+uhylf9fmeQrm/YDOh0Am5KcqrJS/waw==
Received: from DUZPR01CA0171.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::17) by AS4PR10MB5991.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:51e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 17:04:10 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::42) by DUZPR01CA0171.outlook.office365.com
 (2603:10a6:10:4b3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 17:04:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Mon, 4 May 2026 17:04:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 4 May
 2026 19:07:44 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 4 May
 2026 19:04:07 +0200
Message-ID: <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
Date: Mon, 4 May 2026 19:04:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Beleswar Prasad Padhi <b-padhi@ti.com>, Mathieu Poirier
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
 <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D01:EE_|AS4PR10MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: db0c7e8e-94e6-4a66-504a-08dea9ff28a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|82310400026|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7TWAPlvRC4b8gL6Csbkcd+uIAJgQZvzcfk+v8Ib6nOQBkNuoe+DbqlYKEhnyDjpjSrwsEf09OiOjpbR52kxFWs3id2XEmUqqod8zl6gvPKS++yO7bUhrqEHC62jOsKqAfWEFtwJMGtFa2uiMtE2jbUFJ5km+GF2ktKiadb01YTnbsajrbLw9dFxDbBzHN2Yb9r/nNiRx8vbJ+OEL8oWvFVGslrEg8J9YkQadQyluiXGzs30YT+b1DrLmMrGlfGC73/u3Kl9j9en9hMNwusH3g7VZhOImNjnTzCZVzAjL4wNk+0lRiovRhpkXKpALl1p2ExJO9K6bh8cont7eROl/coG20RRy4WFtiZcEFjO2kqNhfL+06jzw2+9wOECNmufTjJ2Yq0Xtg15PHCZ0z+8hTv1VUxWR4I0sc6FtnVfkjlUutbHhGzPhcZ0TKhuH7sqglFV2eAIo63jc0srUs/o7ziX6vhO7sRt0kwAkVZ0pwYFX88oW30QGHwf6yoNCH0hoWV1JajTpEga/woCSuOnLIU1d4UnEWHxhLnsNHjJITsU3UCJqKRe6YfcYQbQseaveexsgTXkEUDpauoplSgVsq+lqYZLL7UU3lHXLETL4DnKekuZE3nb3P5pKWFuX5HZADnQ2bo20pDBWOimIKftmDLNkrau/xSqwZIjoWPjC/CnZNkY9lQXNSwSTIfZ9DN/WZRmnh0Oitn8X7M3plcP2RNWBnJ+QuJsP2a9pgR4IA4c=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(82310400026)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oOusno+ZGCeemnyrZMuoNrwsAzMqOX1xaguT77HI8+2PcfHj8xKg3aEFbh9LMrub8tbb/TJR7+rIIsj0050XhH64ORoI4oqPtSh5Q/1N62roudqCfQDbIlt6KZkKipSsIcG+A9+1SHKrxDTvGNh7vVN+rjVF6q9o+4jXzZQw7WRHQV+n0bjzJ0ZWtYNd9+SvWbTpKO0n0KiO41topPXmARXeP06e/l0pcmAJuul4Y0LM1f4bnNUJIHd4YeXrFi+DdPW3qx3Ee4yuVJfnauiu/dxc0PAe6C4FKhxY0w86UqCLft5ZteRVLNF+0JvMUAHI2iWJS5Frz2qMKgC37wavV6i3Wm0gurnwl+HBm03doxRoSwnpafeF60+6zo+JsJrmlrpQ6V1lF/uqlnRQpcOA3KRbhg4Vhg3kMxk8WUc6phgJjJemNs7Img0Y3QnVTNpk
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 17:04:09.5802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db0c7e8e-94e6-4a66-504a-08dea9ff28a8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5991
X-Rspamd-Queue-Id: D22E44C1BB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36084-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]

Hi Beleswar,

On 5/4/26 10:17, Beleswar Prasad Padhi wrote:
> Hi Arnaud,
> 
> On 30/04/26 22:10, Arnaud POULIQUEN wrote:
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
>>>>>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>>>>>
> 
> [...]
> 
>>>>>> My mental model looks like this for the complete picture:
>>>>>>
>>>>>> 1. namespace/channel#1 = rpmsg-io
>>>>>>        a. ept1 -> gpio-controller@1
>>>>>>        b. ept2 -> gpio-controller@2
>>>>>>
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
>>>> I would be more in favor of Mathieu’s proposal: “An endpoint is created with every namespace request.”
>>>>
>>>> If the endpoint is created only on the Linux side, how do we match the Linux endpoint address with the local port field on the remote side?
>>>
>>>
>>> Simply by sending a message to the remote containing the newly created
>>> endpoint and the port idx. Note that is this done just one time, after this
>>> Linux need not have the port field in the message everytime its sending
>>> a message.
>>>
>>>>
>>>> With a multi-namespace approach, the namespace could be rpmsg-io-[addr], where [addr] corresponds to the GPIO controller address in the DT. This would:
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
>>> [    9.290275] virtio_rpmsg_bus virtio0: creating channel ti.ipc4.ping-pong addr 0xd
>>> [    9.311230] virtio_rpmsg_bus virtio0: creating channel rpmsg_chrdev addr 0xe
>>> [    9.496645] rpmsg_chrdev virtio0.rpmsg_chrdev.-1.14: DEBUG: Channel formed from src = 0x400 to dst = 0xe
>>> [    9.707255] rpmsg_client_sample virtio0.ti.ipc4.ping-pong.-1.13: new channel: 0x401 -> 0xd!
>>>
>>> So in this case, rpmsg-io-1 can have different ept addr than rpmsg-io-2
>>> Back to same problem. Simple solution is to reply to remote with the
>>> created ept addr and the index.
>>
>> That why I would like to suggest to use the name service field to identify the port/controller, instead of the endpoint address.
>>>   
>>>>
>>>> - match the RPMsg probe with the DT,
>>>
>>>
>>> We can probe from all controllers with a single name service
>>> announcement too.
>>>
>>>> - provide a simple mapping between the port and the endpoint on both sides,
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
> 
> 
> In my solution, there is no need to have this map of endpoint to
> GPIO port at Linux side. This aligns more with virtio-gpio design
> as well.
> 
>>
>> I may have misunderstood your solution. Could you please help me
>> understand your proposal by explaining how you would handle three
>> GPIO ports defined in the DT, considering that the endpoint
>> addresses on the Linux side can be random?
>> If I assume there is a unique endpoint on the remote side,
>> I do not understand how you can match, on the firmware side,
>> the Linux endpoint address to the GPIO port.
> 
> 
> Sure, let me take an example:
> Assumptions: 3 GPIO ports in DT, 3 endpoints in Linux (one per port),
> 1 endpoint in remote (0xd) and 1 rpmsg channel (rpmsg-io)
> 
>         rpmsg {
>           rpmsg-io {
>             #address-cells = <1>;
>             #size-cells = <0>;
> 
>             gpio@25 {
>               compatible = "rpmsg-gpio";
>               reg = <25>;
>               gpio-controller;
>               #gpio-cells = <2>;
>               #interrupt-cells = <2>;
>               interrupt-controller;
>             };
> 
>             gpio@32 {
>               compatible = "rpmsg-gpio";
>               reg = <32>;
>               gpio-controller;
>               #gpio-cells = <2>;
>               #interrupt-cells = <2>;
>               interrupt-controller;
>             };
> 
>             gpio@35 {
>               compatible = "rpmsg-gpio";
>               reg = <35>;
>               gpio-controller;
>               #gpio-cells = <2>;
>               #interrupt-cells = <2>;
>               interrupt-controller;
>             };
>           };
>         };
> 
> Code Flow:
> 1. "rpmsg-io" channel is announced from remote firmware with unique dst
>      ept = 0xd.
> 
> 2. rpmsg_core.c creates the default dynamic local ept for the channel
>      ept = 0x405.
> 
> 3. rpmsg_core.c assigns the allocated addr to rpdev device:
>      rpdev->src = 0x405 and rpdev->dst = 0xd.
> 
> 4. rpmsg_gpio_channel_probe() is triggered. For *each* of the GPIO ports
>      in DT, it will trigger rpmsg_gpiochip_register() which will now:
>         a. Call port->ept = rpmsg_create_ept(rpdev,
>                                                                     rpmsg_gpio_channel_callback,
>                                                                     port,
>                                                                    {rpdev.id.name,
>                                                                     RPMSG_ADDR_ANY,
>                                                                     RPMSG_ADDR_ANY});
>             Ex- port->ept->addr = 0x408
> 
>         b. Prepare a 8-byte message having 2 fields:
>             port->ept->addr (0x408) and port->idx (25)
> 
>         c. Send this message to remote firmware on default channel ept
>             (0x405 -> 0xd) by:
>             rpmsg_send(rpdev->ept, &message, sizeof(message));
> 
>         d. Remote side receives this message and creates a map of the
>             linux_ept_addr to gpio_port. (0x408 <-> 25)
> 
> 5. After this point, any gpio messages sent from Linux from gpio port
>      endpoints (Ex- 0x408) can be decoded at remote side by looking up
>      its map (Ex- map[0x408] = 25).
> 
> 6. Any messages sent from remote to Linux for a particular gpio port can
>      also be decoded at Linux by simply fetching the priv pointer to get
>      the per-port device:
>      struct rpmsg_gpio_port *port = priv;
>

Thanks for the details!

To sum up:
- the default endpoint acts as the GPIO controller (0x405),
- one extra Linux endpoint is created per port defined in DT.

This should work, but my concerns remain the same:

   1) This implementation forces the remote processor to handle a single
      endpoint instead of one endpoint per port. This may add complexity to
      the remote firmware if each port is managed in a separate thread.

   2) Linux, as a consumer, should not expose its capabilities to the remote
      side (in your proposal it enumerates the ports defined in the DT). 
     In my view, the remote processor should expose its capabilities as the
      provider.

 From my perspective, based on your proposal:
  1) Linux should send a get_config message to the remote proc (0x405 -> 
0xD). 2) The remote processor would respond with the list of ports, 
associated
     with an remote endpoint addresses.
  3) Linux would parse the response, compare it with the DT, enable the GPIO
     ports accordingly, creating it local endpoint and associating it with
     the remote endpoint.
Using name service to identify the ports should avoid step 1 & 2 ...

At the end, whatever solution is implemented, my main concern is that the
Linux driver design should, if possible, avoid adding unnecessary complexity
or limitations on the remote side (for instance in openAMP project).

Thanks,
Arnaud


> So Linux does not need to send the port idx everytime while sending a
> gpio message anymore.
> 
> Thanks,
> Beleswar
> 
> [...]
> 


