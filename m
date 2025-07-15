Return-Path: <linux-gpio+bounces-23292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77BB059DA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 14:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 691B31771C3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 12:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732542DFA2B;
	Tue, 15 Jul 2025 12:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LDfYTX16"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011059.outbound.protection.outlook.com [52.101.70.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F32C2DE6E7;
	Tue, 15 Jul 2025 12:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582000; cv=fail; b=l8v1Z3E7+430U04kPofC1b9CJJFsppvFW2poGOUeKErHC8m5YBT3Cps3a+D6l2qMg5I2L2M8mf6IHUrv4pL0XsuemOLzNXxtu8x4Q6emdOeDKTI4/K4wia1AiQwYFwyiA/VEhc3g5Rw82xLv/rXZTNETuSaQ+7viG90zNzbmtXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582000; c=relaxed/simple;
	bh=5ZmJddqzdJnHeEkm5oCwv86pNMaOwc6SSSj3eFAXRCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eV1j8UnIsiIsMMzsoL34pgzE5AHvf3IF9evlHiWYZZxIizWr5uSgjc07HFtBejQe/QTiTF6V/9NEd4s95t9b0YiTrnL4xKEBNBPbjZpFN7nxEWA6JaO0nMqC57Z0ocXfS+FxodC33JDUAWk+2F0oZJOI6QumWknTgWt7DuNeekY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LDfYTX16; arc=fail smtp.client-ip=52.101.70.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0h8mzc9c8qrX7ehbusMYSBp5NJLwlWtXo3BL1Mo8UJdm9MsUNq6tMU9rLkMBdHnr5XZi44yeqq+lQ7mFuII3zfWffHfRbprextxfVyJDyNuoNRXkb1GUxOUimPCti31ypIdZRFB8oRy/1Y0ODsep9FVmS8pYLTJ1phWbSJlZYG8Ljhp3u5P+Afzp/K2mdMUFU4OIqqV21V1vvjUS0tXCV9UhJFVoOZxQ+XvbOryMu0mmELqa4QklUHKD4qnxgPMcOSvLyjuWNImtqt3RRyGgM1WLGW1V/Eg05iKzPQmYMFuDuLtSLPPaz3i24wGS8oLhejM3CzQGNiAd59VImv2Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZZ51n7cf09L4ID6YFk0rWW8hwvrGiybfbo5R6DyPyw=;
 b=pwaT076GG7A+Z+8P8We0E6Ym/DO02KoqrPxBi+WgAOwJ5OMiPgW0pMWasklRwK5f6F2QWE97fXF1vGw6LvR04HXnhWkpBQmyk07PhuY5uzFEjGXqqZTbQlDGlOH7+sLBKHaTUbZSb4kjarWqOUjEasQFpjCrqDeTU1WhbMJ2xRY1YDtpPRdFNz9tSP3exSOJbY8mXzXbA7WfHAe/PaWVT9sLAlgV9AZ5PeXUS+sdtOFMTh/V1sgD+Fa9XGtrolGyC3xNAvFZs9PRgAda7/+va5o3f1zhpQqpI/7zNoRs1+XeWXwweJBQG4brpRJ/YDqvUlIs80e+JIPLYTxbRsJPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZZ51n7cf09L4ID6YFk0rWW8hwvrGiybfbo5R6DyPyw=;
 b=LDfYTX16meCWp9kq85E/w9YIwx8v3YXQ2tF9Cbfu2kXmqmn5maLnJTuUMXiJHitJ2hFxhgYCqfbuHZup4UM3ZCZRPteKvEDFpek4iKQlHdYfBuwKURs1mRNW8R4HSoKza11qMEUyiryxbAVbEi+RjMy9Rr+tcFlJv+COAw4ubbvaIVyv9aBXfOu6/mAGz8jw4+DW7zP7VSS5tCieAPvubSByp7HBKYp6Cyes3QDfmseIBEkFwdzdew//gUCxBEJoNY4GZ+OMCJbUKgENEjmoNY3pk5oYyG33oV5WX+yf5XkYDtxn+GJGO52CaACw3CwzX1KbPKQa4tHras1LvuBBFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DU2PR04MB9179.eurprd04.prod.outlook.com (2603:10a6:10:2f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 12:19:53 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Tue, 15 Jul 2025
 12:19:53 +0000
Date: Tue, 15 Jul 2025 15:19:49 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/9] dt-bindings: gpio: add bindings for the QIXIS FPGA
 based GPIO controller
Message-ID: <n3wlp7pncug3gta2raignhvubqpzqk76dmvewg5bosu4spx4h2@hr5r73tsxip5>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-2-ioana.ciornei@nxp.com>
 <20250710220132.GA4038128-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710220132.GA4038128-robh@kernel.org>
X-ClientProxiedBy: FR4P281CA0293.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::6) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DU2PR04MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: b545593e-0a2c-47dc-482e-08ddc399e718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0MVd77/kR7xkISiP5ZrInnGoObsUN+kf6EnD+vuZavJvXmPRYV3roMwrdWGf?=
 =?us-ascii?Q?NDBZ5TozKjduSPy3ZlXtwDynd8nl65Uu3tPwKkby7SkzQfCpRRS8DNY10Z+r?=
 =?us-ascii?Q?qjNiUTfvlRs2HIw2TkvAIN+dmDELPcMCllqMLyLEwRSjOU0oX4hrTBW7OqYP?=
 =?us-ascii?Q?v0h5S3ES9x8xK8ZDA6JxDmbwv/O5xGvcRvC9dpq+LtM1g7iMRQqiJ4ngTsY+?=
 =?us-ascii?Q?/zk+dfDBuImNXg85japAqlqEhkZQ+0VV8pmnuwa/u8SUEgXXUiZj2XbhwTdl?=
 =?us-ascii?Q?oPuQQRfPNmexX77OsSq6pJcleSmvfBcJiIBuEj64dsgAL9CpGNVnpmFXFUlE?=
 =?us-ascii?Q?MsdXb9+zSuHGamdRbdHaLEMeAzqOLej0vNqabXOupovhNg3rH+0VMMNc4Nyq?=
 =?us-ascii?Q?1AiwJ7bTgs0JWu4mPtUPLL1NBx4DPUO+OXycjCEDnQrVqYQv4EJ8tAHqJECF?=
 =?us-ascii?Q?iYfxGXcdrzIkrw9EO9hWO8V+NXcDMyGyTVQgmMjTu4muW01pT3wWj78W5wSR?=
 =?us-ascii?Q?3ftKjfFLJ8urfpJtcU9i3swOx2qFTp1c75T2WjU7//H2b/xNstnbaIZatjGv?=
 =?us-ascii?Q?KlXepuKyslgKar5xKpZ+4kjj760YRKoxZdMAxa0lXGFX9/u6HI3lp7z2v+W/?=
 =?us-ascii?Q?9Fi3ZdWX5iM1sChf7UYtpNfyfJHBoDpO3aDzA/PH14GuLpb2ea5COxWONNUg?=
 =?us-ascii?Q?jyQpy0b21l25jYWQ21JnKRp75GKRneWiEM8jmI627jDBS5C+Y6SMuBEHBLQT?=
 =?us-ascii?Q?FeZ1BWHDX5RtGfycLf+8HKiYuFkPgtabIUaNnkkhjrw17jnbsVRZqFWib1u2?=
 =?us-ascii?Q?0eNbd8HP2ALFA17WVeJRNVWn+oC+qZ3M5ei6DQdiN506ysXv1TXO3/a2TjV6?=
 =?us-ascii?Q?w9SHLe6D5AGnQYe466HUUQ4iuYTttPAL7G5vx4Sv6bk3mrgCjD7/wek1vytZ?=
 =?us-ascii?Q?CJjy2Chwts6GMEN2SAQ8ChZ/DMdP+44Jo2Rl1x5yApHcXdcYGxTNETOSAhO0?=
 =?us-ascii?Q?FzyZgPUgzD5Dci0rVQheyfj/VoHMwNsg4RaHDhQjRFk7nEyuy9pLEMYZJQrV?=
 =?us-ascii?Q?5IXDYx+gxVdLSo3UpF6KvzLfWJEa64nekQBt4qOJzAY3TDu/sdYkWqMELtfT?=
 =?us-ascii?Q?G/DHVnY1N+WlMfNQ4Bh6iwJw8JAsHC+7bSyWcMCFQC74J0+vvxcwmBdYdhS2?=
 =?us-ascii?Q?Wgr7y59N72E9PWr+6DdGVyKSfYrJ1UmxCFoyOgdYK6aImWDbGTT/udZS7VO6?=
 =?us-ascii?Q?u20o7zg2tNSWi2dlFB3wgixVrVcmRkOyK/ilp0EC2xpNE8cO4beeTuYYlrUX?=
 =?us-ascii?Q?l2r9eCSasAyvrTSj1f1NJ8UXRCJyUZyYqNiomWh8UjfSm07oFmPikIVa0H/l?=
 =?us-ascii?Q?DDdijfllhOzbwqLeEk8xhvZDu1e2N0XzSfp9NSmdmaB0680Shw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jdQOFFyxi+LnGrdIG7mxROYIUokaTQ2iGhkon6jOmS2In8rZbOHmiNH3dVvX?=
 =?us-ascii?Q?i3Y8mZzaQtvlTgNt/4RIT6+ZY+l5GPb5ob7ez9jbfnPXE08DKQ+S6nFNFzwY?=
 =?us-ascii?Q?lrnCX7toYMx8i3fCA0w4N7GFmKGVz+ynpgwKDWAzvKcGYyB7OTpHnRXh9iJJ?=
 =?us-ascii?Q?b+LrzpL5ILsOHkg/LVqJJAJaZ0VaTHRN+/zrPEZQXvgB70vFOlURgwzj0GLh?=
 =?us-ascii?Q?SqLbJjRmO4DRptRbmTpznlpn1RjKFfQft0K5udE9mQUaa+/WhIuCd9xOBb3v?=
 =?us-ascii?Q?3lge6k760lY/VRboeqIy7BBUdmACtD4XThMiv565d+0all4Haf6jSdo1IJ0y?=
 =?us-ascii?Q?M+Oj/7M2xMWZwBvV4DmJVCqRL1G8ESKRvpn6kWc+FgNHZQ9n3wjU500O/CqZ?=
 =?us-ascii?Q?+ncbwTHBnmfXI/36zOLF8RMYkNRrGOXqFchpdRyYxOKHNS5N46lEqZ+wEqnc?=
 =?us-ascii?Q?oTIbffYuow7tBGmZHdmxMgr5HwF/yYymxe7h3cQasb3CNibOYzojxr5D4UE+?=
 =?us-ascii?Q?QZPRVLRU27Lf/0KuP3uBHJF3sg5WS7taEz8/prFu9TicbOYoz75sSoDNG2L4?=
 =?us-ascii?Q?z/3pNEmVnfK5pUz1dYPJ7dTSuwrMu9hXwCAI7hUIGV20oBKV0W2Fn9emHIqO?=
 =?us-ascii?Q?eq7n6JZbXJCYCgfQhIZhkIjsOzJd8nnIOjKWQW99nN0yUlGl43vOZ+nkVaV4?=
 =?us-ascii?Q?bc0XYi2QryfedkLV1Wi8qOGr6kgfSfGQqc6OLk9BLZyKl51ufk/oxEfAr/Xr?=
 =?us-ascii?Q?Wv2FwwdjcMFfAWNfoDvSMovrbcF6Bletpo1LJer7YNx6i5zBG7BeNZYky7SZ?=
 =?us-ascii?Q?A9xNsHmto/G6RR8iNcgUyAWeVPjK4huvtr6/aDz0ohJ0zO72no+fVJMof0P6?=
 =?us-ascii?Q?sJpgVymJhhjey3VaNoFoHCrd8NS07kFJnlYdAmAuTpAPb9mNXH06v4Vp3Of5?=
 =?us-ascii?Q?WnJD0MubxI9LAh/jLTlzcefoCLHa6NjN5FzhCFl003LjPXNckUer1QTYpm/q?=
 =?us-ascii?Q?T6n2Z5NWCJBXsL5cvDFbpILIp2onCr/IgZnQUZhQ41NzzZ9UF9r/cc5jZk2C?=
 =?us-ascii?Q?MidkGTWCIzAp7LvL4O4LjQXwGJ7XGYCk1gJx5PQKTZXqjUVobY5o9TVdp2jA?=
 =?us-ascii?Q?Jujgk5OpdNc4ps11527VfWhN5XaKRjTCQHi3ivzyZGgvcZMM+S2xWktTq1w5?=
 =?us-ascii?Q?lvd4ldYD6UOu7lobc5K2z/KR7J+1Tb/Ql1GP+sfF6xAiC1rlmXkwF98nVeWc?=
 =?us-ascii?Q?Ie/LN7+6K7AmD9cYydK+f12qAXHYqXOoWoa+v4iO3vYdea7lKnquNAH2wSm7?=
 =?us-ascii?Q?8NGP+RkmC0g0iKh9WtRWmFXDXVzH9HAF5/HOSYF/U1mohJWx6ImdQrin6IA6?=
 =?us-ascii?Q?/8pk+INzbMtKaN/dALsLJhsc/My4mdGiHjkPl3ZFxOFlMMMcHRfTcFcgSFNj?=
 =?us-ascii?Q?HxOTVf/ti9h29+G0LgIs6HZSLdDWkZ76h7crvL07C5pA3+lmV4gSfQbPNWes?=
 =?us-ascii?Q?mtbO5iVNY7iCZ49Nwbj4P430+lj0cPCzD6a/APxLt8ZXR6ioAjQ7QG+cKcqT?=
 =?us-ascii?Q?oHm9JADobP6fZu0O+j2tejZnA6N/NKDLaS2J3IR2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b545593e-0a2c-47dc-482e-08ddc399e718
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 12:19:53.6133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e64+i/vTEUZsnWL/hNWDEBc2mE5gGLJz3TW+IqWUJhRhVkS93T5UyHrrCYuDIkepfACmGVC2r+PMNCJscZPc6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9179

On Thu, Jul 10, 2025 at 05:01:32PM -0500, Rob Herring wrote:
> On Wed, Jul 09, 2025 at 02:26:50PM +0300, Ioana Ciornei wrote:
> > Add a device tree binding for the QIXIS FPGA based GPIO controller.
> > Depending on the board, the QIXIS FPGA exposes registers which act as a
> > GPIO controller, each with 8 GPIO lines of fixed direction.
> > 
> > Since each QIXIS FPGA layout has its particularities, add a separate
> > compatible string for each board/GPIO register combination supported.
> 
> This could be covered in my proposed trivial gpio schema[1].

Indeed. I will update the trivial-gpio.yaml schema (once that gets
merged) with these new compatible strings.

Thanks,
Ioana

