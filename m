Return-Path: <linux-gpio+bounces-27076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B541ABD8FB2
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 13:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69F463A2D3C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 11:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58723074B7;
	Tue, 14 Oct 2025 11:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j3zKQ3Qj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011040.outbound.protection.outlook.com [40.107.130.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1974727F01E;
	Tue, 14 Oct 2025 11:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760440887; cv=fail; b=rUaKeWRmrF07dfF1Oa+TWZvGIQxLL2RzAoL56/pPyjSmHn9IySSPrDJPwLaIY/hzwsVjngTnKUVE1SiRtNrhaYQsNsCrT1JUqVEf0gEVVCa1RZeGQrlBCgp0sfH3W/tJELxbgZHUAXaPblXsvZtv+RAv1mxRbOmVC+P/bI++0hA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760440887; c=relaxed/simple;
	bh=U7dX1Tdg9casSKfqy+rLL99bdew5JSwX8SxFLnWCEuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bYIbBxfFdJr9nf9FIVC7YncXXAm67Eyzl8iM7xTWlW/mixt73+TLUNimPs8iEvS2632VEG4XHXWAS0QH5yAbozsw5hDEvL9IjfzrOzjbxc9vLsr9viTTo3NsAhXe7IqcZSUUYIUuaDGkrRWexekZ/PLvFtrn1P+ufSkXxKI4gfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j3zKQ3Qj; arc=fail smtp.client-ip=40.107.130.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7jiTKhSTdWtNQ5ZYeiuBkGzqIO25JL9naDuLq5nuM7VJdbsDekTnjGqmSh2hzEJmBET/f/hwlU5VSIqfpEXYdmj1WEh8w3QRVWXdVvKkY+0M23Lqfpmk67V9BUzxyL3MtVz+OQmJWM0YznDeZrcZIMnuW7ZdqUUAI+dX4kDU8FiIdO4T8EnOq0lpotA5JJ0LQTT//QbnQsFBb0V6sFEvjwj0tmarGhyOQkSFRWn1n5yCxbuwTzdOg9iRp74uyPc25QcrUJjd4uW0+a8sIq6Bf1kFfQT1U9yirUV0OO/8q61PTdD3TqCO9t0486Rf5f8Xckj+pXv7E1/UGd5VgmYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqe+z91X/F2exdWJ6AQOzZps8vDT3jtToDkX1iN0NvQ=;
 b=dR/TEoGPYD9XVHS13erSEZs6QmvE1fpAJ2TF4SKqpt+vkLBcYFIGyPhsiX5Jr2uuMPJJN+VGAnXPFpRSKtNgfWpAE8Kw9u2Q+nBxLfpC0++RZP5Lq+WZio18aQw3QPJAM3ymvYx552PShOxqFA3mPJdP6rxRqHontxUEYbekj976huNOwpLxq1lL9LsGkHN4rMXkn97R6CJGZ/JJTukChS6Hlof+ycizaH6ITI4OkWrP+WyMiCsKOjI/LkDkffLjBiBJf2O236GdNf3uLbuDgX742u7Za2dKDJihK3PU63N0io1lDSYXDKO1/XPGIWr/IMGMjn8LA/fcggQNTOKOog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqe+z91X/F2exdWJ6AQOzZps8vDT3jtToDkX1iN0NvQ=;
 b=j3zKQ3QjDgD9YG3KMajV35w1JMBGkT9JnF6qje0KsjdRDLCNzzBI2yRfJ/kMOkonaUimyMJBvmVuWyqrZqcjE7BAzNxl54CaGLUlGpsOb2jkxeWkEM+PZMsNkZnPB0hZLAPfpgUQHKXE88UvfAMbmdk6O6K5Hw81/sd2kolaxQHzmJsD9DfkV1beWYmLJ2gsCH+u2LbFoJmxKM/t4T4NSZ7gIueJhynucngbX1Y313BAvMs+OvQozig2N4G33OKe2WSyGqXcKZPh5wG8o5Gw/Y7nwfqYYPEqKHZnpsQpr3DcBNZaIVaUPrIV2jBpjDjooHIuFjX9P+CdbFXNrpm1Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 11:21:21 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 11:21:21 +0000
Date: Tue, 14 Oct 2025 14:21:18 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Michael Walle <mwalle@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>, 
	Mark Cave-Ayland <mark.caveayland@nutanix.com>, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andriy.shevchenko@linux.intel.com, broonie@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: gpio: gpio-pci-idio-16 regression after LTS upgrade
Message-ID: <jajbilboyqty3a5tbgjgwklrpcstv7gotkqis46cuzgew7ip4q@ej37jq2cev77>
References: <df4857cb-daae-4428-bd93-5878564624c5@nutanix.com>
 <20251009094905.223456-1-wbg@kernel.org>
 <DDHX9YA0ZMKO.C1MA3CHLT4ZZ@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDHX9YA0ZMKO.C1MA3CHLT4ZZ@kernel.org>
X-ClientProxiedBy: FR4P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::20) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a02b42-25e0-4df5-a404-08de0b13cd7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rRwNtIRzhFjnkv7TkFwmZn7NfNgfpk7WUUAzE9klWP2gNLjLXIxICTzeGj7I?=
 =?us-ascii?Q?i1cDsng8KVt/smXKxCrLbpdNFk1cxmdmNhfJJXC3e6yv96VTHrc4bjlZj7gW?=
 =?us-ascii?Q?XAEbjtlmFwbWCskQRZaSg6k1+CyLBNODowqvyxjAPd8I3y7mQDfJWky4kA5+?=
 =?us-ascii?Q?Vt8MdjiNp/8ZLuDmcNLJdRa+yHqx/IxqizW44kRQBK8I1BSM+sz+oMZWlTPA?=
 =?us-ascii?Q?vAgV87latruefSjnioGPEREAhYRx6CitP3rNOfQp65oGsulEGXcWfFqoEaoZ?=
 =?us-ascii?Q?jCZ/cIfVvPHTXkDIN0YxZliV8Am0DtO0I7muMIn4VU8NeX5l9QOOBvyaey57?=
 =?us-ascii?Q?juOBesVkkibPynNz7XHcAY57E+2xw4UT8gc5+pvJWUUbA7PRxZnq6PMi3u6Q?=
 =?us-ascii?Q?YydFdvP6BN53S33m1Z4Tmp8yh6uU94awVENOmt4mJGRM8SwyFuXRAi0jILyT?=
 =?us-ascii?Q?rnSNOGZutwd/zOdw8vB2a8A+3x+s/W5wA4miIIBWC6mL8b9Qf9SabPLfHz+C?=
 =?us-ascii?Q?NrNDtd+UbjzKX0dCarnTKu2Qzxm/us47oyip9SDleZa0y+btMl/kIB5U0vhd?=
 =?us-ascii?Q?v4/de6G07ZZPhNVX/58in6EPfEhjsGpSGahNiIHBM9rlLidf/a+mUpLg+b4W?=
 =?us-ascii?Q?dyJtJRltP1zyhGLJOCA+CiaJPcYbelzTKzDdkl6s4Esp1qT6PIo2vjfy3cSU?=
 =?us-ascii?Q?ELBlye8tDjA0a1CTqunhg+Ye4BjLivw1kQ9CIhffrCBiIb7knN6J8yv1mwCe?=
 =?us-ascii?Q?Dvr0nw6cMsR47jFChmYVVkNmfuXCAjpP/6MAR/VINUCns5fwNPzEC86ir8V8?=
 =?us-ascii?Q?i+ElBzYZEv9I0livNMJM8ngX5qP03DqOiPt1W9KyShuSqDCR9vNPMgP9x+Y0?=
 =?us-ascii?Q?f6tzUeX80gs3Zx6diHJtTCFX3BHe+W7p1F+CC1Jqz8yvi2HA3YZdM3d22+tB?=
 =?us-ascii?Q?dSw5BrwfyRXdossyvaM69dGs5b8wl1aNQZtqmmx0dcgejMdyibcIzGBzg/9Z?=
 =?us-ascii?Q?0VZpAfj/VrnuN0hG4q1I7p/MGmmfIt1tGtIFzkgMqxuLxM8M/EPCgOGjDuC5?=
 =?us-ascii?Q?uFgkg8O4vejpTdm1k9+FNIsc61GGnqRu9zq5sn6Azzi/GOJeqVu82OGQ52Wj?=
 =?us-ascii?Q?1MHCXOYy2emWee0dzqV/IGLuafTubQ+J5noeIq2L8uRDlBWRNdIRWMKNFIh0?=
 =?us-ascii?Q?niYg8eVsG0VwjD/FJAfiP4PTv2ojE2UVko2AIrs7qcFdiRzTM/872ggkOmfa?=
 =?us-ascii?Q?sB79K1QOe9vnp9kMQnbsGfs65lzhBqVpuIq7et/SDVFZup5uiMF0ODwrJEtB?=
 =?us-ascii?Q?MGPQ4fMarxcPB7CnaSDBsQib6P/aZNJP9geR8hJjoFEN7hTU2NRLMXKtFMhU?=
 =?us-ascii?Q?vGmqbg2aZ70UXwvI8SFBvrjwEQPzIhNV/xbFNnoflPl/QKrFg/vYAAzLiWk8?=
 =?us-ascii?Q?o6hqcs7LZQoQIuHs2H41c1v3a36QnbuTdhOhLC+/L1sl2WQCiT8N+g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hm/rkllMM8uWQicfdLARa06RjIUhnfr8clfdlS5h06oH7auFZAFxNuNrd7v7?=
 =?us-ascii?Q?pfl2JNegAGGNQMORir4H2McUkPN9vZZj0AmVpaZgeDvfqjo2b/SwYDs/nfeY?=
 =?us-ascii?Q?fMUHTbRvidveVZkVxd0hHbv856fZ7bEhzUCSXD9zgdCAl8jnd5DzZ0ufUgSR?=
 =?us-ascii?Q?TlLr2/cLu9J81vvvtwXCMxMEZ+J0weHmN1tbZOjUyAdXdIhRbHI8W1AQwq4B?=
 =?us-ascii?Q?9E1D/94MCaczVfvp4QhxfVqmk4ldIj0BuVZFKWs81GdXzacz/ZMZk7G58KKs?=
 =?us-ascii?Q?U7ykzGEAGf4PSzDnU2lt1Tib/UNxRHA57VfQyhobMYVytT09mLbsr37vP11Z?=
 =?us-ascii?Q?tGsb9xi9tdxKC3c+dQbljABWYAkwzwTdKmJP7KNVrxYmnnV7cRHBR/fr6fC3?=
 =?us-ascii?Q?cko0F8g8b+axnM4Ika6olKxTqsc29eZusQk2AxziA+ibX83M9LM3dD/6F7rS?=
 =?us-ascii?Q?k2tSaBTOUEqXUQU3Hevfh+CGtf2DC7cRkQCq0BNyRvP3QSAIFvIg9YEky0n+?=
 =?us-ascii?Q?FkKWUzRgRAHKqwssqxkquW70VSB7wdSH8kT7aLeGQt8eOZ8ubgoD7kiiYq4T?=
 =?us-ascii?Q?86vOEkcbTcKNxqjWsq6ZClI2XJVwfF5YxV+7lDb/n5/zzEQgQeOpEwyE/0aD?=
 =?us-ascii?Q?7qb4robUW7vquMK6IMz2Lh5w+cPkamhaugshpK/V8UkBGEdYSF5anHxmZFsf?=
 =?us-ascii?Q?qGpWRFiV9MODDfH2Bu6xgGVcLr5o0qoCAIJc74cOuGymI1Gq6GSJfzYXF9QS?=
 =?us-ascii?Q?5qKWJnqXKJpzUWIJh1mzVSYH/rR3eSyVN+3qRyXgOBMFHTkbPYwGZNAAD5eh?=
 =?us-ascii?Q?arMiRYdVl+uVwjjJQetpIjWORLwxwPdbWNGebUOkjzNQP7MrW3s7tN775fXJ?=
 =?us-ascii?Q?cXFp+zNQQh5wt9IZBN6PJuuqn4nYuNxGEXh96xcZDhZ1G6y3y82akFPpG5Z1?=
 =?us-ascii?Q?iJnsVZ7J+kffPpVkDV5tD4LqUxu2IbhSNaD3Y1jOnSx5OeodFv41h1hoVXZL?=
 =?us-ascii?Q?naa9K67zWtfaVPoUbtwYVqz99fo6UKB9NcqyrvkDMFeOOMR6NXbiqeMuWyn4?=
 =?us-ascii?Q?y4pH1uEVq3kd/7EbmmtXpQP3G4pgzSLo94lt9SacRugHN1JlvF8m2UgRDQ4O?=
 =?us-ascii?Q?db55iUATvlhFsk+bPgyDsHjB/q37A/HyOg0gWsbISDRMYtwJmUKkuFZVTIoV?=
 =?us-ascii?Q?CIDZ6dw3UyelJf9aatxKiuB7pqDG7fVzRvvvNPm+yUWTRlVqRXhbecZHN9JN?=
 =?us-ascii?Q?yKEZ8E+nauMMoE95uFcjbB3W9MDiQONT9s9c3Fke228rXW21J/G/9cJ0SYRH?=
 =?us-ascii?Q?eizVWseqBWJEvtC41jsgm1419NbbAnZp5pmS82YYWVDgm61q+yYcB5JIh4+u?=
 =?us-ascii?Q?wbaXKSJYOQk1+E847rfJqN7U+SK8Umwqg5joAhFsU1ae27oWN4L1bajJhv/g?=
 =?us-ascii?Q?rY63E+L+kzFRZ/GydVbtGgK5ybeLKaofgRLcNGW+VYEQ/25NKVgcLQljGnSs?=
 =?us-ascii?Q?j2tfArac5JfhDkpwsDNtSIP/XIWX6+PVKPz/rT4oNgy3+AAlIU/3dBk2uEqP?=
 =?us-ascii?Q?OQ1st78y8MB5ZHt5P2QGWSUfFgdj5JDjTSLSsAIj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a02b42-25e0-4df5-a404-08de0b13cd7d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 11:21:21.4508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: busssvK+R7v4B4hkT8OA/oPHANNiuolwfbN0+MjO2DkTg7b4FYK6Y7ckgbZZxRht4cYWh3Lqrk/ci2PFsVM8Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8465

On Tue, Oct 14, 2025 at 11:03:25AM +0200, Michael Walle wrote:
> Hi,
> 
> On Thu Oct 9, 2025 at 11:49 AM CEST, William Breathitt Gray wrote:
> > On Thu, Oct 09, 2025 at 10:05:58AM +0100, Mark Cave-Ayland wrote:
> >> On 07/10/2025 09:16, William Breathitt Gray wrote:
> >> > So the intention I had with gpio-idio-16 was to provide reg_dat_base and
> >> > reg_set_base to define the input and output bases, and then
> >> > reg_mask_xlate would do the translation between input and outputs. I
> >> > think this design is allowed by gpio-regmap, is it not Michael?
> >> >
> >> > In theory, gpio_regmap_get_direction should call gpio->reg_mask_xlate()
> >> > which is mapped to idio_16_reg_mask_xlate(), and thus set reg and mask
> >> > which then is evaluated at the end of gpio_regmap_get_direction() to
> >> > determine which direction to return.
> >> >
> >> > Is it possible idio_16_reg_mask_xlate() is returning the wrong values
> >> > for reg and mask?
> >> >
> >> > William Breathitt Gray
> >> 
> >> The only logic around .reg_dat_base and .reg_set_base in
> >> gpio_regmap_get_direction() is this:
> >> 
> >> 	if (gpio->reg_dat_base && !gpio->reg_set_base)
> >> 		return GPIO_LINE_DIRECTION_IN;
> >> 	if (gpio->reg_set_base && !gpio->reg_dat_base)
> >> 		return GPIO_LINE_DIRECTION_OUT;
> >> 
> >> Otherwise it attempts to use .reg_dir_out_base and .reg_dir_in_base
> >> which are not set for gpio-idio-16 because the GPIO directions are fixed
> >> and not controlled via a data-direction register. And as these are not
> >> set, gpio_regmap_get_direction() returns -ENOTSUPP.
> >> 
> >> Were you thinking that gpio_regmap_get_direction() should have some
> >> additional direction logic if both .reg_dat_base and .reg_set_base are
> >> set, based upon their comparative values?
> >
> > Ah you're right, I misunderstood the logic in gpio_regmap_get_direction.
> > So essentially the problem is that gpio-idio-16 has no way of indicating
> > the direction of its I/O because it's mixed.
> >
> > The IDIO-16 series lacks a direction setting register, so I think the
> > proper solution is as you suggest: add support for a get_direction
> > callback to struct gpio_regmap_config in the same vein as the existing
> > reg_mask_xlate callback. Then in gpio_regmap_register you can set
> > gpio->get_direction = config->get_direction in the same way
> > config->reg_mask_xlate is handled.
> 
> IIUC the chip has fixed input and outputs. In that case this should
> help:
> https://lore.kernel.org/all/20250922142427.3310221-8-ioana.ciornei@nxp.com/
> 
> I guess Ioana will resubmit the series for this cycle.

Yes, I will resubmit shortly.

> To fix the regression, I guess the patch can then be picked up by the
> stable team along with the driver patch which will set the
> .fixed_direction_output config field.

Just to make sure that I understand, do you want me to add another patch
that adds the new driver user or that will be handled separately?

Ioana

