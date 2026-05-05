Return-Path: <linux-gpio+bounces-36113-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKzALuyu+Wky+wIAu9opvQ
	(envelope-from <linux-gpio+bounces-36113-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 10:48:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1830D4C8DD4
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 10:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC1AE3056FE7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 08:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060803A6F05;
	Tue,  5 May 2026 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hewaSdMP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7A12773C3;
	Tue,  5 May 2026 08:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777970780; cv=fail; b=kRG34m0uRxYbzPWoEgUmG0wxcnBygVPgbPTy1FxGyetFtFd+irmSBnQ4kC1GRIYRKcHkJFqfGSojw5hUwDBYhlrVYoOUQcaFrDQ/nueKcj/Cjh5N0tbpSCbjk/sJEwipPFOK46aTuFvPEddwFYLBt62uoSIsS9asq46KlzsVfbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777970780; c=relaxed/simple;
	bh=Qh8tsWtYHAopmR85fg6TLMY9gqpHXYmXF9PsLiJuz3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B6seSa7M/1hWGqhJr9w2csHCZ93bvDsNezaCvj2gU1zNOTTCSf+6q6bunm6BpcJ7i3Yf5eDzxOmgKjXmu0ZDPn3RaQytkWdRPwaj0Nj8Kl9vgdtuvkpVH8ohgLVbnMO1byOrDUxwPuuxKB0zWhHf2KJQ2tr+sQoHRPJXeOC6NGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hewaSdMP; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJmXUhbGSxBCRdKvZWa7cxTNVES7NTvZCFHCpAV75X42hXc/DcqSepOaJdc0wWklIxPjyt/VzoiCJ3IS6NjLebSBAGj07TZ2qQbbXPkxLTrZOU1YIhKYxaQBOyykcHmHTHJG58j9SE0xv4ItKNl0cM47frvFZzg3uNyk9CQrYmHWs42tfGfVK5gN+3wY6uQJ/45iGkph6uENBvHgPNmDQI83Mm7rpmNBDEESw1do9q+HPlYUNAzUQV48AHGybJ+cLygiGQK3THyztkeO1uYojt9yYX2uwOPb/DHhu2Bds+djfu9vm2wsolhxRNtoT++5vmrJM4CNxxs18J7rOE7efw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4AjqPoJgFglgf1h+oBdg1z5GXN2QohC9Na6DU3ov0M=;
 b=CV0Ke53vrxZ2no15ggHcDIHrBlajAMizEy92X06n70MJdkqoC3guFCjn/jm/HA5MyhTBxTABb/Du+Jg7M/wnjjPJjdIdi3+G2i9GEsUKPbOkkwWYeJYOqX/X1i+sLstna24U3TPHE9kP5xiPW66VajNBxmCXC5cXkH2pdwyyKa4YXNERoT1o4lcsOrBC9L+MNnEQZ0hx1dPN82SQtLaAb9L7inHbODVBA4LY9E4eJ0MUxMx0SFPaZMkxcgGE2/yTaojYJczHuLkIp1YN/FRvRdaOMUU9gwcKHtJVzlYrUoOFVaPMibCBRFfMYM5Bc1jbChAASI5iIrHCrUlwpSdtyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=ti.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4AjqPoJgFglgf1h+oBdg1z5GXN2QohC9Na6DU3ov0M=;
 b=hewaSdMPQIrieewrm09cOzes0wJPBgVRqYCkYrHfVgtEG3uEutrkePdCt+2gO+IGsaA9EZQPWfkfjef22IFesYgMKhz0wdy7+2xua5Q14uSEej2knerCw51PRkBpDGP0zQViDDD0VvWoP1xXJuXnTQMeTiTGow8a19svZEyhLFSwrxJUUZAuPdzix5+4h5jtE37Db8lbMbOCb1gsbnL9bFuRMyes1wPYBgWRSine8NBQmNuQPR5Ou0Bb2jDyYG+5HgG3TN2c65wQf3tGXMoa7qYgYhRbfG1XD7SxYYA6WusZzbmQc/VnjySMWMTfrvsraxJxcuTtQcEU2GR6hPLkOQ==
Received: from DU2PR04CA0174.eurprd04.prod.outlook.com (2603:10a6:10:2b0::29)
 by AS2PR10MB7273.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:607::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:46:15 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::f6) by DU2PR04CA0174.outlook.office365.com
 (2603:10a6:10:2b0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 08:46:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 08:46:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 5 May
 2026 10:49:30 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 5 May
 2026 10:46:12 +0200
Message-ID: <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com>
Date: Tue, 5 May 2026 10:46:11 +0200
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
 <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
 <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|AS2PR10MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 5497c169-6dbd-4af4-87f8-08deaa82c41b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WSBbioC0ZQcApSDAB+icH+VDEDZR2u1+ovbDvMH5NVtKPC8jpTOBwAmYIZuHNV3WXxy/TNvPYzxtl3mP7SFQZonw1gZDp1tGeEk5Bdz9sn/MobR7xCQjS1jmxSlFy9fTFoMK3GjljFNQDiqbm/qezClIuTGv3dQXL5xyFWl7Y0B1dKDZ3rk1cJKQCQV9JYsjWRbriQjtyRjWK6IWcwniJDGZJEquUTgY7YlqRILhJkUaKKRl3QEHi9iVlPXItsXDMvWq0Cp5RBz1wN4S9SaUoLuwDSiHBAbgb+SsKPcplmCF9Yz8UteQS3DKI+VXT/gIC3IiXtadg7HCeeZETVo6XheBnvkKYkDJbV1rcejs1t6ltcWyMbANl/Obzl/5EjeXrR8q6JXePYIyaGkC1ZMd/aTNhlvDiQS9Bl+I6NRMB1PxgCl3MeYFv2fmqNZfju3GUaxgjvoWdnvyPpeNrkLoV8vgfhylkPDTY380hPHQQJZQvSqu+V8kLFwcUOLmZ4I3TpSDErro96iu0gd1648n+nyVLm9cecCVGUYR2cv8H/jBzgUe/Bg/wj7mEKqdIAmskmXCJraF9jklBr9w2poW8f3nrZibenCfGnyZUuyqAWKykg6EN8xezW8rl2vPF2kPObx/EyAB6XodAvD2CjESa1EHzKky685ataZmMQ0wMNKIsg1a2tVPEu2NA1GklcDRd5l+MNTNkaPsVpTzxIo+VOjKxO876DzKoyBvuqeYCzQ=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Lh8s8N77UKwxt2bcLTwTiLaVyd2Xy4UdkYLl0xqVBkrU5dCiFpcosa6CcduA+LftuEzW/c237Fs8Su90SfgzPBjMfo6UE5Q72UL0HozlkIGMssGVTjS0H4Nm48rtmh0+ove8U9VUwonHuGygsF/ZvambDYjFsvcH8YCttmgFDHDehU8rFtwXwSFyCQNoNK6t6lolHAVLArAWlTsARC5x6qP9D1VcK7KDpCGOFia1R4RoimZ61GCRo3ZzT/jG0rMmAMwCVsTM3BJGD3BzpD9s58zjeO0pGqpvJTTspEjm7O1nXefG+zOD6uTi61URqWxi1enceZsFg5vKzflMmxh9JVMp+xDYCixcCfC0oQzVyNinmorixzpdVd3Ed29Sg/bDZm9rZjiGAz4kChy3qODerl2rS9mEOoLIEN0G/iE6E4koQVg9vFuZtKxOpFoS3zgQ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:46:14.4643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5497c169-6dbd-4af4-87f8-08deaa82c41b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7273
X-Rspamd-Queue-Id: 1830D4C8DD4
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
	TAGGED_FROM(0.00)[bounces-36113-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.25:email,foss.st.com:dkim,foss.st.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.35:email,0.0.0.32:email];
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

Hi Beleswar

On 5/5/26 07:25, Beleswar Prasad Padhi wrote:
> Hi Arnaud,
> 
> On 04/05/26 22:34, Arnaud POULIQUEN wrote:
>> Hi Beleswar,
>>
>> On 5/4/26 10:17, Beleswar Prasad Padhi wrote:
>>
> 
> [...]
> 
>>>
>>>>
>>>> I may have misunderstood your solution. Could you please help me
>>>> understand your proposal by explaining how you would handle three
>>>> GPIO ports defined in the DT, considering that the endpoint
>>>> addresses on the Linux side can be random?
>>>> If I assume there is a unique endpoint on the remote side,
>>>> I do not understand how you can match, on the firmware side,
>>>> the Linux endpoint address to the GPIO port.
>>>
>>>
>>> Sure, let me take an example:
>>> Assumptions: 3 GPIO ports in DT, 3 endpoints in Linux (one per port),
>>> 1 endpoint in remote (0xd) and 1 rpmsg channel (rpmsg-io)
>>>
>>>          rpmsg {
>>>            rpmsg-io {
>>>              #address-cells = <1>;
>>>              #size-cells = <0>;
>>>
>>>              gpio@25 {
>>>                compatible = "rpmsg-gpio";
>>>                reg = <25>;
>>>                gpio-controller;
>>>                #gpio-cells = <2>;
>>>                #interrupt-cells = <2>;
>>>                interrupt-controller;
>>>              };
>>>
>>>              gpio@32 {
>>>                compatible = "rpmsg-gpio";
>>>                reg = <32>;
>>>                gpio-controller;
>>>                #gpio-cells = <2>;
>>>                #interrupt-cells = <2>;
>>>                interrupt-controller;
>>>              };
>>>
>>>              gpio@35 {
>>>                compatible = "rpmsg-gpio";
>>>                reg = <35>;
>>>                gpio-controller;
>>>                #gpio-cells = <2>;
>>>                #interrupt-cells = <2>;
>>>                interrupt-controller;
>>>              };
>>>            };
>>>          };
>>>
>>> Code Flow:
>>> 1. "rpmsg-io" channel is announced from remote firmware with unique dst
>>>       ept = 0xd.
>>>
>>> 2. rpmsg_core.c creates the default dynamic local ept for the channel
>>>       ept = 0x405.
>>>
>>> 3. rpmsg_core.c assigns the allocated addr to rpdev device:
>>>       rpdev->src = 0x405 and rpdev->dst = 0xd.
>>>
>>> 4. rpmsg_gpio_channel_probe() is triggered. For *each* of the GPIO ports
>>>       in DT, it will trigger rpmsg_gpiochip_register() which will now:
>>>          a. Call port->ept = rpmsg_create_ept(rpdev,
>>>                                                                      rpmsg_gpio_channel_callback,
>>>                                                                      port,
>>>                                                                     {rpdev.id.name,
>>>                                                                      RPMSG_ADDR_ANY,
>>>                                                                      RPMSG_ADDR_ANY});
>>>              Ex- port->ept->addr = 0x408
>>>
>>>          b. Prepare a 8-byte message having 2 fields:
>>>              port->ept->addr (0x408) and port->idx (25)
>>>
>>>          c. Send this message to remote firmware on default channel ept
>>>              (0x405 -> 0xd) by:
>>>              rpmsg_send(rpdev->ept, &message, sizeof(message));
>>>
>>>          d. Remote side receives this message and creates a map of the
>>>              linux_ept_addr to gpio_port. (0x408 <-> 25)
>>>
>>> 5. After this point, any gpio messages sent from Linux from gpio port
>>>       endpoints (Ex- 0x408) can be decoded at remote side by looking up
>>>       its map (Ex- map[0x408] = 25).
>>>
>>> 6. Any messages sent from remote to Linux for a particular gpio port can
>>>       also be decoded at Linux by simply fetching the priv pointer to get
>>>       the per-port device:
>>>       struct rpmsg_gpio_port *port = priv;
>>>
>>
>> Thanks for the details!
>>
>> To sum up:
>> - the default endpoint acts as the GPIO controller (0x405),
>> - one extra Linux endpoint is created per port defined in DT.
>>
>> This should work, but my concerns remain the same:
>>
>>    1) This implementation forces the remote processor to handle a single
>>       endpoint instead of one endpoint per port. This may add complexity to
>>       the remote firmware if each port is managed in a separate thread.
> 
> 
> A. Not really, I just chose 1 remote endpoint for this example as you
>      suggested to. We can scale it for two-way communication via the
>      get_config message like you suggested below.
> 
> B. Isn't it a bad design of the firmware if it is handling 10 gpio ports
>      in 10 threads? The logic to handle all the ports is the same, only
>      the parameters (e.g. line number, msg) is different.
> 
>>
>>    2) Linux, as a consumer, should not expose its capabilities to the remote
>>       side (in your proposal it enumerates the ports defined in the DT).     In my view, the remote processor should expose its capabilities as the
>>       provider.
> 
> 
> Agreed on this.
> 
>>
>>  From my perspective, based on your proposal:
>>   1) Linux should send a get_config message to the remote proc (0x405 -> 0xD). 2) The remote processor would respond with the list of ports, associated
>>      with an remote endpoint addresses.
> 
> 
> Agreed, we can scale it for multiple remote endpoints like this.
> 
>>   3) Linux would parse the response, compare it with the DT, enable the GPIO
>>      ports accordingly, creating it local endpoint and associating it with
>>      the remote endpoint.
>> Using name service to identify the ports should avoid step 1 & 2 ...
> 
> 
> Yes, but won't that make a lot of hard-codings in the driver?
> 
> +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> +    { .name = "rpmsg-io-25" },
> +    { .name = "rpmsg-io-32" },
> +    { .name = "rpmsg-io-35" },
> +    { },
> +};
> 
> What if tomorrow another vendor decides to add more remoteproc
> controlled GPIO ports to Linux, they would have to update this struct in
> the driver everytime. And the port indexes (25/32/35) could also differ
> between vendors. We should make the driver dynamic i.e. vendor
> agnostic.
> 
> I think querying the remote firmware at runtime (step 1 & 2 above) is a
> common design pattern and makes the driver vendor agnostic. But feel
> free to correct me.
> 

You are right. My proposal would require a patch in rpmsg-core. The idea of
allowing a postfix in the compatible string has been discussed before, but,
if I remember correctly, it was not concluded.

/* rpmsg devices and drivers are matched using the service name */
static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
				  const struct rpmsg_device_id *id)
{
	size_t len;

+	len = strnlen(id->name, RPMSG_NAME_SIZE);
+	if (len && id->name[len - 1] == '*')
+		return !strncmp(id->name, rpdev->id.name, len - 1);

	return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
}

Then, in rpmsg-gpio, and possibly in other drivers such as rpmsg-tty and
a future rpmsg-i2c, we could use:
static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
     { .name = "rpmsg-io" },
     { .name = "rpmsg-io-*" },
     { },
};

If exact name matching is strongly required, then this proposal would 
not be suitable.

A third option would be a combination of both approaches: instantiate 
the device using the same name service from the remote side, as done in 
rpmsg-tty. In that case, a get_config message, or a similar mechanism, 
would also be needed to retrieve the port information from the remote side.

Tanmaya also proposed another alternative based on reserved addresses.

At this point, I suggest letting Mathieu review the discussion and 
recommend the most suitable approach.

Thanks,
Arnaud

>>
>> At the end, whatever solution is implemented, my main concern is that the
>> Linux driver design should, if possible, avoid adding unnecessary complexity
>> or limitations on the remote side (for instance in openAMP project).
> 
> 
> Yes definitely, I want the same. Feel free to let me know if this does
> not suit with the OpenAMP project.
> 
> Thanks,
> Beleswar
> 
>>
>> Thanks,
>> Arnaud
>>
>>
>>> So Linux does not need to send the port idx everytime while sending a
>>> gpio message anymore.
>>>
>>> Thanks,
>>> Beleswar
>>>
>>> [...]
>>>
>>


