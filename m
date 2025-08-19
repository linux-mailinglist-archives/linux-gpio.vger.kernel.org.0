Return-Path: <linux-gpio+bounces-24567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C41B2C755
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 16:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BD025C1CBA
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AF727B32C;
	Tue, 19 Aug 2025 14:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="DlLaSsqV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013010.outbound.protection.outlook.com [52.101.127.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129E421A437;
	Tue, 19 Aug 2025 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755614397; cv=fail; b=VvPjCgNraGjyqEF8L79zHS/F1Y68nKtedEB3iGTce8ZBgjNC2Mph2uDNuH9WUi9MrIYpP2oLuSa0FUOjQ1IotcgPqjXNuGdlvukhIKhSoZByqJjCSR9gaXcV8A9c08naiE1xlc3FvyR7qg188SzW/cc2OCNtcsMMWJW4FwjVTcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755614397; c=relaxed/simple;
	bh=d7SFJcGOSsHVFnvax5FWxj6TQXkMcJntG9+68kc98Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qf7nnnupS+KrBtxqxi8xaP5Gk8Uo845/aLmhhWTVXwuuRFjufaYx33CwgAJPOekWVJmnfbl94l330dzANVi6hsTg7nIVhHIdqtcwO0Fa9A7trLaY2hdjqpkCh0BWZOgjCcl2YUa0by+WSaH8j+4QAzqPjMouUFZ1EslB+rpGiLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=DlLaSsqV; arc=fail smtp.client-ip=52.101.127.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVethpmZ3xubw+VrdSHvmYH4/Q+i4WWehE/R0lbgWDte17I9/bM9K23gYcQ4MZ6Noq1aIggQSn9xMGN7pzvzbQHf8BuZ2Jf8+DcOQeudaOVJrrzky4xuaTSWWz8qPTUvevq5pZgY21vIynAiiIET2ksm+VUy6y66BQTMQyPz7rYNqfAXKC/B5Dp/SUoh7aszu5a8vihOrUisRPgF9ILZlQRZf0+XTN1xCwN+SkqMUX877o4dnhYCYCX3EoecN7pVhpGK0ZkMCRSDuGkZWv+sU1m8c8H4Y1ZQ29XuBprAp7PC0xTuRjTU85uP7jPn+oh6amGK9n+cGVr5Us+tnierBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2L7RdxnbzHeV9vcCZNOSGWJ7yGtYJGGP8m9T1j76AM=;
 b=iDpfYtgQsqM3qZ0gVGfGu3aaLdt++p5KwV1Cl03pF1NLr9soJOnvJFaSKy/CivGNwyZDtNQSLqBm1h4wvKiLydSreqpUalfKdRQKeu8QG0IC0sDPY44PiiFm/c6880k1LQHzxBGBGPdJM5vqcgQvNvSoWsubnqEvuFfQEba4ouHcrfiRk+nhuwQwVNQ4wnJZw0FP5sGwnqgVtxCx4MdJ56fXrBbXDSiLlj1g3fcUEdjdqOrjPSLuXjuHJUPrIvMmYaDzki8dlyppJub6EAL4g4a7XsH+zmbFErnfB3BGSBly1KEyxTlBFs44uHKOWKHjEovtHY3jPjHBSgctwZacuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2L7RdxnbzHeV9vcCZNOSGWJ7yGtYJGGP8m9T1j76AM=;
 b=DlLaSsqVmzhE3/+wpFIIykr/KwLAxXHLKGeFWSLmrwL5lRuM9HM8NZqZrU7KjbjsD4bIUhmum9lTMCgENPqvVIIiw+t7L74u6xjS7iRbHzlW2afgIXKsQ0WwadpCopnKkWCWQBd9u6oSnT9MxRPi8lQDj9Pkq0gb7vR3C2ZLQGiGoOIpdZ8UR1sAfJM2EFrHb/hU4/WVzdJm3PVadWymwmRfckRnsVJ6NcpYRtVKLCSAiEyS0/KNWYwapQKIozInWrJbOze4fRKUDERHcvnjWgwbgYaervuPqklk/vZsUchOKnbRusiFK5ydiEiEw+Nct7ZzWaBNzsb89WTnaO9GlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 JH0PR06MB6679.apcprd06.prod.outlook.com (2603:1096:990:3d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.13; Tue, 19 Aug 2025 14:39:49 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 14:39:49 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com (maintainer:ARM/Microchip Sparx5 SoC support),
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip Sparx5 SoC support),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 1/4] pinctrl: microchip-sgpio: use kcalloc() instead of kzalloc()
Date: Tue, 19 Aug 2025 22:39:32 +0800
Message-Id: <20250819143935.372084-2-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819143935.372084-1-rongqianfeng@vivo.com>
References: <20250819143935.372084-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|JH0PR06MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ed034a-048a-4e3c-c846-08dddf2e4018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UTPv/nPB4PplwQzR9HvPNp64E+9HFQzqwa9iMlQUTmFFqHDtQ8NbMzWalMY/?=
 =?us-ascii?Q?M7B5I/Dv73+aCyNn75YK2wJ9O4pNGmNzeDix+Le0tO/EJLHRVkU0ZB4aLNdn?=
 =?us-ascii?Q?Cumh3tsENwMr95q7m/4GuC80Q+pgjJMTmBAZjO4GN3RZJYKssRyqcHLDvQjt?=
 =?us-ascii?Q?mkaUhSCzdhRd/Pdc7vdMpw2bIegGOJIu2N8/TR8lDry6eYUUAIGhNqW76ph5?=
 =?us-ascii?Q?J5nCWebuuWnxMlolo45xk3qIaNzqA5wRefqEFROlITnubvFCiIPqUZunyC+a?=
 =?us-ascii?Q?lq2WQ07OnQMP8X/ebjl2A3nN8jg6MksAsP3L4SWLU21IfCQLfd/qktflUS5/?=
 =?us-ascii?Q?mAw0a6cXykKhBEjaBRiPmytRDjw/p6blyd6St8A/W4hb7Psl8R74jCgY/I60?=
 =?us-ascii?Q?JWk3YTfPPJ7PxhwPRhOV+xxpdNC2KEUCBaCz8b+t20Pn/+7UdLSQuGWZwSBK?=
 =?us-ascii?Q?NuImyaSb9yy64j8fZd1G8hdnUh7UNPs/STIoyCBQ82C/XegMzzADEohl+ms7?=
 =?us-ascii?Q?CZZYLMbZCF3mDf7tKYEGCTr4gbmc9cMZlOw2GbNqIr9WZxnsWBpSPZCVGqvH?=
 =?us-ascii?Q?MGRIalajtBSo6p9DcNr/VbYlIYSTJsu8Kwl7/S7z/CVXtkJaeGdrKXveL9HJ?=
 =?us-ascii?Q?rNsZey2hWIf7XJhAhK1iyWBDyJUhZwKsuEBKajXEKRqs2Bbs4B3as7P9rNjq?=
 =?us-ascii?Q?vDl3R3o+FF6TZyvtnNPrOqbERzB6xbYDHlVomh+9BxGVlQLtQzh6RbIDO37R?=
 =?us-ascii?Q?HCtSt6Lj4eLJr8CcPtAxeztrEaG3X22SHaDtD69/jJkIJA3aDuRJy9ArKlqc?=
 =?us-ascii?Q?GU5cdnw2NlPVYlAC6JLAe5RBGx2kdViCLH0dOfBnqkJHHWTYkvM6l5svZf3N?=
 =?us-ascii?Q?qqSRiGRdMAaKr/U5mFXFrk2NKoWobu2mJTT6OamhT+qCGvZxsWn3UWmI5U8M?=
 =?us-ascii?Q?HDtnTWwngtbgTg0BuOIeuleQdTdO1TzgQBwDJKABGP3laIdpJ7/By6C/ouIN?=
 =?us-ascii?Q?k/Q/gRcoPE0KZysSQI4xocXp5AouWkr7t45Tit2K6dMTTzJTlf0N5XRrvUc2?=
 =?us-ascii?Q?6IJaXq67yNBLSPdhSCDgWQomwXTzDRUM8tm/PMAPVXiCbzXrTQ4ZLWYPkTof?=
 =?us-ascii?Q?P1uFbyxtHRc1adJ+oJ/mnSXwTzDAxzkx+cpUj9bkVKX9n8QAODDEqpd0QOZf?=
 =?us-ascii?Q?svKn0eMCx9YPGNZ17RgZVUeYZQ6nbvSOV8ViWnpMj8geXdDbkhjwp5/42w1s?=
 =?us-ascii?Q?1pZkCP3nfqg/ygNKJkfoaCGQzOxMiarNMwpy7Khsha2GuTbDYwU60fZD44uz?=
 =?us-ascii?Q?YMoDRiNOktWA8SnGfFi9HZxpl5qcjfSPnObO3C7xuuoadx7ojWpuBcoWnahT?=
 =?us-ascii?Q?YwN3DflK9KjKCb4i+AhKKrYYXaaRHXklQc4qRnnxlTG2zGkjG3DIUMmxm76N?=
 =?us-ascii?Q?53sIqWNiQ8MtpRsArDQWaNIa6WwxAHWN3J9m+x0YCFZ2VZeHPkSOhyHBXuwk?=
 =?us-ascii?Q?bvHCU7DFffYdGRw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DsKvj4mkrxCPFsmpWhjHoU5xACHr6TozK3uYlGCndpmFNAF3C6MGXKICx3Pz?=
 =?us-ascii?Q?rxCSZWmQZ/ytcRDVn26uU2cvnO4Po86DT7f9f5Zv+/InS4arlm4EcfM3vyzu?=
 =?us-ascii?Q?j8UKn9cf2y2XJB98xCfuxSiy5qdTOf68f4P7shyem++qm7V4+kOzYTXDh3nu?=
 =?us-ascii?Q?0IlxVhqqHL26PlyXfh/fgT+FqqkSp9tK2MQ6ioH2dMFB0Cabea5spGGWgxWD?=
 =?us-ascii?Q?5MT7JVDDJyY7Zejpe9h5XOHMiKGiTUNjyutgVI2Dho1LMEb81Ip9JqiDkoZl?=
 =?us-ascii?Q?3sbSnwRFvm7EIhF2VXKYQvv2QB4vZ3vWXgJPg5VZ3Ym0rx6tFaXge1fQZF7K?=
 =?us-ascii?Q?HyPgNTUhH+VHp8kk3Xv4pQczv/gHssjw4dzqXOEmukFAlIlBh0Y+Vm8cYcTR?=
 =?us-ascii?Q?JJ6SloPXtT/1Pg461TkWWk41HDOTwNF2fIeXZG5YlFLfdtepAGFQxOAhwKjp?=
 =?us-ascii?Q?60uwwfmHGpm3AJsopuBp/+WVacRvaUrjQO5BWVGcPpj6J3w6jmIXZV+dpKG9?=
 =?us-ascii?Q?Wxg+rvgKGiJneYyJZuvyl5Ai9pwYVovwcRwCDImAtyfR4qBmunbrdKBm4v/5?=
 =?us-ascii?Q?syXQVLFAC2h1J/vq0jIZtRENGjd8RmusbQBGO20IzWBqGyzhQ8URTeV03ZEE?=
 =?us-ascii?Q?9qVZpGeJYSB7DeyGCopySyzcblHoCzC8nCEPiMLPjo3/B4LR9c9yDVxyfRwR?=
 =?us-ascii?Q?pW7wuOVT9wxWPQmLaSFWMl4+bEj3U33C8O6HAQAFi7ARuUw69flFaj1WKQNY?=
 =?us-ascii?Q?B/VM+P/S+AOrem7Tut2jX/lsOqrtbo6BiPb5H3N2bZNuf7zNCbwTI2ZLO1sa?=
 =?us-ascii?Q?1a7BlDWILchAWFcmUGLQgB8YZ2tcRkpGjkYAQHIzAZLkMB64wphskDuwNzF5?=
 =?us-ascii?Q?DVhsKQfC48YpP7oRWeLbosvvElgFMVTTiza5WhJf5pCOTdmliZ1N0/LOpn8G?=
 =?us-ascii?Q?pANjEO07uKQ9dCrLm5ZNyfFZiN8Cg53uRswYdH0bXwUAfcetRXFwvA4MqpmV?=
 =?us-ascii?Q?jQ/OOLxwh4DiZBBgJCnaBEaMMhEa7X+TOEV7pMzaOGBBNlF61h/uh/BdfgY1?=
 =?us-ascii?Q?rGVeDfJ9JOASLcgT2gdh0DLnHFXPf+77f6XyuCy2M+k8QzqugmTTNz7W6O0T?=
 =?us-ascii?Q?VUT31eQr+yPAkQwDurkTKM0g2eqJ7v0zqp4Rj5RfjYunoJkDONauYmmaTqOI?=
 =?us-ascii?Q?smMYqVk2/AH0M63JlTZgETY8I8s+wxKlr3UAeLZ+d69oC6i/nx+ZpFGOFVxm?=
 =?us-ascii?Q?YHwoTDYKijp1cHOoJWZf6A/DwYASp9/tPnkLdN/fCzsuBI8P4Lqq1phxDvNW?=
 =?us-ascii?Q?O7tkBGBBlAIq4+yzI98OBknHSmmin5mBtWEV81LGRqgbK5bVw9QidzR9+vRR?=
 =?us-ascii?Q?DP/XYh9MS0aVy7dcUmFJZ1vrn9Z7xlDhqqBZkwgZMhbzlFke5nHq/IErEEWJ?=
 =?us-ascii?Q?WZo1x+m2Dkmy2SYOaK4/F/sR21+AlqW8ueGa2L39Xr1+JNU5e9boDVe7PJd6?=
 =?us-ascii?Q?h56vYDeEncG9WSIr/hiyxdDJn7t2TUVNs4bFS/4tFoJITN8gxh00ILj6I/M0?=
 =?us-ascii?Q?8jOclV2pkfHAB1R43ber/a+OfhrRe0ej80gRSUUU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ed034a-048a-4e3c-c846-08dddf2e4018
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 14:39:49.5048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbOYSr5zapHL+0LfAhowrppUgFjr0piuZ5+DXdZFYoJ3oY1Rbmvi5paM91jxJCqubaQCgvwHFtZvbTlWpqS0zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6679

Use devm_kcalloc() in microchip_sgpio_register_bank() to gain built-in
overflow protection, making memory allocation safer when calculating
allocation size compared to explicit multiplication.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index 6191e5c13815..069cc665a402 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -824,7 +824,7 @@ static int microchip_sgpio_register_bank(struct device *dev,
 	pctl_desc->confops = &sgpio_confops;
 	pctl_desc->owner = THIS_MODULE;
 
-	pins = devm_kzalloc(dev, sizeof(*pins)*ngpios, GFP_KERNEL);
+	pins = devm_kcalloc(dev, ngpios, sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-- 
2.34.1


