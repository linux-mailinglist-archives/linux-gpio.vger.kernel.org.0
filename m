Return-Path: <linux-gpio+bounces-35806-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHlGOTFG8mmApQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35806-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 19:56:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 784574985CD
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 19:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8629A30191A2
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 17:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793FD38C429;
	Wed, 29 Apr 2026 17:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VMWRuQQ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013060.outbound.protection.outlook.com [40.107.201.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCE13537F6;
	Wed, 29 Apr 2026 17:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777485352; cv=fail; b=JjmoodoxYLhASrJZDg6xXczmtKUyQgIG84NjgsdNnxls99aIZo2JFZWout9KDjoI+sFUyIGhyQrrw4dusoi7Z21UJCvzKnWV4kknkk/fV6GxpeR8Davw4V5hOp/1bhHDRf506nbEAaqjhViBvWipzbjTbweMVcS97KaFRV8/tPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777485352; c=relaxed/simple;
	bh=UAal3br6iaSoPrGLuNcWEGoENHu7XYsOqZh5uOg0toQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=skB8en8fhWeebBVCutMF6HptwQN+4V3jpHxf3EcD7B191jMPZ81k4drL7v8RJqdCFYn9H/yvVZVRAJuaYtqvI+YRR7EXVSTKSs3dOBQFmA+syGN+yRUae66wFlayDsGqH/qDINH9DfGsieilSX9mU3MpnHZg9ECCdNYWX7wm9XY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VMWRuQQ/; arc=fail smtp.client-ip=40.107.201.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmcrx2MH4SbBOXf7yEkGy0taqE/0XbFDHRMGoPfvtqB76h+8mCH7OxZQ2D7s6WYJALXk4GRPkrMPZ2c6IrDWaPdNrgihNxlmg2HUx8kPyxw4nPA/T+9Rg6iNXLjsmCLDXWZIXsmdpmXMsZ7laBpFjEGaES4ae+VRxykFQlfrlDbHrlVCn/IwTV7vJwo6Ln2bBJW8Kybds4CDQzavdiZSsmMjBiPLGclLyOMDHN5QIXIKcxf8jkfl5lm3HKpA2ndW5fPrBrtuHQIckJpwCqBREGZ/hHf43DbmnDhhdYxhHr7itZtksYTBsSvqIe7NmonUj8JncDgxHRdLjOUR51AnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlbbJbxPo0aP4GzXhNyzBQhXAGPrmjhEpkBfIaFaaFQ=;
 b=YUgLHPC9FnV79qLmZYi1xX/+6Z4SV8yyfKnfOHImVXLyBuuGSKY5tmylf2Wt136dcaQ8TJRwGT+xALhoQhPRfjVQkRXF489s1o8OYvYMmmUQM4c2q/QBvYrEmURHLBE08aOiJRxNQ6gV+Xs0aH3/Cdkx41I/ucNl85Z3OvH8iA2911hmSJ6QtzG9y9XSFJlsUIijHQRbQES1/nnFShmZy9X9rfGYPL0N6AzKtMKYWTH/50IOiTTDblTvmjKwrkcZI3hQzaCYaX85VbsyuYlh/aZMFPiZ3iTP3AxMNRG/Luw3b1i+YZzLOlBFu7tU4Eg3vOm6bPlFh8pIecpu3tXyTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlbbJbxPo0aP4GzXhNyzBQhXAGPrmjhEpkBfIaFaaFQ=;
 b=VMWRuQQ/qAKtCHZPysrxDcc0Qi2KZAEI62YXsQoiKPlhaBCoTmxAN1S4CREGe+wk4N4ZtIr/ajnR5Lnu0clAC14UBi4Nt8cxnSAkpVWxP7xo/wL+rW+ps2mVVM59QJ/pPcn2zTmmg/3jA8xNDQkDcn3hv/mlxRA6HViqHQPqPag=
Received: from BN1PR14CA0027.namprd14.prod.outlook.com (2603:10b6:408:e3::32)
 by PH0PR10MB7100.namprd10.prod.outlook.com (2603:10b6:510:28b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 17:55:47 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:e3:cafe::8b) by BN1PR14CA0027.outlook.office365.com
 (2603:10b6:408:e3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.29 via Frontend Transport; Wed,
 29 Apr 2026 17:55:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 17:55:42 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 12:55:42 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 12:55:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 12:55:41 -0500
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63THtX1b3830916;
	Wed, 29 Apr 2026 12:55:34 -0500
Message-ID: <b80e17fb-7986-4a95-a845-48a7d318ff33@ti.com>
Date: Wed, 29 Apr 2026 23:25:33 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
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
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|PH0PR10MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae93de2-0712-48c3-4e45-08dea6188835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6r1FzQhZ19nRjc9AYdMmQVftwIcCeots8hfFPccgbYA0cyd2d+jJNs3WuNokOg4CvkCePht5nneCj6PdG9tlsCCnCGIvqfxouluZZ/RwEHT5X7W5pjywMXD5F12Rwt90OkfgvNomvY0mR293eVef8HgBFn35w1609Nk3S2QjgBzBgRcJNsgtC3Yh1SmbJ1c5DPtgADBQPh9gNxojT7+XCmMQxGdY8pEhAsGDjdcf9AbgYQHJBd7gJfZBduavvEV1Ky188xK86683A9RC7lpVoKLo1zChiadYXrx0FRqaDhptCeK+TGwOQo8sKGSG8eI7vesBS01d4eJiA5tCOaoGq5MuFQIFYRdh1qov8JJXH3AtUtQkBUdi0Kqe2oiZNh2L2Uk/qE0iKqeY7ZqItrvcuIc9Vtbte05NE/J7ZdXq7UVqCQZ95sm8WLbabst0/k8kd6VTKsIlSORFbsmyWW2uTc7JRfENDF4PhcwwwV/wVVKvlzkvxoyrzjQWb5uL3bcKM+pDOAxJDlDlV+EAkRb9jJUEKlc92LdJV/7N+lHj5vioTnpVlib5JxhpsDjtgCph9aH/AnZTnUySlITpEMwYstezShxapzbEsGdHxrFQXv74OL6h2gRPHUeNUFU+MWxVVDatXcc04lVyXdXD3QkvZxO8niV/vP6ruHP5zV4IvzJnVK6pRRSCeO7QnWK+zzNPS932zJoL8ID3DY7Z5mXoRzB4KhkYUvSRicJM8KiPnqJJq5AZbOLgd7nmVCxdCT1jO5BUWAoVionsUcRW/8HZaQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7mMXbnVGA7ZBkonRmZbN9fU/IZXEGw0J2rWOhI1D132FODXcgH1b/eJszh8ZtMbhIXtcg1B6DcOwIgh6g+M8u3NkztZm7laYOMge+4itlq+f2CRGP8CBwDHzp9g37uDK8GNByK5fAn11Z8a6DZwzzWMSRzYj7qoxFONCBoWkxlcYan2Vyb2IRF3Jd83247FptkJXXefLGE+DJRD33BU6uK38jBfs8kpiJwNgoPq7JUg+CJSlM0CRw/PnIRAbPStIYKW/spk9FK8jlpQJD9OEn11Q3YG+AYtCOoDtlQdAfJ6fEgRB+vrTiHG2L/XONNn/MTM0+uheeC6pnb4MvbDMBS6AUW368MbQoR9F7L0YmIbZPQa/9i9UqR2gzoeYjjg+tCB7654sJ8uv+0atZw+MNR2DZcTTkxNAh80kQwFRxIFDbS5WIpIp+pEi/DA+FO/W
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:55:42.6615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae93de2-0712-48c3-4e45-08dea6188835
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7100
X-Rspamd-Queue-Id: 784574985CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35806-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-padhi@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]


On 4/29/2026 10:23 PM, Shenwei Wang wrote:
>
>> -----Original Message-----
>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Sent: Wednesday, April 29, 2026 10:42 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>
>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
>> Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
>> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
>>>
>>>> -----Original Message-----
>>>> From: Andrew Lunn <andrew@lunn.ch>
>>>> Sent: Monday, April 27, 2026 3:49 PM
>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
>>>> <brgl@bgdev.pl>
>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
>>>> GPIO driver
>>>>>> struct virtio_gpio_response {
>>>>>>          __u8 status;
>>>>>>          __u8 value;
>>>>>> };
>>>>> It is the same message format. Please see the message definition
>>>> (GET_DIRECTION) below:
>>>>
>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
>>>>> +   | 1   | 2   |port |line | err | dir|
>>>>> +   +-----+-----+-----+-----+-----+----+
>>>> Sorry, but i don't see how two u8 vs six u8 are the same message format.
>>>>
>>> Some changes to the message format are necessary.
>>>
>>> Virtio uses two communication channels (virtqueues): one for requests and
>> replies, and a second one for events.
>>> In contrast, rpmsg provides only a single communication channel, so a
>>> type field is required to distinguish between different kinds of messages.
>>>
>>> Since rpmsg replies and events share the same message format, an additional
>> line is introduced to handle both cases.
>>> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
>> uniquely identify the target controller.
>>
>> I have commented on this before - RPMSG is already providing multiplexing
>> capability by way of endpoints.  There is no need for a port field.  One endpoint,
>> one GPIO controller.
>>
> You still need a way to let the remote side know which port the endpoint maps to,


About this, we only need to do this because you are defining the gpio
controller instances "statically" in the device tree. I understand gpio
nodes can act as providers, but I do not see any device referencing the
gpio nodes you are defining in the device tree. If that is the case, you
can completely remove the nodes from device tree, and "dynamically"
announce the existence of these nodes from the firmware itself
(similar to what is done for rpmsg-tty currently). In response to that
announce message, Linux could send the "ept" it allocated for the
controller. That way, Linux only cares about "ept" and there is no need
to maintain port 'idx' info anywhere in the Linux side anymore.

Thanks,
Beleswar


