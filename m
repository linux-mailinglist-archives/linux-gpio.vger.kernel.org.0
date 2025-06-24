Return-Path: <linux-gpio+bounces-22037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4676AE5BC4
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 07:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01BF43B105D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 05:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE23227581;
	Tue, 24 Jun 2025 05:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B/EfH9aB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FDB35946;
	Tue, 24 Jun 2025 05:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750741896; cv=fail; b=IoIpON2bqUf6PZ/2T3APqWSUQgCSnTr2jwYeyXAKcQ5sWbilwhsZlOICk/DFNx7s3rORUiwb6z58jdnI8oMxXeno3siiQ96G8sMQ24lRia9c59900vw95MsZDsSHSz0TiOFDl0iSuW9gtldtIt61SR865UEwKLc2/68ZrW5BXkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750741896; c=relaxed/simple;
	bh=SS+HuKvmYm6PonUS0/RfYSbmWy9aKNrtSax0nX8jB7w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gp5e4WZe6jk9ePrrHkXYTt1fT8Gg/6h93AFnIgneYZn3RqcZ2YnDtDEE0V0uTuru9KAGaQwYK/kwTAMvvQkM/TUnP4Vr88eCPV7uyHsm6xEsW59FqaR9Ra+HdMbHqUy15tcznN4ZJ6vFRHzrx/sLeZT4z3aw1UNRCxyyVIWxYfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B/EfH9aB; arc=fail smtp.client-ip=52.101.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EW6DFXO6r2lT48Zz+Yzi32MCzGhPCy6KDw1xuBWfPsyQ4JxTuPgqRX0lVIP13i0DfX4hkLrOW0iHUNGh8xhN5cPXIRyk2LDogyefd+UfsgDJEMxhMYd1HBfLLf8/s/gG/QaNVvt2rsO75ywnSvQOIOoqHLhwweGO46wqTKw0AzbnFuj1VLxLQReTwX/1KCvgAjhkjDwxnMcJSAWIhFMrtbEuB/mkPVrU4JT0Amu+D867k6k88bJ7p4u+0GFSqTEMnenUACM1/wpnA95YWuAJanC+905zyocIdQFgCzo7TsnMO57F5Fn1GvK19Ww61SGdgErHrh1e7bOgCPP9sAd0VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xg34AcXN3tfQml7PWfHtKss9y3AUKp/kz4RAEGAwWR4=;
 b=YvhaoEhG6e85jsB/VL08Cw91yGC9gNB8EMc4rg/QYM9WXeG4abKbIAjmetefhuV9O5jdsvkdmG8uLnhlKvi4tE3Zh2DxIX8t4R3ZbleRU6Nbfd8eL/kx4H/mN67p5kiW9EEu1qcYzVqwWt86JpGYdsK6/HKhGCgGPXmWdWGpjaTlrO65VgT8OgAzeL+gBw/urn8MQu05Tv5MUUxYQcsU34bginAwWlJpV/otWyzFuZvRl5bvrHwdOhT5QAlTG5ib6cF7gEdTsaKtJniJXLLHyzcJMcmB6njZulb997kg5G2HD4SmFapGQHe89wOKy8ev2lmtb0WFXFWI+ZEgzmQI4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xg34AcXN3tfQml7PWfHtKss9y3AUKp/kz4RAEGAwWR4=;
 b=B/EfH9aB5dqnxQYXyhRsN9OI2pViuX3T7o1LkoEallvzYu7BL1Y2mJiiINjBSPlq9ylSwRxa+V9yDdUWTrZjX8za5QDH+nkIM94GeRPFZ8FTGAhzDaBM5djdofMGvvCYFPzBVaP8D+OrzXGzdRumHciy+4BJfmZipcel/2eG0g4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYBPR01MB5519.jpnprd01.prod.outlook.com
 (2603:1096:404:802c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 05:11:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 05:11:31 +0000
Message-ID: <87bjqdraf1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] pinctrl: renesas: unify config naming
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <87ecv9ragd.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecv9ragd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jun 2025 05:11:31 +0000
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYBPR01MB5519:EE_
X-MS-Office365-Filtering-Correlation-Id: f17f7cee-d59f-4436-3fc9-08ddb2dd94eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f6c8rYltyb1kXhQEZrkaGkZ4YL3TJkaUAQFX9Hx64yz7/mskdLOZRaPhrfYp?=
 =?us-ascii?Q?9miqcRTNddPNRTCLXsS/r3k4EkW3TiOE34vfpJwSvkO4p28uWMRORHHvATPC?=
 =?us-ascii?Q?CcyTn9p04/zTNoiXPmLtKZ9KoR9rtfokkznDgy5xoU5fzogUgf057SeZk0dA?=
 =?us-ascii?Q?IbeWaylJG5DB12tF8FanNsJ+AYatxU9rN094ZYuI4nxSXZUDYUwg9QiH3ou8?=
 =?us-ascii?Q?IjceHnMgMEiiBLVQ3znTkzV6kRrx3/F30bgQ2f5QPJl3AO6d3ZX1ccnRiHWG?=
 =?us-ascii?Q?YnB2HCXZRdYwgBOdnSxOgqiUS6KfwTYGsU6ZkVSDr6ThUHGeVA5EFftSHqeH?=
 =?us-ascii?Q?ZlXMbugKU0yMe2wyuz9Q+YvNy+EntmyHjgM+BQxk0pGHf/lUeZTn+HfPaapO?=
 =?us-ascii?Q?30DAi5i1W8WITEuybCmjye+bUiX4g0SfXfpW7pmDw5UYsaEsq8F7fUYfDmOa?=
 =?us-ascii?Q?j16ZGMaBvBFWtUvoTsBy8It2gUU87kqq8G+fXi3jKFJRerVHXYupu6938o2X?=
 =?us-ascii?Q?bMNVOs5VAWZs/6QAaP+T3gnusXKdfapNPs0FdbAPeXXs/7Yeto/VXVsR2y+3?=
 =?us-ascii?Q?ZxMsVC7+j1jN3fjmP9WnTR9cvPkkjqgdfEPU3HasKvBqYg5cAK/mvenSpSQU?=
 =?us-ascii?Q?9od00t6VjNWZ6QlT6ZNyN1L5Gdyw2IWSCH25zXGpNwaIzP65i6iBJMfh+fnI?=
 =?us-ascii?Q?aidcaHVu9ff0Oe1EfzGM9X04mXKLzcMIls8rC961Yc7r3RBmtRIIAC+zo3mD?=
 =?us-ascii?Q?qQAjdZCBRjE4NFvpLaDyJVB+hvrDc7e57NYNrqLhFuCNpGiJgvrKZEmazip2?=
 =?us-ascii?Q?ntJzG/c6nK+sGhh0D3dCyVZd7gnHJINNJwusDmdCYe/+US0G4rmYqQiAiRrV?=
 =?us-ascii?Q?qcBXrLyMqLYI7pjjE8LESRbKN7RXmcvVqYpfI+Brt4v+F0SQinKJdfZoHgg2?=
 =?us-ascii?Q?eLCprHalBsBhIGObA+/DdioN3Zeeu8OZXCZ/nl/zxY/8suJzA0eCyngJ2Q0C?=
 =?us-ascii?Q?hFu3RrNp4QGHtAeknUc2DRijTuaGs8a0ERwFkaoeD+dKW4Uj9XOhZSB4xKmC?=
 =?us-ascii?Q?AF/nZACbuohVzGSKNO7ymSoMe//B36jISTfjcx9LWDCL51Urq2bbYB1z9jws?=
 =?us-ascii?Q?yDwft1KOjyA9X3j8NmQZ/exFnQSqmZFP48wBfEkv777CRPwf+jX2iXdKFgiu?=
 =?us-ascii?Q?9cvDbbfyrvSvwPtqYBpur75DTiPuX8eWaZW1dJShRA2GLKfQknoKrp57T4DI?=
 =?us-ascii?Q?uEq3OQAtbMq8bSxM+//1notuRxlHjTQ5e7YomfVvOB9J8Hjo9lPaOfqakBxT?=
 =?us-ascii?Q?Qlw/O9fqV+2vt3r1YhI0XCeNQyfDeN7cwJmTSkR3vhUVFVlfBs7PDPa6V6KJ?=
 =?us-ascii?Q?nLDT0kobVJzOrHtnUfPzieraeWG+eFFb1VQfKhju3H424Z97xtezROJamsL/?=
 =?us-ascii?Q?9QYjdy6NiDWzMJ8ll1MJ2GWNzcvKp7qTrEv9t84jdkXidx/dhTil+g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h3Pa4NE5OmdQeKZe/sE/z3qLd9drE5GjnvFslfkcFkAomCwa47nNoWcGM8xn?=
 =?us-ascii?Q?0a0Z2sWOLxVeWFMzNIxSRQ4TekE7WgJkSdfKh6F3cb7YVCcWVD7tNXF7Qvzi?=
 =?us-ascii?Q?s1HNz2eJQNSc1hiY7262nC0T2fhOMQzub7rhDKvI0mb1FizkkmT9fN0E/rgG?=
 =?us-ascii?Q?93OG8eOQmtRd9mcoKLgqIyAwWJic9Nfdw1nzPOQPPu4wGOwlQ8Z4yA013drz?=
 =?us-ascii?Q?t+nlf6O+E802h5tAVOlkuB5HCRALDGhTJdXqB3CDU2yHb7zefhvRYrl1ep7r?=
 =?us-ascii?Q?WFp6tPC42JugewwAyX50p+msXZufqxxzYpfwcgyRwFTUcZvTTb0E53fEnwuT?=
 =?us-ascii?Q?JhjizYAQrHV2iIX19s5NiIZWYxPugwxTg26JOCFW1MQNpIjbka0Jw45SE2z5?=
 =?us-ascii?Q?2ucwXlOxLDToM+wUczgaEahPpMx3sfXIXDtJr14wYc2W27Jvk/r3J2rLXr+R?=
 =?us-ascii?Q?+niOu0k8NMPMrKpgYC7NNFqvLMvJuH/93uy4iW2EsYCU7sSnYZNb5FPr6f2G?=
 =?us-ascii?Q?3r5U49HVDnrXhbNVlNepXpjN4Tk3G879k29wFvImKXGXZ2DewWryEBw8n6SA?=
 =?us-ascii?Q?FYGY9xAY7G0DocNoFU50n76mOW5djfSWONG75/6mBUKyPptxEmWqs6S7t1eW?=
 =?us-ascii?Q?28eb4iu+bAlAfLp5yDbxdr+eX2PUCGAw/vs1AH6HqN7rLwWbh/+ygBF/aiA3?=
 =?us-ascii?Q?RC9+Ao8H61Anr2Df2/Z8CnhJJ0FS7hlEywYy+OfzcnWH3pK31F/0N76TI0j+?=
 =?us-ascii?Q?wyhedsO3cUK0ivGYuaF/VKuH5aIQoGs5gSET+/5u4v9nAJwJ3PEZyfTqK+We?=
 =?us-ascii?Q?2aAopqdJkC0oMwzayDTXjRMKDBStIur7qnFTugfZIrIe9wFZhlIKiiWrZW9K?=
 =?us-ascii?Q?FynFfx3iaVh84yIPfs/PRfq27RZV+ruWGEZaNY05Dv9oM6uOlsyh3/n0OyR5?=
 =?us-ascii?Q?lUZyisAZhgqyPJlSbW61js+U7/yOkHyp/k02Rbzc2HTyM1l4JdyETFCfCb2t?=
 =?us-ascii?Q?ljRA1PLO4PPjtrhj1EULGY+e43D3MuByHYPIZ94LDEOzaVxThP0retBr1mKj?=
 =?us-ascii?Q?maury/FgXl0zxD1x2aEvzlSCQ9os1ebsqUTe3DV3GiO+hW0BLUeScUiFKDzi?=
 =?us-ascii?Q?cgvyOo1gsAbP7LQJBESv05cpFlhP0Z/Oztl03vtQigdJPoNAmO3aGm/BbKuI?=
 =?us-ascii?Q?z8D2WY/kjA7ozUHKvNRXcE9gV0EBcpvqcH011TkCuE01sPkiCGb60yF0XuSC?=
 =?us-ascii?Q?19oiaIX/1cCo3xN4VXY0dyrfK3I6gICVHb0fHoeBBQy3xVMeUT456PQ2sG06?=
 =?us-ascii?Q?sU+tQHofff9W3Zb1eRUeuZYOMY2BuVrdbPFriUR4p1ld/KRSXvllwYeZqhym?=
 =?us-ascii?Q?SQvMZ/zv3K26ZT33nNQCfPVo4M98be/wE/pi3Zu1hC/qvylypvqpmdwcDnWA?=
 =?us-ascii?Q?DdnaOMJmX1HtNbUIbr6VPs6FF/HfrEm1Y4B13WfgBXXePh88/eIMQpT2y/su?=
 =?us-ascii?Q?KYsVFfymobAiRv5ozo6O7qrTELRod8qCdZWbxJG/V4EnP68Cue4ApotLY9SO?=
 =?us-ascii?Q?FiwaMZWaHlqtxKbfSu4LSTkr2Ucjc9NRDBorMyKUw/WIsZrz++J8MxDK2IJC?=
 =?us-ascii?Q?LkRuMI0LmgS4DYpOXfyDdqQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17f7cee-d59f-4436-3fc9-08ddb2dd94eb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:11:31.3353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0knuTCetDrQ2yPBtRQ422tmTneQXzCLc9gbMY9/WtHvR5c3hwSXEZkI+MnN6tdWU35mEG2Bq1w0YBTdt/+N+NcTkZUiwKdeBFKXWzj+oKmeGboO/1HW3xiTFjxwrk7U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5519

Renesas SoC has chip number / chip name. Some SoC is using chip number,
and some SoC is using chip name on current Renesas pincontrol Kconfig.
Let's unify "pin control support for ${CHIP_NUMBER} (${CHIP_NAME}).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/Kconfig | 66 ++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 5a30134edd54..b955fe395a65 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -87,123 +87,123 @@ config PINCTRL_PFC_EMEV2
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A73A4
-	bool "pin control support for R-Mobile APE6" if COMPILE_TEST
+	bool "pin control support for R8A73A4 (R-Mobile APE6)" if COMPILE_TEST
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_R8A7740
-	bool "pin control support for R-Mobile A1" if COMPILE_TEST
+	bool "pin control support for R8A7740 (R-Mobile A1)" if COMPILE_TEST
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_R8A7742
-	bool "pin control support for RZ/G1H" if COMPILE_TEST
+	bool "pin control support for R8A7742 (RZ/G1H)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7743
-	bool "pin control support for RZ/G1M" if COMPILE_TEST
+	bool "pin control support for R8A7743 (RZ/G1M)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7744
-	bool "pin control support for RZ/G1N" if COMPILE_TEST
+	bool "pin control support for R8A7744 (RZ/G1N)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7745
-	bool "pin control support for RZ/G1E" if COMPILE_TEST
+	bool "pin control support for R8A7745 (RZ/G1E)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77470
-	bool "pin control support for RZ/G1C" if COMPILE_TEST
+	bool "pin control support for R8A77470 (RZ/G1C)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A774A1
-	bool "pin control support for RZ/G2M" if COMPILE_TEST
+	bool "pin control support for R8A774A1 (RZ/G2M)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A774B1
-	bool "pin control support for RZ/G2N" if COMPILE_TEST
+	bool "pin control support for R8A774B1 (RZ/G2N)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A774C0
-	bool "pin control support for RZ/G2E" if COMPILE_TEST
+	bool "pin control support for R8A774C0 (RZ/G2E)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A774E1
-	bool "pin control support for RZ/G2H" if COMPILE_TEST
+	bool "pin control support for R8A774E1 (RZ/G2H)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7778
-	bool "pin control support for R-Car M1A" if COMPILE_TEST
+	bool "pin control support for R8A7778 (R-Car M1A)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7779
-	bool "pin control support for R-Car H1" if COMPILE_TEST
+	bool "pin control support for R8A7779 (R-Car H1)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7790
-	bool "pin control support for R-Car H2" if COMPILE_TEST
+	bool "pin control support for R8A7790 (R-Car H2)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7791
-	bool "pin control support for R-Car M2-W" if COMPILE_TEST
+	bool "pin control support for R8A7791 (R-Car M2-W)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7792
-	bool "pin control support for R-Car V2H" if COMPILE_TEST
+	bool "pin control support for R8A7792 (R-Car V2H)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7793
-	bool "pin control support for R-Car M2-N" if COMPILE_TEST
+	bool "pin control support for R8A7793 (R-Car M2-N)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7794
-	bool "pin control support for R-Car E2" if COMPILE_TEST
+	bool "pin control support for R8A7794 (R-Car E2)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77951
-	bool "pin control support for R-Car H3 ES2.0+" if COMPILE_TEST
+	bool "pin control support for R8A77951 (R-Car H3 ES2.0+)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77960
-	bool "pin control support for R-Car M3-W" if COMPILE_TEST
+	bool "pin control support for R8A77960 (R-Car M3-W)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77961
-	bool "pin control support for R-Car M3-W+" if COMPILE_TEST
+	bool "pin control support for R8A77961 (R-Car M3-W+)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77965
-	bool "pin control support for R-Car M3-N" if COMPILE_TEST
+	bool "pin control support for R8A77965 (R-Car M3-N)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77970
-	bool "pin control support for R-Car V3M" if COMPILE_TEST
+	bool "pin control support for R8A77970 (R-Car V3M)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77980
-	bool "pin control support for R-Car V3H" if COMPILE_TEST
+	bool "pin control support for R8A77980 (R-Car V3H)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77990
-	bool "pin control support for R-Car E3" if COMPILE_TEST
+	bool "pin control support for R8A77990 (R-Car E3)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77995
-	bool "pin control support for R-Car D3" if COMPILE_TEST
+	bool "pin control support for R8A77995 (R-Car D3)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A779A0
-	bool "pin control support for R-Car V3U" if COMPILE_TEST
+	bool "pin control support for R8A779A0 (R-Car V3U)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A779F0
-	bool "pin control support for R-Car S4-8" if COMPILE_TEST
+	bool "pin control support for R8A779F0 (R-Car S4-8)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A779G0
-	bool "pin control support for R-Car V4H" if COMPILE_TEST
+	bool "pin control support for R8A779G0 (R-Car V4H)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A779H0
-	bool "pin control support for R-Car V4M" if COMPILE_TEST
+	bool "pin control support for R8A779H0 (R-Car V4M)" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_SH7203
@@ -219,7 +219,7 @@ config PINCTRL_PFC_SH7269
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH73A0
-	bool "pin control support for SH-Mobile AG5" if COMPILE_TEST
+	bool "pin control support for SH73A0 (SH-Mobile AG5)" if COMPILE_TEST
 	select PINCTRL_SH_PFC_GPIO
 	select REGULATOR
 
@@ -232,11 +232,11 @@ config PINCTRL_PFC_SH7722
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7723
-	bool "pin control support for SH-Mobile R2" if COMPILE_TEST
+	bool "pin control support for SH7723 (SH-Mobile R2)" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7724
-	bool "pin control support for SH-Mobile R2R" if COMPILE_TEST
+	bool "pin control support for SH7724 (SH-Mobile R2R)" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7734
-- 
2.43.0


