Return-Path: <linux-gpio+bounces-33928-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH03FGFTvWlr8gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33928-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 15:02:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE9A2DB839
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 15:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04DB830A4F6F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 13:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5DC30C368;
	Fri, 20 Mar 2026 13:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l6u37aF2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E844A3D544;
	Fri, 20 Mar 2026 13:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774014898; cv=fail; b=ekHhWZ6GlRjXVmkv6Zqo1Qqwm82sMyoHdcChMpjzR2+v5lE9Tw7rWAM639xl4zOYbSYuJLVAo4AtwcZceiAgJ2Jei8d+DHG9JnsMNwLUARzTYwOLEdEaQHqOahY33WRTElG1lZsKpU7pkB3ANKAyXaR6nuZx8g1WZz09hPSNi9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774014898; c=relaxed/simple;
	bh=+T6LK0g/8v4ZwurfbInSr/VTv1Vj0wwsSZGccDsLfDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VNeESa1v+tQNljd6djrbaNJGTpjKrjSgz0kK/pkCF87E+TwNU3vhY4Le9kYAJYCXv0xL+cQ7PsTtDEiCouXnNCsS/8h6kWOyxupUylnifB7gE7lAsnoagZUfF7Q+33LU4LmFTzBTZxcge0oXV7foBu/1R4RBDioqgxDbST9bl4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l6u37aF2; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMMFTqwarkM1edrz3vMUlDKuNjG5skpSqKvQmeZlZ29b9HGxbxG2BYz3oAyIwDHRkDZ5dWwfzIR9iapIWaP7HukI9AIis4lZMiFccLhBt2cRNESIhe+ykQb9HKDSaVvjXhGsSDRZV6WCloiHMA/VdiE+nzsu7KW6WuGRUCQJnD1rKoU3N6sb5J+qfwuq62cRlDkld3hmJdnneoGXmZRlGcAJrnAP+l/KSHHYwcGf3JJnHkYLR07H3l42rAA/wZIsgdfFOB6677pQck5F8pQEl2VW/wJiXj5YHdUpniW6YBmUms8ZeJE63jwm6MlsBDYwCxT8xiSLEs79KMAHBM0eWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtgB+JNWA2dYKC5mvJH/Jhlf15v+JjP/OoiHydeOTiw=;
 b=lxqswM6Wg0RtfFVVQfvPElFphamMBSWvz4BwxOnSiiuxZj4sQY79QiTjWr/nxBF6y6jCiY5tQ/W6Om0GmBSPlJ1GLq/FGW8pVawzCOlmK7iSrDCkJvO5THRrK8cmodSEpa6qjdhOKfC5Ngqmbvuzisq2Fc2dGr35Mj6lkbQEfGLHwbADULbrUsXUOJK7k6VAtX/RsvuqmlsS7679IcESB1mvKxRo8eJcWVbjJNeTWHJGjpf2hryQh/H35V53v5dYhEjFfV0Hqt9RzfWlDkEZYrYPM/IdmaM6zan/q3Xx7DEAm2M31O1UFuXeHzYYuntzG+/eiOlgeDm8GLIPA3rVBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtgB+JNWA2dYKC5mvJH/Jhlf15v+JjP/OoiHydeOTiw=;
 b=l6u37aF2TOuRrWDf/WLf5/uQaktxTMkJNh8UXB+UZLeY42upytEgNwZBKHpaugF/RYJQOI/yWRJjrG3APH9SA7t/49iPRMq1TwWuvbDfwaRND0F0wM8v2q8VeNixSJ9HAY/C+0AqmPhVWKC2o3xoq6VuX0rCuoyJ7NDemdGGwoUA9vb2AgxtnDhlKaJ/Sl/sVzVG8TT8ag3om3Wq+yCeHOmg4Xm9lg0abfEoAR/x/ytPHA4UV542AX5P8Tn2XDQTgAjpfjTH/mKwy5W2V1ea0W7ckLLSiF+sc0pBW2jHPJspReNQh4Ezrd2EoSe1zHzE81sQ0MkNbc8kiYM9BfsaXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAWPR04MB9959.eurprd04.prod.outlook.com (2603:10a6:102:387::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.22; Fri, 20 Mar
 2026 13:54:51 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 13:54:51 +0000
Date: Fri, 20 Mar 2026 09:54:45 -0400
From: Frank Li <Frank.li@nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3 3/7] pinctrl: pinctrl-generic: add
 __pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <ab1Rpf2zS8Bn1-HV@lizhi-Precision-Tower-5810>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
 <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
 <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
 <absvZ5wzAwpbjHf1@lizhi-Precision-Tower-5810>
 <CAD++jLkp1CFcLccmLP0BWQSBKkruGCPT71dMeuyu3JY1N4T50g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkp1CFcLccmLP0BWQSBKkruGCPT71dMeuyu3JY1N4T50g@mail.gmail.com>
X-ClientProxiedBy: PH8PR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:510:2da::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAWPR04MB9959:EE_
X-MS-Office365-Filtering-Correlation-Id: cec7b314-b89f-4a36-1da1-08de86884187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+lYvZtxn76RtROywd0ZJs+PZ3cfrySdRTNjrpZMCijmgmdPqxxMYJ1/2qs9NyuFIPNMvhyfICbm4ezN5gqHTXuwrUsJL7X9ZX4ZhB1f5eZ814qAGsXU0ll75G03pQPasyT05zJL1NXAYSacPH//K+8CHUuAzSUTUXCEZXTKTFiG1kUbIvCb6vhjyOwQA8D4aZGUvkbmB8XWRQQRZpDOEgsUVUa4ACpxOWL6egt4AcQSuYRfQLDNim9qcHvk8UC0584Fdc2WgVeLmtFJBZk5TXpwuGFvVIWiBr6hNnws7Ksn0ndlUZUKnzGQK4M3+2Ux9rDUU/E60nw8EqmndoRjKaDTFaQZlh6biZvPS4Li7CNq7X25qPNK1G0Z9gNO6+ivLS1b6YiXNPfZ2gJCro40pPnPsE8u5i4N/NTx4T50rMibhU2hmyzg/fWfJEYbRK9pHnsrTZV2H5WKdVFxLZ5fUlP/ipggKsp69iWcyEsr4N2MejT0tog8ChU42thILKoOVGoUDY3DmyLyPY+wSCKDYAp81gVgs78+oaTi488ijfeOtf0SsOLK8WAGz6rfbFhveeapBSDBRL0t+/ZKiy5eS40fyRrj5udlKRTinQYGSsCcXjEaea+3VhWuKAQHbErNl0PRzH2eKZ8HyZMWfoM9xF+VIS7DA9UuQgW0ca11PthgSPRQ24YVjnxiwUpgNhTAbDc7Va3XhxJ+UDaWAwgaOjQxSynLQpKvDb24erInAykEC1bRFZysYuTvR54c3lQCmNKm7WrhYTAdXF1ZpWz5I3lGGxXBrNy7IG2KMD/yfFSc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWxKWm5ZQXBmUDVNcHdXY1B3U0kzRHdISDMyREtta1BZdldUZ0tFUkwrb2Zy?=
 =?utf-8?B?RXFKdDdrUHBLSEgwZ0dWVXFETDgwanB2TEQwQUExY0R6NmdvNWJwZUc1ak1B?=
 =?utf-8?B?L0IxZUUyYjFjZ1poYU1QNTYxblFsUmErdnlVL1ZjWDBNQkczSW5yRHhLMlc4?=
 =?utf-8?B?Tk1jNzNSTVlDTFJROHFaZEVONnprTlArZE5XTXU2V2ZaTGVtSmJjbitxVzJm?=
 =?utf-8?B?ZkYwTEcwd21RMVRIeVZqM29LUnVvblc3L1ZBcXk4TE8yVTlFVGY2aVVaRkhR?=
 =?utf-8?B?QTBJYUs5NWQ4a2xkVVdwUDZoQnErNTRnK2hJNEorU1NocnFRa3h4b2dHblds?=
 =?utf-8?B?LzY1aWlGK2p1SkJEd0ZqSFBXM2hJVlhqUCtKRFNwMkxNSWcvaFlNR0Z0V1NB?=
 =?utf-8?B?RktoRVltUzBQRVEwK3dqclFNb3Bra3VaWXc5eFNXdnZ0SlVoQlFRNnlhb1B5?=
 =?utf-8?B?OG1jd3YySEQra1hhazhPYzJhdDAwd29kKzZ3VVd0MGdNRStRM01Obm90MVJ6?=
 =?utf-8?B?VkpuTjBuNVlDRWZITmFKTDlKdnVHdkRBVzluWVFwYnNYdWhFbktzeWRyczFw?=
 =?utf-8?B?SWtrUG41ZDBIbmlXRlZPTEpPS3kvRFA3M0FiUVM0VGVtRElpK3NXUlNhcWcw?=
 =?utf-8?B?aC9VVlBwSmFzVklEMzRNUW5leExpb294Q0ZDYU9tWkxoWW1uL0J5RmpMNWtQ?=
 =?utf-8?B?Zjg4a0xjNS9tS0tYaVlaR05YcEVYUURpYldRT1ROZGorbkQ1eHoySlNzcUFi?=
 =?utf-8?B?QzkwVDBlM1VoYndZQ0pXVkMrQkFCa2oyblBHejZNMTBseUZUUDBzT3cwdFpm?=
 =?utf-8?B?bXdXQVIweGZ4dmlvc05xYUMrdVBRdUZJOEVCSFZDdFYvelg2eHVSaHdlaFFs?=
 =?utf-8?B?N1NVZmhucTNIMnNUSDBWWFY5bnVwNStSWnBGYXpnditoS3ovSXJsU2J1OVpC?=
 =?utf-8?B?ZUdVUHQ0dytpVGFoVFlxU0tqNUFRTDV5RlpYc0xZWisxaERFanhFWWVpN2JT?=
 =?utf-8?B?cG4vR2xmRDJGMVZlajhGeHVhdkNUM3VTQmVuRUJGS3hrYndNSFlabnBOWkJN?=
 =?utf-8?B?ekRXK0JHT0lzK3Z3b2JHV1FoMVBINzVrckovNTZNTkZCM1E0VUh4YnFjRXF4?=
 =?utf-8?B?RkNscDhxRmhtMlBsR1ZrakRnT1g2UnNGQlNRRWhTMnEvT2JMaU1kRUVMVDRR?=
 =?utf-8?B?cDAzT3A1TFlzV2M2NTd0elB5dHM4NzRXVkVyTXlUSWhIWThqUTl4aUdMMWpz?=
 =?utf-8?B?U1VmWHVlTERWV3ozVnNZQmVrNG4xMTBhdk9HTUdFSFBzbHdlMWFjQmxRMDd2?=
 =?utf-8?B?Q0d6M2pqY1NuVE1ub285VUo5eis0dU1QMzNnUVFqT3BPMC9JZXh0amN5dGZ4?=
 =?utf-8?B?dlNXRWptUzVEUEk5cTJZRlVpM3RNRjk1czZOdWN6c3pMT1R1VlU2QTVCdi9B?=
 =?utf-8?B?ZGJaTjMrcER0NzBwM254TjdUTFJkQ0llZWhhUlBhLzlVOXQ3YkovdnZFQW1S?=
 =?utf-8?B?cHM0MUpWazhBYTlEdG9hOTd3Vkx0TjZqNVVvUVhsUzRtakg4akNWVkVVQStl?=
 =?utf-8?B?NEcveUNYc0NXUFpLTGt2czJMYURYWk1PVkppamlPc1BRcGVvY2dRKzFFZHJS?=
 =?utf-8?B?OG1JSDdhV0dhWmw2NEpxL2JkNlRwMEdOU1lWZ0srYi9XWnM5VzJMVDVpamtF?=
 =?utf-8?B?YXJaTEEyZlJpdWlwU0QvbUdwTTcrWnN0SkdDeWVIcE1NYzVTR2l5c0JyUUw2?=
 =?utf-8?B?UmoxMk85cUJVcmx4R1lxMlc4ZTlPNHdMWjI5V2swcm5Oa3N0UjZqVTVMWitS?=
 =?utf-8?B?VS96TlUwdHBLT01JNzRHUjhlNTNpZ29VWFZJUW9yMmo2cWhHNU83MlVMNFpR?=
 =?utf-8?B?d3FISVQ3bW41NU1jMlhnRWlod2ZEcFQ2bG9iUmVuZnZEZXRFMkVZYk1xdi8x?=
 =?utf-8?B?VTBpNTV6TCtQTDNlc1cwMUNBRWV2SnJzdUZMV0o4NDlCQ3JBRk9CWmtKcVNs?=
 =?utf-8?B?MGNlbHljOTY4c1pkUWtMajg4M0RuY1ByQi80RytjcWYvSVVocUdGQ0plUDNn?=
 =?utf-8?B?WXBneG0zekQrT2dUcFZ1bHRIK3g4KzNxTDdCMDc2Y05zZ1N3TS92eEl5WjJa?=
 =?utf-8?B?S2prV3I0ZXIxMmg2RTdJeU9HdzQ0NWFZdm9UZTVObHBjTm1BY0o0dXo3TjlI?=
 =?utf-8?B?bHV3QVhNanRWMTBIalAzTzZ4YUF3ekV0S05XT2FWYmpFNy9kYXZIK0o0ODdv?=
 =?utf-8?B?SUU1NnB4NGxiUkJUTi9reU5zT0x4UG4wVXVlU2lQR28yeHBONnVMZjZqdExq?=
 =?utf-8?Q?tP9VPGi25lqr67K6Gx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec7b314-b89f-4a36-1da1-08de86884187
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 13:54:50.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odbC+Vwb1fV+oNy3UNRyjBYOiEoLhkVvenA52Rkd5a1PK/5ToI2godGD3TRaQw13M8UKb4u4T4KeY3nbrKX5jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9959
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33928-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.955];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BAE9A2DB839
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 02:27:21PM +0100, Linus Walleij wrote:
> On Thu, Mar 19, 2026 at 12:04 AM Frank Li <Frank.li@nxp.com> wrote:
> > On Mon, Mar 16, 2026 at 10:37:28AM +0100, Linus Walleij wrote:
>
> > > That said: in this case you're just adding a parameter, just add
> > > the parameter and change all of the in-tree users to pass false
> > > or whatever you need, these is just one (1) in-tree user anyway.
> >
> > pinctrl_generic_pins_function_dt_node_to_map() directly feed to
> > .dt_node_to_map() callback, add parameter will impact too much.
>
> Why do you say that. It already has many parameters, one more
> or less doesn't matter. It's not like this call is performance-critical.
> Just change the users.

In only user drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c,
	.dt_node_to_map = pinctrl_generic_pins_function_dt_node_to_map;

pinctrl_generic_pins_function_dt_node_to_map() need match .dt_node_to_map()'s
declear.

So it can't direct add two parameters in pinctrl_generic_pins_function_dt_node_to_map()
Need simple wrap function, which other in pinctrl-mpfs-mssio.c or in
pinconf.h.

If add two parameter in .dt_node_to_map(), need change all functions, which
.dt_node_to_map = xxx_to_map(). and OF core part.

Frank

>
> Yours,
> Linus Walleij

