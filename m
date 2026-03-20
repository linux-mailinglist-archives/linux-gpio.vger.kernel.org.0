Return-Path: <linux-gpio+bounces-33893-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLlODXoSvWnG6QIAu9opvQ
	(envelope-from <linux-gpio+bounces-33893-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 10:25:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1966C2D7F6C
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 10:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 421FA3014A19
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 09:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2632D37268C;
	Fri, 20 Mar 2026 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="U1uAamlV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="e63+CNzq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53FE363C60;
	Fri, 20 Mar 2026 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998702; cv=fail; b=vGoHoDgTYcJpkkDPU5lIQkMVqBJF05ksQNOEV158fBxQ+ovDJrotZCJfo6oTYYP82pKGWmEhEms+WeqxoYp8jNXONy3RRFQA6LDw+NEF88sst2W5Z1TGfubcHWcJmH2MlwSdoRziJ/xCgOORiybL+aSfNRNMW7P/8yZmNlp7was=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998702; c=relaxed/simple;
	bh=kAbc6obVyEYhrfrqyItjqlj7iXQtFmqnsCCJQYV7lX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpBIABlAer029GYpo+AEDOo2RVJMGFdzcvwhTepRE79r/iHoog87IZ7lHeczcS80LWMXyML7PO+F0SbKUQfmK+TDdgCXE3FvPuLBqesaLQFsILZq4/CTCNAMcJoi647uUgcRmLSHyfvczrRM1urMnE81RVXy0X9F5wMfZvJt3iY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=U1uAamlV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=e63+CNzq; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K8QdAN464687;
	Fri, 20 Mar 2026 04:24:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=3pfPfk7unZiEugCdj3
	neomnKg+0ri+rgBkQDc7ny/IE=; b=U1uAamlVRO4RT6HK8sW5GG64zsi+Q4Hgzf
	mMh5R+VVbxpHEuSH0Ml7QhA58WzgBYZLRUPQvTmoFd5+fwo0331j2ABgXlhJuKF9
	+wzhxuCaV94snjkc805oR5qRU2qiH5FHmBp+BkNH0oJT1HDRfEBPr3xvpu0ZIGJR
	a7cgXM5po5Hj4N6dKVUJ59rvnu6bbKpHHexndcmoCnhp8oUw88uCnN6lkt4h4Q8t
	Ot+HFYpaXGf/whhZGU3vOLuKdnXh994Kv8e9PzxH4sDx1wTYgf8Z7qTTjei7U5mj
	Fqnm7joZjp7dv+hwufvqHrmBbNBND3h9CM3WbRYGHM2GvWbU6bhg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021140.outbound.protection.outlook.com [52.101.57.140])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d0yn7r642-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Mar 2026 04:24:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBzlyAjaH50s/977KE+3VMYJbIqNAm2dHSc9G00cmf591LNZaLU379kl5Q37s6WXTgd3G1mKD/bVN0p/prRVlXU3y/1yHI2CC3IBCTT2HXOsjDyyAwXi8m53ml0xsPgdznBV/9/NbJOo616UjB5MAAczgY96joNgHTkT7MQsL5VFl5ptsQKc/sfyOhv+yce9Iggd+8gmxRChvS3pHxmSV1Mc596GUKkivX8fiaMqOKAmLh72tixPYckXuL8X/OV/CHgl3gEBbnwalDpZbtI+ZqDbqaemZiRVfp0Q4VhR2ZHYRhjs1ZAuL9XL/W8jLaK9olDzwtQiqn1SJh1nlTDZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pfPfk7unZiEugCdj3neomnKg+0ri+rgBkQDc7ny/IE=;
 b=MPlnMQznQwbgMmZ7smtf+kxLCkcTSpgikUQ3Vil1GRG+xEbGw4/bSy8jZ4XOaPILXirkJ1GzygfZLPyu6t07S4caXTTHxaNlrJI76jmwImHChiXpLTxHTxcWiR3SmevVT6YIu/IRphPJNipD94E0wuYj80daqb803K6kuiTzYRk7Ab/bk//QALmRtvhnoAa4OxwzsZzCH2aGhch2pQD/6Jdqg4i/4cAroUVZxLQymFZzjLzVR8vCwz/Not6yYjYDvYxyDwxdWNvIz7rIBkGgZpcVConaD1vDmPFufjVsOwbilutkggHse04/bcPRe1EtDYnv+y+NeD+NgCO8R9igEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pfPfk7unZiEugCdj3neomnKg+0ri+rgBkQDc7ny/IE=;
 b=e63+CNzqULzurtjdrcPDjAV2Qpc9D+xw9oY5AOolU316jAHyylaSLc0vksExgxGfyBqQCtMumTR/ydG6UhLZ6kWBk+Er+f8XAeYPQARTydaQkbkmw2m5kpxvO0O4JmH8WBM+TR6tewGcT0b+GRCPmKvjwLk4h/eTC/9HBiCj0F4=
Received: from PH7PR17CA0072.namprd17.prod.outlook.com (2603:10b6:510:325::20)
 by DM6PR19MB4059.namprd19.prod.outlook.com (2603:10b6:5:246::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 09:24:40 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:510:325:cafe::26) by PH7PR17CA0072.outlook.office365.com
 (2603:10b6:510:325::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Fri,
 20 Mar 2026 09:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Fri, 20 Mar 2026 09:24:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CBA1040654A;
	Fri, 20 Mar 2026 09:24:37 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B429A820247;
	Fri, 20 Mar 2026 09:24:37 +0000 (UTC)
Date: Fri, 20 Mar 2026 09:24:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: mfd: wlf,arizona: Add irq-gpios
Message-ID: <ab0SVFy1RixR12jO@opensource.cirrus.com>
References: <20260319-mfd-arizona-irq-v3-0-24c251377ec2@kernel.org>
 <20260319-mfd-arizona-irq-v3-1-24c251377ec2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-mfd-arizona-irq-v3-1-24c251377ec2@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|DM6PR19MB4059:EE_
X-MS-Office365-Filtering-Correlation-Id: c243cd08-dfd4-4b09-3c23-08de866282dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|61400799027|18002099003|16102099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qUAIP6gquN03ExgglJqkiHe6AsEJ7Nk7kkY+BaetbNO2NZlOPYpaCkpxu4jEkaEiiEZWAlF1kakWX0xDCrTyaxp7teBBRr2Qk6aTk0G++I532xgTozU4IxZJvY9w0+G/dPHZ3DnO0zYbuFnADgxTNEG4i5emkCq8/vX5ZFSy/IbWvkKSPZN83xS0nTMdYLNZqw5fwPfmf5+jmld/yUsb6VVkqnLtWOrtVj9oiQDujq8a8M/ZIAUYXoS1og3IMoGR7cgK8luTaGcdHKIw3wJZxYUcjs1EaaP252CnElMX9HptTw2IATRTBU7ZAXc1A2IDcHfMn1xZuwPxCVQS3vY3yzfaX2JAsRcsRKyLlAI8w67ZFHSZcbc/fN8flo8ZNq9Imz4q8JQaQGR5tZS1n5bQOIKSKF+s8dZDJCh97c++ZKtrPEkeBLBfJGS/HeYxUY0BMwMbA2zITO9YYJoO3gpFTceSYk/D94fyZLsbSzNc5vzVWih6nUGe6LKQluMx2rq7VZY1GBJ+dKnnQN67Ot8Qg+Cy3Fu2yFWKy1TWyx0Scs0WRnjjMdTjlcRAlUZodH9KVl8oSLT5tXJuKP0A5UgHVwpYxXseD2C4BUBEv+t03+UcLU7rFZcFZkiSGmH/mYI5Cuau39MTJqb1WWELGSeUmyn33vmGOh2reEAWPdkMVspIF5044+W6tfez2lucIohtPb8xI+I8f2MPY9qXlbnTr5GoRx3qIZnEmJa/4AuUnhtPx1mVPtWvC1YiHTXe/gVFlm4u+lFyPqEoZ56Jo54pNw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(61400799027)(18002099003)(16102099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Aw0G/JoxgjK531NWwzoDFN59RwdvBKleUCJ7t10rVgX6N6wmNK/IHuXTvQwF8DE4c6uqQa7xWMuy46U6NSoM/qDuJBhnBPf9b+uXpJlJtIHtBznNJzOc4gqchstQxfIBcHVLN7EyG0hNoM/7DUwhUBBZnfSUEg+AdrFYC8e2eWUo5MWMlJroyy3N+77oOc+4+xRvGmqeoEONNGPFYpqFDYELSxeBJ1aSIDUUdoPd9fuUdj8gxqdkSzCqbHNGBSUzs/3BLiIYGEPgt7xq3eLWIeSjkpm98bnFW30KIjl72eDnFL9/F7RVmgbr1W+hbaFKs6DTyqekYbJOsagPnSCt+80/U2bm/NTgFAkI1h+P7gZeedD8e4nFEcRmKNpOPdIyJhr9YGteCrlUGDYQqCX3GY7eccV2QifAf0oTykbY0NIOKsaIzgo1KZgQyWX4dbY6
X-Exchange-RoutingPolicyChecked:
	Bsdw+biSk2fRxjDjPJEd1UxcWrxRznOYk0LasRdzx8eyTQMsFOyAdEdwf5KArxa8CiAuRkJ4PTWGvNsVs80EDNz2PHPLLzuRoIDKB/KmwxEZuxYrDS+//QMNpmSrzigeOnbpEYx43vzX7m9P6xZIjW5EEKqdkFW/4zTnNlizLrFOLUyTPbBjgpgRUgEN7AW3T6zmtfFpRM/5ohlBggQyaxJW7XjS++gNPIpWNpeJJI75YxGH923zpaR0Q3oVquOu6a986yqHnozfBlD4576Ka8Al951xIoCKc8aDfSywU8FiytHxLMhEmwaycdMTfwS4FFqXm1/Duzd9liSJBLffxQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:24:39.0575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c243cd08-dfd4-4b09-3c23-08de866282dc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4059
X-Authority-Analysis: v=2.4 cv=Fas6BZ+6 c=1 sm=1 tr=0 ts=69bd125e cx=c_pps
 a=MXoojEuG0CHbO9udwFI4vA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=jH7CqyB_vapHqAm2UQMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: Pje4xbQOA1bYNAeq9I2BdWMpyESkyr_W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA3MSBTYWx0ZWRfXyi7tH/zrM2mF
 QH2oc6/qPDIcUGmlHnFSd/7JZ81HZRgNlZ+PVaIP96kl6WjWqaU533khM0Ga1vgHxUx7asrKudz
 WYT/fnnlZHNyPShb0loTijaClwExXucIO8gK1Fvvp+FQrtsnLXhtyNZmPXywqlIzsoj09l6Nry0
 zc3tnYnoHy03thlVUs+UY+2ug/HS2KcQ7mCNhItPC099uBMCCiK0FxNZq8A2KFTB7l1CS/0aew5
 GPHmU3x9gl47bU/ohXbTrqnNYiYaBlepKX4jx6hJvqaMpqSLjHWysTPBfdXXnndMJbSZfCnXcdR
 Pp9w8X7sethfu0Qsz9RV8r15RUWDE3x/0OFiMq1r70G5XsCR7IVg1wletBdgBwMpQ7XYJ7pYLM7
 YdAl2pkrjTwgbPOQV5NX2IFswQZX4+ifzgUA8D/DqvdmcyTSDLWI/xsOLofJY/KjwIKl/5S5lk+
 tekSMcCbXaaVBdqjRgQ==
X-Proofpoint-GUID: Pje4xbQOA1bYNAeq9I2BdWMpyESkyr_W
X-Proofpoint-Spam-Reason: safe
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.cirrus.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33893-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1966C2D7F6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 07:50:29PM +0100, Linus Walleij wrote:
> The Wolfson Microelectronics Arizona sometimes needs to poll the
> GPIO line corresponding to the IRQ to counter bugs in the hardware
> that appear on edge-triggered IRQs.
> 
> For this situation, provide the optional irq-gpios property.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

