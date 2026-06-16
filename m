Return-Path: <linux-gpio+bounces-38546-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XF17E0npMGqLYgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38546-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:12:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4340E68C64A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:12:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=epnkcv+R;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38546-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38546-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 74DFA300A276
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A283DDDD5;
	Tue, 16 Jun 2026 06:10:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020111.outbound.protection.outlook.com [52.101.84.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AE13DDDAF;
	Tue, 16 Jun 2026 06:10:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590255; cv=fail; b=I0NcJg4MYvWM0F8r44K+aJECdVcY60cCVIrzRb+5QIUUZRfRo6K64uhikQ75KKOiSHOUJJZabic5F77rmKItdoDX4ugcDIjOj+TIa74tqO3oIR2HP8V5sVPZUhB/VXFHyyHvFhgmubGOB/vUYFphVPWKoD85CKW3xw6WvQI2/6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590255; c=relaxed/simple;
	bh=F7uOMu5g6L8kx463LfewCI5A9qB6S0ydX0gnARA/LqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZpJbt9UfSvuMh5vJ+qIOaEYqid2D9e/W8axIb955i73XEzacFtX9k79224vJbui0qwvMJxeqMDCKIX+O7mvzaJDZEVpuv6FJYNLuBe0Mx5GlLYCaSshl2QxUfO6Ik8/7don11v5Tbdxtta6rN7TD4/C4B6YZXovPHpHaSqMKRY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=epnkcv+R; arc=fail smtp.client-ip=52.101.84.111
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooXCYR6tm3lA+qlfMDEnFVWnoThBGFtAOfBq1PQY61t2ZMdpiivTn5eYepoJjDwSz//WA00tSL9L+oIgtf0Md5SSRuoE3RQdr9yNJMojlrVTzKpaghBAh4vW/Sto3dqbpv1r/6/sH9XAxytL/2kAX/oTXEHs4FBmEtQ4aJD5Tk1kdvMlM4CNRejmXaEX1mJkE63qunmIj+90wGm05/Eil/GypnCDtAvytzwNWq1wVl8UOg7LMp5NLF0zhjVdeGYmnAc7Zid1UdoSqq4x3PsPIhSxsrxd11z3uSdfJTFwKUNcI3kW2ojjGrZHIBCvJBQI6mqHQseyizBwl9nW55lZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRl4JhRWGG9IRIBG1ijT6yvvJBwPuohaxmZQBwjwGxs=;
 b=aBRg3mTphF9OMYEekebEaPhfrYOZqbbVHEh26lQyar3ogdTRkzVOIqbB1bItYxcHPL83tdmilknG/fwKyEysn9pwEUWYZGWLTiyqsU9JFAD44RUXZv4YWCjyjHpVkU7re3IoMTIpwLyfjLF6KEbpPWJ3sKr+j+kwmzYCQu+GDe0RaxFpuz0yBuq/KQ8kUyeQU7Xwtdl6CM3MXOvCY0hLtoAhtyk8bAFH8XZp79JyVGKDCssUdf7jR/Q20gk0kbhapxFAd9Isxjmu9ppYAp8v6NpOW3QMAd5nzW1u8vMg0qDRPu6dvm5kCJqydiQccLEC64K6fjm9wO7DCuTcVI1RWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRl4JhRWGG9IRIBG1ijT6yvvJBwPuohaxmZQBwjwGxs=;
 b=epnkcv+RNpvBk7dBptSIjyR6igewhSAqeKBV+MGmdh4QeAs+cvUQBMUCQ5u3QGo6DD8bBUnUYZQ8VSFUN1hc7K2KXw2ael4OytSgI2IG8pIUwSAiMy5i62tLYtHUkCCQzF1N5UdNl/oviVM33Jeir+T/QemzkK+mUurqrtROCsV36+GNr7Jnop2MtwtavtnvRuSPHj85PLG14pLm4muN6zNuFgLGcMImzNsbALiswn9ZTQQytu0rZEi9k+LciosFHBvaE1DRd8tjyM3ajcTy1DhcWuLAbEbq0cegEqR0hm7C+96LHvf59TjQQsMp4DIsxlrwbLF6BZRCHSXXTalYTA==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6206.eurprd08.prod.outlook.com (2603:10a6:102:ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:10:47 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 06:10:47 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v3 06/13] pinctrl: airoha: move common definitions to the separate header
Date: Tue, 16 Jun 2026 09:10:22 +0300
Message-ID: <20260616061029.2630777-7-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616061029.2630777-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260616061029.2630777-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF000167ED.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::672) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c896ac-beb6-4af5-6318-08decb6e01b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	KEF9CekXRl7B7zciSGPSIZvn6rDHXDQTwRFhPNB4ylcBK5den+d0NiqFOm+Z+FlXdXW8iJAyEIX3yt9BvJyUiDh4dIqMlSPE77hnXHXF5F0uejrRAnBKNwgXMcwUT1/UkQDNT1tHLOqP7L9KlzjOpymadp6S4CrZww2L3736oTfs9ecB4LRQbUbN8eeGddemGw9xZvNt7jPbfPerjYeRwz6CcGf5lBVs2qv8cD9HjpgzYInmzamp3I9A9XgPoyfFU0G36XiDXgVA8cFQ/dgjEZZIYQppt8FTJ++AmDiTu1CbYugtkmlupkkluSjYzqVXXYUqRHK3Dh5nVK0OAVKSIX6dzw0Em3/Nyv8QeshlPY0BSzz37AZKBGUQ1KkoKWW3IWlOtOmW5rIjEzDyxNwMxVZQG3VXYnkgiTylsjiprecEoDRW1eHAbPvqiehnKjjjvBSPXfVDXaHekMmDlFiHBx9RYJV+TdE5GrPuZI8u2U5sBRU/Ck0w6wNaJ2MmSwyTn2ktYecoZagu4KUywDB6ZbNZw7+Cgu96eGOZPUTsQjui+MHugiQ4FvaeVz0IN8B7bzVd6/YRKKrvppXMNqamdmg+2pekqCTAtEAp4sjLDMlZwfUg4hZnnAzLvL0SHNp/Y18xN46fuiONQ14U3o83JqpAyEgQmoJzqAPGzTYbNAgnajkDq+QfUr3kUhY2FREZNwkeuSSopkx/cd1ZcITyE5MqjPSQmmgnx8OZuZFi/umcV0ZoMioJw/hYXYzYjWIT+qkHoP3Jkj7QWI4/BxvRxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XfcqUWMG8e1QMUFu0oLA4hJztrCXEI74MO4EFOxqvvMM4u71EI/0Be3ndMpx?=
 =?us-ascii?Q?wzLpFsEwAtxOAauWnecetmEJDC1bjA0nxHnumBBJPD2E7mEfuYD74jn3MtiT?=
 =?us-ascii?Q?BhXjIn7YkTKJK8aMvuPAKgkQlDHkah7p+4XcAYBQxnPKVfhzGwdZRvKBjeP1?=
 =?us-ascii?Q?RM3p+ue8OiseaXr957UPG/rOfIOhcHc47WlTWm2qXaRnziTi33hmhrDuu7KT?=
 =?us-ascii?Q?N/0/3DFEIgRGWZlLHPNtQ4auu/7ClkNsGEs982P7ZpThfuPiCUGlNeJ4xAaq?=
 =?us-ascii?Q?/ijwGS6jfUBWItC8Z2/bBDla9xyaB99g7gTL1wiaaiXwpY8xDsLL9qL1R1c0?=
 =?us-ascii?Q?QyZ6y9batNEMO2XyKCjZZgsyNuE8qy8oQxdsg3b28xZlJ9h9w57LyBxqm/B6?=
 =?us-ascii?Q?OCrprGcnbwyfPST1jEQebPvDmmlN8ttRIrNUQqkhkEDrVEpAtebejLA6ljZo?=
 =?us-ascii?Q?kDJLVbvgg/Ei6/eNAz4N9mB68zHkJfZEG6IZ2aSolmHlzwc6ZiyYYzZRXNl6?=
 =?us-ascii?Q?mgGiIVdf+EQdCw6TsY0Qzzwtx0oW/0ZmrpN8LDYTYz0NHeiC3qZlz9YKiSUA?=
 =?us-ascii?Q?iNd2Sfk4/zVJjDt1tvz0AQ8/pF7PfOHirkt+mDxAW27RJDL+5wJLDYY3PCPy?=
 =?us-ascii?Q?xbhFRN1wzv5YmbV2OdidvU3nc/eF7zjc2A04fegr2nma8oGBfkoWOLVKAE1D?=
 =?us-ascii?Q?3RIC1cqY29SjVm0zM5nCJDdbrt716QUVp1b7zd3zjrGqJZIncaEZQYdBLdIH?=
 =?us-ascii?Q?jJjdYHyg+4RSTcaYMz74hZoLknF2j16tAoRKdp61plzHbechHlN9qdGDOwPA?=
 =?us-ascii?Q?sybK0/5OBv0YKuyYMgBMsFN7xLmOUfhEKew/4SF4bbQRkN4j98M37VuFgK2c?=
 =?us-ascii?Q?XHmzej3ta6H+pRvqsCFQt6SgiOymNPNXPaCBKf+Xx8k2rApn+GuNK/ZcqWYz?=
 =?us-ascii?Q?0PM3vLX4fJrwH0EOkeypKxObbm9q0Zec0mzhxvPJ0rAd72h5uVMYKhVTmylx?=
 =?us-ascii?Q?TAyY5vKp/6zN7PLdnoj+u0KFEIL4+uH7tdPXKYgWjthecObwjBBqjd1zaABB?=
 =?us-ascii?Q?NeNLI7Gyoqt+RZcnAFmkzjdlJOFQzMkHwRH/PCeGGKq25JhqC2AEJw/O3ku1?=
 =?us-ascii?Q?Bwo6/5eCjOZJblblwU/3kmnMzXmb67DhT+0lpBTB74+X3Q3OIqyHow3Wrx5x?=
 =?us-ascii?Q?RWoncsCk7EBMU5ifeh/uypYRg9tL7RwaQ1VLMxXi5mFCUSxeFzvE4GnxaJru?=
 =?us-ascii?Q?Cwbftd/WxyhDOpj23EYr7IBb+3cAsLwrM98vgE6lxXPSFvoVa+++mGuhdIP8?=
 =?us-ascii?Q?YQApL3f2LptmjWYaH0TSfJMcSDsW7LD/5JyfW/vvtG79x8UJRcPY6kNWo0j5?=
 =?us-ascii?Q?gDLdCoOsC5skWTJOoIY/J6si1Gc7mgLyZAr/6aLcntnm7su7BKxHA7+Wtse9?=
 =?us-ascii?Q?mJyJiTejciPr3x/Zz4IjmzdNaMQ6823XH5i58/qvcPNTkCOs0CGXb0+hpU4Q?=
 =?us-ascii?Q?dAQsQe2NLT5nVgLMhNDiZW0n53YGL2fvbYOyn9FN++mGidxwG66vomWtcGj7?=
 =?us-ascii?Q?1dY7nLXPnlONJ8vs+nz2LvPqQfasihLcK40Sr9ocTfI6wByllP+MlA83FzuH?=
 =?us-ascii?Q?0VJW4jbzNvz2Rd/g8xVqzXtwL1wTkGwqhVZiBudhC/y76tRwX1XxviBsi4eF?=
 =?us-ascii?Q?+ODH+02s3kKl2QSEzl6N5Nhcn+6W2MNawADZp8jLbrQcSvSm76tMODRxHjTz?=
 =?us-ascii?Q?fJac5Rszj8CE/nC05KzDm6RrOtBw7zc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c896ac-beb6-4af5-6318-08decb6e01b6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:10:47.2225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFqvbRDC+knG8suZLHVs50YeKO3TCA4UhNfodi29bH10VrP8a+FYU/YFzKzEfUk0ZM5a58a687T4AhlRAz/JgjmOU5kl7d1mlz09gysBAzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38546-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,genexis.eu,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:benjamin.larsson@genexis.eu,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,genexis.eu:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4340E68C64A

Let's move the SoC independent definitions and declarations of structures
required for Airoha SoC-specific pinctrl drivers to a common header. Later
we'll have several SoC-specific drivers, so this step is necessary.

Also move GPIO related register addresses. It's not changed across en7523/
an7581/an7583 chips and will be used by common gpio code.

We will not move to the common header file other register addresses, register
bitfields definitions and macroses that use SoC specific information.
We will keep SoC specific definitions inside SoC specific files.

No functional changes.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/airoha-common.h  | 201 ++++++++++++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 388 +++++++-----------------
 2 files changed, 315 insertions(+), 274 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
new file mode 100644
index 000000000000..b0c48653a0e2
--- /dev/null
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Author: Lorenzo Bianconi <lorenzo@kernel.org>
+ * Author: Benjamin Larsson <benjamin.larsson@genexis.eu>
+ * Author: Markus Gothe <markus.gothe@genexis.eu>
+ */
+
+#ifndef __AIROHA_COMMON_HEADER__
+#define __AIROHA_COMMON_HEADER__
+
+#include <linux/types.h>
+#include <linux/gpio/driver.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
+#include <dt-bindings/pinctrl/mt65xx.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinmux.h"
+
+/* GPIOs */
+#define REG_GPIO_CTRL				0x0000
+#define REG_GPIO_DATA				0x0004
+#define REG_GPIO_INT				0x0008
+#define REG_GPIO_INT_EDGE			0x000c
+#define REG_GPIO_INT_LEVEL			0x0010
+#define REG_GPIO_OE				0x0014
+#define REG_GPIO_CTRL1				0x0020
+#define REG_GPIO_CTRL2				0x0060
+#define REG_GPIO_CTRL3				0x0064
+#define REG_GPIO_DATA1				0x0070
+#define REG_GPIO_OE1				0x0078
+#define REG_GPIO_INT1				0x007c
+#define REG_GPIO_INT_EDGE1			0x0080
+#define REG_GPIO_INT_EDGE2			0x0084
+#define REG_GPIO_INT_EDGE3			0x0088
+#define REG_GPIO_INT_LEVEL1			0x008c
+#define REG_GPIO_INT_LEVEL2			0x0090
+#define REG_GPIO_INT_LEVEL3			0x0094
+
+#define AIROHA_NUM_PINS				64
+#define AIROHA_PIN_BANK_SIZE			(AIROHA_NUM_PINS / 2)
+#define AIROHA_REG_GPIOCTRL_NUM_PIN		(AIROHA_NUM_PINS / 4)
+
+#define PINCTRL_PIN_GROUP(id, table)					\
+	PINCTRL_PINGROUP(id, table##_pins, ARRAY_SIZE(table##_pins))
+
+#define PINCTRL_FUNC_DESC(id, table)					\
+	{								\
+		.desc = PINCTRL_PINFUNCTION(id, table##_groups,	\
+					    ARRAY_SIZE(table##_groups)),\
+		.groups = table##_func_group,				\
+		.group_size = ARRAY_SIZE(table##_func_group),		\
+	}
+
+#define PINCTRL_CONF_DESC(p, offset, mask)				\
+	{								\
+		.pin = p,						\
+		.reg = { offset, mask },				\
+	}
+
+
+#define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
+				(pin), (val))
+#define airoha_pinctrl_get_pulldown_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
+				(pin), (val))
+#define airoha_pinctrl_get_drive_e2_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
+				(pin), (val))
+#define airoha_pinctrl_get_drive_e4_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
+				(pin), (val))
+#define airoha_pinctrl_get_pcie_rst_od_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
+				(pin), (val))
+#define airoha_pinctrl_set_pullup_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
+				(pin), (val))
+#define airoha_pinctrl_set_pulldown_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
+				(pin), (val))
+#define airoha_pinctrl_set_drive_e2_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
+				(pin), (val))
+#define airoha_pinctrl_set_drive_e4_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
+				(pin), (val))
+#define airoha_pinctrl_set_pcie_rst_od_conf(pinctrl, pin, val)			\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
+				(pin), (val))
+
+struct airoha_pinctrl_reg {
+	u32 offset;
+	u32 mask;
+};
+
+enum airoha_pinctrl_mux_func {
+	AIROHA_FUNC_MUX,
+	AIROHA_FUNC_PWM_MUX,
+	AIROHA_FUNC_PWM_EXT_MUX,
+};
+
+struct airoha_pinctrl_func_group {
+	const char *name;
+	struct {
+		enum airoha_pinctrl_mux_func mux;
+		u32 offset;
+		u32 mask;
+		u32 val;
+	} regmap[2];
+	int regmap_size;
+};
+
+struct airoha_pinctrl_func {
+	const struct pinfunction desc;
+	const struct airoha_pinctrl_func_group *groups;
+	u8 group_size;
+};
+
+struct airoha_pinctrl_conf {
+	u32 pin;
+	struct airoha_pinctrl_reg reg;
+};
+
+struct airoha_pinctrl_gpiochip {
+	struct gpio_chip chip;
+
+	/* gpio */
+	const u32 *data;
+	const u32 *dir;
+	const u32 *out;
+	/* irq */
+	const u32 *status;
+	const u32 *level;
+	const u32 *edge;
+
+	u32 irq_type[AIROHA_NUM_PINS];
+};
+
+struct airoha_pinctrl_confs_info {
+	const struct airoha_pinctrl_conf *confs;
+	unsigned int num_confs;
+};
+
+enum airoha_pinctrl_confs_type {
+	AIROHA_PINCTRL_CONFS_PULLUP,
+	AIROHA_PINCTRL_CONFS_PULLDOWN,
+	AIROHA_PINCTRL_CONFS_DRIVE_E2,
+	AIROHA_PINCTRL_CONFS_DRIVE_E4,
+	AIROHA_PINCTRL_CONFS_PCIE_RST_OD,
+
+	AIROHA_PINCTRL_CONFS_MAX,
+};
+
+struct airoha_pinctrl {
+	struct pinctrl_dev *ctrl;
+
+	struct pinctrl_desc desc;
+	const struct pingroup *grps;
+	const struct airoha_pinctrl_func *funcs;
+	const struct airoha_pinctrl_confs_info *confs_info;
+
+	struct regmap *chip_scu;
+	struct regmap *regmap;
+
+	struct airoha_pinctrl_gpiochip gpiochip;
+};
+
+struct airoha_pinctrl_match_data {
+	const struct pinctrl_pin_desc *pins;
+	const unsigned int num_pins;
+	const struct pingroup *grps;
+	const unsigned int num_grps;
+	const struct airoha_pinctrl_func *funcs;
+	const unsigned int num_funcs;
+	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_MAX];
+};
+
+#endif
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index e3a8ecbb20bd..a5bcf158d711 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -5,47 +5,7 @@
  * Author: Markus Gothe <markus.gothe@genexis.eu>
  */
 
-#include <dt-bindings/pinctrl/mt65xx.h>
-#include <linux/bitfield.h>
-#include <linux/bits.h>
-#include <linux/cleanup.h>
-#include <linux/gpio/driver.h>
-#include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/irq.h>
-#include <linux/irqdomain.h>
-#include <linux/mfd/syscon.h>
-#include <linux/of.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
-#include <linux/pinctrl/consumer.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/pinctrl/pinconf.h>
-#include <linux/pinctrl/pinconf-generic.h>
-#include <linux/pinctrl/pinmux.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-
-#include "../core.h"
-#include "../pinconf.h"
-#include "../pinmux.h"
-
-#define PINCTRL_PIN_GROUP(id, table)					\
-	PINCTRL_PINGROUP(id, table##_pins, ARRAY_SIZE(table##_pins))
-
-#define PINCTRL_FUNC_DESC(id, table)					\
-	{								\
-		.desc = PINCTRL_PINFUNCTION(id, table##_groups,	\
-					    ARRAY_SIZE(table##_groups)),\
-		.groups = table##_func_group,				\
-		.group_size = ARRAY_SIZE(table##_func_group),		\
-	}
-
-#define PINCTRL_CONF_DESC(p, offset, mask)				\
-	{								\
-		.pin = p,						\
-		.reg = { offset, mask },				\
-	}
+#include "airoha-common.h"
 
 /* MUX */
 #define REG_GPIO_2ND_I2C_MODE			0x0214
@@ -230,6 +190,8 @@
 #define REG_GPIO_INT_LEVEL			0x0010
 #define REG_GPIO_OE				0x0014
 #define REG_GPIO_CTRL1				0x0020
+#define REG_GPIO_CTRL2				0x0060
+#define REG_GPIO_CTRL3				0x0064
 
 /* PWM MODE CONF */
 #define REG_GPIO_FLASH_MODE_CFG			0x0034
@@ -250,9 +212,6 @@
 #define GPIO1_FLASH_MODE_CFG			BIT(1)
 #define GPIO0_FLASH_MODE_CFG			BIT(0)
 
-#define REG_GPIO_CTRL2				0x0060
-#define REG_GPIO_CTRL3				0x0064
-
 /* PWM MODE CONF EXT */
 #define REG_GPIO_FLASH_MODE_CFG_EXT		0x0068
 #define GPIO51_FLASH_MODE_CFG			BIT(31)
@@ -298,9 +257,116 @@
 #define REG_GPIO_INT_LEVEL2			0x0090
 #define REG_GPIO_INT_LEVEL3			0x0094
 
-#define AIROHA_NUM_PINS				64
-#define AIROHA_PIN_BANK_SIZE			(AIROHA_NUM_PINS / 2)
-#define AIROHA_REG_GPIOCTRL_NUM_PIN		(AIROHA_NUM_PINS / 4)
+#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			0					\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+/* PWM */
+#define AIROHA_PINCTRL_PWM(gpio, mux_val)		\
+	{						\
+		.name = (gpio),				\
+		.regmap[0] = {				\
+			AIROHA_FUNC_PWM_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG,	\
+			(mux_val),			\
+			(mux_val)			\
+		},					\
+		.regmap_size = 1,			\
+	}						\
+
+#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)		\
+	{						\
+		.name = (gpio),				\
+		.regmap[0] = {				\
+			AIROHA_FUNC_PWM_EXT_MUX,	\
+			REG_GPIO_FLASH_MODE_CFG_EXT,	\
+			(mux_val),			\
+			(mux_val)			\
+		},					\
+		.regmap_size = 1,			\
+	}						\
+
+#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+
+#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED0_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
+#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)	\
+	{								\
+		.name = (gpio),						\
+		.regmap[0] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_GPIO_2ND_I2C_MODE,				\
+			(mux_val),					\
+			(mux_val),					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX,				\
+			REG_LAN_LED1_MAPPING,				\
+			(map_mask),					\
+			(map_val),					\
+		},							\
+		.regmap_size = 2,					\
+	}
+
 
 static const u32 gpio_data_regs[] = {
 	REG_GPIO_DATA,
@@ -338,93 +404,6 @@ static const u32 irq_edge_regs[] = {
 	REG_GPIO_INT_EDGE3
 };
 
-struct airoha_pinctrl_reg {
-	u32 offset;
-	u32 mask;
-};
-
-enum airoha_pinctrl_mux_func {
-	AIROHA_FUNC_MUX,
-	AIROHA_FUNC_PWM_MUX,
-	AIROHA_FUNC_PWM_EXT_MUX,
-};
-
-struct airoha_pinctrl_func_group {
-	const char *name;
-	struct {
-		enum airoha_pinctrl_mux_func mux;
-		u32 offset;
-		u32 mask;
-		u32 val;
-	} regmap[2];
-	int regmap_size;
-};
-
-struct airoha_pinctrl_func {
-	const struct pinfunction desc;
-	const struct airoha_pinctrl_func_group *groups;
-	u8 group_size;
-};
-
-struct airoha_pinctrl_conf {
-	u32 pin;
-	struct airoha_pinctrl_reg reg;
-};
-
-struct airoha_pinctrl_gpiochip {
-	struct gpio_chip chip;
-
-	/* gpio */
-	const u32 *data;
-	const u32 *dir;
-	const u32 *out;
-	/* irq */
-	const u32 *status;
-	const u32 *level;
-	const u32 *edge;
-
-	u32 irq_type[AIROHA_NUM_PINS];
-};
-
-struct airoha_pinctrl_confs_info {
-	const struct airoha_pinctrl_conf *confs;
-	unsigned int num_confs;
-};
-
-enum airoha_pinctrl_confs_type {
-	AIROHA_PINCTRL_CONFS_PULLUP,
-	AIROHA_PINCTRL_CONFS_PULLDOWN,
-	AIROHA_PINCTRL_CONFS_DRIVE_E2,
-	AIROHA_PINCTRL_CONFS_DRIVE_E4,
-	AIROHA_PINCTRL_CONFS_PCIE_RST_OD,
-
-	AIROHA_PINCTRL_CONFS_MAX,
-};
-
-struct airoha_pinctrl {
-	struct pinctrl_dev *ctrl;
-
-	struct pinctrl_desc desc;
-	const struct pingroup *grps;
-	const struct airoha_pinctrl_func *funcs;
-	const struct airoha_pinctrl_confs_info *confs_info;
-
-	struct regmap *chip_scu;
-	struct regmap *regmap;
-
-	struct airoha_pinctrl_gpiochip gpiochip;
-};
-
-struct airoha_pinctrl_match_data {
-	const struct pinctrl_pin_desc *pins;
-	const unsigned int num_pins;
-	const struct pingroup *grps;
-	const unsigned int num_grps;
-	const struct airoha_pinctrl_func *funcs;
-	const unsigned int num_funcs;
-	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_MAX];
-};
-
 static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(0, "uart1_txd"),
 	PINCTRL_PIN(1, "uart1_rxd"),
@@ -1429,36 +1408,6 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
 	},
 };
 
-#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
-	{							\
-		.name = (gpio),					\
-		.regmap[0] = {					\
-			AIROHA_FUNC_MUX,			\
-			REG_GPIO_PON_MODE,			\
-			(mux_val),				\
-			(mux_val)				\
-		},						\
-		.regmap_size = 1,				\
-	}
-
-#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
-	{							\
-		.name = (gpio),					\
-		.regmap[0] = {					\
-			AIROHA_FUNC_PWM_EXT_MUX,		\
-			REG_GPIO_FLASH_MODE_CFG_EXT,		\
-			(mux_val),				\
-			0					\
-		},						\
-		.regmap[1] = {					\
-			AIROHA_FUNC_MUX,			\
-			REG_GPIO_PON_MODE,			\
-			(smux_val),				\
-			(smux_val)				\
-		},						\
-		.regmap_size = 2,				\
-	}
-
 static const struct airoha_pinctrl_func_group gpio_func_group[] = {
 	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
 				GPIO_PCIE_RESET0_MASK),
@@ -1551,49 +1500,6 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 	},
 };
 
-/* PWM */
-#define AIROHA_PINCTRL_PWM(gpio, mux_val)		\
-	{						\
-		.name = (gpio),				\
-		.regmap[0] = {				\
-			AIROHA_FUNC_PWM_MUX,		\
-			REG_GPIO_FLASH_MODE_CFG,	\
-			(mux_val),			\
-			(mux_val)			\
-		},					\
-		.regmap_size = 1,			\
-	}						\
-
-#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)		\
-	{						\
-		.name = (gpio),				\
-		.regmap[0] = {				\
-			AIROHA_FUNC_PWM_EXT_MUX,	\
-			REG_GPIO_FLASH_MODE_CFG_EXT,	\
-			(mux_val),			\
-			(mux_val)			\
-		},					\
-		.regmap_size = 1,			\
-	}						\
-
-#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
-	{							\
-		.name = (gpio),					\
-		.regmap[0] = {					\
-			AIROHA_FUNC_PWM_EXT_MUX,		\
-			REG_GPIO_FLASH_MODE_CFG_EXT,		\
-			(mux_val),				\
-			(mux_val)				\
-		},						\
-		.regmap[1] = {					\
-			AIROHA_FUNC_MUX,			\
-			REG_GPIO_PON_MODE,			\
-			(smux_val),				\
-			(smux_val)				\
-		},						\
-		.regmap_size = 2,				\
-	}
-
 static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
@@ -1678,6 +1584,7 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio39", GPIO39_FLASH_MODE_CFG,
 				   AN7583_I2C0_SCL_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio40", GPIO40_FLASH_MODE_CFG,
@@ -1706,42 +1613,6 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
 				   AN7583_MDC_0_GPIO_MODE_MASK),
 };
 
-#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
-	{								\
-		.name = (gpio),						\
-		.regmap[0] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
-			(mux_val),					\
-			(mux_val),					\
-		},							\
-		.regmap[1] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_LAN_LED0_MAPPING,				\
-			(map_mask),					\
-			(map_val),					\
-		},							\
-		.regmap_size = 2,					\
-	}
-
-#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)	\
-	{								\
-		.name = (gpio),						\
-		.regmap[0] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
-			(mux_val),					\
-			(mux_val),					\
-		},							\
-		.regmap[1] = {						\
-			AIROHA_FUNC_MUX,				\
-			REG_LAN_LED1_MAPPING,				\
-			(map_mask),					\
-			(map_val),					\
-		},							\
-		.regmap_size = 2,					\
-	}
-
 static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
@@ -2809,37 +2680,6 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
 	return 0;
 }
 
-#define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
-				(pin), (val))
-#define airoha_pinctrl_get_pulldown_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
-				(pin), (val))
-#define airoha_pinctrl_get_drive_e2_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
-				(pin), (val))
-#define airoha_pinctrl_get_drive_e4_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
-				(pin), (val))
-#define airoha_pinctrl_get_pcie_rst_od_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
-				(pin), (val))
-#define airoha_pinctrl_set_pullup_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
-				(pin), (val))
-#define airoha_pinctrl_set_pulldown_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
-				(pin), (val))
-#define airoha_pinctrl_set_drive_e2_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
-				(pin), (val))
-#define airoha_pinctrl_set_drive_e4_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
-				(pin), (val))
-#define airoha_pinctrl_set_pcie_rst_od_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
-				(pin), (val))
-
 static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u32 p)
 {
 	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-- 
2.53.0


