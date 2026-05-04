Return-Path: <linux-gpio+bounces-36102-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGysAGoy+WkG6gIAu9opvQ
	(envelope-from <linux-gpio+bounces-36102-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:57:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 964A64C5074
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 732C1302E30C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 23:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2146D3FF8A7;
	Mon,  4 May 2026 23:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VJMiR86W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013024.outbound.protection.outlook.com [52.101.83.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0113FE66B;
	Mon,  4 May 2026 23:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777938912; cv=fail; b=hzKfxUyknV6ik9ZCjkFyfknChUW7bJ7Nmb/M0dJP6Bp2SOSd9Mc7mEwP8dSQSWIZ1e5iTQ3kjWlx3V4WQPlEWZVxKB3huj6z7I5tFbzS9n/tsNAmiXEaHU3BYlx7eeALNV8KOeItyXmZT/4IWOv3m3l2nScv3ut6x+xCh13MsKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777938912; c=relaxed/simple;
	bh=Ne5myiBC/j77BXJRI8difB227/9SIT6XkOyj+wtHv0A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SkriI32Y126vPxTrKYjs2AS1fLPwY8lxszXTgZbhgAnmkVo3Gc4e2b2xJkOUSIC8eybaK/YehSV4rGNYoEgyh5c4DdCBOSLLEr4JGqaDmI5cHL3+icyZJMKuZwBn8AtMRT0oMhn+wBEbZSBGYOT533sYJYndpV+EakA4yKh2RQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VJMiR86W; arc=fail smtp.client-ip=52.101.83.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1Za/qah4N7L+sWSYKbPb7IlHLIKXCqVnUGqMhr2sj+fOzgH9AcE3DAJdDPJJT2qv+nKGuOaExidQiQyeM6cFyPgblxT2ksqCtT4lrOcy+4FyUIvvSQsgJtrX43TARuOxq7O6iLG5A4RwjuuFJ8Lif7YG61Ounpy06uMwq3YdRAvY1xkRvIVrCVdw88kuOLrG2IjbMXi2XoDjd7mFItApO9jkJfi5lIVMZZPqo0oBCQfoHUq1hiiqLlW5vkSQhvVMJxUouEkiPcudfGp3crnWOdBSk3JvDIc6fq/KTTPotS3NrZ6Zte6+ExBoVQ37KHU4p0mouTpbCRn/eqydQn0hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cko1713CzWnElB54NmdrqyOXLozM6MramZtLJt4T+OY=;
 b=I9FQGQAuY4e6JDbNkF8ZhKrfH32UkxFYWzpNk4Tg4MsaYg8YSkBbdXlOpPAjh6PdewZ9n/09MSr2dI5IDDbKmbX4drWajPCmxyjAcl4iDNMsaoBGghFGNlAL/I6JV8069s5IKToLgy8SQFVeMNCtMcknjRcAFKmxY5oF7cpnmFl0MYt8e/4pXshGy72qaNioTMj47vBD91eQyej6Ugc+LAaidGVZjuGVWYPRbMkNxQ3aoY1irGdzPziTc2mNDgDAYB+PTvRvckY18DRpU4DMHdOcP0P0gDvhHDBUTSHnsQEkZEM6AQ9eaVEQl7iA45JBk8p7cLLBV5IQpeajWliv/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cko1713CzWnElB54NmdrqyOXLozM6MramZtLJt4T+OY=;
 b=VJMiR86WTUxmyeRzI5Yx5QgvkZ13lgETTksxFQCAiB99FohJ99VxBmKL6nQKMe86NQORlzM+c0UNy4CD0/APdBoRGQptqoLg/npCHE870O7JNLABew3zn4MzFM9d+wJXZhSa7PIspEHkBpXCdwEunhxpHZHWmmbpHCkxDPgUWYui7ibFj0SaGUvUrkyUjRLxE6/I39g91T3z+1w1DvihL//6WxiNNBS5j281qFe9HybBSYv6QBUx8nKL0j/ZiP/9QaJEJHFmaC4CMT5w9cF4uNlz8jLAv3T9Yd7oehKslRWHp5479akfqBRebr3SxoUD942VAe/xPs6utKDOy2aKaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10511.eurprd04.prod.outlook.com (2603:10a6:800:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 23:55:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 23:55:07 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 04 May 2026 19:54:37 -0400
Subject: [PATCH v6 3/7] pinctrl: extract pinctrl_generic_to_map() from
 pinctrl_generic_pins_function_dt_node_to_map()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-pinctrl-mux-v6-3-8ea858ba3a5b@nxp.com>
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
In-Reply-To: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777938890; l=6610;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Ne5myiBC/j77BXJRI8difB227/9SIT6XkOyj+wtHv0A=;
 b=75eX8B8lk/jZU3LoOA9tQEjkeKyN5u4jEdHgBsP8/h+6ezktQrymogOlQCSOCpRJ2Gfojxw0H
 EupEow+J46rA7jpm5y8ikyzLcFQYdFr3sjCpYTTYxznm3tM4RlPxd19
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10511:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c39662-dc8e-4c76-4957-08deaa389199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	wboKdCNmRFsCVm2QlwOfTHuDHxrMgzzsgDlWWugrOStxMavlpzcI/D2+C+RTlRD7BbroEz7CPmndL5F8ji0Sn1QwnLOgcOQLqipFbwsvSKqhdkjvJb92VbeqFYkOlqafWKhoLVf58kZ1u1CqR6TscyR/N5rXay1Q7rriO6dZ+i+i8BRL2oZgzGsKcWQjL3pbmiPC+idd9KKYOzJ/SC5Aqk5/w6OJv7Kub868uVvm6uby4u+u83w6+S5Rq+P/0VYtyyGsXrgGDMQsMCNUJ2Yeo/CtzO1W6rm3QD9vuCAttwOKVl9D/OkX4GQcpA+1i16FCKfLSCgL24sP/LdvX0jh8HQjWVajyL6qDIQ377oOVjNISjzxMcLJnVB+XPHqJClgILcj+YyIpmLUt5NiqcLirlSKRKslm9OvU+QlweM4iZX9et3NsJnpELcCySqbchETz6xxJEkYBbOBxvXF8+8O3Ar25hN7h6l76D+f7rjzw3BhSc+zgW33XMyBZnyBpzY4/vTCsY/TrXDr4M6gw49PlEGjr1khnGSOrxMQLIEAzMJMCt7BnQ4VKJRkjldc+GFgi4rc/a7AWXdPibpIFmVBDzNrZA6+lBW/QQHBY0xkfRbINN7DeYGCZZY2PzFBoZZ4i+96Tm6VVMv0n0gd8viBlOlWhfCeZKuROIpqtibQvXPDzEBQaTR+iuCz0ALmrphuHzs/lYNiMIYUXHq75udcw9/3lpeYQikqvOwqwlaJj3P1OnicqPb6EkMURMJXHiX3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHF1VnNCOE5XZUluZjRoMFJhTkhVd2ZJTlFQNWNidWdNdU5hTnFYaEpEaWdJ?=
 =?utf-8?B?V0ZYeU85MTRVQjVLVUVsTzFPeVR5SVZGQ2FuRVhqZE84WmZmcVFiTXJSRnpM?=
 =?utf-8?B?NGIySC92S0JvMVl5aFhCUVhYUjB5M1FLU0ZsaG9FMjEwZWRuT2VQVmlvb2JP?=
 =?utf-8?B?c25BU3M4Z3c4RzlLY1RjVjhGaXVEUnlOMmw2NTFoYnNDd1hxdG1lZWVONjM3?=
 =?utf-8?B?R0tRRTY5a3g5ektPMXlSSHpRSys0eTUrUDNGQ1ZQekdtRUNZcHJHZjdPTTd5?=
 =?utf-8?B?RWRXcHRyazEzVTUvdXlGMzNqYkJxcVdVbjdRNlV6cE54REs4SzNzL0FRRmJw?=
 =?utf-8?B?QzlaSkZ5WkRkRHNYNk8rOGZhUlRKakNJZkdGUFZMcnVNWTVTRGk2UkY3ajly?=
 =?utf-8?B?UWNLOHFaS2U1OW96blo4MmZOOTFmRC9LNnErQU5Za0ExQnVsVGRVT3grVjhp?=
 =?utf-8?B?MkJhRloyMU5LQU9iOXp2Z1ZuYzBuVk5yTVZxWGM0Z0UvS3dRYVhNZ2ZXVThG?=
 =?utf-8?B?N1pxalJZcHBBaTl3K2N5UnVrcVFua1BGU1ZMdFBlYkdmQmJwU0djMUVYWDQ5?=
 =?utf-8?B?Q0xvaERBeFdxRDgzWEFGcVZtcFh6OXgvdFBUUjNVbEFwZENERUpIMVJDVUNN?=
 =?utf-8?B?MkVwQ1dpTlR6VXpvZElHT2FEeDlRaEE2czZRSmhJYnQ3d1ZqY09xMndSaEx3?=
 =?utf-8?B?cE1HdU5aOXlvd09aaXF0R2FHOHJYZjVOb2d3L253UzQ3S3pXNi8rajVaZThX?=
 =?utf-8?B?YW83b3o5YytSb0FFQnQ3SVpRMmVyQkR1L3pZbXQ0ZjZoZXRrRFFUMklTY2Nx?=
 =?utf-8?B?NkZCRys5bFVGTDM5Vy8rVFRLRGFVY3F3YTZ4U0ZVZWRhMWI5N0FDN2RnYjN5?=
 =?utf-8?B?dDBFdWRTemFsRFZpL04xNVJSbDdTM1E1ekw3UnB0OHFHb25Ec0hxWTBDZ1dX?=
 =?utf-8?B?NitDd0ttNkNnbFBEWGl1N3M3NUVvUUQrM0dPQStGeUdwdkxkNjI1SDMzZHd2?=
 =?utf-8?B?bTVBZk1rQWVsdnRBaDJTVW95OWRySWkzWW5yeDBRTGxTdkhnemRvQWpaUzdV?=
 =?utf-8?B?QkdtTGFtc21XRnpvVEhINlZUZlZoZXlsdHhpZnBqYXN2cFBPdm9hNVRrckRy?=
 =?utf-8?B?TGt3L3MxWFU2c05JdEt5Mnc2QXdUMDJzZGFtVzJLeGQ1Rm1MZllsZUNXb1Yy?=
 =?utf-8?B?OEFqdDJsa2pBSFRiZWRxTUFXVUdlUnRlQlVndkt2am5IUm9EejJhVk92NlF3?=
 =?utf-8?B?SG1RT2pFWWRKUlRiSncwYkJLaHZ3UXZuN2I5Rjl3VTVvbzZjTi9SdXd3RWlT?=
 =?utf-8?B?MzltVjgyZTNBcTYrYWNaQ0N5ZUVkTk93Y0NMQm5KSHR5VXBTMkpVU2trSnNn?=
 =?utf-8?B?MkZDdjRkN0FWbWRnR0UzZzlKUlpiZU50OU10RkEwSWhpNWtNVmNYMW9ycnlx?=
 =?utf-8?B?NHAvU3NxWFBWREYvMWpaS0RZRHBXL1FobE94aFVpM2V0TnVwaEF5SkhFYlc5?=
 =?utf-8?B?Z0MrZUpPT1cyUTFjcjBKUyt6eURGbEs1TlJleTZGSW1Fd3Vtam1McGFPcDJB?=
 =?utf-8?B?UmlUa0FwWTgyM2NCRzlHUnhmdkkvdnlmdVpsV09iR0RFWnNkMGJLL2lHWkRT?=
 =?utf-8?B?bXhjNDV2M1FmUU90K0ptMERzQldrT0x2UDh5VytrUDBLaUJmdExnUWNxWUVp?=
 =?utf-8?B?R1VEWVQ5algvN3BJMkVHRkhQVjQ5Si9WdndMT1BtYVEvMmd6NFFBemdxajdL?=
 =?utf-8?B?dyt3NldFRVBaMWpVYW5EeXVYZ2M2TEhqdi83cmpyckQzaHJUNWJCMWF0d1ZQ?=
 =?utf-8?B?cnZZMVY3SmVqS1FjNHFZY29vTllYM0UvTWJEcURQd2VOSGNTOTlHVzd5ZGlS?=
 =?utf-8?B?c1h6VEI4QXZ1dmpKQkFQOTZyVEFGaCs3eWx1dGZFVWM0ajRMbTh5SjZndUxV?=
 =?utf-8?B?K2dXOXBBVDl6QUNvWnI0dENubkYweU9oTVdSOXViS1pVZThxL3E1OTl1WnRn?=
 =?utf-8?B?cmhWOVVBMk1hK0tkQU1ZL3BqYS8rRktpY1hOMjk5a2dqdVNMYmFKTlNYY0lq?=
 =?utf-8?B?ZGpxYmFaRlRURkRoQXpFNUtNL0VYT1Z2TkdkaWwyQWJ3WWRFTkIxVVlUdUVv?=
 =?utf-8?B?emtzSVV4VXdEejl3QXoxcmtyRGY4bmVLV2J1NE1qMnErYnZiZTYyRWJEejRV?=
 =?utf-8?B?Z2FKSFpKVi9oSHUvNDJseHNNZkJKREVGd0x6UUNQRktnVG1RdWgzakNZRlBM?=
 =?utf-8?B?aE5RTlcxVHFGMk5sT3ZQY1krclNOYnloSFAzOG1tSHNENURoY1ZlOFliU2Nv?=
 =?utf-8?Q?4EaCYWFWETAS9VPnek?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c39662-dc8e-4c76-4957-08deaa389199
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 23:55:07.2012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvqUrYgW5MyfUjEGxPf4UTXt72sp1jjbKQjMqt5dnWZmM0Jp97Di/icZgLh4ykL9w00R8TJsbOcuthrGEudXRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10511
X-Rspamd-Queue-Id: 964A64C5074
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36102-lists,linux-gpio=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]

Refactor pinctrl_generic_pins_function_dt_subnode_to_map() by separating DT
parsing logic from map creation. Introduce a new helper
pinctrl_generic_to_map() to handle mapping to kernel data structures, while
keeping DT property parsing in the subnode function.

Improve code structure and enables easier reuse for platforms using
different DT properties (e.g. pinmux) without modifying the
dt_node_to_map-style callback API. Avoid unnecessary coupling to
pinctrl_generic_pins_function_dt_node_to_map(), which provides
functionality not needed when the phandle target is unambiguous.

Maximize code reuse and provide a cleaner extension point for future
pinctrl drivers.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v6:
- add missed EXPORT_SYMBOL_GPL(pinctrl_generic_to_map);

change in v5
- add npins in pinctrl_generic_to_map();
- remove below line in pinctrl_generic_to_map();
pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);

change in v4
- new patch
---
 drivers/pinctrl/pinconf.h         | 18 ++++++++
 drivers/pinctrl/pinctrl-generic.c | 95 +++++++++++++++++++++++----------------
 2 files changed, 74 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 659a781e20911db4b27c7c3663c31fbbbf57c521..fa8fb0d290d1d97ba9e19d6a341a9b14c485e08e 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -172,6 +172,13 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 						 struct device_node *np,
 						 struct pinctrl_map **maps,
 						 unsigned int *num_maps);
+
+int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
+			   struct device_node *np, struct pinctrl_map **maps,
+			   unsigned int *num_maps, unsigned int *num_reserved_maps,
+			   const char **group_name, unsigned int ngroups,
+			   const char **functions, unsigned int *pins,
+			   unsigned int npins);
 #else
 static inline int
 pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
@@ -181,4 +188,15 @@ pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 {
 	return -ENOTSUPP;
 }
+
+static inline int
+pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
+		       struct device_node *np, struct pinctrl_map **maps,
+		       unsigned int *num_maps, unsigned int *num_reserved_maps,
+		       const char **group_name, unsigned int ngroups,
+		       const char **functions, unsigned int *pins,
+		       void *function_data)
+{
+	return -ENOTSUPP;
+}
 #endif
diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index efb39c6a670331775855efdc8566102b5c6202ef..e4cd16ce2bda379ab0933acda782d02ba1ed2e1c 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -17,29 +17,18 @@
 #include "pinctrl-utils.h"
 #include "pinmux.h"
 
-static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctldev,
-							   struct device_node *parent,
-							   struct device_node *np,
-							   struct pinctrl_map **maps,
-							   unsigned int *num_maps,
-							   unsigned int *num_reserved_maps,
-							   const char **group_names,
-							   unsigned int ngroups)
+int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
+			   struct device_node *np, struct pinctrl_map **maps,
+			   unsigned int *num_maps, unsigned int *num_reserved_maps,
+			   const char **group_names, unsigned int ngroups,
+			   const char **functions, unsigned int *pins,
+			   unsigned int npins)
 {
 	struct device *dev = pctldev->dev;
-	const char **functions;
+	unsigned int num_configs;
 	const char *group_name;
 	unsigned long *configs;
-	unsigned int num_configs, pin, *pins;
-	int npins, ret, reserve = 1;
-
-	npins = of_property_count_u32_elems(np, "pins");
-
-	if (npins < 1) {
-		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
-			parent, np, npins);
-		return npins;
-	}
+	int ret, reserve = 1;
 
 	group_name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent, np);
 	if (!group_name)
@@ -47,26 +36,6 @@ static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *p
 
 	group_names[ngroups] = group_name;
 
-	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
-	if (!pins)
-		return -ENOMEM;
-
-	functions = devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
-	if (!functions)
-		return -ENOMEM;
-
-	for (int i = 0; i < npins; i++) {
-		ret = of_property_read_u32_index(np, "pins", i, &pin);
-		if (ret)
-			return ret;
-
-		pins[i] = pin;
-
-		ret = of_property_read_string(np, "function", &functions[i]);
-		if (ret)
-			return ret;
-	}
-
 	ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_maps, reserve);
 	if (ret)
 		return ret;
@@ -102,6 +71,54 @@ static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *p
 
 	return 0;
 };
+EXPORT_SYMBOL_GPL(pinctrl_generic_to_map);
+
+static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctldev,
+							   struct device_node *parent,
+							   struct device_node *np,
+							   struct pinctrl_map **maps,
+							   unsigned int *num_maps,
+							   unsigned int *num_reserved_maps,
+							   const char **group_names,
+							   unsigned int ngroups)
+{
+	struct device *dev = pctldev->dev;
+	unsigned int pin, *pins;
+	const char **functions;
+	int npins, ret;
+
+	npins = of_property_count_u32_elems(np, "pins");
+
+	if (npins < 1) {
+		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
+			parent, np, npins);
+		return npins;
+	}
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	functions = devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
+	if (!functions)
+		return -ENOMEM;
+
+	for (int i = 0; i < npins; i++) {
+		ret = of_property_read_u32_index(np, "pins", i, &pin);
+		if (ret)
+			return ret;
+
+		pins[i] = pin;
+
+		ret = of_property_read_string(np, "function", &functions[i]);
+		if (ret)
+			return ret;
+	}
+
+	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
+				      num_reserved_maps, group_names, ngroups,
+				      functions, pins, npins);
+}
 
 /*
  * For platforms that do not define groups or functions in the driver, but

-- 
2.43.0


