Return-Path: <linux-gpio+bounces-38607-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HqqyBZYkMmpuvgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38607-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:37:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CB169670C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:37:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=omIsyo0i;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38607-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38607-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 158003043069
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 04:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95983319852;
	Wed, 17 Jun 2026 04:37:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020139.outbound.protection.outlook.com [52.101.84.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E85831619C;
	Wed, 17 Jun 2026 04:37:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671043; cv=fail; b=AsBaU+e9XYu5+poDNmLpj2ItiKQ7IJ61H82ay5/nKHpj9AAi1U8UAmMb8cV4+v7VX7HtDAwtFEQ3a/GddnCKvmi4/nRWhq3SDOabZv1zrTw8o3IjVQVkczY6sWVecgtnFj/SME6Ixz0wgV5awEpG2Ys51qAfm5VwlFJ9mC8ko74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671043; c=relaxed/simple;
	bh=zCzekRKT9JSyTr4thXKM1WB8HRHmA5X8Pn/H4UjJY/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iMpFePaZrC1dva2I+hJqcp8WknImNdKy2q2nJ41PUHN9XwzBOYNpTwkVeP+eF78OorB1u7Buz0godYrYeviNqAFJROegV2o5ciCoW9M/BJC74aWedlYUq1/RZwkPwaLnItbnqsUJ6a4duxz2nXNAByCf+BGGK4AnynVfMp5HAlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=omIsyo0i; arc=fail smtp.client-ip=52.101.84.139
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgLzFky7nK1iG5o3MwRIbQhycnEM2o4w5sTlZBqOGZbvo/5ybdf4NNLMNjBTJsfgtXEULNZW5s2+qu09dHtIj6kagPzZr0bT8fW6M1SF8X4QL4hLaiqv7h8SIRasABELU8aEzQC5DkwCvVaDvXYBDIOUDY48zsB35bRoXVQMtsp5NuGzLEOlb62p6Oy/ZNUbmnMP/EunjByiOwHN6NRzXEMvJzyFQODAmTnkkZHzVJTm3Ye+/A3ZxzbBAzL1bXg4XPnSxDlGN1YnIDmkmEFRMBOicvenXyXhrYD9BttUHwvOO+xMFuRXNHeBwB2KDJ+vOEvibQZ+1lZ2moW9hq0cRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4APbosOiY6yCtYKYfNQuajiJXWkERqsArXnk3WZ7Os=;
 b=Z3fUDGh2/M5/NMFkWO+bAfjjyVzGRAVmqX5ugT+87lYNg+JxnPn8XF6EPnX2cxDPmFzjgSN7tJ1IGjnK1x2btF0SPXO69Nd2RPOsusXatJicqk8r8V/deF5JiGVNOEpf0sZ01Wol3TYksrdB4YHmljCvaeLBQqbcRSzo6o8+STDHMMMFU2o1tSLh+bPLOH1jvHXOkYwVKIOyfYywt0I/wlfMSYhavtc09DyfyQr3O9QeCecacG440U9zUseIHWNTeuEvm35fm2Tg49R5S3dv9nvdT2lz4vx4ylonhnjmQi8o+FjZeRaTF5Tvh+LsOXFetjTH+bPJYTeAOTzzaltbxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4APbosOiY6yCtYKYfNQuajiJXWkERqsArXnk3WZ7Os=;
 b=omIsyo0iEU4frFVn1HnXffm/riIGohY3IXS84ErIRu4T7h0NnTWnw+Yc8TaKv50ghznj1yJDIaAwEK4JJnhuEuH0+Imga5KL+h/cEcnAmX9b1DIUsA1b6R+zoeaZ2OpCZCyjTWUvWHCOKOnH5VfaM3a9KNGydHBgBTuzV+9gXH10F20mQT2Pb784mER5FCFf41VbQ8OZyQU5q1Gcdzs73INbwQDMvL7TMrL5rxfUQHubG+80Z5k1fF2Rw0oQu4aviJEPJguRGEaRdXz1Bja6UbDYLTd46PGlGlVuyyvux64Gdoh1vL4AZSl+XRLAqhX1E7/C5R+xJc4HdZBbuOiJzw==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6224.eurprd08.prod.outlook.com (2603:10a6:102:e7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:37:18 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Wed, 17 Jun 2026
 04:37:18 +0000
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
Subject: [PATCH v4 12/14] pinctrl: airoha: an7583: add support for olt pinmux
Date: Wed, 17 Jun 2026 07:36:52 +0300
Message-ID: <20260617043654.2790253-13-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 225c0315-0b91-4955-d63b-08decc2a1d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|52116014|1800799024|38350700014|921020|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	97ZtS2W/wWjuFyl9YBjiP9LnHQF0OL4+DjdJBJXQjWzrNKHniqojsotIoVRuSHjJr9FkLEjsx8Kxl+tIQPqu7aw0ye3P4S7PbBtCUfL1AvksWc5S5aCSJxp/CjUDXGfxkRjQKgT1c5eqj4N4H1Y3OJBaLuJP8vQFZ+hQ2gjIVjSB79U3l5QeL7xyg5E6kcfjDhiw1s3YqD1zSreYI/isNC4YHXt2qJ78dkYTGMooqtEqyYFKjrWcm4fjNqSI1MSiHOU9waHCNQBZ2bFTi1QMaVVSJVrAtXQxXGclsqn28g9pKveUHdRrn6TtnxWeYFrqSJafqvX0GCtAX+RLFZb5iaba+4bB2FM2BsBd0GT62mk9LQ3lv+0Y3onlh3qAluAi7m5mVVs38uuCAQwI+AEajy7JuSUGHTpbDcgZHK5nOQzBKQ0nSql5hfem0VC/oucQJMZWd+XyRKxCj2+n+PclEX6lmWtTZaJ6QOKHHw5lCg2rXkVBtTlGsndwIsLgbHCOXg2tUUR3DT51Vjt2+ly0PEWAOhoY2YjyZ2jysQQ2KyezNV7MkLcTuyT5byhzMLfvvavtWMF1//a54NT18u9XTaDz2EbnRGHJ3ZQ4EBpcn2DEujYF+atO+pC85eJAfFbjgQyZHH1vFb3hNkbIl6qXGMkb2oDdkDuV3ZezJd5SNSRrZNBP4AkTWDLbJ1iotk2L9disnvvHuqvZTULv4NpYskNpC1bHPg8/44Cu5tRvR7fh7Nniaa1QLJBpC9ZvzSrUc6FBtcuL9g0LvRXyZUvICg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(52116014)(1800799024)(38350700014)(921020)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HlHh2vOPNHu8SMo7d/somua8MzALHLc5yjJ7ZGaeb5GHH9ovr+AdkO1xeYbg?=
 =?us-ascii?Q?BQwwe6a677HfXUxlMPqhSYPjNZZkGaF3U1p2ULTt+rCRZqKAArOmZTR0nAGZ?=
 =?us-ascii?Q?dfyVeyZIEa4UD1FWZh0Vz+RlDZkyG5reRS/KbuJ+L/uodHxV8LRn94y0Af4J?=
 =?us-ascii?Q?2hM+x/cQERjEYnacTqIpN71yw0eDDFMEAD+G+ySpx24MxwajJXcvrIwmlfqN?=
 =?us-ascii?Q?ESwNi68MXyyiAU6myyJKo+eoQA6s6Aco1/5kVLiiFa2fAcmoixXtEBSbnNCV?=
 =?us-ascii?Q?rfKS15bciBBtWi/nX6eDvY9gxNnKqhCVJXcx9teJd6rYLlJeWVeGfECc2428?=
 =?us-ascii?Q?zksaUOjglipZAKPhyBas6pzKNzJXmjvo86M2FsVUxTL0EfMlPXTYg2VG+F8i?=
 =?us-ascii?Q?KOszEbi6XoNaOF2Jvbsztq88uIFHM1/R+gioUhWZAamSaqfc3MvhUQ2Cpz1H?=
 =?us-ascii?Q?J5YxcgA/mRAsXZDlAxC5/8JPrmE9RxuWvPMtFwAKAKwO+LWOwXPHHHC+98p7?=
 =?us-ascii?Q?03ict7EeFt3Kd6XLRnmj6wVE7auq8OxlNQ2B6gMQ22kwR64zUGmuhNWU97ZG?=
 =?us-ascii?Q?6KAKkA9ZQ1kxq4zxYKXIoqJoJrxZs5+7tcy4vfxubtwD3lKWZzKi0ocubnAp?=
 =?us-ascii?Q?aR+6aT+Mx0bI8bLXoqvcXk41Ilrm4TobhZd84Bc22DcuipyUNgjEIQkUChaD?=
 =?us-ascii?Q?qoDOVoiELvh1uMg9p/VjhAloZVaNCYqPxioY+Q93bViRNS+TFTyFQZTP0gPN?=
 =?us-ascii?Q?BptC3ha9OumjYM6ZtSYB1k+11Jvv2tib4CeYWkrMgtZEyjsvUYZLzeF3uGFQ?=
 =?us-ascii?Q?+XSVwBDVkQX0KZ7bNHFLj9NWz3tmiqoK4FgHqbjAJmSHlgi/ibO4m4g0pjj4?=
 =?us-ascii?Q?UBbJpkRp0A59VvJP7mnAkcB2QZnBK6e1hO9vd9w6jLnTwErHAs4uz6QHqEml?=
 =?us-ascii?Q?xZUFgtH3g1/1eBF16PVihsw4NRJ69yjQ06v0Oa79H93PZCbLIOYyiPfcfh6O?=
 =?us-ascii?Q?3atYmYxT3eoRSv97O638gTQJps/J13RM9trOWHW1mRrizDf3d/sJyzD4a8fc?=
 =?us-ascii?Q?czUpNDzp4ydlYoNppJp7ZsDUF75aMgWgWrhYdrmOxZ0LWCA+6t+e08hYNq3+?=
 =?us-ascii?Q?1K1B8RCQtmoYozthJOWqj3TPPSQhZa9VWmxQT2gXqc2IF25zbID9wQUqSPeY?=
 =?us-ascii?Q?KdlGSpLMkDKXjLf8td3fDlhQ49A37XStZsWysooB5W+vdgan+Rh1inKzsWry?=
 =?us-ascii?Q?gC0rr0EdfeHuP4fDrT1olt52bFhKj/mm75cRKLGWsM7GauDITQYMqGfa4LDy?=
 =?us-ascii?Q?K7gXTnc0B1ZPsXejmfjExkigQCPPuWavcluMuncIBELINxx6xaOGD3a11gyo?=
 =?us-ascii?Q?a9F2AqhCPuEXkw6UeBUcWZwXBzZ7wjnpOFenHG0VevuLKORp1ZWw1VZJ8S8z?=
 =?us-ascii?Q?IWA/oVCCJ7kX1+N51xM9rHEYqg4erAt7n5kSIyOz/FQ5LR/NdPLVp0BnSfZB?=
 =?us-ascii?Q?tKTttEhmJhBH4796xlgSA1hsdJa3PAWtCcsI2iaVe2kapjaPuQf+OWl01FHL?=
 =?us-ascii?Q?PbKeBf6fZWmnvO75TDj/k7tte7XQ2jsxdmPsFZ9C2F5N+qmfViWpEp0JnFnD?=
 =?us-ascii?Q?khDfKFuEK+lM81aURwmynIAZI63guf26eQ/NlAJSNYBE92kGo4PbunHGxPDD?=
 =?us-ascii?Q?EmBxCqb0YHO2Dp7l7rRP5VL6Kotc0Jq7KviSYqIJIBSJxBCJHomSjdnrXJ1H?=
 =?us-ascii?Q?6tDHyvgb39s+EgXSbE3BJ9Zpf4hqBhg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 225c0315-0b91-4955-d63b-08decc2a1d0b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:37:18.2441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eg5dJXWLbQYxod+Wa8DNFJwiDfsO+d9wVESq+veOk/7TfBgBoY1TxkONrmpaVCA3A3EkLMheeWc9I3YKf6klw17b9AK3Jq4YBpbxI3OE63E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6224
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
	TAGGED_FROM(0.00)[bounces-38607-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91CB169670C

add support for olt pin function for olt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 6e1746ac0ce5..369f23cac5f3 100644
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


