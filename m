Return-Path: <linux-gpio+bounces-38549-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i16vGYPpMGqSYgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38549-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:13:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2124968C66A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:13:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=wDjaEOU5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38549-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38549-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 584B3305762C
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944B63DD52C;
	Tue, 16 Jun 2026 06:11:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021101.outbound.protection.outlook.com [40.107.130.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78F13DD513;
	Tue, 16 Jun 2026 06:11:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590267; cv=fail; b=kvf+9YXz+DLGvWX/lXmGodiv3VIT0zK6i7KX+MoqGUy1ViZFChosPTVrfrQ8wT0UJp1K/p31s/SMuSFcLUJ5XuVdRT6Khp773CZlutv2NsHTM/Z13VN/Wq4j2Q5/gGqJew84ndDsS8e53VEVs7FH9A0s+Od5YmR7gSDW+hQGYDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590267; c=relaxed/simple;
	bh=BVlxZY5D0v3NaPv19z62dUKrIXUtaF63mmFBMkq9cCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=keObEN78U3w9fqhYJWNd/Pe9+QYJvIzOrO9PD4pO9az1T4Gj+ikraqCPvwLpIq+Xze25OX505U6T2Y725YhJ/pjxwOdiSb1JbUY1JARZE5XxZGXc+3cCll8wISl3t+r4OlA+RGwNrc3eG4Spqe116X24SekluMbiTOTNpZPWv/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=wDjaEOU5; arc=fail smtp.client-ip=40.107.130.101
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HF/3D1/uwQr7hS0VbBZNhRtXt+VHAVlPeWsEHQx9l/PG9l5Z24qy/abJnekoGNGFtD/BWObZZ0o0FaaKXV+U4rFg7suzqZ4ORXxWr9wd9/q2yMjnfrlobfJ+iamAR1Uo32e35cyHEcsR67GPO87hvnUxfIZ8+TENcej8rg/EiwpcqVRrjSvwCE7YEUIOq/vsOXiX4BIPa+w/KCD4HjvlnQz165rp+OPfVXj/FCw/avhA8cyoU2rqLrSRZJJXWHnSf8KYymB1yDlUTAQ5STPoRnSNETnVmbX1dT7tKyadRaKWUnWMXiStRuUwXW8hLPSPZ+pgREbShxbH2hotCjyAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEZqaIeaMkDZTa3VVdkBUl+UfVD+FZ4iH6LW1+maZQ8=;
 b=Oryl4fuYIEKDww9EbYGSnaYCYbRHXGMVFi98DcdoepSBZvMVqV34NlbJVF5dvRVrNlwcvph+vieU6JadXCIQfjpNVRtpaKS2+OS55VKFCownFHXHJ5OlIuhdWUtNA3tgtGDFf0iga3jvYopnuVi4zcylBsAkLJEWPb7DsGTKB/7Bq0NhQoLqskj73JpXyhe1+cRZihx7amrGyQnXrR5YDYKH5Iw5ZZ2bN+0JGhsx49BMZxkMaq8X7ek3QMN+U/ojmiLdK9Qvv9cJJFxWRxCTQCcnTLzndcSRntZSZE4gJdj6zMj6uPtICEOLLjE+46uixPPHMGQJeIaOJdDlWzPcLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEZqaIeaMkDZTa3VVdkBUl+UfVD+FZ4iH6LW1+maZQ8=;
 b=wDjaEOU58V7tutQsuhMaNIW6TZPsjjEl3v2YBeRChpJEp2cD34l3Sa2UHb8b1zDd1zXGTZXGM4VHPBRUvRFZCkyqiAAyq8ue3IpTyNOap7ZlHKHqipJhpA3oKq/mxdH4RVDTrc+0a8mbFXO69VU8d11XOOPxyFKWLqWMPfjOdAMZFqh9/VfPX4wrqo4uxo/Id8myAivBHMzmCR0K3GpJbm0fXoHHxk+Gi5Gg5p/M8PyJhJotMF7ZtvsA+5zb11X6bnqikpaN6CW3atxySxRZgBFNIJSQMPjSIeyeKvbvVaKWmYT6Ku7P+m8BCiTYV2b7em1lkl/NL6lHd6sPe7zV9w==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6206.eurprd08.prod.outlook.com (2603:10a6:102:ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:10:53 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 06:10:52 +0000
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
Subject: [PATCH v3 10/13] pinctrl: airoha: an7583: add support for npu_uart pinmux
Date: Tue, 16 Jun 2026 09:10:26 +0300
Message-ID: <20260616061029.2630777-11-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 5e5ba986-6e98-40e9-d7d5-08decb6e04db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ASc0M1mEQUfbxUir5wkryUmlrzuKIs08Gk0Jk6+L8cXjAj+cFRyfeZCt0o0iiiox7xy/KCpUjW/mUmPhy1pnezEVhJCLwVpbqYEmJuIh04UVlARzvFQ5jsbwVJv/owwq2HQlHm8QmVrblmYVf75ugNyE/8GFcOfGa3viUR6N/ju/dkwYo5pn/X03REFTVsU2KRzgRr6n9FUlBSg7Ur5KTYAEEIb8SqjRlRp+cpr/z8lscwhP/TvVOgzmEyg12d/2xkEDmHI38evylptPX3EvW2g4qda7w1NkFejsiap+C0J9qP0H+Ubxhmeps6YcS64hYokB7v/ZK+FKwKJqtmbjApKhlhnBCVx5chvyUGk7bCw+hKOxN7DE89fLsbxplQ6WNlszH09CiGOLCRzBAu5H8x3hZUpvuN56HFP05lK8FNhWUXQfuITUH6ENYD7waeEXAOeuKYF4VPf+0hcffB4C654l9ga4fqLGHv09La46VsDHMyno5yALHmpf9p52KcThgHSrJhGiH3YGz2rWU0FRjun/2XTB40OGnAYsmVT1hmoGDa+f/4vWATS5vahe4XlTFiHONk1fgPunrgxkY7/1KHojPvpyA9qqJxMH8FXu3BcgGBseqfTTh/klBbkmg/wSfk2lf8pK7l5qJxRNVIKc6R34GOl14gi66vI0K4aZ8u3vEEkiwTPUw+k5rDPpykjIrBIL5JReXdvYdSKQ+Y5K1nr7h+NBtfMrG/MduUtJRaAiX4Y71/VKNieXOz+I+82f2yerO6NPMsw3QNXubX0DYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QvTXWTkZC8/1h+Vsk3kYZL9LV61WVLbIo6yrVvnZvwwnpirYDtaZNsQSmq6G?=
 =?us-ascii?Q?d1oGzV/hZCerdPq2TdVniLYKHgj89H+9z0PS7c3Iq5Lo2TnKIX/jUyGqL9vW?=
 =?us-ascii?Q?qFHqjxZAKNWXAquBQRFvLM1DOabE4DLjpaS8kQW+uijQ0bFHFD19riXxk5oW?=
 =?us-ascii?Q?BYQQITKE6fikQuJ+rW+Kt2f976kJJMXAVaMden8b+sBUPRGHWrAoJbzWf0Jz?=
 =?us-ascii?Q?IMw3/72hKY2kZxFMm3M7xEnarLFmmnkqIB9tt5ucpNPHQrlh5PuTGG+0WW2+?=
 =?us-ascii?Q?wErOP1bzvNqNG49j9P8APiHHrP46HXbAi3B9MSNmoZMpAVyoqpKHP8uuWgx0?=
 =?us-ascii?Q?K0dw7lI5zSZrS4BiGp8GLFz1QUGMyArV9Y+5QGDZ4X8jBjSVU8NGo64aw5VS?=
 =?us-ascii?Q?Yg2hSfNsTu9ih6GyVn7+Ei8cpr/0XbTVe0St7+tWKWSZCu7EFQsDU3bReCv/?=
 =?us-ascii?Q?1spH/mUd3sFPLI33gNT+D6iMcUNONLaaqaNDFE+WG0SCK7xiYPGBgrmiAbSY?=
 =?us-ascii?Q?m+I/8OVhcEay9Q+/X8fSoPW08gqBj8u3uvX8za6ugmpRgGiW/JwubUoennnT?=
 =?us-ascii?Q?L7aO3Ipof8fQWDxSg7rROm4bDEz8YeWjYpFeE4HNpVG42Z4pkLQhCXyDyKLK?=
 =?us-ascii?Q?FczU6joo/cZ0cKC/tC0Qw/UBctSiaqvZ308FOqSKBY3zwenm6oCzpHAr0LhE?=
 =?us-ascii?Q?Am02mNx0nXLZnXk/KvwxZNnafCzPkSWTOKQzIuIhYujgOj2L0RYErVXNtqKh?=
 =?us-ascii?Q?U9CQ8BR/e+U+rZ7ow0VFQlJJA/l/RTvweq4Oqi1jF7XP8jCw7nDyqe9+MKTY?=
 =?us-ascii?Q?cdpoT8jU2qvW3mTMUbUNErSLaxnKc2kW6KPNJpWa/a8vjghPEHzaDQ4PzpAx?=
 =?us-ascii?Q?Xk76WwS9RMbNru2XJfdCVFNvgUaAVYxbB/TcTr7v1Wx/p9pVSUamhlIRW1Oj?=
 =?us-ascii?Q?6SkVpjpHknda6dxeYEFOhnblk1I6Caahs7DmebPfnMG2Mbov2tDQqiwzLmZ4?=
 =?us-ascii?Q?eGuHibdahOW1D4CNaAdXzYKqY1F9DfW5GrMRZDQj1yG7PTn6j6MmcjL8x8ub?=
 =?us-ascii?Q?7+m+dbWh5slB8qPCEqjvJyXNG2Y0hr1dZf2K4mwb0Z4G7xEqRqk+OZO1Dn4m?=
 =?us-ascii?Q?/6KB3EEnr+RPAYhofj2fqCF8m3bneI8L9CeHy5SyUn5xQPsIlAOwZyECMIkO?=
 =?us-ascii?Q?3BOSPLukKVVK18oj/H7qOtTxgJaOCorPu7PErFW6fA6loceUDYyufD8976zg?=
 =?us-ascii?Q?+f7M/zIKcKOjtOPZQuB0F+iPBpFQQQ7CwLFjPbw2xk6j4KXT/bB83Ju14iSE?=
 =?us-ascii?Q?0wLw4B0uptj5VsOBQ1gvqEMPNv1lSPrImrYEThcyPdc2W+yLA5Kc0i94x0u5?=
 =?us-ascii?Q?5ZStScvmpl4+OSx++XDTbkZdtETtiAX2WqJ3vhaL4gnJyyS+QYGqgrSjylwx?=
 =?us-ascii?Q?e9B6PhEze79GGE8kgPO6Yoay/MuNmvjvnG4jQqf9FBQWX+MjTRe1baUR0Vqx?=
 =?us-ascii?Q?gnebX+mvXYqqL4VfF1IAbvuCE/vueNav7JIzkNkKtWpPnL0YipwB8Y5zfJJW?=
 =?us-ascii?Q?EWx0t9cvrZPobR+mIYxOslvvuTZH7SLvWo6eMNg1YNTT1PliNw4qBeJWDcfz?=
 =?us-ascii?Q?uxA+UzI0vyh2LNZu/1u/h5r6YwTI1oW209BKFAv+pjWGgsrdv4OA7nTpMJoi?=
 =?us-ascii?Q?Ao/nXl1BgUe7+KpukuqigGg9SEuIwd2NM5jstiWEEGVxUnGg5djHeXz+cfQB?=
 =?us-ascii?Q?2jdg+rlxmZBwsXM4QSxbNj8RjBD1nLo=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5ba986-6e98-40e9-d7d5-08decb6e04db
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:10:52.8067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlpH6J4tNpUeamECjodJEU84anzOfYfX3IDpkvut+wJWm5boKMVe+U5yH6wTTxgzGMSlltXEvpd8OC2biuKmR6H8jED5C3rzLf/F/9dkEnQ=
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
	TAGGED_FROM(0.00)[bounces-38549-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2124968C66A

add support for uart pin function for npu_uart pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index d4fbb12fc639..959eed06fead 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -68,6 +68,7 @@
 #define REG_NPU_UART_EN				0x0224
 #define JTAG_UDI_EN_MASK			BIT(4)
 #define JTAG_DFD_EN_MASK			BIT(3)
+#define NPU_UART_EN_MASK			BIT(2)
 
 #define REG_FORCE_GPIO_EN			0x0228
 #define FORCE_GPIO_EN(n)			BIT(n)
@@ -569,7 +570,7 @@ static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
 static const char *const mdio_groups[] = { "mdio" };
 static const char *const uart_groups[] = {
 	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
-	"uart4", "uart5"
+	"uart4", "uart5", "npu_uart"
 };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
@@ -754,6 +755,15 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 			GPIO_UART5_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "npu_uart",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			NPU_UART_EN_MASK,
+			NPU_UART_EN_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0


