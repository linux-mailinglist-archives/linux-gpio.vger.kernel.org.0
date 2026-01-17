Return-Path: <linux-gpio+bounces-30681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 578DED38BCC
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 04:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1025302FA3F
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 03:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2902DAFCB;
	Sat, 17 Jan 2026 03:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="l5ZHVXMm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011012.outbound.protection.outlook.com [52.103.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9729A326;
	Sat, 17 Jan 2026 03:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768619113; cv=fail; b=fTK7OfvNwpwiiyActL/9YajN2u+/A0f5DxWwSlKV5yoyxgeKaYAbKfONGkmznKKPWVTHGRDDKX7wkjuFEf9HVx0Qcz3VG76aajf43ZyVraEL2cf0kHXHodNsnfNfFC4chSQoBZep+XhwIwmw9z1V4UAOOpo9jDWSBffUpV3nPGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768619113; c=relaxed/simple;
	bh=WsdQOiDGe8KfFryKhToxgnefbyaTC+kkax4XgZv4SF4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=A5NSiYOAmSvugPM328lRFFYEVdFko1qGdJISQ4I5oAnYfLBabiCABycgpizS5QgSsFnbcH5qSg2igoM+kSd4jp+F+SuxPBbBCvucM1dLBXBNLTsdkAJqeeQlJ37j9p3JqoOQDISxcG9ZCEtR/TsVLRJDI0W2Z0/jHcELE+Eiw+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=l5ZHVXMm; arc=fail smtp.client-ip=52.103.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvVjE8HRlu4As4OUnKqNebbz7yiTcDvIgIvHrxmXn1EEGsuw9drT4DHcttScqo97jvvcUhQ6GJsfDW2tnUhEyug1YUCmB/EQ44XT36ghEf7yznkBMf6wrZamAw9gOlLRi965W5pR/1kHN/SICjUe81w1ehIlhYgI79s0NWinTgdzkeI99Oc/LZpHbvzNk2klxVGgXtDuOZCUzrHNZ9QEaYpZnePyh5uRxr281m84manBxVSeOID/Ja0EszwvAupZbZUMOPpdx1XYX6zqdDTlZD9Ns+jf3Wq0hJ8hr/i9PtwdCCrWQiixVc+97wuHCGCHMfOSph8j3bn6gUFAFk4vTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGMpGMqaNGWxqcwdjn1ROPnyxiXTVg4xGt3yGKLuYME=;
 b=qA6mHS23+vs3quA65laOd+46xBfF285yMrKTv64JLtrIyviWyso7p2qHQdKEW+6q7YPuVWLkb01MohklknbZILn/t7n/f05HVWgTIu6Lm0SRwkLS8+EiKqOPlPCiyElfuGHZVr/06xCoxnzo0FDWOSTkdKuu4rAjN6F2RR1b16yIAob54X0LYvKwUHub81sXQZ6gM3JBlwGRBCzIheJjIwhMlYlFTJwu1IdAfdVIznalCADXREMk9MQ6m9htf1wFcBxMCVr8nPHGiOd822Rat3SWvuxVsC7f250GtIQ0zQqGj0JVLyQj1eO3QdHcqlo2/QEj+e2FOIk2TL+eN/Q+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGMpGMqaNGWxqcwdjn1ROPnyxiXTVg4xGt3yGKLuYME=;
 b=l5ZHVXMmdMbuX04mTIfmvnyaufeJOz2IPBTKc6vZF2NLBHQUow0Gh2LXP/pamJ4fy8OPHaWSLGKXi/TE2NvOP8gKy1WFerqs6m81OvSdNrsVFgDOkDbmKJS6fcjLQaZU93MruIXOx+Ny6MzfY+fRTSlmwdZOiHYK8NeDypRREhk4ODILAxrIsDz3Q/PIXtzJR7xyR3MpC2V2mzvGZcLcEhohy9FIxyR+PeQAaZPD3b+ZtyZUCA5lUXV9lQ6qKIgLqHDGaPM6gY1ptkmfH2zwViRVXyQaXnM/HmgZRccn8QNXWjqDWa+KA22PJorP/oNfIg5B15T4A6kBWssFkahULw==
Received: from OS7PR01MB13834.jpnprd01.prod.outlook.com
 (2603:1096:604:36a::14) by TY7PR01MB13652.jpnprd01.prod.outlook.com
 (2603:1096:405:1eb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Sat, 17 Jan
 2026 03:05:07 +0000
Received: from OS7PR01MB13834.jpnprd01.prod.outlook.com
 ([fe80::6e58:e4b5:3405:28d6]) by OS7PR01MB13834.jpnprd01.prod.outlook.com
 ([fe80::6e58:e4b5:3405:28d6%4]) with mapi id 15.20.9520.006; Sat, 17 Jan 2026
 03:05:07 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH] pinctrl: mediatek: enable ies_present flag for MT798x
Date: Sat, 17 Jan 2026 11:04:37 +0800
Message-ID:
 <OS7PR01MB13834D5838A90C138C62CD817BC8AA@OS7PR01MB13834.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To OS7PR01MB13834.jpnprd01.prod.outlook.com (2603:1096:604:36a::14)
X-Microsoft-Original-Message-ID:
 <20260117030437.11947-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB13834:EE_|TY7PR01MB13652:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a8533f-4fde-413b-2eb0-08de557537de
X-MS-Exchange-SLBlob-MailProps:
	rYPt1fhvLTWbGL9eyGW7/UVWGVQcj2SHtQO8DbLb9vVjKF95PDehsUQhm0Y7q0LjB4hHKfjS0I3JQfnmlmyJjjL9zz4SPt3H7c2dRR2Nf5lKBY4510ET8FagdpBaocbCYiISs9ROn4Nh66DXldWO7Qw5ELTXgx4nEGlYCZUBwHXArB23MAVE6Mti5cUHpgoImrM0SNMZXb2xire+wwuEDo1dDfd+WLeNlWL7m83ufJWPsI+jbKVVqYPeklSqRwexdKAA/p0PqCFDgDzrUS5/AS+iaJI2Pm8zhdxCDqvuBy+EDZ2cS8vQna1wp7K6eU04Jzh4Cx8RNVbyTgsLUpkxvQBIPxH6jXCOwkcS5JOhMpfvJxf2PiXXOjSL7vBKcfvg1p60Fbn/xmW1OfUvAh23u78Al6gq4M0N3MjXK0rT3SZEz1DRH82GTSCNsJwcnCW1DyhKpV6KGqozC7bBmHyIxhbRunNzjR6/KH+G4l+cTjlklKkF/rVydkJVdl5GvbL4SxLtMjWDicl2oLBDy7g1074U+g9iflV3gvunZcWhvigdD2Llu3lUj8kGJatY88X4zpVGBcLomxsobSBpm2RPBv3P2I7YJOwjUImxHk22KmXNCzYr0qJssMh2GtemWn40OxKqFwCQ5RvYcbn7n7ytKF22WpuDX51X8gAaW21R2P59xHZCYFNlOJsodXLbDcKueqNv15QTkJePDUIQma0j1w==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|8060799015|19110799012|5062599005|15080799012|5072599009|461199028|3412199025|440099028|53005399003|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JOcTOoDgDXguyW92oAoVn5r13fOPOKb/hDSsByrXGZsUtDhQ6UzrCWPNx9Pu?=
 =?us-ascii?Q?/d/p8u8tsb4ggmraJLAF3259U5L1FhlTOT5632GAw2Kr+wot/glNgz0CbXp9?=
 =?us-ascii?Q?SrB5KOkzbXJ6aSL+6S/B+JGHKMLyJIPDenV4o9kj0+KguzhBQohhD/uZN7Zn?=
 =?us-ascii?Q?drteUtpIEgDpYewzqd54eSEe6to1hh9XEnsL53WdafQ3pXoj89CDjUPVpP7+?=
 =?us-ascii?Q?dLeDUnh0J1VagmXj+/5+TL7ZuLOt+fQxVUwieCOZ+fF2ZuikYCnHuqqZdMsO?=
 =?us-ascii?Q?aeEBMEiXSJVogGzWAINYkLUhw82uKBsGKUGFHS02SPHdYV7N+iFDyxOl5IWT?=
 =?us-ascii?Q?nch9A3N8uu1JEOeeuI9eCJXT0NycF5jEugDSnWGliI5/4aF6ArxCe4zjmlnl?=
 =?us-ascii?Q?+BqVJReIdP3ccY1GMyBoDCFke2JdmtPFpTvjeDtL91injBH1QGbTJmXzhF0I?=
 =?us-ascii?Q?6aVtVQ0k4sRWtM17wgl+FAncyKvFnxNRSD8I0chRc3HxXdlh2DqfVHe+QWH2?=
 =?us-ascii?Q?ck3QU5DdU4oc6KDr1jvyodrnEdfZ1gDe+Tp2tdiZoXu6O6zIPzTOs4n6A89T?=
 =?us-ascii?Q?WMpy6ilgiwNxvm9wYkGKZ5Xwnq9c8IGWiR5dTqDbDqC28JMHEJhcAza2qmiK?=
 =?us-ascii?Q?rBs2xEDJCrD6MMSYd158rvHVatkFolzJOzRVjZGZ5SIMGBd+JgyYhIhNlLMk?=
 =?us-ascii?Q?F4peTxvfSGv8f2RCR0V0UmHw+awby7qet9tteZ8XxfPBIX0ooE0IGlHx5ACc?=
 =?us-ascii?Q?oBf4N+1wpfmf78DI+pqEVcge+G8385kMEygX0idlebsy7UwhvIEBbdNPauvz?=
 =?us-ascii?Q?HILnBdythUF3QugGSuMVUoLpxElF3rSq8wHkJRbHbgx9p/NRMA69tQDKdccZ?=
 =?us-ascii?Q?bizl7icUBDkwXHfAEvS8E45znnUCydCmekEdGYhxrkuYdhxtENdUz2EoVjHQ?=
 =?us-ascii?Q?Rhn5WJ4A5L8R0P6HiWM4nlw9zmzAVF//ssTHxIEcu0YAzA89OGz5y2zvJxrH?=
 =?us-ascii?Q?LqcSNFuTJmBKlOibymKlb16tqoYNBNwstYZxdn8o8cTRzIPGoyQq2DC4xLep?=
 =?us-ascii?Q?wEisH9fHvVm0C5aFWbuDM4HIANfeD2AlGADBQN4s6rTFtOaPkUDiY8A8JZUm?=
 =?us-ascii?Q?rqbL4wWSOvywF5gSVFNHAa2otlrqaqLPc6B/QusOZuClLuHxMLhYJJ7zmvw0?=
 =?us-ascii?Q?midUXH0Mq0fObqmTiXp3giXvbkWO+nc18p86reXlEgJXSyI3gzNw2sxxptI?=
 =?us-ascii?Q?=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0jtY5QkXTlzuWXxCoiclY+ZAm/pKA63j6YnsHCEH7MTQ0AgwOZnzPPTabjEO?=
 =?us-ascii?Q?vNyVL9Y0OCUgrEDJjy16KyPlkEj0FsK3DQxQx8M8P2iZ7cq7XN75LMyi2dIE?=
 =?us-ascii?Q?d9zJgrslb0Xiv1QQTqOriXvXFGRL3SR8FF94CkgKvpukKATz/v11BVacW6d1?=
 =?us-ascii?Q?4oPsnD0LJKS+vaox4Ldqi+8xtfrDBL9vQeM1GQfsPOtWwFnHQ62/kQIXI6eh?=
 =?us-ascii?Q?AQAYxut3dqb+OIkOW4bShtbhfKkWnMmQYuAVH/EGA6881ro2AHCIkpGLccHc?=
 =?us-ascii?Q?hwu2JosrwFI2FUJ5tdzdIECT6NjatAdtTmDnPxyjavYavxWFmFTVQHrk2bfG?=
 =?us-ascii?Q?1YkaJac3+I09yxJf8TkeyESMaINITb5C0mCip/noNDNR6Lt03l9ptPwNY6GE?=
 =?us-ascii?Q?EAFwskl7TQupgGA93RTyq/yCoz9SdlYPUTvlYlFwLlURYaWbf0Mtm+IAIctm?=
 =?us-ascii?Q?i+Lo4upjvnGXu9TAd/6xudS3KdnMeUoFIZBTBSAS7uA+GShfZdiJ5tDbOlfz?=
 =?us-ascii?Q?uL6CX+wHrPHnsz8yJpR//LFfGnrTB6mtEDZ2fMtOmulfglD41ZJsB0XF49gj?=
 =?us-ascii?Q?zTPjDo+Pj2zJN6v+we0SHY/Jtkpnr/+lganLOoPCfZ9aoMbvjJcChc/i8R/R?=
 =?us-ascii?Q?IZBWNBnEEx8yl4F70+LxdWRvcyJv2uDGdb3NSt0aBSDVRQAp6BJzvYMmCQNp?=
 =?us-ascii?Q?lQBCnaahrcB9cIWTwsOVWzXHJ3Fxpf6ng2LwwsCD2txCpIXKkIWo0H2fbxAy?=
 =?us-ascii?Q?51vFzTczwbi4I3DNnyrAu4i1dJdTCduzOtf88hOW1ZdZA5fYbKfQW1DPRZJU?=
 =?us-ascii?Q?MppMasedtybZjsr+am+zjNsSKxOet/DwkKU8/wZCS+B2ykyb1g4nj+EyEnJp?=
 =?us-ascii?Q?kbcvYEsHMDITtUilOyPXj4K5NZH5rqno7NYvR0JqRbaHiakitSm7mXDKR+jC?=
 =?us-ascii?Q?IbJVapXRU584pqu5ngnyC4tV7OMmGHLqFgYrJFIxGENE3iC14HMYy++P5P2g?=
 =?us-ascii?Q?KmHh/P1bz60se8Et/TKMpJKBvMZLw1HLlqykQGhuXh33PA3S43w8lvozPdmD?=
 =?us-ascii?Q?O2uVcs2iEA2GDYIr34kvJiVcNOfAJmORlS1W6kKgTQ2iYZPf2pbZ4xEKAKYm?=
 =?us-ascii?Q?u3O64D11slKY+k1BbiNgseZ7HW/1ULKIHQDdIuzY9y9+Acw/T2gToZtnOeRj?=
 =?us-ascii?Q?iecXz36d2waliNVGXTcLUO3tXpZrb/wdFhnp3aD2on+mGb/1yvig2ITzhcW+?=
 =?us-ascii?Q?s/Y3K0ZE5CPAQxVhk5wvEh+2JLGq+2VauxEuthqeFDYD0vMNFopntpopf5eD?=
 =?us-ascii?Q?cv4o0zBIoXS6L2LNY2kf6YpGwGVYUSJ9n8wDS0wX2/+pQEkcpIZi/cKZopTt?=
 =?us-ascii?Q?m5uUXjwl5n0syiO0HFalI6RjP4it?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a8533f-4fde-413b-2eb0-08de557537de
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13834.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 03:05:07.5145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13652

The MT798x series SoCs have IES regiter definitions. I think we
must enable the ies_present flag to correctly configure the pin
input mode.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt7981.c | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c | 4 ++--
 drivers/pinctrl/mediatek/pinctrl-mt7988.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index 6216c2e05..22c8f2480 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -1019,7 +1019,7 @@ static struct mtk_pin_soc mt7981_data = {
 	.nfuncs = ARRAY_SIZE(mt7981_functions),
 	.eint_hw = &mt7981_eint_hw,
 	.gpio_m = 0,
-	.ies_present = false,
+	.ies_present = true,
 	.base_names = mt7981_pinctrl_register_base_names,
 	.nbase_names = ARRAY_SIZE(mt7981_pinctrl_register_base_names),
 	.bias_disable_set = mtk_pinconf_bias_disable_set,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index 2a762ade9..5dda4b746 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -919,7 +919,7 @@ static struct mtk_pin_soc mt7986a_data = {
 	.nfuncs = ARRAY_SIZE(mt7986_functions),
 	.eint_hw = &mt7986a_eint_hw,
 	.gpio_m = 0,
-	.ies_present = false,
+	.ies_present = true,
 	.base_names = mt7986_pinctrl_register_base_names,
 	.nbase_names = ARRAY_SIZE(mt7986_pinctrl_register_base_names),
 	.bias_disable_set = mtk_pinconf_bias_disable_set,
@@ -945,7 +945,7 @@ static struct mtk_pin_soc mt7986b_data = {
 	.nfuncs = ARRAY_SIZE(mt7986_functions),
 	.eint_hw = &mt7986b_eint_hw,
 	.gpio_m = 0,
-	.ies_present = false,
+	.ies_present = true,
 	.base_names = mt7986_pinctrl_register_base_names,
 	.nbase_names = ARRAY_SIZE(mt7986_pinctrl_register_base_names),
 	.bias_disable_set = mtk_pinconf_bias_disable_set,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 9569e8c0c..fd3a7ff0a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1505,7 +1505,7 @@ static const struct mtk_pin_soc mt7988_data = {
 	.nfuncs = ARRAY_SIZE(mt7988_functions),
 	.eint_hw = &mt7988_eint_hw,
 	.gpio_m = 0,
-	.ies_present = false,
+	.ies_present = true,
 	.base_names = mt7988_pinctrl_register_base_names,
 	.nbase_names = ARRAY_SIZE(mt7988_pinctrl_register_base_names),
 	.bias_disable_set = mtk_pinconf_bias_disable_set,
-- 
2.51.0


