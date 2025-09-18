Return-Path: <linux-gpio+bounces-26336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEB8B85C2D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 17:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B608177697
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 15:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8B7316917;
	Thu, 18 Sep 2025 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MuP88hFn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E03313290;
	Thu, 18 Sep 2025 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210334; cv=fail; b=lRLeFp0tM7tFc1O+SYaeAIbhfcnje34mldD/bfN/zO4P8EylzuNT0haTUYvQrZZJr40szMMxrBXhAaRISx727uRtdFK9lU7lt4gQVDErTfsxW0uDD6iZDRlyy2FVAneJPibo/VIZYARugi5pVBEbzXf8O7wfckV2sKdPK83h+qI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210334; c=relaxed/simple;
	bh=l4SIkvU9B+Cqh5WLgGxf2dP+OqHNEXqDsja7NlgfdII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TkRzkeHNXzIqZDmmswKmqKypO5jl8osUFRtB38an73KrCjfH86GJrzj+wzMuTngWWpT8ONiNUuV7ShbTzfc9r6fWcQh+F5BYk9wn6vL4UryQEMMYtmbta8gUXdGXJMGmlmMDe54vNz5Ek08KFkMmATbEBk7yghNdhe99BCf/XSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MuP88hFn; arc=fail smtp.client-ip=52.101.84.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1eUlBev4e2PknXirNpYDGoDzU0GpG/pxbsMrX/38aNc2Kq1kWwyMLwqdPKhEkzy4BtPZpKUc0q9xULfNy6lVqOpLCgCXbAV2obobTO1dMc2GNoJsPoXKE+4X/OsN62pWq1pboUigGaiPozbWQnBG1p77LQdDPzritu2KSTIWCbdCRwW9KDzeclINfg+9p9AxAylI7hG3ohmrlSPJ9gbYcXEJ/62i6ETm32mGqMUjmw3VhoF6Mi0LXw2RwuBjDV3zFbMfAB9ZFc5uw62kK3blgU3Vr5+Z5iavRLg+o2JjWga7w9Mt241VsvzoE0awd98DZrgNyfCy16KIpxRGis/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knUlNp0D2q5yGo/1Gw9UK5QJKBQp5IMnKA/Gmn7VU0U=;
 b=xDErsK2sWZ6K0Up0UivcglKXWOLkN6gs4NGgzQ+bRfBDw1lkauqw291ESj+cdJ9H8NwcnKo/SbxwLxoezct4iUI4IPF79zlOK6zmFpRmMGoFsFnT3sM63Q+USAFSdKI1lEyDxWUP+sxEG3qNmwg0y82rNwr8i0yKXQ2tRK3bVvf/d8VUMYjLdFRc4RFQfgs5eYPz7OSvXgkoZK/X2y3r7i9gN4SM8IT+WacHhny3rcJmKV2qjN+a+L4thoj2xJqJBFabHYnhQqgQ9HFZBP5THiFbn6SLIc8kRBFGUxlHz+9g96Qoxw4+z994IfsZvqwP4IP7NhNjOcjeHK7wJZaz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knUlNp0D2q5yGo/1Gw9UK5QJKBQp5IMnKA/Gmn7VU0U=;
 b=MuP88hFnCXGIfNAHTxbhLM/gWl7iQckPOZdrZJsolrJAiTeJQuDVn040ZWJIXl1NjHv0t4gQS9+D3tHJ6wejsv+bI2G6EuUwLsKQK4Czr5GJgcJxnjmgMG13mx97VWv/x6j2alvrA6Xx/IAnwm+LcXOP8kg7jm50EHItL32B1G5sKLfZ1DEPSv+4QmahRJWY9G2ZPFo16W59+Z6DfiGnMAHFCNtLMrS7iAUpGIS8CqtGomBS5c/upgGniHANEHyUK6jDJWdfassjeiXT71ysf2LzkJ7OHy1nhGlRAR9KZkQYCsXic7RfD5i/rBgT/e3eK+olwsxU0elJV53KM0SKfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS5PR04MB11417.eurprd04.prod.outlook.com (2603:10a6:20b:6c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 15:45:28 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 15:45:28 +0000
Date: Thu, 18 Sep 2025 18:45:24 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/10] gpio: regmap: add the .fixed_direction_output
 configuration parameter
Message-ID: <7xzabghtgro7wv4mbx7zywm5tnquttthdzrc2duiwvejm4knn7@b4fp7u6jmaia>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
 <20250917090422.870033-6-ioana.ciornei@nxp.com>
 <CAMRc=MdxE-qsthHot7+iA8yqg1ZEASzGh7dmR=ucfxg_JQipxQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdxE-qsthHot7+iA8yqg1ZEASzGh7dmR=ucfxg_JQipxQ@mail.gmail.com>
X-ClientProxiedBy: AM0PR10CA0002.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::12) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS5PR04MB11417:EE_
X-MS-Office365-Filtering-Correlation-Id: a6bbfe77-a1d8-4a50-c306-08ddf6ca63f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w2Kv6XyY2u/IdxqZFOWM+S3OiwVBbRAeROosSGcGFSNfoBW2nkYOcW0N9bbW?=
 =?us-ascii?Q?QFjYYd1m3k6VjGlXJz6A6ydpPaVrUSWDzKMeMtyimXAOMl+v4J7GoOdmrhSE?=
 =?us-ascii?Q?+Nlz+67CPkv1TXKm+5r8aE8nTPYC22NKgNzA9vLA6Ezv4V17AMPhNAeTNGaq?=
 =?us-ascii?Q?r2hb8G/gbq5VF5IhCjYmY9yZhqWxjsDir2YBaONgZKSf//WOW2OklLzea47p?=
 =?us-ascii?Q?cBqSj+YeN5ckwtyr32khpgLJ881+YyTca/rPPx48x7NLAD+7bt2TcK+i1IiF?=
 =?us-ascii?Q?xhesJbs3IG4afE8JjoRf4sP4h2GOHQ6R0Mr+GwE9EvcUUWTpJQhVtzurp0xY?=
 =?us-ascii?Q?Q3isRpaHaH/T9ke3Eh/P6UhZUpiCO3ja6ImByOJ6jV1S6QjiC9y3aZD9Mn0B?=
 =?us-ascii?Q?cn3rIJaTM0c3iwS2l3QzORc1qyBdQ3l9zt6xc8nq3IWoGFZnU1uQ3bbqB+S5?=
 =?us-ascii?Q?ANtOgQ5E4AAS88J6yydsHhY9BEeD0/mKEPvwbm7kRcKwNyPst7YZp/47JWNd?=
 =?us-ascii?Q?q2ZlziIZQXpexNQZ2qTjAiCjSEXSWYfPv/G0iGehWOxvk2lsL7L+qC/sUsph?=
 =?us-ascii?Q?SombK/gEW5SW0lVF0tuepLKrEBqwtHF8UqkSW0GOKmOoq8JTgbYVlIBEObON?=
 =?us-ascii?Q?99FJruq6dXNx4hEJjtZUtXVITXIDObtvg6bES1wGK8Gf87XTmhafaiJMOW3R?=
 =?us-ascii?Q?yWPeAXGjfoJSPkR1lGOJUsoz5svtSrEvJaV8XNOkZ0KLWJ+gxdZ9Xh/A5MnN?=
 =?us-ascii?Q?B2SxeO41R2uEek+zzZq6Ey6lOw47IgM15TRWFR3/tR29FJXRy2G40F7wKu2i?=
 =?us-ascii?Q?njO+S9vUeU9ojo54jyjcVZDpG02kazMvNAyIHwrGg8it5NXx3w3J1ZmILxDc?=
 =?us-ascii?Q?fa4CDVgfzbR0Y49b6oi5nFzkbFAUgUxiI+9H45mAALiA+CgugbuOJN/wosu1?=
 =?us-ascii?Q?Az5oJjiXVnGsQiSFi8CI4LVhbKK4BH1cG7HPi0m8Sk7PmyydeNA7kkb42iZ1?=
 =?us-ascii?Q?pzVllHIEBTBZrB12qvBogb/kEhOlZlH7T19a9PmCE28beP2Yq/HNbbeFVfij?=
 =?us-ascii?Q?svK1qzc5bFYSEqfyMX4n60cTHmEhFpHTAzYrzjpk96B7JtmFEdZBOmj1acfw?=
 =?us-ascii?Q?NO1TiDniqBBolN2rWOsDG62sg/i5T88RuxvdNAwsCCWSptcJr/Z2zC1kC6yG?=
 =?us-ascii?Q?RicAJPlM7c+MF0XlOi33W5zKzb+KfDrgGtTOB9yGBRoc1vNKRMORHL5dUT6B?=
 =?us-ascii?Q?/hXYR34zEJe0i0wYmdXQlTgLi3Bl1CK+JxQ6AHMFY6NcAwD9qQNjfgjoSnMi?=
 =?us-ascii?Q?uroj7C3HdyC6jD+ED3MoDniC47rkjqDL8ZbTfkS5XuRafPzpe1BCC8zFwmFs?=
 =?us-ascii?Q?zL5Dt2pzvWJhSzxGTWacvsXOkWtTywKB5f+wzWmf/D/eb1AcO0C+egVRNZSn?=
 =?us-ascii?Q?iDVbSJZtjRY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HLa1tjOfenNzdCb3O2W74vS+jgoFVrMCgdPdVUgGTkdm+Z3auyBanHyo0/Ag?=
 =?us-ascii?Q?bwu/JvrL1aEl8yARo+X9x5TKRu/YYEDyak3Af0dC3aUJCaot88/sOpXih8Xa?=
 =?us-ascii?Q?XdGgr49Fv9LA/BzSzSMkjco1lx0vTmxs5MuwTkyGxkpX1KYeZXnNcW4MnZq4?=
 =?us-ascii?Q?DtimYiuQBR0QggN2bknLr12xDEfEue0ockE2R4/ApJVHmg2EXrvA4qd2ooeQ?=
 =?us-ascii?Q?SE6URIFD+wL+AXsgTrn31JnDllm59cTFgmwrFYqNZjDRM2MRnV8r5/LW6bNy?=
 =?us-ascii?Q?N6fXoJNtsMFKwQ0NoAGxYyA5CL7dhY3H9OrSdZGHm6ic4n8AHW4PbfZqtHlj?=
 =?us-ascii?Q?CQ5TLEUBM/R784iqixBOGbUmF4Lk85ElnBeVJqa6j34It1rKcEKAO/FcWbRq?=
 =?us-ascii?Q?tGSpNdPl+h5NuFmGrwFUHaTwit1yKbAWtKfiFHL4jAoR3XACrDjYZa+XNeel?=
 =?us-ascii?Q?xvX1PstBBw4eYYVdzQqDGij9RH3N34FDCaKXq6JkDANcbuWzLOORThYIj/Yw?=
 =?us-ascii?Q?twTcxwRhwyw1+8zXvS2afNneecNIE/4Pe25MUY3oRYD49V7pk5mAPZNNVcE7?=
 =?us-ascii?Q?8vbRBYQxVHu/wdIqNIkfQStvElYEcQ+e2+O5rtWx3bZt9+1YAZVGWumOxE79?=
 =?us-ascii?Q?7Qb667LStUe2WrcMiLwNhqWBW0J7ZKp+L+YGzKTYyOHJ+2fx2GNzzDyQC2Ir?=
 =?us-ascii?Q?Df9VF9p8HxKR2lOGwc2L/IcfOBjmHgKlZNsmsPaj8FK9hEquZYz3LdhKi20Y?=
 =?us-ascii?Q?+1m+cy2DmjUfu/D/+IRzwfR5ZzEG9WawJ8J3Xw0erfziaZgOrNWjq+qHmwDT?=
 =?us-ascii?Q?WKUQNa0RT59SG6mdyQyKk1IhwAKnVTgubC0x22Qh6HK/Y8PPM6qG9oEeroHo?=
 =?us-ascii?Q?gKUR++pOrkXkx7OGkrPp2Q1kvivwdt6eIIFgnxQ8S+amCFfTEqQl9Q03YvOE?=
 =?us-ascii?Q?rCi6HiSTDtz1GiXTa/byv6hsuB7rNXNZxKSQ2eMx0yO8sT1PLvDMcAlj6J5G?=
 =?us-ascii?Q?u3SnEM3L0NZP4nzWZMzn+f10nreJvo9F/59JaFmgiRc1cFmeUrOAcUU5R6Oh?=
 =?us-ascii?Q?csrs4QuZVFWooZQBo96gM/XAD1ABuGTuDw6uieEgZ7YInB2B63UanzPCcY0N?=
 =?us-ascii?Q?D/EqlTrMUqeYA4PjyToJM1jRUWbYuEL5hJaBMkAsHG9BRv7BAx7ccLW5lrVW?=
 =?us-ascii?Q?DrY8mihA4oMtGyrInCCN3D0QEE0ndnH2TygQwkqNqVW7UK6+cDTApOcf0ZMb?=
 =?us-ascii?Q?iDhKiBpzBnnBPRC7skYA51hX+jp05qD4sd6L5PlYic/bfQwioKP0SdtwYrGI?=
 =?us-ascii?Q?yyS/X02WCGEB19HziYwUAWL7L1dTtkmpraAbVO70XXtCkD7hXxEtXBj7qj7g?=
 =?us-ascii?Q?8lVgMs1jD2+IpJM68pf4BkYiWMk81VqgC89oqJfB0MmDD3SYsOCn7JINVvvt?=
 =?us-ascii?Q?pne0NB6Xe2rPD1u5eCTGnmRHc8eA1jefBBvAJUEB79Xg+nNDxENlvkXTlRN7?=
 =?us-ascii?Q?ihTwZdZrt/95etThhHw/tIwkeOMmdQOSFIB1nQcQrB8wTFTM+N5jci5EVVOn?=
 =?us-ascii?Q?v0+sIGBrEKD/dNWdDgqds2pdXu6IKjJVl2lP2ZXW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bbfe77-a1d8-4a50-c306-08ddf6ca63f5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 15:45:27.9655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gxi1OTGIg+mmNM8lBPo0K5KmIBW3tXEXxEElC6iM3uZnlAQJdbKWd1cUHlrd7JIvsXMr2XchzDVc2S7oBDVvIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11417

On Thu, Sep 18, 2025 at 03:55:16AM -0700, Bartosz Golaszewski wrote:
> On Wed, 17 Sep 2025 11:04:17 +0200, Ioana Ciornei <ioana.ciornei@nxp.com> said:
> > There are GPIO controllers such as the one present in the LX2160ARDB
> > QIXIS FPGA which have fixed-direction input and output GPIO lines mixed
> > together in a single register. This cannot be modeled using the
> > gpio-regmap as-is since there is no way to present the true direction of
> > a GPIO line.
> >
> > In order to make this use case possible, add a new configuration
> > parameter - fixed_direction_output - into the gpio_regmap_config
> > structure. This will enable user drivers to provide a bitmap that
> > represents the fixed direction of the GPIO lines.
> >
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> > Changes in v2:
> > - Add the fixed_direction_output bitmap to the gpio_regmap_config
> > Changes in v3:
> > - Make a deep copy of the new bitmap.
> > - Remove the offset check against the ngpio.
> > - Added documentation for the new config field.
> >
> >  drivers/gpio/gpio-regmap.c  | 18 ++++++++++++++++++
> >  include/linux/gpio/regmap.h |  6 ++++++
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> > index e8a32dfebdcb..9edd79b5c10e 100644
> > --- a/drivers/gpio/gpio-regmap.c
> > +++ b/drivers/gpio/gpio-regmap.c
> > @@ -31,6 +31,7 @@ struct gpio_regmap {
> >  	unsigned int reg_clr_base;
> >  	unsigned int reg_dir_in_base;
> >  	unsigned int reg_dir_out_base;
> > +	unsigned long *fixed_direction_output;
> >
> >  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
> >  			      unsigned int offset, unsigned int *reg,
> > @@ -129,6 +130,13 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
> >  	unsigned int base, val, reg, mask;
> >  	int invert, ret;
> >
> > +	if (gpio->fixed_direction_output) {
> > +		if (test_bit(offset, gpio->fixed_direction_output))
> > +			return GPIO_LINE_DIRECTION_OUT;
> > +		else
> > +			return GPIO_LINE_DIRECTION_IN;
> > +	}
> > +
> >  	if (gpio->reg_dat_base && !gpio->reg_set_base)
> >  		return GPIO_LINE_DIRECTION_IN;
> >  	if (gpio->reg_set_base && !gpio->reg_dat_base)
> > @@ -277,6 +285,16 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
> >  			return ERR_PTR(ret);
> >  	}
> >
> > +	if (config->fixed_direction_output) {
> > +		gpio->fixed_direction_output = devm_bitmap_alloc(config->parent,
> > +								 chip->ngpio,
> > +								 GFP_KERNEL);
> 
> Please don't use devres hidden in what is effectively a library function for
> drivers. You have no guarantee this will always be used in probe or that the
> life-time of this will end with the associated device's detach. Just use
> a regular bitmap_alloc().

Ok, sure. I will switch to bitmap_alloc() and bitmap_free().

Ioana

