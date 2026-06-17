Return-Path: <linux-gpio+bounces-38604-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QTnBN88kMmqBvgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38604-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:38:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B1F696727
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:38:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=rYxJMZQb;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38604-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38604-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FED6310C251
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 04:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFE0314D26;
	Wed, 17 Jun 2026 04:37:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020139.outbound.protection.outlook.com [52.101.69.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E29318EC4;
	Wed, 17 Jun 2026 04:37:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671037; cv=fail; b=BXkQ4cfciSuMezEN0RmHjtNszLU1NGxTIjWjvoqVRISrOBN0DTv9PCwGiIynXSr/eumV8fB8rLvwYvM96fw33nEr8u8uvXSxF1dmRBSeIlcA6QED6wi501p4tIyRKrmuv+kyLGXmp9TFyABp1gamElYwyyCaFqcOiieLDqWjOxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671037; c=relaxed/simple;
	bh=7I1I4rxsnFAtQuIdtcW8yNR6SVe04x6YuvmwGhHs8DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q1pjRUcqWqho4AdOFxOQ+wKo4EcJK7A7vp7imDYzEcGtyxPRauWrp+1U+NVkZpXgbIx4lxb5o692UEypQ29WKEr3NS5B2emsVwPdW7dUxLB6XaVHmCaMTPjBP5tkUkgnNLTNzoDvpRMnlTdDSrJg7/OyOgKCoS2WEKgur7Tz9Ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=rYxJMZQb; arc=fail smtp.client-ip=52.101.69.139
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSETsjQZjpUgbSnVek+sKgE2RObZ46KNTp6Scq4OxWPHWuc6+qUe4rqzKG56NIh2Pfj7Cnlp+XhhiQkucVgSpJr0UcFxK5JbLWLh73wq1NtPf5giSaLaQTfPuO9cInRRB9S1aTV+/+Uh7zdyTXsET/n9VT9a8+q2IxH0o4iak7lhqo8QnLjOs6lBoEvi6cf1nQIuKvfQyjvGq+TT5yu3e76tFM9yJjsKVrGl3u8pEWBDwRoV9WIWRuzooDM4j3jnOK7CXuKid/oZje4xDuScZZHvdK4P0/EL1Qe1uI31SDuC7KJYpkCyPzPZAuUYEez4jUD4BqIMbDyG/vRO5lif5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJtQz3a1JCJ17CI7aOVaL9bcuLOMUSqw69VPSSEjPlo=;
 b=QDyuZMkoGWFl+ay/lJyugBaLgOZjJmqyc2MqYIkXqlcvvFkpXWj5/w135TY85D2x+A9oXn3sxFhsql5EGz0jakXpbN+rEqa2jRGb7He3ZytnwxmYhNhUg4cSSjXSvSJEgYN8gBRN2NcKpBbB6V6J2A9mKCLVB6rSIp1xPF1Ef7EcMbhpxxt8Wj9EcnEHh4X3Vgy3xEEFTONJminFmvn2Zohu6WUQ7Ooa045DLJuzFHD8ASQH9REdnT+dBmniBtjqJVwbxHbK1/lIXMxf6inVySEQRb5RQblFOBsziga8FyEvlthAI3/O0KHcQThpwhP2IvQu29RMatwnZy++qwcAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJtQz3a1JCJ17CI7aOVaL9bcuLOMUSqw69VPSSEjPlo=;
 b=rYxJMZQbR0ROY46CH4vP5a4VLiRaN/RBJ2baEXeNoC2JGIU3AxEwkYyAYB3gdJyL0bocUPGzYeqJijjgr01jqUtlg1J13RI5b3RR6fMaLSAJOupiiT8FA7Dh6rYx3GNfb3OMLJ+JVsg4tsivy0VyHc2DtHB7Dp6cMKAWPJieB9MJpis7N5EscPIBtzY2tyAPzJs+cZd/KmR21Eu/JfYcJq85bFUSgMY3Wv90tJjxDZwHyH6Ecv+gOAP2fTPvFhtrQEzELQ6Fox6HgzOY938hrsrJvUH4Sicysd0ABafygJ3fI9y+u+5wBb3RaGSmoHQyuZhzFx9kM2rmOyZuRmkQDQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB10384.eurprd08.prod.outlook.com (2603:10a6:150:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:37:06 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Wed, 17 Jun 2026
 04:37:06 +0000
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
Subject: [PATCH v4 03/14] pinctrl: airoha: an7583: there is no 2nd I2C bus via 1st I2C bus pins pinfunction
Date: Wed, 17 Jun 2026 07:36:43 +0300
Message-ID: <20260617043654.2790253-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV2PR08MB10384:EE_
X-MS-Office365-Filtering-Correlation-Id: 125431c1-d7c3-418b-a559-08decc2a15bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Uo9tOrt3FWFOTcs1pWpyMR5kyASzCmBgtl+gczoe/N3JccIbcn+79YS25msgP9tgtXMHXh2LaXTtE/vkfSul4gg7EeFrVKX8DvvSHWvdL7pa0ppZbaL7NJLjBJXoHX68VgYy0GgaOgNrmR90lt8VYzhFcwh/AVhgvKAQPVzT2ksgi1GVRb1kM7NJsWPpaeoo/s8PHcTiJvjAOmCoYUtKH77mAXFzoSjCLNkm8BGjAcmer2JcPZpLZNCRQ0jP1+kUNLw/6N2BrHNh9QbNtxTLQFEWzJKWiuWeUMbiR8vnQuPVPsFutSXp4r3NpdV64Lfs9yZ0hhfGECtS9M3KuAR658iadUL5mLFlF05H7SdR+PBoNUOsx2WhqrYO0TujDvYnNY5jppPNiETzx+LIa18u/ni9HNytT8tjWPudPO27GfnBjdyBqZcFUSDSH3MPUkII9S8esxgcJXTYidjJbTbX25PPzmJVYPB6UD1dkkwfrjLC1Z6ZJ2yoXu/ktytFSFculmcBkHwhyNmcCZ4Zvh/jF09SKc4S+oSoExLGX/KK5+Uxr095+apcs9h8Zg/fomMVEZjmpr+aVidMFPu6lw2TFuUdvJa7bsAHbQrudDcDCNG0PzUrecQqEyIHFkQV0iR4BAPAMQT+kBdjVlw5r700XEsOvNuB0gJOT5tqrpREh41Hu4BQjt9cVVSoc9FT9/eDvYxZrxSwHJcAEgBZE0UUOwSRSMsWC+jNrO10yjD1GGQfAb3tRc2hQkpM5sw1q7vrqUt6Y/ofg9GpvtoRUN9YJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I9rqq6osQkVg5FLscMmejnsiGsEgtgM3aDfO/8289k3VO3yVJ97HK4ryXhAj?=
 =?us-ascii?Q?TttgFmnGa2HVf2GPHSsyq2zRsjJAiNrSCCKpDbMBvgyhi/d27pQ3FSvk47ve?=
 =?us-ascii?Q?j9qvqL16rTlD/i+djvtCkC3eBvHcPiK/1t02pGf2Q1zR0aLYXJ7egnnfuEaX?=
 =?us-ascii?Q?VfmhO9fDH6ieLLP8TpYIFFpgwjznA0x5DSiFckr+V2PdP1EoEwB47g1kw/8U?=
 =?us-ascii?Q?kzveG2ODeFhfsm+m8rODRRwLA9y8AjeCdXSvrfuZhK/uItJPD1VbylEYMmOz?=
 =?us-ascii?Q?R0o9cTVyAn1Cypz76Hdc6b0t+fwB5WGaBcsxYe4EaRRDEVJJGqRgxwP5Ss03?=
 =?us-ascii?Q?22uK5BW+WdG9Gdxt0hTz7vf3o387SU9muYlde6dvnAvozUCwTEUMPC1k7my0?=
 =?us-ascii?Q?JRB/F+mUMYg6fWklH/FsySuST3dDqp2obezBbInwkj+7Hcj2W7V2qKh/5Knn?=
 =?us-ascii?Q?IEZzwA11IpKsLIFynkhK4ytmNb+LT09pwuReI4v1eacwbvTDQsqrPlnXKaSY?=
 =?us-ascii?Q?Topk6njeb0d+AqH41M/ErCyKKZFH/TpDB9T4IdmZBvESKRk2YKjnFBawB3ng?=
 =?us-ascii?Q?mMMx+SJoyU9N+/u5O0owNVHiOp04ZbhxYcijnyAVOBdhwnDvwScsvNMVH8ll?=
 =?us-ascii?Q?McqBHg3Hm0UmXIFAUc/nJXnFq5C5JccLN1OkPrRzZGuBFaU+eO3voh7ATq0p?=
 =?us-ascii?Q?JW/UH53xJkXKxm8GFXLHWHGotOFRXnE7+hB4nEXlRP9/OEsIjVf5o74lAf//?=
 =?us-ascii?Q?VKZw1dc5vCNSb2BQ88dEbcpw4UeQTWeJUlCVJpPuoyCOwS9Cc73rX6EYjYO8?=
 =?us-ascii?Q?WaSuTO5cDSKRuxhx5NMOn580BjIwrGuDPt0Z0frDNxt5mY7j+2kDtcf6EKWj?=
 =?us-ascii?Q?J4YXKEYhLmS8BRjsEiac8iyuZJEQrpEaK/6k51+SahSK916idrBW8FV7YeWk?=
 =?us-ascii?Q?hP6fTqXX7tG6MRPYmAlsm2ggSGt3HQX3mVuvBL8IUDuOkUx8FuMED7CGMLxM?=
 =?us-ascii?Q?WnyjreTkpNgn+3oPSEeB1Ggztyh0qudQOGVzaCTLnIJ+VsYfXfkhtRamVh2g?=
 =?us-ascii?Q?QPowlERcLGLEJEjkUpvEztmIc6zb3ZxX5eXfsEJh97SuyGnmGvKufOOowd8L?=
 =?us-ascii?Q?5c7R8XvSWCnvXkrgQpR8K8Upfq4FkXwrsMkjtmQDtWHAEjiJ7hkrUfa2sPT7?=
 =?us-ascii?Q?69EoXYS+pLya2KnQqTyR1/7BiRnQxriPWPBol55emWcn0pX1nbaSAzFSnlKQ?=
 =?us-ascii?Q?CViGZroIEMFeNNXUp7zrZhRifqOrWcIkRfsQ/TRG9ldSCi6ODKokbkVbS7Ul?=
 =?us-ascii?Q?Wcb6cm6W4T/iZ6Z3aP6bNK5fFRQwBmK2g8rVXQn9N7bC3mmHyuPYUv/78FkT?=
 =?us-ascii?Q?gspJwDyEXRH/tsy2X/7NCwMROZgx9R4rB218A5FooviWLjIOZ3ZVeTJYI9XC?=
 =?us-ascii?Q?uaGWBnEoCuwd/EXB8+kRQ5u2eQ1b2Fd3LAzyu45ZBw16d4pynEghLk8kN3HP?=
 =?us-ascii?Q?6BmTLMU5CZtQ/VPlN/kjQM84oqq+BHw2nAlqA8wYxS+/jQvQwTsOFYkFKybF?=
 =?us-ascii?Q?qfHNfks3ILWp645kKOnJvGmRyX5LH6EtrjzAA29nGT0da8ANCtL+wSGTPArW?=
 =?us-ascii?Q?cNQNWDrGEbFARWtA/UUcJ9aCsQg3DMx0h5v4cV7JE1UjUx4nfpg8oQN/mehO?=
 =?us-ascii?Q?fh/hiYBuAwEfDqQ/a5W2+Y9x1H5FFRw+i7ZLjV+oAnzu2XwGddNONCiv05IS?=
 =?us-ascii?Q?6Gy0ylSooMBEu/Gwa/3Da1jjyntBlo4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 125431c1-d7c3-418b-a559-08decc2a15bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:37:06.0130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHO5+FXM00Hl7jLHWfMoSnDdOI3DcRosIP7YA7+W0gTQVrz4sBVcXq3KAmUXx9ruRQv2qJhgUgOO7uwTZpI4uqi2kLgxZC8Y8a93QPTgMqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10384
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38604-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52B1F696727

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


