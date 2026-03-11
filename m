Return-Path: <linux-gpio+bounces-33175-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFyrCDC+sWkwFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33175-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:10:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D0126917D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 180DE31DAB13
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F210366DCC;
	Wed, 11 Mar 2026 19:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WYi7FY5a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013007.outbound.protection.outlook.com [40.107.162.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A47034D902;
	Wed, 11 Mar 2026 19:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256124; cv=fail; b=uPnDnGCBLpBfzdSJGkNT2QO6/lcpy5BkV3WzHD4yuzUhQ9xkfRvXcsmtzSCpWgXsMbru7uxChcWGf0TIUuKka09juN0spnigruUPKxS4BHy8QY0EoqZKtOqV034Lqo0GXEPcGSzvCELqWrw1TCwxRE3iy3cAzXXZTOcs31JqnI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256124; c=relaxed/simple;
	bh=vjbLzGslWzSxbm7BiX+wif21PWmKdT+U/EuvEJBLww4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AIiqWEFkOfRaUIb3v7DgNwF1Nx5YO+hskHJLH8ndaIiv35NjJWrNwA/1s/bA5LlGLV/loTGA0bWxjA/cUzgBA3n+sl7WJY+boZljWZo7liwrgY8PqdMCjpURic0XJbCXS7QgkhYOIvDxdsXvzL567zlKoB0Vx3qPy6ZwTur1Ev8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WYi7FY5a; arc=fail smtp.client-ip=40.107.162.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H42tsae4lYYrHMYX+Inz//+EmCZsJflyq3v6vWQD2BydWbNHf9j7Y19nalmSbkdJ2yjn2Dry51LSVjtbBTbA8Jw4PReWQQ+mjJc58xvra50N0eXSLMq4bMO4bcIcI6u4QtMXaNjNTPjkmyXe6EcdzE00pZhRCwDTKBezCbSVWewG3Gyoi6Z3mYSz2tp8S5r1+QA4opbNT3tDjvYk2YWWw+13WYNkOmXV/zQIyS4TKsfPBKagmxhpo0KWv6rh/gUNODOcY+V787kw7cSqh2jRetJcaUJI89Iu3gZOuR6uejKyGgkPS8DpFwdpK/WiqCeUdu/1Y8Xa77xBYIwJjsyrkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1yXWbDmXdPjJwPwPVlTVCKLgYxMMU0PDG31XHdsy8M=;
 b=oCkjkVaiP8k5ZC0YZ/xfEQn1fBuBAY0NsneCDxxewrijun1Y+M1SKIET3sEDd8kSOLSIu5R1q7byI8gGHt0+W3OEFu71fvzEO4M7Mf7t2cSwUqHcszeUbo9KgXXNCkV8Q1Ii6m5RVbVK/g3UGNkde6ymG3CTi4vDFiHcTrZpqVgIagxhiapX8WD85R+sPoUMqGnDzK/oh2n1cBmCFSkkusooxVfribaI9M6hpHGpWAhyQn3qaNMsGZRLDE0Lf/IgmQNQIGT6lghUwP9BKMUwfrlOwA6/SZi7bOOT6BmeecfpCFbJZVQwsMiIEBHrQ2UU8Tmz6JJQcByRjFtsudntzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1yXWbDmXdPjJwPwPVlTVCKLgYxMMU0PDG31XHdsy8M=;
 b=WYi7FY5acp9Iut8qSar0PwqmZjx54Y7QdfH4Rg5c3HAsK6l8L5WRR4Q89DBdxZp6sjqMB1x5y7rv/XUOwioZaGedZRG4oronQJXeQlPyxaCU/vmjRigWv/3F7aZiN+RRrY1PNpaadrPNcNe9aIAI4d2bp7zo0hEtD4+o2beUJ7gxnNjKqu7/X5Kv989GT1pcyepB4SCm8zAge8HAgTzqdSNqMR6UFHa3e+3CP3z56SMQpaiQjmch8vhRrhKrUGAxDSfrdcU1Ze5ocAm/i9+u26ZvTFlYzXd7sv3sUVKvetVDqXb21gZXpbKr14X2shw/6xnxq4lsiiml63gY+L7DnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 19:08:37 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 19:08:38 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Mar 2026 15:08:14 -0400
Subject: [PATCH v3 5/7] pinctrl: add generic board-level pinctrl driver
 using mux framework
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-pinctrl-mux-v3-5-236b1c17bf9b@nxp.com>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
In-Reply-To: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773256101; l=7467;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=vjbLzGslWzSxbm7BiX+wif21PWmKdT+U/EuvEJBLww4=;
 b=23cFUz1Ewsczt/vOBQ2l8BIJSOKD83ggf7Je/Csw+wkHeMb03BgQlAzHQKFFumVv8vXk4Lkzm
 8Okk8eOSAOrDbKeaawfxm9u2EGOwTQsXAfZm38vuMVsKbLybo8wpFBy
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: 626e7f5c-4c31-4bf5-94c5-08de7fa199ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lv8y2Ec066XxQYTxPzu6fAjalNNlp4sctoa1uumfoWMFec8oQ6e1zpn3H7VN+R39fWqY30na0hIClkKdqdpAUjioJZKpbN2g6wI1IuHGhqHGNxIO1RPVtBGK/CsMZA6dNcwYxFyfEkA0s+KuLzInzcScpD+5UjXJSyCOOHuTOVw7VufxHPgXkow0xOXIHuv1Wdd5WeIHMtMLN6NcPfxjpTKLx049xP2nQCRF4bnYWZg6q6FfDbOR57kuD6ADD/p3m4FgHaYp1iVxp2JRTau9tx+57KD+/uOI0KwslISrgtU/hbS+InQO84l25zbmeE3W+jrUlFwMCr9x6Ck5p2RnD7TbGZbhX1Uzi18rYslTsv+qaF8O+oJ0yznPfBAfI92QceHcmws+iEpq++hTTvbwhKK6CuOhlqrPhaUMAB+5tLcddfXSe632iQN6DbxoyYE63VzQY9+VHOg8ffaNxs0cwDygV04A8xu6H+F46OSDJYSpAB+BVckeGysxr0ZMldFsdeCh0BwCNEZeIKcs8NEOjunvSluTPxVdD2/9cBHsjoom9kuO6tZPn8aRLXcx6QdtepFBOqyOccoi4oaLlCykmbsSAHRbRoq6R8UjCozbgKuQ/hTwdfunmb7GP4dxZdsIGdeixew9q8e9ExSzbepGK/VY9BWUuqybJyhYMsJ4qt/kgYhVYfBFkN+fVUxSVFF4sWxyysju/CCUYQbUkQRhMidD2rtPccIr4h7YmzedqIfAFd6jlJMr2nROd69NkJfRQZcU6pAUI8m624RUc/n7+ZXq6UrNqPQbolCcISImHH8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGJxWWtTTTRNSHByM3Z1UjVyeGdJNVBYbHhOV3drN2lyZzQ4NUt2T0x1bzVO?=
 =?utf-8?B?dURmakh2WSszSFFYN0k0UTFvdjdsVytFM2dlbDdyNDJWUm5QcERRVHE4bnFM?=
 =?utf-8?B?WjA3SDlZbmtXR0NLZE5xaU9kQlpUclRnZHpWM002V05JMHIrNWE2RHUrRGpB?=
 =?utf-8?B?Zy9rbjJBc2kxNGJXcWJoRXMxZTllWXZMOXpuSTBGVWd4WHBKU0ZsMUh3UHNs?=
 =?utf-8?B?MlZQMDRWWlUwaXJTNjhkT2VNelNQVi83N3lZL3BGcmVUSWVac0RxUXJjNExv?=
 =?utf-8?B?THovWTBGTk5MSnk5N3M3b3psaHRndFVvaXdVN1hnOUkwZnZ4cEVtMWxacFl5?=
 =?utf-8?B?bEU5WG5iQ3JTLzNwV2NGUTk0QVFuNW9ZZ1lMZUxBQTQyalBEakNLbk9pQmNk?=
 =?utf-8?B?dmMrUUxVUVlJVUpxU25WcVF4U1dha2laUFZiSU9vM1B5Z1picjFMMHFIRVZn?=
 =?utf-8?B?ZXJZa3pLc3lkZUhYQVB4TVZNZDNzZHE3aTl0cmdOS1NrYkpBSWs1MWlETDQw?=
 =?utf-8?B?NldQOE4xdDl3Y2svME9VQVZRUEdWVDlXOGx5TFg0MVVxOGU3VUtmNUVjaEhM?=
 =?utf-8?B?RVFYYmwwMy93ODNQZGtwWUNMNldEbmFyVkpsck5oSUdCUWx5U0pJVk1tVy9E?=
 =?utf-8?B?ZTJpVGFoREpZZ1lQWTlTMXI1OXZZQjVMZFk1S29QeGRQTEJaYmJ3YkxNQlZG?=
 =?utf-8?B?T21qRDc3R2lSZHp2dWtoVStWZUZTYkZET3RYMXEveWFxS1dMb1MzOEhtZFFT?=
 =?utf-8?B?MWM1WFUvZzJSalBMS2VTM3JVRmhvWGYvaGh5SFAzR0M4Q1gvT21hYklFU2VC?=
 =?utf-8?B?K05nZkdIQW9YRjZpZ2trNHpnb0ZrTXE3cmwxWE9GOVd3RzE1K2diMDNLNEZV?=
 =?utf-8?B?WVg4dms3S1gxVTZhc2pSblZiOXJ2UFRIZXU0YzNzY2ZxdUt2L2d5K3N6R2w5?=
 =?utf-8?B?MHRERjZzTDhCR0Z2a0Y4ejQ3NER3aGtqZWFuNGtJQ3NiYXJsNEIvV3pGM0hG?=
 =?utf-8?B?VEZLUTU5WERmOWtOSUxCbUcxOG9oQllHTzVsMXVvaHJZaFRuRXZDMjlzdGhz?=
 =?utf-8?B?RERacWVaa0c3TEpTU3Bkb2xXa3dIRnhiY2JoZXZMUk82NHRrdlRGSDE4L1lR?=
 =?utf-8?B?dXBkWGRyOWhTSE1jSU1VNG5CcnJoVkhNb0hhUmhqK01Tb01zVGR4OHYwUnVD?=
 =?utf-8?B?bFJoalpQOHdjeEhCSVlTVnZwS3JUekJxVzNSRlh0Z094SkllZ3JvWkdHQm9h?=
 =?utf-8?B?ZlN1end3Y1l1dlVQT1dUYXpZTnRPRDRyWTN1ak01NXJWbXFZL2N2d0lJem9o?=
 =?utf-8?B?NWptMVVxbFc1aU5Hc2lRbGFBRThVSjdLSHlzaVhYUy9qbnFwcnJ0UHEzUXRY?=
 =?utf-8?B?TzVXM1VXTE9JUVRLZFNDdURxRUM2YWJBVzZxbDZQS0tacUlMUnFHaDBrVSta?=
 =?utf-8?B?RWhVdDdlRk83STdwaDlvL1NaSmlKOFF1cHVzMisxWHo3d0ZBTk1RUkp4dlRC?=
 =?utf-8?B?cDBWUGEySmNKNU9TQlpMYnAyS2ZtR2hVU0lLTmx2VWtoTTJubEgxK2VJTHJy?=
 =?utf-8?B?dVJLc3pUS2ZGVVBubHVXN0ttT3Qza1drc3hlNTVJc3ozWWsxUFhBRnJzYStx?=
 =?utf-8?B?Z2wrM1N3NGt3ZnEraTNmRHVrcjlkZS83Z1lNMUN1QkppS1FVTzlWT3d0ZUhr?=
 =?utf-8?B?VXRvTkJNeXVtWk1ZUE1oOE5rY1NEVW4zUFA0V2Q3eGdYc1N1cmlYbmZJaldp?=
 =?utf-8?B?Ny8rWXhvSzRKRDFnR3o1dXluMHpxd1V1OGpDajJHOHZCN003Nmh5dzZGR3FY?=
 =?utf-8?B?K2Q0ejVmK1lFMEtxNVkzckFtLy9vOElJU3N2STg2S1F2SCtoTUlGRUVQQWxM?=
 =?utf-8?B?QkRGY3dIVGxReUFSeEVKN0dOUXQ3S3BBNVZuS2lnZkNzT2Rud3V6YVNUVXN0?=
 =?utf-8?B?WXp1eEhSV3VrRG5aellISkdpZ1ArNDM5VHNRMVpjcjROajArUUVHb21ZRGlS?=
 =?utf-8?B?UXNFeWxqMFgvTHBLVHlqUEFxaXZJemhENXBQRUVCdzlrSTdQOWxiWWY0UStY?=
 =?utf-8?B?S29xZEpJbW5sYUVZODFqQVFiOENxSGZ1c3dkZWMxZnVvcjFJZ0dEeTR5ZnRl?=
 =?utf-8?B?YzlhMkFYR0U2Ykp5bU5VVHNQUTIrTFQrZVJGS2lVV0FaNU90ZXc0ajdzT3RJ?=
 =?utf-8?B?U2s3Y3lMVlo2eUhNdG1VU3Jpcm0yZE03ZTN6b1hZSE9Ic0l6SWQvM1RBOVly?=
 =?utf-8?B?dmp1Ukd0cEU1RmFoZUJVbVNnWE5mSEg1OWNXdmFzKzh4c3lvdnVGSGUrc3U4?=
 =?utf-8?B?ZjNYUkdiTkhJOG5Ic3hDUEI5djY0YVZuSXUzQTFBdE5RZzBLQkFaZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 626e7f5c-4c31-4bf5-94c5-08de7fa199ff
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:08:38.4693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tSHFYcLSm+127dKqhfrSlG3Dz71x3BrOsHPglBhVlDBr1PjuYGG65L4ftwjtdW6og57pHQar9m3xi8GVBSSHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33175-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 75D0126917D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Many boards use on-board mux chips (often controlled by GPIOs from an I2C
expander) to switch shared signals between peripherals.

Add a generic pinctrl driver built on top of the mux framework to
centralize mux handling and avoid probe ordering issues. Keep board-level
routing out of individual drivers and supports boot-time only mux
selection.

Ensure correct probe ordering, especially when the GPIO expander is probed
later.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3:
- use pinctrl_generic_pins_function_dt_node_to_map() and
pinctrl_utils_free_map().

change in v2:
- fix copywrite by add nxp
- fix if (!*map) check
- add release_mux to call mux_state_deselect()
---
 drivers/pinctrl/Kconfig               |   9 ++
 drivers/pinctrl/Makefile              |   1 +
 drivers/pinctrl/pinctrl-generic-mux.c | 178 ++++++++++++++++++++++++++++++++++
 3 files changed, 188 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index afecd9407f5354f5b92223f8cd80d2f7a08f8e7d..b6d4755e67510786c34f890c5e7a3fcf0adf45e4 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -274,6 +274,15 @@ config PINCTRL_GEMINI
 	select GENERIC_PINCONF
 	select MFD_SYSCON
 
+config PINCTRL_GENERIC_MUX
+	tristate "Generic Pinctrl driver by using multiplexer"
+	depends on MULTIPLEXER
+	select PINMUX
+	select GENERIC_PINCTRL
+	help
+          Generic pinctrl driver by MULTIPLEXER framework to control on
+          board pin selection.
+
 config PINCTRL_INGENIC
 	bool "Pinctrl driver for the Ingenic JZ47xx SoCs"
 	default MACH_INGENIC
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c8becc0aa1d77c68b6ced924ea264..fcd1703440d24579636e8ddb6cbd83a0a982dfb7 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
 obj-$(CONFIG_PINCTRL_EP93XX)	+= pinctrl-ep93xx.o
 obj-$(CONFIG_PINCTRL_EYEQ5)	+= pinctrl-eyeq5.o
 obj-$(CONFIG_PINCTRL_GEMINI)	+= pinctrl-gemini.o
+obj-$(CONFIG_PINCTRL_GENERIC_MUX) += pinctrl-generic-mux.o
 obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
 obj-$(CONFIG_PINCTRL_K210)	+= pinctrl-k210.o
 obj-$(CONFIG_PINCTRL_K230)	+= pinctrl-k230.o
diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
new file mode 100644
index 0000000000000000000000000000000000000000..fd23b04e9bcdc008ee20bf0a35d6b0365dd2d2d9
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-generic-mux.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generic Pin Control Driver for Board-Level Mux Chips
+ * Copyright 2026 NXP
+ */
+
+#include <linux/cleanup.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/mutex.h>
+#include <linux/mux/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/slab.h>
+
+#include "core.h"
+#include "pinconf.h"
+#include "pinmux.h"
+#include "pinctrl-utils.h"
+
+struct mux_pin_function {
+	struct mux_state *mux_state;
+};
+
+struct mux_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctl;
+
+	/* mutex protect [pinctrl|pinmux]_generic functions */
+	struct mutex lock;
+	int cur_select;
+};
+
+static int
+mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+			  struct device_node *np_config,
+			  struct pinctrl_map **map, unsigned int *num_maps)
+{
+	struct mux_pin_function *function;
+
+	function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
+	if (!function)
+		return -ENOMEM;
+
+	function->mux_state = devm_mux_state_get_from_np(pctldev->dev, NULL, np_config);
+	if (IS_ERR(function->mux_state))
+		return PTR_ERR(function->mux_state);
+
+	return __pinctrl_generic_pins_function_dt_node_to_map(pctldev, np_config, map,
+							      num_maps, function,
+							      true);
+}
+
+static const struct pinctrl_ops mux_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.dt_node_to_map = mux_pinmux_dt_node_to_map,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+static int mux_pinmux_set_mux(struct pinctrl_dev *pctldev,
+			      unsigned int func_selector,
+			      unsigned int group_selector)
+{
+	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct function_desc *function;
+	struct mux_pin_function *func;
+	int ret;
+
+	guard(mutex)(&mpctl->lock);
+
+	function = pinmux_generic_get_function(pctldev, func_selector);
+	func = function->data;
+
+	if (mpctl->cur_select == func_selector)
+		return 0;
+
+	if (mpctl->cur_select >= 0 && mpctl->cur_select != func_selector)
+		return -EINVAL;
+
+	ret = mux_state_select(func->mux_state);
+	if (ret)
+		return ret;
+
+	mpctl->cur_select = func_selector;
+
+	return 0;
+}
+
+static void mux_pinmux_release_mux(struct pinctrl_dev *pctldev,
+				   unsigned int func_selector,
+				   unsigned int group_selector)
+{
+	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct function_desc *function;
+	struct mux_pin_function *func;
+
+	guard(mutex)(&mpctl->lock);
+
+	function = pinmux_generic_get_function(pctldev, func_selector);
+	func = function->data;
+
+	mux_state_deselect(func->mux_state);
+
+	mpctl->cur_select = -1;
+}
+
+static const struct pinmux_ops mux_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = mux_pinmux_set_mux,
+	.release_mux = mux_pinmux_release_mux,
+};
+
+static int mux_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mux_pinctrl *mpctl;
+	struct pinctrl_desc *pctl_desc;
+	int ret;
+
+	mpctl = devm_kzalloc(dev, sizeof(*mpctl), GFP_KERNEL);
+	if (!mpctl)
+		return -ENOMEM;
+
+	mpctl->dev = dev;
+	mpctl->cur_select = -1;
+
+	platform_set_drvdata(pdev, mpctl);
+
+	pctl_desc = devm_kzalloc(dev, sizeof(*pctl_desc), GFP_KERNEL);
+	if (!pctl_desc)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &mpctl->lock);
+	if (ret)
+		return ret;
+
+	pctl_desc->name = dev_name(dev);
+	pctl_desc->owner = THIS_MODULE;
+	pctl_desc->pctlops = &mux_pinctrl_ops;
+	pctl_desc->pmxops = &mux_pinmux_ops;
+
+	ret = devm_pinctrl_register_and_init(dev, pctl_desc, mpctl,
+					     &mpctl->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register pinctrl.\n");
+
+	ret = pinctrl_enable(mpctl->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable pinctrl.\n");
+
+	return 0;
+}
+
+static const struct of_device_id mux_pinctrl_of_match[] = {
+	{ .compatible = "pinctrl-multiplexer" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mux_pinctrl_of_match);
+
+static struct platform_driver mux_pinctrl_driver = {
+	.driver = {
+		.name = "generic-pinctrl-mux",
+		.of_match_table = mux_pinctrl_of_match,
+	},
+	.probe = mux_pinctrl_probe,
+};
+module_platform_driver(mux_pinctrl_driver);
+
+MODULE_AUTHOR("Frank Li <Frank.Li@nxp.com>");
+MODULE_DESCRIPTION("Generic Pin Control Driver for Board-Level Mux Chips");
+MODULE_LICENSE("GPL");
+

-- 
2.43.0


