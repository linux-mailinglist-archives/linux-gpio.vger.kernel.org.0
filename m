Return-Path: <linux-gpio+bounces-35420-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H3+A+046mnYxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35420-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 17:21:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BC9454390
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 17:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A280D30B0FD9
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 15:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3093E31195B;
	Thu, 23 Apr 2026 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="ikoLR7fo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11021095.outbound.protection.outlook.com [40.107.167.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734262D0606;
	Thu, 23 Apr 2026 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.167.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776957274; cv=fail; b=MrG2S62XmznpIsF1f9bd7O2Eo8FL2OvmdLErGP8w0bT8aESnB9tSy+eeahuqyKK6O7Mlvra2Wxrb7iCAxyRV24lsgUlJ7UOZsje431x8rTffOFAty7v6GjCJZ0pOm9WJ4YYYWvPg2pzufHg54pAHXISQlbIA89FH85xzUSi1h7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776957274; c=relaxed/simple;
	bh=t3+Lgw0lV2i0vI1B+rUu5EPvNnmO3BUmn9oKHOwsUv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qH7Gh3VODcHGGcZPKIy/AWIquEH6wZOaJYOdz4RPhhyABRJyKb4DE+Z7/td72cB+o8X87dGy1tkD4xyir/1BlJMP7+mWFIZpC2Qj1ziFKnPMF1paBdYWWmXO2CpajAwjSyXQwB8lTWTJnzStwGBPc0H+i9mrDUd1agSAwukxsZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=ikoLR7fo; arc=fail smtp.client-ip=40.107.167.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1x8AqqBLAAm+nYHmGCfs6jeYt5VKuxHcyK3hHP3ILdlmxVrmWbq5kH76ntP1MWSRnLJwIgfJ/yEU6apvpkcqB7kFO/EnO88DDRmPxsPoZd0RzU72xZp/RCdbW8Wf3HVcHbQeYCXBuQza3TILhlBiwV+K1GXh63ySDtvG11gsB7zChswlHkW2wrlcrYegC7MCUsEZtoUpOFdMom9gwAo53sa0aJOJtlF9JjVCarEUXZ0FHOjJEBDHtOmQO8HLtHnDUI8h41fBKXS0MtqIDrmgH92qlUs3xkZBe8oU8IQ/PnqpeA1utzXcsJ36tQC5eQMA1ik9zoNLiMsgcHZQuv1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3+Lgw0lV2i0vI1B+rUu5EPvNnmO3BUmn9oKHOwsUv0=;
 b=JkM2t5gwzlrsQmnCKyUvMjiAb4wI76igwAeHy7PLXMRCKMAHraHM4i+HVqFsZkz+1R7blQ2J0NxpPXkUfx3yJTEszFocVIFS8glO6vXN/qy6BVzgkaL4zxF47H9SbgWabPHsYZ920Og4g+R3XapVlA4rXW37hqnxleQIIveWUFpjLQg79503CVzGOlhRXACQ6TDrSMG3vxivoBnlX/X8qi5Nhezp7XO+UgXFQPE+p+VvSZDbMgJEnEx+sQlXwGZ9rlHmt1qZIzKQDzzkfIHfPZLdqYudrTeM32RqNGRNNqECK0kns2BpA0NVA7ldPItlMipQKllDl8PXDhv9nB46xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.86.4) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3+Lgw0lV2i0vI1B+rUu5EPvNnmO3BUmn9oKHOwsUv0=;
 b=ikoLR7fol0rg+MO9bb290WXzxFmQOS213tPUhqInIdEg/kOe7GD4gmuJPmVJEOjjix6rOVb9TMpmfelXIknpmZrScARMCAcB+OhhjwzzCOcG0Ofut92tgx2X9HyEpNSRl42KOn2b6IXI/WxjEWthqZPXYlQJqMuzAPUk0ac2gdQ=
Received: from DB8PR06CA0061.eurprd06.prod.outlook.com (2603:10a6:10:120::35)
 by ZR0P278MB0073.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:18::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 15:14:28 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::97) by DB8PR06CA0061.outlook.office365.com
 (2603:10a6:10:120::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 15:14:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.86.4)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.86.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.86.4; helo=GVAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver01.de.seppmail.cloud (2a01:4f8:a0:13df::219) by
 DU2PEPF00028D02.mail.protection.outlook.com (2603:10a6:18:3::6ba) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Thu, 23 Apr 2026 15:14:27 +0000
Received: from hz-glue01.de.seppmail.cloud (unknown [10.11.0.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4g1fl72Wycz4x66;
	Thu, 23 Apr 2026 17:14:27 +0200 (CEST)
Received: from hz-glue01.de.seppmail.cloud (unknown [172.18.0.6])
	by hz-glue01.de.seppmail.cloud (Postfix) with ESMTP id 4g1fl72DRBz20YK;
	Thu, 23 Apr 2026 17:14:27 +0200 (CEST)
X-SEPP-Suspect: 52b336da65f844efbd8aea93dc9be139
Received: from hz-scan07.de.seppmail.cloud (unknown [10.11.0.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue01.de.seppmail.cloud (Postfix) with ESMTPS id 4g1fl71j6qz20Xs;
	Thu, 23 Apr 2026 17:14:27 +0200 (CEST)
Received: from hz-scan07 (localhost [127.0.0.1])
	by hz-scan07.de.seppmail.cloud (Postfix) with SMTP id 4g1fl7185NzmcT;
	Thu, 23 Apr 2026 17:14:27 +0200 (CEST)
Received: from hz-m365gate01.de.seppmail.cloud (unknown [10.11.0.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan07.de.seppmail.cloud (Postfix) with ESMTPS;
	Thu, 23 Apr 2026 17:14:26 +0200 (CEST)
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010004.outbound.protection.outlook.com [40.93.86.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate01.de.seppmail.cloud (Postfix) with ESMTPS id 4g1fl53RdPz2xNr;
	Thu, 23 Apr 2026 17:14:25 +0200 (CEST)
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 GV0P278MB1144.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:4c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.21; Thu, 23 Apr 2026 15:14:21 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 15:14:21 +0000
Date: Thu, 23 Apr 2026 17:14:13 +0200
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, wbg@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] gpio: add PMIO support to gpio-mmio
Message-ID: <aeo3RXm2xNZuD-bO@MNI-190>
References: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com>
 <CAD++jLmFudox4+zThr5bx4aAadrpdkYrNn84eORhbU_t6gxZvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmFudox4+zThr5bx4aAadrpdkYrNn84eORhbU_t6gxZvw@mail.gmail.com>
X-ClientProxiedBy: MA3P292CA0060.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::19) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|GV0P278MB1144:EE_|DU2PEPF00028D02:EE_|ZR0P278MB0073:EE_
X-MS-Office365-Filtering-Correlation-Id: 794a3ce0-8443-463d-2d5b-08dea14b0308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|52116014|376014|366016|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 xSGC3adjZk+Z03F9pyJZQDaypunHhYnBj04BPCl9M/c4D1OPPZfydzKMk4O56Da85er2FufHGXljUVNL58naE1osXP8RL6IjCw0BHeJ1/ufXDc/Ev+pieLxf6dmIm0f1BSQuF+c6MrTqTMvUhLYbEF04stV711kXCaFPDVP42BxGxtG0nXo7X23QYNqeTV3yS0TQVslGW3O1ajeqoInv8WQxFI8edkepwoPaDO399c5UNgM4AAQfWl5/CBq5k4biFhmLpuACyy7CM6WgVgr6yCjDZ5WfWIY6OCoWk+8qNERZxGP8YEv1ApWYtF+eIHGR7HRYJv5TTexksTLBtv/JopQhje2ElmNv6pDJYa3gwstP4KzxFnp2ZazLhoIWtwO8InAeaatrcUnyW6TQPyP2bFOiiK7Xc2OzrX7UIhQpl7NuhENTqlycGdF9GhrOoJa6XO3nmm/jCW7apJGE5Apnd1Hr70nVw53rwyvBgA4rWKSLYxI0rU7PYMr2FR+HuSPJSKImNgGa0QDZCpDFOO5pm3uXWerxqElLZTV0Uu6KKT4DLarXxeLiJ7kDSCwYxbcWXLbevMzILD6E7VwwFk/oPAkB42gVGswnWJe9vgCDsJ106M6NReDDU3ecu4VWrZgRz5RcL9WibDEj7UQXrdak++o8o03L/cn3vrG9xkUiluggNzNIw3DhR49FvmDSmqI445AVsQrRyU2JKoOO+in6r/XoCrYDFTGAI33kU/LDMEGkyoHFvPG29kEBe7WSuQcueUSe+Y1c6KZ7is7yZABRPAnq8PuiCRQWiXvqkqJM6JM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 beAIcsyvpy6mEpD+Ms0ixwpoTej7uo/Ve/k49BYz/khIMcdIS9JEhkjubL7miuJ2rpr+6obtTND5WsMlBhyWGYwSUd8ltbVQV46xSj1yWe0k0UaynSLvINjei0RBuGnZLwB6Ek25NI8Z3O361KkDjLeRCP5IKQNmamvQ2vxcnqdQQBFcVn/JU0/JJgVogZfPae5C2eqcWT/vI0bTdZL/RskhP5e3lzfhS7sWDriCIe18gYQIlFvEBCXrhtEmU29PBGlrhk2vVpLa0BySkhxHPPtiSq/FuD8o/giasLZAeXGYTwwjRgbMvZ/lsdf1tH+WxFbrM94CfCk2yxO8Zqe31g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1144
X-SEPP-CCCVersion: 2026-03-30T09:40:10+02:00 639c564b
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.86.4];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.86.4];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45a95ea0-7c8d-4470-0ced-08dea14afde0
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|10070799003|14060799003|35042699022|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3JzRmk5RklxZldnZnMrTVhObDlkZmFrMHdKWllUZWt1V2haQU0rSWQyOFh6?=
 =?utf-8?B?ejBaR0w4VVVrVjJPSzBUWjNYTFp0T0M1QVFBdm8xTGZjUDZYenE0VkNZQkhN?=
 =?utf-8?B?ZWt6cFJSRUh5R09KQWtURTBYZnVoRTJEaFdqK2Rqa1dCK0VQK0JGbTdpN0FI?=
 =?utf-8?B?eTdqRXZhczdqUGFiTmpMN2grUkFEeDdNa24yTEpiQVRWTHJaY25mOVYwWkFT?=
 =?utf-8?B?K1NhSlNsWU5pK0txby9CRjdQdnZpR1l6WUt1M0pnelhHc3BISnFCWjYybnNX?=
 =?utf-8?B?dzdMcy8zM1NiaWdOQThXR2NvcE5PQnBkT3ZYSkdvaWh3akpPNk1SZWN6UmtD?=
 =?utf-8?B?SXFERXBRTmFvY1U2UVpkMkY1MkxlL2doYU1SQkU4ZzNML3VtbkxjTXp6QTEv?=
 =?utf-8?B?clBCUzhIVHoySndDRjR0WXNYaW8vUjh1OW4xS3hGeG96M3B1SnZvNFJlMW9r?=
 =?utf-8?B?MjdWUHp5ZnczQVhQaVpNTlhhVENpNGRFUlk5Y1VPeTNXSzFEVGNpUkV3c0pC?=
 =?utf-8?B?QmVwVUs3Q1pDWTlkRDUvQ3lIdGFKcHFQOUZDSkJhOFozVUVnQVNLOGRNYXZ6?=
 =?utf-8?B?b01ueGM3RnZDdkVYWVNQY1FuOEFUUVRHTmpPK2J3ZGwwRU43TERCZno3OTBy?=
 =?utf-8?B?TXhJUytKQ0dCT3J0TXRhT3ZUWTVLVjVDd3VZMkJGd0lBbGkzaXJYWkhLc0dD?=
 =?utf-8?B?cTExM1Y0V21DVUJlMG9IOWVydjFidGN1QnBtU201OVZCSlNQWkNyV0tVdS8w?=
 =?utf-8?B?Y0l4OElPRU9wZXFjRm10SEM4cVpqdjNCWXM5RHkzdWpzQXV1N2pGZVRwUytB?=
 =?utf-8?B?azliYlJUMzl1dENIOS91eURsYTVoTFh4UGFobk13RkRnRlJuU3NIMHJnKzJB?=
 =?utf-8?B?TnVwcG1KNDlLWUVHdVI1UjZPaUVpR05IMklKcWp1NzliZUY3YmI3ZkN0WHNu?=
 =?utf-8?B?Ujc4UDZlSEhQYTFUUVZzc2hLMWhydHl4VHR3T3E1QlFHUWlXSk5QYmFKTEo3?=
 =?utf-8?B?Z1VwV1pqMXVlV0Q3ZzE4Zy9laXNJcWtYWHdud1gyZW50c0RmNzVwUHpmU2lW?=
 =?utf-8?B?ZjJHSmd2c2V0RC9Gbm94K0RHdFhrcTZBcnZtV1dPRzErMlpjdVFoZXE3cDlQ?=
 =?utf-8?B?ZmF4cm16QU1qck0zeWwrdGozY3VDTXdvbWVXYlUvMTZYaExERWxTMjRVSk1G?=
 =?utf-8?B?b0JTTmFEWkw0NlgwVWVsK3ZHdVVnZ3Z3TjBmTitIKzY1VW8wQ0xaOE1UbDhT?=
 =?utf-8?B?L1FZVzFxV2lUMmhvMTdvSWhvbjdCMXRIamFINHBTVnMzNGJUR0kwaHBSUWh2?=
 =?utf-8?B?cTd5TVVZNUIvRmszM1RBSHppeDJjeU1WTTh2bUZwQ3drSHdkaDRzT29zZ3Va?=
 =?utf-8?B?MjVyZzRxalhLZDQwYzJpVE1tOHJnb0k5UlNCVXhMN21GZ2FxN1g1SjUxZFVa?=
 =?utf-8?B?ZldZc2s1S0Fpbk1FTnAxaWZmSi80d1dlN0Z1Ri9JTkVvdGkvNFh2SXQxc3Fx?=
 =?utf-8?B?VlBXNmxtcXZTemxVTFRVeFFacUpOVDRFY3hwdzZGWCs2S1BGaDZGM2NFa3Zi?=
 =?utf-8?B?b2F4Z2QxWHpGQ3VoSzhRTGNTV2tpVmR6UDZ6ZVJxQXJVNTZQUTAzU01sSTV4?=
 =?utf-8?B?dUdxeFdrVm1ld1IxdXlxTDNTYkZKZnR3Z01oVDNQaktwTkZTbElBclNTSDhN?=
 =?utf-8?B?RVhqK2YwZUV2b0RpZDZEa2draTRnZHRWK2t0NU5iNVM4OGdjUDRDbS9maGU2?=
 =?utf-8?Q?j1V3+tcodn7roONHgdm3AAMH1tSoLOV4W0RcTEw?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:a0:13df::219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandwestazlp17010004.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(10070799003)(14060799003)(35042699022)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r+nsU5sHIAdnzcpE4noWRm6KpQT/eB1J58ci06RbgGogbk0lAOE/LsorcrGngpUUyqucp8hQTDj9N9Rf7Kwq805IzBO3Oom/2ESQF8cM/8uUhmZszkUU5k+v4Sb5b80V7ZuQAsItk4tvu2SzI2KyCPX9eo6XT3H4fV6agUoOOf2bN4fci+SEe4sWDsLibl3E/DjgNPOlUOBiEhtzk1CNqhGgbA46JBfWTbOaT7vCII9ZMSIyPro0Wz/5DMJXvHagA9t5xtIxwj2W1ORSHmyu38v/UdEOJL99XfHMOSa31I+s1EBz3WpwXcqwZWOrgZNcHbgWYOZ4vhzlvYm1AVvGDagGgOH39tUGJOT5od+xJx5zGVa1E6PIjaAq/7DeAceaD5iH42Ki+heHmTP7Oomu6YJgyt6ioDhK3tA6Ea4Ovy1U3rOOtCzHYGvARXlX5T5Q
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 15:14:27.7457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 794a3ce0-8443-463d-2d5b-08dea14b0308
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:a0:13df::219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0073
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[duagon.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[duagon.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35420-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev-josejavier.rodriguez@duagon.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[duagon.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,duagon.com:dkim,duagon.com:email]
X-Rspamd-Queue-Id: 40BC9454390
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 06:44:37PM +0200, Linus Walleij wrote:
> On Mon, Apr 13, 2026 at 12:24 PM Jose Javier Rodriguez Barbarin
> <dev-josejavier.rodriguez@duagon.com> wrote:
>
> > This series is an RFC for adding port-mapped I/O (PMIO) support to
> > gpio-mmio.
> >
> > This v2 comes with all suggestions done by Linux Walleij in the
> > initial review [1].
>
> That name! ;)

Oh, I'm so sorry. :'(

>
> > For keeping compatibility with gpio_generic_chip, a new _config struct
> > was added instead of extending gpio_generic_chip_config. Using such new
> > _config struct, called gpio_generic_chip_port_config, requires a new API
> > function gpio_generic_chip_port_init() to access to that new structure.
> >
> > Besides, structure gpio_chip_reg has been transformed to union. It reflects
> > better that MMIO and PMIO chips will only use one of them, saving memory
> > as well.
> >
> > I'm still sending this as RFC but I don't know if I should send this as a
> > regular PATCH series.
>
> I think we will usually only merge infrastructure if there is also a
> consumer/user of it going in at the same time so these patches will
> need to be prepended to a driver patch.

Thank you so much. So, as far as I understand, my patches will be applied
once one or more drivers use those changes, isn't it?

All this started because I tried to provide I/O port support to gpio-menz127
however to apply those changes I have to add other changes on drivers/mcb
first. I'm currently working on it.

I'm aware there are still few I/O port-mapped I/O drivers so I would like
to continue with the TODO "task", trying to move those drivers to use this.

>
> Yours,
> Linus Walleij

Regards,

Javier R.

