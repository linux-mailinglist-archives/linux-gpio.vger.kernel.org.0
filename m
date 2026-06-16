Return-Path: <linux-gpio+bounces-38550-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JN43DofpMGqVYgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38550-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:13:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6581868C670
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:13:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=zkdcj55J;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38550-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38550-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B3393058E73
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EF73DDDAF;
	Tue, 16 Jun 2026 06:11:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020111.outbound.protection.outlook.com [52.101.84.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DC73DC877;
	Tue, 16 Jun 2026 06:11:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590267; cv=fail; b=O3oAEBOk06YhI7PZeOPD9gcJXto8BfwDjpmRORkAQyRd8Q+dRF32awYHiQxk1cnfUL4XqP9uTRaft7/pelpLJzZl4G4pjxxuVzvCXqhaOXwYK1BsAvwD9ad9evIoBh2TPO6//eKm1wiIY3VNIH86hAyyTNNKgXA6KZSzOn2wuns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590267; c=relaxed/simple;
	bh=6AyxtXpqRukv/sY8BsdKnCguSQeRiC46ahEzVH+IIug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EUHssvcBEcYnwp2a5vfnM9gVTcdSUgdh4E7mqx8KoY4rkdu1aFo65w0bMAq+U3TrOb1aOTNKaAlKWYDDL8MPp2Vl21AafWpcNJcBcdjKbfQMANYx9kubFIrIB68Flka+Q8VzD9UNhIFLUt/WdWLx3nQryS9QNjifoyDlfhde5S8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=zkdcj55J; arc=fail smtp.client-ip=52.101.84.111
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rg+TaYNAQzwtWsCfSQrjYUs6zXu9w0P98WHYAzM6SWOpn6HihAnibfleUIylxUNLblx+tMSGNLs1/rK01h4zs6iRgECoMQuIv0QMO7Q3Vi2gw7B4KXQCX8RCYO402eHGBX4yQaAbU/cdM73B0sHwnwlt0E2s8nkOwj4iVnTMNR0lZO9zL4E4nzJFrqDZlSoFIQ6PUqRb2x9ezG2qwJokgXcyMN0gHahvfw1y7c/0KX0/QpOofpQSApf25K5J1wFJ/EFR/9bLRJ2Eud9K1JuJR8iFFekQu9qtWXVgVTXCvhflFg73dENpJIpUO4IQPmoYftYaLtX0+jIl7ydKQ0AVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Swv9NKJNDtP0rpmgLtcdKlbzHatH1utaaaY+P49JjEU=;
 b=Di5D611hJRJMe334LlPqoWtAWhgubZcHGgQh4BWs473bre8w0peOPZroAYdEraWht7jZ6LgIPH4W3v57OrsniABaxqfsnv5saysQHEMAhfrmEp4w60nXqvzsY+xHRdznE2cRNre1WrE+79N0qKYbULcSsxFg7nSDPSejsgP5I668LtRUACyBYGG8qyeRdWLusNZCfEPENDpyw1n4l4QYzDXhe5u6RYqbK4VgXm19CuQrc2jAlMsa8eDuKVXWBOKStnLN43oyDIC5Yqx25svUS3teXU/APCs/ggKvHxLLoUelt0ALRGB8max9z8v3cAUi6ndJbSnXhU9cBB5ZS9voXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Swv9NKJNDtP0rpmgLtcdKlbzHatH1utaaaY+P49JjEU=;
 b=zkdcj55JBsSN2LA6E79sz0AEAiaqgFhfKwZ4QtcM2gVD9A0H2xIVsuD3i0ehBxUGt/vW0bzgZZw+s1+Qh+vKh6hKGdg2OCzfV3CuD82QlCx/7ZvCNzDW5l9mtx9D1Jwp4QCEm+XX0e0JlcA7Ke2/81L3QuZa2JiYocOFcGGxdvcFzTBNdXJocB6rQfZuQmgmAMYSzTCm8Lqs/ltOipZTfdtM7/2CcWNJbuXWb841YF02n/RUc1LAUrIq9Vb+Ru/Uftx9Y47bs3XgJslJ8ynm4R3kXTEbHX84oN6DCDTYGjiRtla2ldzylcQbWscvEyEohnOJ07rm82Wm7ci4CBp5HA==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6206.eurprd08.prod.outlook.com (2603:10a6:102:ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:10:51 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 06:10:51 +0000
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
Subject: [PATCH v3 09/13] pinctrl: airoha: an7583: remove an7583 prefix from variable names and definitions
Date: Tue, 16 Jun 2026 09:10:25 +0300
Message-ID: <20260616061029.2630777-10-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: a3ae2844-33a6-49ba-c0de-08decb6e0425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	pvGGtvPG36pCRWewBL5fhH1fHrkKRXxRF/HuKlDn48kk9ZxdLL8EaZQdAxTtYO7QTyfa+rtrWduJVS4T0krNyUCsC/N8b6B92uFAM9eLX4dm4Qsui1cbyKNSHnJK1GO41tf7p6sI4lOMfTgTfShf5cUOiE8VN0aO1LGIC2exqekYoE1i68XsvZGIzB6ky7dBip5iz4yHH3C+9NLWbXshybmqnRjnPwNaU43MBIFdt41KfbzkHDPZGByD7jH5qIi0H63US5w54s8rJvexK3DkBhk8JiOjDA1YDQVdYRnLPKs7VKK7JWokb9IpWHN1f/UhndlR/nWtYBIubr5tz+jZXEGcYu+MfsNxhT2Wa4QbHtNjEfvmqnCc0wNbeaHZr2/cYrU/+DOywlqa05GoqCk04V3YDTYUrta4QAfLv5N8CAvPRi1GwSj6pv/m/okGvcjUzjTGJqO8leFrg4tuZLN2aKZ1pPZK1gN11kVd9aOvYPTlHwkzZcX5YesC43afg4s5iIQV8YiCRpV7BjAu1dDdeoXf3A+x1swhpxKkGCdKZjdsE7h9nGGEE51OsVXIiNWR3XLobAAuRQUv5IujIVmEa/ETGhvG+OaySn1pLzEN+vbr+6lyr2wvHY3EZpRBN1rLoBFPw6CNfIYzrRWP40J3LxB0licdoKltES4uDZqhUi9gJaJ/aHhLlolmvPYN+S/J1i+5Ni1eibk0GnBgjvqdCVbeE1w7eXp8VUbmaP/iOXOpnUT0LhSkCLQM21A+dGhdRQEDB7rSYZCcNLstcG9pyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p/8asvkYWhoFPyNoesc437nKUR8dArmWZAaCU6dUajP0gjJhgL8CCEuUeDF5?=
 =?us-ascii?Q?4EGHgaVb8bbCB8ru87SklVhjtZsLwTe2FeJm96Me3TFFBjWfoEA3CQXl0R28?=
 =?us-ascii?Q?zczeuG45niEtosoTx/cofhp4To1jIkl1jlFGVLXnBFcN8/f2F/X8dK3y7E8y?=
 =?us-ascii?Q?GyxradXBRoMWmBiWJNLcKr7kWKniC3FAGc0LEDu6du5wItwd/SFK58u1lrZS?=
 =?us-ascii?Q?Ej5Jsiegfnx95mrUg5Mubc6ZGK/jcqdKtJ7kZWolQY1tOGxSXJYAmAPjKMmU?=
 =?us-ascii?Q?Hi4C+KluSB94KdjkI7ZVC+9fPottUUWs7TLPBjRwjz57t6kQZNp2yG/uheDs?=
 =?us-ascii?Q?Iev+ZfmlYdz+p/4UZyzhUV2SZJiibVQU6lqL4MODrT3SG4uMMxOmo6uBUrtQ?=
 =?us-ascii?Q?nA9+YLd9VicCUA20g/fcZoovpksbkw4s3pNNtQOIXGg9fvePiOh3PyZiG9zd?=
 =?us-ascii?Q?d5mVhk0JuFM3BAOBPoNnbMp/Z1wymdgM4ODuzDX7y+MkWbvCODXcjGmGwG5H?=
 =?us-ascii?Q?r355MqyDLI6oYf/r0aX44sDrlwhf1TxBRiSgsJhUZ58BV96Yi9ZOJ2sWp2h5?=
 =?us-ascii?Q?xwQNNwfHSscJR+96Ha6XyenC0nMewLJUz2WejUjkJwuwWmwf2EPMunYga4+R?=
 =?us-ascii?Q?jVimJ7Ox9Y1E+2YkA9dQgtoOlRfqUd7yb4pzDjGDw0WP+OlTTVGTf9bwQt6x?=
 =?us-ascii?Q?q5960HOAmx1zTlzsBFeDUYlKK0yrgVT0Cchf0qlF3KiELN+6QNQX5KBmBnaz?=
 =?us-ascii?Q?J3Eq7EB30pGK10mXnxaB1FeBJRbRPj6dr7MiMgkUG3SdHuw1vAlrL/NFf8lZ?=
 =?us-ascii?Q?KmF5dJGVnTEsuLK0cbFHt541Mm5CAi6a26RmfutLD2SEqG+XlYa2hQAA7yT3?=
 =?us-ascii?Q?Y0O5fwhTjij2mkfAdWEuMBL7mrMl7gqE+K+XXshnGKwbYxIS/BEFhqMKzFBW?=
 =?us-ascii?Q?+X6vL1mBRTgZ4BcPuQ9+3oJOS/AMnzdEtS3NymfxuowYqY49p4QL4yWMRcwS?=
 =?us-ascii?Q?HpGINUSZ+JseOZLqEpJNfA3wNVwG1XIdzJs8qKyvdi8P798fcrkELskdu2a1?=
 =?us-ascii?Q?5hWnjMNHqhqTGijsOWdqhDqKQiqzI8cTFExEtsiD9nBF6l7SGy2Jl3cgWUeE?=
 =?us-ascii?Q?7UdAArZ7kjcJ4o0SBbQz8k7f49Lu425U1pptFcRFvTp1IU2UeuE5o5GT62MS?=
 =?us-ascii?Q?SRlhJy7jaVlIODHauCJe7cdNvPnWUpNX6oTa6PekfTnt6kALQRojps8wdbDN?=
 =?us-ascii?Q?KyQfgUQL/MQzXImI6ay8m6eiCFrhySo/8WQB2wIfgTqPLHl9m8n1WVaklZOH?=
 =?us-ascii?Q?4F32isbVZcxpIRXZAvKROi3XNoXb/G7EioG1kTv4qrkpx/YqLm8Ab4YOXcN+?=
 =?us-ascii?Q?zLFNEXZxd8RvvXMZh2Me9NIeJa8aj11TBMEuRTfvI9a7QaqqUkMfz+AjI8+G?=
 =?us-ascii?Q?+TKPkk0sfPzroh7aT9serNVJ+NqZuSDPZbYvvoyoZF5iqT8tm05GgOtBLh+C?=
 =?us-ascii?Q?Tw7wRUxT3nbvef4qjncpTwR4JCnfiZ6XnyE1ENlBW/kIKsLQUm148DEORG1f?=
 =?us-ascii?Q?ql+v5MiS4m4T9sfreI6zlnq2nTeOALg4LBAfbPR18Oge877/kkVpVIn4vHZk?=
 =?us-ascii?Q?ambcOm0vJV41VCrdNmQwoywWwa3lErZa8C5AVO3/mohgl3O8jDeM+Saw/AFG?=
 =?us-ascii?Q?6GAwPNYqI0srHfW/VU493MM2OhaRFV+kDBrDLidMjnTdaO5WgUpmanTKruSm?=
 =?us-ascii?Q?3+f4ps0E/B3z2N9HmnBDPanEhBAi5ko=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ae2844-33a6-49ba-c0de-08decb6e0425
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:10:51.1335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gK2JG4gkCD13CntfVHQgkNVciKxLeVpKYEJIg+S+q1DjdlK1r1lCsPZrnL3NOBQJBeB5XL8VZOKPVCupP4oqDKBeNZReTxHlzTznH4Ny3zk=
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
	TAGGED_FROM(0.00)[bounces-38550-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6581868C670

We have only an7583 specific code in the pinctrl-an7583 kernel module,
so an7583 prefix is not necessary anymore. Remove it.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 599 ++++++++++++------------
 1 file changed, 300 insertions(+), 299 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 07a86aae3459..d4fbb12fc639 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -24,7 +24,7 @@
 #define GPIO_MDC_IO_MASTER_MODE_MASK		BIT(22)
 #define GPIO_PCM_SPI_CS4_MODE_MASK		BIT(21)
 #define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
-#define AN7583_GPIO_PCM_SPI_CS2_MODE_MASK	BIT(18)
+#define GPIO_PCM_SPI_CS2_MODE_MASK		BIT(18)
 #define GPIO_PCM_SPI_CS1_MODE_MASK		BIT(17)
 #define GPIO_PCM_SPI_MODE_MASK			BIT(16)
 #define GPIO_PCM2_MODE_MASK			BIT(13)
@@ -38,18 +38,18 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
-#define AN7583_MDIO_0_GPIO_MODE_MASK		BIT(26)
-#define AN7583_MDC_0_GPIO_MODE_MASK		BIT(25)
-#define AN7583_UART_RXD_GPIO_MODE_MASK		BIT(24)
-#define AN7583_UART_TXD_GPIO_MODE_MASK		BIT(23)
-#define AN7583_SPI_MISO_GPIO_MODE_MASK		BIT(22)
-#define AN7583_SPI_MOSI_GPIO_MODE_MASK		BIT(21)
-#define AN7583_SPI_CS_GPIO_MODE_MASK		BIT(20)
-#define AN7583_SPI_CLK_GPIO_MODE_MASK		BIT(19)
-#define AN7583_I2C1_SDA_GPIO_MODE_MASK		BIT(18)
-#define AN7583_I2C1_SCL_GPIO_MODE_MASK		BIT(17)
-#define AN7583_I2C0_SDA_GPIO_MODE_MASK		BIT(16)
-#define AN7583_I2C0_SCL_GPIO_MODE_MASK		BIT(15)
+#define MDIO_0_GPIO_MODE_MASK			BIT(26)
+#define MDC_0_GPIO_MODE_MASK			BIT(25)
+#define UART_RXD_GPIO_MODE_MASK			BIT(24)
+#define UART_TXD_GPIO_MODE_MASK			BIT(23)
+#define SPI_MISO_GPIO_MODE_MASK			BIT(22)
+#define SPI_MOSI_GPIO_MODE_MASK			BIT(21)
+#define SPI_CS_GPIO_MODE_MASK			BIT(20)
+#define SPI_CLK_GPIO_MODE_MASK			BIT(19)
+#define I2C1_SDA_GPIO_MODE_MASK			BIT(18)
+#define I2C1_SCL_GPIO_MODE_MASK			BIT(17)
+#define I2C0_SDA_GPIO_MODE_MASK			BIT(16)
+#define I2C0_SCL_GPIO_MODE_MASK			BIT(15)
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
 #define SIPO_RCLK_MODE_MASK			BIT(11)
@@ -93,32 +93,32 @@
 
 /* CONF */
 #define REG_I2C_SDA_E2				0x001c
-#define AN7583_I2C1_SCL_E2_MASK			BIT(16)
-#define AN7583_I2C1_SDA_E2_MASK			BIT(15)
+#define I2C1_SCL_E2_MASK			BIT(16)
+#define I2C1_SDA_E2_MASK			BIT(15)
 #define SPI_MISO_E2_MASK			BIT(14)
 #define SPI_MOSI_E2_MASK			BIT(13)
 #define SPI_CLK_E2_MASK				BIT(12)
 #define SPI_CS0_E2_MASK				BIT(11)
 #define PCIE1_RESET_E2_MASK			BIT(9)
 #define PCIE0_RESET_E2_MASK			BIT(8)
-#define AN7583_MDIO_0_E2_MASK			BIT(5)
-#define AN7583_MDC_0_E2_MASK			BIT(4)
+#define MDIO_0_E2_MASK				BIT(5)
+#define MDC_0_E2_MASK				BIT(4)
 #define UART1_RXD_E2_MASK			BIT(3)
 #define UART1_TXD_E2_MASK			BIT(2)
 #define I2C_SCL_E2_MASK				BIT(1)
 #define I2C_SDA_E2_MASK				BIT(0)
 
 #define REG_I2C_SDA_E4				0x0020
-#define AN7583_I2C1_SCL_E4_MASK			BIT(16)
-#define AN7583_I2C1_SDA_E4_MASK			BIT(15)
+#define I2C1_SCL_E4_MASK			BIT(16)
+#define I2C1_SDA_E4_MASK			BIT(15)
 #define SPI_MISO_E4_MASK			BIT(14)
 #define SPI_MOSI_E4_MASK			BIT(13)
 #define SPI_CLK_E4_MASK				BIT(12)
 #define SPI_CS0_E4_MASK				BIT(11)
 #define PCIE1_RESET_E4_MASK			BIT(9)
 #define PCIE0_RESET_E4_MASK			BIT(8)
-#define AN7583_MDIO_0_E4_MASK			BIT(5)
-#define AN7583_MDC_0_E4_MASK			BIT(4)
+#define MDIO_0_E4_MASK				BIT(5)
+#define MDC_0_E4_MASK				BIT(4)
 #define UART1_RXD_E4_MASK			BIT(3)
 #define UART1_TXD_E4_MASK			BIT(2)
 #define I2C_SCL_E4_MASK				BIT(1)
@@ -130,32 +130,32 @@
 #define REG_GPIO_H_E4				0x0030
 
 #define REG_I2C_SDA_PU				0x0044
-#define AN7583_I2C1_SCL_PU_MASK			BIT(16)
-#define AN7583_I2C1_SDA_PU_MASK			BIT(15)
+#define I2C1_SCL_PU_MASK			BIT(16)
+#define I2C1_SDA_PU_MASK			BIT(15)
 #define SPI_MISO_PU_MASK			BIT(14)
 #define SPI_MOSI_PU_MASK			BIT(13)
 #define SPI_CLK_PU_MASK				BIT(12)
 #define SPI_CS0_PU_MASK				BIT(11)
 #define PCIE1_RESET_PU_MASK			BIT(9)
 #define PCIE0_RESET_PU_MASK			BIT(8)
-#define AN7583_MDIO_0_PU_MASK			BIT(5)
-#define AN7583_MDC_0_PU_MASK			BIT(4)
+#define MDIO_0_PU_MASK				BIT(5)
+#define MDC_0_PU_MASK				BIT(4)
 #define UART1_RXD_PU_MASK			BIT(3)
 #define UART1_TXD_PU_MASK			BIT(2)
 #define I2C_SCL_PU_MASK				BIT(1)
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
-#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
+#define I2C1_SCL_PD_MASK			BIT(16)
+#define I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
 #define SPI_CS0_PD_MASK				BIT(11)
 #define PCIE1_RESET_PD_MASK			BIT(9)
 #define PCIE0_RESET_PD_MASK			BIT(8)
-#define AN7583_MDIO_0_PD_MASK			BIT(5)
-#define AN7583_MDC_0_PD_MASK			BIT(4)
+#define MDIO_0_PD_MASK				BIT(5)
+#define MDC_0_PD_MASK				BIT(4)
 #define UART1_RXD_PD_MASK			BIT(3)
 #define UART1_TXD_PD_MASK			BIT(2)
 #define I2C_SCL_PD_MASK				BIT(1)
@@ -333,7 +333,7 @@
 		.regmap_size = 2,					\
 	}
 
-static struct pinctrl_pin_desc an7583_pinctrl_pins[] = {
+static struct pinctrl_pin_desc pinctrl_pins[] = {
 	PINCTRL_PIN(2, "gpio0"),
 	PINCTRL_PIN(3, "gpio1"),
 	PINCTRL_PIN(4, "gpio2"),
@@ -389,176 +389,176 @@ static struct pinctrl_pin_desc an7583_pinctrl_pins[] = {
 	PINCTRL_PIN(54, "mdio_0"),
 };
 
-static const int an7583_pon_pins[] = { 15, 16, 17, 18, 19, 20 };
-static const int an7583_pon_tod_1pps_pins[] = { 32 };
-static const int an7583_gsw_tod_1pps_pins[] = { 32 };
-static const int an7583_sipo_pins[] = { 34, 35 };
-static const int an7583_sipo_rclk_pins[] = { 34, 35, 33 };
-static const int an7583_mdio_pins[] = { 43, 44 };
-static const int an7583_uart2_pins[] = { 34, 35 };
-static const int an7583_uart2_cts_rts_pins[] = { 32, 33 };
-static const int an7583_hsuart_pins[] = { 30, 31 };
-static const int an7583_hsuart_cts_rts_pins[] = { 28, 29 };
-static const int an7583_npu_uart_pins[] = { 7, 8 };
-static const int an7583_uart4_pins[] = { 7, 8 };
-static const int an7583_uart5_pins[] = { 23, 24 };
-static const int an7583_i2c0_pins[] = { 41, 42 };
-static const int an7583_i2c1_pins[] = { 43, 44 };
-static const int an7583_jtag_udi_pins[] = { 23, 24, 22, 25, 26 };
-static const int an7583_jtag_dfd_pins[] = { 23, 24, 22, 25, 26 };
-static const int an7583_pcm1_pins[] = { 10, 11, 12, 13, 14 };
-static const int an7583_pcm2_pins[] = { 28, 29, 30, 31, 24 };
-static const int an7583_spi_pins[] = { 28, 29, 30, 31 };
-static const int an7583_spi_quad_pins[] = { 25, 26 };
-static const int an7583_spi_cs1_pins[] = { 27 };
-static const int an7583_pcm_spi_pins[] = { 28, 29, 30, 31, 10, 11, 12, 13 };
-static const int an7583_pcm_spi_rst_pins[] = { 14 };
-static const int an7583_pcm_spi_cs1_pins[] = { 24 };
-static const int an7583_emmc_pins[] = {
+static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
+static const int pon_tod_1pps_pins[] = { 32 };
+static const int gsw_tod_1pps_pins[] = { 32 };
+static const int sipo_pins[] = { 34, 35 };
+static const int sipo_rclk_pins[] = { 34, 35, 33 };
+static const int mdio_pins[] = { 43, 44 };
+static const int uart2_pins[] = { 34, 35 };
+static const int uart2_cts_rts_pins[] = { 32, 33 };
+static const int hsuart_pins[] = { 30, 31 };
+static const int hsuart_cts_rts_pins[] = { 28, 29 };
+static const int npu_uart_pins[] = { 7, 8 };
+static const int uart4_pins[] = { 7, 8 };
+static const int uart5_pins[] = { 23, 24 };
+static const int i2c0_pins[] = { 41, 42 };
+static const int i2c1_pins[] = { 43, 44 };
+static const int jtag_udi_pins[] = { 23, 24, 22, 25, 26 };
+static const int jtag_dfd_pins[] = { 23, 24, 22, 25, 26 };
+static const int pcm1_pins[] = { 10, 11, 12, 13, 14 };
+static const int pcm2_pins[] = { 28, 29, 30, 31, 24 };
+static const int spi_pins[] = { 28, 29, 30, 31 };
+static const int spi_quad_pins[] = { 25, 26 };
+static const int spi_cs1_pins[] = { 27 };
+static const int pcm_spi_pins[] = { 28, 29, 30, 31, 10, 11, 12, 13 };
+static const int pcm_spi_rst_pins[] = { 14 };
+static const int pcm_spi_cs1_pins[] = { 24 };
+static const int emmc_pins[] = {
 	7, 8, 9, 22, 23, 24, 25, 26, 45, 46, 47
 };
-static const int an7583_pnand_pins[] = {
+static const int pnand_pins[] = {
 	7, 8, 9, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 45, 46, 47, 48
 };
-static const int an7583_gpio0_pins[] = { 2 };
-static const int an7583_gpio1_pins[] = { 3 };
-static const int an7583_gpio2_pins[] = { 4 };
-static const int an7583_gpio3_pins[] = { 5 };
-static const int an7583_gpio4_pins[] = { 6 };
-static const int an7583_gpio5_pins[] = { 7 };
-static const int an7583_gpio6_pins[] = { 8 };
-static const int an7583_gpio7_pins[] = { 9 };
-static const int an7583_gpio8_pins[] = { 10 };
-static const int an7583_gpio9_pins[] = { 11 };
-static const int an7583_gpio10_pins[] = { 12 };
-static const int an7583_gpio11_pins[] = { 13 };
-static const int an7583_gpio12_pins[] = { 14 };
-static const int an7583_gpio13_pins[] = { 15 };
-static const int an7583_gpio14_pins[] = { 16 };
-static const int an7583_gpio15_pins[] = { 17 };
-static const int an7583_gpio16_pins[] = { 18 };
-static const int an7583_gpio17_pins[] = { 19 };
-static const int an7583_gpio18_pins[] = { 20 };
-static const int an7583_gpio19_pins[] = { 21 };
-static const int an7583_gpio20_pins[] = { 22 };
-static const int an7583_gpio21_pins[] = { 23 };
-static const int an7583_gpio22_pins[] = { 24 };
-static const int an7583_gpio23_pins[] = { 25 };
-static const int an7583_gpio24_pins[] = { 26 };
-static const int an7583_gpio25_pins[] = { 27 };
-static const int an7583_gpio26_pins[] = { 28 };
-static const int an7583_gpio27_pins[] = { 29 };
-static const int an7583_gpio28_pins[] = { 30 };
-static const int an7583_gpio29_pins[] = { 31 };
-static const int an7583_gpio30_pins[] = { 32 };
-static const int an7583_gpio31_pins[] = { 33 };
-static const int an7583_gpio32_pins[] = { 34 };
-static const int an7583_gpio33_pins[] = { 35 };
-static const int an7583_gpio34_pins[] = { 36 };
-static const int an7583_gpio35_pins[] = { 37 };
-static const int an7583_gpio36_pins[] = { 38 };
-static const int an7583_gpio37_pins[] = { 39 };
-static const int an7583_gpio38_pins[] = { 40 };
-static const int an7583_gpio39_pins[] = { 41 };
-static const int an7583_gpio40_pins[] = { 42 };
-static const int an7583_gpio41_pins[] = { 43 };
-static const int an7583_gpio42_pins[] = { 44 };
-static const int an7583_gpio43_pins[] = { 45 };
-static const int an7583_gpio44_pins[] = { 46 };
-static const int an7583_gpio45_pins[] = { 47 };
-static const int an7583_gpio46_pins[] = { 48 };
-static const int an7583_gpio47_pins[] = { 49 };
-static const int an7583_gpio48_pins[] = { 50 };
-static const int an7583_gpio49_pins[] = { 51 };
-static const int an7583_gpio50_pins[] = { 52 };
-static const int an7583_gpio51_pins[] = { 53 };
-static const int an7583_gpio52_pins[] = { 54 };
-static const int an7583_pcie_reset0_pins[] = { 51 };
-static const int an7583_pcie_reset1_pins[] = { 52 };
-
-static const struct pingroup an7583_pinctrl_groups[] = {
-	PINCTRL_PIN_GROUP("pon", an7583_pon),
-	PINCTRL_PIN_GROUP("pon_tod_1pps", an7583_pon_tod_1pps),
-	PINCTRL_PIN_GROUP("gsw_tod_1pps", an7583_gsw_tod_1pps),
-	PINCTRL_PIN_GROUP("sipo", an7583_sipo),
-	PINCTRL_PIN_GROUP("sipo_rclk", an7583_sipo_rclk),
-	PINCTRL_PIN_GROUP("mdio", an7583_mdio),
-	PINCTRL_PIN_GROUP("uart2", an7583_uart2),
-	PINCTRL_PIN_GROUP("uart2_cts_rts", an7583_uart2_cts_rts),
-	PINCTRL_PIN_GROUP("hsuart", an7583_hsuart),
-	PINCTRL_PIN_GROUP("hsuart_cts_rts", an7583_hsuart_cts_rts),
-	PINCTRL_PIN_GROUP("npu_uart", an7583_npu_uart),
-	PINCTRL_PIN_GROUP("uart4", an7583_uart4),
-	PINCTRL_PIN_GROUP("uart5", an7583_uart5),
-	PINCTRL_PIN_GROUP("i2c0", an7583_i2c0),
-	PINCTRL_PIN_GROUP("i2c1", an7583_i2c1),
-	PINCTRL_PIN_GROUP("jtag_udi", an7583_jtag_udi),
-	PINCTRL_PIN_GROUP("jtag_dfd", an7583_jtag_dfd),
-	PINCTRL_PIN_GROUP("pcm1", an7583_pcm1),
-	PINCTRL_PIN_GROUP("pcm2", an7583_pcm2),
-	PINCTRL_PIN_GROUP("spi", an7583_spi),
-	PINCTRL_PIN_GROUP("spi_quad", an7583_spi_quad),
-	PINCTRL_PIN_GROUP("spi_cs1", an7583_spi_cs1),
-	PINCTRL_PIN_GROUP("pcm_spi", an7583_pcm_spi),
-	PINCTRL_PIN_GROUP("pcm_spi_rst", an7583_pcm_spi_rst),
-	PINCTRL_PIN_GROUP("pcm_spi_cs1", an7583_pcm_spi_cs1),
-	PINCTRL_PIN_GROUP("emmc", an7583_emmc),
-	PINCTRL_PIN_GROUP("pnand", an7583_pnand),
-	PINCTRL_PIN_GROUP("gpio0", an7583_gpio0),
-	PINCTRL_PIN_GROUP("gpio1", an7583_gpio1),
-	PINCTRL_PIN_GROUP("gpio2", an7583_gpio2),
-	PINCTRL_PIN_GROUP("gpio3", an7583_gpio3),
-	PINCTRL_PIN_GROUP("gpio4", an7583_gpio4),
-	PINCTRL_PIN_GROUP("gpio5", an7583_gpio5),
-	PINCTRL_PIN_GROUP("gpio6", an7583_gpio6),
-	PINCTRL_PIN_GROUP("gpio7", an7583_gpio7),
-	PINCTRL_PIN_GROUP("gpio8", an7583_gpio8),
-	PINCTRL_PIN_GROUP("gpio9", an7583_gpio9),
-	PINCTRL_PIN_GROUP("gpio10", an7583_gpio10),
-	PINCTRL_PIN_GROUP("gpio11", an7583_gpio11),
-	PINCTRL_PIN_GROUP("gpio12", an7583_gpio12),
-	PINCTRL_PIN_GROUP("gpio13", an7583_gpio13),
-	PINCTRL_PIN_GROUP("gpio14", an7583_gpio14),
-	PINCTRL_PIN_GROUP("gpio15", an7583_gpio15),
-	PINCTRL_PIN_GROUP("gpio16", an7583_gpio16),
-	PINCTRL_PIN_GROUP("gpio17", an7583_gpio17),
-	PINCTRL_PIN_GROUP("gpio18", an7583_gpio18),
-	PINCTRL_PIN_GROUP("gpio19", an7583_gpio19),
-	PINCTRL_PIN_GROUP("gpio20", an7583_gpio20),
-	PINCTRL_PIN_GROUP("gpio21", an7583_gpio21),
-	PINCTRL_PIN_GROUP("gpio22", an7583_gpio22),
-	PINCTRL_PIN_GROUP("gpio23", an7583_gpio23),
-	PINCTRL_PIN_GROUP("gpio24", an7583_gpio24),
-	PINCTRL_PIN_GROUP("gpio25", an7583_gpio25),
-	PINCTRL_PIN_GROUP("gpio26", an7583_gpio26),
-	PINCTRL_PIN_GROUP("gpio27", an7583_gpio27),
-	PINCTRL_PIN_GROUP("gpio28", an7583_gpio28),
-	PINCTRL_PIN_GROUP("gpio29", an7583_gpio29),
-	PINCTRL_PIN_GROUP("gpio30", an7583_gpio30),
-	PINCTRL_PIN_GROUP("gpio31", an7583_gpio31),
-	PINCTRL_PIN_GROUP("gpio32", an7583_gpio32),
-	PINCTRL_PIN_GROUP("gpio33", an7583_gpio33),
-	PINCTRL_PIN_GROUP("gpio34", an7583_gpio34),
-	PINCTRL_PIN_GROUP("gpio35", an7583_gpio35),
-	PINCTRL_PIN_GROUP("gpio36", an7583_gpio36),
-	PINCTRL_PIN_GROUP("gpio37", an7583_gpio37),
-	PINCTRL_PIN_GROUP("gpio38", an7583_gpio38),
-	PINCTRL_PIN_GROUP("gpio39", an7583_gpio39),
-	PINCTRL_PIN_GROUP("gpio40", an7583_gpio40),
-	PINCTRL_PIN_GROUP("gpio41", an7583_gpio41),
-	PINCTRL_PIN_GROUP("gpio42", an7583_gpio42),
-	PINCTRL_PIN_GROUP("gpio43", an7583_gpio43),
-	PINCTRL_PIN_GROUP("gpio44", an7583_gpio44),
-	PINCTRL_PIN_GROUP("gpio45", an7583_gpio45),
-	PINCTRL_PIN_GROUP("gpio46", an7583_gpio46),
-	PINCTRL_PIN_GROUP("gpio47", an7583_gpio47),
-	PINCTRL_PIN_GROUP("gpio48", an7583_gpio48),
-	PINCTRL_PIN_GROUP("gpio49", an7583_gpio49),
-	PINCTRL_PIN_GROUP("gpio50", an7583_gpio50),
-	PINCTRL_PIN_GROUP("gpio51", an7583_gpio51),
-	PINCTRL_PIN_GROUP("gpio52", an7583_gpio52),
-	PINCTRL_PIN_GROUP("pcie_reset0", an7583_pcie_reset0),
-	PINCTRL_PIN_GROUP("pcie_reset1", an7583_pcie_reset1),
+static const int gpio0_pins[] = { 2 };
+static const int gpio1_pins[] = { 3 };
+static const int gpio2_pins[] = { 4 };
+static const int gpio3_pins[] = { 5 };
+static const int gpio4_pins[] = { 6 };
+static const int gpio5_pins[] = { 7 };
+static const int gpio6_pins[] = { 8 };
+static const int gpio7_pins[] = { 9 };
+static const int gpio8_pins[] = { 10 };
+static const int gpio9_pins[] = { 11 };
+static const int gpio10_pins[] = { 12 };
+static const int gpio11_pins[] = { 13 };
+static const int gpio12_pins[] = { 14 };
+static const int gpio13_pins[] = { 15 };
+static const int gpio14_pins[] = { 16 };
+static const int gpio15_pins[] = { 17 };
+static const int gpio16_pins[] = { 18 };
+static const int gpio17_pins[] = { 19 };
+static const int gpio18_pins[] = { 20 };
+static const int gpio19_pins[] = { 21 };
+static const int gpio20_pins[] = { 22 };
+static const int gpio21_pins[] = { 23 };
+static const int gpio22_pins[] = { 24 };
+static const int gpio23_pins[] = { 25 };
+static const int gpio24_pins[] = { 26 };
+static const int gpio25_pins[] = { 27 };
+static const int gpio26_pins[] = { 28 };
+static const int gpio27_pins[] = { 29 };
+static const int gpio28_pins[] = { 30 };
+static const int gpio29_pins[] = { 31 };
+static const int gpio30_pins[] = { 32 };
+static const int gpio31_pins[] = { 33 };
+static const int gpio32_pins[] = { 34 };
+static const int gpio33_pins[] = { 35 };
+static const int gpio34_pins[] = { 36 };
+static const int gpio35_pins[] = { 37 };
+static const int gpio36_pins[] = { 38 };
+static const int gpio37_pins[] = { 39 };
+static const int gpio38_pins[] = { 40 };
+static const int gpio39_pins[] = { 41 };
+static const int gpio40_pins[] = { 42 };
+static const int gpio41_pins[] = { 43 };
+static const int gpio42_pins[] = { 44 };
+static const int gpio43_pins[] = { 45 };
+static const int gpio44_pins[] = { 46 };
+static const int gpio45_pins[] = { 47 };
+static const int gpio46_pins[] = { 48 };
+static const int gpio47_pins[] = { 49 };
+static const int gpio48_pins[] = { 50 };
+static const int gpio49_pins[] = { 51 };
+static const int gpio50_pins[] = { 52 };
+static const int gpio51_pins[] = { 53 };
+static const int gpio52_pins[] = { 54 };
+static const int pcie_reset0_pins[] = { 51 };
+static const int pcie_reset1_pins[] = { 52 };
+
+static const struct pingroup pinctrl_groups[] = {
+	PINCTRL_PIN_GROUP("pon", pon),
+	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
+	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
+	PINCTRL_PIN_GROUP("sipo", sipo),
+	PINCTRL_PIN_GROUP("sipo_rclk", sipo_rclk),
+	PINCTRL_PIN_GROUP("mdio", mdio),
+	PINCTRL_PIN_GROUP("uart2", uart2),
+	PINCTRL_PIN_GROUP("uart2_cts_rts", uart2_cts_rts),
+	PINCTRL_PIN_GROUP("hsuart", hsuart),
+	PINCTRL_PIN_GROUP("hsuart_cts_rts", hsuart_cts_rts),
+	PINCTRL_PIN_GROUP("npu_uart", npu_uart),
+	PINCTRL_PIN_GROUP("uart4", uart4),
+	PINCTRL_PIN_GROUP("uart5", uart5),
+	PINCTRL_PIN_GROUP("i2c0", i2c0),
+	PINCTRL_PIN_GROUP("i2c1", i2c1),
+	PINCTRL_PIN_GROUP("jtag_udi", jtag_udi),
+	PINCTRL_PIN_GROUP("jtag_dfd", jtag_dfd),
+	PINCTRL_PIN_GROUP("pcm1", pcm1),
+	PINCTRL_PIN_GROUP("pcm2", pcm2),
+	PINCTRL_PIN_GROUP("spi", spi),
+	PINCTRL_PIN_GROUP("spi_quad", spi_quad),
+	PINCTRL_PIN_GROUP("spi_cs1", spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi", pcm_spi),
+	PINCTRL_PIN_GROUP("pcm_spi_rst", pcm_spi_rst),
+	PINCTRL_PIN_GROUP("pcm_spi_cs1", pcm_spi_cs1),
+	PINCTRL_PIN_GROUP("emmc", emmc),
+	PINCTRL_PIN_GROUP("pnand", pnand),
+	PINCTRL_PIN_GROUP("gpio0", gpio0),
+	PINCTRL_PIN_GROUP("gpio1", gpio1),
+	PINCTRL_PIN_GROUP("gpio2", gpio2),
+	PINCTRL_PIN_GROUP("gpio3", gpio3),
+	PINCTRL_PIN_GROUP("gpio4", gpio4),
+	PINCTRL_PIN_GROUP("gpio5", gpio5),
+	PINCTRL_PIN_GROUP("gpio6", gpio6),
+	PINCTRL_PIN_GROUP("gpio7", gpio7),
+	PINCTRL_PIN_GROUP("gpio8", gpio8),
+	PINCTRL_PIN_GROUP("gpio9", gpio9),
+	PINCTRL_PIN_GROUP("gpio10", gpio10),
+	PINCTRL_PIN_GROUP("gpio11", gpio11),
+	PINCTRL_PIN_GROUP("gpio12", gpio12),
+	PINCTRL_PIN_GROUP("gpio13", gpio13),
+	PINCTRL_PIN_GROUP("gpio14", gpio14),
+	PINCTRL_PIN_GROUP("gpio15", gpio15),
+	PINCTRL_PIN_GROUP("gpio16", gpio16),
+	PINCTRL_PIN_GROUP("gpio17", gpio17),
+	PINCTRL_PIN_GROUP("gpio18", gpio18),
+	PINCTRL_PIN_GROUP("gpio19", gpio19),
+	PINCTRL_PIN_GROUP("gpio20", gpio20),
+	PINCTRL_PIN_GROUP("gpio21", gpio21),
+	PINCTRL_PIN_GROUP("gpio22", gpio22),
+	PINCTRL_PIN_GROUP("gpio23", gpio23),
+	PINCTRL_PIN_GROUP("gpio24", gpio24),
+	PINCTRL_PIN_GROUP("gpio25", gpio25),
+	PINCTRL_PIN_GROUP("gpio26", gpio26),
+	PINCTRL_PIN_GROUP("gpio27", gpio27),
+	PINCTRL_PIN_GROUP("gpio28", gpio28),
+	PINCTRL_PIN_GROUP("gpio29", gpio29),
+	PINCTRL_PIN_GROUP("gpio30", gpio30),
+	PINCTRL_PIN_GROUP("gpio31", gpio31),
+	PINCTRL_PIN_GROUP("gpio32", gpio32),
+	PINCTRL_PIN_GROUP("gpio33", gpio33),
+	PINCTRL_PIN_GROUP("gpio34", gpio34),
+	PINCTRL_PIN_GROUP("gpio35", gpio35),
+	PINCTRL_PIN_GROUP("gpio36", gpio36),
+	PINCTRL_PIN_GROUP("gpio37", gpio37),
+	PINCTRL_PIN_GROUP("gpio38", gpio38),
+	PINCTRL_PIN_GROUP("gpio39", gpio39),
+	PINCTRL_PIN_GROUP("gpio40", gpio40),
+	PINCTRL_PIN_GROUP("gpio41", gpio41),
+	PINCTRL_PIN_GROUP("gpio42", gpio42),
+	PINCTRL_PIN_GROUP("gpio43", gpio43),
+	PINCTRL_PIN_GROUP("gpio44", gpio44),
+	PINCTRL_PIN_GROUP("gpio45", gpio45),
+	PINCTRL_PIN_GROUP("gpio46", gpio46),
+	PINCTRL_PIN_GROUP("gpio47", gpio47),
+	PINCTRL_PIN_GROUP("gpio48", gpio48),
+	PINCTRL_PIN_GROUP("gpio49", gpio49),
+	PINCTRL_PIN_GROUP("gpio50", gpio50),
+	PINCTRL_PIN_GROUP("gpio51", gpio51),
+	PINCTRL_PIN_GROUP("gpio52", gpio52),
+	PINCTRL_PIN_GROUP("pcie_reset0", pcie_reset0),
+	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
 };
 
 static const char *const pon_groups[] = { "pon" };
@@ -566,7 +566,7 @@ static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
 static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
-static const char *const an7583_mdio_groups[] = { "mdio" };
+static const char *const mdio_groups[] = { "mdio" };
 static const char *const uart_groups[] = {
 	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
 	"uart4", "uart5"
@@ -574,20 +574,20 @@ static const char *const uart_groups[] = {
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
 static const char *const spi_groups[] = { "spi_quad", "spi_cs1" };
-static const char *const an7583_pcm_spi_groups[] = {
+static const char *const pcm_spi_groups[] = {
 	"pcm_spi", "pcm_spi_rst", "pcm_spi_cs1"
 };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
-static const char *const an7583_gpio_groups[] = {
+static const char *const gpio_groups[] = {
 	"gpio39", "gpio40", "gpio41", "gpio42", "gpio43",
 	"gpio44", "gpio45", "gpio46", "gpio47", "gpio48",
 	"gpio49", "gpio50", "gpio51", "gpio52"
 };
-static const char *const an7583_pcie_reset_groups[] = {
+static const char *const pcie_reset_groups[] = {
 	"pcie_reset0", "pcie_reset1"
 };
-static const char *const an7583_pwm_groups[] = {
+static const char *const pwm_groups[] = {
 	"gpio0",  "gpio1",  "gpio2",  "gpio3",  "gpio4",  "gpio5",
 	"gpio6",  "gpio7",  "gpio8",  "gpio9",  "gpio10", "gpio11",
 	"gpio12", "gpio13", "gpio14", "gpio15", "gpio16", "gpio17",
@@ -597,28 +597,28 @@ static const char *const an7583_pwm_groups[] = {
 	"gpio40", "gpio41", "gpio42", "gpio43", "gpio44", "gpio45",
 	"gpio46", "gpio47", "gpio48", "gpio49", "gpio50", "gpio51"
 };
-static const char *const an7583_phy1_led0_groups[] = {
+static const char *const phy1_led0_groups[] = {
 	"gpio1", "gpio2", "gpio3", "gpio4"
 };
-static const char *const an7583_phy2_led0_groups[] = {
+static const char *const phy2_led0_groups[] = {
 	"gpio1", "gpio2", "gpio3", "gpio4"
 };
-static const char *const an7583_phy3_led0_groups[] = {
+static const char *const phy3_led0_groups[] = {
 	"gpio1", "gpio2", "gpio3", "gpio4"
 };
-static const char *const an7583_phy4_led0_groups[] = {
+static const char *const phy4_led0_groups[] = {
 	"gpio1", "gpio2", "gpio3", "gpio4"
 };
-static const char *const an7583_phy1_led1_groups[] = {
+static const char *const phy1_led1_groups[] = {
 	"gpio8", "gpio9", "gpio10", "gpio11"
 };
-static const char *const an7583_phy2_led1_groups[] = {
+static const char *const phy2_led1_groups[] = {
 	"gpio8", "gpio9", "gpio10", "gpio11"
 };
-static const char *const an7583_phy3_led1_groups[] = {
+static const char *const phy3_led1_groups[] = {
 	"gpio8", "gpio9", "gpio10", "gpio11"
 };
-static const char *const an7583_phy4_led1_groups[] = {
+static const char *const phy4_led1_groups[] = {
 	"gpio8", "gpio9", "gpio10", "gpio11"
 };
 
@@ -679,7 +679,7 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
 	},
 };
 
-static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
+static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 	{
 		.name = "mdio",
 		.regmap[0] = {
@@ -850,7 +850,7 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 	},
 };
 
-static const struct airoha_pinctrl_func_group an7583_pcm_spi_func_group[] = {
+static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 	{
 		.name = "pcm_spi",
 		.regmap[0] = {
@@ -892,8 +892,8 @@ static const struct airoha_pinctrl_func_group an7583_pcm_spi_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_SPI_CS1_MODE,
-			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK,
-			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK
+			GPIO_PCM_SPI_CS2_MODE_MASK,
+			GPIO_PCM_SPI_CS2_MODE_MASK
 		},
 		.regmap_size = 1,
 	}, {
@@ -943,37 +943,37 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
 	},
 };
 
-static const struct airoha_pinctrl_func_group an7583_gpio_func_group[] = {
+static const struct airoha_pinctrl_func_group gpio_func_group[] = {
 	AIROHA_PINCTRL_GPIO_EXT("gpio39", GPIO39_FLASH_MODE_CFG,
-				AN7583_I2C0_SCL_GPIO_MODE_MASK),
+				I2C0_SCL_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio40", GPIO40_FLASH_MODE_CFG,
-				AN7583_I2C0_SDA_GPIO_MODE_MASK),
+				I2C0_SDA_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio41", GPIO41_FLASH_MODE_CFG,
-				AN7583_I2C1_SCL_GPIO_MODE_MASK),
+				I2C1_SCL_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio42", GPIO42_FLASH_MODE_CFG,
-				AN7583_I2C1_SDA_GPIO_MODE_MASK),
+				I2C1_SDA_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio43", GPIO43_FLASH_MODE_CFG,
-				AN7583_SPI_CLK_GPIO_MODE_MASK),
+				SPI_CLK_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
-				AN7583_SPI_CS_GPIO_MODE_MASK),
+				SPI_CS_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
-				AN7583_SPI_MOSI_GPIO_MODE_MASK),
+				SPI_MOSI_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
-				AN7583_SPI_MISO_GPIO_MODE_MASK),
+				SPI_MISO_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
-				AN7583_UART_TXD_GPIO_MODE_MASK),
+				UART_TXD_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
-				AN7583_UART_RXD_GPIO_MODE_MASK),
+				UART_RXD_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
 				GPIO_PCIE_RESET0_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio50", GPIO50_FLASH_MODE_CFG,
 				GPIO_PCIE_RESET1_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio51", GPIO51_FLASH_MODE_CFG,
-				AN7583_MDC_0_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_GPIO("gpio52", AN7583_MDIO_0_GPIO_MODE_MASK),
+				MDC_0_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO("gpio52", MDIO_0_GPIO_MODE_MASK),
 };
 
-static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
+static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
 		.regmap[0] = {
@@ -995,7 +995,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 	},
 };
 
-static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
+static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
@@ -1032,34 +1032,34 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio39", GPIO39_FLASH_MODE_CFG,
-				   AN7583_I2C0_SCL_GPIO_MODE_MASK),
+				   I2C0_SCL_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio40", GPIO40_FLASH_MODE_CFG,
-				   AN7583_I2C0_SDA_GPIO_MODE_MASK),
+				   I2C0_SDA_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio41", GPIO41_FLASH_MODE_CFG,
-				   AN7583_I2C1_SCL_GPIO_MODE_MASK),
+				   I2C1_SCL_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio42", GPIO42_FLASH_MODE_CFG,
-				   AN7583_I2C1_SDA_GPIO_MODE_MASK),
+				   I2C1_SDA_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio43", GPIO43_FLASH_MODE_CFG,
-				   AN7583_SPI_CLK_GPIO_MODE_MASK),
+				   SPI_CLK_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
-				   AN7583_SPI_CS_GPIO_MODE_MASK),
+				   SPI_CS_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
-				   AN7583_SPI_MOSI_GPIO_MODE_MASK),
+				   SPI_MOSI_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
-				   AN7583_SPI_MISO_GPIO_MODE_MASK),
+				   SPI_MISO_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
-				   AN7583_UART_TXD_GPIO_MODE_MASK),
+				   UART_TXD_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
-				   AN7583_UART_RXD_GPIO_MODE_MASK),
+				   UART_RXD_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
 				   GPIO_PCIE_RESET0_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio50", GPIO50_FLASH_MODE_CFG,
 				   GPIO_PCIE_RESET1_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio51", GPIO51_FLASH_MODE_CFG,
-				   AN7583_MDC_0_GPIO_MODE_MASK),
+				   MDC_0_GPIO_MODE_MASK),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy1_led0_func_group[] = {
+static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
 	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
@@ -1070,7 +1070,7 @@ static const struct airoha_pinctrl_func_group an7583_phy1_led0_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy2_led0_func_group[] = {
+static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
 	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
@@ -1081,7 +1081,7 @@ static const struct airoha_pinctrl_func_group an7583_phy2_led0_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy3_led0_func_group[] = {
+static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
 	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
@@ -1092,7 +1092,7 @@ static const struct airoha_pinctrl_func_group an7583_phy3_led0_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy4_led0_func_group[] = {
+static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
@@ -1103,7 +1103,7 @@ static const struct airoha_pinctrl_func_group an7583_phy4_led0_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy1_led1_func_group[] = {
+static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
 	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
@@ -1114,7 +1114,7 @@ static const struct airoha_pinctrl_func_group an7583_phy1_led1_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy2_led1_func_group[] = {
+static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
 	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
@@ -1125,7 +1125,7 @@ static const struct airoha_pinctrl_func_group an7583_phy2_led1_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy3_led1_func_group[] = {
+static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
 	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
@@ -1136,7 +1136,7 @@ static const struct airoha_pinctrl_func_group an7583_phy3_led1_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy4_led1_func_group[] = {
+static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
@@ -1147,31 +1147,32 @@ static const struct airoha_pinctrl_func_group an7583_phy4_led1_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
-static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
+static const struct airoha_pinctrl_func pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pon", pon),
 	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
 	PINCTRL_FUNC_DESC("sipo", sipo),
-	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
+	PINCTRL_FUNC_DESC("mdio", mdio),
 	PINCTRL_FUNC_DESC("uart", uart),
 	PINCTRL_FUNC_DESC("jtag", jtag),
 	PINCTRL_FUNC_DESC("pcm", pcm),
 	PINCTRL_FUNC_DESC("spi", spi),
-	PINCTRL_FUNC_DESC("pcm_spi", an7583_pcm_spi),
+	PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
-	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
-	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
-	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
-	PINCTRL_FUNC_DESC("phy2_led0", an7583_phy2_led0),
-	PINCTRL_FUNC_DESC("phy3_led0", an7583_phy3_led0),
-	PINCTRL_FUNC_DESC("phy4_led0", an7583_phy4_led0),
-	PINCTRL_FUNC_DESC("phy1_led1", an7583_phy1_led1),
-	PINCTRL_FUNC_DESC("phy2_led1", an7583_phy2_led1),
-	PINCTRL_FUNC_DESC("phy3_led1", an7583_phy3_led1),
-	PINCTRL_FUNC_DESC("phy4_led1", an7583_phy4_led1),
+	PINCTRL_FUNC_DESC("gpio", gpio),
+	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
+	PINCTRL_FUNC_DESC("pwm", pwm),
+	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
+	PINCTRL_FUNC_DESC("phy2_led0", phy2_led0),
+	PINCTRL_FUNC_DESC("phy3_led0", phy3_led0),
+	PINCTRL_FUNC_DESC("phy4_led0", phy4_led0),
+	PINCTRL_FUNC_DESC("phy1_led1", phy1_led1),
+	PINCTRL_FUNC_DESC("phy2_led1", phy2_led1),
+	PINCTRL_FUNC_DESC("phy3_led1", phy3_led1),
+	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
 };
 
-static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(2, REG_GPIO_L_PU, BIT(0)),
 	PINCTRL_CONF_DESC(3, REG_GPIO_L_PU, BIT(1)),
 	PINCTRL_CONF_DESC(4, REG_GPIO_L_PU, BIT(2)),
@@ -1213,8 +1214,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(40, REG_GPIO_H_PU, BIT(6)),
 	PINCTRL_CONF_DESC(41, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
 	PINCTRL_CONF_DESC(42, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
-	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PU, AN7583_I2C1_SCL_PU_MASK),
-	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PU, AN7583_I2C1_SDA_PU_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PU, I2C1_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PU, I2C1_SDA_PU_MASK),
 	PINCTRL_CONF_DESC(45, REG_I2C_SDA_PU, SPI_CLK_PU_MASK),
 	PINCTRL_CONF_DESC(46, REG_I2C_SDA_PU, SPI_CS0_PU_MASK),
 	PINCTRL_CONF_DESC(47, REG_I2C_SDA_PU, SPI_MOSI_PU_MASK),
@@ -1223,11 +1224,11 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(50, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
 	PINCTRL_CONF_DESC(51, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
 	PINCTRL_CONF_DESC(52, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PU, AN7583_MDC_0_PU_MASK),
-	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PU, AN7583_MDIO_0_PU_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PU, MDC_0_PU_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PU, MDIO_0_PU_MASK),
 };
 
-static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(2, REG_GPIO_L_PD, BIT(0)),
 	PINCTRL_CONF_DESC(3, REG_GPIO_L_PD, BIT(1)),
 	PINCTRL_CONF_DESC(4, REG_GPIO_L_PD, BIT(2)),
@@ -1269,8 +1270,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(40, REG_GPIO_H_PD, BIT(6)),
 	PINCTRL_CONF_DESC(41, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
 	PINCTRL_CONF_DESC(42, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
-	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PD, AN7583_I2C1_SCL_PD_MASK),
-	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PD, AN7583_I2C1_SDA_PD_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PD, I2C1_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PD, I2C1_SDA_PD_MASK),
 	PINCTRL_CONF_DESC(45, REG_I2C_SDA_PD, SPI_CLK_PD_MASK),
 	PINCTRL_CONF_DESC(46, REG_I2C_SDA_PD, SPI_CS0_PD_MASK),
 	PINCTRL_CONF_DESC(47, REG_I2C_SDA_PD, SPI_MOSI_PD_MASK),
@@ -1279,11 +1280,11 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(50, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
 	PINCTRL_CONF_DESC(51, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
 	PINCTRL_CONF_DESC(52, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PD, AN7583_MDC_0_PD_MASK),
-	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PD, AN7583_MDIO_0_PD_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PD, MDC_0_PD_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PD, MDIO_0_PD_MASK),
 };
 
-static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(2, REG_GPIO_L_E2, BIT(0)),
 	PINCTRL_CONF_DESC(3, REG_GPIO_L_E2, BIT(1)),
 	PINCTRL_CONF_DESC(4, REG_GPIO_L_E2, BIT(2)),
@@ -1325,8 +1326,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(40, REG_GPIO_H_E2, BIT(6)),
 	PINCTRL_CONF_DESC(41, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
 	PINCTRL_CONF_DESC(42, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
-	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E2, AN7583_I2C1_SCL_E2_MASK),
-	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E2, AN7583_I2C1_SDA_E2_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E2, I2C1_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E2, I2C1_SDA_E2_MASK),
 	PINCTRL_CONF_DESC(45, REG_I2C_SDA_E2, SPI_CLK_E2_MASK),
 	PINCTRL_CONF_DESC(46, REG_I2C_SDA_E2, SPI_CS0_E2_MASK),
 	PINCTRL_CONF_DESC(47, REG_I2C_SDA_E2, SPI_MOSI_E2_MASK),
@@ -1335,11 +1336,11 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(50, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
 	PINCTRL_CONF_DESC(51, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
 	PINCTRL_CONF_DESC(52, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E2, AN7583_MDC_0_E2_MASK),
-	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E2, AN7583_MDIO_0_E2_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E2, MDC_0_E2_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E2, MDIO_0_E2_MASK),
 };
 
-static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(2, REG_GPIO_L_E4, BIT(0)),
 	PINCTRL_CONF_DESC(3, REG_GPIO_L_E4, BIT(1)),
 	PINCTRL_CONF_DESC(4, REG_GPIO_L_E4, BIT(2)),
@@ -1381,8 +1382,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(40, REG_GPIO_H_E4, BIT(6)),
 	PINCTRL_CONF_DESC(41, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
 	PINCTRL_CONF_DESC(42, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
-	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E4, AN7583_I2C1_SCL_E4_MASK),
-	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E4, AN7583_I2C1_SDA_E4_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E4, I2C1_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E4, I2C1_SDA_E4_MASK),
 	PINCTRL_CONF_DESC(45, REG_I2C_SDA_E4, SPI_CLK_E4_MASK),
 	PINCTRL_CONF_DESC(46, REG_I2C_SDA_E4, SPI_CS0_E4_MASK),
 	PINCTRL_CONF_DESC(47, REG_I2C_SDA_E4, SPI_MOSI_E4_MASK),
@@ -1391,48 +1392,48 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(50, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
 	PINCTRL_CONF_DESC(51, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
 	PINCTRL_CONF_DESC(52, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E4, AN7583_MDC_0_E4_MASK),
-	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E4, AN7583_MDIO_0_E4_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E4, MDC_0_E4_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E4, MDIO_0_E4_MASK),
 };
 
-static const struct airoha_pinctrl_conf an7583_pinctrl_pcie_rst_od_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 	PINCTRL_CONF_DESC(51, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
 	PINCTRL_CONF_DESC(52, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
 };
 
-static const struct airoha_pinctrl_match_data an7583_pinctrl_match_data = {
-	.pins = an7583_pinctrl_pins,
-	.num_pins = ARRAY_SIZE(an7583_pinctrl_pins),
-	.grps = an7583_pinctrl_groups,
-	.num_grps = ARRAY_SIZE(an7583_pinctrl_groups),
-	.funcs = an7583_pinctrl_funcs,
-	.num_funcs = ARRAY_SIZE(an7583_pinctrl_funcs),
+static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.pins = pinctrl_pins,
+	.num_pins = ARRAY_SIZE(pinctrl_pins),
+	.grps = pinctrl_groups,
+	.num_grps = ARRAY_SIZE(pinctrl_groups),
+	.funcs = pinctrl_funcs,
+	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
 	.confs_info = {
 		[AIROHA_PINCTRL_CONFS_PULLUP] = {
-			.confs = an7583_pinctrl_pullup_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_pullup_conf),
+			.confs = pinctrl_pullup_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pullup_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
-			.confs = an7583_pinctrl_pulldown_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_pulldown_conf),
+			.confs = pinctrl_pulldown_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pulldown_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
-			.confs = an7583_pinctrl_drive_e2_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e2_conf),
+			.confs = pinctrl_drive_e2_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_drive_e2_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
-			.confs = an7583_pinctrl_drive_e4_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e4_conf),
+			.confs = pinctrl_drive_e4_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_drive_e4_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] = {
-			.confs = an7583_pinctrl_pcie_rst_od_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_pcie_rst_od_conf),
+			.confs = pinctrl_pcie_rst_od_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pcie_rst_od_conf),
 		},
 	},
 };
 
 static const struct of_device_id airoha_pinctrl_of_match[] = {
-	{ .compatible = "airoha,an7583-pinctrl", .data = &an7583_pinctrl_match_data },
+	{ .compatible = "airoha,an7583-pinctrl", .data = &pinctrl_match_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
-- 
2.53.0


