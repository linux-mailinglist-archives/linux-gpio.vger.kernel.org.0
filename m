Return-Path: <linux-gpio+bounces-38527-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T4MpB/TOMGo3XgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38527-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:20:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4AE68BD67
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:20:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=Ki6VpjQd;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38527-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38527-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28DD530680F1
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425453C81B2;
	Tue, 16 Jun 2026 04:19:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021138.outbound.protection.outlook.com [52.101.65.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D635839C;
	Tue, 16 Jun 2026 04:19:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583597; cv=fail; b=tbZuMgxbjst3tT0dGGp8OGvUKtK4Kx4cm2Gj3dqvIPM8Wqy/cv67MCef7F0Qpb6TUUCAdawh8wBdZ6nIuC7wANiRBS/ujYHE6Ig7K7WGugJ4806xLEXi7aZ2BBumkyNRJ+Gf83CrMYH7fwr9OXV1T1bRuZ/kxYEiKbo590RI8RM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583597; c=relaxed/simple;
	bh=GVqGVDzIcxbv/lMiYYqzs/TwsG/ykRdzYW7OPgbuv00=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NnPBb12EibslJxYE67VaBhLtIbVcYiV2AzZhoJ97SJAN/BlteABHprTPajy0H2p1T4+xgEPhHGotPs9Td7Rkn8GguZEta+B/ukYddomKLwko2q+JpGTcjmh1Wgz/0ZK/XHqiAsx4WThfG8Lp5z5lXX35PtGSeDAlfrokRo1Dfz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Ki6VpjQd; arc=fail smtp.client-ip=52.101.65.138
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldpr3tXnnfu3mI3ueiJfJmzpP18wD71WdErqNihLFjq8SmVkeUabpI8ZuXFhSJ9Id4ogXGdGuHWY6wSKnvdnvtk1fmzjE/ct+kQE+7LjdWF/goFcBcpeWGefWimo4tvlCbI+IdJaCT6VcBPfn9CIyKm5hAqeYhDmazXbdws0vO7KGuiW5+cKSaTvjwb16ribOZCC3t2Md34xTJtjpxZr8jLDeWMYu6h4FoPqLQ5lwQR6dO46TqT+mLF7Lgb41eybtuJpTEqedUGddhSTf2lprrky+3gn52dQ8uwKhtKiqf+U9+cvw4ZXvtNWvt69OOKGjVa9msanJisxp7ZXXe8v4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfmkKsARxRLC6Ybdl10vTSYTdl5yzDWajPs6aTeziMc=;
 b=qOlxITU/AyWC/FNBB8XBnQ67jzrB8dVzOFvo6WQ61/WHEye2y3FUfFULnlrq2V2N9Wt0UBxbEYT5mCU+BL7qM0UEfoP3Yk9soWWIf7EnOAm66BAUopXytQGxLPT7zhg/mwSjki8Dk7kiNvU2MQn5aNdi9wtd29nu3HNlkrG5uruiUr2KTvLYYGylUWYQrOz4bOSXUlq2v5QYFDgD5UXWa42Vk4IjB+tD5+KyGs4J2slulNykyTBOBwHJFFbDsDu+YtWbfDGo1jtKS65JG959sU+kenDNWkD/M7J0/C1iJ32rPmSbfzsKUOS9AZFJzdZw82rN/fWZFwZdXj/Yid/TBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfmkKsARxRLC6Ybdl10vTSYTdl5yzDWajPs6aTeziMc=;
 b=Ki6VpjQdU0wDMA6CGw0GYvxeeo0ljgQHCwNnBh3oXzZn5QM/+r4fVVoSfykgzbJK57mEVOw7v4v7t2Jm2rq1iJ7nIWwJ8rvhe3Na1l3KDE83jm6mH2N+VcNOoVyJAXi16c+70DNKaw5BFJLzTid0ggIbKCIsTZ2J/OHNfkhzS0sIhSoDJt14rl/hX7CtpL2UmJlsHPw1RWdUq5kiYwc0zpmeM6QmPyk7Czw3JQKhQfIfj+qedM6BnZvZKzhqVrtDozU/FUZ7nlUMRHlYEnDdMHKkjXofNNitLRi00Brs799g926px7AFuoKD+smFFK2f8UeVY7IH2V9cdN8AJilP+A==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 04:19:52 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 04:19:52 +0000
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
Subject: [PATCH v2 00/12] pinctrl: airoha: split driver on shared code and SoC specific drivers, add supporf of en7523
Date: Tue, 16 Jun 2026 07:19:27 +0300
Message-ID: <20260616041939.2587012-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
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
X-MS-Office365-Filtering-Correlation-Id: 5cfd4e49-f843-4972-a57a-08decb5e833f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|38350700014|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	gvQIp/As3nlYaUOH+G76Y1uBtyuDtT3tL8zAfrnkZKSoZ2bCfHiVpW8IlnpNoJWc9AGZHT0UT5OfyvgLT66MNmdxs7/xN6BgIGjHdyQZ/an57wLVXSd5KgTB4/aTrA4RK82l1IKsirWKOEZ6tkNWpxPfFd4u+4LofM01prXrq+ryGfx0U7L5SPubcf946YuMZiGP5wTjXfpLHfUl+RgydWta3i46LXx8aNJjNSO0BB4CnLTsMHn4MrXcHA/Dt9kH1HiZiGISHgLBJyrYbrWmz7gMabHVqKuLtqhTx2JwUc5gMEtlpIRkuRMzv33OCR4JRcqy/qFlwYtm+9DWxGcyn/2QNKs2VRLgxsKF0F5sJlbVADvY5fNz5CM0PtrXD/5hBz1pkc9xD6GHPtrd0eu3wo8KL85dmhkr8YExwTCwoc/VV9pn/P7kvOn29Ok/1qCk5DojaNURogjO2pkLW5V6m54xwmMmciA1oxT8IxsXGZLj/ML/V8ENhySbOBSTbUq1BaQnMAsks+4G0u/GoanFlcR2yrMwpNkzFDWCFo2iD40n0pNDGyn4cGjcHTi7qj+iEk9YdVY7EeRi0k8asGcgpJ10cC8MgLSRcLvnfPQpWkXscUvLc/Y/2ncsRBUgicpqswBBwoNcMxi7ILqYe/fbcPBI2jzVumnTjwm4hubvyuSdx9fRIHxn2TuBx2E9qP+USG4UxuyF7OVK1xb/TBOaSO8a5Gs6c1YUtX4mth+o7RqmG5+v3IVdYtY+M9NCb4TFXeEhu4FB/CCeT917EzLFLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(38350700014)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p2Ihv1AxiMY/r3CY8AYPU5MpzQbIoQEZNpQmxSps9ZrRVmdKOT6l3blNKxCl?=
 =?us-ascii?Q?Jr5zwz3s6xpRtW2OApDXOXo2LpAlIb3l3J+WKgK6gUqy5zEIWuh3YRFGs+6P?=
 =?us-ascii?Q?diE5uUNpzBLBFxVzSfl86GByLxLVZjdoCUEPS+YiwF5GZxmuxl1YaSQvwGaS?=
 =?us-ascii?Q?nOMmNv8iAZ1MVty8FTwgWxMpWNypM4m0anUqGf1cFwbo2GZv6biwpUkaFdYo?=
 =?us-ascii?Q?yy++oH1AuMXi3/vTRQK25spGNX80NfQJNMeGBuJfHSd+HyzyPwF8sbKrroO1?=
 =?us-ascii?Q?I2vgixKamn0oCX6MyxzrugXtO/EHSBCFjWDIcQQqOjvU1xiNbny3dma3I+YL?=
 =?us-ascii?Q?YuEFBNSbLP2plVjXPuNDjF0ZGcAEnpL6uzUHqzwlwR6azR6kFmsiKUq8EWDj?=
 =?us-ascii?Q?Uff1oTC210vH3p1GsuUDsGMhBL6xr/5QWtXapfUgaGNnTOMXavVvbm4NKiZG?=
 =?us-ascii?Q?Nzg2goL4q62pisY+TTrr91ZU6ae0r0n1OdvZ9PRgWt3PiKNUEWcuy0u/qDaU?=
 =?us-ascii?Q?2vi+pqY3nvq7ULwxuMUZiWJVrVIpsqKpgWcdog0bwb8Zd+tSp9kL9EQZezcQ?=
 =?us-ascii?Q?Ww6srJQ0eERFCZUnY7MkwBMkHIkjBeMKAa3ubZ28bh0aRwyAY5UKrEW07Ogm?=
 =?us-ascii?Q?KJ+DoWM4HDBh4VpIONE3SABTz9IpyNBXMQpwQlSi25CVOJ3ofSR1X19EkzMC?=
 =?us-ascii?Q?4Iy3g7tyJoxfS963ohM8BNQ5pFXMWx0ZrOuyiLQ/MrhXL+eWyB4ehbfCOItR?=
 =?us-ascii?Q?gfaLOUyI7SeYmLt1jiJv2+Ex2lyZIOdBAwgRFJmTZR5rmBgWEGpcL2BjWtYo?=
 =?us-ascii?Q?KXoWdn1qB48phvFF/MK5v5NQyb4EfPENc0j365CDRPqrh5hgzD+Ew8vx1mM2?=
 =?us-ascii?Q?Q2Khn9nJVX/HyI+naiaxJ8mQFROSiM9BwweQHBUGNjQdYZ0W7fVUZzuj+1aC?=
 =?us-ascii?Q?mNOEPzXbLgpr5Q8UwD8Lb08W3piT5Fcr/s+n4HPRZaPem96oiW2N+5Ux9ohW?=
 =?us-ascii?Q?wRfdluGnEjSiD0wotBsWWV7l8Xiq/iQklKEmiHNyH2dyDYAEXA7FX8k4EaAv?=
 =?us-ascii?Q?nbXrvLQaMqcdBaGdNr+gg82HDw+8oKLTfN+fjSGB3L0oTtk2LaGaFt7pQzV/?=
 =?us-ascii?Q?MJ4ez+OkSCW57GSdNQtFlieHPwci/N8Cmxq0/Ti7QJVxAwk4sEnV2ijuODl1?=
 =?us-ascii?Q?YLGVQf57Lbdq6xUz7cBJ2QUq4sqLKPjIoGl/zQIc144WN5SRBb4Z8cAUf+E3?=
 =?us-ascii?Q?UolFqSqM/f4OOR21AK8GTlSdLIQGMhZPW1H+1gSpz2jZ0+B9pfOqlPSkIkVV?=
 =?us-ascii?Q?lRswnMHWFNRFTGVStNPVJSKuj3bRVwdSTe4IeWKPTsxk0XoRP++TWOci4IxW?=
 =?us-ascii?Q?oGn+8JBof2uQBLxR0BXoKkegepGlJHXRQjgfDUJ7YJ8xeGehENvDXNeVCQAF?=
 =?us-ascii?Q?wFs8WEEblhpV3c2QdmyeS55eOfJhsUmKmXzvG8RXPlFHrIC4I5R/gwwcHm9V?=
 =?us-ascii?Q?kzFi2SXJwW6jK701HMjYAE898uijLICH9Gb0Mj8nU6on1nvMbsj01OiObpPz?=
 =?us-ascii?Q?/VvqIcfgUTUv/xoIGR65kdvipbQr1Me6fbRbjgrCjnxHQZ6pIkjOmBK8N24U?=
 =?us-ascii?Q?hAP0UntGMiULk22CUOtn3A77k+YX46K7G0hXTTLkI7R5aBVFb3xZ/12tdzWR?=
 =?us-ascii?Q?pARz5NMEmIRS6dcCliGb5/TQZc2a1I1GMDqz9htBWAb8mpv5NHRn8bm8s5iB?=
 =?us-ascii?Q?z0PQwUj1BsdqGSUrUtf2bGNK7J48Y5w=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfd4e49-f843-4972-a57a-08decb5e833f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 04:19:52.4503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6CgD13ULINlu7HWKnz3dpgH2iYB9ICDNhT0o8Q/s1YmxhuYuAx7ntVKMaYgyL2FoupeJC29/IQk4cqWer4JqFpXdYSfhEpCdqshC8EwwFo=
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
	TAGGED_FROM(0.00)[bounces-38527-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iopsys.eu:dkim,iopsys.eu:mid,iopsys.eu:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F4AE68BD67

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

Mikhail Kshevetskiy (12):
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

 drivers/pinctrl/airoha/Kconfig          |   24 +-
 drivers/pinctrl/airoha/Makefile         |    6 +
 drivers/pinctrl/airoha/airoha-common.h  |  203 ++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2392 +----------------------
 drivers/pinctrl/airoha/pinctrl-an7581.c | 1472 ++++++++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c | 1476 ++++++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c | 1122 +++++++++++
 7 files changed, 4304 insertions(+), 2391 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

-- 
2.53.0


