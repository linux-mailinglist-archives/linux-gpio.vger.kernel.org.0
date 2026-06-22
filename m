Return-Path: <linux-gpio+bounces-38802-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +eD/K2IdOWpCnAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38802-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:32:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3526AF19D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:32:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=S9M1iapd;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38802-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38802-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E0CD3017CBF
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5792D063E;
	Mon, 22 Jun 2026 11:31:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021119.outbound.protection.outlook.com [52.101.70.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E432BEC2A;
	Mon, 22 Jun 2026 11:31:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127882; cv=fail; b=DjZgyNVKSiIrZMvjvCYWl3K+XJSUOsHX6iJlLLgtteNEkxWA9coVXOjrg3uveEVoxGGA/1QU861vXniUsEuMabak3nr1H9KPSKtvBnjLpMEMZVrnaoF67gVobGvN72eutr3ud9r7Sq6WbAZzRbag2vXntekHIVllWuIyVM/vewo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127882; c=relaxed/simple;
	bh=cnZkQkzywoh+RUno2Q7YgYQuXHF3Tb0FpKxYPYEuJFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kzk3Mjp/N1vzguk7JwxURJZTi36yeWGk8AJR/pwqgQRtKcSutmdU8MZFneNLCz6dJm2y5vsPSyn8c16zgPJ9g/DicrNbUUJR4pcK+He5Wmgl/htoRNfKL+zioKdAy9FSccr968yNCOdpw+kI1+19hej+hiYtKY5W5iM7NDGFoIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=S9M1iapd; arc=fail smtp.client-ip=52.101.70.119
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLTzzFnyGveURdETljP3JgrOUvSxvp83xKRnIDS69nNCn2Q/14iJW9QpTn8zcaCMokaGY+PEFg9yUW14lKGJDJBb+HQvsNefq2+GMgXRATVOHrvZh8QfQa8tIXsu7l01WdoKe3klDQX1zjmWv5R3ByaItDWVv6kY8bREP0xC5yXoKcWosQopwDvx4GU8FSxIv2p2cULTfqgvOtgHirtWTg1Be0wY4KcVneNeA/DaBVldEnmvYyxgerMoztpGo4VBNIJRx8FZoMkvY3yKHgSMyd56OMSlkhIomD9kf0V/1vZgwgu7sV+JEKt8+Zoq/CtW+GcIK7KWlUL2B+/t2iDzvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8356wnxm8ae+jcv/L/DjP5xJknasURG7Z4GNWSEucw=;
 b=qaq2K18bbigP+vwsTnCDkKSOHeRx/pzq8g9nHoWincwLeLGd42Xlx6fvy3RvxOE3xFtl5HQcbLHs1DMEH6kZ3Gk16pZvnxVLz47EoPZmTDx2z2OqbO6CEoGWkSjp5i5Rps8SA/D5zu+fqvxJeaadnKY3oH9KcZkP0apcqpd9b0aA+3tPyW9TD//LMhnEUkY9PIAS6wq7RBiYKBCM/oAJ9NGSzeXJVxsoaSYHVrda5QEtKU4CuL0SBzYjLxmaiM8zeuRZvxq8k1o6aJ+DMRqWKK2sfFee3UzbcRouchaytj8vu702ajNn0Y/l/owaaltROzzsk0Vdadv5FGd9W/wixg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8356wnxm8ae+jcv/L/DjP5xJknasURG7Z4GNWSEucw=;
 b=S9M1iapdaOogLDBrcb1EoCR3AhzIBckuWApmIsSFerCoad+bSbUgQurDwWmTgrCrNIuClng/4A/GSWHKvHMd5uNg/4/vcGsVLHwGXmGwyJl31Rq/e6kqQsgd5w0Yo1UqyF+X135Tj69T3xNaxHo94ac0Ud9zsnctrbuTfjPU9s1yPxmPz9LUXAM9V9ykq/Lg8n6ZtipOW5N9wjKnr4J2TteHGN+3AUSswzuPYT2EKn9SL8pCnkDI2mQ5GrmkRNy3Gu0V0plF6dqH4hoOzWG1vEv2TnzDgmUlPgnfWVhbFup1bWFVPSrbCFO5vXftrtNCrqrtKVQrcFfSl5wtSjhmgA==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB8334.eurprd08.prod.outlook.com (2603:10a6:20b:556::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:31:11 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 11:31:11 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v5 12/16] pinctrl: airoha: an7583: add support for pon_alt pinmux
Date: Mon, 22 Jun 2026 14:30:42 +0300
Message-ID: <20260622113046.3619139-13-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::7) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: bf3cfb9a-8bf0-4a94-2360-08ded051c2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Qx/zpF+nJoN4SED5FfPizVJeoQp+yhgI7lZ18wCyYAiE4v6s3KwGFEwIHYwoatI1t7ScDHld1cB8kPMOxxuReiIq+UOaDd+o5njAWf4sZoECHaSYHkKWF/W3lvshIsVdVCpWwFX8FJIwcH4irPxhGGS1WspHtnB7IIAjtT09/+RR1IIrka+WOi2FOYxYzw8te1l6QtTsmOheMYBc7cUJdVkivwdqfcaKFY+56nOMBonj4lTNZVN4yYFH70R7Mj0vY6/UM3if/P2bAW9+Ym8kIfELUbwADIlEI8yCx/mfQswU1jDXgOaPyy7h3A8hS/za2uLGRKfp4mBfj9QPgnTxiALIXIH3qcpML+pTFdz5z88ovyfBQOaSmz3uZe4RVLOU89ShTdSAi/uBSV9NHlNX8Xe4ul4PlU5Wgr3WYhPATymenNF+eKXOoW2m5ryRg4BC8wgjGpo977zPn/ZEPlbo/kVpEYtpzjZaZ+V1P0/bXVzm5l74W31Qk2kQivCzidsIOeI1oV5VNm+YBQDmDzdDNN0IWidogCQUZuqgq7zto1tvG8xE0Sk53fD9ZNbJtQ7IfIYhU09jo18Bzz6+jCq5lJpJJZVSjC1SiUz4sEtpgHZyh2d1MPkRyrF6O9ol+x4GPHD6VNJrpFh9L45fvKIMo374QQHTZwZ2I/g308vC/YSljsiPh8DpRKjmUkdIoeOMweEQnd8C9qNUmTAy7hBFEqw8aYznV6w2dN51dzU45BnpAPpjLMjCI+DFsFELtzBO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B1mJY4nlwc0c6S8WWMs0GJqgWhN622Qp+T7IZ9zuvz3mDBiUbBkK0D3eBwt4?=
 =?us-ascii?Q?GV0eqgx62QUfgeQC+EgV69I084sMbtL0vbBMhRu91Edc+wNhnv/otWBRMEmQ?=
 =?us-ascii?Q?ajLrERlLL7dRsHUouDwtDdHjE6aJ9Q+5lGG3rZ5AuGfuBkrdwUfmgRPevtUt?=
 =?us-ascii?Q?OuQ/1/q3hpxeORlWAcBnXV6CLRhCgwg/0/ASpEGwX5Cle7TUAMBvimvBaICi?=
 =?us-ascii?Q?/Sy9NETTyKKGEqFlr1BGwPzEJaw9/Zn1F1DoUtERbFvtaQCjBv3W8C2JCcQi?=
 =?us-ascii?Q?joYQfG3NRWHYc+VKDNPNlFNL6w/5oXBvDiw+z1Er6gN7CHkbMtsv5qKCh9gl?=
 =?us-ascii?Q?lZg7rid5sIDo0T7k4JMjqiN0EZ6wv754EVKFr6bhHfAhzYvBVHcxo1n06D6H?=
 =?us-ascii?Q?scoqaTlcykfiuEmHx//RRCksiyyu5T+fHBskVfUe+6hlDhEowDMncNY4Io+O?=
 =?us-ascii?Q?dXHkA6uxMTFjDtdaeI4HkE6unXRqs+SM64Zxq6LhqCKvSm1FHeyjQ+Wf5zsL?=
 =?us-ascii?Q?DzyFZGtGqEU0H8wfh0SqClyBfglsNHLK2mExLN2t1dSeR15h/H2GBu7jmFiV?=
 =?us-ascii?Q?dZGKaHIWFTSLjvcr7KYYgEFMUBVF6Tu1rc72hfUzcEWXxV7lEvSbqJCafZys?=
 =?us-ascii?Q?ZQrBE7yIhY0rL0/syMlxSd4zZL/OU+8qToMI4/JTN0vOL1adPMtm4vWMoFbF?=
 =?us-ascii?Q?mv6o/hvfvQDXzrcNn2MKOpgdfGB7wYSKK1egH+sSMIPMnQI9qDEnU3ZOUwx/?=
 =?us-ascii?Q?Sjlfjhwe4cIPw5W5K/Mnizu/yf16ifu6Miivn8b4C9GOFMSiihnHuElF4yq8?=
 =?us-ascii?Q?558JBn+Lt8cqSUW4MtgOfU2vzrsOZHQ07m20BHCt5dYgWAWHf66IZhjWvhYi?=
 =?us-ascii?Q?TdM5TAnve97ex0GxeGno5wIpN18KMJuZ8atZUp30KQnVu3KdATZhRqltayIv?=
 =?us-ascii?Q?IuJQqb30a2GckDxp1A/NLnD/KfCc4oBexYgjHy4VOCckjIxEoY5lun32czmC?=
 =?us-ascii?Q?X7qiGsPJyTfPatmokTpLUo+ak2a9YqRuLI/ESs+RA13w1w6Tpdby5/TOn0xY?=
 =?us-ascii?Q?6EKkzANz0LKTYcmarRxzb+KA7nRgCT+cCZCP9DQ3s+9GpU4EXBERY7rYUHTS?=
 =?us-ascii?Q?uhojPmzR41Y3jKJKX6zs59Lhl+zZwDLjz2lqWqIhdqnFC/a+2FMnp2sefdDZ?=
 =?us-ascii?Q?LKEKgYXO8WEpXGRDIMvpQMqYLh1knhe7WeqFdVh2UKnpSWKoqL//hS0fdTqK?=
 =?us-ascii?Q?5jlyC7IQIgnxNCurnK8aJUm7hAKBpU4U5QtWRcAVRw2is8HvxzGGbL+6U4Vm?=
 =?us-ascii?Q?RSeqTSWljXb6fgE8ZpIklyXnYvD9tqqynljaXKh9w5kbG2zMoCJw0jvieY4D?=
 =?us-ascii?Q?CgVHnvgn05oo4AvhzYWmx8V02tA4VWQlkIWS4ge4Re9X+W4kHFh1rsfV31ou?=
 =?us-ascii?Q?Y+szB6goCS5BE5S01NkaDX75G5TGfgkzSs2g9TWF+Im8HiEX9N1UQXTfZgl7?=
 =?us-ascii?Q?5yE9sLN3t0cHzESI7t+QMdjvIniRifytzUYmW9/wsQizQO3lxctlcLiRZzYd?=
 =?us-ascii?Q?KXrD2L3XO/RtNtpp5Cr4jhG0X2RDm1tkcKOlgGS69u7hf5deBbPx1dM4gkQP?=
 =?us-ascii?Q?0FXE3Kuwc8wzCcUqzcU1bHbXA+PFoYyivN+BuYpqcgDlH0HERuZFfgN9Ufut?=
 =?us-ascii?Q?41wmWeNVobaOMMPjrC5dqrzAOHCYaAaAdzyLY87xKHOkVIlyWb3ZuNtbdmNK?=
 =?us-ascii?Q?Dthstib5gCPSB0ti3ZHDQCMH7G/1+ks=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3cfb9a-8bf0-4a94-2360-08ded051c2ba
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:31:11.2460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ib3HALTqU2kt/745yxVg3E/A3WloAkIVCzbqZLDW3mlle3rf7FiTnmtMSx+ut/aZl8/SagY0jrEGoL71DRNw+FWFLfz3Tl4tC5PzFN6+5mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8334
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38802-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC3526AF19D

add support for pon pin function for pon_alt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 0cac9a5646ff..4d9fc0fe464a 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -38,6 +38,7 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
+#define GPIO_PON_ALT_MODE_MASK			BIT(27)
 #define MDIO_0_GPIO_MODE_MASK			BIT(26)
 #define MDC_0_GPIO_MODE_MASK			BIT(25)
 #define UART_RXD_GPIO_MODE_MASK			BIT(24)
@@ -391,6 +392,7 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
 };
 
 static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
+static const int pon_alt_pins[] = { 36, 37, 38, 39, 40 };
 static const int pon_tod_1pps_pins[] = { 32 };
 static const int gsw_tod_1pps_pins[] = { 32 };
 static const int sipo_pins[] = { 34, 35 };
@@ -479,6 +481,7 @@ static const int pcie_reset1_pins[] = { 52 };
 
 static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", pon),
+	PINCTRL_PIN_GROUP("pon_alt", pon_alt),
 	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
 	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
 	PINCTRL_PIN_GROUP("sipo", sipo),
@@ -562,7 +565,7 @@ static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
 };
 
-static const char *const pon_groups[] = { "pon" };
+static const char *const pon_groups[] = { "pon", "pon_alt" };
 static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
@@ -629,10 +632,19 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
-			GPIO_PON_MODE_MASK,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
 			GPIO_PON_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "pon_alt",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
+			GPIO_PON_ALT_MODE_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0


