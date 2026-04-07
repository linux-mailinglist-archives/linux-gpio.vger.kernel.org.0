Return-Path: <linux-gpio+bounces-34814-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA4/EMwK1WlQzwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34814-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 15:46:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B18B33AF6D9
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 15:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 938F5301BD82
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 13:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1968F3A8753;
	Tue,  7 Apr 2026 13:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="p68i78fx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020072.outbound.protection.outlook.com [52.101.69.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5893ACA7E;
	Tue,  7 Apr 2026 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569512; cv=fail; b=raIcwF7UCO5sdQr1u8SvG66OuOqlVz1MUfgaDgx8xQC5Ulty2SCAxbH+buHRAXCI393A6cB5SxpoYYdf3czA3ThDIvlwQ3Ca3oHuZ/NYzzSC9aYmkd1bRpUSKvMy/C2VBCmQvT7aRjVoqsAHiG09gzIMas/hjm1lGu//OWfn7U4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569512; c=relaxed/simple;
	bh=qoSlfDvyXk6l67KP1zPeXimB6Yn6BFGVgC3IRTd7FXM=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rRQnz9bljwjSjAYkFbjRfKDPsStMtwUf3vyDZNUn2h6aQIB4qicIllQw4rkFsONA7IVIsbh3jFsubI1Qe5O58PnodSF3p3Do/utYazSSzk7o/ON7Nb27JPuqjlM23PtlTbq1ax+m9IefmTvL0BfSTwCHqEjD7z2JyhJvqeGwmtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=p68i78fx; arc=fail smtp.client-ip=52.101.69.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzD8xiaAy9EnIjv8J2QEuBL3Cpz6xrH+WG5p2XiA6pfP5MDqbE8uTzksg3/8FWX2AbLfiRorRsivVg+5Xk8a7E0tfTmiofeazV0lTWf2dq2ijdqzl6/eXQAvTOuXUNPpYPaVjwYFe25/WNT11HnBvJTI/PKFnAtSH2zg7lXFdIDrdvDQTHdBEjIL6JQAHo5YcGLW8aURAOZmean/xS/ag0OPfXzY5y7jVFhKGRM2lDWER3ILv3EuZ5erBAP+Z3+faQ/lU0XGlw6CENbezeixEECeV1DyWtPPbm68frYj812+EIISZ0LB0baWErru40FTM64nz6TcoZFKkEicnYrtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoSlfDvyXk6l67KP1zPeXimB6Yn6BFGVgC3IRTd7FXM=;
 b=FDFUIEj/oUFu99hLjJzQAX+Sd19uWXY9BPAqk6ui3MbS5sBcJxXoSW2oMm3MGkMrN47aF5OJIoVe14fZTrJqTgjhddZ9NlIq2l+5z1ss4VQwWOkTaRRpAX3Z1ez2W995ZH2E2efF+JBvSbPQvZPbrt6beekUDKHmkKOlr/Ew2RG0zTiwn2qqsuxtCw3GdvCQKnr+Ljg8mG33tHcYZBxQ60szR2a7PfPNmcFH7tvsUyHrB1ArZ44/4HfrwFTnNEZN/dypS3DVrzDGtLjpDTcfp58oGYdIzpqZscCfYkE7iQcUfR6lr41pYdBT+/xRuJMblvkKmBeaJUbZ0NlnsJUqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoSlfDvyXk6l67KP1zPeXimB6Yn6BFGVgC3IRTd7FXM=;
 b=p68i78fxNtDaM0lZT2P70JZ2HlehtAkzDSfakvXybriMABGltrlVJT1Vs/MPLomqgCsx5a1Z78VeIfibI4SHqYPjb3txoAGGIEKH9m3t8bk0S3hxDLEQNcxdQmBbB6TegBXylHeDjxZJkqLS/U++RBF7qu6gKDbeHsYSFPIrdE17YC+d8xg8pkxBSi6+GcmZ4TPlbu34RqwoXcoYy6prFjwwfXRoQHMces7mCsinGCil6n1HIPdkNajpg0XzlZNVO3+JqOn+p6hcwG/+nh/QHNxym71uq7TuSSxxxrpBRCeqm0wbaLJl8R2cg+ocXB4XnacT7mOMEZngHhIvpsWKHg==
Received: from CWLP123CA0098.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::14)
 by GVXPR04MB11065.eurprd04.prod.outlook.com (2603:10a6:150:227::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 13:45:00 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:401:5f:cafe::50) by CWLP123CA0098.outlook.office365.com
 (2603:10a6:401:5f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 13:45:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 13:45:00 +0000
Received: from AM0PR07CU002.outbound.protection.outlook.com (40.93.65.68) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 07 Apr 2026 13:44:59 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by AS8PR04MB8754.eurprd04.prod.outlook.com
 (2603:10a6:20b:42d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 13:44:58 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%5]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 13:44:58 +0000
Message-ID: <0a7aef7d-a888-49a3-8d12-4438a4b52efc@topic.nl>
Date: Tue, 7 Apr 2026 15:44:56 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] pinctrl: mcp23s08: Disable all pin interrupts during
 probe
To: Francesco Lavra <flavra@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Mastykin <mastichi@gmail.com>,
 Evgenii Shatokhin <e.shatokhin@yadro.com>,
 Arturas Moskvinas <arturas.moskvinas@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andreas Kaessens <akaessens@gmail.com>,
 Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
 Thomas Preston <thomas.preston@codethink.co.uk>
CC: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260330161914.1071118-1-flavra@baylibre.com>
 <CAD++jLkdoD=0RjpAMLWTMRtUX1+3tB6exOu5=nC3ERBYdrUiUw@mail.gmail.com>
 <e6909c2b-d41a-47ce-8f82-2bee3801fa50@topic.nl>
 <80c917d828932a225e0a1a9fffb77d55d27241cb.camel@baylibre.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <80c917d828932a225e0a1a9fffb77d55d27241cb.camel@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM9P195CA0008.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::13) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR04MB12030:EE_|AS8PR04MB8754:EE_|AMS0EPF000001AB:EE_|GVXPR04MB11065:EE_
X-MS-Office365-Filtering-Correlation-Id: b01d0eed-d53a-4a99-b4a7-08de94abdd4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 zjxugaxP3pQ5Zs65t7hz7WoQl6zNU+6+dGlHhdjQqER4rKQKj25vyVltus9nEr0OhF0oE0pEEkuHYroi+hqHkR+eDYKbd4K3Orkle0Emt9aUQcnP/yn60AEVzpeD0rKTYgdPGfqiXHDLJ/tAz3TtInbZZxcFGvHfK9L5tANfiSsBXKmolH1rIU5FYhOBJhnbxOGZuoNIz9/cyV2GMyeICTOhknE3m0/PnaFZNvzRrW7zFeVZR9UbgP8e+R0vFHP+hIKhbgUa7i/lzcoocN3Ee4JjKDb5NCtQF8ZIxloHkFUf0R2xAuIBf0fUNNnd0Kp1cGFkwuNRqzEOgjM3KwoFkGT0jQHwL99S5n/nizBCMDeLnVk4TBZel9edzS6SIsrp9oj7CHvbs1iUnTqMLw2hlE5wZrBgcU71tAtRtUZhd8WwlbLx/1kkYRdZI6DqfRKEDyXc/1mPnRo2d3OE6OJRIxD2aeZd4fBNgN2KZk3IPPFGCfezqmKnMkc7pD1KtDIDbBqvjw6v6/8pkucQ+1yhQKNw0dH+2ahtqDA/h/cSrfx1VzGWdHt+Tx5MT5Mq6JDyYl8MReWu6FeUTPVf1dGsvmsTPxFXwGwC0iLApGKK6N4h3C+qeg6PwQQvU6iTk6mPGUcrpNf1D+YVkNcwfxdvD2YnH5Fp/ABYH9HTmoCPZ0OggLXsjEmLvyMkQbMMJdoDQCIFgGtB9plLiRwQgmSdPEP79SxsDUFBSjgyZvN0k0BSo+r/DhKt5blqn45s8/6w
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: gdBkAZHunHeVmX4izo/X1seUNLk7CjUpquNkzELbwxKA8GvdEeEcs/lAN1XrNXTDSAABjI32CyAJqXKe0leOtzGj/yicNm+H4hGg2bye0us+CM4XGVAHUX3MgWo2VNe8Tpz4F1IfHy3cncWyCipPDV55qQARAOpr3wk57yGDNQPGb+0U3ffLQsPkv63istCWZSwEx9PmdRhLfQd2vqZ/Y3O47AVQq8XpTWSyB13iUz45FBRoS6A0fdgsLWNKdGme94wkoN7dB/Cm/JP85H2Ft1pkJFg19z2yXYnJLID0y8P/PkXi5Sg+bTUbE92qQChQWHz27i/d6ke2uaAY3xTwFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8754
X-CodeTwo-MessageID: 24e46cd2-de31-41b4-9674-c4b72375b7ac.20260407134459@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	69247567-2b94-4339-b8e5-08de94abdbad
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|36860700016|14060799003|7416014|376014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xTIa1WrQAixQYaZ4sTxCH/FwWuTpXmIUBg2lYn6d5l8RbMEncadvVKfHSwsYO+jBUb+H4ojCGQ0uDAw+UZxceoBF1uTBzL+kAa1ItLxlicbLuMQtuuKahiVBdYyR3XQZUXHf2Z5/71VFopPdRUAzo9OONAE6Wsw+SdwA0EHSRjPQZdsztVJquF0ppu+LV+KtLzRTAaCFMtfV0xulbr91eta91070+S7SEBKJjcgefWy4BIFrtVgvzX7doDEdY6KcBKlhpkbCgPx/yUu6CCXcKko2l4lS7qk5xDpfGXotBEcIMB74N7Mu1JhOk3NHzfHkG0pl15ttnA3KD6ImQCc9yZkugM7q0jbjDiemdzDfCo4a+nzWJo3P2Ad90ivfjxbc+AO6Who095yx1XOOUNGpUwzrTWczHQSYtEF711CIZVETVLgBqcMpohECRq5RFCEsLRGUECDdRXFdRs745ff53upR/nJFYZ/Q45MK+AyykfZBKL0NVAwNjINswSVOsMAyGthf/lybr3zO3UsAxejRGZkuhA1nzo6Mu781oc0VImyzKIMD9AFTXhdUqeeeNJ4rytFiKzSG3IQThy5/O2SJgyqsR+mysvILmAj0Q3LWNCytG/Xpcp3H5mGmeTa3Ighez8fi3Y/jg7b9Fvl/qSWq1Gdyy0cQkdWh9tCD+/zwMDQ51F6pOAKBOV3yV/pgmpgEr2Sazv8dpRE6WpirKwMrJWV0kfFKImMDmNxMnmKX9fiy5TMGyEXMmnIw6JfRTaRV
X-Forefront-Antispam-Report:
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(36860700016)(14060799003)(7416014)(376014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Dqo+pHJo3wp/7kesweI0iFqum7wodilp2hSK4UUvEzN5X5LJXEjh0WsgrpuIYwEEqxglMSu+GRhbDuk9jPdt4iiQq7LAnNxi03xQSF/WUr/QLUpBvhQ1kmjrH8+xfxu6VVKhC8G9ndRmG9zdSmKthOzj3+619XGrWHU1zdb04j4Lctc77zN25b/zvlhQY9kXp5gt9Haic+XSgl9Ka2dg5PwrSS7wE9a9t1Jma3IRAmZqgant0Luuf5R4hjvqANvctf6upi1crjOMYNrFLEAIYNanaPTFxZ7hryqaiqDLy/zLlzONiPW5Nx5rEmE3usdEaa85K8zAODUn8aHQAvXKhLDbH+Sat5U1lpucxQ2pHGXvFATvcr+Aom0bmsSdeJ2TddY3yDnC3j4FClubdrDD7RB2A2YNpln+BGudiyD8mNDimB8IxZaTlcsA1jdqwL8l
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 13:45:00.5549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b01d0eed-d53a-4a99-b4a7-08de94abdd4b
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11065
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[topic.nl,quarantine];
	R_DKIM_ALLOW(-0.20)[topic.nl:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-34814-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,svanheule.net,linux.intel.com,yadro.com,pengutronix.de,tbs-biometrics.com,codethink.co.uk];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,topic.nl:dkim,topic.nl:mid,topic.nl:email,topic.nl:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.looijmans@topic.nl,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[topic.nl:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B18B33AF6D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07-04-2026 14:59, Francesco Lavra wrote:
> On Tue, 2026-04-07 at 12:17 +0200, Mike Looijmans wrote:
>> On 07-04-2026 08:58, Linus Walleij wrote:
>>> On Mon, Mar 30, 2026 at 6:19=E2=80=AFPM Francesco Lavra <flavra@baylibr=
e.com>
>>> wrote:
>>>
>>>> A chip being probed may have the interrupt-on-change feature enabled
>>>> on
>>>> some of its pins, for example after a reboot. This can cause the chip
>>>> to
>>>> generate interrupts for pins that don't have a registered nested
>>>> handler,
>>>> which leads to a kernel crash such as below:
>>>>
>>>> [=C2=A0=C2=A0=C2=A0 7.928897] Unable to handle kernel read from unread=
able memory at
>>>> virtual address 00000000000000ac
>>>> [=C2=A0=C2=A0=C2=A0 7.932314] Mem abort info:
>>>> [=C2=A0=C2=A0=C2=A0 7.935081]=C2=A0=C2=A0 ESR =3D 0x0000000096000004
>>>> [=C2=A0=C2=A0=C2=A0 7.938808]=C2=A0=C2=A0 EC =3D 0x25: DABT (current E=
L), IL =3D 32 bits
>>>> [=C2=A0=C2=A0=C2=A0 7.944094]=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
>>>> [=C2=A0=C2=A0=C2=A0 7.947127]=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
>>>> [=C2=A0=C2=A0=C2=A0 7.950247]=C2=A0=C2=A0 FSC =3D 0x04: level 0 transl=
ation fault
>>>> [=C2=A0=C2=A0=C2=A0 7.955101] Data abort info:
>>>> [=C2=A0=C2=A0=C2=A0 7.957961]=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x0000000=
4, ISS2 =3D 0x00000000
>>>> [=C2=A0=C2=A0=C2=A0 7.963421]=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =3D=
 0, TagAccess =3D 0
>>>> [=C2=A0=C2=A0=C2=A0 7.968447]=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, Di=
rtyBit =3D 0, Xs =3D 0
>>>> [=C2=A0=C2=A0=C2=A0 7.973734] user pgtable: 4k pages, 48-bit VAs,
>>>> pgdp=3D00000000089b7000
>>>> [=C2=A0=C2=A0=C2=A0 7.980148] [00000000000000ac] pgd=3D000000000000000=
0,
>>>> p4d=3D0000000000000000
>>>> [=C2=A0=C2=A0=C2=A0 7.986913] Internal error: Oops: 0000000096000004 [=
#1]=C2=A0 SMP
>>>> [=C2=A0=C2=A0=C2=A0 7.992545] Modules linked in:
>>>> [=C2=A0=C2=A0=C2=A0 8.073678] CPU: 0 UID: 0 PID: 81 Comm: irq/18-4-002=
5 Not tainted
>>>> 7.0.0-rc6-gd2b5a1f931c8-dirty #199
>>>> [=C2=A0=C2=A0=C2=A0 8.073689] Hardware name: Khadas VIM3 (DT)
>>>> [=C2=A0=C2=A0=C2=A0 8.073692] pstate: 604000c5 (nZCv daIF +PAN -UAO -T=
CO -DIT -SSBS
>>>> BTYPE=3D--)
>>>> [=C2=A0=C2=A0=C2=A0 8.094639] pc : _raw_spin_lock_irq+0x40/0x80
>>>> [=C2=A0=C2=A0=C2=A0 8.098970] lr : handle_nested_irq+0x2c/0x168
>>>> [=C2=A0=C2=A0=C2=A0 8.098979] sp : ffff800082b2bd20
>>>> [=C2=A0=C2=A0=C2=A0 8.106599] x29: ffff800082b2bd20 x28: ffff800080107=
920 x27:
>>>> ffff800080104d88
>>>> [=C2=A0=C2=A0=C2=A0 8.106611] x26: ffff000003298080 x25: 0000000000000=
001 x24:
>>>> 000000000000ff00
>>>> [=C2=A0=C2=A0=C2=A0 8.113707] x23: 0000000000000001 x22: 0000000000000=
000 x21:
>>>> 000000000000000e
>>>> [=C2=A0=C2=A0=C2=A0 8.120850] x20: 0000000000000000 x19: 0000000000000=
0ac x18:
>>>> 0000000000000000
>>>> [=C2=A0=C2=A0=C2=A0 8.135046] x17: 0000000000000000 x16: 0000000000000=
000 x15:
>>>> 0000000000000000
>>>> [=C2=A0=C2=A0=C2=A0 8.135062] x14: ffff800081567ea8 x13: fffffffffffff=
fff x12:
>>>> 0000000000000000
>>>> [=C2=A0=C2=A0=C2=A0 8.135070] x11: 00000000000000c0 x10: 0000000000000=
b60 x9 :
>>>> ffff800080109e0c
>>>> [=C2=A0=C2=A0=C2=A0 8.135078] x8 : 1fffe0000069dbc1 x7 : 0000000000000=
001 x6 :
>>>> ffff0000034ede00
>>>> [=C2=A0=C2=A0=C2=A0 8.135086] x5 : 0000000000000000 x4 : ffff0000034ed=
e08 x3 :
>>>> 0000000000000001
>>>> [=C2=A0=C2=A0=C2=A0 8.163460] x2 : 0000000000000000 x1 : 0000000000000=
001 x0 :
>>>> 00000000000000ac
>>>> [=C2=A0=C2=A0=C2=A0 8.170560] Call trace:
>>>> [=C2=A0=C2=A0=C2=A0 8.180094]=C2=A0 _raw_spin_lock_irq+0x40/0x80 (P)
>>>> [=C2=A0=C2=A0=C2=A0 8.184443]=C2=A0 mcp23s08_irq+0x248/0x358
>>>> [=C2=A0=C2=A0=C2=A0 8.184462]=C2=A0 irq_thread_fn+0x34/0xb8
>>>> [=C2=A0=C2=A0=C2=A0 8.184470]=C2=A0 irq_thread+0x1a4/0x310
>>>> [=C2=A0=C2=A0=C2=A0 8.195093]=C2=A0 kthread+0x13c/0x150
>>>> [=C2=A0=C2=A0=C2=A0 8.198309]=C2=A0 ret_from_fork+0x10/0x20
>>>> [=C2=A0=C2=A0=C2=A0 8.201850] Code: d65f03c0 d2800002 52800023 f980001=
1 (885ffc01)
>>>> [=C2=A0=C2=A0=C2=A0 8.207931] ---[ end trace 0000000000000000 ]---
>>>>
>>>> This issue has always been present, but has been latent until commit
>>>> "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW at
>>>> probe and
>>>> switch cache type"), which correctly removed reg_defaults from the
>>>> regmap
>>>> and as a side effect changed the behavior of the interrupt handler so
>>>> that
>>>> the real value of the MCP_GPINTEN register is now being read from the
>>>> chip
>>>> instead of using a bogus 0 default value; a non-zero value for this
>>>> register can trigger the invocation of a nested handler which may not
>>>> exist
>>>> (yet).
>>>> Fix this issue by disabling all pin interrupts during initialization.
>>>>
>>>> Fixes: "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW
>>>> at probe and switch cache type")
>>>> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
>>> Patch applied for fixes since it's pretty urgent, and it also looks
>>> right to me.
>>>
>>> However added some people using this to the CC so they
>>> get a chance to react before it goes upstream.
>> Looks okay to me too.
>>
>> Maybe it'd be better to unconditionally write "0" to this register? No
>> need to exercise the interrupt logic and pins when no-one is listening..=
.
> Not sure I understand, unconditionally writing "0" to this register is
> exactly what this patch does.

It appears to be inside a "if (mcp->irq && mcp->irq_controller)" block.

Which is fine, of course. If there's no handler, the register has no effect=
.

I just thought it'd be cleaner to set it to 0 as part of the global=20
initialization at the start of probe.



>> I was going to say "if the device doesn't have a reset GPIO", but
>> looking at the code, the reset GPIO is never asserted by this driver.
> Right. In any case, the reset GPIO is optional, so we would still need to
> initialize the register manually if there is no reset GPIO.

I suspect it's actually a bug in the driver that it doesn't assert the=20
reset (before de-asserting). But that's for another patch...


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




