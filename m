Return-Path: <linux-gpio+bounces-24566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D07EB2C73F
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 16:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C35F18967A8
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BC82773E8;
	Tue, 19 Aug 2025 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="M2a4yvPW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013010.outbound.protection.outlook.com [52.101.127.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091E92765C5;
	Tue, 19 Aug 2025 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755614394; cv=fail; b=Mi9Y5yw8Eo3T/vI3aPBObaKpt6N9KC59dlkupRaLv2qISlz7Zg+S/Yv9yxOo9/YDhrduNICI38liCzfUNFIcMPQdTk0aEa6ntQd85UsbAnWkjaSFD64XImp7KKtDmUvby2x8NOG1T1w3vHrQcW9Z66LZZjIfkswEO6iZVhp8wE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755614394; c=relaxed/simple;
	bh=luixxGRR0VZ3vtWKqqXucyRiNqJX9C/WEnt90TQLWaE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qj2B8xVeqHaJl34kw2EqAo8rTPwL5fmqoK+E4QcdItGtV7AkpPG5lW1VRZIvk7y4W7L4RVcCX+tpWql10htWS6AX5zbje8sxMdVTSNn9ypfU3ShiYEHS1OWqK5/vCbqwzyTVAzEO69VUdYZxMh4afDXhql5gP+hTbMgqSw5qb6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=M2a4yvPW; arc=fail smtp.client-ip=52.101.127.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtAEHj4UZWQZcRqGqMQtOY5sWWpGjhWm2l+P2fQZCtmhckLMqGls5SshLDPL5tsrJ+MTiuG506gpmSnwXp44eTDF6T0XaSc6xMUjT8/GZo6aLN7e07WFzx+7oVElxcQmdeO/sro3oVgzSQDFvUxyvTJnrrbv3n7fqlvkG7A6GBbWq9KnNfiUXUHKIuEgoV6kpsFFtFAXI7hoMkY4jTjFD73SeNMmzhpD6OJiQXhXCmI9Hcue496+LvQSsMXuDxd5luZIrzMJILCyNEyD4rUtG1WEs7g3CeluVp0VkovpP3Aket+1YnpOju0qhY7gDuoGRDH36zfE7RGipPtdQ0dIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxCN3CFvHQMy+khGTm0bfg0RocR3deOgqKbP7/TIq+E=;
 b=MMzUk93TL2ZPISWssFMCaENhV4tB4xb7EHHfkkl4pexL/V1exsPHYbrOejQbCdl/eXxuZwHfB0U7wCvWjd/qREcPT4q9XelJIEZwaWBjffh1hqOxoJMtdsLWXZe3qedkimLS5/TVu3MYtnfzEzVCdHK/MZ80yJjW+xSsIYQSHpcafr818jmY4PcAbCU4COqfxvhzxN6kpIyOSgtQgz6See26ih8gwtvGbJ0Tj0qpB13kWGd59mrrjP7i8n640LfETlnsDt4pENhTLkdNglzZMMmYHxqPGUUXfE3v6KxMFA7nInDKEHLHvUYRelqtn+obqhfkgCpqF+MR79Fh7Ut4hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxCN3CFvHQMy+khGTm0bfg0RocR3deOgqKbP7/TIq+E=;
 b=M2a4yvPWv3VB3EGT1T5900AUp2Fofon4x9ok63nC+Gyw4SShPM4JgvMwqRowvFZQR52nF59eJQ37V5ANGHMCZNwJulOWE54ilX2zOKcLxZuZU3MALVhMNIxb3JKmGbM5NGnwKQaZGtgNJxkUef88NP0DJt5eZroStTpF/AY/zBp1n3/3CGeX57TsHFHvOCAKLa5wQo78PnWZMqDwWbdh8qLkFDmY28K55Ho0rSD4VCYriM/gzNs/0pD5tsMn9KRv0RbMsqihJ7x8JGRb+hRCV5VZohAYJppumpxvfMSlQJQYJ756cR5zbSjRYMvItUmbJfYKcNaS8BjYu5dz8qWAzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 JH0PR06MB6679.apcprd06.prod.outlook.com (2603:1096:990:3d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.13; Tue, 19 Aug 2025 14:39:46 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 14:39:46 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com (maintainer:ARM/Microchip Sparx5 SoC support),
	Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip Sparx5 SoC support),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 0/4] pinctrl: use kcalloc() instead of kzalloc()
Date: Tue, 19 Aug 2025 22:39:31 +0800
Message-Id: <20250819143935.372084-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 6b2f2c63-1dde-43c8-5ae3-08dddf2e3e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HLSt0KuK44TGsqQC2eGdVfLNTe9K3eCI4KkbkDf9BxQxnpoyo7sM85cF4njv?=
 =?us-ascii?Q?AiJNB02wjcUuAS4J3blMgtrpyAmhCLrArfJtva23HD+mo5lGyrclWyUjqgNy?=
 =?us-ascii?Q?sCyRtAQqaDAzR7A5u6UKKyW2xD7hqpWfBGwot+X6sLKr21snPPaLtvk9goh9?=
 =?us-ascii?Q?6Q4GMPdJo7LclBoWaWhb/3/qwG34TftD12V2MaMZBx4DiR9IB5dHOpWtk8JS?=
 =?us-ascii?Q?U7siev/UDRyn0Wbzr2VD/rqC/X3lwy3CIUqTL9yyexTO4O89NwSi7opk2zG/?=
 =?us-ascii?Q?BF+nbSNqzrJLrfaYfLTyILIbxF9K/ShHDRVFsD3m77aSXMlPTDVh7sSF/mLW?=
 =?us-ascii?Q?SUqcd/AeJMs311wjM2rndrrNf47mAvaDWStO/sWvLeNFM7dFGICLs4ksEnDW?=
 =?us-ascii?Q?OOqs26fAPpL5BrTzfYyVhsIS7vUYbrZTV48r/XW4Ygww0pIe3fuNyyUJfUFd?=
 =?us-ascii?Q?ymSdFLJGfmSj9Pux3Hn+w3GCNZVkYG7UulxM0FToulr+xMVRjBXWiCj8E6Y8?=
 =?us-ascii?Q?I1XvQ0+kbntLeueYsizRDnZCgISYIIHKOuJf+lXTw0SNkwXm5VxC42FPLQHu?=
 =?us-ascii?Q?M1UIEgIAdi9q9wpSO/ArawUI5tpTj+rbUBJznZ6C350XqW8vKvVk0+UNUnqh?=
 =?us-ascii?Q?Ug8hTtsk/YX8iFRQ70N/3KoTZyBx20LOJZ97B0v7eifMVifU4uooh8iey5jS?=
 =?us-ascii?Q?yulP2+aMSjtCrhs1y+C260/5GG582x24Fb5RywduEr0yi3gHvYjzD3WeplDE?=
 =?us-ascii?Q?yfpacJmpTz5m71OVYcwn5CLdR+Q4gOEGgHcOWPwvf02azRWKa5OElNDzp2zg?=
 =?us-ascii?Q?WNOdPwkICHVZxDg4MpBRRm/xd+YKrmUdZ8cXN3EGtWFfoQrVbRLNWkOdXYlx?=
 =?us-ascii?Q?8Zu4gp5aHW7sY/10xYenhEXRSHqdThEFLqP0637Jj6M90riNa/zEGvhnJ3ZE?=
 =?us-ascii?Q?IbIzT636bMrNUU4nkx/Ajg2pBBMfpm00oj2LdHqpKb0foP2yBS1CfinFrMXL?=
 =?us-ascii?Q?kNzy7yzNyvNa8pySAW3yaJcNEnt4QY6rBhh+6Vo4PohDn4P4I5CO9+iJzRHt?=
 =?us-ascii?Q?ZBk4uY/63A1GC1FScygOBXF8hPb8H5bWM8ZRg5MyebKn0PbECr87kAucECpX?=
 =?us-ascii?Q?Rbf8iGfK0snxCPEITQMHLHBa8VEBDmViz/yJhTJPC6wGbiU0XeZiW9nSYsRg?=
 =?us-ascii?Q?fLqm/oAsW/7oXfX1I5D3Insz7scpbXzmUk0UksKn1U2U5n0JHdkb6L1pQPVl?=
 =?us-ascii?Q?Ens7fH1rpEaPChJ15gvKKmCDuY1YgFHzTj79PFNlaAclnGNs9rTJ0dD0GsAZ?=
 =?us-ascii?Q?WIvldC7OKXtNt0lkwFk7qFbHbSwbxK+s7PLocnKM+8psMbNhNjcZHqHnnrUC?=
 =?us-ascii?Q?KAUym5Uzjixn0OGrw8q12kpGCAuXOSfzMxrIDkHadBuyRjfjFLUYRpNOfMCF?=
 =?us-ascii?Q?I4Z3tZ1rbNJNlRx9D7RZtoX3F8S/RGM+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3j/yMGLNdGolM0XqTfE+KB/n2UQQL2Zx/CI7u9VIhNtUXPUzPIKCKTxKs0Rb?=
 =?us-ascii?Q?HwJ006jQaA88PA31YPZRhPrcCaM/RgYEqC/q40ehLHRGxLbCfIu21XXxqxGY?=
 =?us-ascii?Q?FU7NSs8iI701IIOUivbKgsJPP4dBuP/6g2GGTQ89wO1+HL9hMZPQ8/dfkzc3?=
 =?us-ascii?Q?7WfMiGemrZsUhsvd1kBisng9G+R4Rf4OjDSqgFH0zLW+4WPBCLc3oD4UlLep?=
 =?us-ascii?Q?Xx4Mz6Uk8Uj4o8anrRQLL1V196WNoNgrXSJ/WXqW+xcT1NC39xl/YuJ0jCR+?=
 =?us-ascii?Q?REavGs3tiVksNnQJaOhioqIHdWeGJim3A+i4ePkbfKmMDvYBnpjHKpwD+jpr?=
 =?us-ascii?Q?83UXzvAd+gwO8SjezUrdet3eTgenWoYfAucy7bLaAvLfoxPk5Dau4jOG3aEk?=
 =?us-ascii?Q?cq7ioCO2Awci385Yw6PMjHvJnP6Ee3MO7bVlviQzwujVr34e8uaAU1L68mNZ?=
 =?us-ascii?Q?tvyHDqe1Ygj9O/5CpW1buuzXZ4cshhHzr179zhsT7c/Dww/L5p2gWbyzRY+6?=
 =?us-ascii?Q?rWALiLCu0pEiiu4WhfdMWVOYjzCQz1IEnHq5YyqIaRkrS8z1J4onB+sH2o+n?=
 =?us-ascii?Q?oYtMRoIKalbSQEIMWqImU8U9yXvXNQgBxnLdGlszO6IV9sJFUFiLLyoJx+po?=
 =?us-ascii?Q?IJIP7dGGwJu9wIzKnF98heZULivVqyb8Am2QoleN0Fd5ZYlIoDFhK/y7rmuD?=
 =?us-ascii?Q?ZTkFHZvbNYa2ERjNqrbWsEltDNyBtqupaF5PnbaGaKUSt/ZRZ5197lg69aP6?=
 =?us-ascii?Q?f7SnWDthg6GyxBbzRdMPuLQtnHRmzk0UXZ4IcU2yu7T+F9dgaAQPB6Uc/hDe?=
 =?us-ascii?Q?frCiGFU5BpEALHW/8HGPIJ5W0QExljziL2sRr2Z6iDBtVQfHrYqhvF2dyCrT?=
 =?us-ascii?Q?pTjPTg+RC5oqquRDJElNM3i//6NJiE5tBulDt8c9WgXCgiZXtbQ7WERhP1d1?=
 =?us-ascii?Q?FZ4smS5nd/hmJQRUIiYA4dwUkzHJwhiYOpc4zaSRMBUr//eCLrrgRnkJDSuj?=
 =?us-ascii?Q?+4h441RsSSCLRpZRC5AIhl+zhHZXDOsMOXD8jt7ZJapWFsKpq6KQW8Xkb7fI?=
 =?us-ascii?Q?AtypgojlmeL46abznaFsGCnVK/tTEeOf7qnIZmaRlIW9pYOa4GG0hSkrjnQZ?=
 =?us-ascii?Q?/MppHHLNVWlk1h2mTq7V5bDWqRMrbMjCqNFs4qVkV8p6DDi+nj2KW9y0uQKh?=
 =?us-ascii?Q?AhQwoTxXyviPHbVwHv9r53cRUwNDON/mtomPAN4jWRS+dipXFg/Q/VxvUpl7?=
 =?us-ascii?Q?Zpo/8/+7jVYfAjJgpLYdpf+556xNup9gM089YUH6w4R06cnOjoOZQxqp4mkd?=
 =?us-ascii?Q?LzHjfVYJVLEZtfaNjSDkrLnywd+x11NauEQXDlS9u1X9KcC6ePqBP6qUHuEm?=
 =?us-ascii?Q?Ch+mlZGqX6OFbrRA5yHzA9enIXF0s6BhxYqdjyCputBUdchCVTJKtdlmb7Y1?=
 =?us-ascii?Q?78Cvc3OfgtbXria7kEMeQs2ynPC19U8n44DJEpV41rPvR++ZOaIjGqxh4F6W?=
 =?us-ascii?Q?dhTMncvlOc2rdRS1h+ML/v6euvbGZ5m8xRGYmzbBwP0Z9TJFaHdCydAINv3M?=
 =?us-ascii?Q?/kUrmYprznfW/b50RwB0Lf449xepKJya3ECzaAuj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2f2c63-1dde-43c8-5ae3-08dddf2e3e79
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 14:39:46.8178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EeVajSIxNmmRNnoLpiuNnnEhBA/a4PYWEs5UTFTj0vQ8OOqejN57vTwXkM96RK7Ynglg+7vX4j8CiVjmpdpdpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6679

Replace devm_kzalloc() with devm_kcalloc() in drivers/pinctrl.  As noted
in the kernel documentation [1], open-coded multiplication in allocator
arguments is discouraged because it can lead to integer overflow.

Use devm_kcalloc() to gain built-in overflow protection, making memory
allocation safer when calculating allocation size compared to explicit
multiplication.

[1]: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments

Qianfeng Rong (4):
  pinctrl: microchip-sgpio: use kcalloc() instead of kzalloc()
  pinctrl: pinctrl-zynqmp: use kcalloc() instead of kzalloc()
  pinctrl: qcom: sc8180x: use kcalloc() instead of kzalloc()
  pinctrl: sunxi: use kcalloc() instead of kzalloc()

 drivers/pinctrl/pinctrl-microchip-sgpio.c | 2 +-
 drivers/pinctrl/pinctrl-zynqmp.c          | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c    | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c  | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.34.1


