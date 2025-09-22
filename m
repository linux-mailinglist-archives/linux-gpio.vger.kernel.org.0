Return-Path: <linux-gpio+bounces-26472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 602FEB91B03
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C262816CE4B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33151263C8E;
	Mon, 22 Sep 2025 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jZJ03pX8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010060.outbound.protection.outlook.com [52.101.84.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D631125F784;
	Mon, 22 Sep 2025 14:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551103; cv=fail; b=adK27bwjxB3/f3Cp2Ty5lKVFaxrJ2PxBWE6xGtw3H3fE9xVaP3OQHsfBSIcKlDWy5gbqtu/BU3d0pTWBn/urG4V7QSrSwNJJ2EbyP4xKPnrh5MM0aV+4R6mvjNdRR87uRvsOReL3UenXC/tgfH5RKturmcFCosbgWnKyw644gUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551103; c=relaxed/simple;
	bh=4MpaMekzWg1KwhiXiK9iybb8hyVzyL0t2aFSD7wpzqU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AFtFpA2btS0EkdyBt3lXrwjPNku5WlUApC2v7/+izxzG42MBjaf4FjkEhkKOpa3AeWwap+eBte+0fxtBeLvVf6mkKA9C9DJzbJHMsDp4QRT6uidGDrxs64J6v18EyTYm45e0U04TersuX3S5/Wg5IUbAc5707pPAaPK5Cxfw4OQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jZJ03pX8; arc=fail smtp.client-ip=52.101.84.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtxagVaj8frW6pLC+eAgKyJ5WXvcW/pLn1XyzF5kto5rTypV/FUp4/vmyaiSTDfqNoAe5D3S6VqnTDeId8zcNvzzv9tbFMHKt5oFPe3wpBQaq4cJ223Hu343HYQs468ssOGXBfFY4JsvfqLrMi3vrAEmGxvuPyfzD1qcpky0UGZ1ELAQ4e1L3yGwEKZLvCuhxQIKz4PZKePh66XEt8+S44XFFzHttmhAy4f8YC4h8AkfGb8DI9TVfoL5gmXOXRZERcprC9m3XXFC79XIIQjhRz+vbt/hzJoaxulpyHZ7TEg+vt/woWRJXQIVGBZzgtweIp1tjcRI/N/NERMexbV5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xC6fu1qnuaqNFVI2nMNhDYtS7eFU6eIiBP5DqaY3OYQ=;
 b=x7i/NlRNVbrg7EGwAkhAL55xqjvISkz1OVQB1O6+CrsqZ0TTdvdPggXBa6Mq36XO6xLGjtsUbUyPqpUMksu0aGCtgKBSlhUeOjSdqjApICafRY7UnzCETz9vdU1svoESc06aiNSwaDtBasps0jhVOGR0Ukf/CULJeV229XU7xgeNcN5QoD9Da/jmWF6fAPcTODAsqJcNX0SHaqQMdsrfKccOFzaHK4ENUQK/SMIOr8KHHi2NF+31dWxGDKC+TUYfgQL6q6W1zQYgfZcKYvyGwxWXbivVRdNJ6ScsuP2jbKJrHJPGiMgzN6R6JQXu2NLgCICwsBsK2bXoxIHJuVtiag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xC6fu1qnuaqNFVI2nMNhDYtS7eFU6eIiBP5DqaY3OYQ=;
 b=jZJ03pX8wfcsfAWnacDQga6D6P4JpxEe1EJAvAE9Pnr9kb+ytkZDHaEcVg3ny9UbmArfWFMK9X0vli8h5jOqFgRQ/9fANw7k167yjjY3Bo/ugjdIf10OROmw7GY7JBuuMM7RljtkSWoWGXPnIxteaLQ1tg+Yko43VEYsiGWvFAykxcX8MCvO5nWTxYQ0NSvgm8ix0lLCR5sIAxIQfGCLLoIyb5w+R++erLrm/BijDfPB/HxLiLFMSWYElbaMFq3DIbV+gp6Fy29gdU2C6/4kZAcjvY1Z4ggCQKpJdMGpSmP+U9WzI6IGEaU+kNG1FO2186gJJ6wVaEl4rkZUO7evPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:24:58 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:24:58 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 11/12] arm64: dts: lx2160a-rdb: fully describe the two SFP+ cages
Date: Mon, 22 Sep 2025 17:24:26 +0300
Message-Id: <20250922142427.3310221-12-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0039.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::20) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: eda44623-a4f6-43b6-022a-08ddf9e3cf49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qMG+i/Aqenl0Ri6Jd2pc4l9dHTB1OnKY+aip+ZDkYyLU6/FXz7TFTbyZINFn?=
 =?us-ascii?Q?uTL1DgRUNwezIXW4NMehpk+AoHmkmuWlL/CsYb2XAieQSg+66B9ZPQnwvgDR?=
 =?us-ascii?Q?zyTO9biHFNm6DXnTaSILmShvmwMTGa9jQBlybczthCc7EoXZMaSYLiOjZAXB?=
 =?us-ascii?Q?F8fS66LqP2UgFUqEz8ZLWUb8wthrut2j+MUs1BnHrdGyYzTlfClSxBE9PNei?=
 =?us-ascii?Q?Osc6SXB1nCZA0cSx8Pbe807qmdtxuP+VqVzNhNn6xB7r6MmiT+Kd9yx13nk2?=
 =?us-ascii?Q?XVsi9Tj4KJUqALTjDgeuAgDMYR9AEKQiUN1q+uMYSKt9kkfFATOZkDsi7fDp?=
 =?us-ascii?Q?MK1sSgcNAmjdaoVjtSDChRcLvWvK/GnY23CLp0CpSGFFJLq6ffRSQZXqDgXQ?=
 =?us-ascii?Q?qG+sI8nGS5Vnm+V4cW2X6pYf7VtznQOVfk+E66oLabzDAl2ywvUz0w6fVm8z?=
 =?us-ascii?Q?O1G3ZtABK9O+M8fv5M0vHoEU4/IE8KhW8Jvlc6Js5G6F8S7mjCH2yh/yZILl?=
 =?us-ascii?Q?JEgWTsWxsxHFerQ5WMgKQs3U/fp8FCC3kKa7p2I/Ukn/F1dTnjPgEVoShozk?=
 =?us-ascii?Q?SnLnSBmf5EhvGV2h3KzVrN/oLEXOrdRhx3HuSs97CNkPLPd3zBtvULjtrv6x?=
 =?us-ascii?Q?cJAKX9yBl11H4UolmTQwovlMce1qde3GnkUPfv1KL0Rr6EPG7/g46PZEmFJu?=
 =?us-ascii?Q?bUa+nhGf6nxabjCJbneIqyeHnoyTb1hkDww0BensCxm65fiKa8q7yGpBW7DR?=
 =?us-ascii?Q?vF2oj9Gch4rdwg5DnlqJjXRRFjPMamh77LENN/4JBjs3AgRcfyXY2Xz0G1lS?=
 =?us-ascii?Q?kWCJmaYgA4Y/Wq4fsjQ7mphyQ4NGM3SDVRRwvLr7vezWAvmc+7EllLnAIeri?=
 =?us-ascii?Q?UCFyy1+ozoLAliU9e6tIDKHszvAewde19iKoG55ruKRB6N3px1Zg5u9yswVL?=
 =?us-ascii?Q?HyPPI38SQpOlBKBOsuEKovpARmxAwrUthTPPn+dBjB97LZv886efvQkWss5N?=
 =?us-ascii?Q?lC0tujwuF89Pxb/GK+rMQky9CesVcXX6x3YotMvHobtFPjobq0/gXLTbQTvZ?=
 =?us-ascii?Q?lIAiIHXq+MekVAaKxgpALYH9Y1AOe2xtS4kLHZ6QHRGUGhL0CeJCZq/Ol7fU?=
 =?us-ascii?Q?UQU5SAi9Dcyn60B0H5bOu0MKms0UVVar/hAlvCNVh67PAhNH6BLrMhgo/LYY?=
 =?us-ascii?Q?fm5Zt9qmvdqzyXeNSNOaKke1jlSigzA9IgL0ejoXs7y1WKAR3bOUXEuZnIG/?=
 =?us-ascii?Q?/qeqYXUaR/PnVuPTl/5bEq2SXIyngjinLNAWysLRe2Rl05T75G6DjxW0538W?=
 =?us-ascii?Q?Lfzk1U+kNUH11S1HTbLIzSrX8kb9T7PowRj9x0KG56PLl5uy2LC447z8M3RE?=
 =?us-ascii?Q?VFaTS39DALy5YUgxiRzd56m2nbul5V0lxy4Vxcv4sTdW4VXtu2xWqnxrW+b0?=
 =?us-ascii?Q?NUTueXync6LSD6YNnbTh7oMRdOS6n7Nu3LwZCpNP2pnR1koiqTaYFw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nf9AUU2Jfu63lUQDaDepNqIEjWvjYKUHOw/DpOpVzeKrT0/Gki6ktczXjZzv?=
 =?us-ascii?Q?0PX3CAIIvg168MpKSRXrq1hmXYl/y7/K+NiNpDOXEH0G4ftW/KVadqjnCB4A?=
 =?us-ascii?Q?se6QbugqagfblF3givUHNg5+jVeIbnu3r+zAF+o4+blfLpyRLH2Jqa10upCz?=
 =?us-ascii?Q?KBkl0pkU/1BBpS9pPmU4nZ1wCJU1qE5EzS0NTFN1/NWYZ/n9AgLwhzolpcDX?=
 =?us-ascii?Q?Ds023DgXJZ2IqJyzN3I1RZcD4rBSnhkwYBetqbqw8GnIaW9JVk0TYa/+7ZOl?=
 =?us-ascii?Q?/neuBUYbHKIjYu7kt0JMbTNzNmvaX8STYWq28k4I3xuMLpc+hUyuBkbg/G8M?=
 =?us-ascii?Q?WjfWTlBGVzrBhisxhKTFjo1zl6vJPvKiq2kKE9ClDe5gGLX1Ju+dsvrkElj8?=
 =?us-ascii?Q?tSSXaCiHF43p0wVDub0QRPEJ5s3B2Qlyb2sGwqPjUd5+5jHvt/5XQ99zByvV?=
 =?us-ascii?Q?KLFlv/VCEgSCwNMG3Rh3xcOM8/Eya7oqblXM1m8u7bRXTuBcnkD0ayNsb6hs?=
 =?us-ascii?Q?vNxA/cNvDT1LFLB7ycFnJgFtzhxJJL9u2DySXddzWEopvFMBV2Ws/jZnR6RR?=
 =?us-ascii?Q?0MntUFVWqAzvL8E3ey72wNA51QvpOoKBIwYYnsvf5ocfsRArNPTFpoQl9si7?=
 =?us-ascii?Q?rddi9kn+53L6KkwHDttvta+EE3rF2qOlhnH4tT2xF2VphYbwBO9D401mFxyH?=
 =?us-ascii?Q?hQsWZUHcVikNZTPLSIK8sr7rqdzkrIu3lP85SsTHJhVZKAFikqohppB8caQM?=
 =?us-ascii?Q?xQicT98+EY1xa89ZHUxzpDP7pfZkFaphzd+3SgLuxaaXAdT7LIlhBWvSbYit?=
 =?us-ascii?Q?RqhcIo69Eh7D+304NSUjclcSCvZWWddd6EmP4baSnZw+2CQE7ldmV0Mg+ddS?=
 =?us-ascii?Q?7kC/18pmDPKLrNlL5ooiA/pY9uL2bpEOq783l67RmvIcOol99z+tY9M4Y5Zd?=
 =?us-ascii?Q?7LM0vTu88iuvjquo+54fKQWsvCGoHlmHLhFRpX6lQis+BC2tIjYL3ZelYHQM?=
 =?us-ascii?Q?zw6wgjcXEa9Wmky56Ru4ypS7ojQ2pb2iPQA2NpQ9FyI8rhlUMwxChQmPn8M9?=
 =?us-ascii?Q?Gw5903H1zHD+ymFau8BO/4RRMeOA6gVCWdoocPMC6u0qBGFCH/GsXacwxB7P?=
 =?us-ascii?Q?MPPbhqWxy0rCDAfuCC7TMG0zVramJr4VTHMvSJwLX2A7eiIDLZqt11W8/FbD?=
 =?us-ascii?Q?8ycSzGX6YZNJjnJvaGW87bD1iDIp/7nqMF7YsPqLw6FXiJM/ZbqLWuq8QzZY?=
 =?us-ascii?Q?2LgbMs3OevfjgnM8zv22ubXZHwEvEA8bkgugsUp/yvpqBDgTDIXl8fGsYWND?=
 =?us-ascii?Q?3CbG9o6qnWAf7XI0sJADk5Xtnbb0Ohl0Eio5lllEqWahOqW8jEIttXqbZJC/?=
 =?us-ascii?Q?wxC335jylCa96A+dVZvuEIqosNgSB2Bbdlc8VDZAEk+xX3z8Lz5BrgTkGj7z?=
 =?us-ascii?Q?t+gBExAOt9u1vBAuyG9pvTgWItrbV5/7GCXYxwS4uuNIufgWY3xQLQli7fPk?=
 =?us-ascii?Q?ljHKr6+F/7KkOG0i4UxcFXJF5ciy6WmopXtp+bP7B4iDwkzWvIor0L9SgUtH?=
 =?us-ascii?Q?qyZbMwhvutSFVYZnK59AjEab+vI3DieqyQXeTui7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda44623-a4f6-43b6-022a-08ddf9e3cf49
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:24:58.8083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUpRYA55fBwZ3arMLSbPUD9ji5zLsCGRceUkYi0TYzESveLu27Kwurhod8ioW9WqrVDYJ2p7sf0rw5vR3uZMBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

Describe the two SFP+ cages found on the LX2160ARDB board with their
respective I2C buses and GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- Moved the reg property before address/cells-size.
Changes in v4:
- none
Changes in v5:
- none

 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 4ede1295f29d..1c1ed0c5f016 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -31,6 +31,28 @@ sb_3v3: regulator-sb3v3 {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	sfp2: sfp-2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp2_i2c>;
+		maximum-power-milliwatt = <2000>;
+		/* Leave commented out if using DPMAC_LINK_TYPE_FIXED mode */
+		/* tx-disable-gpios = <&sfp2_csr 0 GPIO_ACTIVE_HIGH>; */
+		los-gpios = <&sfp2_csr 4 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&sfp2_csr 5 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sfp2_csr 7 GPIO_ACTIVE_LOW>;
+	};
+
+	sfp3: sfp-3 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp3_i2c>;
+		maximum-power-milliwatt = <2000>;
+		/* Leave commented out if using DPMAC_LINK_TYPE_FIXED mode */
+		/* tx-disable-gpios = <&sfp3_csr 0 GPIO_ACTIVE_HIGH>; */
+		los-gpios = <&sfp3_csr 4 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&sfp3_csr 5 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sfp3_csr 7 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &crypto {
@@ -236,6 +258,31 @@ temperature-sensor@4d {
 				vcc-supply = <&sb_3v3>;
 			};
 		};
+
+		i2c@7 {
+			reg = <0x7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c-mux@75 {
+				compatible = "nxp,pca9547";
+				reg = <0x75>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sfp2_i2c: i2c@4 {
+					reg = <0x4>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				sfp3_i2c: i2c@5 {
+					reg = <0x5>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
 	};
 };
 
-- 
2.25.1


