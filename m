Return-Path: <linux-gpio+bounces-38542-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tt8YNQDpMGp8YgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38542-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:11:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BAB68C621
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:11:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=LFAjsgwQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38542-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38542-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD761302DFA8
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EA53DB964;
	Tue, 16 Jun 2026 06:10:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020111.outbound.protection.outlook.com [52.101.84.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B803DB322;
	Tue, 16 Jun 2026 06:10:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590247; cv=fail; b=pIGCyYmGhubzeQzamrxTJlkGJWz0WF2nIaRnvBEyhLu0uJOKOEfXkPoMKSVhb2ElxnUhARHoMwCgE1wMlW78PmIx4JOS/uvecbcMK8m2u4yi4vvsqoK2b+L5ghEBTwGel5d+hPHqechOkWg7HtTccyybQ2udTLztYbQodmSiZsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590247; c=relaxed/simple;
	bh=5Nlwu5Qy9j4jVSPYL7aV+3OUgJDHo1h0nuQo0bbS5l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fTHPqhn+GztlDK/Pb7hObbMqVPs4eHKg7DzmlYfVi1BLGsMFjZp46BHfmul/xwfX9Xx/AgYgS6E6v7YvTNqD/Cha1KdwjaNDV4/ycgu5FUPUmHV7htQr4HDmkb80NwmLBWYcEohtAtG+gVZsiYpUVPqSU7hu/JvkqimpCGW/kaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=LFAjsgwQ; arc=fail smtp.client-ip=52.101.84.111
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJO8PwZoFEVlZ3D5FNWMAoAK+6ARz78j2FGMXFtGFC5UZpTh883gGh8y9XPW0swM4fRd5fTiWjQKcn1iMfBN6+PDqdtLjPilJonhOnavCx43bF01ArTejE+ney57NgwJgh94Yw5qXrnMC10jbTgRkUquuRwJmB8kFgO3BAP4WlgxXchQyWZif96M27NFsIxlkkRsM2zGELQeIcKhPqycgyINPMY9g2ZcqBjO2hzw+HKk0QY8d2lSrQdUsOCMS6Qy8rvhyRBxcUGWAYYhZaMSVLScuag6627x9B3I3cHcT8IzOkVh9+d4Aw2P0C3hHEpkGtwtpAREP9CVLQCzbVP3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=AWCyQ1VivJ2HvwePzhgO4NEMCQsqEG3lk6VBYNNynIWb8HTsLynWN2tXnhR3viYcTqlZUSxobuCiip1SaIchXPfstgjWueKekLry+ciJT6TTFuPI9s8/G7ONHdqv/+5IBL+DtacmkML8ir7FJ2upp+KxvVTZhRkrH87A3B5lMXSeobydqElgDnA+TZ3aJkFkMXfxmJAqKX+9wQTkz4uHokRr3e5ahY0w6K9seidHUMfJ8meHV2TTWFsUgfOOULU98NtTixzK+qNSdw2cdjnmXQx1w2GVjkmPYzEb99W/3pIsfpESNp7UfiT93yxkN2mZK/p3oA2ucw4szz7YJ+gWqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=LFAjsgwQ0OSqNaB8j0YgoHuDRMBOb2574ShZ+jcMk8Udh84FrlqSs8txJjsbW9JHToSCqKHGH7Utm0fLUR0uxGtnjZVw67Q9ydeWqz3CedrXn43x4b/9NEtJl0qPz5Ke5afNwkf8IQI0HtLNrJVRPVgbEUGp3ZOIjAHDduIe+l603+XhLpWXMSUCLymtZB3GFTAOezxSagcH/nHbdTLiT5lLMNM8umw6lkG28Ne23EPuRceMyI+jiTbB0aTc6OfsAG8QqaopBWb82qK1Kg6XsgeGVX6OcKwIYNFeuc9VuSXdfZpsUs9VG6OMMUb7VD6XKzrgxrJBnDG0lMmDydxQKw==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6206.eurprd08.prod.outlook.com (2603:10a6:102:ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:10:41 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 06:10:41 +0000
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
Subject: [PATCH v3 02/13] pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
Date: Tue, 16 Jun 2026 09:10:18 +0300
Message-ID: <20260616061029.2630777-3-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: f3ad4f44-7078-43a7-bff4-08decb6dfe7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	aVI5kWD7PxCXVHEKrkqBq+c/yIVLExI44M0Ur3HbxNTWGmU1sqsuzgPkyiMTBo3W3yE7/+7QSUu8hR9qQ1o9Q+AnFvtEmnswg9sYlJ1nfXl+ELe9swmNoLCoNXZLQglTN7lk3vakPhAtD+BZGplaB5ZaA/u35CvGThSdADQ133KUTjN9VU28Uac4weAp2CDnFdwv/2uN1VENqxKAtHzqCenmVxSbtqV1JljZiauqR07XOaDJZimtnrw9wojptUOq7OBSaF3zNby/OPytFyUlQ01lLQ8D8dNaJQImrg1wjxWHK+ql0BKaSmvCpUMrtlGBphY5LIdepBHSHE5Lp8O9M+u9QAB0SIZb5ko9kr0J/wBFwDWQyGipNvjxOlGfyNvMx6HPv/6tWHMo/pvXGoLpqXDgZSdniOC2VC4lVJ2rVFGHoj7OphkgX+WXzFwI99C5+QhMTgPZkG6m+YTP3VhWFsOY/m+QDBLhDt/sP2aeVSI1GAej//Ww1vThg3U/qEYUu341+SECBmCr+e4YmjOE/mIybsAk7ebhCeYFdoeO2LgRAQ6vPkqBQ7HLu4WAk9ry0LC8BYlbQi7hpnisQdNsjsQHU7c3dZ3m+HpEiLZ/5i7AGlhhjOqAXnkO39Yhc//Ke+9cHZPYfSNqCAzTHD5+ISe7Ziyff6VpaVzo+7HTN/szPxyfVyyvI46Tp1jRMpXnKpAgLH2RyeDozRtkyhRFaU8BH0nh+DDjYDt52eqjeGz1LgREtAoPS1vNBDYUs12PgG8iwkf+cnafzjB6qVcIfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YCttWg3iCT5r8V/PhCQY+vs9iVff0qdWi53zko13uEXeWxxbJse6IlpKKO1/?=
 =?us-ascii?Q?iADaVQfikQIH+bm54vxy7yPtkMWarLMr1UEBBUs9JcdIn8qJCX3+yJc4Q/02?=
 =?us-ascii?Q?Srec3wtqdawyAsRJq041zp9Eq73XnWlTUwdkyidNF6I7NjkI9EyFuGGa20vM?=
 =?us-ascii?Q?/xnHnWzbZ2fOziz5kKSADrHLrxX0PIh7YN+T+L1oatCERWRMc66Tf1k8/Xyk?=
 =?us-ascii?Q?vvKdJdJe8mr4cWy0EnplzJomd6dZy3KXnIQTdEzNlQDemYR44MN8zlDY/MRM?=
 =?us-ascii?Q?V9GfaQ/XJF1jOROO0jcEQDIjevQlOpUu5PluXygwyvMK4kjpzskxq41xeleJ?=
 =?us-ascii?Q?/EJyJZgYgRmsg7gGfgBpsej+7eE/OTjC/j3PBzctXQOQJZNDfxULsJW25je9?=
 =?us-ascii?Q?emY7qIxr3WWM/fQluBpGCIifXtOjLSv0RwJ+PTo8GSNa4z2FeLmn/tkG/DZh?=
 =?us-ascii?Q?K6bkIfcdfL36qm/HNgEqbrXWYn35+6E/X+vRBunL7ehuHsEJHAFENlDgMr4M?=
 =?us-ascii?Q?a7Nc3OGvhijT54Im+B8P2iS+MLaUThnwpuiHGe1uK71WHBPNwMNpLBN//ji2?=
 =?us-ascii?Q?/jyG4v43D+WJl2rdTNsNlFa2ylpuWCG+hPVeUkwCo6nA+xGUReoIbsdlGoOL?=
 =?us-ascii?Q?wQb1zVO6Fo+gAss/M1mqO6qhGN+kdoIHbgV+NVt/fHg66V/OGAJ/NdV9ilzT?=
 =?us-ascii?Q?5edfumoYwFwUSyWkuP82z6sIf9XjVjs3QSipj6mG3oatHltRosR+GalmeHc6?=
 =?us-ascii?Q?fGAhs4EUEUBlfUFYBbvPhZoqSlhXqCSPY0XU9v3s3JA5mQw80hpH6N5bbwbx?=
 =?us-ascii?Q?RnDuk8+0Ec+fCZKHCCB1qybaqQe+KtQ+KbwisMjXAa+7bAznbP1HkF1pM3U7?=
 =?us-ascii?Q?OTLYbGnAgnsmvoef/QDhDvqh+qkWAPx8gN0rXrfNzcwTtjWxYN4AS9sX63/w?=
 =?us-ascii?Q?1jeyV4ZCGoMe5kKWacj/w8LMIVUiji+lhCsj1IBU6vTz24HDtsNknWMqKH1o?=
 =?us-ascii?Q?NtrvNANM356wh4+jvn+uowsZf3cIrv7RjZhd/tVDSl+/zsMSClI4aj4XtKV/?=
 =?us-ascii?Q?J3pcaxkrEijSll8KVQxtuh4+3RDZFonfhr5SKTpgH6t2on2IFomjWIjlUSeP?=
 =?us-ascii?Q?cI+CJ5fVDjhPNpFM1CQzKXwxrRyppqkTPrcV7MwXvl0ojWxU0c5pRSQv4V5S?=
 =?us-ascii?Q?VpYmZIeMBH9Zf4DUZfbNsJazXqAW65i3taa112yGM4xZk89/+8i6So/UTiJH?=
 =?us-ascii?Q?LigJJhJUlLZA38s0wtDWTqQ3FWWBcvhldYrKC+E+KL2laL3Diq5yAt7nv6qQ?=
 =?us-ascii?Q?qS4kzezqGy/tXggxxd4Zs+0D2EPWMo61Z1plr4az8L0BFUynsj82o05zhuDW?=
 =?us-ascii?Q?C0UwYXKmuPDWekh8OutJVYe7fdONYOORz3NKkQXJsnIdxWoZ4vK0RJ1L+xfV?=
 =?us-ascii?Q?pDUkpP7bsUXFpsmX3/01tKNeiOZ6evYv4eJxgPe4D8i228PRczbskFuHU0Ya?=
 =?us-ascii?Q?0NDAna+OaUz6JdHoneILdtnO74oykhfsYRyaREo5utxok0ev/GxPBMqAlcIy?=
 =?us-ascii?Q?NeIIvpEohHucLq4622bQ/E8sUtJfDnI949d48r3OZKQyqL+ssuE7kh0MJ29d?=
 =?us-ascii?Q?ii0caXTXlYQxPk3MxQyTH43he2UYBIOGvPW6g9vgFypHeGrEKKPo00VDfJco?=
 =?us-ascii?Q?dfSmUH19XGzDYhNWC/GdpPPYGWJCBoMRfZz5e5kND0NvK6FeJN6J/pJj64EU?=
 =?us-ascii?Q?FwndigyGSZQi2rBHl6v/9Rz37cvAacg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ad4f44-7078-43a7-bff4-08decb6dfe7e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:10:41.7691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7bRZbDxkbMiKuMDmuwA9yNIHZFA0oAHDecjHEG5DSegsxMW+pdSRb71uerJDdHhdM66HD/0Tpu3/nr64mT0yhbyWivdbvDMaKj98JrGGHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38542-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81BAB68C621

I2C1_SCL_PD and RG_I2C1_SDA_PD bits are swapped, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 63c82268aa82..4076bd0261d1 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -184,8 +184,8 @@
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
-#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
-- 
2.53.0


