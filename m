Return-Path: <linux-gpio+bounces-35810-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOtOG7lU8mnGpgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35810-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 20:58:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1E1499646
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 20:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDFC53012CF8
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 18:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD7440FDA1;
	Wed, 29 Apr 2026 18:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PVSPZiZh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DBD2C158E;
	Wed, 29 Apr 2026 18:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489074; cv=fail; b=NPHvnjj3B/6nQji2tTNGbK7a/gO2r5uLZOq3jwMaaKYN3FUfuWjAvZUlw9WcoEMryKkyjIP7sg8mave6C8Him8ql0YvwpKnLQXVnCvgR8lbeBpkrqCif7QTSFJCTnq6PHLW7heL/TUMjEgehd8M2kbyaUYowRhyydh0z/C/9iUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489074; c=relaxed/simple;
	bh=/Rd8Ub/48dcjw9a+mFnFX7CTPHT/Eh7AOJqbps2+gR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HyjhAe3ttrvSb0pIk+OkHJnsXZVHymovZRS3PPe1QNW1pCmfyQ18JBcjI5TNzb2RVymsB2SPhhBZj2VxelqaLhZKAGlywfxK53lB5qOVGUE5rbqyEkJjpF2tiSop5ZnHk7s/uNgnXqucJpKiBlSsAEfhz3RNgciPyIyD+MOODvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PVSPZiZh; arc=fail smtp.client-ip=52.101.53.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMAOWyVWoQK+2j2kBkLoS3/q/SRia4OQL8JDjPp0jdkzJ2XVqSwPT4tECsiMeWtnmfCibFqYzLGfwLzM7yq0rplY37Enc0xjyiOsqRQRZwx6PYC9hCPcgmSsfEBc+c3pcTPOhR07g/0/zquTVKyd1qqbM2F5HNj1bpQe7RaR00szHD4jE5iqXLAmTsCKa4HlRdXMxlP6O/jY3Wnhk7NCSDOCTNMlej/XJBv2hXLQCLkVpw7WdywVLCpWmNVK1yob08Ec8dzHZu+Zwno6dHo4waaqmSPlosxKnvu1GoiWnJ0O9fKKMMSTwF0SWGpVwAtRUhn0O40odlpyUdL8SnqnPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOUzUUn6aa7PVGAG/xj/B8WgKa67BtR2hQ17tdFd9FQ=;
 b=DUXStbluNlDEQuMggyAMt29mGNFLe29QVtOvo+J+z5Ha8H2ToI+J30FSZV6n/kmN1GDmCb7EaptHwdHr757dP2FTQYTYgo4Ha1Euj2DV1QFUgwhisRbdu8iuCZELf6szG0YqwfXVl0sYjAD0obQJsozwa3NGRY6Ye+2ddWRRCSXYIeIQmEa+WgCNdjY+1VNt0P1f7og862nOwpopm4LfE7nCX2oJx5wZl7HEZ8N+aq5fVg+JwYKN6HUC1lQaYBiZAhjJugByoQEgeeW3UHL7EqUp+2S7uB9Gbv+0LET9zRb33cGD97O+P5G7nMPnAcfiD0ERJNIdvASdGZ4CAl+4Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOUzUUn6aa7PVGAG/xj/B8WgKa67BtR2hQ17tdFd9FQ=;
 b=PVSPZiZheKZFkvy3PSPFPR+Pg32ZZ8PVJ3Wi4Q3FV2J0GxCKh8EeQ/DzYejqaxId4OSU52XhaAyzSOFCTclXthhnE5MwdaLob+EFQ6XZSlDWh3NseExnAzeBsHopbS2C/D++Vpr/D9iAKASAYvlX3p0APAf8CfirT3cqhoZw4CY=
Received: from PH8P221CA0042.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::15)
 by IA1PR10MB6757.namprd10.prod.outlook.com (2603:10b6:208:42f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 18:57:50 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:510:346:cafe::3b) by PH8P221CA0042.outlook.office365.com
 (2603:10b6:510:346::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 18:57:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 18:57:49 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 13:57:48 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 13:57:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 13:57:48 -0500
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TIvdxG3923971;
	Wed, 29 Apr 2026 13:57:41 -0500
Message-ID: <e6d1c7a6-8951-43cc-a3f6-823727511333@ti.com>
Date: Thu, 30 Apr 2026 00:27:39 +0530
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
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <PAXPR04MB9185EB2DA65F8851CA16CE3489342@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <PAXPR04MB9185EB2DA65F8851CA16CE3489342@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|IA1PR10MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: db309a41-61b6-4f58-56cd-08dea6213557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YbGUr0S5J7tq5bM9FsH9nKOqvwxcDvbGJVKdfl2opisTQ87BpLsobCskyIPtO/YM8qMQdexhev8NiOAD3kcU7CfuQhcZ33pB5giuN1qO3NrlnN85I8NUKuqGiISi3Uzwioxi5S7DVSZ72zY5RdBB5VzZQCVulpsF/tbQUAIwThSamMWgySdMt/H9wUqBRs1N2HAD2mBoVXjvceKCUh7bZecdnm/ErGL58Ac8TpejmJy4ekzmDJPuC1TR9Q6rf+vPk5QfTQGz0UkRcowlmlUKgU3R5sfYkqB8k26y4FnpqtNF7pdsvel92JjZDodubP8Sgmuf+nSg+72+gW1GDrI5udJyuIrtxJHtUHC3l9s0gfkdT+ym1r1Ogb0xn4bL3R0nRoyBiSL0uG5pZIc9SFAAvQBASL/BB0c197DcGQvqgWcKvHwWz8E0hwjC2dR8TIcerwzDGB3AhPsuSe143CgVw2H01VC0j09zfG839LSc5p6sUmrEIB2yfV4bwzog6FGxOJhwQVo1oAphrUVKdHZJLZZdc4BqeHxFWn0ciDKaSVOOMbMy/ZJPpEVbrzJR4fhODb0qaGOGMyQoKNqrEjUNYkJGwjbo4IJ1iJP9rEljzwmQCI7RfXf7FbzyeFlVb8g7Uz/eclRlbjeZNljucF2YrBM61zbGlx9kwumqirZTQVI8X3Wr8K5wua4VA0QPiy/jRAQZr1eCIeFzlDdHLGMYwA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S2oJIDmNbNl2DkKv2HqY7cFwgNnxF0Ee36Gnqyrc3OA3TkfsSVEGFNZX3+9pOJW/OiWR7R4b6eeTZuzWCG80MSyycVOsYKQSAUlEQRxQiZ+uqVfMrJp6W9nA+7j0iQuyMnYF1mcls7b5ssNFjzhqSzsQtMAdT0j5dBF+F8HfpJgBHd7Ps5XFUoXXyQOjpSTcw4IPhPEr9kU82ugGUJmdcXsQrjSCmxvU6J1jkURBmVjF98zVFYNx7JQ6MRtxphCRV/mt4ulG0aukvg3THhOhRtVEUlV4wgsqZOf78zQpI5OKTTbWLXq/Q5HjVR1Vn2UaOyYsRBfh2QOw1lRt+b+bLzPrsh4D8EaC8eRxXwcLrwgiCyZb56QUXDRDQ2zuJWZQa1Lyj0g/rls6CyT2IFsqYX7a9s+ZICvRL4THc93vLj3hNeLwB7brBNJ6+7THJEU9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 18:57:49.1423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db309a41-61b6-4f58-56cd-08dea6213557
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6757
X-Rspamd-Queue-Id: 2B1E1499646
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35810-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-padhi@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]


On 4/30/2026 12:05 AM, Shenwei Wang wrote:
>
>> -----Original Message-----
>> From: Padhi, Beleswar <b-padhi@ti.com>
>> Sent: Wednesday, April 29, 2026 1:07 PM
>> To: Mathieu Poirier <mathieu.poirier@linaro.org>; Shenwei Wang
>> <shenwei.wang@nxp.com>
>> Cc: Andrew Lunn <andrew@lunn.ch>; Linus Walleij <linusw@kernel.org>; Bartosz
>> Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob Herring
>> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>> <conor+dt@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Frank Li
>> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
>> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
>> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
>> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
>> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
>> Golaszewski <brgl@bgdev.pl>
>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
>> Hi Mathieu,
>>
>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com>
>> wrote:
>>>>
>>>>> -----Original Message-----
>>>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>> Sent: Wednesday, April 29, 2026 10:42 AM
>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>;
>>>>> Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski
>>>>> <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob Herring
>>>>> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
>>>>> Dooley <conor+dt@kernel.org>; Bjorn Andersson
>>>>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
>>>>> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>;
>>>>> linux- gpio@vger.kernel.org; linux-doc@vger.kernel.org;
>>>>> linux-kernel@vger.kernel.org; Pengutronix Kernel Team
>>>>> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng
>>>>> Fan <peng.fan@nxp.com>; devicetree@vger.kernel.org;
>>>>> linux-remoteproc@vger.kernel.org; imx@lists.linux.dev;
>>>>> linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
>>>>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
>>>>> GPIO driver On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang
>> wrote:
>>>>>>> -----Original Message-----
>>>>>>> From: Andrew Lunn <andrew@lunn.ch>
>>>>>>> Sent: Monday, April 27, 2026 3:49 PM
>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
>>>>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
>>>>>>> Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
>>>>>>> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>>>>>>> <conor+dt@kernel.org>; Bjorn Andersson <andersson@kernel.org>;
>>>>>>> Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
>>>>>>> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah
>>>>>>> Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org;
>>>>>>> linux- doc@vger.kernel.org; linux-kernel@vger.kernel.org;
>>>>>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
>>>>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
>>>>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
>>>>>>> <brgl@bgdev.pl>
>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
>>>>>>> GPIO driver
>>>>>>>>> struct virtio_gpio_response {
>>>>>>>>>           __u8 status;
>>>>>>>>>           __u8 value;
>>>>>>>>> };
>>>>>>>> It is the same message format. Please see the message definition
>>>>>>> (GET_DIRECTION) below:
>>>>>>>
>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
>>>>>>>> +   | 1   | 2   |port |line | err | dir|
>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>> Sorry, but i don't see how two u8 vs six u8 are the same message format.
>>>>>>>
>>>>>> Some changes to the message format are necessary.
>>>>>>
>>>>>> Virtio uses two communication channels (virtqueues): one for
>>>>>> requests and
>>>>> replies, and a second one for events.
>>>>>> In contrast, rpmsg provides only a single communication channel, so
>>>>>> a type field is required to distinguish between different kinds of messages.
>>>>>>
>>>>>> Since rpmsg replies and events share the same message format, an
>>>>>> additional
>>>>> line is introduced to handle both cases.
>>>>>> Finally, rpmsg supports multiple GPIO controllers, so a port field
>>>>>> is added to
>>>>> uniquely identify the target controller.
>>>>>
>>>>> I have commented on this before - RPMSG is already providing
>>>>> multiplexing capability by way of endpoints.  There is no need for a
>>>>> port field.  One endpoint, one GPIO controller.
>>>>>
>>>> You still need a way to let the remote side know which port the
>>>> endpoint maps to, either by embedding the port information in the
>>>> message (the current way), or by sending it separately.
>>>>
>>> An endpoint is created with every namespace request.  There should be
>>> one namespace request for every GPIO controller, which yields a unique
>>> endpoint for each controller and eliminates the need for an extra
>>> field to identify them.
>>
>> Right, but this can still be done by just having one namespace request.
>> We can create new endpoints bound to an existing namespace/channel by
>> invoking rpmsg_create_ept(). This is what I suggested here too:
>> https://lore.kernel/
>> .org%2Fall%2F29485742-6e49-482e-b73d-
>> 228295daaeec%40ti.com%2F&data=05%7C02%7Cshenwei.wang%40nxp.com%7
>> Caba62d7a899849fd57f708dea61a1d8b%7C686ea1d3bc2b4c6fa92cd99c5c3016
>> 35%7C0%7C0%7C639130828278097401%7CUnknown%7CTWFpbGZsb3d8eyJFb
>> XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpb
>> CIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=NLLYQ0NZCnYKLT%2F2OMDZE
>> SKgC%2Fme3FoUNqqEGBOIY2k%3D&reserved=0
>>
>> My mental model looks like this for the complete picture:
>>
>> 1. namespace/channel#1 = rpmsg-io
>>      a. ept1 -> gpio-controller@1
>>      b. ept2 -> gpio-controller@2
>>
>> 2. namespace/channel#2 = rpmsg-i2c
>>      a. ept1 -> i2c@1
>>      b. ept2 -> i2c@2
>>      c. ept3 -> i2c@3
>>
> The GPIO nodes will act as providers.
> Mapping the port index into the service name is a possible solution,


I am not suggesting this. Infact the opposite. Let there be a single
rpmsg service "rpmsg-io" for gpio. And multiple endpoints within
the service, each for one controller. Once you have relayed this info
(dynamic ept addr corresponding to each port) back to the
firmware, you no longer need the "port" field in the message
anymore.

Did you get a chance to analyze this?:
https://lore.kernel.org/all/a067452a-9a8d-45ea-8bef-b44f851da7b2@ti.com/

Thanks,
Beleswar

>   but I don't believe it's better than
> embedding that information in the message. A stateless approach feels simpler and cleaner overall.
>
> Thanks,
> Shenwei
>
>
>> etc...
>>
>> This way device groups are isolated with each channel/namespace, and instances
>> within each device groups are also respected with specific endpoints.
>>
>> Thanks,
>> Beleswar

