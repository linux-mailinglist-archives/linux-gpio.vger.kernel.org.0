Return-Path: <linux-gpio+bounces-23073-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19169AFFEAA
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 12:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2E283A9CDC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 10:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489E22D3EE9;
	Thu, 10 Jul 2025 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N6qqztwa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012014.outbound.protection.outlook.com [52.101.71.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5C91A3178;
	Thu, 10 Jul 2025 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752141727; cv=fail; b=iqNeNlfhiZOP2LlUsF1BOITpE6EaeXxjz3qCEuz3PWECZyfBoQzX2y9C1zSv9yACpYhO0L+vHXJbqCAuNIvhpaCXzUNTbbKefISCjdMqqhDUM7wpJgciYpgFOccXhRQPoE9TDvK3SdcfJovStFpf6iZPACFtMNlsQksjNABSzpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752141727; c=relaxed/simple;
	bh=1zwhrBL/THi42EB0l0ks1G/DSPvgt8arbYHuIzLdyuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PEc39cCbOkZW1KHGzfwVZ5sQh7/9CENmn45pUopIxV3WFSoEMhbkqaDpwvJeu5hiwKYiGzt36tG0nrIZKYoLqkMA2hyfoUGTniKnQrfIoPKUQkWUrKMC3W8YCBLzVKVgbfdBfuMy1mjqMZ1jP2OBLT+gT4CvpZ71UjflCETdqUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N6qqztwa; arc=fail smtp.client-ip=52.101.71.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOPx+QnLgoXaKSdPDD8q6rof4MGvujMbphDm7Ckt6t6fAffdHhvutNqf8BGNhbQJCQ0VQp6RyXF3xg1ff/kLV/1NFATpn8+B2hxkIj61eeL5vwR1a/CqUSczCvdZKjtHF9lnSqdOzl/lN51ZfqNsnmflGx5L6OUOSD8YnHNk42GnSaysVp7jq/0NtJ+Xr7/7FjjOO+pZvRW/wEshB3o1iHLdRT2Q0Oxw7+GLg4w8zFyelDI3gU6ZOOGVe68LJnzneeZVVyoGmSM87rt3jg1rg6LInHQo0iCfR8X5/01vM0cIbrKCyQ3sjHKkekWDPkr4Ocsq4luFOu8RyJPBy9b+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QdOr/MTvYoxHGx+Yaae1YbuHtcqs1erFlYkNvsj1CA=;
 b=gDC7JF7Tv1QgmH1oh1g1YEBBP3BCM3d9tCGK5sGkRoBmEMPAU8hJWnRIfWi6dgYA/PJUmPBkfpr+A/h1dO1rfIOa1hKeFNLb5jtpxkXaYp7GVRdwCarl0DZ/ibfPvRtKd5TOnROZY3HFg0IZ/mycuDoQWjXkQXdn07yUC3zF/8idQYs0JM/rMhf67AITPRH+Y2qEKv7vEkMhTbOUpeolnfth4Ra/FSRNjU9c/ujSfRa6M2/7BZitHW2ol7pbTs3uvhI7xjYOdrA2R/pB5MMGhXdoumu6SMrQNJ+xr8IwEbrgVhgk9Uy4+IC1rgKdQTyD+UHIdKiY/JLS9vCtBDhF4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QdOr/MTvYoxHGx+Yaae1YbuHtcqs1erFlYkNvsj1CA=;
 b=N6qqztwaeNbMHZPsy7QCRWqo0cMs9+yn7YK1MY9vr4VpP2sFS/47h8FSYENBb8XkpFMhK/N4b8gKar9SDih/PPi/Cco7WsSaGIuwjj9+4X0BKA9xb/dmfEbgM4P3LyJTcI5ojrMKtsC1E3rhAnXUzYlLU41Wx+Bl59htVbKAu5XW43zvQq9VTnSAi8/xCO66v2gsQEFjKyNpjkKbuP9f1vPnAxco6JzlPiQapBrgb7tP8ppU6whIyJWNGQProLDdQ0fwPU/1rbARUdEEQys5efkVyIHQ5cs9gOpH+guGuAwO6rjAvTdMuUNcP++INChFfIv5flGVvopu9QDGbYkXhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PA1PR04MB11311.eurprd04.prod.outlook.com (2603:10a6:102:4f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 10:02:02 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Thu, 10 Jul 2025
 10:02:02 +0000
Date: Thu, 10 Jul 2025 13:01:58 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 5/9] drivers: gpio: add QIXIS FPGA GPIO controller
Message-ID: <o5v2xdlrtjcgcd6usrfmtq6qffyigudvx3flhhetnd4ufg2mcx@5tem3jrlpxw5>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-6-ioana.ciornei@nxp.com>
 <898af9ea-9b90-4d1f-8e0d-a8e0686d72a7@lunn.ch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <898af9ea-9b90-4d1f-8e0d-a8e0686d72a7@lunn.ch>
X-ClientProxiedBy: FR4P281CA0279.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::11) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PA1PR04MB11311:EE_
X-MS-Office365-Filtering-Correlation-Id: fefe6965-be60-4103-4627-08ddbf98d0f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8UyHbVSJzF8hCtpj5OGxAkjMgyEb27NZaSrDWs6JF7a1+no8Cs7Pv1Uj8TKN?=
 =?us-ascii?Q?4zfVZ5S8rPOyTfQbkytZIxVl4PpXSgQjNDZaT5X8IGAvQplsJBX4fQ+c1rhW?=
 =?us-ascii?Q?HknthBJRyZK731GJvHl9kCj8thTG1JncnR9IgBW1H0vkdKH5PCWrvb148Nr0?=
 =?us-ascii?Q?84/40iQCDYexwAr1VsUiD35y0us9+CdDlWe1ep0EFlXFOEEhtLwnLL0t9RiB?=
 =?us-ascii?Q?nJd6AH2XS+TpcLZlLrqxw1Bzjr4/fcqhE0uARsLFBKjRDFu03sMZTufqO0gA?=
 =?us-ascii?Q?P4bida1qR2hHtP0RtxxsowWopakertK2oxQJNudmAGhyjSuKhLljkhs/YH9K?=
 =?us-ascii?Q?y7EM+tZrMeYIptWhur/g6OnKzFyapbAYbL6aVA1ggcqTm/M0fOsDATkVyaMc?=
 =?us-ascii?Q?3RUZ5XCHVPadfJMN7PMcJhPTGhvu+NMFp55ftY1SFXHBsrDIqbvXwJRmW//q?=
 =?us-ascii?Q?Lct0QcBEFJEpbDdglZhyM4tEoQsldX+msOjyldEOYjCDcK22v8m+/l0LjBWC?=
 =?us-ascii?Q?kZS6GUVNPdn1P0Ex/205WA2vACBsCyWbivTZOH5qB6vcYZVCWvWZllkYGuHI?=
 =?us-ascii?Q?McPfwyyycN7w4pAaHMnLp5L+NE/i+B9iZY+L4llfqKPfUrQJlO5v8aQ837ih?=
 =?us-ascii?Q?1iv+Q0KnBcqU/XR/ywD9MR2m6PEv+vkTFYv5G87h/hcI/WTdFrQt3794D0AU?=
 =?us-ascii?Q?b+B3/tXM2MumUl6Mjfp+4xl6/X/IH1QoMAGHqljIZq65q9MfNaDedKMxrpQM?=
 =?us-ascii?Q?iJl/+gHt3LzyWYrxPdOvw0dwGUjt8nnCtjuoWPAtpp0M8BdLiokFzOvXjL8k?=
 =?us-ascii?Q?OC5Rx3MK46t5OBFr1Vnz9mQ7hHxDKCJQhywr9J7wPukoA4KkTsbvp/64vqdU?=
 =?us-ascii?Q?BMiGB60k0ysGtG6l9RiyTIGO8hgtLMEjg+yU50W/rI361cythq+tlaZdF3qZ?=
 =?us-ascii?Q?PYU7kWp0rTPVtAZ8quUi0hfLfpaSNlLdWmnEb5Ah68g4Q7E9gb/d13S2NT/F?=
 =?us-ascii?Q?4h0f7RpTJTsyWuzp+VMsEyKsbJvek8Zu/CD1JcS8Ued+A87XS95JJNnF6Ezp?=
 =?us-ascii?Q?RNit3+K7hfT8ewy4FMgmUxX9KVQ4nmOlUXA0HY9GDAaoJq76yzgdKI3AenNA?=
 =?us-ascii?Q?OIGRA12ILeGcZN7zF+xSXHCUEFOC0xZQ9m9cHvnl5KXhCOwB9CMC26IqtVvm?=
 =?us-ascii?Q?KUEjSt2zGL6wMi/6TUc7SCeBryIDZMqD321ccwgDGBXgLs1ek2/UFRqmecXK?=
 =?us-ascii?Q?GaW7Wyol5sLMPLhsuzmgUDnGUBSkjZD6hZjV2TTv/5eF4CnukZ5XhxNx2z5x?=
 =?us-ascii?Q?5Zelc0ENyFruxP09BxvD1MNPhp50OJuS3E/RKN1h96RLby8vKxRn6RlXo244?=
 =?us-ascii?Q?FsXuC6Y9xBMUq9Wk2j7HJU6pjo68pdYu840i9lYxeworDKFGgg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YZHgG00GEu54EWRY7NGdwjQ7echqQftrUWrDI/GjiELg1dM/Q6nsJ3gA24Cq?=
 =?us-ascii?Q?sDfI5jEM759ZBlAvoC1sy2uA8NNcC+RAJbysd0iDaOH+Jyr2ddlHex2ZiSKd?=
 =?us-ascii?Q?m9A2e3oFgsRKpV+rb3DgG6H9N8MaV5exytW8I1riHVE9A9B2UY+yStQCUtxT?=
 =?us-ascii?Q?q3JTTLuCyAOTxDHFsTJi9DdUFjNWSRyMXzkKXlGlNhwsgSLRYtZTHGVaA2PY?=
 =?us-ascii?Q?45O5jiW1SlsUF0kGO848yfZq5Mfm/DnD91Apd4jcEjfDXwi4jaK1C1dX1iYX?=
 =?us-ascii?Q?2GkgBuaL6DBIl8L3Q/YVwbsk8CHy0VC0ChxO+8/SOnDABIb+MIz+DptClFth?=
 =?us-ascii?Q?39SZezdQxroteXpCkjpVjJ0esyw5SMZ8Z59dvjV+kwHBIn/s+6sFphLPOSut?=
 =?us-ascii?Q?twl1DlgshpsYh1gjUY0WWS+/ZFYjuU70AG1hdOXXhTSpyOtg1GMaNuS3BkOF?=
 =?us-ascii?Q?WGrcDXjVpdsuf67WOb59aRfXuUvkfDrzBxhSZl+r1En1KukYQijB2jwhdnMq?=
 =?us-ascii?Q?hQBKQRNVEa1mlHa6qEN9I6OXFuHKIhl9tK4JwcmPCOejt9bH4dNOUbQSkBDY?=
 =?us-ascii?Q?xVpUvl1BwUKiSV2AKDesHPZRDR4H9ISJIdOz2MZPeJVgkwheY9xr4IOSsOv8?=
 =?us-ascii?Q?QAOxlR9/zfWXTVMv2fPeeg2j74yth0pwD/qAKJ9Yo68lsPHc/zshl3g5B+7V?=
 =?us-ascii?Q?TOGU3GDl762dtwbz/SkLpiQsBDULFjGxuCuTs11oWTLqNEK9FRKKpuiyOVd/?=
 =?us-ascii?Q?BOKS8RUKmxl43EqSZuwFCY/gEpEMf7cWUCkl9053BeuKL7UOOerVnuSgBonC?=
 =?us-ascii?Q?LHLyfu8Xza6gMzBKL2KqPAGBw2/OPSyhoe2yD52pwwO5X+u8YMzoQYEXSzje?=
 =?us-ascii?Q?Y4hxAJi2xo8bz5BUNJJM2T/Dvm9+z5Ft/wbLKBIwQyN1YavPh56UF8e28tsL?=
 =?us-ascii?Q?rbtIbyELWYvWdbvWqfWaY7Mer0FooFLVdtYpQWyVvWwO0kzMDzkhMrt0FG7f?=
 =?us-ascii?Q?kVvhzv+ahtbMow0KGk6pVOhmQWZBMqhySoitKUCBN2+kECP1yUV4X1ZC6uTx?=
 =?us-ascii?Q?K5Q4M1JqaJWFayRGKCFBiYoUsOa5ePj5pxiO9V19AnKsYSqYUebzm0I/w/8c?=
 =?us-ascii?Q?rEvaeuku5a5BexagXJ/ZffoRi/aw2yyElVcNp07z30CR04qICkT/GsNOSHjm?=
 =?us-ascii?Q?J5/fBA+Em3aW6NTFW7jYcjS/Cdxv9DMttgdHudLSU/gJIHahU/fu145x5xde?=
 =?us-ascii?Q?j69CdJi7NS5PF2SABc/xBnuKVD4BSvKGCpCRTgpVywTUC4O9mg6rCnDZOLic?=
 =?us-ascii?Q?/ZfuWdZF10+Hwx3j9kx1iHQBLvHhOWY/OFJLbamAfDt5TJIqueHgZnPCgI5v?=
 =?us-ascii?Q?QtcGmqg6VpqBKn1YZKwcGfuP5FFv7zEeRBsYCZJM0Ei5HyVUjMhzJV/aY0Fl?=
 =?us-ascii?Q?ctVQdho1fHg8BqTjkSK8a5m9KQu1gmibM1V+F8na2s2DOZNUMXwxCOFxzJIJ?=
 =?us-ascii?Q?Nx0DaE8+MtYVP3DPIC6ZsCnd6PoVuD/0MCKguDRMmQ+2vNXDXH7hY4qMRrKW?=
 =?us-ascii?Q?TH5wteWv/+bSed6EM01DfXrFf/GCrRl033qUoBV+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fefe6965-be60-4103-4627-08ddbf98d0f8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 10:02:02.1689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1mGKMm1N7TNc2x2XOfVaIeosbxYa/v17S614FhttHIMR1A6FGmtRf/LiEFFYZXtIVoLXFtcupoaSKJefH5I8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11311

On Wed, Jul 09, 2025 at 05:17:18PM +0200, Andrew Lunn wrote:
> > A GPIO controller has a maximum of 8 lines (all found in the same
> > register). Even within the same controller, the GPIO lines' direction is
> > fixed, either output or input, without the possibility to change it.
> 
> Since this is an FPGA, not silicon, is the selection of output or
> input a syntheses option?

I suppose so, yes. The idea is that in this particular case, the fixed
direction for each GPIO line (bit in the register) matches the use case
and will not be changed. For example, the presence detect or rx los
GPIOs for the SFP cages are only input, while the tx enable one is
output always.

>
> > +static const struct of_device_id qixis_cpld_gpio_of_match[] = {
> > +	{
> > +		.compatible = "fsl,lx2160ardb-fpga-gpio-sfp2",
> > +		.data = &lx2160ardb_sfp2_cfg,
> > +	},
> > +	{
> > +		.compatible = "fsl,lx2160ardb-fpga-gpio-sfp3",
> > +		.data = &lx2160ardb_sfp3_cfg,
> > +	},
> > +	{
> > +		.compatible = "fsl,ls1046aqds-fpga-gpio-stat-pres2",
> > +		.data = &ls1046aqds_stat_pres2_cfg,
> > +	},
> 
> Does the FPGA have an ID register you can read to confirm it is what
> you think it is?
> 
> Or is the bitstream downloaded at boot by another driver? Can you ask
> that driver what bitstream it downloaded?
> 
> Given how similar these devices are, it seems like a typ0 could give a
> mostly working device which passes testing, so doing some validation
> of the compatible against the actual FPGA would be nice.
> 

The FPGA does have an ID register that we could verify and match against
the board type that we expect.

On the other hand, I am not 100% on board with the idea to check this
from the GPIO driver which teoretically should only touch its one
register. Maybe from the parent's driver we could do that and prevent
the probing of children if things don't match up. But this does prove to
be complicated since those drivers are simple-mfd (for LS1046AQDS) and
simple-mfd-i2c (for LX2160ARDB). And I don't think it would be wise to
add some specific board logic into of/platform.c.

Ioana

