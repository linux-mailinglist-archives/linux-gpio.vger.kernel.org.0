Return-Path: <linux-gpio+bounces-39061-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZINBFNUxQWqlmAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39061-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:38:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D04F26D418A
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:38:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=6Iuy6TDy;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39061-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39061-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8DEDC3009155
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 14:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34323A59A7;
	Sun, 28 Jun 2026 14:38:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023110.outbound.protection.outlook.com [40.107.162.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16403322527;
	Sun, 28 Jun 2026 14:38:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657482; cv=fail; b=Fl/xSlrOJuprM+PMLRyf/M+F5vUykiPUI6i3yyepA5EHl9kBJuOEhF4dHixQeeS1by8X3gS3I9yEUIzAlANCDDcexJL99pHS5kLJRac0e/AIfrlJQGOP9y++7eiwQiG0MSKXhrh7Cd8plLnMset30rznUX7HRKciyYxzbnBPfrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657482; c=relaxed/simple;
	bh=i4UePZZBmxFqfENHdpBnbYy0tFMPOzmCIYsx0SHJXi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GSnnO5CVnAbvf6tz5wikRRFklBNkZ1xL26GH8tO6jC97/zTFltf/MJk9QRpR3H/12FuLBDRccUPK0GQ6PXRTumfVoLmNjgqrhBsgJaK5Qns06cnPPHFxna4gGBZSgaKX1hTxKLFKgPVQg0Sqfdp0UXuhhs+l45LN7wEUmvkgEnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=6Iuy6TDy; arc=fail smtp.client-ip=40.107.162.110
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QztTpPteGmqry4PP6LHJGdpZZghIruJqq+O9ltO33k1/IBJcn29v/Sj1/MlaFHWM/PdfNbGrP7NOEtJqTe6nd5rpB0mb3zCpY4SJQoEC4ABq1D9su59VS7nFtADS0zyNs/MhOT3CPa6Fa7Fv2h5sh2a7CBsRkoZct4Y/v6+DDkmT4vp4H3DeuhSQrC7EuxknWTiJckrm6QPXVf+r8o1YrbIpvXzg1aQusnHabUfvH8jHcAHW50aW2K5jYoA9LEy6tzszU4D5n9uTniK334ImkxZy8TO/AKinIR71G1/d44QCFTfsUWRoSh3JT1e/agCOAS7v0WdOJcp1SmaCQry44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtoQAfJ2ykguW7YzdHtYK6j8KuFTyFrpO+UQNmUPmCE=;
 b=XPGmsYw6wVbsdBXzeW6ni9VBGAcQGAYEjsKnm/P49WOTjQRoHqwEGF5kRoRSi+7Xr8wgv3QUa6kXEsgn5Qr/zQXum8W65LhBVcuMN9JU2H5QzWlX3cDxL59K02YcuDvw6dAd3L/XBw9G/HLU3/JhLyYxChHGJbxBjZB4CoucC0zvj1zOqoccebeAh+FJQjpuAKZ6TGAB51xTwqhMY9iJsxlQ4SPTrqkR9Be0pzElYHJG8i/WzhEsoImlTnUbL54vFyKaZnFI5TrL82ynCF9UoilpSm/9qNj0muAL4SgHuCkfUqLx8pFFRbD2GDgoSh9zGMFIDnD1AlseuyKnpkxF7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtoQAfJ2ykguW7YzdHtYK6j8KuFTyFrpO+UQNmUPmCE=;
 b=6Iuy6TDysNUeX4fBHKPW770Nm5gnzTnoZAhhUMSVHBnqxDhKKhp0NlVO7POF49AUWOP/6ic5LrOc68IOsLEOHBsI/dlnHppVkW0Rvpub+7/xvH0mKlYJ6XjAfe/rraOJUaPGWOtgvPpeTG5+eS4lmZMKD7NlrASd8hVAcERmcmTAhQJgmP93mz0wpDYFBhxXKJONTA3YteMIyTMZ4qkH7YvvAlwGdOU09WH29ioZoiQntopUaaYXSf2HlFyYpjwVnrDKoPbgrfu4pxQapM600RekBkBZk76eEk+7yMNcPyftsKJcCldlvOyoGEQSM7OaHkoZ6t6gC/uDXD3E4hUBrQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:37:51 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0159.007; Sun, 28 Jun 2026
 14:37:51 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v6 04/17] pinctrl: airoha: an7583: there is no mux to enable the second i2c bus
Date: Sun, 28 Jun 2026 17:37:20 +0300
Message-ID: <20260628143733.273651-5-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0006.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: 35852c10-0b4f-45d8-f111-08ded522d535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|3023799007|11063799006|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	8rkfxrLTB2uzYPh5sF+oi9NGBh7OkrQD0r0neV598iUSX6ZGQ1OzvVmOrvZC0El8iUXNtA0wQwicK7cNq4Z4jyTkJjDXA+MI7boWFh2eqByCyep88qVeywxFjgNzC8CY5dOAwlQMjbmjtzme7BFSHjnTSb8MymOhFqdsfz9miX+upYonZNt5wrN1YH8HyVW52ArHxWJEKIwLs/vQuRBlozdFvMPsU0ibFZLHVYAfCNp9BPVO1Z9rPV+H1tDmJCbrOo8H8s1puYJWAvg/Yl9SbYUWHPoaXzZ5iUQZ3Mqc6rIazBuw9UNKm2NgNY9asyEQJaembTtUihb+HmGTmPmM5EcJ8daMSdoL5NLi1VQ/W/fOqQMhmAfFkpa98zGZJBuuoe4cm68U0ajBPSjm13EXZGaNOPuuhDD7wNzO2IU6XDmzC2K1XtZIfljGygMRCFo/ipkjXX/+VduK0JvB8kuwYw8rAHN8U4byf49uWaJiKnSeBwyt2Utfv8aCcoAx1PcsufDaZ9W6C82KiU2/PaKOsW4Gz2ItBpnHNu00q/xExAUodMSHDJuuV8OWAPfUxCi5Tdbt9RKqiRJhAjwDhHWOWxrGBqaaBBYXBfGxJx2fXeSsjxXhP1O1sd8MpkAJaLsFP53OXpkrrtGjTzOlZlGKKd9X2SuqjUJ7HxIMLMuCENK92ObTMCrJhlbL50rqCWxyN/6GnFbhcyUI4tGleSM4xmQCy+FOITFTBESaQ5S3t1sQ3yQjFK5jLdoFBPSYrBPX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OEsULHDuPbhYWOyjiCwPyBStiZgDPEL3K2yTm29GldjIqmoyjb7hhVv584SU?=
 =?us-ascii?Q?v9yThfVbVBe6mDiBqmQBjPabtKBbpNJpv3exXAS2z3XhPuh2GKAriL9VBpgz?=
 =?us-ascii?Q?+nytxvfsHEjMPfoTdu21xWjQnHYcc19cN82V4lPK0EULzMaNHKZvsgii2/4/?=
 =?us-ascii?Q?oKIXglFqjAYj7RtSr0InnBCATx7gZhcbll1qoyf8PtGxmjf+PSEC7VI1XN+b?=
 =?us-ascii?Q?wAgLTpi1wNiX1lqVdXxkNqjdn+DAA9eTeJTfSMNq3laTF+jIGVRXuY03lWpv?=
 =?us-ascii?Q?J0gH8AEt+rWNmJgJUWsV86dsFBtQJsJmzF0kvZ94YcXMBqrSQoe8b1xOVSkt?=
 =?us-ascii?Q?TFxIPRF+Cqi77zbGh5M7R8zXfZ5btN15KvL6b/ivThUupJdUa/x7TCMwmIPX?=
 =?us-ascii?Q?+ufcM2fB1mTiRoLa1ryf/FKfX1ZGIwaPaMUytseX9qC0GF3HPD8qYye2JVW0?=
 =?us-ascii?Q?hRUtfcWbUlo6BmC+QcwlOTFhQR9RoWS0f3oeYMPpEfr/KOX4J4jkP1ibkQ3a?=
 =?us-ascii?Q?Se3/jQS2LJc+tBkKdoq1os1UMIrbcEIU/9zbBDPldjj5EgiZAXkR68NKlwEe?=
 =?us-ascii?Q?YNhRyssh62Wv5Qh8IKrthESBq5SLHuBtJOiAfQBkhlJxif5te6l9HO3AOXLl?=
 =?us-ascii?Q?N5ymOt6xbc5e0egpz3JqYGUOjgx3FKdRF2mfqVsTtcYmq6Ky9VlqdEd6nmYZ?=
 =?us-ascii?Q?/rtRzVTvOYTl3T0+M8moBUWFr5xRi8fgGBwZ2gunOLn+cewloUDiFARbH2a4?=
 =?us-ascii?Q?27EkHPw8zY5aKoT+eAIRGBMbMMul4wKPHRTx3YKyRlIQKXLGF81nNfDSKqzK?=
 =?us-ascii?Q?s4NCCUZivzryMHpt6j4054FKw4cvq561UQxIHmvLXE4IdXd4MhanJjtbZZGw?=
 =?us-ascii?Q?NIc39HS0QdpkK4CJt6pK2/Acw61V4zOMlmBSLAdo/zjQecWkMQgVv/jwhFjO?=
 =?us-ascii?Q?uWhE3/+/ksxE1eternIX0ITjGZxLiGE5JH/QKG2T/QJvRKM9G4lDud+qJFE2?=
 =?us-ascii?Q?C0dMJgABMlKDJZBeWeu03CQb9lu04SkjAVOJPxBlf+OZi2p08eBtzVA9fOY8?=
 =?us-ascii?Q?3DZDd6Z49RuDNQfRqj/+DHr9bjup3KFcDF97vVqsIoOJxs/f94tIzHyNbCTp?=
 =?us-ascii?Q?ICn7dTA2/GaNp4K2XIPEStAqEtzDEAJm472haQVdDP5/20os0Zg8sXvBTDBU?=
 =?us-ascii?Q?JyxGe08bn4VkipBbaLKfwPWYeCBngDArjRSEct3uJgyPmk9IRY0SyM5RBbM/?=
 =?us-ascii?Q?7KJ2wojFazMrPLy06lD+QsPRiqI7d0Nd6hBFz+G2NcR5YtMRkFNXDE0s1g6W?=
 =?us-ascii?Q?7TNH3O+Gz+nsqfHSPzPYWohllXKNWD1vLutiFyN8cHb57wMna7W4jVxLJ3Pf?=
 =?us-ascii?Q?G/KRiNyrBaWmOyB623Gx9xboWeV6I3v88+WAIlO6fQn3ZIZbg7O8O0qKQP3t?=
 =?us-ascii?Q?wfCgiHMXrL3flrfwyPuFOalU0hS04BeGO84CmKnkfCf4ntI/Xb9WyZM+k68X?=
 =?us-ascii?Q?2HLoZXdlBUj4IrLnf5+9MH4TvKB6DubwG92nql2Ogm/STt+wHK39UGQJ7X/e?=
 =?us-ascii?Q?QicPH5Z22CMf9be5AIK6r/vgUmNjHfs0kq8DczYbzueuNWeCEjj5ByMN5UNl?=
 =?us-ascii?Q?YO54mh0/KfW92NL/4/y1Q4H8LVuJg53OGYK8uVOPa3fqjDEQXOINh77TwPWh?=
 =?us-ascii?Q?iiZ1wN0va/Tes3qrofhKJ409PPw6SJCSuoTCQfRfH1/ZL2TJm787ySyCFo28?=
 =?us-ascii?Q?IKYmMiSIuAKl4jCZz4/7ZY+eZcR3/Kg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 35852c10-0b4f-45d8-f111-08ded522d535
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 14:37:51.6924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIHbjQbSbSaybrp40bz7aKQEHhgZ71Gy8xwSYVZuC/sIKLX9NTUZpBlEL32MHCUg7Z3fYhtvb5Hl76I/ufV3o44lWsGEEzgrg51DAsyFljw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39061-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D04F26D418A

In the AN7583 case there is no mux bit to enable the second i2c bus,
so remove it. Also remove i2c pin function from device tree binding schema.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +---------
 drivers/pinctrl/airoha/pinctrl-airoha.c                |  1 -
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index f52802a3ad79..8d8ec6adb97d 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -60,7 +60,7 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
                    pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
@@ -117,14 +117,6 @@ patternProperties:
                     enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
                            uart4, uart5]
                   maxItems: 2
-          - if:
-              properties:
-                function:
-                  const: i2c
-            then:
-              properties:
-                groups:
-                  enum: [i2c1]
           - if:
               properties:
                 function:
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


