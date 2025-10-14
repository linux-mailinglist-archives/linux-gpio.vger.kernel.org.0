Return-Path: <linux-gpio+bounces-27078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0611EBD9111
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 13:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4977F188FD06
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 11:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B311A2DAFBD;
	Tue, 14 Oct 2025 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DRW8Gmak"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFC2223DF6;
	Tue, 14 Oct 2025 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760442022; cv=fail; b=Dvq2zCG6tUWBjJQyqXHvjqpJdj7t1p0YysJNeyZJJlY64+Ic0Wdpt/BXaw1oQs/oJUu2bf9q3J5T/gVQ5Lqtd87//BPUXg5Lr1hdFUYj7VUsTcWnpkezwfHmyezFbFDfNYoO8e3iRwSFPrWW6wVAyi1ceIQ1z89p76XJT2JampA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760442022; c=relaxed/simple;
	bh=8wcnxUgrrEiehfTBoWpd0iaWI8Ql31iDogs8GPPYlb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nK9OAPTce3qj89OvEngjmKQOhl1xMPz6rIUCGwcOzKEJ140SSZfGk2/+m+c4ghZXa2RfjbPnmriFxlF9Qvdyon81rYd9CofnjRfMvEAbg7McUcWyeiA79a5H//tDHTsI0m2M7NI5AseJy8Eeyi9G9rjjGTOgKxHjp+QUO6Pw8lQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DRW8Gmak; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNbBsKWy8bsnwBUaxsZ2p1u8f9G3cet4TOcZw6mP1nWRUQVT61tBSyPv0FGeotn5sT6O1xFFeQd3drjcvQ3CqtXhUKKVWdea3OHga4tC8D84oJvqcDiqJ7iR5fdLSYckGSze/PA+Hcxj9dSF0nkwwl/DdhKsdgQNomzNxUsvg1E7vKB65QHqq5opFxQBAw8zj5acNtXs4yj4xHMk+4gKCBC44KA3XLhWvhyGVKsXMFWy/AWI3ep8r+nJHrpjmMigLYlMbXRRsoBkvprq32Qjz2+P1sFNSnrqQogSz9YSK83TaBb6d1t/I3f8p7X+VyPfn20F/o7bSC+ILZv8P195vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjzcDzpHwUE3KK4D5PG1D9xwZV4n+8lvGmEAXJQYBq4=;
 b=U1Ozas5Hpxs4RRKtvYFP3hZjg2OJjcMy5vbRxzSJq0jmSNJELD8nTkNCiIzod3KXn1d2uWAM6SWJDZvw1s8zUXk2xogid0TmL1zQs1L60XoFaghQ/h4ZNDEaegNay1cfDazF2jhmOH77mnD0TFlRFiN8pytE/ZK0dgYqnd+T5l4jeDTpW2oqm+oRCFwj/QlBConAK8Lb8I8DolUUG7ESZzt16O4HF8lX34XS5EJWdw4dz7q71UO72VwlVCW1Ah0hJjmkCXiRJJUkE2wY4FbwU9QjErMFHe1z8DOoanXOzbs1ZNsUbkPNYn4FpDE9EQjt5bAkrCDiKqQ8y3wmj3owMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjzcDzpHwUE3KK4D5PG1D9xwZV4n+8lvGmEAXJQYBq4=;
 b=DRW8GmakD6ZAgA7f7lN/uHW5aPkxeLmUInDoicxDUybbfKoF38SlKZLOubaEiMj2mEJvTvRCt2Y6MXG1FjuOuD6OPaAe278q3m6uyJkVAx0+V5qLPRBHBKrPWhvjwRMqsDQVFiYQ0azJ7x1R28kS5HSRVFgEhrX8i7AMhrncyeIzSWjpEdNe0ABHqNfDF3f2s70oGbI4h0shqf4WXfGKTgei+YCZnT6rnpzV+1PMetBz+k3tUUq86sGn541UH+6ZWk8Vh8llnrhv6TTUBd/TckxvGlHpKaKvHkWivWmYQAGOjY6+DBtjYBtIekqu88wcqMqoQoHhDB0JFGPyDx6MxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AM8PR04MB8036.eurprd04.prod.outlook.com (2603:10a6:20b:242::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 11:40:17 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 11:40:17 +0000
Date: Tue, 14 Oct 2025 14:40:13 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Michael Walle <mwalle@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>, 
	Mark Cave-Ayland <mark.caveayland@nutanix.com>, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andriy.shevchenko@linux.intel.com, broonie@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: gpio: gpio-pci-idio-16 regression after LTS upgrade
Message-ID: <63ersts3bg5v2sm4sem357wi7oguslbj7mictb4xwfkuo56uak@qqmqehv6cowf>
References: <df4857cb-daae-4428-bd93-5878564624c5@nutanix.com>
 <20251009094905.223456-1-wbg@kernel.org>
 <DDHX9YA0ZMKO.C1MA3CHLT4ZZ@kernel.org>
 <jajbilboyqty3a5tbgjgwklrpcstv7gotkqis46cuzgew7ip4q@ej37jq2cev77>
 <DDI0AO1RKDJK.1M31TW8HEJHFU@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDI0AO1RKDJK.1M31TW8HEJHFU@kernel.org>
X-ClientProxiedBy: AM0PR02CA0152.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::19) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AM8PR04MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: efaff500-afdb-4e0e-b17e-08de0b167286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b38Sti0AKs2AaEVY4g3HVZ+N4D8Iuwd68RhHsIz58vuuJuv2cR6gobIZdbdj?=
 =?us-ascii?Q?XroEk0vmaNoEHvGYbQLOyAQP0CHmW0/qHnkDFi7zNcSla/vb+8MWxLW3NQX5?=
 =?us-ascii?Q?kYhSrrQcynhwA9KP6jXHPYfxhhI8ARMn8Hrdn92lVlqVl+uobe8B8Z9tkl34?=
 =?us-ascii?Q?qLcHoghSwT+n0eFvczP8KhPsW1+fOFz83LAuFL7tNdvTHGupqh2KxXHe4XVp?=
 =?us-ascii?Q?VjGaqrskS3/sn5HtsN2pVisZeW1zzTLHGzTslLMHL9OUoWAmD9dKKfPgPoZt?=
 =?us-ascii?Q?jvw6+lFy24nrCkq9Rkdc86N7xuKUoUcyMSJ5hTHT+FY4vqE6wkq5zrmsITia?=
 =?us-ascii?Q?NPNZPC7gDrQEGGKB9VwGMFEp6Op5aX5REjeYrGrykZSy6H2SJar7KEKCGUfF?=
 =?us-ascii?Q?drIsz1b9xM6JDJlrZcdVvWD0XXmhMLrPIJKOxTtjk7XbfguAJOhjOOyTsPo1?=
 =?us-ascii?Q?UQ9YQ4K81mc0aULBMJwWbINCrjohpd4jM+EvsuGgDhz0pwcTE2clD901FKi4?=
 =?us-ascii?Q?6q4Cb57UDqvhijGjWd+bL4Wd95N0JRGbeMUnrgjX2QZ7HnXGuX1ALhweFweW?=
 =?us-ascii?Q?TnjbhhykYGxAPGI+ONIIh2tbziPCONNg4Q3u4awg22H+KE2CaRhlbf1JjODN?=
 =?us-ascii?Q?r0RDKY8P7Lq0SlTG7uKgpVxP3qafwN5HeC8N7tie//zhhVMsH4/MTe1QquVc?=
 =?us-ascii?Q?Ei8fgJBcF4Q1w2paMkzZMJM40bMhkMLRJ8r6ItetnAWnEBd4+XmkaTKlCnbk?=
 =?us-ascii?Q?+dD09JYHLZnj0fNyiV6LaKo0fj02QLFxVoNrnvYU8Aoug2pcZzqK4zLthIwO?=
 =?us-ascii?Q?j3R8Dk53l5rfgCCoJYBAaMwPPbJHTGv4UGDPK8sOLXGpdNrE4jhODIR08Nsw?=
 =?us-ascii?Q?UGx2nQTdcKeE50y6QNOSjLYL2ALjqNno17bCrj5N3Lh+ddfbqiU+ncgmUpd9?=
 =?us-ascii?Q?aU0PdFTjBDGT+Ox5p4yC9esURwg4gEbb5mPkbv+JwsWTP7rBHjD4gACGVAk9?=
 =?us-ascii?Q?ebdaFDrS06WqKC+ekPPMF9zKorydYQWe4okdk4QhwoQ0KYiZ7hRkKucE82NI?=
 =?us-ascii?Q?n404DPfJYE85IGT4UmK2gajeeRczF89dDpNz+qND1Bcuc0XB4netNeuaXH8x?=
 =?us-ascii?Q?tp8WymWdt/TFWCl+Duo/rP73FZaAqxR6BG8ipwx/VVdWU+TQry5Of+i4uhh/?=
 =?us-ascii?Q?hrSZZw1xlAK1k60Dk5htrAzl+E1eF0jK+96Cgq5pMBy5PzdtUyBf7VC+OUiO?=
 =?us-ascii?Q?2Hvoj2kuYqywsj0/ytnJHk9zSs8qbAPOyo+Uc8X5q5Y5g004OsAaBUQoQIFq?=
 =?us-ascii?Q?xwbq02bP6sgMJRh5mJ19arV3nh5JHNg+4JdQSmVH2XLRxT3V+Uf8AYtIuoIx?=
 =?us-ascii?Q?tw5DRRLVQhcigFRwTQQsfRmkBq+/5FzXWPSEosBmSks5zWh/y0PzevShVXA+?=
 =?us-ascii?Q?+azkFJVCSRssOEXRhzotrpD2DkivF3Q/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I/nxRU13po5fHp7cO0ET7XAmMlD9C8rCTyOZycT4LWzc0eW6iez/nHtkm9wN?=
 =?us-ascii?Q?PCBnvedDDsfGcWqW10btMT8m76bURyCDyxAbmcta8qfeioqSusAsQjNMdm7/?=
 =?us-ascii?Q?r0V3fsFdUio+sfXRdaeQ9cbPLMz38RAxHnsQc+elkEC1M5GpnkdkitKhfHDC?=
 =?us-ascii?Q?eA+PETIZhw2LZ6+b3c2ZpxonSicWnFdTlGaI5dzGMqFA3/+a9sS7bPhbXzLo?=
 =?us-ascii?Q?lmAj0iJd3TnbAsc0eRvNFdAuZeWT8+MyWre2Xe9uXh01Wf4iqBa56z/veS8y?=
 =?us-ascii?Q?awOwlV/0XL/5MY8jqmit7FVynMOyaaXl3n7ei0dKvCqBeaP/IOXRe8zue96v?=
 =?us-ascii?Q?McXK21i7ovfURck/ubQTqJFaaHHRbQ8Gr8jI/Sw1c9P1RdbGEKGJqzfg5ikD?=
 =?us-ascii?Q?xiDRo4s4Te39oCANYHHWN4LF0a9MaiC0UoWylH22cUbtWLf4kPqN2LBNjvfx?=
 =?us-ascii?Q?6R70+AbmbOUNFywbThQhfm9FRFRDzDstQdFv6rNpIs0LE+kq/T+2wnmU840T?=
 =?us-ascii?Q?eZ6F8m1Pew6shmbxuDCvm7LxdeRrVMw3llGZW1PVIxA60yBDeQA494ppVgU/?=
 =?us-ascii?Q?EwrdLa1xo5u+jGZXFBZmr0PUKFYdByjLz8zf2v64gC/mD7JT2xZ0fU04oFja?=
 =?us-ascii?Q?k2iAYoN88MAvzeavl+PgO2YLllXP/LDoomKEX2AwVUkzgc8Mq+RUyfmiUov4?=
 =?us-ascii?Q?jj3lxAiDygZogxrMTa6f8JlrfzBqiF+RJfkZQKupeAQv866zAmqCX4skFXbc?=
 =?us-ascii?Q?B+TNSsoVsX0t3XQl/VNk5jBFI+BKFGSW2XFkZe+PvYgewALASc7k46nTpXmC?=
 =?us-ascii?Q?VuJVc59J+v/onCmteAjrO6+LkK5n2WYAawG6gWjxcpLoWL3IXUwzT5ZCkeq0?=
 =?us-ascii?Q?br18Gv/0aFqB2RQ9KpI59RZEWh2RnoC799pn9OurGhi7aMQHwOmSDz8tS4m+?=
 =?us-ascii?Q?P8wWey7huCdVUEzCYpXwS9XrLJFq/W+ol4Zai8kAUhWpH4q92TWk/eRqhrcz?=
 =?us-ascii?Q?1kJ3KvICf/v712/4+YgG4XTbwvPWHjYkQ0QV5mFOKWfPH8NMLsVKYAMHsIzu?=
 =?us-ascii?Q?3BOnOvRBEtXlEdJNx1OwqH+h3aCkmHQfscZBX0FnqxlIfUb9EEjDi8Eq7whN?=
 =?us-ascii?Q?teZxrE1sbZTsDyDdiaGjiBFZdtm6GdTiF1gfZ2SrEky+VZv/51PrzXU8D/rs?=
 =?us-ascii?Q?qrIvI0tROJSLTw9DydEGiYVC1ucgPiAl9pC7Gp4eIV/E+o8+a336dPz01bv8?=
 =?us-ascii?Q?nrOhMtpvC1KBD+qB7KCAwnsu+O5bve7dLwYM6u5m5qfc0e8+FBDgCVL4tUXw?=
 =?us-ascii?Q?nP2QThqdyGZanqiRFw4iFH5Ghn3gjgCu/Tahdf7sa/I6ieUQOag1ymhQitrC?=
 =?us-ascii?Q?4AdBfMHrpJUjgg7wi9WIzz7j/3Urtoddr59oOdn9V7lHRN9PDBG3dveFalwy?=
 =?us-ascii?Q?ErdecbcGcPkj2KIpO3hd5wyA4Xxc/OKuMZGTrd0kfnvjN1/ZQTgC+IZjL6Fr?=
 =?us-ascii?Q?/Wmd10Xbm8uiExOmGsM6eQPjitFniXgzs5zPXcMM55RPpFIGPu2P2ZRS9Jh5?=
 =?us-ascii?Q?BW+OIoc21HjQQBggnQBNHvHn8KRSnY6XB0Rz3hZh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efaff500-afdb-4e0e-b17e-08de0b167286
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 11:40:17.3255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFrD3Vgc/EdfbGKwzTf5JPlHWb3sZv8s2XaIzCgcl5wc9AyBFjCqXY/TBy8wT3xNDYJQIIZsUTzmMZykXdrwkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8036

On Tue, Oct 14, 2025 at 01:25:24PM +0200, Michael Walle wrote:
> On Tue Oct 14, 2025 at 1:21 PM CEST, Ioana Ciornei wrote:
> >> To fix the regression, I guess the patch can then be picked up by the
> >> stable team along with the driver patch which will set the
> >> .fixed_direction_output config field.
> >
> > Just to make sure that I understand, do you want me to add another patch
> > that adds the new driver user or that will be handled separately?
> 
> No, no. No new patch. It's just that your patch (just the one which
> has that property added to gpio-regmap) has to be submitted to the stable
> kernels (by the one who is fixing the regression) I guess.

Ok, understood.

Ioana

