Return-Path: <linux-gpio+bounces-38045-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QKvHJtS5JGr3+gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38045-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:22:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 275BC64E975
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 02:22:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b=l+NT40yw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38045-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38045-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B46E1307B9CB
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 00:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C602D97A6;
	Sun,  7 Jun 2026 00:17:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21882D29C7;
	Sun,  7 Jun 2026 00:17:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780791449; cv=fail; b=qO0nG3BnoTFTryeYvz0Tphz65g1dlvANaTHKT7QrsgUYM2KuQ4KDNJP8woyCYGEsjjzfVDgdJ0E9R65aA3gWg5gGQ/V35Sh2AGeGlt20uXCPNKPsaHlw9Qa5SmS/VYJiNUOfPaJiOYfbxttn8y7ZuZ0bDt4R/EmZ/wBMmNXH+OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780791449; c=relaxed/simple;
	bh=C9FumFz0fh9QK6kVyrjrfMZqOLfF1jq2yoeTUZklANs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AYBsBDqMB14G0c2/mi3l9E/CQbmJVR/6xSYDAYeloEW5I2N4CsYqV5FYZhF2VvjHuKx9RrEgtSGuGqA82aHNbyPYxsVzk68EN5MP3fKySUQU2tm+cAVNIL7cKDnra5F4IS7hYkzL++DDA6H8g1PCIVslsUUWfUt7NFjFaPuwEKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=l+NT40yw; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyXMfh9XCC+zcVHsi3q1NMalWIwIzEGqaJHcAHly7xrINxDZ+6XSKCrwe2va0pnIwndLiYwSak8x7QII8WOdOWKbHwCgWvcAxp5HAz4LIlL57eyUPBTseEZnI1SEDwLA1qse98fPR/I9FQVw438Myz2dy0XLud7xKLNPrnHhyne+9Umxm4ubOxwqunQPJUaR1NxaYJpDyKzC8JYxd02Nj7cko/XbvFVj8SR5MvAjaDIMAOiUqTI4OdxGu8GoOvr50hVAhSNxU7uyj/ktITcFwqNkkoQ3TqhxKD58w2o/yQbQmh24i4Ls5oG3curtYUz1wm2QElGdDSagVXbuM3gZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=he8fkyZrNd1eDMvm1jlmFwzBN7pMDoGy78Sm4Fe8qgo=;
 b=O81imGvdhajkz8VqCgM7/7kUYIDr/df3sCuRS1P1A76Gax5Ka3TqBupF4YCXracLqoOEGLjJXHS7wbidiuiCtpbuoOJx+D42AW+JpKhg4O68vJB4MtsXZlESdoLJdzhl7eTvYRG1t6pacT6oSXiiFDxgvg2qHLiqUN6nbxf1xn3RnwLR6wkR3JGyxQiyFVL1TjVPbq3cF8XtpJSA0O30042yE8DsKAJPwKOSNvAS0hy5ulUl2bVsWhErHWcmj4VoZh7P/AxcpeWk9reSNxTBNN+Yt2ur1Sgj7jbpKwvJwTJI0czTpYS4XovAl46KpnaeZOyIPdjbNJzd2yng4TEwnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=he8fkyZrNd1eDMvm1jlmFwzBN7pMDoGy78Sm4Fe8qgo=;
 b=l+NT40ywK+QnQ6a3DhZDqcvxE0bMhQlY/LfYMlSzPJyVke5Jz3NhY5h3N2Xvo0RkLNeodYrj04MdTqHTYsW0Szscr1ERAygbnQ8+Dt5OzX0871itobN3PC7FY9d+c+eRIRd7e55PqWORQTWQiINOWskZr5Lek0rbXPnkxLS4pSl1aOBpqWN8i+IeLYJSwEBwTblRsnRbBbbRABoujvcEkITVpyMUPw6X2g+wiqH5siFBudtxxqCkJdSZmgJnwL1Qbw6jMdF9vLByzkI/3upPmfG9kwB2TAbIiWufrbYQFElKthfB7wCcYvDstU1CgBDHKZMwcNXj0F7iqvmrovn3DA==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:20 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:20 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Markus Gothe <markus.gothe@genexis.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 12/18] pinctrl: airoha: move driver to separate directory
Date: Sun,  7 Jun 2026 03:16:48 +0300
Message-ID: <20260607001654.1439480-13-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBFE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::319) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|MRWPR08MB11707:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e3c480-af2a-4dda-d5a1-08dec42a23a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|6133799003|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	gL0ptT9JPeWaNqyfdINccAMcLvplJ3hZi/Bi3evRf/4nwxF5rCWKqVQdWnOR1rFsVjBmRNT300Zw66nDr97nHHL6RV5fNH2Ef574okQg98WRkp9N2tCxPWuT3M7OPwiJLLVFNEPIWhhvwqUsuxytcuhdTrCgU/o6HwGb9dm2xlqWQayRZK5gHq5EPH1LIYjjnGlBu+Vo3071j/Lp1DyFwv6b4w2AgqSkKlDKcOK9QfnM8GyXlK1tAQ8cOs8jgDa/kf8k1qylYbAlbV7/ncOJwhhQeE42u05RQpQ05FrsxcMqIDsAEC7T4QiRFSReTutJUf81/uuqnA/npVOd7IRoO1wOYTvI5uTputTIinOBk/DQD6dywIVP7twMBd53NIf6lYyCFAB5tTToV+2b4O3sExrPv1/oy/SqGPLBIW2g89Bfn/MW5VaaxcX0M0J3ZGNFojIbBTjEEEI+GMHUj1WSRpkmt5dx/Fro0gUxcGxuBmGfjPQUmHTAF86uOSNVT54ZSjIeWQ35lH2NuJc3JFHc0CvoNnsiv4aamDEJC/kJj9lu6C6z69ZQoDfHzyixCMhGzSvdkWfuDVXDKWUN+Swwerg8t8QlsvHEgUgBB/fU6jCy3jb/dU1Ni9dqqQxSJzNA/VvRvr7tKxqKLOiPvEW8vVhm/JSi+ZzFQXzWa0uK7T+jUfyJTSchKZmxvbgozqsq1rHh0OtafcbgyE7omea/BFX3DW/Di8Lsi5cjzKxt4mhFEv04sF1PGV5JSwe1MgKH6blmeP5X8skhzZSiJGqz2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kwKuHPHwHL50jrdp29B6kV/H8j6RbU/KsnaS+NMl9dttPK4/8Xahh5zbucwJ?=
 =?us-ascii?Q?rkxoMwMA+OH1CI9gZQ2auEDQ/0P1yQHhymoHLa2M9DFl4HPdDmd2YnC7PJKp?=
 =?us-ascii?Q?B/FT0U+WtHr4bIJI/E0tmkUgInnxLbHNdajD/odpegDjGATmW1gmT0qF/qv0?=
 =?us-ascii?Q?pTo6+WK09crMmxXMw+k3H8OJoMrIA4C3UL5e5sJjoqh40qb+ogNXXSKghPFw?=
 =?us-ascii?Q?OpK1DP7wACcUldSZlEFH6AGgrN11seFTKkGie0vbrrUYeS5byLhOnDHptvsQ?=
 =?us-ascii?Q?WSSFwUwo7HqlWX/sMtaYCPRAHDsOrPkWg9mlyVlpRg8QLnlrcqpCox0MoaWv?=
 =?us-ascii?Q?EI+3VWSxaQBF7bPWYMKcvRLS5DEkcWp4HiOE+kS2NkAJsHeqbv54UTICghrl?=
 =?us-ascii?Q?QAaVSIlCemzTf1Gw2zvSq+kpuGrsw8MdrE0Hs+I0dfawPQ7xx7EUX5JjxcaF?=
 =?us-ascii?Q?yfCBs1pnLnYuSqRO2nUInrVRsseql2Qj4OCSAUI14cdCwfmnkHwOncTaPO6u?=
 =?us-ascii?Q?6tBE2BbsNtE8kVB6jKfwOqoMKv51ykvvbI/mJjmG+4xO3CNLoOQCP9te2gI6?=
 =?us-ascii?Q?zgdj4P66y56UrMm6Mb1jl/cJF3VvP+Aotncj3tP+cR+UNAYmsEj2XuDRoeKr?=
 =?us-ascii?Q?OAZ4AbmY89VGQ6Ub9AaV9qKePqCVBFgmnkDuQXiViptamE9zu4pPYq/goK2u?=
 =?us-ascii?Q?2HYqFsL/s21TVAua+odymq4GmmfAINEBYZ4Nr4KwcTVVwJ0iiuhRxhsi7ABg?=
 =?us-ascii?Q?SBSf/FEMZt6ZMFZBDm0A0NbhwJDAm+a+DM6+T5crjCHMl9xDaJoschL3ZJIa?=
 =?us-ascii?Q?MAK86+oe8xs7zP2g3VZ/fNAfooaaKRtnjzRnhRyii/P5mgZTmCfyIEooz4Dp?=
 =?us-ascii?Q?eH0GMpPeQ4nUOKMzBzfdsBhm5G/1w+vivdvCOAsg4QFexxRKHDnahUN8bONW?=
 =?us-ascii?Q?KyOdWgQi+w8NQ71S2ZoWAprxLx6lR7gYC3DTp7GukBahErNSV0EltCbNW6md?=
 =?us-ascii?Q?dgYChsx7u/yh2GRJH5m0s8V77dtF2U7TmPBJr37ZD2WaDA5LvxIm9jxEfCzA?=
 =?us-ascii?Q?1IDfc8qM0fAc/bfrz4bdsuIkyah34PNRHvjOVcXy72Qtd04RZgVGWNr0uGCN?=
 =?us-ascii?Q?DFI6qyxZmglFZoc1LnWLGHDCzcH+RJfFk+Ncv3hfYE/OZelFKH79TT/JguqW?=
 =?us-ascii?Q?+v8m+02nXCxNfFDpo8Dg/ktf5LsZGauvdts5gIHmdasuQVQ2XxvgB8kAGPCT?=
 =?us-ascii?Q?SivnOfAnWbNdPcQOgZZN+sTknRl2l/m0/vqUti3LkUk7f63ReoHB8/sdJoxG?=
 =?us-ascii?Q?1JTn0NLPYgqzF2Vm1tSRXfJSpzS+QR8li3b8d+TajV0pbZOpQm0MWQYXZZZP?=
 =?us-ascii?Q?FsThzHM7pfW8EnzkqPi/IheLAOCh7E8JG09hA4naeT9RpZY/2mwMb1twwrs8?=
 =?us-ascii?Q?EBHUC8QzTu+CIU0ow8BY5cAN0QT6qoAFY6zUxSL3lmg3I9Sfa1AEUZiv83kD?=
 =?us-ascii?Q?z3u6kLF9RPMekMQONuss2PU9iNCRca0VVVXhfX1ADTMadvsoifXAY3EiyeI4?=
 =?us-ascii?Q?KFhWrBQS34j3YCaljo4lXK9utmdIVjWgu09Rv3bgGFYG6gHcWhRtbAgKkx32?=
 =?us-ascii?Q?ZRkylxP9AeWJqJoPyWYSrHPRTSbOAdlC6pBLcYlU9Z9B++LSxo2Qam/mrGFT?=
 =?us-ascii?Q?xVfDqGFlLRanZ4KfxvQJ/zjuE/ROuZevBUN5hYeIdIJfmZgZC2OXHMQereTx?=
 =?us-ascii?Q?MDexTdrblQsyVCCUvjsiTeAzI+wbFic=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e3c480-af2a-4dda-d5a1-08dec42a23a2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:20.0127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsPOsdtJ9DjZQhQg6CyMnHeSB3RCd+Je7urBZndTdMpZFxkTAJG8mX1nLrwFhQKfpQgWOWpJhUcB3USNhpiWg6wdO5c95LLtJI0xYoE+jRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
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
	TAGGED_FROM(0.00)[bounces-38045-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:sean.wang@kernel.org,m:lorenzo@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:brgl@kernel.org,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:srherobrine20@gmail.com,m:markus.gothe@genexis.eu,m:mikhail.kshevetskiy@iopsys.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iopsys.eu:mid,iopsys.eu:dkim,iopsys.eu:from_mime,iopsys.eu:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 275BC64E975

Preparation step. Later the driver will be split on several SoC
specific drivers and a common code. So it's better put them to
a separate directory.

No functional changes.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/Kconfig                        |  1 +
 drivers/pinctrl/Makefile                       |  1 +
 drivers/pinctrl/airoha/Kconfig                 | 18 ++++++++++++++++++
 drivers/pinctrl/airoha/Makefile                |  4 ++++
 .../{mediatek => airoha}/pinctrl-airoha.c      |  0
 drivers/pinctrl/mediatek/Kconfig               | 18 +-----------------
 drivers/pinctrl/mediatek/Makefile              |  1 -
 7 files changed, 25 insertions(+), 18 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/Kconfig
 create mode 100644 drivers/pinctrl/airoha/Makefile
 rename drivers/pinctrl/{mediatek => airoha}/pinctrl-airoha.c (100%)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 03f2e3ee065f..8b9b94ae9b33 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -678,6 +678,7 @@ config PINCTRL_RP1
 	  Enable the gpio and pinctrl/mux driver for RaspberryPi RP1
 	  multi function device.
 
+source "drivers/pinctrl/airoha/Kconfig"
 source "drivers/pinctrl/actions/Kconfig"
 source "drivers/pinctrl/aspeed/Kconfig"
 source "drivers/pinctrl/bcm/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c..a61eecff0dad 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -65,6 +65,7 @@ obj-$(CONFIG_PINCTRL_UPBOARD)	+= pinctrl-upboard.o
 obj-$(CONFIG_PINCTRL_ZYNQMP)	+= pinctrl-zynqmp.o
 obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 
+obj-y				+= airoha/
 obj-y				+= actions/
 obj-$(CONFIG_ARCH_ASPEED)	+= aspeed/
 obj-y				+= bcm/
diff --git a/drivers/pinctrl/airoha/Kconfig b/drivers/pinctrl/airoha/Kconfig
new file mode 100644
index 000000000000..fd84a04cb428
--- /dev/null
+++ b/drivers/pinctrl/airoha/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# For ARMv8 SoCs
+config PINCTRL_AIROHA
+	tristate "Airoha AN7581/AN7583 pin control"
+	depends on OF
+	depends on ARM64 || COMPILE_TEST
+	depends on ARCH_AIROHA || COMPILE_TEST
+	select PINMUX
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select REGMAP_MMIO
+	help
+	  Say yes here to support pin controller and gpio driver
+	  on Airoha EN7581/AN7583 SoC.
diff --git a/drivers/pinctrl/airoha/Makefile b/drivers/pinctrl/airoha/Makefile
new file mode 100644
index 000000000000..009800406f5e
--- /dev/null
+++ b/drivers/pinctrl/airoha/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# SoC Drivers
+obj-$(CONFIG_PINCTRL_AIROHA)	+= pinctrl-airoha.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
similarity index 100%
rename from drivers/pinctrl/mediatek/pinctrl-airoha.c
rename to drivers/pinctrl/airoha/pinctrl-airoha.c
diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 4819617d9368..1fd09305c73f 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "MediaTek pinctrl drivers"
-	depends on ARCH_MEDIATEK || ARCH_AIROHA || RALINK || COMPILE_TEST
+	depends on ARCH_MEDIATEK || RALINK || COMPILE_TEST
 
 config EINT_MTK
 	tristate "MediaTek External Interrupt Support"
@@ -125,22 +125,6 @@ config PINCTRL_MT8127
 	default MACH_MT8127
 	select PINCTRL_MTK
 
-# For ARMv8 SoCs
-config PINCTRL_AIROHA
-	tristate "Airoha EN7581 pin control"
-	depends on OF
-	depends on ARM64 || COMPILE_TEST
-	select PINMUX
-	select GENERIC_PINCONF
-	select GENERIC_PINCTRL_GROUPS
-	select GENERIC_PINMUX_FUNCTIONS
-	select GPIOLIB
-	select GPIOLIB_IRQCHIP
-	select REGMAP_MMIO
-	help
-	  Say yes here to support pin controller and gpio driver
-	  on Airoha EN7581 SoC.
-
 config PINCTRL_MT2712
 	bool "MediaTek MT2712 pin control"
 	depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index ae765bd99965..6dc17b0c23f9 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -8,7 +8,6 @@ obj-$(CONFIG_PINCTRL_MTK_MOORE)		+= pinctrl-moore.o
 obj-$(CONFIG_PINCTRL_MTK_PARIS)		+= pinctrl-paris.o
 
 # SoC Drivers
-obj-$(CONFIG_PINCTRL_AIROHA)		+= pinctrl-airoha.o
 obj-$(CONFIG_PINCTRL_MT7620)		+= pinctrl-mt7620.o
 obj-$(CONFIG_PINCTRL_MT7621)		+= pinctrl-mt7621.o
 obj-$(CONFIG_PINCTRL_MT76X8)		+= pinctrl-mt76x8.o
-- 
2.53.0


