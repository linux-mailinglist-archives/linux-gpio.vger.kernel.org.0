Return-Path: <linux-gpio+bounces-36188-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCcjLy3X+WmbEgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36188-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 13:40:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF9B4CCCFD
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 13:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1770B30CD4CC
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 11:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C71386C37;
	Tue,  5 May 2026 11:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GZ0cKlKh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011049.outbound.protection.outlook.com [52.101.52.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7CE386C0C;
	Tue,  5 May 2026 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979776; cv=fail; b=THkpzMya3ERnUjnxqdaaXRLB6Tc41LmictvqBHI5geN1hpATzKEV8DjwRhd85zw00Afq6pK1nyfRboXtbXLaBP9Ol+vbNAeCsqRfxlvaSgHauJ71W23Sm4sBKhYhwS1E1xB6Tpt4axac/DgPnOdiCjeJaTlUvBuOLtp5g+dS8qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979776; c=relaxed/simple;
	bh=3VlCcdz188HbGyZLE4tcAK4aY/Yb3G5X9xtwdN0/KYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IRLxWFNQsHO+U+EfiBm3iq+DpX/sBtOWHcC/qCAUQyADlax0hk9aZMMal1WDfHDzNGBUfm2483rBVqYyX1P3zdQHyLi48MvXXLdRWWxJMki5CXX9oBlYs5IdNnv96JaTuNcaV1xLz+UZlydbHj5Ou2zkwFud/Skf2SLNKpiUqgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GZ0cKlKh; arc=fail smtp.client-ip=52.101.52.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJ4/np7Epc5EpFG6D9s9Z/4VoBPQIAiEzPLmFKUcm3jP+78TPe2/g4cVqxj06/+MNtaNAUI+zbxgY55RVepCgk5G92XRe/814v02aBp1YoM+8ovszlb4RdFhLQj6lr6HlVRa9o1hWwIudpnS3luHxBCHWmRSzwtirr98oF60Ut+JqzOio2P0rGapPAruv7lfpe2t0KmD1I/FDVPKT6anPMGHTx7+oAseog+eTOyqy8na3kTRunnvnptVQzxXxofvGQ75dz3KU8n+namsyGykkAvdU+KCEpm5cD283m/v7JSJS4MtPXNzeFeINBoXogt8iOhugIPYZX089pn3P9YBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkD4CjKbwfoevPYgEG06lMDVIBGtd+CjfaWwqZPu7Lw=;
 b=EtAPLjpyWfRZXAuOPorxMtY1TL5hZ20p8ZzDPwNKR5EdbJKykoNOlGPOSrYystcVRQ3AFsN5J4Ga0xfjELeQEo78lqjLuPj1xL1EqrU2wUh12KQc9tet8fLcKHz5fshV+odJiFalR9ZUEfAlcSRvSx0qw7XsdXSzs+fkBVJseS2XinKQH2/ntdBPU1QsmS7KuPFodm96eu5aNSBJj/SnJ65xKNksEJ0f2rmO5RQe9Y7nPAMjgTh+oevPU2NZ5yBWQ+vJ5h1CakYP2NlvuG0m+9VZoS7fKicL8M8RI3J1VatfJcvfpmyOqlD0bTeZV2jOoVKQmdKJS8JIg/9xoqSbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkD4CjKbwfoevPYgEG06lMDVIBGtd+CjfaWwqZPu7Lw=;
 b=GZ0cKlKhnGlw3H1B3cJjuhqYdNR13gShVbJPuSinIORPUVSNX341nzCwz+mxJxIoJfMQ2ftD0TN3F11HSqEF0SDlo+/uTM+0aIyS3SSftxfoGKES/lVxKF9DX+fdq50uy2UwDQ4UkVGhcUx/zQM1mBlymVfXEDmq4Vdu84XtWuc=
Received: from BY3PR05CA0015.namprd05.prod.outlook.com (2603:10b6:a03:254::20)
 by IA1PR10MB5946.namprd10.prod.outlook.com (2603:10b6:208:3d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:16:10 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::4e) by BY3PR05CA0015.outlook.office365.com
 (2603:10b6:a03:254::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 11:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:16:09 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:16:09 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:16:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:16:08 -0500
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645BG1Hh2848461;
	Tue, 5 May 2026 06:16:02 -0500
Message-ID: <4b622824-0073-4c6a-8525-248bd484c3f0@ti.com>
Date: Tue, 5 May 2026 16:46:01 +0530
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
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|IA1PR10MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb9aef2-adfe-4a06-d04c-08deaa97b5bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	LrctGDzIcBcWZbZRBGeFB+DTzqV+3j3oSdO5l9oRHWRK8DSMgsz9XbzA7deg4WhwJf6TCtQBC6VKjdWUar4lh1/Y9Wm0Fn0zC8D932diHln4XovlRYWZ0lzUmk2oxaIrQa1WWlzyudhvfhhb+OYwKDJEpxiVWlqSClq1ogAcLJHfnoc+G2E8wNmFuHZU8UVxwIuAdsgwnkxJR2mATyQHsdqb1ouz/zY4wQUB5ZaX9vBg9syfX2psjWqfbKY+zUwelr7NN9ROyJD//AsDZjyueThoXU7OQVuYthypuUObXtPkoThmkMnoZev3EFP2sDXHBq692vC5GT7XrPKlQab5cGlo2xJ2YfaxAwfoHsI8nmjwh2MHfsSu/dJXeSawh6iqdas3jrQfCxv0hc+EexNonEJFluVA04q1V5FUeuIwWFn1pVloqcwEJg/udIQmPEipB+5kLZVcx8Rr7gE7ZF93mYGwVbOBzXoLXPNdlNOtvFhM5DeqadclOK5G8FKK0J5jjALxxP1PFopzsqKPeMGcTHJL1zWkkRRfFTMfPKTUGBIH6STgqJXMU2B7M7waF0ZqCiC7AACMnqdI2THHz7VhMvDfEkvZfGRMKPDPgchbSrxXNhU29eJ9Ylt/iWaBTVZBg8qdJhg3c4JESeoZZj0WqpOALyi/OjkwcM8YT4O5KZNFCTCviWDiSXltGE3bXS+E6VYG+OkZ6KLxO7kM1j7jtSd1M5dOYBGEb6/qNz1es38=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iNG7xe5g2h5EwoWvWUwHymewJHqcW6k3S7h9ASSqcDc5cWLI2paWDgx5leNI9a39vMIEIxWGtwfx3ljtodgQ8N0UxKzirdSDgykr7VugWcT/+zRZ5sn7ee+OS0y6P/mnRh2nEFM1ViKnWIwlx88NqZ56Qvv2z83G1tfZi14gOSqhBY7f5id1TDLMXNR99o4EeX3L7O4aja3e1lZh6lQlPc9jtmMctGteMg13a1gbUcS3GaXm9z+8OjcEcunCwZk0zmyN+X/QMAwxGHLzx+x9duwQ8eS2kJSms+8JKFmSH/oTGs00yd5MfwJ6MFFk2gxANyt25ZcNNTKxNkaKunD5AmKxZRNKlMir5t7foJOZWwnmlh6WttYSaTEqkFyfJNze9POIhZAVmfWKDtP2ksoM/CzbnkJnhyN2rkV7iv87e+J6eoqlfjUBJmKqQo8xehxw
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:16:09.7748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb9aef2-adfe-4a06-d04c-08deaa97b5bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5946
X-Rspamd-Queue-Id: 1CF9B4CCCFD
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36188-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-padhi@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]

Hi Tanmay,

On 05/05/26 00:49, Shah, Tanmay wrote:
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
>> On 4/30/26 14:56, Beleswar Prasad Padhi wrote:
>>> Hello Arnaud,
>>>
>>> On 30/04/26 13:05, Arnaud POULIQUEN wrote:
>>>> Hello,
>>>>
>>>> On 4/29/26 21:20, Mathieu Poirier wrote:
>>>>> On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>>>>>> Hi Mathieu,
>>>>>>
>>>>>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
>>>>>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>> wrote:
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
>>>>>>>>>>>>>            __u8 status;
>>>>>>>>>>>>>            __u8 value;
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
>>>>>> Right, but this can still be done by just having one namespace
>>>>>> request.
>>>>>> We can create new endpoints bound to an existing namespace/channel by
>>>>>> invoking rpmsg_create_ept(). This is what I suggested here too:
>>>>>> https://lore.kernel.org/all/29485742-6e49-482e-
>>>>>> b73d-228295daaeec@ti.com/
>>>>>>
>>>>> I will look at your suggestion (i.e link above) later this week or
>>>>> next week.
>>>>>
>>>>>> My mental model looks like this for the complete picture:
>>>>>>
>>>>>> 1. namespace/channel#1 = rpmsg-io
>>>>>>       a. ept1 -> gpio-controller@1
>>>>>>       b. ept2 -> gpio-controller@2
>>>>>>
> If my understanding of what gpio-controller is right, than this won't
> work. We need one rpmsg channel per gpio-controller, and in most cases
> there will be only one GPIO-controller on the remote side.


Why so? In the current v13 version, the remote side already
handles 2 GPIO controllers.

>  If there are
> multiple or multiple instances of same controller, than we need separate
> channel name for that controller just like we would have separate device
> on the Linux.


Why so? I think there is some confusion in the terminology:

GPIO controller = GPIO port (gpio@xyz) defined in the
Device tree = struct rpmsg_gpio_port in code

GPIO line = Individual lines within each GPIO port (max =
GPIOS_PER_PORT_DEFAULT) = struct rpmsg_gpio_line in code

>
>>>>> I've asked for one endpoint per GPIO controller since the very
>>>>> beginning.  I don't yet have a strong opinion on whether to use one
>>>>> namespace request per GPIO controller or a single request that spins
>>>>> off multiple endpoints.  I'll have to look at your link and reflect on
>>>>> that.  Regardless of how we proceed on that front, multiplexing needs
>>>>> to happen at the endpoint level rather than the packet level.  This is
>>>>> the only way this work can move forward.
>>>>>
>>>> I would be more in favor of Mathieu’s proposal: “An endpoint is
>>>> created with every namespace request.”
>>>>
>>>> If the endpoint is created only on the Linux side, how do we match
>>>> the Linux endpoint address with the local port field on the remote side?
>>>
>>> Simply by sending a message to the remote containing the newly created
>>> endpoint and the port idx. Note that is this done just one time, after
>>> this
>>> Linux need not have the port field in the message everytime its sending
>>> a message.
>>>
>>>> With a multi-namespace approach, the namespace could be rpmsg-io-
>>>> [addr], where [addr] corresponds to the GPIO controller address in
>>>> the DT. This would:
>>>
>>> You will face the same problem in this case also that you asked above:
>>> "how do we match the Linux endpoint address with the local port field
>>> on the remote side?"
>> Sorry I probably introduced confusion here
>> my sentence should be;
>>  With a multi-namespace approach, the namespace could be rpmsg-io-[port],
>>  where [port] corresponds to the GPIO controller port in the DT.
>>
>>
>> For instance:
>>
>>       rpmsg {
>>         rpmsg-io {
>>           #address-cells = <1>;
>>           #size-cells = <0>;
>>
>>           gpio@25 {
>>             compatible = "rpmsg-gpio";
>>             reg = <25>;
>>             gpio-controller;
>>             #gpio-cells = <2>;
>>             #interrupt-cells = <2>;
>>             interrupt-controller;
>>           };
>>
>>           gpio@32 {
>>             compatible = "rpmsg-gpio";
>>             reg = <32>;
>>             gpio-controller;
>>             #gpio-cells = <2>;
>>             #interrupt-cells = <2>;
>>             interrupt-controller;
>>           };
>>         };
>>       };
>>
>>  rpmsg-io-25  would match with gpio@25
>>  rpmsg-io-32  would match with gpio@32
>>
> The problem with this approach is, we will endup creating way too many
> RPMsg devices/channels. i.e. one channel per one GPIO. That limits how
> many GPIOs can be handled by remote from memory perspective. At
> somepoint we might just run-out of number ept & channels created by the
> remote. As of now, open-amp library supports 128 epts I think.


Arnaud was suggesting one channel per gpio controller,
not per line. We will not have 128 gpio controllers....

>
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
>> That why I would like to suggest to use the name service field to
>> identify the port/controller, instead of the endpoint address.
>>>  
>>>> - match the RPMsg probe with the DT,
>>>
>>> We can probe from all controllers with a single name service
>>> announcement too.
>>>
>>>> - provide a simple mapping between the port and the endpoint on both
>>>> sides,
>>>
>>> We are trying to get rid of this mapping from Linux side to adapt
>>> the gpio-virtio design.
>>>
>>>> - allow multiple endpoints on the remote side,
>>>
>>> We can support this as well with single nameservice model.
>>> There is no limitation. Remote has to send a message with
>>> its newly created ept that's all.
>>>
>>>> - provide a simple discovery mechanism for remote capabilities.
>>>
>>> A single announcement: "rpmsg-io" is also discovery mechanism.
>>>
>>> Feel free to let me know if you have concerns with any of the
>>> suggestions!
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
>>> Thanks,
>>> Beleswar
>>>
>>>> Regards,
>>>> Arnaud
>>>>
>>>>>> 2. namespace/channel#2 = rpmsg-i2c
>>>>>>       a. ept1 -> i2c@1
>>>>>>       b. ept2 -> i2c@2
>>>>>>       c. ept3 -> i2c@3
>>>>>>
>>>>>> etc...
>>>>>>
> Just want to clear-up few terms before I jump to the solution:
>
> **RPMsg channel/device**:
>   - These are devices announced by the remote processor, and created by
> linux. They are created at: /sys/bus/rpmsg/devices
>   - The channel format: <name>.<src ept>.<dst ept>
>
> **RPMsg endpoint**:
>   - Endpoint is differnt than channel. Single channel can have multiple
> endpoints, and represented in the linux with: /dev/rpmsg? devices.
>
> To create endpoint device, we have rpmsg_create_ept API, which takes
> channel information as input, which has src-ept, dst-ept.
>
> Following is proposed solution:
>
> 1) Assign RPMsg channel/device per rpmsg-gpio controller (Not per GPIO
> pin/port).


One channel per pin was not suggested earlier...

>   - In our case that would be, single rpmsg-io node. (That makes me
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
>                                                   |
> /dev/rpmsg1 - GPIO26 ept (rpmsg-gpio.0x41a.0x400)-|-> rpmsg-gpio.*.0x400
>                                                   |
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
> I am missing something.


These are separate GPIO controllers, not separate pins within
the same GPIO controller. Could you revisit your solution with
this update.

Thanks for your time,
Beleswar


