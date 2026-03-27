Return-Path: <linux-gpio+bounces-34330-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFdiDob4xmlwQwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34330-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:37:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EF734BC32
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B2F8307A566
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 21:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0336A39E6FC;
	Fri, 27 Mar 2026 21:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C/rl0NsG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E9139E196;
	Fri, 27 Mar 2026 21:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647269; cv=fail; b=klZrobN08TdD3B0kiy+WxPdMA8O/+IEa5R0DzfZaQ5LyCGLFv+arLMlTH4J4RrtLvF9yJJOR8Sdl5IWGbHZe+2N1E6+8kgJpAbbbanQm4abD6wkPy9G8wyWUeZo61lDOhySQnt+Hwn04XPevPGvqu/lORdXGoq+utwXlxeXw0Lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647269; c=relaxed/simple;
	bh=0ZyVR7Ew+8FME46WeOTKzZa52qmd5gLcnJhFdFuN+5s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aUOJPPH14FZHLmAdf02Bsg92aBSwAR3h9+CnzcrLesG+h4Q2CfcKgCkx/CuKtK1CuX2pOQUSi374nJfekgmrG6UcclgJfW3vQFt3mxPQlMNXFJtHRgGiRF8em6sZhTuL2H5pzB/mkbEcW7DAkZPnpT+h1djCSvB4ENytH32tIxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C/rl0NsG; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYmsjbWYHHVvGnUirMT004ALFJin8dcbyl7BRLSlVkhO27wS/u6LnWD7mj4H9Ngt1FFkLsem16yZuU+gNZGgdOrMc/c+UnZUp8uFsO0m7eGo0vosvEcTcXztbuIZND5xI8nDrJDjUL+yevEjmVxj3q6vqnmAk/hbwmPOsXoF8qZ2ll1FtyQd2wZUInN419vA5CYeTn482beNaac5SxsXcLsNEuDeicyb1R0eQPVTOfuOkITRkeenW5/eRCnwZiYceOkTGVxR2YZa7PJcoExHPDnezV0FgC+wltQucQ68wpylYqOGcgBR+wCx6Xuha4eP9sZd3Z8hfU5bKRZzNvzuWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrrVM+j+cGadW4s/MJcZpCgs/Z76Y+uI11BU37xJ5ro=;
 b=Y7RqQ6keT1RioIqyy1e2phzu0qAb0cA4U8BrWjWi1XKs0Gm0dkmO1+DBmPwGdIunNEXESvzHe51v5wks9ZbGpaoFHOefodDkzo8vPaNlZ8vg/8RY1DNfvLyxGSlida8P1qwGR99YFXwoVGeQMYWDxkXKZjzRiwOOo48lQX/Pdn0yg3NBFEBJEjn2eTHflrJcR1nqtmX7QxFB7vCdl+xTSDWEFVgStTXanf7SmT1aCH+Aqt2MObPRxkK2/Wwx/0eVdV3E/OszK5q6o01S1XOUiNk3zGUY0hSSDDY4CRzcoA1EvKSZi/NI0ShxekDdI9I2ic/hKCz17P1LlOqr+2LfbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrrVM+j+cGadW4s/MJcZpCgs/Z76Y+uI11BU37xJ5ro=;
 b=C/rl0NsGx+v5N8DWWzWBh0PtSBB6/OGv9wrY1I6ZaaZx2kd5qmpRc6eDDyxaNBh6jnsgJXdfnT0f2j2nkUEqFbOcAoa8pEUCrijtjJd7fNjvQ5qJ4VyhKcNgUX0jbUiUflaeUjEeyF1rZbUgntxBxNVdrzYO1J2tQ67PrKM9/MEIRRTQVY9WwflTzxZqs7SPq812QidOOaEiLAaaJw5fgAe6w4LLXo3aoTwcdQ57CIg3jQ9SMiwUJ2FvB3fMVwHTT4s9tebqY4t5UFT6TdqG709M6OMR64hL5E1rVd65wtjkYKMVWcmm1aJf56Iuxo7Lk9ZHZMAhb1HIqjHW6kWuxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8668.eurprd04.prod.outlook.com (2603:10a6:20b:43f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 21:34:25 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 21:34:25 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 27 Mar 2026 17:34:00 -0400
Subject: [PATCH v5 3/7] pinctrl: extract pinctrl_generic_to_map() from
 pinctrl_generic_pins_function_dt_node_to_map()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-pinctrl-mux-v5-3-d4aec9d62c62@nxp.com>
References: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
In-Reply-To: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774647254; l=6512;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=0ZyVR7Ew+8FME46WeOTKzZa52qmd5gLcnJhFdFuN+5s=;
 b=wwC73dWs3eIpSolXqDXA5Kk9HghxPneCkXMsCUEdfQPSsE87Rk/SPCw9RG4KG6w8QLMCEANUC
 ZPotpA5umLXCbzwBJwvpv6OwNaFn4WdEbUO28RSxc+xN6ZWCy+rNWXC
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0182.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: b77ac431-2f2a-443c-ebf5-08de8c489e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8L5+BywlKp629wt7fnv8onl6pl/l9NKkyZG/wuSqKA7A0gguQAvtQrCMZP2hKdvs92RoJz6eBdGVwFfznTUe9cPFAOC5IvXhx6jgI+j5Y1pqchOHd4WofXEUbm7qLZwELaByhQJ4uNYATHIECooumzeYN1X9X4Gc8jdzRRZUBiI1kbX+BSzbHLQ6xK7ckzTeB9tWfpfxWiZuFy2QBAOs7dARXW17sKnwHQWyBipY62i2grwWeM8KjkZ3XDj6NTlFvVAvdOCHmY4GKK0pJaG9rQ2TWFRueShQai/BhvAbjg+jGkhFf2vB24wAEyhBCxAUai6Yekqu3/YhZwVZkbPuk3VXEY9XzI1gYWHMTpOxFuYl+hPTeSENnMLVexSrlZZLyD92UewIMCwg/+HswvPOTn+MGFzuGp9RG+gJnxXTfL1uJmV6GIQl8rTrqAsDQ5CmDJ7Tl2MCM5x76+EXzvIesF+LI/0SVSR2DMClbOWV6Te0p3ofc8Ss9UKsXsRK+HI9dukhhnGzJOFKfEYiLo76nNa+e6BLVFfh2dXI3Dz/Z/arodRFBhAHVqtd8Kcy/dOrTge1WvdY2lvrJjNqrW2uTPyEcC06uUoXOWO3TU/YysBAS0g/KmVtThYMebSJ7/3acclI5X5IAqsdsJ8KLvS6K/DJPz+pmP5/zqCAoE4mUaYb4hmgG1zmz/aSS8kvstP8G5GDZUu875AEjv6TcAz8/4wY3IzcKP3+Kfu9tnjZ5Roow+ySVXNLb8MJKPIatp0nI/1o6wiRgEm0NxX0DUhof3XsHxYN+W/lvKqjRG2aMrs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFc2c3lQQUt5ekxEc3B5VWlsUDN2d3BDMWh3YnNCQmxoaU93ZmxXMGtSNnoy?=
 =?utf-8?B?ZCtkQ0pWeHZhRFZoWHpUakZKdkNmZzFLbUtaclJPdnZUaE9OTHNvOC9EOURw?=
 =?utf-8?B?dHJBcytzb09yRmhHM0NtaXNsM0ZydTFuY1hZZTcwS0JBMWsrd1N2TUtEd3pj?=
 =?utf-8?B?Vm9uUUdmTU84YUdsRGR5TU40bk9FaUlYZGlaeVRvcGJDVGFpbFRYZkZ1Z2E3?=
 =?utf-8?B?TjQ4SkFWUCtybXd4ZUY3ay9YN212eHBSUFBtNkI1NzFkb0RDajEvaUdkSHYr?=
 =?utf-8?B?WDkxdi9USDZpZkg3aldFdVk0NHgyZElqelozV0JzdlBoWVJhNUZIZ0hDblVs?=
 =?utf-8?B?OTM4OHRvQXd0Tk5tazJsVUorTStKa29NOUNSV0pMSy9lRTNTM0FUeG9GMmMz?=
 =?utf-8?B?d2NTR1ZNSmV0VVhXT2FuVE1ERTFkald1VnhDN0xIQ2J0akdPWUk0cHpRM1JY?=
 =?utf-8?B?cUlTYm14WUxDQmRROEFpVk41NEV3M2ZNQUpkQ2pUQXQvREF4dnFLbCtHNDFO?=
 =?utf-8?B?ekVNeE1MVUJBT0NXdFg2M1BTclp5SmlPOGo2L0h5dmZ6b29Ea1U0YW5INEtD?=
 =?utf-8?B?OWM2azNWcDBjOVVJVzIyb21EZ3lyN0VHbVUyVDlQdjVZeHNLNytUNi82Ukd2?=
 =?utf-8?B?cUhDeFg5M0Zzd0RJQjJiRW16U0VwTm5rR2ZaZFpvRkU4ZHZCUS9jMUloRjcw?=
 =?utf-8?B?R2p2c2luY0xwd1F1am9vYUZnRGZpQ2Vpa0JoOVMrRDBpWG1XQk9mejNmRGd5?=
 =?utf-8?B?WGhkTFl0UW9CWE9xTFZkK2hSQWx6OUJ4TlhlR3pYWkJwQjFkeHpDYkZ3a1Fy?=
 =?utf-8?B?cVYxTlBzK0NqcFFWZ2M4R0xheDZnaGtzdFFVRTlxNlhUbVpUT3BoTktMbGZv?=
 =?utf-8?B?d1AyakNZMnVCSkIxeDRVRlhRRGhET21Pbm1XQmFVdFBidkFyZmRBNjhQZlY2?=
 =?utf-8?B?MnMrYUp3R3JNaTJQdm9jY2RtYktWN1pwdVFJY0NiYVAveXFRRDVUQVBVaklJ?=
 =?utf-8?B?VXpuU1hjMjVFQTBaTWxyb0hCWlMvNmRrcGt4L3MxbGd2Wm8yRDcwN0hRWlB6?=
 =?utf-8?B?ZXhFMzh2ZE5Qck1tYUd6Y0dpYU1kQ3VYWkJUcDNReTArc3d2THovVFBRcDFo?=
 =?utf-8?B?bWFUMnowYlNVRm5VS3NuVzF6Q3M2V3lGRDdDTXZzMDFBdFJ5cytCekxHcUVy?=
 =?utf-8?B?RjlXeGtKWE0wTnYzUGhZU0NWdHcxTUpkZGEzRWFqejJ1WnQ1eFBkRDhXTHVP?=
 =?utf-8?B?SjZUM2doazJUWHRQS21ZN0tGVEFJc0ozcmMzTmdFS0pleGFHcTVXTnJVN1hp?=
 =?utf-8?B?bmRiOFlxN1ZERnNoNUdFV1RTcTZhVXpQTHRSY2V3eUJucEJDWjRyTWpQUUhF?=
 =?utf-8?B?VTErcGN2V2ZscTMzY2xGUVJ3Y1R0TDRMdWllWkxrOUdTQThFNXZ5Sk9kd2ZW?=
 =?utf-8?B?SGFkUlQzR3VpblRqbkFBUEQ2K1VudGIwRmJ5NW1USkkrZVE0TGRJYm52WFRD?=
 =?utf-8?B?NlB4WEFmbTVkOEFVdG1VdGpmMkR4eUFKd2dlS2NQQ0lGb05GVDdnelFSWFZn?=
 =?utf-8?B?TWNTL2hBRUZZMEwxa2ZEaFZ6YTdReG5iak1PZUFZK1FjOU13dS91UVVncW5D?=
 =?utf-8?B?NXYxZG9LNUFYZXpJWFNVVUMxaUlEL2pSTVQ4ZXB6TUlJc0ZqSmZXa1hmckVT?=
 =?utf-8?B?UWJLV2pYbWZtTDJDWndBdzFZbWg1a1R5NTRtQ2plYzdqVkQwL29INyszQy84?=
 =?utf-8?B?MVRpQUFUR1VjRkFLN0J1RjJzbEN2TnBrTGEyS0tmMGxERndsTHNNQjRBdFFY?=
 =?utf-8?B?M1dpV08zZ3VYTitUdE5WRkIyQ3cxNWhXSWY2RWZ3UnhqOEM1bVd3Vng3NGdi?=
 =?utf-8?B?enZVTGRPR09mcmxmOG9laXlaWXRLc2toY24xOWk1V3NkVUtaQ2wvUnhRNTlr?=
 =?utf-8?B?OGJyeDhoTk9JckZTbWRNeVlxK1ppYU1MendyNUZRb3VSa2Zxcmx5YngwZ2JZ?=
 =?utf-8?B?bFowY0haU1ZWR3djNjNEZEd3Y1ROTVo4elFiOWNsNXZCZE9FM3NFNDRlZFNy?=
 =?utf-8?B?b1c2K1lxSUgvVEp3L2o1NnFvZUpTbm1Fakd4b2llWGFOcUw1eDdKTmhORW1x?=
 =?utf-8?B?T1F2VkhUTXdnVlFTZGltRTF1Yi9VVWNENzBaT3NWdzRQOGZnUUo0ajFzMVVE?=
 =?utf-8?B?STlkUVFXbWRLZE1Md2x3TmxwaWpRMGU5d2M4NG9UR0JPRFNoc21kcytnSnVv?=
 =?utf-8?B?SHpTUUhNNXBqVTU3RHZHVkh5a0ZRcU9xN1cvNXRXV25kQ1pFLzhlaFRXZFU0?=
 =?utf-8?Q?nBOY9lsylNSAbJEe47?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77ac431-2f2a-443c-ebf5-08de8c489e43
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:34:25.5369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/0twQpxCLKryaAHxWMOqHbZnyC9BVVtUbvHvgSeFUY+Aqg+QIN64RBofZ51JZvSD/u40myT9W95dXww1FC36A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8668
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34330-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: D2EF734BC32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v5
- add npins in pinctrl_generic_to_map();
- remove below line in pinctrl_generic_to_map();
pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);

change in v4
- new patch
---
 drivers/pinctrl/pinconf.h         | 18 ++++++++
 drivers/pinctrl/pinctrl-generic.c | 94 +++++++++++++++++++++++----------------
 2 files changed, 73 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 2880adef476e68950ffdd540ea42cdee6a16ec27..67044dff61e4c2b2ccc0c10524b442d17f3ec42f 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -166,6 +166,13 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
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
@@ -175,4 +182,15 @@ pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
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
index efb39c6a670331775855efdc8566102b5c6202ef..76670aef62da47ede2901f5af6199dcd2896d894 100644
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
@@ -103,6 +72,53 @@ static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *p
 	return 0;
 };
 
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
+
 /*
  * For platforms that do not define groups or functions in the driver, but
  * instead use the devicetree to describe them. This function will, unlike

-- 
2.43.0


