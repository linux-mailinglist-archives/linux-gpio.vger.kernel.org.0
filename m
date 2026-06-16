Return-Path: <linux-gpio+bounces-38530-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id otc7LTfPMGpCXgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38530-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:21:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44768BD91
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:21:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=TxKe4IUH;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38530-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38530-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E5E2310ECED
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473583C8C49;
	Tue, 16 Jun 2026 04:20:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021138.outbound.protection.outlook.com [52.101.65.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3C03C8C5A;
	Tue, 16 Jun 2026 04:20:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583606; cv=fail; b=S1nDUTQb/taZ22nmxLsedTL/LRD/z6SjF4XjOCeAAUwS4G/8wsb+5Tkrn/NDroK3sTD2a+k6eCpnbTWbyWeYsUqqwyvKI6QXQrlwNBsWzqwIOKaKXSwmzQOSZhsZBUh4kliLLR+41ibAMxm37LPTJmWcj+p2da0DI89YkHDhyXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583606; c=relaxed/simple;
	bh=7I1I4rxsnFAtQuIdtcW8yNR6SVe04x6YuvmwGhHs8DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bI5op25Jy5/I8ZJxm/2Ze64uZgt61fwvM+B1K64YNYeLu51vN9F2y7p1V+70tJdpl/rxucDBa7Pgkr1zgjlmO1hvTfF+lpRLFA8n+lxmxQCEO+utdLOXcr2R+l8cCiXYHH6Fx9lRS+H5h+2zlNWVocNEC02waTtGob/3a+iRHpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=TxKe4IUH; arc=fail smtp.client-ip=52.101.65.138
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hA+qKfqF5lIZqWGXfSnwiB9BHD0xYZRf2vq2juHwBOMfjOcfmd4qF8vbOhPUlBdjfha2guuY9p1PfMg9MUdf42NDwiinS6Wsrk4ve4LPQthS73mAsYnLsOOIAu5cdJmV/b9mBFlnc0wulvPQN0J85j7UP0l3qp4wAqqJKA1A82rbATfzgb/EWhxN7J7PjIShsVTnIKGCi6FbhflqXTYMVyNQVViSeyjBbItRT/qfE+xsOsYnm/NpiGkaamnAwv5hjuR+xtKy8D1TihBxJpdlyCN0ptOXnhds0iNz80oaUk9X1pwcA9tb++U/3znYuvMHD8aTPnqORrZjkbN/pxrvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJtQz3a1JCJ17CI7aOVaL9bcuLOMUSqw69VPSSEjPlo=;
 b=HDNpumWPNVjIYuzhj8+lB+dyMz2P4rlE8mH9oco+HkblTLDFq147XX55XL7Cnv+W3xyfZHIN6e9ngiuLVg6cl8EPNzifBPN8sL0qL7Z+eyNf7C3a6B8S94DCa13YFwN6/EzlkpnPiaet1TLlR/3owa4HWhIzwE673FNFL29+IOlVaINcyzSIhneJpVkTkv+zJUPQj4XEv00cpVJgusGmOuCkmVUeU4leoDqztegiFvJka1w1mHQjhFRjsu8gIrATCWKHNLE76cgMULrByUFH7ZUkexUJjlwZOq+5170Cx3VIOJgxCgC55I18KB/jdesGprpE+eCjKdD1ISDNkGmQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJtQz3a1JCJ17CI7aOVaL9bcuLOMUSqw69VPSSEjPlo=;
 b=TxKe4IUHFjoadjBacq8EM/7qmz6W1oBzKe8qpAxg20EZTK99O723gT1QIVQArffQdPOJnp2A7VYDKpy2LJVeoUGxdu7PllMHKKWV4IpnqFHSlGLVDbZPnDCSZciniWoNEDowy5UKrXy2ns/8/hPpktg6139sRy6kGm+4oqkHiiSyWgUdZzlaUdmGfYzB4h8CKUVz5cWUQEhlHc0tJAxhMa+GG7inNaRaI1K1EbYJ3LUK365PhUmQbA8Re4rXcazU/gvTodzHg/ORrZ0QS04dkCnksZh6o/hDUOtRr6HCDHsOSmD2bgNuPIn6yQL41f2LfC8dQVdbkg7Ko0iPGFgRqg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 04:19:56 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 04:19:56 +0000
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
Subject: [PATCH v2 03/12] pinctrl: airoha: an7583: there is no 2nd I2C bus via 1st I2C bus pins pinfunction
Date: Tue, 16 Jun 2026 07:19:30 +0300
Message-ID: <20260616041939.2587012-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616041939.2587012-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260616041939.2587012-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10055:EE_
X-MS-Office365-Filtering-Correlation-Id: f079af30-2ab7-4bea-e288-08decb5e8580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|38350700014|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	qnk/0rXwwi98yyaZkQCN30EvG3uZG41T8E5Et3Qm3LGCwz/EtSfWEGl/ZgSax0cxnj4IRbOHDH67MlmJvbBB/0rHNoCQwYn/ppgbSE2iuifynXkA1NcfAFORLev9v1GDxCx3pRuRjVlb0CqP8bKNYIqJwGQnbJph5rSwJQSKjbf6a3ErDJEwt58aItWPGdidU0Jwi7frDS9gLiV2uOahGeDHtEYK5aFl6dlhWHYFSN+zi7xGFxocUPlAMc2uZboaZ7LchD2UMF6c4w/fwDcUKhYJTZ+DXgaN5eV8tD8hJcQB/lO4vt43a12Q4XMd+ojL3ubnvafVUK0aGzWXTzjI5uIlShB4lt4z7hGecN254GDGuVgTu/7iX7gBe9v/OIrecRY+8/sRbmB2ES0Y13b6JfSuRh0bDfwzOb1mxO0oskXinQVPLuwqXvKsRSZBP/6Y+Mp1CoaiocM4eOt6yvMbEV0qpDPj0B8rjyvgBXujXJQCEi8tiREUXCkValFmnY+4NN+VBH45Hep0I9EPHOpWvp4DWUW7yq9oysxKwtiU5rYJnj2wovXk3pD2OBb4gCAXsflGIT3fNTRpoPMbIYWAG0JPoCuDi+Ch3f3XWbTOlrSMHr3Ep+anaEmFCEmGladpPjpJwstM9nGnr8HTB/DHJW/MDIvjCdi2gytQrPU801sgENZmQ/xIuItyp2JKc2SPwdQef81o4w06FgCvqN5ZHv4XLNB6/buvDaMoN+3B7vhx829X0Fv360Pvc3UY/2sxszZB4OM3dB6XD6ebVAA64Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(38350700014)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WQ5g+qMCJmgQGqDXEXqEeHN5uA5P0EP3QlZv0G5g4Hs1IhCkneMxyyFg/C1r?=
 =?us-ascii?Q?fHaNVSjSWTIWeIoAhsuDuq9n1PI7XuF7OXH7HiX/8PjhDO0YWT/HByMpouOJ?=
 =?us-ascii?Q?MP93J6qMe6eMvGX8fVfFiW7x9zqoLTbaEcI+pO3uee6RfMtLbtz352ae6ATi?=
 =?us-ascii?Q?qEgbEyTG5dOz0SAUSdZzYW4MSxt+4MHV0PZyqWRopwuU/RxzDPA2vVIV2RKo?=
 =?us-ascii?Q?X5nXR/YkPVij41URpWxnxShHbVMwftJ03utvdnJCibGUDb/maLfug7M37vPn?=
 =?us-ascii?Q?+dNArr9PO1CK6wxUXILYdFSbMDS1+ZBOAhYSvzWCpONTaB6ofEVSeXuWkKN+?=
 =?us-ascii?Q?hYNRtRmrXnRkxzcwTLX2bPo7Y0pDpY2lyiMCwRDoYFpD+yLB1WAomLNSbjlt?=
 =?us-ascii?Q?Zj3pFvWxjSFUrGQdoT3rPFGKNP5t/4chMRHFYseKDcffnZOZUBM5Torpn6Uv?=
 =?us-ascii?Q?GGuRlUCq/vcBByJov/L+BCTI9TkZbRDZ/M+Pg0QTgquPnIMviB2Huc+7Eida?=
 =?us-ascii?Q?VFPsNOZ2wlPNlb5JzlAiNi/Ih2eLiVQlcgqdG/F/b7V0nWa0AD/KT8FxmJZj?=
 =?us-ascii?Q?BDldXADVRPGQFDkgQ3uh37DkdshhAMcO8cCY31eG0lgHSS27EMJ2n5mRkOFr?=
 =?us-ascii?Q?B+/81nFwREQYXhJqubcI0nLcwaAu04pH1ENl+PszjlgxXJrLcLjRc8I8+C+9?=
 =?us-ascii?Q?4IoS1UI9gpFDdjIxyMzgRG4W/KHVH87YisXdQ39wZ3cBxt1jUCv9vVCK6RaZ?=
 =?us-ascii?Q?dSwkyiddO+7ZzjDlD0s/LclaDFmcToga37iBNmWyYALo7BFyzbfQp/SPwZfD?=
 =?us-ascii?Q?cVUrcpcyEf40V2s2RCtdDmxN72ueuMSHd6V8gkblBJOXi9pUnmduGe2l8Ni9?=
 =?us-ascii?Q?HGt2PVp5GYudfX3IK6KXb93a9HnfC0zKuZ15NDi7st6BE8YtXgsyTSxNkVWb?=
 =?us-ascii?Q?F74pCKgkXsbymluqTyPm3lLoBgs5jXztI6NDu/RKWtkRKqFKQU1DjoNKd26I?=
 =?us-ascii?Q?K58z35GmYp4VyTfPZ1a3NyV2m31BL5zEm7oYxAkjmUe/kp5ND5O2RgLtPzX5?=
 =?us-ascii?Q?DhZb6nud3HmP2XitLWKV8+C4zdNYUIWvnzHJ7zGpPDNc7Nkc6Wvz6ODim5pa?=
 =?us-ascii?Q?rv3kIekENMyuARo6NQQO5ou/uIr7Y5FhgcDYCATUdUO15kJPRxyMa3R3PbrS?=
 =?us-ascii?Q?v7bpc0nEPpiVXp18snRaDgdYGEDT8wSDz3ONy6IThPLxFPe5w22ULjB7yvAX?=
 =?us-ascii?Q?N+Qm1qbJXpY4Jrc2m5DNvg6a+xPfgAoTE0BGffSPzHrkzs207pRtR1ox7tGv?=
 =?us-ascii?Q?hbCUyKPoyT75gkcInVnqRoG5O4D7KtbttFynDcu/Vy6MEC9iV+MaYHRfBciK?=
 =?us-ascii?Q?QIe8HBRthkii4c1x7hvRh2UDOhsSJWH8D9w6vKeuZNF5d3IZl7c/wqIpzdpo?=
 =?us-ascii?Q?x6EO2LTsgrNOGmxnTaAO2LYfd5PXeK6vQNHN2USu2JjhEyefULVFBSk2sFh8?=
 =?us-ascii?Q?ct9zeXwyuhTvu7CoGznfGKiFpj4YjaUEi3/o51bbRz+osaQp/GHVlCE69Cli?=
 =?us-ascii?Q?EXV8g1axjzZNMQUJqa+lDYvSpNttkrJgJy/izyoNNyS8jykmTb3Z7oPyt//J?=
 =?us-ascii?Q?gX2jSawmDBWTQHTEmoDnCSBzEj5qCoXVEiN967XXftTRFii0FJNFDVtLtcUQ?=
 =?us-ascii?Q?askNNIBjMVvoHCZWNUZl+vytJr1gZfBv2Nz3r67q9FmJvywgxmeRI22e+o/z?=
 =?us-ascii?Q?2qnQ9MPitzxCIz4TREez40MySmY8b90=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: f079af30-2ab7-4bea-e288-08decb5e8580
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 04:19:56.1848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aelHNJcHTTDh/8pyNv1r3OGSP5YTYVW19aA1QdTtVobBc/++tmXFTQ4QzIZFRS1wlCUQOlzC0Za2yKPX/jqQ9g7yWBF+drlEkBEZIZMXfRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38530-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F44768BD91

In the an7583 case there is no possibility to route 2nd I2C bus via 1st
I2C bus pins.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 4076bd0261d1..cad56ac3c061 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1821,7 +1821,6 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
 	PINCTRL_FUNC_DESC("uart", uart),
-	PINCTRL_FUNC_DESC("i2c", i2c),
 	PINCTRL_FUNC_DESC("jtag", jtag),
 	PINCTRL_FUNC_DESC("pcm", pcm),
 	PINCTRL_FUNC_DESC("spi", spi),
-- 
2.53.0


