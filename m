Return-Path: <linux-gpio+bounces-38540-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NViRHuvoMGp3YgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38540-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:10:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DB768C60E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:10:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=v7pvMTs6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38540-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38540-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6AC4C300728B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433F63DA7D4;
	Tue, 16 Jun 2026 06:10:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020111.outbound.protection.outlook.com [52.101.84.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087833DA7C9;
	Tue, 16 Jun 2026 06:10:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590244; cv=fail; b=PX82ZJ5iHE6lKDEkX05X42Ifr0dRiJCt3rApA40FBhE+4RXGUndB3is4vmwbvuTkLNoLnCDe/qojMEVpUCzf76RSCty1hnCseXpdOJfpU4JUantZSHyYfo35YOsEtB6BwKQ1EOaTUTAeeR32BUnpfcwN8WbQi6lUb/oFbj2e6SI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590244; c=relaxed/simple;
	bh=TREqsXe20uduMDbaXz8hi6M1gilkwGiW8hZ1tfbKXMM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Rr/3zd/qYZyRjZH1uJNlrjZ0eLYBt99V9uoiuS/i52YJWZ+fLRPhj6FD7pZtnwL/qeb+r6SBhkvU2Q/Xg4tx04Yqmyn/nnldfyDvnHs7+hf5JJA9gA5QZBp+1LYDGRiAGvK1BEZS7GjQ9HyFXaQ/kbSh0o8d+7Yawceb8vMxFiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=v7pvMTs6; arc=fail smtp.client-ip=52.101.84.111
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWq0GWIMzON1LXbB+diekoT9NyRoKbIeGAGhOcnt0nkPKfFCt7YgB5mVfcSIAdSRk/N0kRR0JcLTOG7ncNKC3c/WgQ+K+pSSnUUer2T2W46Qti0snKVfpQhgIRmUl2cDkTOl5IKYEkZfVIfy/7ZO99zFZ23l0rgs5mHZ3M2Be1IPz6/6N7IGHcdKhX+FdMqXzJ05qwGqgq5CJdkh+/IaTRc1v4q4n903SPRtquS6tlxZcP2VTr5KEqekVyq7FqO4p6KYsIcyYV1uWehIFFwNXo5Rle9C6SUPIsJODyDe9LFQnO1rtCQOBiLIV7vmWjp+8ZYLIVYrtBVrVGiC/EHzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iN4QrSQlJDZ6RUH8GwEH9JT/FalOzaah4A/ouK+TbHg=;
 b=E4xs/DoOIT47RktGvRM8b/nNloz0ovlYDYMXq61XOc+0oT/QFQrODvsvjxD7QkYU7YwNC7qu28fYBL1+00WYP7aCKIhJeGZXyrkF+mQzwvht5mfTA1HlngvPai4L2zyq0ZGzRChgSY5TR9O9K2gK+Qdq5mqSD1yXHwY2axPAhnpZw45hG+RkfJi7GkoC/i9y57L0yzQoRCzt76jZD1PaG4zZX7Pd/s1Pd1GTe6OiioW5SBNNPypjg2aEWlwaOeGfcUVCFZnx5PIi0ne1ItvHZmUMGZmK1k85FgE33mTHhKK2RVxSAPw/sO9x1mkuNiWEwyDt6JLO4zZ7Ue7mJBqZIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iN4QrSQlJDZ6RUH8GwEH9JT/FalOzaah4A/ouK+TbHg=;
 b=v7pvMTs65MnkDY57tDyc1wnj9Zgh1BQPyBSbQqM35epXiWNGm442byIgImlYdd0TGJCzhOJgYWKdEEmTGYmgDTANQq8pPjIyvbE3DIQ/BL0i9TwZvW21QnRabCmTt6ZAmmXtqkN2lkQXU/xwh1LA7I8YV7+gZxElKHnzCX56rjzl/0464Fo1j6K90aGYHMM0/m62bzsIOe7iIL5RcvDYYifwt9G2z6k2LW7Fa+Ol+A7yaqRuPp05iyX62S9TOLoPQ+UA7/n26t7okBjuJX4zQaxYZXEcEN8JgJ36tYQKgO154+ExhettYukSP9i0CwfPIh17s9myTGHUNY3A01mzzg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6206.eurprd08.prod.outlook.com (2603:10a6:102:ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:10:38 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 06:10:38 +0000
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
Subject: [PATCH v3 00/13] pinctrl: airoha: split driver on shared code and SoC specific drivers, add supporf of en7523
Date: Tue, 16 Jun 2026 09:10:16 +0300
Message-ID: <20260616061029.2630777-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
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
X-MS-Office365-Filtering-Correlation-Id: 2b6eb730-d8e1-4f35-f42a-08decb6dfc15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|921020|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	thF0e7SaPpDBZa49v3LPfUt+9zEQjk2kNRNZ1CnzAinhAAqSdUdkWQh+BH0CseLMVMLeoh+82yDAElc+1g9IEQ3/gLFNR1geY9XwPJ3KKKmfIDNmbRpPZ6Cwa9Tdt/AsyxniMe5v5mct8YWT8gzOdSjWJ/+qRuMg9w+4dAvdFLBNFlKO5aNEoblkyB8Fd6rP2dBOA7MV9XmQHVYWaWEPy4EsCLaJbUFgXOKHPkx4ReP3le4L4LYCt5t6PbG09Dgi/fLFq0b49xdjANvPB/9ntfFqdyGTC5tLaTtrjfMmV8LGWMaeFRn7MofJc3gNNaqwSUiDhVNDBZZmd1PPAJjGaMnoa47QH2NpV1nHjtH5ucd08ZzRyLvh7jOfoCH4z1rc7yF6v74bTvJ3jo5V0CeDHHq5FTwFTu7rngtDOA7AqLQpdk8BM9p1Maq8Ah9KrvJkr48mBQDz56pa/21/ykPq8C0v5XqhyF2MZG4yD5eyyQbgN1I4en8Cz+HYFs5R4S+dLGtcqgqrSMftPVodaTNMVLuEQAEYLX/dj3QGzaYNDzTyo0wXDxwV8DxNi0GXW8JtnXom8UTKeB4CvETkRTuD6uLlUa84OD1uKNl1vicieBELRwf/06+NAGEj1vTCD7OX3uvrZ/VB5culaQ5QH00dpPiU9wB/C2HqL7vet6UxsafT5/MnAxgH8yFS/IZZaPajyRxOQHqlG8MGcEN0zxXXyc5m2ssjwX+CNAMRmb80UxLQaA9U6zR7k+Fv37uJwMbxxUxSs19cxwoCgvOSW5d80w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(921020)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p/z3+PBBBx/ExAdhLJfujZEzU6rHQ63AHk0uus0G/x+8BUSEhVbcf5QR+XMM?=
 =?us-ascii?Q?REs6T1sOkIhgR+RhA+kDcH6H4VIIJJDqs4e24QPKW8eorxMJqkvLJpcYGpdq?=
 =?us-ascii?Q?OxMpodLNm2YdIhLzXmmg+rbCk/QAczq+zDTMfwNYQfE0B/J4VxziWRTGHsCQ?=
 =?us-ascii?Q?zDmjao/dfha18gtAh3+wkbvRdrLeZyIcsf18HnCy36pSjnpx4xl+AdxqEG3a?=
 =?us-ascii?Q?hkzMyMo7bfD0N/ENC80eiHC6ctwim7iXaLCBTXANfOc5Zz4CcLPZwdgm2wu4?=
 =?us-ascii?Q?lC7TDPfGJtkGNs38BztrcZpDyscB45V+sHHi9f0wwiPN0anNp8MwAT6ikYgh?=
 =?us-ascii?Q?FNkMBgfbdNit15+sjN+OUulWjVJCzpA4eb9biZUpGQxxMTEbpcqkZAmfMN43?=
 =?us-ascii?Q?RFYfY8zkfm8QxbA/KmjOj8xnCyVDjRKvqqOJ+egSj8hL71vTa8ss5p4362D3?=
 =?us-ascii?Q?6vo/9zmeMrhrJV25kPdBf5Q25/XvWsotOqkQI0eVLQL77soslEjLw8QeOhWQ?=
 =?us-ascii?Q?q2NLo/oJWZEriP9ZdrJO//i5MrjN+R2bSq/hsrvLjRNJ5WCkG2oSE/2LSLIq?=
 =?us-ascii?Q?e9PBFTDu1rAovc1+eTmxH7jjOW/STeMayY4ylrDQqtfdW0N6/eNmVBm/y+5e?=
 =?us-ascii?Q?ymxU8be0wSgsNpCqim+KXSTvUw9sFDKJNm1uSGxwf4cWsRulYwbILANZ0QTM?=
 =?us-ascii?Q?IK5XgV+vNLWqs2v03m+WmFt0eeKNoLvMOaM1rMNm+++EouQ2ELyl3+VTKpha?=
 =?us-ascii?Q?iolnaDNMCnD+OMUM2TBTeivNj0lhIY1HWNwYlBOMv0hxgEPapSk/aoMR85th?=
 =?us-ascii?Q?/D6gLJ+2qykwxttL+r0wvwvHJnO5AFcGqnriDk8/6vdD9JDURFihpqMNZhio?=
 =?us-ascii?Q?cTlz0v4wauCy3C+tqiTl7snMBQVIVBzTtfcoxp0XygZS+lw+/pWZea6npf/9?=
 =?us-ascii?Q?7ygJ6axMG1aK0cBuuZK8jcq/XTOIMunPIwwG/4xlY2SzxPF6SOiMZca/itBn?=
 =?us-ascii?Q?gFpRKmY2Q/1mLJw1gA7laLzzvEEaIR3kAurv4V/ExTsjaAExSZL7YRB7B9xD?=
 =?us-ascii?Q?+qBdh3GY7pNwQATiOW2vedWMmzGZEUhud13a27QT6am32P4cYsixPYBAWVey?=
 =?us-ascii?Q?ppZZg+qWwY4ECfp7bTA9p+5OcPYb814+5lxGcjWwal9i2HBs7CssmBC8xMxF?=
 =?us-ascii?Q?raI+lDcrFuCJ7ndmwk8tKvX1SQm4bF5p7mxX7OxuHB0R95rst2pLUVpEEFG6?=
 =?us-ascii?Q?8XAtvQg1fVApwtndP8tJM3ev0AR4B/1q/8t3Mzxr3+N3RYQRGWb+VS8KQ8PV?=
 =?us-ascii?Q?FzyWmXIrHyMu+/PF0bGzk5PSxSG+Rsg0b8hFvkJy72KagjOfjEOztwi1ftMT?=
 =?us-ascii?Q?S8d8xTo85FnUsCK9PCLTlKB1AHARYAZTdnF+045+CDa5eNsIiXunws7OKEdk?=
 =?us-ascii?Q?51bW3Td/Z8ecPds+xB9io7K9qxv0Or30affeHGieIrxu7l5T8Geb/BXX2mqE?=
 =?us-ascii?Q?Uak7jLmoHqR5tv3JyoQzRDsQ1coDvCrRDX72udKDqP8QrYyOKu2I7BniRCWS?=
 =?us-ascii?Q?k+4K04MiGDwAkRZMepZDTqVVJnCZco5QPtOftbvGQBcVyl79cvQTG4goA1/S?=
 =?us-ascii?Q?kwB6i1zxhC3hgSxlfDZhWzfcHPlwFm03papSq8FHZXGGAMpQiG5xpdw5K7sE?=
 =?us-ascii?Q?ZRW0H32074SHnNCbf5Mqt/gnfec6vRulo4fuFDzbdZvUdXyyKlTZi+cn14Ey?=
 =?us-ascii?Q?LGNquv8ahxcqdiwEaeiQp6ZkvVF75ZI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6eb730-d8e1-4f35-f42a-08decb6dfc15
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:10:38.1256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Js/G040YVHgrsJiNgITcgEL/d9dllD1+41WuNyeUKA71kE0Xz5b1wzOs2xU7KiFe1giTVUpIc99PlgN7Q0cu2NW9EsCyj3P1GgLuzrWorq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38540-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76DB768C60E

This patchset
 * fixes more airoha pinctrl issues
 * split combined driver on common code and several SoC specific drivers
 * improves an7583 pinctrl support
 * adds support of en7523 SoC

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

Mikhail Kshevetskiy (13):
  pinctrl: airoha: an7581: fix misprint in bitfield name
  pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
  pinctrl: airoha: an7583: there is no 2nd I2C bus via 1st I2C bus pins
    pinfunction
  pinctrl: airoha: an7581: fix muxing of pcie_reset pins
  pinctrl: airoha: an7583: fix muxing of non-gpio default pins
  pinctrl: airoha: move common definitions to the separate header
  pinctrl: airoha: split driver on shared code and SoC specific drivers
  pinctrl: airoha: an7581: remove en7581 prefix from variable names
  pinctrl: airoha: an7583: remove an7583 prefix from variable names and
    definitions
  pinctrl: airoha: an7583: add support for npu_uart pinmux
  pinctrl: airoha: an7583: add support for pon_alt pinmux
  pinctrl: airoha: add support of en7523 SoC
  pinctrl: airoha: try to find chip scu node by phandle first

 drivers/pinctrl/airoha/Kconfig          |   24 +-
 drivers/pinctrl/airoha/Makefile         |    6 +
 drivers/pinctrl/airoha/airoha-common.h  |  204 ++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2401 +----------------------
 drivers/pinctrl/airoha/pinctrl-an7581.c | 1473 ++++++++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c | 1477 ++++++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c | 1123 +++++++++++
 7 files changed, 4314 insertions(+), 2394 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

-- 
2.53.0


