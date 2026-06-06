Return-Path: <linux-gpio+bounces-38028-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 468mGliBI2rLugEAu9opvQ
	(envelope-from <linux-gpio+bounces-38028-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:09:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B3064C2F5
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 04:09:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=NvlIdFzv;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38028-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38028-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0C5B3030F45
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2026 02:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7512C1788;
	Sat,  6 Jun 2026 02:04:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021103.outbound.protection.outlook.com [52.101.70.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AEC2BE656;
	Sat,  6 Jun 2026 02:04:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780711460; cv=fail; b=FGM6Tg87dGnBVM/91/j51beOyQmq++/P8iJoFOFsuHtJPXW1Izsn96zAk8p4bOGcHFO5Nai/t0z2Mj59tszHvwMe8nmupHzuYSbqaQqcDNt7SGQFLXDHAWMCHPpJGwSlDuI4W9TTRNjf8nq77910TXoFQJyBkFscuWAeW6QB0rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780711460; c=relaxed/simple;
	bh=ffayBpK4PgFhI9+n94UE81x891nbw42GnkwmiPMETKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ye4oSvifsdljKUyDBxx0aT1lEe+oGA3UO/B2quylS3DXhFb37lvZIXv/Q4uU/rOg5MTwfUV86Sxq/76Nd5ddd5orulB6EmJt5FjL1W7CcHVcr2nq6fxHNw/aT0Vm2vevH5SEYjsFNFvxSmvJ1sKotk/k0brr1quO4IyP2GL1bHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=NvlIdFzv; arc=fail smtp.client-ip=52.101.70.103
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4A0VZfovO2iM9E9QDhzIJUAFMyR4U27QtEXbBOLOlEzjHhZ2xmFxvqUeiIIxvTVxwC1zntDAuJ/X4uiXRRACuzGzSA7u7/uENh+7joE4tNwckaEJ1r6l1yovF/6+z68VMALKhPSSzCFZDl924NRDZxUgy6iauD178IDcEXSJFfdhOUWm9S4j1XCHs2wAFJskrDV9jpwdvpA888XO55eg4X+zsAh84S3EdtM+K5AKtHstioH7ajcaDXMpHcXKWzFcF45QeYY3Ixq6dyMqHyVgv9OkJongrgju0eTl5vMHmyyb7hzwTc/0yUTz2r20U1EqBxbEURirCzAOc/pS6hUXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECFb+azXNKYvk9q1g9bD4jBMKoDxwd3230PP3WFNB+Y=;
 b=HazffzxCjpLry34blJgYWoNL8R3s2dXv4fwcrf8dP6PujbXibqzLYcJKFIPrV00OKZwi0IDA/9PH8ae80XAa+H9jfq1V820wAKV9t66I+kXGoFEGuCpzG691MmCOmQRiTUNpjxLHs1dn4WF9LZ9EoVuKhAb2wHts6btJqTh5ajphGqoM2sqzmG2HsGxitA+U1gPt7bckNsPYonFuFB/D8fa+HFZBsCGB3Dp2DX+ObblybovBymYyjrnendpZBlKF/nYwhKq4ruNRbZJRfu4RX9o6YJdDnn2BrJX1B4MmuVCoEijuyg9sFkGyB+7SHei0eYrMcUCjPgKieRbiYPW2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECFb+azXNKYvk9q1g9bD4jBMKoDxwd3230PP3WFNB+Y=;
 b=NvlIdFzvDKKAelp2vdeL9j8Oss4lft3/6dt/hM7uUw5XioRRsLZRsfgL6l4q22Q0p28TOwCy6Q4tAZZ29frLRWISt8yq8EsG+ht1FCjgT/3SuaZ/QLcWluP1Xz6Wj1+k3XaaP/wx6TcnB0ubudgr4B0qkE+uUrqrkMOQhEGlnkV1D58lfxSnBdI/LuUl5ntFWJHSQtkqCXrm1nEk5GO4q7xp+bjZVSaU6QbL5PZfXcUC8eDLlkFCBcpanRFa2pR4+ewbfHo9W/eda2XeuDKpv4tKynE8Js4RTT4MeeI6Bv5lY4B5LEfNvfSCf2bLETW8sDs5TAptPeSbPwR2yoBotg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:04:14 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:04:14 +0000
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
Subject: [PATCH 11/11] pinctrl: airoha: an7583: remove undefined groups from pcm_spi pin function
Date: Sat,  6 Jun 2026 05:03:42 +0300
Message-ID: <20260606020342.1256509-12-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 0403c6a2-0252-439c-507c-08dec36fe842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Xc1ppVXRNVC8cKV/KYcliuhYLowblw8SOMKobFfLnu+LPllqtozL9tz3Q2SCllFSMieen+N1OUMwNQnUOJYs/mvFMfAugvr3AoP/4+6xALx9JlpCDyjyYg0qpqpuynQMk1rFP7V8QnEXXP2DaD/A8auhLWgRQ6v3nY9LyVPWUyIzQY2iCkLQHgApPfDdOiK+0NeEhDp55ZcpxZYL5GzDs30rwXdB5NBv/2V0KuMm7bzMHJ5i20WXlG2zmGJrCPpEJEAgtoz/aOGMSAtGDKswKLDBVfNLOO8ruYlU54/wCp2RXHMH8pjRIyGgSkFDIPRWO6YS8IFz6vQCCG+8NG8dsDgC8CWYPk1OXZNmdMkIzQiOEO5MxGxQUq/RcS0vZ3bdiaeFEm4udvH0tmLl/r4o1WJ6VDqvQdUOkMc4NIRRluCxVF671f0Y9EO3rPngQlfzf7pxRbfp37TmZ1W2GlNMYBYAYDaULIdJWEvoRoOxh2y1xCR27lxBKfqzOMtvkcNc7KSOjLNYijwGZILhNukSRaUBS+VmTYGOXaPK/wYm3kT7n9TKkhX62S63P1Vjrii3qnwfocBBYTzjkVsPoRhvQjQ7ZkwZ1PuF3aearfZF036Vxz13m07HP0MvGT+by+TlK+EQNCaedW2Shqnb4xG79SdG+hbDNo2B0xC2U8BKD6r5WqEyBDPWRP2uwfrpFbHhXxgDDEH03bG5N+RpW+j4apNzKsrgrnTH2abZ0EfUYVO2InjCLuKA32QiAlQnMzdpn60w16EvQYpDAI8OoPNjbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G7LCy7gaO6dN2rN+hnNT3B9iZHOVyO4UGZyyztAX6NZLYMwRsxyzkc2HY3JB?=
 =?us-ascii?Q?iyptfnXGMlRHUuR/3U/T6pMXs94GOp+l1peFCX3x0BxwVxMRUTExWjo0QjAK?=
 =?us-ascii?Q?5lmwc5oCRz7/JOt73YVAQWOKyGcFNy0unzq3CBsQ43QXIBUYiit3WysgDvil?=
 =?us-ascii?Q?9srJZbqLCNM8R4XYAFrQfL15EsCtPYMol5HOxNeW0dTLth8cK8Y9e8HvfuX7?=
 =?us-ascii?Q?/U5jTk+ZxqmzHPnJvyfu1WNrxf5iLN6wNIBqaiAzss387uQ3KCxKX/xzmm9s?=
 =?us-ascii?Q?cY5pPeQZ4s8z08l0FQgRIBpZ9VUQDeRLGn3xMFQHXBFLC8MOPARYAegHudjJ?=
 =?us-ascii?Q?gQer5fLM26PqNRSmhfq2jiGLXCBybz0KrJB1x2fRnesIGVZ6nE2WxsI6gsVL?=
 =?us-ascii?Q?sO2s19VgRngxvpjgp1vlbzWvhBAVYf+7JK0vlwedg3/OboL5vLI/U1oTq+fQ?=
 =?us-ascii?Q?YdMuLTP7Oi4uJy4eXpsO4vV2Rckgot6UbHXuy/JKepfCkkYmhmQs9zAZHOoq?=
 =?us-ascii?Q?FcG6AIJ+7JwWZdzcdfMgqcB7LPUHAA2QHlRCywuw+OhlOV4CEFkhxnkPvK54?=
 =?us-ascii?Q?CXq925vCbBoKkuOcmYIFj1HVDdsygtFoAy6VcqimfKxNLvdrYQZk66phv7B0?=
 =?us-ascii?Q?IkZ+ATOfQlgPt4KglvCqF/qsQkpQrdxFWKY5H4qM9OHjx/nt3lexPA2iXz2d?=
 =?us-ascii?Q?tFvZmLzAxdPKSv2fGCSuOCid0jhWlNPysNfD8NOJ0afyAg5If/AhAn2Shfx5?=
 =?us-ascii?Q?xLyAhBhrm8JRSjo1q8Wj8JQWhSDPkvHILfGANMp3EekvbM57Y88m+ZQBYR3n?=
 =?us-ascii?Q?8xpB2Ghx682wB2y9Pv2vUpMgsgsO+dU2O4u7AWeZ9vuZ3Oo5jrSsBzdQh2TM?=
 =?us-ascii?Q?5vhZjHoMqNrjFp/zHB/lbf53USpW07uPtxO47aPzI4C/0x8YZCPaEZEhsEXR?=
 =?us-ascii?Q?dlnZdjblyVFcBcNrp5yO/eiiFF850dWeMLSekIsOrNTUCfjawF5vvIR12U2z?=
 =?us-ascii?Q?eHTLVU4XAscr6Jx5kiuB7FQ6qoUNNbadHzwdXeUQNjh0mgXatzXY9YkvYdnb?=
 =?us-ascii?Q?s66G3VloLo9h0lKWEPCCEoRcyr1QFH5PEetl7n2xt97BUpMsUmW01OLYlssd?=
 =?us-ascii?Q?a26ZE+XGoM7brIYTpeOLVYpyVFkzrYZbyeRpbHgjRmcC1lveOhB2Lv5hqtZm?=
 =?us-ascii?Q?/uHpvjp3siG+7mNIqtH6eKWSXAUFOrE0SbzC9ZqbeI4V9C7VPqbGJAx8+fwu?=
 =?us-ascii?Q?I02HWKp+a6Wu2GtpUyIluu1X12IlXjLTwPZBs6ktFN7ja6epeMEshUuchYls?=
 =?us-ascii?Q?YjOICGPQBy5PvPkJd7rWqXo/ohbb8eAuJXMYrAincvuekZk88IfA9WlFOrFh?=
 =?us-ascii?Q?oXjFexlE6TT2oPc6eoUJdeUfciVfMgHBc3NYS1WyN/RFhbGT6PSi6r7wx/RC?=
 =?us-ascii?Q?ere6sNhxTZKHmR+NQbIP0qOnb9ORM+I1hyywmlaetBAyHGbozU1CzgXV0fQJ?=
 =?us-ascii?Q?w0gMe9Pbyiz+6gwIzPXl+jGB7UIrMEPT2dTPzjPJkeBetk0yS2mPqQO6bgRO?=
 =?us-ascii?Q?2KEQi0izz+6Ry9J9x/cCrBhZkQuAghWZ56oe3H/yVMn+ICQ0uI/R1iL2dQ+b?=
 =?us-ascii?Q?UdVZ2I+bTh7BTxh51kdP8SNZXVjKn4dca0QAj0zT8cKhuvFH/BCfYt2eLvO3?=
 =?us-ascii?Q?shYLMyxhRapFE4RT6DoYFOg/55y1kmjyVdR8SgdsyRp/92Z6M58Y3CZ2c8DU?=
 =?us-ascii?Q?yTTKWB3TXvyfPxRA5jVKlxuyjQzzlOA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0403c6a2-0252-439c-507c-08dec36fe842
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:04:14.0145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0aAlEloipxbMgzERnrPHaglOxR2lLrr0CtWUYMvncJVUiqoR1G6ov3XOSD1fRhk6M7z0Whz6VNXjbVWa3TJB8jlUbUd5pK7+Cse8Pel9BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38028-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4B3064C2F5

pcm_spi_int, pcm_spi_cs2, pcm_spi_cs3, pcm_spi_cs4 pin groups are not
defined, so pcm_spi function can't be applied to these groups.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index b73ab60d0065..bf5ebb31e635 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -877,10 +877,8 @@ static const char *const pcm_spi_groups[] = { "pcm_spi", "pcm_spi_int",
 					      "pcm_spi_cs2_p156",
 					      "pcm_spi_cs2_p128",
 					      "pcm_spi_cs3", "pcm_spi_cs4" };
-static const char *const an7583_pcm_spi_groups[] = { "pcm_spi", "pcm_spi_int",
-						     "pcm_spi_rst", "pcm_spi_cs1",
-						     "pcm_spi_cs2", "pcm_spi_cs3",
-						     "pcm_spi_cs4" };
+static const char *const an7583_pcm_spi_groups[] = { "pcm_spi",
+						     "pcm_spi_rst", "pcm_spi_cs1" };
 static const char *const i2s_groups[] = { "i2s" };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
-- 
2.53.0


