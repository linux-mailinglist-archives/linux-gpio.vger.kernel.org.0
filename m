Return-Path: <linux-gpio+bounces-38039-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CJOsFOG4JGrQ+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38039-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:18:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5444864E90B
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:18:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b="zsPMUI/Y";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38039-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38039-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 249223013D7C
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93F71F91E3;
	Sun,  7 Jun 2026 00:17:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED041EEA54;
	Sun,  7 Jun 2026 00:17:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791439; cv=fail; b=QjC85eiRCysGrt/z5h42ru+rrT6Q/MKSz9VAOBYS6Edk6nESdGkukNCx/VNG4fBWaY5oFH6/aWdRVVCLzwLqVykwp5IIZHASOXvJCEqB2q/doLLc3CiWBf9QV+bADDbcmrBnhqchMdqNVnzedgEVzoTLBRLiXUPVb6bOESqNBBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791439; c=relaxed/simple;
	bh=MrM+W6eOcFSxDl2GL5tt5/kZw26kZPAu//fX52Jv07Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QPscSZz41mAKlZ15cXdFndAXEriWniFzUYNYbSNZ6of0ywNVCIcHAPFQKYW2dqaY3kVWzJQ5dGUVDEzRXwuFjGaWSgdddVxuYRiZA/ivZChiF0/g5Pzp3GxT6vk95xjRp9hLa4O+398/k4lBChBwaS2SeXBSSpVYk6NXAKIYXrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=zsPMUI/Y; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmsXUwNpJXG8Ypeiv9NKZHvFXmH2hjTiSTnYX0VCjZ8J8312tAJ9n3i1kS6VNCspNEF+0MJCFSbKu7PqV0oj9/qPm/Wr2kxVeUgiyVeIiuLOjrhT2hbk0mezy99g0f9U3mYYJ0aVhLyUTAZr8X1JwaaywQ8pGp08VVpSAtSVo99yZbfH6ZYoR0KiD7uy/WQpx1mJm3pV7Sujk1Lj8QbB1tZWE6tBdGAKU3yHEgJet8oz6EFu7MEEspPZzjunvteHfZNqswGmZSkEa/kr/neq+kDY+0aOypzTNxtIsT4AlVTcDqyOGQP163Ijhjq6I2k6zpWqN/rrR6tcY519azOSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmv5FDc3RzrOokFUxRHlDIsh4sYkP4dtEiig56W4r38=;
 b=h61uSEISHOk1ekGk91/JxuGE8lCklTz/Z569CdEMUVNKam/SHUvu9dqsdrW9+AB2DU2Ok5+HH5waKEhStU+NcCIAHoGtI9OljsmQyETTJegmACm8mgwF+zscO8NmURVlcv/Nz5og5ar/36ht9aVPAl72nYAqdIGWggfufUzy6Q4zJ5XHi360bUidV72iMzMY3RVfJYdGqwgvZVtF385yJ0sdmdMsquElEFu4pIVsy3E/DhHiEw/eqyBoX6T9xu5lUsbg6g6ZZ6+/S+3xS4vJEAcSb9jTLz/M/ka8b0HBmnuwrtdf1k1xcVjYtyYEZamSSG9J0bmeEsWx1OgaiSXvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmv5FDc3RzrOokFUxRHlDIsh4sYkP4dtEiig56W4r38=;
 b=zsPMUI/YzoDq9RtvuGjcoA+j+NFXDewuknBDTaN69eNXX7iZlT1yNpEzBxijQJCVMB7Jv2+3J3JLFaxuQKekp6Gel8S8yFEjoopfDS/HatHgQ3IxOuwd6ZqHKM83VoaGS2ia+S5TVgmMmtz41l9FTEchSKTCJam/3WswFXmCIF45IFHquAs1Jl3dG0nqPY2Kycnba039awohCVc3X9DASiD+1Ikdowiokua4ierhtzhafVqjSrm9vAXZ+rLY8jjxzo+a++3vrgu3pvSffxceE/9AUJRzLcsIa8GcDS/39gYOleEVzVhNlVzui4SI58Hq2EaJwkaGGTlOP2M1Tf4nqg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:11 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:11 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Markus Gothe <markus.gothe@genexis.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 06/18] pinctrl: airoha: an7583: fix incorrect led mapping in phy4_led1 pin function
Date: Sun,  7 Jun 2026 03:16:42 +0300
Message-ID: <20260607001654.1439480-7-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBFE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::319) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|MRWPR08MB11707:EE_
X-MS-Office365-Filtering-Correlation-Id: ac338b7e-08dc-4655-23fa-08dec42a1e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	GaSzfdL/a5mrCC6cepGYc1qN/PzbRziGfzxMk/kOJ6gWNZaePtJ9X+wCiyD3mx+rjWcNBypL6AAeOldf4wjJkq4lJp+2FOs1ddyZMEWeNJ30Q3xeLULr4KnYdONhr3Xo3z1hmnlY2A/alfTtNimzh8eHeTq52IZx2MZrdRylkK3TYDwKtOX0jSqb0PrONe9K8OOHtxKAGnOTA+365Ra5Rc2VpulMlSPMV78oeYwAy4Zukv9ncVXf07JANuzhhjk/3eV4wpwyf1Q3oSyn8RcGMs+T79Z4soH1HlkixbBQ7aLin3GOGoMrK+yUW8IOAL011i9CQCvQ5CMjQdGtyme0BEVhYy8a7EiLWXp4qiv6j/SdgS7CDiMqj/etyLgqVaC37PmwqKg+IbaqKySZEi66RkPVDWomntPkpQ7g2xv2RMjAGKOT7GiHyMOYN3vI9GZqNDEhDOCGcWWmCjmPG1Ug9LVA5C43dlv89fzVVUtZBmRQ9LQKVJ4NJkfqGMYMFOmFnwM6x+/cmu+0ze5a8Bu34rhcoy1IxrifaffFoakDMyNyoHLPi3nZBblIr9Jm1N0Le8f3rePK9gdUFb/MMPZ7ZarEgUJ8thPv3Uwaf4zJ5w8Dv7FWxAKqhTIBe0tL3EcHF+78PnIqkP8QT40SqR1XokvHBEDVYispAwENfY36/J6O0DFqmtW8A+Zw/0ZyxeX8OVnvSZ/aBKdTx5qnAcptOXEaFyZvO5cLMfJNWBXOpr2yfeEEmdcFLMgu6sCf7c/nnBPq4/OnHidTYb44olAyvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H11NBRfBNeozG3uFnmTstc0paNs8JEJaG6ycRv7c41GQt/sN5ccxVT2hZulJ?=
 =?us-ascii?Q?s0A8GMSKnfSMDwsxBZpfAB9gDm7pzFz0OyAkHxAr94H0lsBrqmLTcCZyrL5V?=
 =?us-ascii?Q?hVFhG4Fw99UxOnMVFVuYz59Wl36Yw92WbCW3ISIV8p1t1mgHlsobUpaYO2BF?=
 =?us-ascii?Q?KZahGYO0lMQuEt2eKBRUOswb65jQtgf5CDzVYUjjGMEc66A5he0WJDjVxO/t?=
 =?us-ascii?Q?ATjoZ1dGo/ygM/dFpPGtfUvVUsqG16rnsuspZ9l85cj/1vzEiFLF3mCCTMvm?=
 =?us-ascii?Q?6IlCiJP9Vk42FRhCyEjWrBcyR+wzyLOxXO8OBYLCsB2IJenNdkPKY1hax9lT?=
 =?us-ascii?Q?MYa8/7LTHIHOFZ5Lv1fhveIVEnpIAHAZ+s5lk+xkoyDr6SxfsuKompHJ6FUa?=
 =?us-ascii?Q?cTG1YmK9XgMgtwT2oHGiptEFW9cHRWFjWk/39W6cqfBwwOw5F6yNeG0gy6uV?=
 =?us-ascii?Q?sb14K588+JTBpFXRDcslsYikFt2++YV4HUI99LPPvnwAoMNoDQDlVg+xfITn?=
 =?us-ascii?Q?xY4ugDh5c7z1e5XtQzN6QT519mn+L+pYeI/DIUYc3BV8ER9Ae/Q5jQMGPzN4?=
 =?us-ascii?Q?l8WTolfBaiYTraGCIsVNAqs8ZxBYAL9PZOdX1XVllhQsHgco/o3pnrTfWEeT?=
 =?us-ascii?Q?i7UYhkkQWuhtz2sKppooujqFHEdGWVkJPIIxy1De931kSVzQf8L10QFtgkOo?=
 =?us-ascii?Q?i/v547tidRu93514WaG3NX0D4F62dNeUah/U/pu80+PSza8yL3O43+3IKTOv?=
 =?us-ascii?Q?CFD8GchAYm+HuWWoj99wSkj5GSLNUABC9Us9CXTh3g+0CpZZ7y82V9kb5Cnl?=
 =?us-ascii?Q?2DGykJoUi28mxI71LHpSfvev/uK3hQTSsuxZPS8PY3xw+0poapzOJCFHqrrt?=
 =?us-ascii?Q?yDdZlOL3YWwe0F0oIuxbe/GO3VbZr3g7aFTiG4Ke2JGmOj0KQscykzkr6z4k?=
 =?us-ascii?Q?C+1njvwI7ZVF7qwflcIGvHs6gf0cl3Z9a1Lff5rtivhohEA2OddK0iIbnCQs?=
 =?us-ascii?Q?LENvwsCc6zUJJLbb4LfrYV+gtL9uiF8tIuec++t1+/sZLzsCmq5+xiR0Pq9/?=
 =?us-ascii?Q?TdlnrT9YsFpxx10dJ8G4ZEkpeDC4kGj8WjlpGzGzfq91Uyfb8t1R3eHxNcLx?=
 =?us-ascii?Q?l8qSfQlsjHLv4hVmTpFDpYg0rRSIrlzJprLc4PGm1+/E8b1IBwwF4bjphtCi?=
 =?us-ascii?Q?UDvl38FiV8kw7PULVwI8f2AeJA5FfwL8l+1i024JZ+gl649a0vXWBYuwV3in?=
 =?us-ascii?Q?qYd41a16rQ2YhK1jK9TlyoKzvzS8aKtCYzhKnyt29WxQsYOYupWCJ7mN4qD+?=
 =?us-ascii?Q?fEz+nKPhIPljI8/iviIpjCPGTV9bEOungVx/W+uBGn6mWLdYx7X4lOiLN+Ke?=
 =?us-ascii?Q?NfrG3BAYykt0Nu8VwAeJt1Kh2FWZqxMUGhSJsFb/+q56Xwkjm5cKxG98Ep9t?=
 =?us-ascii?Q?6q1w/I/Mek3zcnFbhpIHOn4G8N2piDgNoHrMJApFs6JEiE1nji9U5puWxEFd?=
 =?us-ascii?Q?vxMn+aDSK94qjo9DIqNrVBw+VW0BYuJuacQACctzckh20tyFn4SEUajIt5/R?=
 =?us-ascii?Q?120HsKRr2VqszJhtwj8rl+9WIZpycuKq68cglNpkmbmjRgGaOZqddAOcXeuX?=
 =?us-ascii?Q?Q+JGvNCo3AY6UBxnf5jKeFD9Cd6SS80wvLV3R+Z+BMQByuyNJF3GdUskEGSd?=
 =?us-ascii?Q?K/eTU7NCIY6vA5SoffOYfiT7iQGc8qQBDAnLeMOaFw5lclgFwKBHQBvdGBpf?=
 =?us-ascii?Q?rL89tRalxNlMUjodobjoh1BCjAOBOI4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ac338b7e-08dc-4655-23fa-08dec42a1e61
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:11.1854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iaV7v4LzTf29viX74gxRTLUsotV2NTRSR7BwjccnmLHui+Uj6dCSqGulJdyBrHVOdGy6frlX/KOmEJpPPpDLmd59XbZZ5N00Si30aNVB/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38039-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:sean.wang@kernel.org,m:lorenzo@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:brgl@kernel.org,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:srherobrine20@gmail.com,m:markus.gothe@genexis.eu,m:mikhail.kshevetskiy@iopsys.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5444864E90B

phy4_led1 pin function maps led incorrectly. It uses the same map as
phy3_led1. PHY{X} should map to LAN{N}_PHY_LED_MAP(X-1).

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 9497f5110f61..9be759f08b18 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1710,13 +1710,13 @@ static const struct airoha_pinctrl_func_group an7583_phy3_led1_func_group[] = {
 
 static const struct airoha_pinctrl_func_group an7583_phy4_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
 static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
-- 
2.53.0


