Return-Path: <linux-gpio+bounces-38714-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2aHTKkxjNWpOuwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38714-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:42:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CA96A6C58
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:42:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="MlBOj/VU";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38714-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38714-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 235F53030F63
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 15:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C833B42E9;
	Fri, 19 Jun 2026 15:41:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011029.outbound.protection.outlook.com [52.101.70.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57DF3B3894;
	Fri, 19 Jun 2026 15:41:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883689; cv=fail; b=cMbPPPz1reVSxf9yIBIKR3Ouz7mMo5ICnM4VwhHxGS/oFL7dIq0zwPdYgyrnNslTqtJ1rt2bTorsJ6fq2CUeQXI1U5OSWB2epJ/mqTkSh2oLCn19LzK910Vy8WX77mPbQurE9/rI95fXG0fzLNX8KmiHqHlmUCS+Yqt0Lf4Ykn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883689; c=relaxed/simple;
	bh=vy7kCgQ+N/eLcEZei4U9XXpEO1dXAIuOPcVmOJH3TKw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=U7D6AD40c5ZFs85t5qzb94Nu01QU/jtGr/JyazE7iykfOnJm4t+aP/tyjwMH4I5g/97B1gwxLRPVVqAzoyn4tpmb/AGBrOHECkxUD/ijhOh1t0ZIDUeq2cByKVrntV9chQ6mktk6Hy+MC0dxcxl9KT2rY4JYPARoQ/eoHZvTmnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MlBOj/VU; arc=fail smtp.client-ip=52.101.70.29
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9RcYXX8MH9bMxmo2Cc5KioRjQuIoKgu3u9snWgB6kjR/iBUNcWpag1yGrc+I2ec0R+8MzczI67Mz2LD5hW3MnwCJir0bBNrpFFVQhIwRaSc1bI6+0WUSFyx0ZuGaP2MFdFTSzlBi5ffyJC6yHhLOxF66KY04iNSBteJiOTfMbnu8gO7y7+Hn1ojJZLBDo2hRor2GF2LG3Vfa6Il548ITaQ1/4SACbdK+CF6RHTXpLiqrpz60Ungdar63Nhnl6n4Ruh3HxfxE0RH1x0qYJnNb5OvNJH3uFabmF5QH5Hba06JuRMhFcPDrPxsvGpcWNboAKEhSh+PJtdh5kAkk9Jekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuAK7DcUh2/5Xvpz7tMfepZg9bbL6VpHDu1cZTdhkhk=;
 b=fyYY0pnw1zPJZiGi2+Z1HbDATMZ9w3e9/TSM21VO8W4HXeN/rj61WAnKegw/R6Ugm9Nbnmb5MjXzj4wiOM++i9yw5HM410Po8gV9yrEKT3741gZK+r1E1IkMkt22DA2U4F+MJpEwrtKtLJbtbaYSY08rLwdIvd2+6EIE4LcnFKI/yxf7o3nMXu7DdBh8VAfnyG9IWbrvcEoWFcvN2JL8n534g1v3CSDL7/wxSZTGItOq/VmZbgTq7IAmsQlL2n4PHhmCri7dLQy3pP3KpPtwA2nqOvBqe7D/gcGifm7VwbBAzIyzvuufG7QYnCrIa2Fd5gs1U7ERmqsgFcrA/kMQCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuAK7DcUh2/5Xvpz7tMfepZg9bbL6VpHDu1cZTdhkhk=;
 b=MlBOj/VUOSF3RJlvL9BRLCDc4INfz2AUPvlQefavQkpV5prfD9zTEzU/CTw6xcrf23y3YNcQ27Sz65bw7LNus+YNxSJBb+vgJXckGjHL+cpmsUB7dlMygge/mNQUwlVzJOXj43fVWmKg8XTvNcjogjuKYMvt9FhOaV7uqiOL4fx6pTavBchR/NUWfOPOZZC2KECKPGZyDcYHo4it7Fa0syh+zdNf8k60gYXiGIkR2vHfj0nm+37iSd03OgA7WHWmgS/7Jz4N9AUXi/eC9JGlbNVwao0TgufuTKzVOUU28L3elELzY6nn4YbXdttNO3EavSoYdDw70yPHLv7R2OtiQg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11550.eurprd04.prod.outlook.com (2603:10a6:102:50b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 15:41:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 15:41:24 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 19 Jun 2026 11:40:58 -0400
Subject: [PATCH 01/11] ARM: dts: vf610m4: Remove NOMMU platform support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-dts_cleanup_arm_mcore-v1-1-0101795a2662@nxp.com>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
To: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781883675; l=8118;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=9PEWFeenKOyS/pM6K1VMTPM2nnNefndAUaV/jyyMfYc=;
 b=n/u+rns477CAo4jvkRGeJD0adFZhxb1Oi8h0GeUGhEYYzTkWepioWNsl78wiIploZdNUsQZAZ
 lnwJzNeZz5ZBID6teSI/uaeltGd5m4l+bp5G9TF+qnqCENEPAlchvE/
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11550:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e555638-02ab-4f9c-436b-08dece193821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|3023799007|11063799006|5023799004|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	9zhtt0Cqs6t182p0OCyINTw6ky3M6OuB4yqlveONJcfpKUUVqZ7bhn/ifFnT/PYdE4lmC0hrLWsMVGU34XPoyCfwobOCnf5f70RlPQPeIH7p3/vp8p4cQO8XE6zfrCC+hcS3dESK/8jTmok30V3Kwyo8uxS15FBlPN59DhIYFbb92cVgEm9ihfQz6pbmaZejsZeeI9n0i3M9ZiMIwLYmtfXIECPbR62NarVrBw+Qv3rqQIiJHcv2mujzT8XdoRrW5fR2bwfBTxlQlg+eW16RmM/9sFluPZtvPwbNqun9z+Bz0xcnRHsLpXBX+Y9OWnuulCrM1ppNKp/wYGbLKsX4F/ryqfe/5KD4jZ2M/E8ZJ31sJrQFL8Gq7ydcPkyk7ekGRGxEN+kG5AXxlAY28R7EvgwADEASRQrMFHbuA8VTFpi+xKWTucUl9yKi+rzh0Fp3j357qYxd6G9rzlpBrp844JvNXG1/Zk18ryqCnXI1i/s1H29mPEBPdUgL2kKV/k1DumIIdsez3v+tsoTB24sUuLd09E6V6/z0q7u9s+G9TyyT4HccGPYcYVTeiTKKwiyNI2xa/xe/hvmYTlf6GFAG81erdxBUEqAeQhTN/3BxQ2JX1ZQ4FYJmI5Nf8oa/Z4iQX2/jqrx+eg8VSAxGh+rvPydpGKU01mQZgK+ed0QCMU4ASVyHnhAevbl8zbiORyiiuYYT31rVHOiyltO4/yrRQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(3023799007)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ektGbFBLaHdGY1FPbjVoNUZKU25odTV2ZVI5bXY1TnJHZ0txNVg4eGdaTVlL?=
 =?utf-8?B?QWt6YVpXVFlPa1owMkhyWkRhSXlKZVVIZEYzcDRoTHNVcElISFd5cXhsM0Zo?=
 =?utf-8?B?cS9QazFBYm00NkJHWEFVckhpcDBnTEQ4OHpuSDNieXRMVEIvbGJxRWp4Y2hT?=
 =?utf-8?B?UXFCQUlZbnpXMFF5OWNLelI0VkQyWFVYVGUzWm1nc3B6V2tyN0xnM2UvQk1s?=
 =?utf-8?B?am5hU0huUFI4clVabzFtTVY4VkNaSU9TaEM2SUE5RlVXZjN6c3p2N0Y2K01s?=
 =?utf-8?B?S1dYc2tadWZkQm43U3JLWjduWVZvOTVkb2FUWjZTclZwRmJYeG9odGFDVUxM?=
 =?utf-8?B?VUtDM0dlVDlONkh3WmxDL0pxVXlFSUcxRVdCcVJKYmFyUGhiODdBbVNhTmdx?=
 =?utf-8?B?MzBGTGJTOFljMzRhZk9HSnFQSVVIcUttMklFNmZ1YnVaMGM5M09sMjZUMFFi?=
 =?utf-8?B?RklRSHNlOVB0Q0lOajNyVEVHTmFjRzVBTll2aHpqc0pYMVpYR1Q5UU1hM05p?=
 =?utf-8?B?STRNTHUyajJIb3U5dWVPcDlpWS9Ra2VNeW9VdmsyRVFuczFFbmQrR0tTSVJk?=
 =?utf-8?B?RnBRSHpmWGxhK3NhZWNjN2xRQy9rdUJNQUtOZUh5R244L0xYV1FDamR5dkRX?=
 =?utf-8?B?aUJZdnphWk42dFYxaWNRSzd0bmJOWC92ZWhVQ09iMENTNDQwSUxnTkoxQU50?=
 =?utf-8?B?NFFhVjZSNzJMUiswQlQxWjY4UERYZHZNYXl1cWowd1RiTCt5bWdPaUp0L3Fh?=
 =?utf-8?B?c1IwR2N4dUpDMCtKMUFRRUhDZU4yUlAyQ0Z0RFdJbXF3N1hEbXkwUE9ZOFVr?=
 =?utf-8?B?L1loQ0lxV0RvOFNxWlk1MHVMWHJjSy96UkhDMG5CZmdON3M5MVNOZUIxTnpG?=
 =?utf-8?B?dVBnNkM3Wk9MTkcyN0tzOXFWcjc2QXVPcXJjREhQZkM3MFA0ZkI3RC91cVhB?=
 =?utf-8?B?cXNmNFNHUTZXQWtJN1lSRldqbVk1OGpJUkNhdGJuVkhrY3JBSjErcXZUN25r?=
 =?utf-8?B?VEVNbENmdzJoZzAvSmQrNld4YTZmWUgzTnAxZzVxYUNLT2sybjdJWnI3azk3?=
 =?utf-8?B?MWZFWmEvQmFhQTErT29kNURUbFdTQWp1TTBwSkFoR24xNlpoMHRiMmxUd3o1?=
 =?utf-8?B?cjNuYXVpa1JxdW1OT1FQZ2ozNFJGOEtLbTNBU2xRUmdJa1dnSDVaVkVIU25W?=
 =?utf-8?B?bEtCOTFpalRxUmxQalNpa0pBWEk0Zm8xd3I4RkVJVEFXa2h6bnBMOEl5MWtt?=
 =?utf-8?B?U1BKT1VWZHpacmxYdlUxcVQrUlVMMXF1VjhEMVJWT2ZyaHNybytnQlRaQkcr?=
 =?utf-8?B?SE9salUyck1wbDZKcEhQNUQ2b0F5RWZ1LzZmbk1EbU1wUVh5czF0OTlxYTkw?=
 =?utf-8?B?NHJ2b1hQTmFaQStmTHZOY3VyMU8zRzBydVNNeVFuZXBKWnlRS0VzV1EwRjZu?=
 =?utf-8?B?Ujh6ZWNvT0VZdkVuSTJHcDNSN2haOGRJajNtc0p3RGFuNVZ0KzRXSnpXZUQ3?=
 =?utf-8?B?TEg2Z1dhNzFuT215V09TdW9mS3Jjd3ZmNjhub3dTRW1BVkJ5TXhyYlNJbjcz?=
 =?utf-8?B?VUhFT1VSZkxqZ2MyOHJLNEtJK0xlVUR4Y1oxdkJrR2ZsL09CV0FvUG0zQk1N?=
 =?utf-8?B?VE5EaWJXMXdDa25pc0xFbVR3SkUxRkQzWDl1aU5iTlkyaDJJZXpndXJleksx?=
 =?utf-8?B?OE1KdEpNMnp5RkMwUzJySUJlZnZTU1BhYlh5dzRDZmdFVVZzWkhYTFpVVjNX?=
 =?utf-8?B?WUJGUjJFeUYxdTY4dGZxTzZmYVA1cXZqYndJZTI1UCtQcG9VYTlqSmt5dUNz?=
 =?utf-8?B?VnBjREMzZ2s0bjBQbmNiczBZQ1lldTMxTTdEekxpWXJkOWR6M3FiU3NmM1Bk?=
 =?utf-8?B?R1pIVzczdnhUWHF6ZWZLd2J0YkRWVkFsMitpaW9RQWlJcEhRNGxNWGdmZDF2?=
 =?utf-8?B?ZVN3ckFFeWVIc1JmMHp4WDNFcTljaUNCM3QySTNvb2xyQnF3RVU1TnZ4cXE4?=
 =?utf-8?B?Y0VaQXIxQWJ6WFV6K29LQi83UkM1eGRWMG9LN0FQN2VxZ1dqVkNTME04ZnNF?=
 =?utf-8?B?Njd1dHRXTmdaUXdPNU1NMUxqemQwOGgzZVFSZHZ3R09JTzNuenpGd3ZaKzJJ?=
 =?utf-8?B?Q1orS3oxME4xK2V2bEFqWjRlUC9hUG9XbjlJR3pxbDd4QkRPcXV5RFFxZ1p5?=
 =?utf-8?B?YkdhcDBhT3l2OUtuMVVvcU4zalB2bUZkNGNWSEF2eHRubmhyVDkrSlp5N2ZK?=
 =?utf-8?B?b2NRV0cxNXpnSXlEM0ZveG94UzM1cTd4NXN1N200S1hLcjdmNmRPbGxvdHJ4?=
 =?utf-8?B?QjBtVXBnUFpEak85dnlHZFF6NDdMVGpkc2Z6cWJXOWN6ZVBqMkhxdG56dHhL?=
 =?utf-8?Q?1vtfRDs8tGDwIcIaLRsSJsA2FhtfeICibOeCt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e555638-02ab-4f9c-436b-08dece193821
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:41:24.7255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nvBQOjjMPM68os9z8BzPNPNU0d5dB6A85kmi8K2046i0RIZpY78vEHuDTcziQMqKM+6Cn4h7C+IOMJM4HsxbEVP0dn5k73//B3xHQy6PfprsV1dMXeoB+iduvNyEpGR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11550
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:stefan@agner.ch,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:s32@nxp.com,m:linusw@kernel.org,m:vz@mleia.com,m:piotr.wojtaszczyk@timesys.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:Frank.Li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38714-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_TO(0.00)[arndb.de,pengutronix.de,agner.ch,gmail.com,kernel.org,armlinux.org.uk,nxp.com,baylibre.com,redhat.com,mleia.com,timesys.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,vger.kernel.org:from_smtp,nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58CA96A6C58

From: Frank Li <Frank.Li@nxp.com>

The Vybrid M4 NOMMU platform support was added as a proof-of-concept and
has not seen practical use in production systems.

Commercial users and hardware vendors migrated to Zephyr or other RTOS
solutions years ago, leaving the NOMMU platform support effectively
unused and unmaintained.

Remove the obsolete support to reduce maintenance burden and simplify the
code.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Cc: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/nxp/vf/Makefile            |  2 -
 arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts | 61 -------------------
 arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts  | 88 ----------------------------
 arch/arm/boot/dts/nxp/vf/vf610m4.dtsi        | 61 -------------------
 4 files changed, 212 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/vf/Makefile b/arch/arm/boot/dts/nxp/vf/Makefile
index 0a4a7f9dd43e4..1733506c0c725 100644
--- a/arch/arm/boot/dts/nxp/vf/Makefile
+++ b/arch/arm/boot/dts/nxp/vf/Makefile
@@ -3,9 +3,7 @@ dtb-$(CONFIG_SOC_VF610) += \
 	vf500-colibri-eval-v3.dtb \
 	vf610-bk4.dtb \
 	vf610-colibri-eval-v3.dtb \
-	vf610m4-colibri.dtb \
 	vf610-cosmic.dtb \
-	vf610m4-cosmic.dtb \
 	vf610-twr.dtb \
 	vf610-zii-cfu1.dtb \
 	vf610-zii-dev-rev-b.dtb \
diff --git a/arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts b/arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts
deleted file mode 100644
index 86d32f54c250f..0000000000000
--- a/arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR MIT
-/*
- * Device tree for Colibri VF61 Cortex-M4 support
- *
- * Copyright (C) 2015 Stefan Agner
- */
-
-/dts-v1/;
-#include "vf610m4.dtsi"
-
-/ {
-	model = "VF610 Cortex-M4";
-	compatible = "fsl,vf610m4";
-
-	chosen {
-		bootargs = "clk_ignore_unused init=/linuxrc rw";
-		stdout-path = "serial2:115200";
-	};
-
-	memory@8c000000 {
-		device_type = "memory";
-		reg = <0x8c000000 0x3000000>;
-	};
-};
-
-&gpio0 {
-	status = "disabled";
-};
-
-&gpio1 {
-	status = "disabled";
-};
-
-&gpio2 {
-	status = "disabled";
-};
-
-&gpio3 {
-	status = "disabled";
-};
-
-&gpio4 {
-	status = "disabled";
-};
-
-&uart2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
-	status = "okay";
-};
-
-&iomuxc {
-	pinctrl_uart2: uart2grp {
-		fsl,pins = <
-			VF610_PAD_PTD0__UART2_TX		0x21a2
-			VF610_PAD_PTD1__UART2_RX		0x21a1
-			VF610_PAD_PTD2__UART2_RTS		0x21a2
-			VF610_PAD_PTD3__UART2_CTS		0x21a1
-		>;
-	};
-};
diff --git a/arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts b/arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts
deleted file mode 100644
index 454b484368cb7..0000000000000
--- a/arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts
+++ /dev/null
@@ -1,88 +0,0 @@
-/*
- * Device tree for Cosmic+ VF6xx Cortex-M4 support
- *
- * Copyright (C) 2015
- *
- * Based on vf610m4 Colibri
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-/dts-v1/;
-#include "vf610m4.dtsi"
-
-/ {
-	model = "VF610 Cortex-M4";
-	compatible = "fsl,vf610m4";
-};
-
-&gpio0 {
-	status = "disabled";
-};
-
-&gpio1 {
-	status = "disabled";
-};
-
-&gpio2 {
-	status = "disabled";
-};
-
-&gpio3 {
-	status = "disabled";
-};
-
-&gpio4 {
-	status = "disabled";
-};
-
-&uart3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart3>;
-	status = "okay";
-};
-
-&iomuxc {
-	pinctrl_uart3: uart3grp {
-		fsl,pins = <
-			VF610_PAD_PTA20__UART3_TX		0x21a2
-			VF610_PAD_PTA21__UART3_RX		0x21a1
-		>;
-	};
-};
diff --git a/arch/arm/boot/dts/nxp/vf/vf610m4.dtsi b/arch/arm/boot/dts/nxp/vf/vf610m4.dtsi
deleted file mode 100644
index 648d219e1d0ed..0000000000000
--- a/arch/arm/boot/dts/nxp/vf/vf610m4.dtsi
+++ /dev/null
@@ -1,61 +0,0 @@
-/*
- * Device tree for VF6xx Cortex-M4 support
- *
- * Copyright (C) 2015 Stefan Agner
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#include "../../armv7-m.dtsi"
-#include "vfxxx.dtsi"
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	chosen { };
-	aliases { };
-};
-
-&mscm_ir {
-	interrupt-parent = <&nvic>;
-};
-
-&nvic {
-	arm,num-irq-priority-bits = <4>;
-};

-- 
2.43.0


