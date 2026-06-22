Return-Path: <linux-gpio+bounces-38804-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rLbOEJodOWpPnAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38804-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:33:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E766AF1D6
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:33:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=XYHV3mQp;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38804-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38804-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1991304C902
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80662773F7;
	Mon, 22 Jun 2026 11:31:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021119.outbound.protection.outlook.com [52.101.70.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D292C2D0C92;
	Mon, 22 Jun 2026 11:31:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127884; cv=fail; b=jYcNYMKkvoZpFTEpHMg4cUVfZFxo6Di/E9c2JbvmyI+xixA5uc1qNe4Y9L89pYizXoGMNpBPc45mzrBS2ABX1bIg07gCALcAhXXiVH33AxAkBJPW5RwF4RhCIgX0a0mypskUtqPGxFvjJ5ruTUGCmlpMFYhMI+CibnypTxzUISM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127884; c=relaxed/simple;
	bh=3h33of2DFg6bq8qyPzYOdlin+CbHIMaTh3snl+bUtCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b+Jzm6/xXYYPJ/g92Vx6AE46LU1xncTb8tD4THL7fzN5PTR+lskFl4FtyoH4qbG7OUdzoicxjOiteDJLZ3ZITw9c9k2LMKA3DewqWEUZ8DbrWVhWlknZrWwOAy/qB+fym1W8+49C97bEKS1/4TVUCzW042/7YRVcuO3TQs4nHFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=XYHV3mQp; arc=fail smtp.client-ip=52.101.70.119
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBh65uax3k65SDfhcs+XSfhREMSzlsZqwi3eEzv0cyRd1OY6uBOnN8oQcbmpMXt02hkOAbG3I+l4ZFR2G4nbuz5VsRYW66NalnDY7Wbd1IRQ3gH+wtIGpDK6QFTpiQLcmyCn4Dzm32FWaglRJDcBeHXInVyRT+/9qGIgmpgfsZvuO4gf9gVXpZb6wr0zB6RLCAkQ1TPf50e4m3WiwU3aoVpvI/kfI0fRjakQqzJ2GeLcBRDO0Aqi+MUNGei7KnfomhPtZv0cz9kyb2I3zj3knuRrdKOeH5a8bDBWYD4Mxr7ZaEdkW9FlNFxL+Xhw9bpFkblb748Iqx0OF4QFVuGMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilwj6Tu65C4EAlxtsuG8YhoF1SNK0EejYmznFe3PkP8=;
 b=dISUEKXaXjPjDN8JsGhDt4UDHAmxgbJih+LcGqcbPvRb0/mQkEVHMttwXAvOLkcTu9+LKrdg6+kb62NShnt4lp0TkZ4d5mJCgF56l37vRruOUyqwQFFy2zPY75Pn3oBxfMl/Vnon0wt8j63N1QN0CLN7C1DDzJFlAlzmf7daDljj8/eBnGuwIpEvX+Y2eXXausA7u2oaEgeII2oMN0RfPRxsjAgan5dXoebggX+wF7A//u61PzwRF1uMN0mNU2E9KwGvMG7/xxpaD8pUMnS+rjjz8h+e6KJfE5hKJ6tIBRcQIJ+7ChZuHcty+N5hEzE13ZZX8wHrRDSSpyeNRJvAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilwj6Tu65C4EAlxtsuG8YhoF1SNK0EejYmznFe3PkP8=;
 b=XYHV3mQp2QL1NZDqTyHItDzXgCZHJl2Iz0s5o6fVxPrb/YWdGo+chtYskz7Q0oGSaaXsBZ8jzrx5zI+FzwVTWt3+3FcGmbCUDtBRgMzjnoi7TVNJM3+Jrztuo/Cogwrz9ELtjkyBdwVJaKVGnHCjKMiBOOi0ybxhjCGhRxreVpPwl84URo9vKW2EtRnzvLSRoZp74ZA1p6dkz363u75R9anw6qks6UEMVPyeZBIJ5RQHsn6hsa8dHFwPdyPrqeyIFiWGjTt6Tz6HkdtdswKNVz3N9HmBDicsL0JYTYeNBFkKF4qFceYgpJ+Zvdc5g2Hg1S+nWdpr9Y4A/J/OW+fH3w==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB8334.eurprd08.prod.outlook.com (2603:10a6:20b:556::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:31:12 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 11:31:12 +0000
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
Subject: [PATCH v5 13/16] pinctrl: airoha: an7583: add support for olt pinmux
Date: Mon, 22 Jun 2026 14:30:43 +0300
Message-ID: <20260622113046.3619139-14-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: d4781c56-51f0-4af3-cff5-08ded051c361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	birsI/nZQFZCe92OwNPxebv77Q5+V4KFxKUOd11e3pNRlR7oBMPPJ24W1fd5JP5FRpZCx2Lznh5YWsi20MYU5Q1UoUKnsaUUBHSrl09X3xxol5EQU+gYsM/4V4dhCfR6ko+L0flKvSGW5hICs2qRli27qPCr2bXY0q+r/xxwfXSx1Io36D61siso0CSA/23hbdbbsycoIJIob4lnddKukQ17WdR7U8YThKcnx3Q7WK6sU0dmFXm1C7Cnk3TRDkJH/HZzQlJ6WdAn1wuBk2DHKGVjdLc3qS59cxbXe074TSYGHaLsVkQuDDNi/aAw2na/wlw7qKG4F10W5s7aLg6MSGW797SyLfLjGnaBZUqIEdetowaSMfaoDp5u9PNbKPBMLvbUEtq0RxVdgnxWa7FUQSJ1beTh8bqON3tfJJhJOfJlQhe6dmmERnJrg5VRtZ6tn4PEPCT/qPwHs1drKS1Dl9eRA2TwVUugJRcdiK5C9GSMJgN45jyH6KlhhkdLv6N8IEXaFLcFCU9SST6VohVqpU10efcT1yl4f8dqLoiHGvjUprAvSpG1yeMv7iLLe2mQWtxfCpR7YE1ZcNIphNGPVIDfXkpEfjR9xvTR5t6ZjpAulgMx2HH8Gus9vuznZ2IJ0AiltFDMyUpHVV7mAw8QTAVglWtrc+3bGz7Lc0y8t6tTpfkMDxHBkspIBaj4E4X8EYKUxH4sLl8ZkWjSdyKreogvozdRhDGbMmYBy8lxNNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lvPieZLUvuUyAF5fKkUGXDHzvTMTUYbeWphY1LMzTAjUuKqAN0D+92NNdOtD?=
 =?us-ascii?Q?cRo8gFXAaqyqF+CNVj31HJvSJ+6sMJUkL1O5/KWFazPj5L9oIJvkXlHVg6B+?=
 =?us-ascii?Q?1+sa6Rg0S3CBherHy7NWwHmVafpTab19QlmIr3D5YJMyU+qLGqNE7LNDLbLt?=
 =?us-ascii?Q?/mMajEM0ag5cD46pmoVZGlriIKqq/Stbsiu5DG0G8bWRQOLZhDQ2MmfhjrFu?=
 =?us-ascii?Q?Cf7m1hHw+cmBh2IgGA8tkXpDI1GRHkG6sKJrS2KpBXFAKw13v4wZaF/x20F9?=
 =?us-ascii?Q?ITNP9Cbg00Z+8NgM+GHBuyTdIgiS6dKrMj/F/85Ff/g8IY7DrBZL1zaxaCzE?=
 =?us-ascii?Q?DcKHwcT+FAMd9RryeDjXXCGnP+I3aswpf6iDKdgTR8s0LVfpnrO1xIEWdPuS?=
 =?us-ascii?Q?p0/KsaVigqoeUdVxN07wOmEpnho8jvSv4DK7jhm3ybc2kPlONlBQvZm/W3tB?=
 =?us-ascii?Q?4+l0/DbCmblfUfZLVxT+pAEG938xmMv5GMRB/fEwYhycuxBgb876PJg5PBtS?=
 =?us-ascii?Q?C4WtZ6+F+i/X/ZPBPei8S1fFKEhJHEdYi27osLxFe7K5VPO1y02f85kxLm/4?=
 =?us-ascii?Q?wPDJ/oQusQ0mcJW7grBXBj2+0J9Ey+MnfPI3ShaKuYRQY1cV/bNqnQSnbeYn?=
 =?us-ascii?Q?bc85ieGJGnVDhDtNuWhAQV7pkfy0CaHfuu7b+LQLJMrSkDqK/yLJel/kTwfb?=
 =?us-ascii?Q?6M8/28Va9TQzrboPob2OzUBHAD2+loLt/CWYaUJfCJQHmv2CoOStghi/hTl6?=
 =?us-ascii?Q?ZV+C/cxf77AQdr0SHHLN+YthEZkRHL0OJH/NepGhfOeOPsZk0rRzJ1jIRR0D?=
 =?us-ascii?Q?9ZerDUcCnj9cxXfJxXV7hm4f5iL2R3CFX57dqe1RbVwCdIg809cqH/Ke1cud?=
 =?us-ascii?Q?jRzYrjMdn18TMcg/LeKrQISuWzxzN63PTsnHPeHhynt9UBqsKO0iUDVAfCl1?=
 =?us-ascii?Q?W4I/ozjH5eGjcv5oaLyL3fWE9c9xuW75aKO8xTvFZGsQ1f7Y/oIzHeMhXEP/?=
 =?us-ascii?Q?bIcYNkWJcuhyzkIwQ4Q7Eg4CEQ2P8ppDFxtoOjxWmAvuHvO1gCcnli/HUso/?=
 =?us-ascii?Q?Zq8jpCJSUjr/ilKR38p61B5oO9+oa2pFZ46qq54zua8erbPTmKV4FsKmiBFS?=
 =?us-ascii?Q?EiyeiBF865Efo/4CHRj2vn5+Pal9VKr3xrc8Y7e0V+eMkXMd4AsThglG8sk8?=
 =?us-ascii?Q?2aZnJNIVP7dada2pddAP4PaNPsJL9TZKEw0jSZ7mY8x5iyjkKQyPCZu26Fz5?=
 =?us-ascii?Q?ftlX8WATo+pTb69C4oYpsNwyrf2O+E8Td9zoi/Et/ETI4rFTzfUFCGl41RbK?=
 =?us-ascii?Q?mu6tTabvRfYSDcRWURDd0Kr4fUlX82KCNWQ9gh908Rl5J4eg3RtnoryK5a8P?=
 =?us-ascii?Q?WarsIAMl8rZmSJTSujYotMV0/eLVo2FZty/f8uVgwYm/+GC5zWlNX7LMCMGa?=
 =?us-ascii?Q?VKWEkEc6BJHCntuQ1wrX87Y9qMsZXK004eqXdbkTPFsP5P/uaft6xa/RqlVQ?=
 =?us-ascii?Q?akB4fmu+p1L+sJy6mO/hbQHr0JaV0s0ptPnKVFtzlN9QVdis9EtHs4g2uxd5?=
 =?us-ascii?Q?UoJ3yKC/WBBjFRfMZH1Wfa9od9hEAhvBX6bmql/Zdz4/ZTgZYGYM37HmeQHM?=
 =?us-ascii?Q?2OgV5q2Og7gyMnzABjXjXC9TeQwy39MoQOzUT/OETxq4ePz+Da1mLbB2miOq?=
 =?us-ascii?Q?hO8V3uh79a2iJmXwgG39cONZFcohi26NycdFx1WbZtGQnjRUQvTQQGTsF7+t?=
 =?us-ascii?Q?MLFPinUlevFlSNOil6FCPgMGVQkmn+I=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d4781c56-51f0-4af3-cff5-08ded051c361
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:31:12.3680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oJE+vcOgOFTLv+N5jLajMp8EGd2GBvDdEfwt5i4wg6hESB0MqEZuzTn2zDqn6cLP+M5yq6g0Oj/7OkcbSvUCiUwGM/rc3AGz8Kzflwm6A8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8334
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38804-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2E766AF1D6

add support for olt pin function for olt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 4d9fc0fe464a..8e74fad32228 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -53,6 +53,7 @@
 #define I2C0_SCL_GPIO_MODE_MASK			BIT(15)
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
+#define GPIO_OLT_MODE_MASK			BIT(12)
 #define SIPO_RCLK_MODE_MASK			BIT(11)
 #define GPIO_PCIE_RESET1_MASK			BIT(10)
 #define GPIO_PCIE_RESET0_MASK			BIT(9)
@@ -393,6 +394,7 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
 
 static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
 static const int pon_alt_pins[] = { 36, 37, 38, 39, 40 };
+static const int olt_pins[] = { 36, 37, 38, 39, 40 };
 static const int pon_tod_1pps_pins[] = { 32 };
 static const int gsw_tod_1pps_pins[] = { 32 };
 static const int sipo_pins[] = { 34, 35 };
@@ -482,6 +484,7 @@ static const int pcie_reset1_pins[] = { 52 };
 static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", pon),
 	PINCTRL_PIN_GROUP("pon_alt", pon_alt),
+	PINCTRL_PIN_GROUP("olt", olt),
 	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
 	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
 	PINCTRL_PIN_GROUP("sipo", sipo),
@@ -566,6 +569,7 @@ static const struct pingroup pinctrl_groups[] = {
 };
 
 static const char *const pon_groups[] = { "pon", "pon_alt" };
+static const char *const olt_groups[] = { "olt" };
 static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
@@ -648,6 +652,19 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group olt_func_group[] = {
+	{
+		.name = "olt",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_OLT_MODE_MASK,
+			GPIO_OLT_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
 static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 	{
 		.name = "pon_tod_1pps",
@@ -1171,6 +1188,7 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 
 static const struct airoha_pinctrl_func pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pon", pon),
+	PINCTRL_FUNC_DESC("olt", olt),
 	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", mdio),
-- 
2.53.0


