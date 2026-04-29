Return-Path: <linux-gpio+bounces-35807-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCiKLRRJ8mm1pQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35807-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 20:08:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA8498A7C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 20:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F85430B473D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 18:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5440D41B379;
	Wed, 29 Apr 2026 18:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TvD+XHvu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011002.outbound.protection.outlook.com [40.107.208.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB8E32720D;
	Wed, 29 Apr 2026 18:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486028; cv=fail; b=AXZ3BsgD2POmNG9NCJZQuNRoLx0Nf2mW1ayL1xeL90iBi6qJ4PStCoMuPGLJfgc5NwCIA1E4l6cMWbEv8sKfrGnzNI84EjHa2pjaKZu2bov2+5LU2ZOyk79H9kHoI4hgaTxj9fYAgEL1zyMqGCc0JSq9vzXZHlYc4AiUxD0JJ08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486028; c=relaxed/simple;
	bh=RtUpQzieWNZDjahnSfUJmW3LfpH0MYEP8PaljAn04d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HQNVtOCaGIh4s+rCQEcrhRPSa7D3OVCWQoBRL4kvZKS8gAWatpZztnEWrmVC487TN6uRHtPII3rXU840eguDSs9eBqxEHhnoyjNVeDgQuRM4IptrIpveEHml9A7euXm9G/qrXBrOJR6+JOQrKxtJFLipDzrbwsfFfDt/tRgR6MU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TvD+XHvu; arc=fail smtp.client-ip=40.107.208.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4m0H2s98nrwLuCU+xcWjkFHubTzwYN+dcAldjszBwKYdx9Mc0IZuZb1CsS/qUUOaQXS43LE8QfsbIBizUjiYnBojTIcdviKG+o4Vy0kcdVWOi+xt/9aSQkP2hTAgFlE6gRgYF8xA1fmjlHWhZidSNWO8zBDqTJ/qkBrPvW9RcbA3rvYT1cHTxc+hj1p9bWdVrgFT92xOhiAVUzBblGXgkBfRgbXIdrBkFtceO1YZo+8xq84BEqKl4aOe0oNqoyHU0dAoF14RI5ENuGaFliej3LgKV2LHjrjf/T5t4wDzf19kpZgl+lVCGnNtwaIKIH+8CbJfAKRvH566mQsu3BPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPtIV6TgtSFxxV4HSDgk0JPSLnDApXS3RQvj3MVZQa4=;
 b=q6wAsNFlJkj/qWpguNRcDrMHjx91hftX5/GZEW7X505Kqa3nCeysCBY757IhNk4Zl9APp8qL/z3DqYDd3lPgFzhRS1cQAneNc1cxYKkctl/HBfySsxcFvwDHuWYGsKPRtNGcg7B+onh965lIKf2ax4o5Zw3wpcf4fBvu7kHzYygVchMtsE+g9jW3BoSMGA0alVY8RXVcOelQ/myIoSHPP+PtEpUl6wktxzCu5d80I+tfPaNymHEwdrD23Ud1Q3SxBf3pkwJDAEPELVQIkdhAWmIrwpK81MiAs84C2k6NTN8o7hvZLlDq/ZGITIZb5tR5c9HTYuyhttVF6cXsGERGOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPtIV6TgtSFxxV4HSDgk0JPSLnDApXS3RQvj3MVZQa4=;
 b=TvD+XHvuguGBipZMUc5i+qdlZhL8jeIbeSQO6AuE283dy+tx/5coENeh2vtJmjMFdGSvHDuj1zHqICi/usfT1ysFu1yM+hRNruRWD1DFIKEHwmNlNQww5el/OGRYp34f0wT21a9us35LyFE0sihH1/mFpxDNfq9pHGRP2JScSXg=
Received: from MN0P223CA0025.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::20)
 by IA3PR10MB8466.namprd10.prod.outlook.com (2603:10b6:208:57f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 18:06:56 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:52b:cafe::5) by MN0P223CA0025.outlook.office365.com
 (2603:10b6:208:52b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 18:06:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 18:06:55 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 13:06:55 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 13:06:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 13:06:54 -0500
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TI6kJp3618387;
	Wed, 29 Apr 2026 13:06:47 -0500
Message-ID: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
Date: Wed, 29 Apr 2026 23:36:46 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Shenwei Wang
	<shenwei.wang@nxp.com>
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
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|IA3PR10MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: c4da7dc1-bc50-4a7f-ac85-08dea61a1956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	sTpG513mmtPV2eCja4+6tGGt9jxjB4K6EKDWhjfSCMNupTi4MD1jOApJM1qseaQX1HmX3NyF1Qn8KP59dtcmdrTx5dXgjK91y1gxfeVEpLbNFwf+4eXYuqubm9D/fH2Sj0J8QU461g41/W2kpinqlVKgsvgzmRPBMci5t9yJ9VUudSpenQ0u8o5PAirKB+1fSTZACdeQnSi06IpujBfo6cM0LfvCsz7NH/OJZwDwwlQnJXvcPOgsjvWeQUKdoVJKDfPWSMHsvT8HtNoAk885vvRD71awhlwUW4o6CkOnPgn27x1RosiT6ZPaNCwchmiMzzCT5l2JL03jN0ntKwZIdL27G8xMsZlVBCimtyDT3oog6ssdB5udhE3gmC9zoAiD97tBSeekF+WLn3XjAMYoIaSO2LoRu2PFf3loIHit22SEdjX/2RAY4sni7vbstJjmb8x+YfpmQXC0S9nwS/EpQdbjEtcX1cFu3k+7k0Y0BEyiQtWr5cOboQ6FldT8Osub+uoeI1kzAuYNyOsZytd4H4n8e8dgLBvIpC3A4jBAIWOnWM/KMZmuB6snD1v+EdhnzXCL5yis3mUqDWAGHnv+ampYmYzrdKUwIK67dvzwU/OKd30GRzT1kB6Gz8DmrTTZL4f29q27HOI/cVwl+xuykWEih1VqhboOEqLtpbKNBHXSxbGpf6qir/VUeJcpDJY2u9yftufWvEC/wV2ULU2lLG/URtjCcmuvU4lOQC0LJtM=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eoKduC0g6WVivvCMX7goe+F9AbU7tW8BBx+0JV8d9aNAcOguRAIcZPEExmOuaLGdd+YZBbFr0EtJA19gLW5/HsT8c1qThzICLSGls2+JVYdmlO2lby7oGpWmf6NMQqRH1UYw5ZUbN4sPV7aaCtUEFXFYRqO/8cCtVjnuXN4WsJSeECJz8VceZf9Uve9Lf9TQuapPfombAXXahp4yZEaMriTdSAa/LlAQqfKcrQA/LVAgdYL7epfH58HC+Mo6jp1WxVNuOF2bBizkeDVDddLiAHgu8vFCZik2bVpxAMHg0+XpYdXZuQJfGaendLYn06A6L7Z0UqYHLEjHJzYddI7lTSib4Kpso2Yokdygz17w0KoutAgmcN+h45wDuWY5XNy5CrWclQ9905R2F18tpjQiD7NL31X+7n5YF+4FJBhT/6h7e6X5NJGlptMmFXzh82eW
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 18:06:55.6494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4da7dc1-bc50-4a7f-ac85-08dea61a1956
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8466
X-Rspamd-Queue-Id: 5CAA8498A7C
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
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35807-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]

Hi Mathieu,

On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>>
>>
>>> -----Original Message-----
>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> Sent: Wednesday, April 29, 2026 10:42 AM
>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
>>> Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
>>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
>>> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
>>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
>>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
>>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
>>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
>>>>
>>>>> -----Original Message-----
>>>>> From: Andrew Lunn <andrew@lunn.ch>
>>>>> Sent: Monday, April 27, 2026 3:49 PM
>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
>>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
>>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
>>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
>>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
>>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
>>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
>>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
>>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
>>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
>>>>> <brgl@bgdev.pl>
>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
>>>>> GPIO driver
>>>>>>> struct virtio_gpio_response {
>>>>>>>          __u8 status;
>>>>>>>          __u8 value;
>>>>>>> };
>>>>>> It is the same message format. Please see the message definition
>>>>> (GET_DIRECTION) below:
>>>>>
>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
>>>>>> +   | 1   | 2   |port |line | err | dir|
>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>> Sorry, but i don't see how two u8 vs six u8 are the same message format.
>>>>>
>>>> Some changes to the message format are necessary.
>>>>
>>>> Virtio uses two communication channels (virtqueues): one for requests and
>>> replies, and a second one for events.
>>>> In contrast, rpmsg provides only a single communication channel, so a
>>>> type field is required to distinguish between different kinds of messages.
>>>>
>>>> Since rpmsg replies and events share the same message format, an additional
>>> line is introduced to handle both cases.
>>>> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
>>> uniquely identify the target controller.
>>>
>>> I have commented on this before - RPMSG is already providing multiplexing
>>> capability by way of endpoints.  There is no need for a port field.  One endpoint,
>>> one GPIO controller.
>>>
>> You still need a way to let the remote side know which port the endpoint maps to, either
>> by embedding the port information in the message (the current way), or by sending it
>> separately.
>>
> An endpoint is created with every namespace request.  There should be
> one namespace request for every GPIO controller, which yields a unique
> endpoint for each controller and eliminates the need for an extra
> field to identify them.


Right, but this can still be done by just having one namespace request.
We can create new endpoints bound to an existing namespace/channel by
invoking rpmsg_create_ept(). This is what I suggested here too:
https://lore.kernel.org/all/29485742-6e49-482e-b73d-228295daaeec@ti.com/

My mental model looks like this for the complete picture:

1. namespace/channel#1 = rpmsg-io
    a. ept1 -> gpio-controller@1
    b. ept2 -> gpio-controller@2

2. namespace/channel#2 = rpmsg-i2c
    a. ept1 -> i2c@1
    b. ept2 -> i2c@2
    c. ept3 -> i2c@3

etc...

This way device groups are isolated with each channel/namespace, and
instances within each device groups are also respected with specific
endpoints.

Thanks,
Beleswar


