Return-Path: <linux-gpio+bounces-36503-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLGPFwpiAWp+XQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36503-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 06:58:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB406507EDD
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 06:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12DAB30028AA
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 04:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67A9364E92;
	Mon, 11 May 2026 04:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MOt3OaHm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011018.outbound.protection.outlook.com [40.93.194.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB2581ACA;
	Mon, 11 May 2026 04:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778475527; cv=fail; b=PHBfkeJ4MNnuLZ2XcDz539QohUDLf6aFU/DQEChJ2vVIBSUxc+G75CYomqhQGEuYX7doTqzNpTFhrztKBHyYREcX2vzKlTJqi8rDqJ++V9ffdDrFH61AdB0U+wWC84dBxN1bG3ftKosrmaYlTGD1sjXyQuk0HcvT0GAMAnHQsXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778475527; c=relaxed/simple;
	bh=bkRDw7aU/ZER+EJZUXSfpzw3WIShzdWXONJoI2FKiFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qduNZrHRbrrwUr+XV7/glrW940PNpKrJsbdODaJLzND8s9fENLRUSOBJo0XgyQvoYDOFmQWlC8VdaLgA1NNcSwr1MBxrpbDftfKUSmkXoJk9syFovOCV+t9EDcP8TBjwMdNdGp44OhI6LhOujCVpyI701ewnKJ4v18xwMtWvvQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MOt3OaHm; arc=fail smtp.client-ip=40.93.194.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVRhc8U4c5KcsVajCsZgoWdi/giJElYDzIBiUSCfNreiK1gMLoZGfOWFO1xgUecv2Kws5p9SiiAUaTc6NOqQByICCfdpLGBbQK3Qtn85v/C6lyInuNy60Pl9BzojxPfGovpXIBpSaFs+Xs42W1BEHeAQhtkb5CBIdylsbhMhfhH5tGeXQEWnWf/90Mb8jDifJuRmcKJbxMpQ9j5A249SLEs/3rmUsHmthIQswXgpAR8/vkyo40rrMYA7btOzn/s1ik1+fjBZpE6Xz6T46FwLTEWHCzNyt+go9otCmVhbXN2T+1+CTHND0EuBc+3u9eaO06DnWHZtIcLdyg8SscXTig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuzrfR/Mxgy+d8rXhjvSkFvDcWPZJwXKSWBS7v4vGbQ=;
 b=ZS12Sf3cpl7TqThCwvUK5GIfDJrWaeD9+Z39Eqjt5XzGEQarWa1B9XWB9ZxC1mag0dLHvbyk8UDDTuVmEmSMDUpRwJ1PcwmbYMqKJJ3isJ7a4gffbu4TEE6H28zZ3xN7HvXeP2jn7WkhSsITAfr8ic/6jXYHI2vg0veqlWr+Yv2KYMQZaGh6DQebM0IU5c5Ql4VhxRbDcX2yYKmnAG6FS+hk/ubsyLHnjHuiULYjOlrgAPdC3dRsiily4t9Ta1e7eFOdD3cCvfwFU96B7ag7EHUjz203kDHp1BAF/AS8MxVktYpW2rvxZOYlXktfHfV5+JxFNw41OOErJjX1PBYG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuzrfR/Mxgy+d8rXhjvSkFvDcWPZJwXKSWBS7v4vGbQ=;
 b=MOt3OaHms7OTBsCywHsmoFHeYdUjFhWrN9mCIieb41ERLQMU123vQl+xwXQVoF+vQymx41nfwfru57FzllEdJ7iWFbrPP8X1laYcZUgCRc7JqoO6MDJy1d41rpWhVVNexYtFy+nXnwdiuJV6jyuV0zQPkjTad6fXD/yT43hUqOo=
Received: from BYAPR05CA0004.namprd05.prod.outlook.com (2603:10b6:a03:c0::17)
 by CO6PR10MB5634.namprd10.prod.outlook.com (2603:10b6:303:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 04:58:43 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::a1) by BYAPR05CA0004.outlook.office365.com
 (2603:10b6:a03:c0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.14 via Frontend Transport; Mon, 11
 May 2026 04:58:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 04:58:39 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 10 May
 2026 23:58:38 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 10 May
 2026 23:58:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Sun, 10 May 2026 23:58:38 -0500
Received: from [172.24.18.18] (ltpw09g66v.dhcp.ti.com [172.24.18.18])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64B4wQLD2625874;
	Sun, 10 May 2026 23:58:27 -0500
Message-ID: <99819177-5911-4271-96b2-6f0eb7f9c42d@ti.com>
Date: Mon, 11 May 2026 10:28:25 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>
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
References: <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
 <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
 <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
 <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com> <afzIABSh1xtMEGbf@p14s>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <afzIABSh1xtMEGbf@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|CO6PR10MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: a713aac1-a590-47ff-2ff8-08deaf19f7d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0l8M33VNjrJmmAL1vlwh62ffIswToR2MzaHhF3jrP/dRQ/sAiRPRJHJ54zN3LuYDpqNVX344iMXqZ75GC+XPbriowahUJBvBkUAXviEWRm2s1yhrn4ScalsV92n43Ib9RRZiwrbrXSvEcI2REpTXQ/wZ/69cejdMlSoLbYDFJpTLyZALgJf2K+flyD40fvVFUD8o9tEyHcacL63Odqt2oqCPJAYioSzhAp0Nm/rfx2LA2W2i8gQwZuiPaMI2+pVjZap1JXMQAV4wJQz2Hc9/OmNW7cTVmTuNWWseijjxdLxzMmeh7U36Fnkr3YOieb9MSUHtOHwsSB0zpM2SyIIC8V38e4zp1495F+HbUYuhZ7y2yJiOKpLMXp0Fzlq+vJbd2PYuIDWAJD9BQlgGIzw7sCwwGkKO35+VJOQc/dodHuDRg4zOHbS23PNXkV5DGKRIRhFI9mH65IiCmM34xz+et16MW9ruW528u8WUFHuIRTazG8bnegOqZtaDVurRQ+qHiyIjBsiy5YRNHiZlPheDQ7Ch/4V7VpTyrpEfyCaaw6wNxvYgyBtttuUuZKpNlg6s1RANV7fohoA4iCOJLyB7qbmh1vbAwmUAFAT0PaNZhPP1LbIJPiy5lz0iPSr8ygXHgzCJTmwvqvVfM12tCbtHmsCffwikK44TKBaFWTrdNcvDGLIH7r+IbgMkU6ZuVDkKOMY5vRM6+ngppxXsPh3IbK5R9cG4COdUOWU4kvO5i2U=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tIGpsyd34siFj55QdOsRPFCB+7ljgbt8aE/CpnyLzhKFxKo4Na0+ocO4eabSXR6hahjJGHz2La1+ID2DDhJYw8D0qbe0k9C4FNvDMZVt66cXVOT4p5BiPCoALUr6If0LvNp1ibXzQvqqy2rLA9VLtiQmVGFH3R+IRai4SHKUbOoGSUBND5AMw5a85VuUSCpyOXAktxVgkFOERfb8BmxaHJtzQOMJrOqegsBpV7aqvVAzHuD89+NTbWsESSyCS00zl5CRjNwk1pWArAqMqzm0hai32NeeoXOsLEwPCCdndKpCdljnspB5/BmSwLYuyeSdYHdzstl7fKvuTj1JJpipgU02dqaRQ3eZeXFkDL8oUm6u3kgCDuz5cB3gDoA+dKHxLTZzk3k9wNNWEAz5ZLT8kPsKsZMdySeel/Sy6g0L3uVXX98dn3yVGGhwflIy6jC+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 04:58:39.8752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a713aac1-a590-47ff-2ff8-08deaf19f7d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5634
X-Rspamd-Queue-Id: EB406507EDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	TAGGED_FROM(0.00)[bounces-36503-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,0.0.0.35:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-padhi@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.32:email,0.0.0.25:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Mathieu,

On 5/7/2026 10:42 PM, Mathieu Poirier wrote:
> On Tue, May 05, 2026 at 10:46:11AM +0200, Arnaud POULIQUEN wrote:
>> Hi Beleswar
>>
>> On 5/5/26 07:25, Beleswar Prasad Padhi wrote:
>>> Hi Arnaud,
>>>
>>> On 04/05/26 22:34, Arnaud POULIQUEN wrote:
>>>> Hi Beleswar,
>>>>
>>>> On 5/4/26 10:17, Beleswar Prasad Padhi wrote:
>>>>
>>> [...]
>>>
>>>>>> I may have misunderstood your solution. Could you please help me
>>>>>> understand your proposal by explaining how you would handle three
>>>>>> GPIO ports defined in the DT, considering that the endpoint
>>>>>> addresses on the Linux side can be random?
>>>>>> If I assume there is a unique endpoint on the remote side,
>>>>>> I do not understand how you can match, on the firmware side,
>>>>>> the Linux endpoint address to the GPIO port.
>>>>>
>>>>> Sure, let me take an example:
>>>>> Assumptions: 3 GPIO ports in DT, 3 endpoints in Linux (one per port),
>>>>> 1 endpoint in remote (0xd) and 1 rpmsg channel (rpmsg-io)
>>>>>
>>>>>           rpmsg {
>>>>>             rpmsg-io {
>>>>>               #address-cells = <1>;
>>>>>               #size-cells = <0>;
>>>>>
>>>>>               gpio@25 {
>>>>>                 compatible = "rpmsg-gpio";
>>>>>                 reg = <25>;
>>>>>                 gpio-controller;
>>>>>                 #gpio-cells = <2>;
>>>>>                 #interrupt-cells = <2>;
>>>>>                 interrupt-controller;
>>>>>               };
>>>>>
>>>>>               gpio@32 {
>>>>>                 compatible = "rpmsg-gpio";
>>>>>                 reg = <32>;
>>>>>                 gpio-controller;
>>>>>                 #gpio-cells = <2>;
>>>>>                 #interrupt-cells = <2>;
>>>>>                 interrupt-controller;
>>>>>               };
>>>>>
>>>>>               gpio@35 {
>>>>>                 compatible = "rpmsg-gpio";
>>>>>                 reg = <35>;
>>>>>                 gpio-controller;
>>>>>                 #gpio-cells = <2>;
>>>>>                 #interrupt-cells = <2>;
>>>>>                 interrupt-controller;
>>>>>               };
>>>>>             };
>>>>>           };
>>>>>
>>>>> Code Flow:
>>>>> 1. "rpmsg-io" channel is announced from remote firmware with unique dst
>>>>>        ept = 0xd.
>>>>>
>>>>> 2. rpmsg_core.c creates the default dynamic local ept for the channel
>>>>>        ept = 0x405.
>>>>>
>>>>> 3. rpmsg_core.c assigns the allocated addr to rpdev device:
>>>>>        rpdev->src = 0x405 and rpdev->dst = 0xd.
>>>>>
>>>>> 4. rpmsg_gpio_channel_probe() is triggered. For *each* of the GPIO ports
>>>>>        in DT, it will trigger rpmsg_gpiochip_register() which will now:
>>>>>           a. Call port->ept = rpmsg_create_ept(rpdev,
>>>>>                                                                       rpmsg_gpio_channel_callback,
>>>>>                                                                       port,
>>>>>                                                                      {rpdev.id.name,
>>>>>                                                                       RPMSG_ADDR_ANY,
>>>>>                                                                       RPMSG_ADDR_ANY});
>>>>>               Ex- port->ept->addr = 0x408
>>>>>
>>>>>           b. Prepare a 8-byte message having 2 fields:
>>>>>               port->ept->addr (0x408) and port->idx (25)
>>>>>
>>>>>           c. Send this message to remote firmware on default channel ept
>>>>>               (0x405 -> 0xd) by:
>>>>>               rpmsg_send(rpdev->ept, &message, sizeof(message));
>>>>>
>>>>>           d. Remote side receives this message and creates a map of the
>>>>>               linux_ept_addr to gpio_port. (0x408 <-> 25)
>>>>>
>>>>> 5. After this point, any gpio messages sent from Linux from gpio port
>>>>>        endpoints (Ex- 0x408) can be decoded at remote side by looking up
>>>>>        its map (Ex- map[0x408] = 25).
>>>>>
>>>>> 6. Any messages sent from remote to Linux for a particular gpio port can
>>>>>        also be decoded at Linux by simply fetching the priv pointer to get
>>>>>        the per-port device:
>>>>>        struct rpmsg_gpio_port *port = priv;
>>>>>
>>>> Thanks for the details!
>>>>
>>>> To sum up:
>>>> - the default endpoint acts as the GPIO controller (0x405),
>>>> - one extra Linux endpoint is created per port defined in DT.
>>>>
>>>> This should work, but my concerns remain the same:
>>>>
>>>>     1) This implementation forces the remote processor to handle a single
>>>>        endpoint instead of one endpoint per port. This may add complexity to
>>>>        the remote firmware if each port is managed in a separate thread.
>>>
>>> A. Not really, I just chose 1 remote endpoint for this example as you
>>>       suggested to. We can scale it for two-way communication via the
>>>       get_config message like you suggested below.
>>>
>>> B. Isn't it a bad design of the firmware if it is handling 10 gpio ports
>>>       in 10 threads? The logic to handle all the ports is the same, only
>>>       the parameters (e.g. line number, msg) is different.
>>>
>>>>     2) Linux, as a consumer, should not expose its capabilities to the remote
>>>>        side (in your proposal it enumerates the ports defined in the DT).     In my view, the remote processor should expose its capabilities as the
>>>>        provider.
>>>
>>> Agreed on this.
>>>
>>>>   From my perspective, based on your proposal:
>>>>    1) Linux should send a get_config message to the remote proc (0x405 -> 0xD). 2) The remote processor would respond with the list of ports, associated
>>>>       with an remote endpoint addresses.
>>>
>>> Agreed, we can scale it for multiple remote endpoints like this.
>>>
>>>>    3) Linux would parse the response, compare it with the DT, enable the GPIO
>>>>       ports accordingly, creating it local endpoint and associating it with
>>>>       the remote endpoint.
>>>> Using name service to identify the ports should avoid step 1 & 2 ...
>>>
>>> Yes, but won't that make a lot of hard-codings in the driver?
>>>
>>> +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
>>> +    { .name = "rpmsg-io-25" },
>>> +    { .name = "rpmsg-io-32" },
>>> +    { .name = "rpmsg-io-35" },
>>> +    { },
>>> +};
>>>
>>> What if tomorrow another vendor decides to add more remoteproc
>>> controlled GPIO ports to Linux, they would have to update this struct in
>>> the driver everytime. And the port indexes (25/32/35) could also differ
>>> between vendors. We should make the driver dynamic i.e. vendor
>>> agnostic.
>>>
>>> I think querying the remote firmware at runtime (step 1 & 2 above) is a
>>> common design pattern and makes the driver vendor agnostic. But feel
>>> free to correct me.
>>>
>> You are right. My proposal would require a patch in rpmsg-core. The idea of
>> allowing a postfix in the compatible string has been discussed before, but,
>> if I remember correctly, it was not concluded.
>>
> I also remember discussing this.  I even reviewed one of Arnaud's patch
> and submitted one myself.  This must have been in 2020 and the reason why it
> wasn't merged has escaped my memory.
>   
>> /* rpmsg devices and drivers are matched using the service name */
>> static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
>> 				  const struct rpmsg_device_id *id)
>> {
>> 	size_t len;
>>
>> +	len = strnlen(id->name, RPMSG_NAME_SIZE);
>> +	if (len && id->name[len - 1] == '*')
>> +		return !strncmp(id->name, rpdev->id.name, len - 1);
>>
>> 	return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
>> }
>>
>> Then, in rpmsg-gpio, and possibly in other drivers such as rpmsg-tty and
>> a future rpmsg-i2c, we could use:
>> static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
>>      { .name = "rpmsg-io" },
>>      { .name = "rpmsg-io-*" },
>>      { },
>> };
> That was my initial approach.  We don't even need an additional "rpmsg-io-*" in
> rpmsg_gpio_channel_id_table[].  All we need is:
>
> /* rpmsg devices and drivers are matched using the service name */
> static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
>                                   const struct rpmsg_device_id *id)
> {
>   +     size_t len = strnlen(id->name, RPMSG_NAME_SIZE);
>
>   -     return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
>   +     return strncmp(id->name, rpdev->id.name, len) == 0;
> }


This wildcard channel matching is interesting. It would be good to know
the reasons/cons why this patch was not concluded.

>
> And let the rpmsg-virtio-gpio driver parse @rpdev->id.name to match with a
> GPIO controller in the DT.
>
>> If exact name matching is strongly required, then this proposal would not be
>> suitablea.
>>
>> A third option would be a combination of both approaches: instantiate the
>> device using the same name service from the remote side, as done in
>> rpmsg-tty. In that case, a get_config message, or a similar mechanism, would
>> also be needed to retrieve the port information from the remote side.
>>
> I'm not overly fond of a get_config message because it is one more thing we
> have to define and maintain.
>
> Arnaud: is there a get_config message already defined for rpmsg_tty?
>
> Beleswar: Can you provide a link to a virtio device that would use a get_config
> message?


VirtIO typically uses the feature bits for negotiation and discovery.
And such a get_config message would not be needed in VirtIO layer, as
there is no multiplexing. It's a 1:1 mapping of device to driver
instance.

Thanks,
Beleswar

[...]


