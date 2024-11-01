Return-Path: <linux-gpio+bounces-12472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B849B9758
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 19:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FE471C20987
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 18:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E528E1CEE84;
	Fri,  1 Nov 2024 18:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NqzVZEjO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011030.outbound.protection.outlook.com [52.101.65.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8741CDFD5;
	Fri,  1 Nov 2024 18:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730485379; cv=fail; b=eOPETEzV17N7JG0/MJKZ0AJ2Ws8JVPoMQE3BdDQyiWRVD+3Adu0y+vcrRKHqhAI2zm/EAaSdJJGIWcBL6DsK+WhlTokKkNSFFmXCZtjCjuZRFiyeuuGUHnQx2YNEKwc8vCzMV8IRkL3V2Svfxfu4v18gCmefTt8n79DR77qPHt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730485379; c=relaxed/simple;
	bh=i8V6awXBOVCH+D5MD+q1829PDF3MzWWgvLNY7zP9CQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HS+c5rPOmBAeepwHsS6MYvCjyZijtiSEyyTUOAuh5CWMhKxsOELZqavFDH0mrJTTn6ASWUP/kX63hZBFz2weNGoe36nvGqdjvo8NZA0llOlRuqceOHAq+u7BYSVzSNTYio0SXPBfZfUgtfI9FVUxAYzEnbAhKsXYkAvvONpIqRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NqzVZEjO; arc=fail smtp.client-ip=52.101.65.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnEkxeJLMhVkZNZx7+x+UT/lHLfJpf6l97OQa86ImAuLyAq9lWhlcGya6hHedqk3zDR0blTnPH7gq9ObNbNTGMnybOhiPIUXye2D6Dv8xYrsvnjjhFb3pVRXt8sY3wcj/Xb0W02IgYn4b5aHuUo8FzvTbF0WGYZMVWbHwkXCxfKqsGjzXL6SbAlx46/8RkCnplOG3+dfBB1fzS58tU7RZYR8V9mtf+ty85t8o7bApYuItnSjb68MuFjbTWsU9JJ7Z2CPmsTzIWYm/wGeSSnLz/KDD6Sr8KK3FII7FbmgRdHG6W7OxquYhvccVulX/LuYv4aUr2Aklrwiv1sZfki3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwycXgVVWa3KHkD7PM2QI134aLIWzooPpWVgrzr42JI=;
 b=V6ijdxzW1pAtJD0yRqEh48bfai4H58zWPN+UdHcZ5HN9M8iQnqZwZlO4ya18A1zeqNcnvSDYsDkkI3mTn10Jg2Ie1MZzGdmMP3+ceIJ+z/QfikVsmXux6hiakcK0OQcFaFY1hqtQGQpoB5LFYI6JWMuybuY0HPPkjAekZZf0q+rhRSiWTo0f05VCkgqL4QfI8I3uP5ZZeScdIs03aIgR+6Ldlsw2Roww3oynMMUqHveXKod9SsG0lGGlVqvXskbNgH+bZbRADqU87d9BdCUphvcdyTXpz7GJn418yjdmp7fOtHsmNm1cmgsSmRdDwtSWYe/VwUA55k0JOp+3nfAV3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwycXgVVWa3KHkD7PM2QI134aLIWzooPpWVgrzr42JI=;
 b=NqzVZEjOFhcho48IyBXMI8M5nImmbPu1XOEg0n3E/euq7VscLHUpLJXO8FVoKHRhIHngZHx0EL+pTRJe/FQxwpu4eH7GcBx0Fw/3dPgASrwVPjAbjqnAXo/ZoZRjkDUvsx7T8yRPVUfJKn1uzdMLQJQiCs+0/cE3ituLRM7SiZGvQvhdPl1dS1jwlBEsefLRvHagnKuihp+KAExa9GDNF66Cqbbs5vgGgjf56c7zGrbWj5CoWx4z7/VcCVdGSbAJ0FIXN9ENyMba09qmmK4zRyx3HDfAGhwpR7RoG6X+mUpBC8RF/r0Uqcdjp7GiutWz+rZAadsiTiFlbpgxdH5hRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6821.eurprd04.prod.outlook.com (2603:10a6:20b:105::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 18:22:54 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 18:22:54 +0000
Date: Fri, 1 Nov 2024 14:22:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 3/7] arm64: dts: s32g: make pinctrl part of mfd node
Message-ID: <ZyUcc5s6u9OzOoyq@lizhi-Precision-Tower-5810>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
 <20241101080614.1070819-4-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-4-andrei.stefanescu@oss.nxp.com>
X-ClientProxiedBy: BYAPR08CA0034.namprd08.prod.outlook.com
 (2603:10b6:a03:100::47) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: d6775c79-ced8-48ac-9e4b-08dcfaa23410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZRf1JrOq8G6gQEGexpasROBE8cgDDGN2YRke0KMdH3CSZc6gCTlppzx1NkkU?=
 =?us-ascii?Q?o3DiXrPSSqygLvxiM76D2JrIeqj++cQf29Ty4T0j+A6VTQCANmR7UbmhUpdP?=
 =?us-ascii?Q?JFz645wA6FTRCCQ8xaXK8cINy7jvNSnpp3lnk22yY+fneob9Uc+z/LpjU0Va?=
 =?us-ascii?Q?y9oTG8w8mxfeLe2debQRNIk2OpMp48x820sKGgyblxQU6r5N06jrKHyq/d0L?=
 =?us-ascii?Q?xfjmixXZKXUe1VRpvJfJ3v1wS8noxihjuWtpr9gzS3nt/4cIPyWI9sjrl3aJ?=
 =?us-ascii?Q?wbU3e0s4zS5UAhJJgxl3GNBeWhaQmiQ0ZRu6rAGldvC7Lh3c+F9Gzku4b2RG?=
 =?us-ascii?Q?BdEscYIItDE0/bAr0bE7CAmvte2orEKIvWKouwO+hcT5A01c4/hora16+KW9?=
 =?us-ascii?Q?7zgr3eut3XZzkEXnfd1FFpzZrTq6SeHcvmM3pXX0DkSlfAzj4yG2i42Yg51l?=
 =?us-ascii?Q?zDeYuKamUGcPkF0NeQCkRM9RK4JrC6kOT7EZeHqDtIRsMom93OFlSsvGToqQ?=
 =?us-ascii?Q?LyNJKSWBEo8lJhcraWmVkN3mYIxtCmE1V+gCwqcvjAMpyynX7UwNVfTiQIsh?=
 =?us-ascii?Q?A8XwuneQyqzwKXjsvVudEQitTTZAaKG0OsY+Rcf7I94c5NCWRTK+sdjbnL52?=
 =?us-ascii?Q?cHEcszCAnyL9nhpfp086p8H4iwE8ly3TcpIvrd8jZRIcrNJCWOGvIN6A6OfF?=
 =?us-ascii?Q?M28HHeN55SCkQ65RAihXLY9fFQupsvSt5m61mbln01Ae3WaIBZ965Lc2AsZ7?=
 =?us-ascii?Q?/zMAIZK/RRzHi/eihTxNK7MuwcXj/NqhgqDYywJXb36nQ1dCxtdL50a7hc7F?=
 =?us-ascii?Q?G6YDlksn2g/PCeBEqvOeqV/L/iuxHB+zeEFtEswIg4HlsCfiAD97h0dzNlIA?=
 =?us-ascii?Q?w2qK7EqnOei6Vz3xARyBJQzuh0MsVO4yKAvI9cxMLY73z1SQQ+46MuYWPxTh?=
 =?us-ascii?Q?b8GMy1b7p+MeG83ijZDfIZ4MR0/wTspFyRY7ByvIDNLpOWKpAmTH0UVZRy8+?=
 =?us-ascii?Q?mCwMhICrDXP7RmjS73ZGX1PH9xpkdg4uPbw049kZBrS1BklsSYiHVj951pW7?=
 =?us-ascii?Q?D1GE2Dlv29iD/dt/saK2IKHnqN4KYsiDleb+6DtKYSHN2Ioj4pJJRDkmVXuE?=
 =?us-ascii?Q?SNN8DflSmwQ/SPKVC7pLI2r8nXUJaZer6vys9+mNzqmMHp4FgrwDI7vN7Kfp?=
 =?us-ascii?Q?ZfFhM1+TVXW1jJiu69Yo2JWRtrmDrugHTEsf/pt42a1f97GwTcRLDSAS8eI9?=
 =?us-ascii?Q?9bVDyvQNkRVa3+NVG1Pppap7xbRct7cNMZiCKAW5aNiz34bPkrQIlA1opCZj?=
 =?us-ascii?Q?AJPhQkvJkyOvC0qLPVbBaFLgNvlUmSiIGfH4odEzsIgpBGftg4S7X1Lp72zW?=
 =?us-ascii?Q?GiEpv0M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UIpHD4Ukf3ahMSyHadyZtk1Mf/ssKx8FyOQjH96fczbQi19+B4Qwmq41sGGk?=
 =?us-ascii?Q?/g9C7OPp5P6EA7GfldOvCvCGjIj6VVqPUAgGAg3eAyLBdgm82MBEpQCrymnc?=
 =?us-ascii?Q?kg2GMcJLwwJaT5RFdj8dLk9N84X6UW4EUYUlXN29ElGfjYbEc1cCQ4+2mmqy?=
 =?us-ascii?Q?Y28fJGpvOTt6GZsmmdFcgb2vDVhFEvtcny4Ii6G6uCGGcpa2ciQgzQlOAMSD?=
 =?us-ascii?Q?E+7MVYHpwOGZvGC1/HCYTUM59YgWDGL9AdQM39T3MUKyHOIZHdgMiyapWkg+?=
 =?us-ascii?Q?kf1HFaXHrfm0Ym5ZqhgkTke0YguVl9Vt4oo+tXqd/W9vVW+43m7YTB39xWt8?=
 =?us-ascii?Q?GtXJbz7PsMEbUZXttrOVg4Pe25QR27Qpnijp5vMjB9q655asIDy8yvgi0evN?=
 =?us-ascii?Q?u5h/BcpGQ3kEJX4BOoGMyzJxlB0N4FqaQ3noQi09bxONr28meHLNI+ukiWPh?=
 =?us-ascii?Q?L0zxMQhJyRFaxSJ1l1O4NxF6yikC8O7ZUqM7Md/pS9TlbmLyPhplF+As1PVV?=
 =?us-ascii?Q?/Q/ehZNCw3Q5tzZlMwmng8kmvMgA7NDDFhyux5u8q7V8sTIELGOYtgcBb9qA?=
 =?us-ascii?Q?Js6xJOPRCyjJO4TnfYpYt5KdK8xYW4UjZoW2SxPl5gwDsvPPlBy7SHQYMQgz?=
 =?us-ascii?Q?qZ9F8dy2FAm09x+Bwl0d/VwPnqhO0xbNgM2RtkNXeLiQKPhziXv2b2SeBW6A?=
 =?us-ascii?Q?NR03X8D2N5mWI94ThEpXQrX9LXxOnZCTKjydbe5MaYt/RS6SBHQm1N4ocNsn?=
 =?us-ascii?Q?rgDelnhFGyhtWSG99Q5UR+7S7nwhPSa9ubKepnhbHojRO/gbZkLfHgdRJ83/?=
 =?us-ascii?Q?QQzE/h5JW15E8YdG7oQRhoWZ/igmz0CaLp5U5zYPARTLYw6Xi1Oa/N5XlW6j?=
 =?us-ascii?Q?hUXpNR6gHzGwDK/FPyFbXXCTpvdkmoahcCLwP3tY5bHCmzf/u0QhliF/08Xs?=
 =?us-ascii?Q?iyfY2UFhN3R4Vi721CiJnDrr3LqqOfUvE2Yait5PydxC8E8pfOYTER3KePsp?=
 =?us-ascii?Q?iX2mRyL1bZjm2n8D8L/o9iPEACkXowd7Vdb9IFneZVtEiLZLjR0pf5uvJsqX?=
 =?us-ascii?Q?gLei3GWy8/nWzTIRVRwDaimgNrbkA8RZmt5owYsffq1G/b1PezjqDbVL8MD2?=
 =?us-ascii?Q?V+otwW0nXZRjqzsaHwCPqq8eBSnlur5w9jfS7g6owiAVEZt2+DxTrQGqBa+N?=
 =?us-ascii?Q?QHD6n+muREUs1AnnrrzzNgriCNbJyEP8BIx9qc9k/DkOeGHs77NH+e1uJqjQ?=
 =?us-ascii?Q?u8kAtstqS8QXt/0i5L9j64nzUIZMbfvO/yQEAQwWdK6cfpQtqvmUwIb3MrQh?=
 =?us-ascii?Q?BdNKRQ7VjvOdFSWBxxwsrZjtitU8MSfhVSsWZfK4uljcqLnZo56mA3qV6QdX?=
 =?us-ascii?Q?qi0MJWsgaYXu1Ey0cX0WkZseayS5rPYKPcrvIfbtDI5yAFH/UKq5TWuBOnPU?=
 =?us-ascii?Q?J7lgQ6ZyvxV3XVqNjFiLTlWp/mbczHdYar56e2UTWjfyDrRII/T5eaXPmIZq?=
 =?us-ascii?Q?NMr24CBePlxq4SiZeoduI9jWsguehKAgRaC8h+G4sw7Uh5OjY80ogA35zIzm?=
 =?us-ascii?Q?K+MHViShKxDQIwvTVqE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6775c79-ced8-48ac-9e4b-08dcfaa23410
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 18:22:54.6032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8K4A5Bpxjj+xDkKd3A4tGRW1PjpkRJLSnfjmX1GrJJpQtnJVE23bFKRpCgzs7McYfKVGilJBtF1tPR4sMBnTtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6821

On Fri, Nov 01, 2024 at 10:06:09AM +0200, Andrei Stefanescu wrote:
> SIUL2 is now represented as an mfd device. Therefore, the old
> pinctrl node is deprecated. Move the pinctrl related properties
> inside the new "nxp-siul2" node. The latter one is now used
> to represent the mfd device.

Generally, dt team want you to keep both for sometime to keep
back compatiblity.

Frank
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 26 +++++++++++-------------
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 26 +++++++++++-------------
>  2 files changed, 24 insertions(+), 28 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index fa054bfe7d5c..e14ce5503e1f 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -114,20 +114,18 @@ soc@0 {
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0x80000000>;
>
> -		pinctrl: pinctrl@4009c240 {
> -			compatible = "nxp,s32g2-siul2-pinctrl";
> -				/* MSCR0-MSCR101 registers on siul2_0 */
> -			reg = <0x4009c240 0x198>,
> -				/* MSCR112-MSCR122 registers on siul2_1 */
> -			      <0x44010400 0x2c>,
> -				/* MSCR144-MSCR190 registers on siul2_1 */
> -			      <0x44010480 0xbc>,
> -				/* IMCR0-IMCR83 registers on siul2_0 */
> -			      <0x4009ca40 0x150>,
> -				/* IMCR119-IMCR397 registers on siul2_1 */
> -			      <0x44010c1c 0x45c>,
> -				/* IMCR430-IMCR495 registers on siul2_1 */
> -			      <0x440110f8 0x108>;
> +		siul2: siul2@4009c000 {
> +			compatible = "nxp,s32g2-siul2";
> +			reg = <0x4009c000 0x179c>,
> +			      <0x44010000 0x17b0>;
> +			reg-names = "siul20", "siul21";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
> +			gpio-reserved-ranges = <102 10>, <123 21>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
>
>  			jtag_pins: jtag-pins {
>  				jtag-grp0 {
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index b4226a9143c8..fa43d036686f 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -171,20 +171,18 @@ soc@0 {
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0x80000000>;
>
> -		pinctrl: pinctrl@4009c240 {
> -			compatible = "nxp,s32g2-siul2-pinctrl";
> -				/* MSCR0-MSCR101 registers on siul2_0 */
> -			reg = <0x4009c240 0x198>,
> -				/* MSCR112-MSCR122 registers on siul2_1 */
> -			      <0x44010400 0x2c>,
> -				/* MSCR144-MSCR190 registers on siul2_1 */
> -			      <0x44010480 0xbc>,
> -				/* IMCR0-IMCR83 registers on siul2_0 */
> -			      <0x4009ca40 0x150>,
> -				/* IMCR119-IMCR397 registers on siul2_1 */
> -			      <0x44010c1c 0x45c>,
> -				/* IMCR430-IMCR495 registers on siul2_1 */
> -			      <0x440110f8 0x108>;
> +		siul2: siul2@4009c000 {
> +			compatible = "nxp,s32g3-siul2";
> +			reg = <0x4009c000 0x179c>,
> +			      <0x44010000 0x17b0>;
> +			reg-names = "siul20", "siul21";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
> +			gpio-reserved-ranges = <102 10>, <123 21>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
>
>  			jtag_pins: jtag-pins {
>  				jtag-grp0 {
> --
> 2.45.2
>

