Return-Path: <linux-gpio+bounces-32198-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HqwAX2Mn2nYcgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32198-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:57:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F5F19F34D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 00:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B5A031001EF
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 23:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC7238757B;
	Wed, 25 Feb 2026 23:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GfNAnE+W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EE13859E9;
	Wed, 25 Feb 2026 23:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772063738; cv=fail; b=lnwxW8acATJYuGtVftCQM//g3mFbHYUhBJRMvKoxb4HUHjJch24zZK220/95TjKaonV7oBpSfjXBwU7dmBKJMFygyTxw9KhaaZ6EkB+bji62TgUTRCCZF3wmtxHoxbs47NFlmTnqtwoFdZrcR5UolLJRTS37NzcGpJWJSkixdfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772063738; c=relaxed/simple;
	bh=Zzcxy8veub++eNDJjeGSV4de4bcX+q3y39GX6JWwJHo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Y9KSyiptclucrUPI2rcJGTg2nufIBZsGMojovWe4qGawBGhJbGB4uafaIJk/88KyaVKs3s5Clvm6pZYl6PYBx1V15oTvZ/Me/Xf5YrS9FwycN+001wknO8kPL8mMCLvwfWjpUNgqwRqEtgRVlPhcaTTXkYBJgjz547/IG0QEQiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GfNAnE+W; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMR8vo8GTiHEqdY70uytZyt4OY0Sy1XU1YyZMiM7QIRzxNq8VKtIzVMDcF0/YsPY3ZUKd0sP/6bDRwi8x5c3YId8Vfe4C7PYPjl4qDKuqb6j95q3fLKuApNPa0ZAkIQaiyL/dwreTiwLy73kbKRGu4J0C9s2Mt+O0av3paXmH6GjxRXoeTmXXqWLFoZb2gv+3F/xMtScRMykQ662SB//SAadp4zf99P4YhEq1buendthqYTaIpUQXHq3aI1f/dO5Pf8JzEvo19nlQttJpIpyOjTxQFID4lXS6N/EI0YUd6pgZOW9czyArGFSwP6FmxmLcmLzTrxR3j6vMA07O5Sk6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K16BGpS5JO9mE8yzQLP34LWr8mZJDsYrGIooIXEM/Y=;
 b=Zqmp1FWZOq/XbqW6L47UUWgL745/3ry7ymk/RHcmFZX/2oDp9aGQttAtyHv1R5MK82WmfB8GFjjwH45nvQ764hdvGV0IIJI0lXetc5OmsFmxwiv3Cmw5GJflWpv2AK2vvP9wWFuKrM3hSiCtWOkqEmeTW7hoO108nGS5EH7qotHvAqAOB22HklEF1rkLAUO0CUntrmbaGYjK8DLCN370DBxSfT12+9iZJHFt1oC5kRVVzllHdRiXpfgJ8GlEfQ8QCSqAeliZCyEDROGcLH6AdBsxULLkWTnl375cF0T99iWRuz32aj/CEpnLNbbWyyFNVxiOMd5ZDMMwmTxN24xpWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2K16BGpS5JO9mE8yzQLP34LWr8mZJDsYrGIooIXEM/Y=;
 b=GfNAnE+WdS2b0q09WJfFIgh1D+Y7eg0cgykN3HNSJYV+b2tUHiKFEaaR9+Z7QdURCDdOFojrC21vT7W30P1IWifKBs/MbIZpZTa9nem48i2c6q/rC366SKdD3v+UwzDIe6LcnF54cr8Kz3pxX7Bbl58KGhbSEiYDCJsbW698vw6KHXJKEelv3tC6S8rQs9DMdzpdaXf7o0HSkWnSfDF0TEkKhYEtBmWrNZ0wnivIDd/AiJP9xMpsw/8ZifrF+iKZD8zKVm84pQGeNBR7RTMcDEH5xxIxzFe20eOhyWMQaI94mY7mTRwrzSsZCnPgi9OBWsV/MRlffTjUNFzcmWDEtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 23:55:34 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 23:55:34 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Feb 2026 18:55:09 -0500
Subject: [PATCH v2 5/6] arm64: dts: imx8mp-evk: add board-level mux for
 CAN2 and MICFIL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-pinctrl-mux-v2-5-1436a25fa454@nxp.com>
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
In-Reply-To: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772063713; l=2090;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Zzcxy8veub++eNDJjeGSV4de4bcX+q3y39GX6JWwJHo=;
 b=DXn1Qwe2E7vE6e9hKHwwax04whzK3R+XLAwpjkVOFVwHAhqL6QRiq76bfjYjITYLjg8hOHa4Y
 jothtqLXTRqBH4Ef6IAUqkwQWQDXN6wSqGdGHVWlSAJl+SI162/Skxs
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c474f0-c310-4d1b-6ab5-08de74c95d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	rHM7hoKECNNfXd13TmKo5axfFwVB0mAi9nPadrxvLED/eqPCH4tmfEKR2IurcWv+eYfiwBfNhsqZmcKh+yXTPkyh2yyQqU2u/44UDwNCZTwa7S7RdQj/cs7Cp4uHFyVs7g9AY4QnqJmfA/4ThNhNqlwACjYllKSaRwymM6jU442EoHTSmtsk5FYSOLU2A0bEEJ1+j8tjsnySJ5nuwXFRosQD/jRaMgacNPAXR6EkiLpSNfHDTzIkHKyWT036T5jxkcOb9O631WVPy4BUFzB82jQM4zJOtH7l8apl3gVpWXVvpM9WVea4n9KdmNj7kYeM0Cnm2pZL2Q2YSdm6gQpXiTENnNo5E40YFt2td4QN6tUbDLBWUdxXrlMMRhNhd/OE82bDJ6KzShX741BQJ7xmSp80DfmpPRuLWcQw4o5COzyouc9WWgDgW3Xdu3JXMxP4t8FBycTxzI8lsWimCb6Bit6iPiCHdHs7zHbLX49gRRvppGucNeYwqDOUG207mphCCcZduLvS4gzJmJ+QcGT0mEYe6YaQVkW57kJOuUTC3wEQPlCexyeaUfYmxmK6ZCFdTeSseTik6+UrIKdEENihFykiutK8MNtVEETxIraKjdhq8AstRBEHK+IWwizhxcgDUcJf/t1Fk7gD3KKouF7xjs8IEmt3id92KmVMWEHgJr3a3QYMsvD32oc1TceGJK3l9RQ/HpzEzNJhT7Lx9GRCVBc6vJLhFibD67GgJMuqjEjH4J5wi7GQ0/R27s2jkPiinf44oT0ZP4Va6PvVHyCZ8KZIF7yiFSlzKcyRIrSmUQE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjBUTVM2Wm9mTWRMcjduRmk4L1ZGdFVGV2tNSURwczJrZkt2U2c4d1lSckQr?=
 =?utf-8?B?SHhHYW55V0FZMlc3RlhaKzR4WjdsTk05S1Iya1pHLzg2WU9WMEtDTStpUUJF?=
 =?utf-8?B?d3JqMWFpQUMrenJWSS9PZUJuQVM2SElEdVJRVHdrY0ZyQ25FTkVPcnJBdUlB?=
 =?utf-8?B?SlJPOC85OWF1VXBYVEc1UEJlaHY3SkV4NkowUUpvQmcxZGI3YU92U3NtaW53?=
 =?utf-8?B?TUZzQ1RVUmZhNkFZMWhQcmZPVFVHSW9ZaGZVeDhFcXZtbVAvYmhCYVA4emtz?=
 =?utf-8?B?ZVFFZ2EyVGdzOElZWWFvTEkwc3ZIYTFDZ29sK014eHNLQ0RiTGx4MFlEbUh0?=
 =?utf-8?B?SVd2V1JGeUpEblVmOXA2SCtvRmkwN1B2d0hYeTMyYW5qTHVQTU82cWxOb2li?=
 =?utf-8?B?TE1GU1lIVlNMZHR0NzkwN3F1bGZvL3ovcjVPRk9FYjJXb3R4MmpLUVRXNmlp?=
 =?utf-8?B?RnhEY3Q4UEFDelVSRXZyN25ucDZUODA2SFpGMzNoMG9NM2NMN1dIUWxRaVhz?=
 =?utf-8?B?dXp5aEFKN3JWQkJyakIvMTJycEJ4Z2JRYWFGejArdSt1VGtRSEtINlovMk9E?=
 =?utf-8?B?RWYxeVZLRGNsTlNmMTBhUVp6Z0RPTVJ5Yks1MDRUTmZlWTk2dlhnWDh6T2FP?=
 =?utf-8?B?UDZzcEdnYmpLZnR2dFBSazlpdFZtSHZHV1NXdVk1MXIwSG45ZGRXTjIrai94?=
 =?utf-8?B?bCtCYzVmZEdyV2RackJmTXVVeVBvR1pNbitiRDN2Rks2UXc4TGxhbDArTnFw?=
 =?utf-8?B?cGdaZ1p1ckdEcXQxSkFFQTYyZUJZOVpUVmNUeW4zZFJQTEtML2VPR3lIRExW?=
 =?utf-8?B?YWtCelR6NWJwWUxTQk1vWkpXT0tiS1V4RWhWUWQydG5QdXJ6WXFEQk55RkRY?=
 =?utf-8?B?OFREZHFkWVNzTDh6cjBJNmR3UUFXbFFWaTg2bHhVb2Z5Ri9RclJCUVJVWTRr?=
 =?utf-8?B?L3Q2L2VIV3k4VHdRaHcvbGdlRExCc0EyRW1OTVFlZjZ1d3hUcGVwem4vRFJ2?=
 =?utf-8?B?azFuaXczdlU5eHJpeGV5TUwyd0NQK3ZLQ3dtZW9hTDZ2cXd0cThHOTVNMDhp?=
 =?utf-8?B?U3AvT2F0Zm9ocFlZTUVNdDFvR2kza0tNWGt1bUk3cFBVL3RMMTRSaks4bFJz?=
 =?utf-8?B?clVYRGlSVlcxOTdOLzcyRkVSRGltSkQyUWhNMElKbGVSbUhERm5zU3I4R05B?=
 =?utf-8?B?eVJySTZSMldMOTlFUHdjZEdFQU0raFBGOUhCelYyOVZvRldRS1ZZSGs5cmov?=
 =?utf-8?B?V1EvUHFlL2VWSE9yYlNDTkhlTUJYYWhkdFpZRlRnb1lvSjBEVjl6dGxleFpR?=
 =?utf-8?B?UlZ5NUNqK0s5TjZSTmh5a1RYY2loNVNZZkxUZjMxUmNMSlQ1RStTK0orcHZJ?=
 =?utf-8?B?QkV1VFQwS1I2RjU4Y0dQckZpWWVUT0NvZmlzVWlYREJJalpGN21UaENsK0Zj?=
 =?utf-8?B?dElMZHY1YUpZUjRzbGtoNk11ZXpVbmdTL0s1VTBlZ3BmZ1k5SzlRU0l1SVFs?=
 =?utf-8?B?TVBiZ2N0ems2QVdsWG03V012YUIzbE5VYk0zQzBvVWhvODc1M3QvR2xhb3Yz?=
 =?utf-8?B?Q1JsVHB6Y3N6b3dWOTlaUnNwL0VTZEM1ckE0U3RPL1FKQ21ZeTlQK1RVM2hk?=
 =?utf-8?B?MFgwcUhmZmxndE1xdHF3TmxVREhuaTRqYnVmZDZLdlZJOStnMDk3TGN5Y1Vr?=
 =?utf-8?B?c0FMNVFrSzI2aW02TGJSRFgrb3J5WVh1QzFaVWJJZVJaVVNGMTd5cUZVYWFU?=
 =?utf-8?B?MmJtWjFVbDFKOXo5OGNjd2lzVnkvTDdYU0ExdnA2NU5RMll3bUxmcG5rR05h?=
 =?utf-8?B?amM5aFQ3OU1teWJBZ1V1S3hQMTl2UkVYUHMrcW5vR0hmNi9HU21kZHJLMnU1?=
 =?utf-8?B?cVBOTDdPM0hGeFVsbm9aMWJwZTR5aTYyUVFRVmlQeHN6NFhpUDRaZkxqc0lB?=
 =?utf-8?B?YTI1cVhpWTRtR3A4VXJETDZ6Mjh2RTNWcFFHNm1tQkc5TlBhaXlWcTVlUWVK?=
 =?utf-8?B?dzJ4TG44TCs5Z0FHQkMrT1hSU0tzcnpGanAxU243bXFYQ0lNQ2pwMEd6Kzhi?=
 =?utf-8?B?QmY1dm41Z3RvYUh5MDlGUUs4eEZSTm9rK1V2dzEvZm92cmJ6WGVSR3E2cXhk?=
 =?utf-8?B?NStZWVQ1cFNUU2JCcmY3enArMk5rUnNyMnB4bmZ1cmw5NFZMczBvWHF3T1Fq?=
 =?utf-8?B?VlpDamdWektxRElJOVVBcUloakRoeEpSR0dWZS8rRTU5UXIxKzN1V3VTando?=
 =?utf-8?B?M09tcjFrYXJwM2M2Q1Y5bXU5UmxyeDJwV3d6SDZXK0twdEc5TmFJVjlvMFdH?=
 =?utf-8?Q?mCLd8CMLLPSSW0N4ru?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c474f0-c310-4d1b-6ab5-08de74c95d7c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 23:55:34.0757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tWmyroc3yHeszd1OzknfAYHpquMHHbBoG3kRI9OeABT5CUU3/RJzadcWeVjGED2sQGb1FQ8VTnBCBRYqxsd5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	TAGGED_FROM(0.00)[bounces-32198-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	DBL_PROHIBIT(0.00)[2.98.90.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 96F5F19F34D
X-Rspamd-Action: no action

The board integrates an on-board mux to route shared signals to either
CAN2 or PDM (MICFIL). The mux is controlled by a GPIO.

Add a pinctrl-based multiplexer node to describe this routing and ensure
proper probe ordering of the dependent devices.

Previously, MICFIL operation implicitly depended on the default level of
PCA6416 GPIO3. After adding the pinctrl-multiplexer, make the dependency
explicit.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- update commit message to show why need update PDM MICIFL.
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index b256be710ea1281465f5cecc7a3b979f2c068e43..1341ee27239fd41a26117adc9023524ce50420a7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -50,6 +50,25 @@ status {
 		};
 	};
 
+	can_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pca6416 3 GPIO_ACTIVE_HIGH>;
+	};
+
+	can_mux_pinctrl: pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can_fun: can-grp {
+			mux-states = <&can_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can_mux 0>;
+		};
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0xc0000000>,
@@ -446,7 +465,7 @@ &flexcan1 {
 
 &flexcan2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-0 = <&pinctrl_flexcan2>, <&can_fun>;
 	phys = <&flexcan_phy 1>;
 	status = "disabled";/* can2 pin conflict with pdm */
 };
@@ -712,7 +731,7 @@ &lcdif3 {
 &micfil {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	assigned-clocks = <&clk IMX8MP_CLK_PDM>;
 	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <196608000>;

-- 
2.43.0


