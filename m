Return-Path: <linux-gpio+bounces-37034-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDnUCArPCmru8QQAu9opvQ
	(envelope-from <linux-gpio+bounces-37034-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:34:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FE4568E20
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E5AF330AE552
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 08:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF513E9C39;
	Mon, 18 May 2026 08:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DK3MxUcD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495A73E9C24;
	Mon, 18 May 2026 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092683; cv=fail; b=gi4+ZTxo9zTOfZMpGVCKhQwrGsc1JSiX5DK1swugL+TS19Lr6dwlT+RWK/maYVIc8YjgDvb5AQdxFVfhH0Ldou1lDq8mAvb5xkmyMs4d6ONEyVV7m8iRl8dU0Qn2M94jiisVFz8FpwfoxSko9ySuHIu11F/bahybFE6VquqDH4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092683; c=relaxed/simple;
	bh=bMY+huNELjZ+jZW72mroC2jhM5CbxfprLODUcuDtjrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ii4QzoDlxOamMX582qJwW5M3Zj80NAJsf8ZlgDJHG/qyvOAVbHqLDDgR7x74BVbNGUFltsbWehPKZ+KoKZx436sS8adBAeoM84AD3rv5eDxtuOr+w8AVZhehL2DVrExOJ7bbKJ2lPeHplVevgXTIXgHwL5lr7bnrHLJa92NHVFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DK3MxUcD; arc=fail smtp.client-ip=52.101.53.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMiCa9pUDZE/zplmNIjkofkYjRWq4xkU+ooBVymhHrvjEHQRObCIEOZO3XGI7x9smA2GsyPCU4o5mU4Ou2oyEEO6+F71gDKbhm2PIE7L4QEaMlt2FyftQbWTJvWejARSFJymNTRDeHye+Gf2Ca85ZFEmiITpvJUNmAZtlkyWcKq0LTAsuGaZwb4NBK4foUFepi81ZzvJmzG38naNILKEkLcXqkcr7Aef0LO9aakLXIyQpGT7VkBP/GqM2pwUMjpWv+DQCMjBK0l16fvOmvOLjyafzbyQsLd+sig99OWBgRmVs0xlDGYKApOGkOYcNaqLNU0hrKcTy+4+7MEonI+biw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxfA7Q5Y7nD+gwUuDUFShjq3jiQelPWszk2doqWP0uE=;
 b=Ayg1liI2FGOXtwVlGNic4sa+2rhgIjVqPqnPk6blH2SJFSKf/rQ7oThZRwziFj+dDZr6O8aj/i/X64lhqdNRumbxTStU5s4F0j59L1FsTX8aYwZPrJ08NAQtpApstS0sTI7cTnpmOeceiorTz8fkZSyDv77IZmEy99tqdjGpbMw3rCB+tL+Z5ZGnNo80RyP5+YMkM6IAug750G7vt1Thbxu01huG7nAlbdEh+N0d8zmckjaeHCwvcOmILJ7DllkpKQ5W4AZ2azE8WmAeRXS5idy0o0bJ2QXrwyl9qKdedzc2X30az1BPraYvfJukczo0KR+TCa/M25d0EkIgVD+ihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxfA7Q5Y7nD+gwUuDUFShjq3jiQelPWszk2doqWP0uE=;
 b=DK3MxUcDHdwIPoZxrQHIvJt158ag6cUx45XHlHoTCBdyfPU1r998XNdlepF7DfZhfJsWUQydjX4wxpI2MiWtz9moVK8r7xgaxJzpoOQBIzRs2ah1IqVeaZkEHPJiV81/xsu9nxhs1JK7Br8AjNPblejzv5zq5rGE2s1A+t/TiNE=
Received: from BY5PR20CA0025.namprd20.prod.outlook.com (2603:10b6:a03:1f4::38)
 by IA4PR10MB8685.namprd10.prod.outlook.com (2603:10b6:208:566::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Mon, 18 May
 2026 08:24:38 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::ad) by BY5PR20CA0025.outlook.office365.com
 (2603:10b6:a03:1f4::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 08:24:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 08:24:38 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 03:24:37 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 03:24:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 18 May 2026 03:24:37 -0500
Received: from [10.249.32.6] ([10.249.32.6])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64I8Oaos1481366;
	Mon, 18 May 2026 03:24:36 -0500
Message-ID: <2e09535b-805a-41b8-90ce-a4306624d279@ti.com>
Date: Mon, 18 May 2026 13:54:36 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Lunn <andrew@lunn.ch>
CC: <tanmay.shah@amd.com>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Frank
 Li" <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
References: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com>
 <da3b79b7-9dad-48cb-b552-cf6df445899f@amd.com>
 <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com>
 <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
 <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
 <CANLsYkwBk0KbN-k9ce+5=oT+scdZ3nU5AOr3Fz4zT=0AFzghDA@mail.gmail.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <CANLsYkwBk0KbN-k9ce+5=oT+scdZ3nU5AOr3Fz4zT=0AFzghDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|IA4PR10MB8685:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f38c77e-bd0a-4306-9aae-08deb4b6e6cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|22082099003|18002099003|3023799003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	wBXI1WJRsU9LsOnjO1dLJ7YbLT6cDeA2h9rofWnCfAQZ3mIg7IaXX5CKNXiGbrc3HOEJ74w5R2/ha4pa+QhUv+uEWiscyr5Gj15yitxPDaMDngwXFe9gTmA3ddNc9QH/3KWJjrY41VPdlK8+bBmURW/UTxFLWsLLlfs3qynwFb2EBxlsg3kfxxYz3WwX6ztJ2Qm3ZongdMZslurrzzknFlUgxaTjg8mLBZ24u1WxiFnMhS0mT3Rnm5SehSqib3CvaNNrfijY7uhEkUFl+BBw74oDxRetCXQECYsF9Y/9mmro5wkYFsaB3vrHtmz/3zDS5/HwMF79UmMv1wHYG9LXEyu/2NYWumFij2Pe6ZIWioiiKjtL2vuMMxl3s99sHsOpH6hBp8JElRHuHo4K2cexj+27uD+4SoMWVQei85tWy0niCiWKp0qUkbK+oOhLA9ABTVcWHqMU9Yywslk9A4/grK2gN/bFY5enq7mhq7BaadTfpOdir2AdFtRQELnUvx1E2IM3epTwL8lfy/zMOOEMg/yPfEmvKCHFERDOYz3LrqMbUMQwJnVkVm09GSQ7K174lUmcZUfWD0kAupsHqMibz8LH1WaNUByxBVs5J1nuFFJ8UZZLVzmzb2xMVQCkgU0akeV7g9z8dw+g3wwGOiiO7BstlEDv1ZZyoo7w54DDP22IXi2YmYcGn/mlN4mRJVqn
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(3023799003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jf4ohXrAPs7qpDiZy4tK9VbeJ0UG1+nLqu8Brreiwm/QRPD7aTEnsHKZx//RxE5KYn9nQlvTgV6jwYxhWb+yt3svUwRk+U9xyjyZEoJOJe4EMLhfWapMxoKCZzsXBdCH+i3HQ/ZvOUMuOpPN9uKyJK7woCf/TzYS5+6yfKtCh7rC38rMuJ1kPkzII/XyGT+fuDRvRhqKpXx3C8zwQH4X7+0fulU08okixEDNdxaJOVCf4N9JnvRvUrHA2GVR4SplJevjn61o2IxXfPtNU8+l7awUa7cLk1Nc7qC3QTuXxmZKJfdVGSgSQEsBJM6c9kUq6yyDuACOOXr6/S81Mnz5douEfRMOSAMZJVI7Y8/C5eYo0zF0H8Q3Rb77yVmM8kbo2XyR6/EL53pX7oiNbqldI346NanLrS8qoGgl+9FJeN1lx4p5P0sOiaJCzOVG0UUX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 08:24:38.1101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f38c77e-bd0a-4306-9aae-08deb4b6e6cc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8685
X-Rspamd-Queue-Id: 07FE4568E20
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
	RCPT_COUNT_TWELVE(0.00)[27];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37034-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,foss.st.com,nxp.com,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-padhi@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action


On 5/12/2026 8:51 PM, Mathieu Poirier wrote:
> On Mon, 11 May 2026 at 12:18, Andrew Lunn <andrew@lunn.ch> wrote:
>>> Arnaud, Beleswar, Andrew and I are all advocating for one endpoint per
>>> GPIO controller.  The remaining issue it about the best way to work
>>> out source and destination addresses between Linux and the remote
>>> processor.  I'm running out of time for today but I'll return to this
>>> thread with a final analysis by the end of the week.
>> How many of the participants here will be in Minneapolis next week for
>> the Embedded Linux Conference? There is even a talk about this:
>>
>> https://osselcna2026.sched.com/event/2JQpx/building-virtual-drivers-with-rpmsg-key-design-principles-challenges-trade-offs-beleswar-prasad-padhi-texas-instruments?iframe=yes&w=100%&sidebar=yes&bg=no
>>
>> Maybe we can get together and decide on the final design after the
>> session.
>>
> I will not be in Minneapolis next week.  At this point I think things
> are converging into 2 main takeaways:
>
> 1) A serious refactoring of the protocol to include only what is
> available in the virtio-gpio specification [1].
> 2) The specification of GPIO controller number in an extension of the
> namespace announcement [2].


Fair enough. I am also aligned to use this solution with the support for
wildcard name service matching.

Thanks,
Beleswar

>
> Shenwei proposed embedding the GPIO controller number in the
> endpoint's source address [3], something I'm ambivalent about and
> still have to look into.  I also have to read Tanmay's latest
> comments.  I'm hoping to be done with all that by the end of the week.
> With the above (1) and (2), a new patchset will be required to reset
> this thread.
>
> Thanks,
> Mathieu
>
> [1]. https://lwn.net/ml/all/afjyH5JT0JS2j0L5@p14s/
> [2]. https://lwn.net/ml/all/afzIABSh1xtMEGbf%40p14s/
> [3]. https://lwn.net/ml/all/PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com/
>
>>          Andrew

