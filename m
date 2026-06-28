Return-Path: <linux-gpio+bounces-39057-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HnA/EMcxQWqhmAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39057-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:37:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D66D417E
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 16:37:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b="kgd/ia4S";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39057-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39057-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09A073002F40
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 14:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE7B37DABD;
	Sun, 28 Jun 2026 14:37:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023110.outbound.protection.outlook.com [40.107.162.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A88F211466;
	Sun, 28 Jun 2026 14:37:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657473; cv=fail; b=DpTCUcV1Hs3io+Rx9o7/NFfkrM+Oa43mnnzCfM8vSnEb02fjrhaPgq9pJIhjL+nkvScmPfkbdJaLmqWPBdzeLLCFWpnK/CviaqTrFVUQlVOg4ezv8LVHHu+SBBYSx5XpcAmtmnPcEFqUV5+kCMk7z5a7Y/R7lGqN7CQO0B+eMnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657473; c=relaxed/simple;
	bh=15U6GNmTi3Yic737Ld1NMovzSgyHKVgHvGlvWGXp06s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IGA816dwqQNbo7axgEv8LxigNR+LVAR2XGWb8y0+quHVqBtemdemeFbpREKOfsoHs303HcQUqP6BW17j7o6mznQT2RAKyuADdx2CfnX2ooUsstrTcP0digI5JfD1PuZDs0KfN7A037C1zQGRBgpiqIGYwE5S0S2YiVQBRXXHadQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=kgd/ia4S; arc=fail smtp.client-ip=40.107.162.110
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugGRSWwxuvNDYoSltfA3Z4eqznWkA3T/fvzstJJnQww0zp1pgeXxHiAFLBGum4IYqwNqw3Hv//WSG9fHDbYlTwJzp6Qvy6VZy8yCDWlWdO77xc4emvnzs1u/Z3f1Qmw4q6IsAi4NQwT0wYHBiHXdpygYXIJuODcsKBGDeAhPO9LoHla97zfOYE882Fiue5HAqvzwu/+OanRZNA9Ap/QWdeU2OdHiwwlt1OSthqDWNqUOoXUWSg9cQPe4+e91kNOFrG+Tr1z0X1r4wHtbeCkvLbeITP1wVwzPm5lUMz0KgYLonNVa3PfP5gvGIw34Cc750N73ngc/Fk5rzNoCm5kGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeuBR7NBu2tWVe6w20M1HNjdUZqHfL8R/ggccKptDes=;
 b=mrYO1Wknhl2RjQf77+w4no7IWJTRcir2lqsaR7oanYIoKCF8Nqc+WXHOC9czvYjtbtA03VvMggXEocq5Si8/+VXQW2Hqwg380qcdWuSJFGtXMZzQ39IurcAiogOOU4xuwFk1Y0SBI4qUVehs23+P0sIv5/NaMRYANRsfwMQlNk2yGBpNDmz8ZcrsOgC045x++7O1QrPRCoP6L+VEqS5zfcayL8p1tNkBzBKUJiVAhe5mOLtvONCBNmRz35cY2RAVgezqUZ/pWDBGZpHnUsXiir1mVPAPR2CrXbpHhNsUjbqnwjT+yA2YPMaT0jGJMlVCyDm22vp0kFGR69KRWAN5eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeuBR7NBu2tWVe6w20M1HNjdUZqHfL8R/ggccKptDes=;
 b=kgd/ia4SA0GHynQ1XnoPf0g7YPYiAjKc8IVwwNru4ZY+KTv5TLTWyOCYeDnwTXgPVXskOt8vif1/dyjtQI9K93Pj89fF1GNPsEK+0VD5uuAamauRJ/k+XBe5yN1lXzDZRZm3UZDy1dfxvg+J/rdh03gG6ZQL8PERLnvpzhRZpDOtBDYvHU4QoWu4ucWMyhEDA4cNKvE4Wv52XgmNJgopUkyqAzb+9GbIHukiNvH00kkTkUvyYux4A1Gpse/tcxKN81QKF1oZesS2EldpSXu1llVDsRJcpmR2AZdzRQ7Afm5G8P/3u9yL8a91vi7Xj0uD2iNAipytJKKlJEtSDa5QKQ==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:37:46 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0159.007; Sun, 28 Jun 2026
 14:37:46 +0000
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
Subject: [PATCH v6 00/17] pinctrl: airoha: split on shared and SoC drivers, add more SoCs
Date: Sun, 28 Jun 2026 17:37:16 +0300
Message-ID: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
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
X-MS-Office365-Filtering-Correlation-Id: e6c4f1fb-15c8-47a3-55af-08ded522d236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|3023799007|11063799006|56012099006|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	tHk4gxtpuozhPI1UEpa9WJt8KYHCLLssUCr6aBolqR84Me46Vi8gf/yyb04KN/r2svOZ8H1QayjldVRsdRzp+Q6ktbmaOApH95GZu+u70Hl/eH9ocdtScosIH4M+TVxFdOqkv8ur92sU1cxFCAreuC+7juk4Cxej5wthz08+hwJULbEj48VT2mnmc/yRyEA5VUiwQ2xrtnszRctAQvhVRMDdcZQEdows67o3ge3jJlxprundmRqZhgXJbrSBebMTK+3Di+6Z+/aDPsSKGjsy0+ITDPZ29Fu36GxNri4SaiHMoAI3ZeZSCB9/JS7WCME7ZDBcz8YNDvC1F4ah1suwlPfpwGpaTU3AI+Oe1yRMSGom1/SM1u7AsBOXb9AjQgRMRGDs3ci01XF7CGo3NlpEwkcAQoBpqOd1LXd0CP9nQ4Diyoq3PbzGVbMX0KJH6X6xAT5iwiInCDzR4iU7jpTihk5g75YjSVcWu98UYat6Cm3wb0rZT7YasO9glsB4IVTh/i+kuL7XZDAjiGupzqeHmBvXCYLPOHV7V3pkV8m+rGPEBPWQ73Nc7aIpWFxTHjBKXmTUpqd/79zye6Gb1J/uNBHpypcTWhOP391IDS5RXXaAArSIKW61HMMpNeEK8RuaJYIA69l7Va5vupyCBxj61/LJhmI1hc+vc78nWMkyJWSmQXU2h+FF/tm/t/Krbf49
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(3023799007)(11063799006)(56012099006)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EQaMZW6l5rMbUQQE++jY2E/viCQQ6w/i8ABvOYIoGNgg/FzVZMYcqaANZkux?=
 =?us-ascii?Q?2/rYl8g10RHHZ2UAt5Pd3bqL+tS8g5At/DXo/1qDKuce2o76+k1mniaVH3CJ?=
 =?us-ascii?Q?bRTU1osFvwFYVQR1NWupnNJptoRS/cctIfKnHcwwjbykyMHQpZZwD6vZ6v0d?=
 =?us-ascii?Q?dHqRFNy2Y3Br46B30K0hBd8hO74qCeVTA/GctSiWTmApEfzjaUqIHGnHsjub?=
 =?us-ascii?Q?MGynq72hA/O15GEIuHhuZjrJlCaM0tc2YVxhiV+ZdrhFIO2z2iuRdGGh955l?=
 =?us-ascii?Q?xDqIxY28YXAeL35HaeC9Ub9oQn6DqJzfg3sXmmHx0s4/5j9Q1dKgjkVDINda?=
 =?us-ascii?Q?iGtn+bJn3G0P2UuzQmQyw8F/o75qW3GMJHZ//KeWdsO/F1LuDhVVPSMaweDX?=
 =?us-ascii?Q?WEIjiJe6SgGJ+3XGeJlmyC3VHDTg4ixNP/x2BxK22UxAYeOLIYIqlaj81Du/?=
 =?us-ascii?Q?zbZ3Q6UNmsVOtVMLyMjQDTuDUn/IpYBnprbrshqUnFYs2HifMYh0D8kNBv8B?=
 =?us-ascii?Q?GUO72iE8i309PX4fb9galCTHAJCl6VjWqO4khQkXyhn0qmQNW11r+UCa1S5E?=
 =?us-ascii?Q?k58nvm+sRT5z1iaqmm1m/2EyO7y/XEdyQCuGUKmxhlTletpVTkUREQpaSCg0?=
 =?us-ascii?Q?EfqnDPHaQIeJkMjMl0ADHs2ZtcICPvO2S+nRlhRQcPJTjWYOWLIeGrIj9CmN?=
 =?us-ascii?Q?vPREwcNRarxQyHbRFGd4IQgYPVdSrjQJAd8XFUI5XhAR3qv3frUIUfNA4heE?=
 =?us-ascii?Q?M6Lyo/uDtv17klJHNIL/H/ekHkwFVDDuQyXMrkoTb2KBEP5EzalHkYYt6yjD?=
 =?us-ascii?Q?432fxtYOZAXzDd6a9k2POPtFaE38IPcCgI8Qc2wcMXep98g0By27SmA5gj4J?=
 =?us-ascii?Q?6fC5TQaXKfJdAYbSOI3sz2WZckS0c2rQnIEsPLQVCZnk1XPRLMr979YO5rf6?=
 =?us-ascii?Q?TaWIIJIdGEDSpFF2IwfNwoSN3honlwn98vhn60+XxBPdFr2GIzYa5FJZBKre?=
 =?us-ascii?Q?ZzGwjx9tlOKLNlv/FshtbUKkuK+b5x+hFXFjDD0sJHqgw64ayksyXngf6/NO?=
 =?us-ascii?Q?LjX6KKFvdn0BTOlQAyY4K1o4n94Hv/y4seHACXemNOkMB3FypOyiZ7esN8De?=
 =?us-ascii?Q?SSDhgV5CsdwFOlOMLMnQQ8Ke1kr/nvE7ESp25JpMzNQSKu+vZ4AhzzsIs548?=
 =?us-ascii?Q?5c/0KMp4CyUOwYLW/4ayWbmUmPZ4x4z3TW+dV1633WEddFPVd1rbWctI+yGs?=
 =?us-ascii?Q?r1ehcEAAfM/ZZQZDSG/yoX63jqSYLN+dOAKUEDBwWaYLIZQoOgmcD5ynMJtj?=
 =?us-ascii?Q?EV22zJ0yRLwNkicntKCDRMtfWq5vFg5qXs9UaZXBCmLS2rUtnjL3buSPhPIP?=
 =?us-ascii?Q?NRE+fl6tUcGBfcmGNrmgE6NXpBiNCZbIEb7foORqRYyo/NQpnWGZkd6RygIl?=
 =?us-ascii?Q?reO31NqR34CmgWD/E5SRQ+QuGq2a0bpVuyk5xKWDO0Q8ICP+tB6cQcytjegz?=
 =?us-ascii?Q?Ty/+kdsBNMlHeoUPT0UzJ29ucv2QH5anyxj76AWnrPR3JrRy8GYA+e8/QIHo?=
 =?us-ascii?Q?ML1CU2iU8EJOKP+JsiRuYq0KMNMGazGIivmmDbR7norj8no2cS3yGI6zejP4?=
 =?us-ascii?Q?WJT7Shi7eLsc8LaO6hYrFusCRfTPDrFvoNcYb+IlXL6OdfASlz54PNe5/mUH?=
 =?us-ascii?Q?72M1XioroWH5RViZlNYBgZ16hRa/J6DCE0ZT50YcELCaXURREti7eGjLLQdT?=
 =?us-ascii?Q?maCLg6uZRvzCqXNsqMTLIqjeVn/udIk=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c4f1fb-15c8-47a3-55af-08ded522d236
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 14:37:46.7312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwzIvFrws5O5WnqFM4MrkrkNmnVFSKWEz2rIH0CvAWpXl7I+lyZqec6ME4J6xjZuVLoZVgBuxceg1VFYkhHjnkzoKH6utfrdbxmcQjhZ7uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39057-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 358D66D417E

This patchset
 * fixes more airoha pinctrl issues
 * split combined driver on common code and several SoC specific drivers
 * improves an7583 pinctrl support
 * adds support of en7523 SoC
 * adds support of an7563 SoC

The driver split changes are based on Matheus Sampaio Queiroga work.

Changes v2:
 * more issues of airoha pinctrl driver was fixed
 * SoC specific register addresses, bitfields, macroses were
   removed from common header and placed to SoC specific file
 * fixed address of LAN LED mappings registers for en7523 SoC
 * improves support of an7583 pinctrl

Changes v3:
 * improve searching of chip scu regmap necessary for drivers
   operations

Changes v4:
 * an7583: add support of OLT pin function
 * an7581: do a proper fix of pcie_reset pins mux/conf.

Changes v5:
 * improve description of an7583 i2c pinmux fix
 * rename an7583 registers to match its an7583 names
 * add support of an7563 SoC

Changes v6:
 * fix some of the issues found by
   https://sashiko.dev/#/patchset/20260622113046.3619139-1-mikhail.kshevetskiy%40iopsys.eu
 * update device tree binding
 * add bindings for en7523 and an7563

Mikhail Kshevetskiy (17):
  dt-bindings: pinctrl: airoha: update/fix device tree binding schemas
  pinctrl: airoha: an7581: fix misprint in bitfield name
  pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
  pinctrl: airoha: an7583: there is no mux to enable the second i2c bus
  pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
  pinctrl: airoha: an7583: fix muxing of non-gpio default pins
  pinctrl: airoha: move common definitions to the separate header
  pinctrl: airoha: split driver on shared code and SoC specific drivers
  pinctrl: airoha: an7581: remove en7581 prefix from variable names
  pinctrl: airoha: an7583: remove an7583 prefix from variable names and
    definitions
  pinctrl: airoha: an7583: rename registers to match its an7583 names
  pinctrl: airoha: an7583: add support for npu_uart pinmux
  pinctrl: airoha: an7583: add support for pon_alt pinmux
  pinctrl: airoha: an7583: add support for olt pinmux
  pinctrl: airoha: add support of en7523 SoC
  pinctrl: airoha: try to find chip scu node by phandle first
  pinctrl: airoha: add support of an7563 SoC

 .../pinctrl/airoha,an7563-pinctrl.yaml        |  348 +++
 .../pinctrl/airoha,an7583-pinctrl.yaml        |   65 +-
 .../pinctrl/airoha,en7523-pinctrl.yaml        |  375 +++
 .../pinctrl/airoha,en7581-pinctrl.yaml        |   15 +-
 drivers/pinctrl/airoha/Kconfig                |   30 +-
 drivers/pinctrl/airoha/Makefile               |    7 +
 drivers/pinctrl/airoha/airoha-common.h        |  171 ++
 drivers/pinctrl/airoha/pinctrl-airoha.c       | 2455 +----------------
 drivers/pinctrl/airoha/pinctrl-an7563.c       | 1115 ++++++++
 drivers/pinctrl/airoha/pinctrl-an7581.c       | 1487 ++++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c       | 1497 ++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c       | 1125 ++++++++
 12 files changed, 6250 insertions(+), 2440 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7563.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

-- 
2.53.0


