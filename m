Return-Path: <linux-gpio+bounces-8858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1009586BD
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 14:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFFB71F21A03
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 12:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1985318F2FD;
	Tue, 20 Aug 2024 12:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="AKeQ3Dix"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2082.outbound.protection.outlook.com [40.107.215.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDBC18A6BC;
	Tue, 20 Aug 2024 12:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724156247; cv=fail; b=Pp59ywbs+09liYWho6DY1yhdNy6inE+SMzaAfThyCNZZXaDDJUzlkAoJpCbxSSAPXgamnoC/dHDzSPUBxeEenUW7GE+cjWxi87gTO7w2HwymqoLzpU+Pf/KqqX3z7ABa81C32foWSjpyll38MQyuRs+xeLymPEZEFMYOu8uSCXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724156247; c=relaxed/simple;
	bh=AAOB/DmKzwDH6XvSrR834Tmibb20bC/KcrrAbu1Qrs0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CeNX51F8WPtPFTCvqhKAlLUeOqOs6mjKyf4jy3BQAmVus3Rw8uM0G65w/RAdqgiwZNSuuuo19pps1aS3qPpZJ2BnJdhDCTnIDUkQhP2T1J1BssDIFeebKNcoo3QAWG6EuRiIs1nAYpBvcYMJs37d4o9eHFT71iWSHKtNR/c+INY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=AKeQ3Dix; arc=fail smtp.client-ip=40.107.215.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeA+NTuREXOyol9c5eXzieOlzs59I7kITG23KxEfRSAF8s5FNR4XD2/4uGFy2sFtfVv3QQY+11CqpjqmLX2nAeIvP5HHrH4ImPVzJw9Q30HpxLW6i/0qlzLz4CL/suB3HWpw1B0bKO1jPWiI1BLriTy45pnis2A+E3wB/nIQLsIX7pjQSyHR1TYnSmeDf31zpxM79lRsFDXxMrMTB2wUZ93JyQ/HRwr1O0/C7xS9lPH9aCx7/JVYrGUgaZEQ1uHa4yr40ovAH4kO4bYA8TCniMdPlh+LmiNDHM1IHlFyPV5RiQgsRWtbv6YrQLLESZE4aFNHUHVu1x14JbAnk8+Uxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFlrSfciLaB1d6wcA9N1/nuotNE0rTzwO24BSPRPeZ4=;
 b=JM5E5b+OuDC1jUwxDBZJyPn4T556N4jk2hPOo3NYEyfOc9K4sow7i6W1Gz6bRcP7PZAs+GpnwVAXRB++jEbdF2qX/lhzGdcGgKdR4+Gl0SzOWDwV8HHid4ua90K3lNuc3BIWsSAqkqVKQPuJ07mBdaqcmnLUEeoh+inOTQDoUdjRa2ng4O1i2nzgmihyjAkde/SUxfsGqRq2SeQkavaC4pDZeY6pVWRVMDE96v4gxvNGQZrP/5C0xLMkfPhYieM7XYWEkNdyguGPjN1FA6+EDKdZHgUmiGETpRtNVU6gkdIwPDlYvSlJCbnqSUKGWpj8MJBybgLdwP+0kbeXkSfGjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFlrSfciLaB1d6wcA9N1/nuotNE0rTzwO24BSPRPeZ4=;
 b=AKeQ3DixxisiDP6onLXR4KSkYpQr4viNBlt4UBX0kMcLFXpVIjRHPrlhPXjOWSVlR2oNi7k7H9w3+3XUK43yWSiAqGvSB5feI7qHFD28/SSL1wtuZGZaHXvst9gl3Qs4GB3PBr9j9Jilxw5A/VoY4sa4njSEf/90S2DtPhwATsOPe0SAOyaeFWPHYJWOxKyZ9yUxF6qfAvBBc/wNLcua9UjsZyUJ7jLBLkqPmrFd5v9+tfgVRoeW/OQE5FGRv9r4kESsaT7p8Trf4FTOFaXhmLYkdTuWLQlyLPablFT2LFHValBf+c8cjBkiMPnTfTA9HCaMRF0L55YoIS7IlsxAKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB6285.apcprd06.prod.outlook.com (2603:1096:101:130::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Tue, 20 Aug 2024 12:17:19 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 12:17:19 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH v1 0/2] gpio: Simplify using devm_clk_get_enabled()
Date: Tue, 20 Aug 2024 20:16:49 +0800
Message-Id: <20240820121651.29706-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::8) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9673ce-8b77-41d2-5db9-08dcc1120950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MehimFQnOKJS9lJ46m2mfUU/N1TLsByDmeWNKtSzzqoTalOEYtGM0Rwe/hBb?=
 =?us-ascii?Q?ZgOGdhoJ9qJJ9DTCi8fr1T9ckFIQgb/FtOACslyw0O8A18iQm6vvsliaQKTl?=
 =?us-ascii?Q?TibDJ5BgbCKzGIZ24WaPvDNYp8Hjasqdrlsn5OI5125ocQy8wu4indmpOphz?=
 =?us-ascii?Q?FbVmcKW3Cck7c6Xbwgop+uuQedk2p0NSJGPeORQY/cPv2Nf7okBlOKYWpA0P?=
 =?us-ascii?Q?QthuxAFFU+XtPM/alP/LrBYu6GfB7PW6Ghn8zSshjGSCFIsCY4cwb65JRigU?=
 =?us-ascii?Q?X4B1jffblaU8MJSSjUnDaAWqGjJkhacCmJPkMutJK19rAIJyo4BLCJBU3gz6?=
 =?us-ascii?Q?gH+llOpixyJK4fpzycZxXeMLh4P2vHjJayMqPF/v2XPjmiZwStsvWzu3x8YT?=
 =?us-ascii?Q?4A3QlFCHhxZrmIrMpwogCKv974APOCSTV/MD9L2yG76salpatbPInlky0le+?=
 =?us-ascii?Q?B04Neirpal+AveWWva7RmUIfq9DiKEu9RGRV1s6r3muBZV8jwali8CYRf0oe?=
 =?us-ascii?Q?iPeqFzyuwB323FxCEAZcYko46N/j8iOz74zm8LaTjlqbPTZSN+0g/CdLgSny?=
 =?us-ascii?Q?WjEZhzkuYUZetBpuwNGt8S9b6OwT2WbzlMQvKqy6aMSz5dymhGtkSXcKR2Kt?=
 =?us-ascii?Q?Vy1X0NARVukfQoy/NZbQ6/bNWMdf6Qci+j88V5wd5yXdV4/E5AkX8pMmzt/s?=
 =?us-ascii?Q?UCpUXXQuzFWWmBvR2t5QBrIN6AEOBuzOsRGrS1BPvfleUXzUC5lW8u0koQ4N?=
 =?us-ascii?Q?42O+0BMW6PKBdWiKatok4ncoIdXbSYvCYpqSuSkRPY66hPd2o0vXgAtRWel1?=
 =?us-ascii?Q?acKxivP7wJ+9NWUW762FbjK4/ul6Y9R2LLyeqCVgDY55/ykV/Ic6NXyEfCoL?=
 =?us-ascii?Q?GN/XMy0mPPCO+OQtXjDgFBvn8XqE6OLwVslx0+cDb9iEG+yAo2uQxFZTiXLZ?=
 =?us-ascii?Q?FumqeXZRL1WJRmL9jlH5lARkYToOi/SNXjUlTmiowkj8JvCKnstkhYA5cbsD?=
 =?us-ascii?Q?ubC9wJLgouTt6NNxzXQN4qv5F3Mvzbt3jNC2cQnRsa8aAE9vBN0m91M24F+u?=
 =?us-ascii?Q?Mq+PFQhIKjnGZgrOTwqKLIqtd+uwUItnuyP1Xfwrz3b/MGQ21qR6769SSMdQ?=
 =?us-ascii?Q?MoKh7OV3nXeNGJzw5tYICNHxV9t303NWOEkPai9qiIFeD2CmG8UOM0dpcU1r?=
 =?us-ascii?Q?yPBw6/u1PUNGBkXsUml0FnUqAh6gfwaPxiH93LaIGnL+u/DeVhQWKsF1KUJn?=
 =?us-ascii?Q?DMAYkTZ3vfXZK0ESfqbi8W6McHlZKE9+jIH503Mj2Fx8zWKqzoUJqjGKdzRO?=
 =?us-ascii?Q?jZ6LeHTyC4WutiKKWSYprGmA2Zv1T4/OOy677Q5Yuc/vcpA67MGVIi4JWmR2?=
 =?us-ascii?Q?YUTlZphCd+7rNj2p5oiykfIuJlIBllBQJEYGLdBu6xkBnIsHIw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5CXl+/D7vrERF6jOMtBBZxolm1yiWSwVnVtMO3oLCiawK0rAsq2Bakkw8Oi0?=
 =?us-ascii?Q?YXWBlSBsREQdYcLmLMG1X2BLr1EAclBANa3IJrCxY0sJSKTbPnP+ztPczMim?=
 =?us-ascii?Q?F0ukOs72mpTy0kOaWOKZ/kSH1CXaFl87NkoY1ZY2O1M5foZCEvg1hXDwTe+W?=
 =?us-ascii?Q?0m/uTeEHCpJk3OjOYdg7zhQ8TYDc+DEfxaGuZhCAZ8F8TyX9ydEk//GBqU1G?=
 =?us-ascii?Q?NATzprMOhPbp6lDG0dQNVNCbklxAJEFimpwMWOJtzcGhAKdL4FUWALgKYIrq?=
 =?us-ascii?Q?2rDRgaeRDmBcqpQV8vKrsZpPXF0RDcOS4bo1smzqczKQceK9I2RPSO6R4Gwo?=
 =?us-ascii?Q?JFDHNjDqSAY3eVTNTd6GVhjgIgcBGERPScj//6ZHT61U0W8GoGm8Eup6+Fqs?=
 =?us-ascii?Q?sZPx5TfoAh65ESeVqQgSW79/yGRuVAyTI1VjvwY4k/7D1WrpI0Lcjvl4CMY5?=
 =?us-ascii?Q?LT1d/8OA6UWuzaonnHpOE+a9Ryet+C9MJrH+d9YN1ATkA2IyqkFujcPH/NtF?=
 =?us-ascii?Q?/Eb+F41SPAeQzRlcw+wOtiB2MMKeBEhAPc7BmaIcfA6rxoGAtlDbzVBXCyvR?=
 =?us-ascii?Q?CfOTkrx3b3NoZCV99+fLyZf0BcSjnfFbmG0NxaLHKU+EAG8157jqlJffJHgw?=
 =?us-ascii?Q?oQixBNZUmybMU1EMz4qysye2jHPS3+aupP89Qr3WqE4nNNLBRq2iVFycEyhb?=
 =?us-ascii?Q?AFkliAi170k7QOtJRgEw+t5WcJc5DuRhG3olIzhhNTb4JIqMf6yxJiZKW/fD?=
 =?us-ascii?Q?Q0F8R0ZdCGxBd2WmsDjPPg6V64bjqmiCy62VMcchWJKHx9pXE6SDN3uky9I1?=
 =?us-ascii?Q?w00Q0USgkYUAu6nTP4ycM/q5rQYPOaLIhewIDHHFV4kbglGCrN7e68DWvNwh?=
 =?us-ascii?Q?LAxJG84E/EH/vChkVR70xCB9gRqIiax8PvG2FRTQJocnzEikG3KZJ4ZZ4GNo?=
 =?us-ascii?Q?FOzOxV9gao2b004UTf3QQhBsbkzCf5ddkv+U4kHxtHa/GDSpNqNdzKCytWJV?=
 =?us-ascii?Q?XxMdZN8YVKeyBufybGH301uD+qmAZk37eiSFn2Zgn9RQ4VGr+hUiJe8GSdfY?=
 =?us-ascii?Q?Dy1FACac5RVZMncCbr3Y0tFRVAuD92Lnsz9iNYBEeMo/yOh0UodylJVN+Rdp?=
 =?us-ascii?Q?y5Esud/HvMyXTOFvcFRYyG6eAUAj8mmYvEZiqGET+jDoDvKHJE2JeEd6kUmb?=
 =?us-ascii?Q?irre+GnVnXUnQX0alpYw1cXTgQVZdpf6NsXOvjM3+UUPJr+Cs92LunPsXqiD?=
 =?us-ascii?Q?NJbnhM3tXdSnyWqzj9zNXU/uF6WtXUqcjzaokJKclATPddhGAPludJIRNb6p?=
 =?us-ascii?Q?mz3c8LZ5Ss8kW2+w6TUZ96MQkFNkyCtloWXKAmQdgyXI04buvSyIw9tJXSKS?=
 =?us-ascii?Q?Mk39J8vhRDt7lMsAYuHXdt9tGa+Gic9bOcqI4x1MjL5S5Ext7Z8uvZNIVvOM?=
 =?us-ascii?Q?zoOWGYfKHP38B2M5MBKgS/22faqUGDe6OC4xnnUL/JnneOh7DJ9PxwtaTduc?=
 =?us-ascii?Q?5kg2/KPBrB6ZH7AGRvTjWPpTVmLNBlNiwGxCrCJT/LoDAmyeO/Ylf0KBvU8j?=
 =?us-ascii?Q?Q4jZhKhTXgvqNt0Rb6CjPF/FRdLy728IEQ2aqv6H?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9673ce-8b77-41d2-5db9-08dcc1120950
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 12:17:19.1646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8teAndps4zYm4wHcW6/y6XPp8b/wXwuiunZvjkT7/MDPB17pgAL/oGvGE/+hLguFnOvIDNVJOTaIveOsAWAAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6285

devm_clk_get_enabled() will call devm_clk_get() + clk_prepare_enable()=0D
and the clock will automatically be disabled, unprepared and freed when=0D
the device is unbound from the bus. So simplify .probe() and .remove()=0D
accordingly.=0D
=0D
version 1 changes=0D
The changes for davinci have been removed, as they have already been=0D
sent by Bartosz.

Rong Qianfeng (2):
  gpio: stp-xway: Simplify using devm_clk_get_enabled()
  gpio: zynq: Simplify using devm_clk_get_enabled()

 drivers/gpio/gpio-stp-xway.c | 10 ++--------
 drivers/gpio/gpio-zynq.c     | 10 +---------
 2 files changed, 3 insertions(+), 17 deletions(-)

--=20
2.39.0


