Return-Path: <linux-gpio+bounces-38026-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ejfEIB2BI2rFugEAu9opvQ
	(envelope-from <linux-gpio+bounces-38026-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:08:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F6064C2E7
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:08:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=tgrCzQPb;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38026-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38026-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6859F3095170
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2026 02:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9FF28C840;
	Sat,  6 Jun 2026 02:04:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021103.outbound.protection.outlook.com [52.101.70.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BA228727D;
	Sat,  6 Jun 2026 02:04:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780711457; cv=fail; b=ED62sN9LXm72W0mXZ0rM1Rk5YktdwbOLAa8aIdrZKSfd8X/CcnORAylHFrDFwEpBfs4zXU8EKhBUl9ZEjka03SBngFIfiCpkaIBhPuJ+5NyPaSzecnY0cfY39YmKYR+9OtPHfzNAAIhblooSCU6TNa/1OKeRw/p4jCfAlpXHPS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780711457; c=relaxed/simple;
	bh=DHXcAdTgGi+pyHsTvI7Y0cHfe+bVThveHoq26C8NeFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c3FwVqGjZDRykODZj8/AcfNDzOY8J37Ov8Gjj+A1FjHbcDCZb85XagW22fKPGBOJTrWj+LU8Y2cmaOzjDGM33+5b5QricGVQHYd9HX3FoKhCWlakg67m24D4QqsywKiV+MRfHK16sF5Lk0eq5AjC7BvZynTQEgYm6hHldb2rrhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=tgrCzQPb; arc=fail smtp.client-ip=52.101.70.103
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCQXrTXY/MZQL4VZQpnzzv15evEth3TsBfI1TnFTeTbzNK5ofMG3qEK0y/p2iuKbCa1gZd4wuGfxPSK4LuHLIMvQW6tByfTOXRfL0hOO1QI+2JMJ5CvuSSNUd59HqP3wz1LQSfnbhDW8qJaLdS7QgXNQnQSQdH/5EZZvDZLge94iCm+sOPTj7ZWnJhzmxeUterpqPmi9MIeigi+XgvcCVc/oudVJnfwACAxE7Hem2Uaf/xU2EbcQoWCdX2E0QAlpjrCOPKyARg/oqV6EQca5elAQexPNYoQ5h4Ol32eMyhPO31pysTId2kO9NZnY0flYxjZ23fLq+GoAU3uvgQtjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muSguldPZDsh4fnmXwDXRLeLjpkaF54PXcQu9iax1s4=;
 b=mCOpBm5ubzOOcTvPXadn4+lfjZr+56Zh/YBDduWV7UYs268aB65BrwVFDPRT8YFi8dyac1vNgp9FJVFhrWjfCbyVfHkyvYN+8Rr02URluaI2yfzLQUvIX6B9HO7TZMynYEZNzpnlxWADoqJFsv8Bmlr92oMuJpJ1j1JRcsoMxH9qsoe0Tke5wAFcpW7Kgqz7174jnBjbqSXVbr6vOqUIsMDFu32NSeifXWhBY99lxet6wSkYcQDsGvbb9JDnsEiu3VU73rAcD7dEvyWtgj1DV3swYTICTbsoLRsAuK/ljz9UGmXPp+yedGRbc8n8BtFaDdSwZF5bWGNreoYNtMzIcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muSguldPZDsh4fnmXwDXRLeLjpkaF54PXcQu9iax1s4=;
 b=tgrCzQPbjH2Y4OB8ZLI9Z3EkslrTujoAKdDeOd/p+/ufhbeffNijCRa9J/hcR+sxDvosKpJavIkZBv5PtJYyP3sNMbHCYoTiF+BKsqNPqQ8zjDUjt3hSLYsKgWeoAl4uPJbntv695QYf+1Jo3R6i2kxMq/lSR5JLkNZ76wYjxB8QpAtxV72lJnxLDeoiBhn5LCMqiZ0AAd5YNctzixYAb+EyD0uP8MCHONvjMo/Ic6xuLSf1LeKu+zacWidKn/zDaU9lN8sb5vNMlIEcOZD/EVo6UysIaKikQi0Ki3aqdDLX31n+FXOb2vC7TYvsX6M9PqblFWElfmfAFB0ZlRFt8A==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:04:11 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:04:10 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 09/11] pinctrl: airoha: an7583: add missed gpio22 pin group
Date: Sat,  6 Jun 2026 05:03:40 +0300
Message-ID: <20260606020342.1256509-10-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DU0PR08MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: 0345e3c8-e272-4c1a-e97d-08dec36fe652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	2pHC4jA1XEiQzMcagJdxSAzp9xsucsfU+BdBpj+/V/AakmW+86pROqYZMyGsx5m7J5MScO9QGx0DJEv+AJiRMl5Qb+juQVHR+eYu/5bw9aU/H73T/XkMgI41XG6C4SNt+z+5RvF2GmcxcHJIlb3zTKqZjNxpHEyu4zPJjh/htzv5TlbZ0MFOJ956P52qzza+ASYWgpa0K2BqxuDNma2KTxA0OT7HiZZyEgwC/OjDbsh3TwS3Tr/9rWySVW8P/XFjIz4KQjrIlpqu3tbZoZPtIrvHNsGLSlkrZ1bVjuNo0NJMY3Jo/lNcr+6glFRUBPA2Mchp9g7h2Wrj1GmF4dw4pONO93o3O2r13AwKtJjgu13S8XOwdkPNZcql3fmnX9MwxpT3Nyvhqurh0EYo35gs8cLtGOR4VikJWsoRC1q9gSrFLHyWrBKArk7a1MaBV5XbdTVGhB2zgEsaFI8uOjnwXTeqZdJo2b2T3N2Uh+SRqpOcfeVMIc1hoWCNAl9QCTvbyfqhgAGu5lP5LHJC+K9JJ+Xdl9H+nnLQXJT/V1n1Vv2lTx9syCFrx+XPmFSjXl/OCS30iYdjor8LTQz3dphBzomyf6aeGY3mFfaK0qdlJU/7nJE5mjo6sTSQ+dYdIY7p2AmnqMKs6J1769XQpiGJsWFRA4O9ZO6EFFc+3QNj9Ug4Q9h4i8tIqe9Exp8+Az+udwDjJGBl+DS6CrMeMQqbHsNSVeXsawKypYHNCFNXmRWN0fN+be6gYZfy6B3FyN5YH+fKRqTTpnJYmM25qWusmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mf/wF8azprjhG2niXu1mtTNIzBya5kYbqM+/MiDhq1+A8L1lRcbVwHRLSApc?=
 =?us-ascii?Q?QuWV+nAHcrYHn/zU4QQDhumLyheeveyFRlL4uyfBnu6+jglQ1/DumqMnDfiu?=
 =?us-ascii?Q?3xKnJjzq8pTDCLR6g3onw9k4eVLGpfFP79eaiFzlVHwqd+XqhKa1F1kPSpp2?=
 =?us-ascii?Q?IosYFWAckv/4CL+9rQ3Tu8BLCBktvuaMeZCJNYxVgxGf0STCXmAMmV+nKB6n?=
 =?us-ascii?Q?ZpJ4fW7ELPM5CLjw6TOMWPy1uNSgsoSORIU3tQfwzqlMNaKa4vaWBKMhp8qi?=
 =?us-ascii?Q?UXQKJrKQ+7rCBNyvsprPwAW4hcux0KCVJIobwZIzMbaTBYnDeM5AXYE8g0+o?=
 =?us-ascii?Q?wExLGoOqwI3pelFRk6BahydJdui/YhX/PU3l/rwjlk/LnBwkDRboR/g35JnF?=
 =?us-ascii?Q?w1/EMvwAAxuUk9k88iDhf5Z9s1AxdiSiBl9kmavMI5OOxg4KZbovHj+hxSQr?=
 =?us-ascii?Q?Mtv6MQZx/MMDzQvOnp0YKU6FmwAol3X40s8bOjZOU64gJxXep35SQ4NZ5gI5?=
 =?us-ascii?Q?ctR5v84/SK8A5J7e8QEKUeTmEkHZSujX14DGTLXC9IB96ZAdd/zp1pgP319p?=
 =?us-ascii?Q?Bu061IT7bfXRniOCkVtXc5RnEciRd+bZHIGQh2zmEpQoW4uRfQ6XJrW1rel1?=
 =?us-ascii?Q?VwI05q8ZdDalUBkVk+b3bJf4eotQ+PWBWPtE1wrKeyS0tUWuaKkc/iWSPwyn?=
 =?us-ascii?Q?N5QqP4RVB8whsagoioMZTCa0VKz5WH0Ae9hjakEpmg0O/k5QYEb6LCvlHk+t?=
 =?us-ascii?Q?SRAXT6vdWSBTi0RHJ0Cq25NmJDHBKJAIRwl050IHt/ABzv9Or1rXNVKnjKDT?=
 =?us-ascii?Q?Y3schdTvqFohJiNF2TRnxBV8jpamLUn98xK4oIOlvf/RzdCcYI7s8taaFuC0?=
 =?us-ascii?Q?WzBO19YOGqAnrf31cLswX/HEWe4QcRLRnkr/bAAL5XYBwClHwIxliQ85m/JF?=
 =?us-ascii?Q?6dVS6hqzS8C+tFMlXJujc1IKtxLAEXgp2y1GehhkQ4gDIFR2iiA6lPNNRt8u?=
 =?us-ascii?Q?kE6WOKqERV8h0bexSDO0ToFNA1yxEor/+vreeYnQPaUiNOtyYgTHgK6ITInt?=
 =?us-ascii?Q?IB3Al7PGP/Ubx12dsaw1uGK55kkN5B0hEzNaEB1dgQKUjcbvSt8zlmtER5D4?=
 =?us-ascii?Q?ITgdxh6nNssfA8R7oV+jV3vRxwMp/8ynv8qia44LhFlrA0qqSHodRHRMtkOi?=
 =?us-ascii?Q?imRfPxfziQRS4wLFys82oEjCfParCV6BYdUJB6VNatczXw4K6IpZMTYm2Fut?=
 =?us-ascii?Q?kvq3762irHosR6rLPpOQdbmEXekMSR94uu3WLZcHOFhuW+w9m7adEJK3RDrc?=
 =?us-ascii?Q?7sHnYswPh21Dhp+4NFvMo939WwGIJUNidQSWMVTFnidfGSz3E03YQth7QH+I?=
 =?us-ascii?Q?qXlXuxoBtE0SDUn9NgiLdbnH+TVx3zNtkGyJKFQtmXwbG3gc4aXJUG1WXQB0?=
 =?us-ascii?Q?eO4PeTqDV+9Q2Sob+xedtCIpy/wjU4zuC6VeYHHOkiUHhwnZmAv+XQZDN+fV?=
 =?us-ascii?Q?Z8psVJX53SMIzI+jUPZf02igDUdspE+3eAe5Ev9COZl7qcjVVFYoy2oxbB8Y?=
 =?us-ascii?Q?qtI6P6axrxXyhe2cS9BZ+B6xdr53TqVQhBuVfmSYnPd6YVdUqNsHCFvvYfot?=
 =?us-ascii?Q?2Gn04QElSVCH3UldNA/i6z1XdkZkqMgUsBEVlOCF+nKBNuPmUIud7ayvct6W?=
 =?us-ascii?Q?9bJ9kI4QI+IPwVwHuCDrVU96nSzawaI1yBJgy9a1QeMndg9y+923oh79lp7h?=
 =?us-ascii?Q?HNI50eClsZ+zvGOciMMYVorfJiTbkGg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0345e3c8-e272-4c1a-e97d-08dec36fe652
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:04:10.7804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLzRu3AXkqGg3GDFCCVuu77310w61G9+O+RR3eSsrEzvRiRvIlfXqoXtyNsV0hgs2e71ZfYDCpReBmjilR0U7v4vhvLLIXKUukI4kQRcRXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38026-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lorenzo@kernel.org,m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:ansuelsmth@gmail.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06F6064C2E7

gpio22 pin group is missed, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 9dce3ed6de17..e66b608c4803 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -749,6 +749,7 @@ static const int an7583_gpio18_pins[] = { 20 };
 static const int an7583_gpio19_pins[] = { 21 };
 static const int an7583_gpio20_pins[] = { 22 };
 static const int an7583_gpio21_pins[] = { 23 };
+static const int an7583_gpio22_pins[] = { 24 };
 static const int an7583_gpio23_pins[] = { 25 };
 static const int an7583_gpio24_pins[] = { 26 };
 static const int an7583_gpio25_pins[] = { 27 };
@@ -828,6 +829,7 @@ static const struct pingroup an7583_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio19", an7583_gpio19),
 	PINCTRL_PIN_GROUP("gpio20", an7583_gpio20),
 	PINCTRL_PIN_GROUP("gpio21", an7583_gpio21),
+	PINCTRL_PIN_GROUP("gpio22", an7583_gpio22),
 	PINCTRL_PIN_GROUP("gpio23", an7583_gpio23),
 	PINCTRL_PIN_GROUP("gpio24", an7583_gpio24),
 	PINCTRL_PIN_GROUP("gpio25", an7583_gpio25),
-- 
2.53.0


