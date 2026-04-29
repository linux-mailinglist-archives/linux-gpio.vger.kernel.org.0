Return-Path: <linux-gpio+bounces-35801-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIskJRgf8mm/oAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35801-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 17:09:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAA0496959
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 17:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4901300F182
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 15:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4873750D5;
	Wed, 29 Apr 2026 15:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wr02qGqn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011025.outbound.protection.outlook.com [40.93.194.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD80F2750E6;
	Wed, 29 Apr 2026 15:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777475080; cv=fail; b=G7PsSXY/Lvi/NNk+dSzDsiDNPsOQZKAcFYjm5BkrQefAcM4KiF3GTpUVa7T/ul7rPz8pYd9nYQYl3VIbGzpRo66g8liH/7+wCQbkbxTJ47ZaUSq1FQNP4ctAFDv2jHcR4mAmwYYzoyAcw5lHbhzjCw7zAwtwE0/cbtZoeDNy+u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777475080; c=relaxed/simple;
	bh=ZzIUBlZt3lwmRlDvIPL6cTPtYAcPjWaq5t987G1fOwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eRb/locMe4XEdaPqPU6SmTRJsZOG24+0r30rUNkgbtxio3c7mKVPNGvOiA3NMqnhnp6ESQVYlC1oou1NQTbFFnaXhKaP0U2+y4HczkJ0xHn3Q1O9z6cN+qpzXDrb/Gi7SBc9bU42GnqZ2b76TZyflstGMY1zCX/GZ2qnmD8Vik8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wr02qGqn; arc=fail smtp.client-ip=40.93.194.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUqTeRGvDt8mOglC1Spn5Y5oG5NU1VOzK9HlrqNzjhe8IbTwRo7yiPdEisD9DNO/7szM/94SOMTw2BTHUvXBF6vytYsVpjr0HRm1c0oBfkJwIh5Z9dkE04xqp+2s+EOxj5Z/dkYU1rnn894nWAfYfgHSHX+bjaqfm6klAaTtdpJNMGW9EMqFScuUUsDZP5fgudFRpetGxmFOyxKi6sOE1/sM0n/fEQulmpyuDfymlfJhqkMdhH3TakW8ReZEIplP5GpxKcvT73wRcI404hcsi779fbEPDcXZNpFyrNMRaxuOApTtwn4YUl7wdrEztKfFKHKuM0vfmJnpY0mwVHKKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGRw5I7BaA87acubTr1WsndoPzI+4mRXKHi7TggjVOw=;
 b=zDXqjFeYL1rHyZ8Mobfh9MbDfgDiIutgiQdHMkFZRRC4ee0esAMzq4Ik4ThhKRHq5cVHzmK7YQvo3XTZ4Oh1iBhKgjyUfbHDYXDKi9Ln5E4AugniJYdIX4IkkMG/UR8PffLH3a/ShIObQ3qBjXr1frofW9Y6PXyionby899MAO5zSY7XxNhMlh2VeGbqBgoBUBRUr6W+Wc/SDtMyCVF/VyB1hRWLK9wFTSyntRFRJJZq8OJcsYfitrQSegzX47+fvFDC50UtL8NJTa8PQpaKFd/8jppEf9tIbL4O0bHTMRvwqnsEmpW2g5jcScSDAsh9GeBHqhwS4b3tCKoPxUzBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGRw5I7BaA87acubTr1WsndoPzI+4mRXKHi7TggjVOw=;
 b=wr02qGqnP7C9CWq5lqFaG35kAnzag06mIkRadJlyVpt1scA+d67yP0A+mUXXmQipR0QOe8L7K94FBlmIl4BCjzi6tCkWawc8QozqRTGq6UD0r92mzlXZzo+38Wmbic9Qy6Lkv6c50NiyS9QKR0kqHZkfpxd7PuFm9IVeZBIMgGo=
Received: from MN2PR05CA0045.namprd05.prod.outlook.com (2603:10b6:208:236::14)
 by CH3PR10MB7702.namprd10.prod.outlook.com (2603:10b6:610:1a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.27; Wed, 29 Apr
 2026 15:04:36 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:208:236:cafe::d5) by MN2PR05CA0045.outlook.office365.com
 (2603:10b6:208:236::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.16 via Frontend Transport; Wed,
 29 Apr 2026 15:04:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:04:36 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:04:34 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:04:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:04:34 -0500
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TF4PmN3558498;
	Wed, 29 Apr 2026 10:04:26 -0500
Message-ID: <0ac04a40-d670-4d02-bd08-017d99ac5e43@ti.com>
Date: Wed, 29 Apr 2026 20:34:24 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Andrew Lunn <andrew@lunn.ch>
CC: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>,
	"Sascha Hauer" <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Pengutronix Kernel Team"
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "Peng Fan"
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
 <29485742-6e49-482e-b73d-228295daaeec@ti.com>
 <PAXPR04MB918568939EC7DAEB4BB6C8F989372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <32c119af-96ad-4da0-86f2-cdc4ba57ef0b@ti.com>
 <PAXPR04MB9185C7741DCC422212F952CD89372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <8c8cefaa-7d9e-4b73-b92f-40cb52b37f2e@ti.com>
 <8d9801cb-0c66-48d8-a946-89a7771e73ea@lunn.ch>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <8d9801cb-0c66-48d8-a946-89a7771e73ea@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|CH3PR10MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 79590424-b165-4248-2ab4-08dea600a127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	99qY1qSycvblBOd2/SGlDcJKoVCQ3d9qOduLOfmXcJ8RDOXmeF/Dfi8zbN+eoOOb+fjal0xNFyO93tCOL/lmhWymfR33y6tVZXOEuNtRy8sTrtqRcHOa5zl+8al4yBpUfRVIDesjT7WuH+jZmQemKmsg/B08e35PFY7IIidiSbyi477c0Jv/d0JxvFQxGDtKCAc1/9yhtFsBQxjcgrTAUeadgpLNHNgUHGlgsL4TZonfajzmZSF/iqOCAI87Mgf4wG1vwgFemGc0iAwhyVA+T+DdRmQ9aCuemZyC+cfV+aY9YO695lr8xO+ztb8ogxAKWWQ7dlDxLEogxk36uGnhPM7pfXc+cwjwaEFcWdYpr83k8WJ9kUCv76TlxpXpRWG5VCFZTJnDgGaWsnNzKKfgCMcEl0EBxqM6xwn/csFssHP+a/lCPa6nxkEHyqwvy6gzoiJlHgNoMAR+9GO2/l8C6BanQ20vEAlIZRWuiobEyPRWQF116pTV1Ovwcj4XGINFzN83NNxoqZkhCqslTR3Sqvtd2kYTMWSlE+MrZcsWh5S/7uL/+wIxVclfhbpynmU0rHonkfHhyt6HiRTA5jA8N0zsZPXWSUmLexnJkKbKDNSIf4XUjYaGXVE6eimenrnuMiU+E7hSX9wWZ2VdxYfiiMmfdXrcf2paBRq8zGT/I2mq2xEpEfzhisRpvgsHwwvsxI4tyor4Ou3BD1WVcivd1ANW6E42q5ONPay7mwWlnl4=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fTb6P8FAMwdlR01djFp8/tJjccqMg9cf2dHYn4FsMi1Z43FJuskQYnTuRWXKDMpClZIbwD5lUWfRJDLzRJWrkHcbixT6GtnIGtZ8wrQBB+xvGhkhsaTCtTfxLiEBu64SKyhiNn5wJKuVx/OOmbWQE0gdlaPLvM1OJ2lXmzNRnhWvt1DaRDB8Y83+sXEQ5Ow9gUWp7YfUhwaLL+z/QkLCbdWytFe1+JTY+CJw++H689ivqu5dGCe23tDpHkMSACN79nZKspQ0VaR3Fx4o1VvMKYwUwhRI/lQHnzv/H5ilFM52F0rJS26n4endfGTrxqTt3T3OHCiJcn2brfznI4ZOzzqFITs+Fw5c1+wafggCXL6neWVd+lucdIxQKpUTA5qKS/+hADl5iGaD06CexEw51kWcxeeEWGPjAGz39p7ksihFbOgzGAaw99MK5Vfnvgo0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:04:36.5972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79590424-b165-4248-2ab4-08dea600a127
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7702
X-Rspamd-Queue-Id: 3FAA0496959
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
	TAGGED_FROM(0.00)[bounces-35801-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,lwn.net,linaro.org,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ti.com:dkim,ti.com:mid];
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


On 4/28/2026 11:35 PM, Andrew Lunn wrote:
>> Remote side learns the endpoint when it receives any message from Linux
>> from the dynamic endpoint.
>>
>> Lets say rpmsg_create_ept() allocates a dynamic local ept of 1026. When
>> you send the message from this endpoint, the standard rpmsg header
>> would have:
>>
>>      85 struct rpmsg_hdr {
>>      86         __rpmsg32 src; // 1026
>>      87         __rpmsg32 dst; // rpdev->dst (e.g. 400)
>>      88         __rpmsg32 reserved;
>>      89         __rpmsg16 len;
>>      90         __rpmsg16 flags;
>>      91         u8 data[];
>>      92 } __packed;
>>
>> Remote side tracks the dynamic endpoint by reading src = 1026. And while
>> sending the response it fills the header as:
> I've never used rpmsg, so this might be a FAQ. How does the remote
> side know what the endpoint is to be used for? Here we are talking
> about GPIO. But the same hardware implements I2C, and a few other
> things. How do we indicate this endpoint is for GPIO?


That's where the channel level isolation helps. GPIO ports are announced
over "rpmsg-io" channel (parent of endpoint), i2c devices would be
announced over "rpmsg-i2c" channel. The default epts in those channels
would have separate addresses (e.g. 0xd for rpmsg-io and 0xe for
rpmsg-i2c). The remote side would have bound a gpio_handling callback
on addr 0xd and a i2c_handling callback on addr 0xe while doing the
channel announcement. So while sending a GPIO msg from Linux, we
should direct it to 0xd dst endpoint, and for sending a i2c message, we
should direct it to 0xe dst endpoint (src ept can be anything). And without
any extra effort, messages sent from dynamic epts at Linux land in the
appropriate handler at remote even for separate device types.

>
> Maybe also related, this hardware also supports a number of GPIO
> controllers. There has been some argument about if one endpoint should
> support multiple GPIO controllers.


IMO no...

>   Or, like gpio-virtio, one endpoint
> represents one GPIO controller, and you instantiate multiple
> endpoints, one per controller.


Yes, this is what I am suggesting in the review of this version.
Basically there should be one rpmsg channel per device type
(e.g. gpio/i2c), and multiple rpmsg endpoints in one channel
representing each instance of the device (e.g. gpio1, gpio2 etc.)

>   How can you tell the different
> instances of GPIO endpoints apart when they are dynamically created?


Well by 2 ways:
1. We can maintain a map of the dynamically created ept and its
     corresponding instance number.This is useful while sending a message
     for a particular instance.
2. rpmsg_create_ept() takes a private data argument, so we just bind the
     per-instance data (struct rpmsg_gpio_port * in this case) to the ept.
     This is useful while receiving a message for a particular instance.

I have suggested an implementation for the same here:
https://lore.kernel.org/all/29485742-6e49-482e-b73d-228295daaeec@ti.com/

Thanks,
Beleswar


