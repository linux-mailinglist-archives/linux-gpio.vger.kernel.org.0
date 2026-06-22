Return-Path: <linux-gpio+bounces-38794-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1q0RDqkdOWpQnAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38794-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:34:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEFF6AF1D9
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 13:34:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=KeWa3PY6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38794-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38794-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 905E430584AC
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1B929D27A;
	Mon, 22 Jun 2026 11:31:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023084.outbound.protection.outlook.com [40.107.159.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6AF28030E;
	Mon, 22 Jun 2026 11:31:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127864; cv=fail; b=Pdv552LrE0XiS9fnF91KNA9NoNUAj71KIM0/ttc+hPinfuq02+212xGgyDPndB/khlgW2ii/it27ElrglxGoRDCGNlT1ZogNLflzNvkHMgraGtn3kaa1IHNDorMgGHNzewR9PFulDXt8kyVaBHKiGRs0fgAbNU81Du+D1Y/Kric=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127864; c=relaxed/simple;
	bh=5Nlwu5Qy9j4jVSPYL7aV+3OUgJDHo1h0nuQo0bbS5l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NXMW89WNly6SLTkpmux+eBuKhmx0rfnaw6euLpToDWkPLeGgYlP9FZ+v+4fCozzXSV2kGj/67rnlnX8YFQ5VWRDTGXlreIgaKbB4xKxelhGmE1/dWy+b+zEtk9MvwlRWItLT42Td0id8jm7Uc0NMfEDcSSKGpZPgm8xXx4OqmgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=KeWa3PY6; arc=fail smtp.client-ip=40.107.159.84
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKPgdEpNarPzoEJ6VUCNj+HqYnDpdYdDQsYRskuAO4k8VkFHKNNt/xDo+zVosXSdWp8IvCgPmjFCvMoLDengsuCydXrlJz99rkabEfJDJRS4IhF1fqQWF/DWuM29y5dm5s6BL7ylUKATJbxcg5hedwFoGQwp8mlcCA5g9ZtBetLCF4mb+nZQz/IVHLaR5OyJpjErekpDf71S0VIIpB2ZTOSr7NbElRs6jxhX/tZxDCqMbqwc98omde+dULIceCMDh6Wfp0foLtIdoqLcyfUUkZSriX3mglrLDSlwPwsDaHstRWP1GXIdybyVHr5wjKO4l7GjFYF4uh7Ck0ek+6m2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=Me5jAxepBIYn84tgvDgAJk2ROzT5Ey0y6Tm1GEGp2WpSzvpoVM4G8+ryt4f+UuF1cnGOU9X5ICY1C1MKwM1TkdeTrU7sSsukgMaHWSe9+P7g6xRN6FxqE8C9Yc7KwzawwVDBf81m4yxDW0sfuQppA0vVX/lqJiAFuHztS4wS8iqvnexeoAZfb3VYIYtLAaareWS9bcSDLiqvGYU8gZbULYHkPqXz1MEQa613oN9Z4gflwL8NmiLxtmxszC9uKD+u10GI0GfmLKK4gTl7qYSoSkcDROJsEH3AIIiu19Y0Z9x5AsQ6sxBApx4/IbLP0HiWP8b9DdA0o5VAZkPsbIRkzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=KeWa3PY6g3HXGOWYvgwhdbmWxlnAmdumlC+mTOlU3Q1RW9bYIDMTRSB8nMsShIrJ4K/lYFzioTes/G52mL7eY44o/8qJtw7p55oMCjhitzCay5v2GnvCFX1u6joiu8pVqLrVZ6DmV1pEpps8u7UwApA/2V/CYsUoPrXmaaBbD1IvO0gEDwm3lfo/bpyt5ogC1YXdtObgh2e8lfx/3OeHLQm335QDxLkdhM7jTS6uSAe9dTXgJlxwEndWSP1IEzy+wcd+16tRLceWLfzQZEkr2Kef5b4TYq2dmINAbRvKb01Sdw+wX1zVZPJCffWMRaeI8TnuKGrDwEeY85XKVuDRxg==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6115.eurprd08.prod.outlook.com (2603:10a6:20b:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:30:57 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 11:30:57 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v5 02/16] pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
Date: Mon, 22 Jun 2026 14:30:32 +0300
Message-ID: <20260622113046.3619139-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::7) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: c19c7be1-3e77-46cc-5233-08ded051ba73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ccH2518NRdiuinKb+cJZQwrmIacW0oqHjwSIGlfA+kHAN1cyRKlEiHChr6EmxiRhEK4k+h4vpjcgKQc+X1hrrBuU3YdUpZCjU/AJrf2RmSsBpBw2AqL64+UTEsf8ZNB724ig7E0p77J8iK/rwsnkE/D6JdCRNVZ28oGPP32sIHSD9sqxgIb1G7f6QRUZ94kJiD6naZfzc1y0F+cwZ3grLM8ZuaI3BkF6aXZsZH6+6rzPdLu8mCDiVMxTQv4j5LAmZT8LOIcKjkvTqXILIehgPG9yhgiTmc0bD6ffLNC+f8zYv/P0id4STY3In/0K4GnEyChS3Ek7BR9n80zpRP+gLYI62+LIkNllrdGpnthA2k6SY378X4LYlLUbq9OIfpKW5ihnhDZ5usukeikU+ci1cilTpmkzJY+x487CYBWMo+Uv+K5eo7KlvtQ8xjVGd24rDb5Q/yaumxaxwZYAA8Uy9z9/HLVZyk11SRR4Y9moOCmdmqDqTdhGjqwcbA2gmMuveY58LHbUAP2NuHR4eBuaVvS5v4bsKEgoxSnf9CWHaVpvRoDoXo4uKzd85iXm2M0GBaoiL2vdcInX8fb/XSnhsq+JsPxxAjOF8vyQNNFhoNiT3qFwOeDSAf0h2Dpy9hV5aVOVNHHqOS9VsqyIRBwaRKcEj4IYfzP8xYDTyjnVwNAkT+R9VcO1VeFlPV0rSenXv10CgG9wgvz/rvzPxo5kFxSU9+Bfnf1sF5cnIwemMsBUWyY51C5+yQePPP7RPDke
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G6XOJNhH/r5W2XoNuAVD+sUkT0+IduWTUtU77bwhL3vVcJC41vyuisdxI4+f?=
 =?us-ascii?Q?g8xJaDAKBx4I46Poh5koE7yU8bbZM9eNUHnBCP1usUo3C64hcN7E3ptBRsE6?=
 =?us-ascii?Q?XM5CPYKN4X+5UchK4BH396xEgSd9OOacBNUsdgtKvvlszTJfdOqqgVWQOD1D?=
 =?us-ascii?Q?rjd0/XP0SCTGdZyeSHFaDtABD+c+yuiRenln/H/ykIrhPlqoFT/urgO7DK6Z?=
 =?us-ascii?Q?W2ef0IOmAcRbP3PKkJ1L58xsQ/55krbPj63Q471stIchVoGlT3C7P2fr+DL8?=
 =?us-ascii?Q?rWd/Ezrq8gY8Rzc+BgDV0CnYY900IHZxfBsEaZvsa40W47S5GbIl4EpHAGVu?=
 =?us-ascii?Q?Wd28qfgYs/JGEb5QPTvIGHs7OIzGe6ByGmAG2/YXGXxTMQBpM0T4+fLoMRRV?=
 =?us-ascii?Q?Mm+4jWskaLc6l0J8NWLpjphV/YReyVZyoTuhMrS8fvWjHJOWvQFQ5irwei7S?=
 =?us-ascii?Q?UrkZ3qYwAPz6Y4aZijN5EpjdyTB41xAkEozN1jUDBOBu3/flQHIM1/eExPiy?=
 =?us-ascii?Q?TQdIpsXQwTNiQJAKTYRnotWaMxal0kICLixb/fttWWny++ds1QAzqQxC21i6?=
 =?us-ascii?Q?RzR+YiRxYFuLYgFDZRS+WXvqcOaq1ZA13/HFX1bDK0eMk03SYer+LhLKkZ6x?=
 =?us-ascii?Q?Zu76J3eJfPKkAmfmPRv8wuMDwKP0t2L8jLp47JsfI8gMSHMoR9lLkjcfdyKw?=
 =?us-ascii?Q?34nWDh7I53HeSsJ4/0iL86MazgMl9Hgp1/Y/yY+kg4aAnJehTDd5cwsjIBI5?=
 =?us-ascii?Q?lGLutNNywDFyVGHg5GouY8DF4LNorbF9pHClw2cZtSxbqAC4yDYezwuWDyuX?=
 =?us-ascii?Q?kTtUAdQexhscmkUXv5zybmYkS11qiTaaKx6QCYJmwcrgGLd9dnHOb+3rj7LM?=
 =?us-ascii?Q?MsSw4xF+ZQ29nEzaBBBsdZRjMR/RPTG1xASGt39mkxU54L+ikPnZM5Zr559u?=
 =?us-ascii?Q?Hc0kBuXHm9U2s/ovc2Etgr2BMd/+uzGdLXE2rW5w7Tj9IuAji2GOtV0usO0C?=
 =?us-ascii?Q?JUX7/UAIYvNmsawZ75XZJaf4poe/uH3jz7P1YfM1HE/Qttp4h7X63BiBROw5?=
 =?us-ascii?Q?PuBDdjOOkeikPc75FDWXq8V2CyMcnkkj3JlLK0lUSR/l/MX/vRYavV3xduTO?=
 =?us-ascii?Q?nlPpBHbAdqmvDJWxLVW2UeLp+38j0Kb6BT/IWTCMv4AO+rMAPOs47jqDPPAp?=
 =?us-ascii?Q?q8EC8sTSNdACx9PbiKbMCyffVq/4kH7/eepX+pTa/yL4TwWGWnWlKGhyzBO5?=
 =?us-ascii?Q?yrmDgDoGndkBO+Z89tKnsK84GTrf4bjfXVlm9faAHkSzvHMZ5dVZHlXUNEQB?=
 =?us-ascii?Q?42Iu7KuERJZTBvXwoG5Gsson/w1HgMDeDu+cA4TJFmYZjs/KqLy0sti7NmSC?=
 =?us-ascii?Q?yNwLVriV226C4uEWWZVnTXGyKs96CGbLJmBfvl3v2utk8YgF8gxy+63wPCWw?=
 =?us-ascii?Q?OYv5Fr3+SE5RCs+JBfNynGIMX/ealIka+7l+CwAX7V1x2bJIZOgby7Poz6oG?=
 =?us-ascii?Q?q3M0S9yHYoswpRwJyKi9iSosxo8AIhxH0cHmho3yVBLQrYAgVB20sFhBP6j+?=
 =?us-ascii?Q?NeQYrjxP5ayI7BfY09LEdFQnKTX8U0lcBXBHBFGy+mbjhP7ip38Neaz3lxvO?=
 =?us-ascii?Q?J+jCE7Tqn1NClWB59TeoFrnojKcNdK+raSnX/nBsQLpBMVTH0+MkXw0v6ckT?=
 =?us-ascii?Q?B6/1uvrirgRv+oaEpzLhhkHmY40vMFfZJ6czN9AwZgeDSTszl1C3ZHjvYJV5?=
 =?us-ascii?Q?g0Wif6jaqIq0y46W9PlStD45uO/be6g=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c19c7be1-3e77-46cc-5233-08ded051ba73
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:30:57.3724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKq6sMIkobz2QIuaZZuaD0ykcgOQk7LxLBY+XXWw07eoZTm5L7mOOUP/EVrEYkI0YVu05YoXLvKQsC/cDJDEo2rM31mICex2IDhJbILzGj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6115
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
	TAGGED_FROM(0.00)[bounces-38794-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:mikhail.kshevetskiy@iopsys.eu,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[iopsys.eu:dkim,iopsys.eu:email,iopsys.eu:mid,iopsys.eu:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DEFF6AF1D9

I2C1_SCL_PD and RG_I2C1_SDA_PD bits are swapped, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 63c82268aa82..4076bd0261d1 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -184,8 +184,8 @@
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
-#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
-- 
2.53.0


