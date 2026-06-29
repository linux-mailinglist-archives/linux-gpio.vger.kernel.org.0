Return-Path: <linux-gpio+bounces-39150-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SEy8NuaUQmpy+AkAu9opvQ
	(envelope-from <linux-gpio+bounces-39150-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 17:53:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A299B6DCF5D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 17:53:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="S/zykTuh";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39150-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39150-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AB0C30461EA
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DD243C058;
	Mon, 29 Jun 2026 15:43:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011071.outbound.protection.outlook.com [40.107.130.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A1A4266BF;
	Mon, 29 Jun 2026 15:43:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747802; cv=fail; b=bu/L8cBW3e87mJxZlyfMwyHbBWQbod8vqZzNezbh4IaW/ruUsCcKsQDn70S28WYg30Xv5R8vsKWAqvowwRQQCtQIAUYdJ7kktdxebzQA0TSp+w3lgsaiAgkXoV5vKklEJvx7j4bsPiClNHApBb7ek99ZOwelJHU+cJv9ViKIFpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747802; c=relaxed/simple;
	bh=4TKb8DXeBND7OLKvnWbVNLIPnGCLaGAbDq4tM2LS09o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ar67jBhuByBlScqFvG2rA/fr/qHXHWSpexswCiaSLrdWRQTRFba5VIX0xn4YtIEk5tvbyoMseD7+IxfgUJ9ExiIySdQyOSOk8OwaJeG/wueRm50XppPnFZTJDRWLd7Y3DvDHQO7Zw5rNekLc/Sg84HggvR0kqAA9F2RbOjgKd84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S/zykTuh; arc=fail smtp.client-ip=40.107.130.71
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhyQvjyNAMmrR1gYVz+E/eT6D4RJ0rA1uAANVvCuOuYYLBSc0zOqACpg0JKV8+CCFCqVeR+x2nNh9tL81A6TEMCfxksEM1VdFSZH03VOQjXDHg/g0QyMxGnt8Df/i7YXh9N0IRO4TP3uK6Pc2XaQWgjuT8L8Pu8Ph3B0RfH4qIwFOfUn6XPJAnqehRmk2H738TaUlzfzBa9tQM18FHL2lg6Rr38DB5uKrJoBlKgkFy3BRNLl8B+Je+81nBXFgb7zXkYC9OuhHFbJGsK3PRP9ekKtIHT1ZdHaic09J8c+urP5rKr4rmc4eMfuSgWa9Khxb2LLQrV+h7BaqnBrO+69mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUlfXlgXPywHPdQ0QOggn86872UVQZcmxCm6e/LrYIs=;
 b=tqjcolLGIb/CEAHZonk3jiHrl0IfLwkMp81WIDduIUJtjTPhz/DoDzn5+ir0arOFq+EDCsif6iAeP0iHe2iINFyDrTeMbKw4ZhJQ7TD0fr4YexUOhDI2ocJA5zQB/hBfU5q67e2y0MBe2+8Ri1WTlO2vA0GZmCQh/zGtsBXzgRActEvqifszgSCnuzeCwonscBjE0Dte0l++4BUqj04fejBSCXAXsc69NEMUSaLYHREz7HHpprNzhagVVvVhTVEHjXGe8DlsUxhU4WKO+d2491QJ9c/yrtZ9p4qz2oDBwFEdsoZMjCjM8kA6dFKxzshf4mIx7FJggVARm2mKakaV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUlfXlgXPywHPdQ0QOggn86872UVQZcmxCm6e/LrYIs=;
 b=S/zykTuhTH17SpKkWMQtPFMuJuPXe20j9FtyL3P8b6OHDI0AN3TOQd7+bv4KV4/dldxCjZ5fRKPrglioJgzR4l1Hbq9iucGxanIG0M7KwSiW+5w7PFx0uwaUXuYmg1IuzXN3vmb/kKew9usiJPq6olHtqpvjjyCwmtbYG9cWKG+YWmccRFvAdfiNF1fc5XtCB11eholJxz935R61ORq0g/1S1nGGnhzUWKoujCQHRUZT4iqof0y2d7BqpAH9RxB25piI1l+NCFumaU2Zwneu+3W4KFoghlJomTCjoNSaHMdLdKlqUZx6ePWuyARVHs8w8TT7OKo9nmlOyklCtlTriQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11819.eurprd04.prod.outlook.com (2603:10a6:800:2eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:43:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 15:43:17 +0000
From: Frank.Li@oss.nxp.com
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Rosin <peda@lysator.liu.se>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: (subset) [PATCH v6 0/7] pinctrl: Add generic pinctrl for board-level mux chips
Date: Mon, 29 Jun 2026 11:43:08 -0400
Message-ID: <178274777822.2249000.12458353880909358016.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:510:2da::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11819:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f078b37-5bd3-4c84-dcd8-08ded5f52348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|19092799006|1800799024|366016|18002099003|921020|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	2EZmjWDpakhKM46qR/yTpWg6xUwOm0tFazLQzjMkADbcb2DKU0775NweBaXhAK0+thgNsqyo2zf95bIPAsLv60AIQIaGxrsMpWt0Y7BtsJsCIpfcG26/Sfwfq6SxkvUeOOQ48jgsjHMQpWh+vOXVSdwFc36Ax0qoKTw3VEm9KD7F0XIb5q7O0fCZQeAOnKSf61SMHRK9DUKQjFI6ecF7eWy2cRM5hM9emQFoXxHtBo9mnGjawLe4xTkEK9l6e5X5qI9x2YVNgLIQmK3A1/4JKSzIykaSW8kF9r78AddLm6c7bzaatsIXBfnlpG22UUzDUMhHCsvp49f4hzCyiRIzGivDkoLQuhyIgzYGSpIZXf7qpNTkdopcvhDEp02zSAAnrsTyno7QBfy+6FfKSvMsYegk+DjY+l4R10HsxzZ6DP1IKCKDo3sEDuSwuBZx48j5ulPDq/ErqnB8kwBeyVRZM6WZEQxOd6xtgnccKPL6723i5mqED+voYK8szt+Mwv4M4hEqPOKhvLpQe6I3OYWgPlztnHrM+5tzdzeF7s+MLBbk9+SRgBbkbkh8OqvOkdpVKnKxjX4Jyt6sd7SxQ3gHel1CI4U5XsB40s3VUIpZqSEKEn00o0CbW+GT9zuZA45SszsRlrjCtgWDDJa+J3+hIqTSLzHPkyTyZmpzZRuDe+JXXgHloXIaQNa6UBsNAN6gm2BJw3ebI1wG0DruVq1+8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(19092799006)(1800799024)(366016)(18002099003)(921020)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFp6SEdYa08xak03RlJobkVZRTg1a0Y3QmVhVnRmcHh6RnhhK2cyKytBUXlz?=
 =?utf-8?B?RmNTQnMxZGFIRUlaM3MwYkx0UXF0NTBsZTlpZVZxT0lLS3BsVnFQWFpYZTlo?=
 =?utf-8?B?QWtSMnVhVkZYd3ByMDB2bExrSmRTRmtUeWNCYlY1OEMyRnNCTUM2b3FFRFZP?=
 =?utf-8?B?ei9MNk9NREN1alVjUUFuV3h5OVpoMmNNNGlqd210TU1VeVhxSHhMYzBuTjYv?=
 =?utf-8?B?N2N1UVVEalBKblQ5aDUxN09uZUNiaEJuQXR5VXowRFg3bmlERTh0c241YWY4?=
 =?utf-8?B?S3VUc042WWpydzhkNnd3djNEeDFTZ2ZWQXZkSE9odlNqelNkZ0hpY3d0QkRZ?=
 =?utf-8?B?SW9VYU9wNElReVRIVU5TTkZzQTZla05EYlBvUy8rZjhyVU56d0hXN2NlNkJ3?=
 =?utf-8?B?NnBPUEU0U2JRcTdrc0NLNmlpM0VESEd0NDVuS1pPSm1odGJwM3FUN1VoRjhs?=
 =?utf-8?B?M2YxMGxxai9Xemo4NXNmTnRWajdmRm5vbGQ4R2ptdWVrZWpiYXROTXAxQ3oz?=
 =?utf-8?B?U1JpMXZDWG05VVpyZ2xTSXgxcHk3YnJZckIzRFR5SWMyMVRsY0NuNGlJa1M2?=
 =?utf-8?B?TGJ1VERBTWc1V29yVmZVWjRHT3dLNlA2V004UXRIVml0V1ZvcmN2eEszbzFl?=
 =?utf-8?B?Z0xHZERDbVExMzVGSGc3a1BML2FkbUFyMVJ6dmN3eFR6S0QwTE5iSHhDSXpz?=
 =?utf-8?B?Qm9ZQWlaTklxSXhWRlFocm1zYnNMNEkybkY1QlhQMUFNWWtwUWROWktpRkRu?=
 =?utf-8?B?RTlWL3RkdVRhaUUydUlYSVFJRHlPTC96cURyUXZwT0NZVEdkK1hySTQ4VUZm?=
 =?utf-8?B?aGRJUVZ0VlEvd2Z4enRTRW1ESFg2SWkraWwrYTRuajRyckd3VkFOdFVFQzQ2?=
 =?utf-8?B?Z0g4U0I5Z2VUL0FidmVkbjIzcjE1ZWs2YVpHcXN6M3JoNENIRER2RDRTVml6?=
 =?utf-8?B?Q1BxN3hEKzJvM3FodVU1ZkoxWUJnNmc2emMvVEhTOWRZcng0cmJ4Y25TOVhv?=
 =?utf-8?B?c2Z4N2E2UjNTV055WjNJZ29lV0lxN3IvOG5QZ2U0dzViL2dkc1hycUtadXJh?=
 =?utf-8?B?YWZQR1BpVXdoYWpoaW5wWnlHNDRPbnRpcm1TN0V2eUNhemt4ejFlRUdYSG1Y?=
 =?utf-8?B?c2JYNmJIYm1laVc0ZFh4bWszQmJGV3BzWEZEZ1ZBU3VjQTV1T1lWUUh2UEt2?=
 =?utf-8?B?elV2S3FBczlUNEpJSnBhQnIvZUtrSFdLMVZCR0ZnU1J1dE1JeFN4dkE5emNt?=
 =?utf-8?B?RFVjUUVqNU5Kblo0akIrU1lIU1VxbEwwMlNNMUVGSG05RVpibEZHMGxEQTE3?=
 =?utf-8?B?Q3l3YkFMdUdQSTgrb29pUEpjNVJ5WTFtSERDMUs3ZWYybGw4eU5GNXRJa2VC?=
 =?utf-8?B?aWlJUGVHekNoeXRzQmNVQThuSzhEbWlzOHIza2pYQytCRUhoZThvVDhBaFhw?=
 =?utf-8?B?YjlyMGNoY3NvNldFRFhGNmFsSWRYQWZxU04yZGJtSmxXZmpvWmFKS0xMdWRr?=
 =?utf-8?B?bnZnbWtOMHUrbmFvL3VGNXpTRkduOWo2bU8vNEkzSUJVYzBTR2pzTDlhRkhp?=
 =?utf-8?B?emorNXBtUjk1dC9qMlk5OGgzTzg5a09pOWs3dzlCaVVkYUExbG9zS29wQlZt?=
 =?utf-8?B?cDZpOXJDdm1OUzh3STJRbW83S3poUzNRSVI4NUcwbGV6ZnZaeWEzenFxeDFJ?=
 =?utf-8?B?eVBPOTVMTVNFczR4RkNuRlZlR1RTTkozWDdnbTJNRU9FWlY3MC9QNm95SHBR?=
 =?utf-8?B?ZEswUnhGaTI1bDQxZXpsT1FvYXMraENvMzNWMlhwMXJvdVVvbVg0OXRzUXE1?=
 =?utf-8?B?Tms0dnJnakI4OFFhL1BRU3VxMTBwSHZtR2NORlJsOEtDS3pGMlEzb01xOThE?=
 =?utf-8?B?ZDJRU3NjT0hha3N4TXR4TnVpR0t5Q3JBbXdoZW5BYlRDb3E4UmhpTWtoWWJB?=
 =?utf-8?B?UDM5NHd2Ty9tQnNTYWNJZXFwUjM3VWFJRHVVSkdDSzlFdDlWMUVGUWhCMU5R?=
 =?utf-8?B?YXNlZ0dtUjJOT2FrRmZ4ZXdJRjFmUXVudVN6MGx1K0J5dG9wWm8rT3NXOWgv?=
 =?utf-8?B?dXUxV0QrWHgwQkFablJrUUVoemo5MnQxKzVhcVVVeEdPaU1XYlFEZWVOV2NX?=
 =?utf-8?B?V01zWm90bDhua3R6TThEdnpxK0F6aDJkeDNCQllpT1VvTENuK0xBZzlWTHk2?=
 =?utf-8?B?RW9jeUZiMWp5OGNlNXNpd1RBYlBVYm1hSWc1ZEwydDFHVUFaWlFOaTliZlVt?=
 =?utf-8?B?eXpLSnZrdlFxdWdLQkkya0NvNlZ5ZVJvN2ZSckFNVXFrTlNnZ3lBMDYxNzZh?=
 =?utf-8?B?RzhjWXBKcjlRVERsVWpFWGdSRU4wSnFRVjJvdGtma2J5b1ZSWjNxMHZGbE5q?=
 =?utf-8?Q?sKDlWaRmi5R01acFct85hHYUzTITl05wbzs8C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f078b37-5bd3-4c84-dcd8-08ded5f52348
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:43:17.0730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oX/anZrDI/Hrqa2y8SmQjjDSGSLyrS/XolH2HR4Vfvj7PCcw0EaEQy/fD0woPBo1cCjeAZL6iyO/ul4QqY8lQy5jRYHJIu6t8paL+OPcTwjCfRj8uHsnl/m0g6rCjXVr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11819
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafal@milecki.pl,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peda@lysator.liu.se,m:Frank.Li@nxp.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:haibo.chen@nxp.com,m:conor.dooley@microchip.com,m:a.fatoum@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[kernel.org,milecki.pl,pengutronix.de,gmail.com,lysator.liu.se,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39150-lists,linux-gpio=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A299B6DCF5D

From: Frank Li <Frank.Li@nxp.com>


On Mon, 04 May 2026 19:54:34 -0400, Frank Li wrote:
> Add a generic pinctrl binding for board-level pinmux chips that are
> controlled through the multiplexer subsystem.
> 
> On some boards, especially development boards, external mux chips are used
> to switch SoC signals between different peripherals (e.g. MMC and UART).
> The mux select lines are often driven by a GPIO expander over I2C,
> as illustrated below:
> 
> [...]

Applied, thanks!

[6/7] arm64: dts: imx8mp-evk: add board-level mux for CAN2 and MICFIL
      commit: ec5c75673cb9d4c9a2a55a70d54a6ccb254f4ba4
[7/7] arm64: dts: imx8mp-evk: add flexcan2 overlay file
      commit: 368eb597c6ef0263931a3922648e8c7b83cd0536

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

