Return-Path: <linux-gpio+bounces-15330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B45CA27370
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 14:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75AD4188318F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 13:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7639211710;
	Tue,  4 Feb 2025 13:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sBWwEVxM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2078.outbound.protection.outlook.com [40.107.105.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DBB38FAD;
	Tue,  4 Feb 2025 13:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738676271; cv=fail; b=tetylC0mCwPc1rDF3L6lMXbqwCWG4KbccqB1x7TmT1XjC+01jurrmNoNR8bZgK+eum1v0Nbi3yo314AtKXIw4q6RUPqW9phHKMiR3lybV7hXSI/kQmVdHjYYIFZa6JUqOZHgM8q4/nzP7huxwEeqLmqPOm2EIFURfLYierI5PQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738676271; c=relaxed/simple;
	bh=rj2FxlyVREWi5OfuGdNMYUKODj/mEHoUs0+ZwF8t2mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lC7Vu9Y6CBnxndW7ecYx6NygRcecsugMPoV/ZTi6zles6NxPhP5nTWdSb78dDbVKCl4s6/GWpVdDfYVP5Vm9UYEMwRSmqpTd1ipmgWtFZ3omjQ3wfKnbl4is4BAL+e7O1kyRTFrSNBf/pXjzwul021bMg+gc4zzUobBlkr+yfF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sBWwEVxM reason="signature verification failed"; arc=fail smtp.client-ip=40.107.105.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZholX+XGcI7fF0XfabYeUE0zOWUU/14Enul9bUjBSSZba5UFEZIKT200Ox+vI6kRuNQs31KFWqNDwvMfIdbotlR6vQDn+RY48ALHgHpRch/G1FoCEUsXJ8OvVTRGkq0VwX+TVFrPti+6m4zy/z/unYFL4lvTed/sTN5ccr0660sQnL/BfKp3Zc714QA4UrUzXC196De1xm3YUqUfy+ww5pnz9uYpOSXW2yIJ+fsoNTCJZ1MgdqqYVayS3bpcr8kRU40OeiO63nSpgQWbyPi+3XlQ4cH4toMNKHulS0HffJOPITOFfiv2hgJ+g+SqTO9Gg8ygme/xldvoB1X6DqLZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhBnq96MuLdH8vkpuoLONOCXLQcTcDtSQUKwf9WXZaA=;
 b=W83N7fYKRUvZPdW8dkuVR5Cs0RMZY/lvPnPf+1cSw6WM6ic9a2vK0H1SleTh6zL0ivF7z0zEr4vcQ4in0GeoSC5NR3h8EnBipPnqPxJi1OMwLF3FPxwqzjYwgQvPGK+FNFiT8JLB8OV5SmcDP/PCYUcYv9+8I53uVZX6Y8NNVWYdGRDRwMkFIvgPJ9DxxgUp7ZJVI94S/3s/83shwJKNGkIPDTE2Xguv65yv2kvpTKKwezyt+X0Wxs4QWeYV9hjBi1EpbSWZrTH8WIJ8t0j1TiFprIhgQoaWf6GrIqEXhKrm7RRIycmq2BzNmpxxY+Cs1lv70ul/CY5YtHvI8pl+tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhBnq96MuLdH8vkpuoLONOCXLQcTcDtSQUKwf9WXZaA=;
 b=sBWwEVxMl9ytPuqq0C752XSuvCaKQWjRcamiYjbKx0f/Z0Ns+2XlliVOJKo8B/SEC0nNeVPpMmvpF6OhBb2uYy14ctc8wRUHOkboIQNVQ/9P4NtXxzBHruPjQXG1xd6Xs87sXOm87HCs0bLzbn5Dz2+oBcyK73rKO9FhebtOFppsj7lGEVM7votnZKW2OJiGzjm6nFzYmhOV1LAUnAXUSj9bdOuREZ2k5PJVn7t2kpdkR1unycZHOIGPVzGB4aDlmdE0AumxO7iC6klWc8lSFGCK77+6DB6fjepFuqOw6kj/WJkj6YBzPOOrO13PhdFkzGnB1JHfaGKrZ9EgII3Jqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 13:37:44 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 13:37:44 +0000
Date: Tue, 4 Feb 2025 15:37:39 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Subject: Re: [RFC 00/12] staging: media: max96712: Add support for streams
 and multiple sensors
Message-ID: <nudueclozwhjiv3xp3goxobn2xz33mkbxgy3vhneipsepy3ece@njvaprjyewaa>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
 <20250204123925.GA3720681@ragnatech.se>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204123925.GA3720681@ragnatech.se>
X-ClientProxiedBy: AS4P189CA0010.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::14) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AM7PR04MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: ed143093-7dfd-47d4-2a60-08dd45211ab2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|27256017;
X-Microsoft-Antispam-Message-Info:
 =?iso-8859-1?Q?kr8o6xTBw8ayHDHlSLlf7oOipEG/P0T2zq1C7XzthMAJJ7OG+oz+pF7yiq?=
 =?iso-8859-1?Q?cMRXMj09eV8ZvFMAHA35PJ2LaOdXQVIRxZ2rgqFjg8UXLNRwbzfBPCOu1M?=
 =?iso-8859-1?Q?4NGfucah51ZfLVOyDhnQUS1ElWCdlpfxguSs9qmmt0GJd5/HUT8KpDQpyE?=
 =?iso-8859-1?Q?NLiNnDKRAB8zOTdYvIXhPiLKwNsZFSdg2LXz8kY38C8mj0k8e7pLm29T6D?=
 =?iso-8859-1?Q?Aur4BPVfTo1rhAioIrZYfmaZdVce5jnx0CTl6HOgy5UnXeANPcYJdA+ht6?=
 =?iso-8859-1?Q?Vfy+93ksLoMJsmybKuOgOrPz6ghb75zzRXPyXjJ9hWoJwrsFa3+xGkJdPt?=
 =?iso-8859-1?Q?WNyzOg43ANfa/fhsyDOFpu8zmXKi8DyNYJjzAsFpAhXnyO8TeTlCj977xy?=
 =?iso-8859-1?Q?G1MUVY033yLAGUUxXcvnK6kghMvUK1C5rc9z9ciQ90whrxsSnzUwqP8iqM?=
 =?iso-8859-1?Q?BcXD8C+qM538Sd7BGJURER4tfsu4cLjRCgtDj5suFYpzKvtOQGIAICRhMT?=
 =?iso-8859-1?Q?fL25FlrimodVXqENzHPhi5W8A3/OQXtJ62h25Mw4VEljIiau2WD1eP0hH3?=
 =?iso-8859-1?Q?+qo/2ncgFU/Lto1B/CUPIYgqxfY6ek9cpGx6JIUVKHBQeqzhRkzkB3nJoa?=
 =?iso-8859-1?Q?XIzToR32A9tH1fvdmd5P0yPQRLkgPZRzOnYKHi/YxuRCOKicqBvA9EL2xS?=
 =?iso-8859-1?Q?br0DTLGvyHDeDUYBKU0Pt/otjxEBK53U6YSRxAa1a/S97A3Ja8rcXrWxQs?=
 =?iso-8859-1?Q?x3kw9xkIlL7sYq+xU+OZBKVZ5P2e1loI+IrsJg3EwhscgEk4L726kgtD61?=
 =?iso-8859-1?Q?Wq8jGt/FpNPqHXdlyB1zm5qKzopAhsXwkGvOlU+gAv3PsfcDNFLVIJFfSN?=
 =?iso-8859-1?Q?AVC+qYlvpqTuxTywQOvDLstmNyTPEE31Di44uJrmvZs6pVePNQxKLy9ZL0?=
 =?iso-8859-1?Q?a/cj3l5/q/AdhE93VAkNl4BPGt7GB45XGAOyTjPUDaAyBKY0N7feBHv1jO?=
 =?iso-8859-1?Q?ctkFiOribjrqNWP3ZNCrz+RfINLjy7ZXtrQunulC35W72nZm8adtQeRxKB?=
 =?iso-8859-1?Q?g0OvyNZdMu6EJIbBfO3fGVVFIupjv0OsrTzlUvIxzyFywvmnTvvFbl/tUD?=
 =?iso-8859-1?Q?YYp4NykSsyG3Uj4PCknW5NK6HFeLs9gZD6J2Q9I+ktaCNzxnxIYBAiJonc?=
 =?iso-8859-1?Q?LFkknZio0ZxTfraJnMVmCbtiONQdpMiISTBjm1XaaAnlI/pzoQlu3oJvEz?=
 =?iso-8859-1?Q?Kl7H/JFWdJbjj4QaB3h3MNHSxyEC+XJ0udTOsNglf0/Gzf6VvdnfJg5wwq?=
 =?iso-8859-1?Q?3u3m4wY0Uul3jNKqUEfxn1Vlq/IOW/STDBvykA5JMbETbt4XHWovcUOAfQ?=
 =?iso-8859-1?Q?TfU4d2vQPORMY407h6IgKG/UkqJMs20Nay98q8XvJBhUU4LKZHbXJmOdlL?=
 =?iso-8859-1?Q?9/KFFJG7gy6wbH4T?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?iso-8859-1?Q?fSghM7VVG3LSS3n2731Eapj6fY0Pu0Py68eCMy4yY8BG/5W1oduQXWtAHe?=
 =?iso-8859-1?Q?bWZ8DwIketsVfaFOZpgiXdIyMU8L7rtc6y2d8UNaXW8sSsrmcRJEmPNBgJ?=
 =?iso-8859-1?Q?TlQhJi8u6na6cDi9pEfY/bdS8mxARtnFf1AqEFO0/kg6WkZrma2JiG02X/?=
 =?iso-8859-1?Q?Jl36Ms32Kl8kK61DsLzRzyhmwj/LsUjO2OBebjTBlABihPl9XqKFeu/auz?=
 =?iso-8859-1?Q?yL6xn163O7uV0a03v1nOcRbTeAV3IJhEgBjA15XRJZ+4oWW3Iqkl4RoP8P?=
 =?iso-8859-1?Q?rZ6TsGJSR/lXyZTNhIrCidp14v17OqP7CquAodjzhQTO9c6YsAxQNPM/cM?=
 =?iso-8859-1?Q?xjbdav6YK1Y8sAB757gohoT6uezbup91D9oFoa/U6DDxoAWiQxcEhr/cE6?=
 =?iso-8859-1?Q?xBA0IhKOG6phnY0RJUKdn4JJw9JAQato2Nu91GKWKMuF3VL8js803Q7dWH?=
 =?iso-8859-1?Q?IL/ZQdnm3+9D7LZIgBtmwoANv5brGsiXTLHThBRblP1goxbHbH6e8GO0ij?=
 =?iso-8859-1?Q?28IfOAPCtiHMD/egyfCX3HlfexudIFLRcgngC9SfnDMLrZ1+CDIcDUa50s?=
 =?iso-8859-1?Q?C95FcKaYptLqhjXF1cC5Yv0PlMuuCXSPTGZd0Yd2CsbsueZIyqC/I57kpg?=
 =?iso-8859-1?Q?wlEDVO4W9OE79f5p4XHZ3CmByMUgTYqMbtdcdCSYobEEjVUVSus5+o/Hys?=
 =?iso-8859-1?Q?2UhivzLlNIVaMZ/czSzAU+r6llSrhNsYKsMKdQvbPf9wvSHhW0HMSNfvTB?=
 =?iso-8859-1?Q?Tqyh+Z5gWqGV+VV1aFEZKjod1jz2NuBXc+f8GF4AVmRzErY+mnEcS15bM8?=
 =?iso-8859-1?Q?2kmbARgc39oj95FfTBl7BiALEpIV1GUMKWmw7ixriV4/ty2s57sCEd94AG?=
 =?iso-8859-1?Q?gLdzpZ/rwksn/NfeQkBcNHw6z8sFQZ1hDdpzjQ2OjfglyquxPuIQ3WJPYx?=
 =?iso-8859-1?Q?8stMTkfgiEa23pfjyVFUvWgAY8NA5a3Y16ee9TouzfYHeFbKqa5ekz+Naa?=
 =?iso-8859-1?Q?pGuuOW192uuMLd0c3pQzhT8JnnAhvW23WbGo59Vrb8qd4LVWKwvyGv27LP?=
 =?iso-8859-1?Q?arK0bFr8zR36BRwg9mcg5uQ/0IWTtQeFxXlgUp+cnfFoT3NxrneLMGaz/F?=
 =?iso-8859-1?Q?cs/YTCmQ/Wx8GqiTSLK4xZivgi6Zn0jOTpuxsReyKzGAG1J9a6CtbwOZko?=
 =?iso-8859-1?Q?6qxmjhgaEcL4XmErmhC1AVjAhjkbavY/Fc3Ikk/oJoLqhw1qIKNZ+thqVC?=
 =?iso-8859-1?Q?TYeOwILXjRj2dBJEb1Uk90QaWAo4MzZU+zeYMNIvaVl1bIAioWeDKSHu2G?=
 =?iso-8859-1?Q?dD+Tx7RHEbl5d7BV998nVxbaddb0gji7rlTRmb0oZUfPgLrMoFZY160zyq?=
 =?iso-8859-1?Q?UsX1FXrcGR9gb6UifBZVrlzTBuvAbAtBgYkJpPE3GKGBTffnuGPSYGeu3k?=
 =?iso-8859-1?Q?Tf5B5jFp7f3mwnLifjkXEM/abU8uOt9TKvm8lkgOwFuj0AIgQF98IX+v5i?=
 =?iso-8859-1?Q?L50kRypyc3TztCqQZKDQPe6cH3BolM6YN/UeMFizjyK6g/Djil/+ZCLT3B?=
 =?iso-8859-1?Q?uiLyM+TGdsOsohSBULlE09Xe8HQT/ZGdwaV27B6+RW0Tj6/eUM09AlV9qc?=
 =?iso-8859-1?Q?HPP1J0dneEkTyKUsPz8Q6JcakVOYkZffaz1yrkNw3gU75eBFJ4gpJi1w?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed143093-7dfd-47d4-2a60-08dd45211ab2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 13:37:44.3559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/ld63LpO/KDO8x6ZVOD4PAyx7jRIxG7hh/vI3f24f3QFDu6ydrIQ0I5nXiZ2Cq4qkQPe1eLfvlOMXOCM6evGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142

Hi Niklas,

Thanks for giving this series a test. More comments below.

On Tue, Feb 04, 2025 at 01:39:25PM +0100, Niklas Söderlund wrote:
> Hi Laurentiu,
> 
> Thanks for your work. I'm happy someone with a both GMSL cameras and a 
> max96712 found time to work on this driver.

I don't have a max96712 unfortunately. Our setup is based on max96724.

> 
> On 2025-01-31 18:33:54 +0200, Laurentiu Palcu wrote:
> > Hi,
> > 
> > This series adds more functionality to the existing max96712 staging
> > driver allowing multiple sensors to be connected through other
> > compatible serializers. I tried to split the changes in smaller logical
> > changes to make them easier to review while not altering the existing
> > VPG functionality but I could squash all of them together if needed.
> 
> With this series and it's listed dependencies applied my CI tests using 
> the VPG breaks. The controls to select test-pattern seems to be invalid,
> 
>     $ yavta --set-control '0x009f0903 0' /dev/v4l-subdev6
>     Device /dev/v4l-subdev6 opened.
>     unable to set control 0x009f0903: Permission denied (13).
>     Unable to get format: Inappropriate ioctl for device (25).

That's my bad... :/ I have never tried to change test patterns and I
didn't spot the bug. The below change should fix that:

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index b4c3d1d3c9539..6d6dea0a335c7 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -1315,10 +1315,10 @@ static int max96712_v4l2_register(struct max96712_priv *priv)

        v4l2_ctrl_handler_init(&priv->ctrl_handler, 2);

-       v4l2_ctrl_new_int_menu(&priv->ctrl_handler, NULL, V4L2_CID_LINK_FREQ,
+       link_freq_ctrl = v4l2_ctrl_new_int_menu(&priv->ctrl_handler, NULL, V4L2_CID_LINK_FREQ,
                               0, 0, &priv->link_freq);

-       link_freq_ctrl = v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &max96712_ctrl_ops,
+       v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &max96712_ctrl_ops,
                                                      V4L2_CID_TEST_PATTERN,
                                                      ARRAY_SIZE(max96712_test_pattern) - 1,
                                                      0, 0, max96712_test_pattern);

> 
>     (/dev/v4l-subdev6 here is max96712 1-0049)
> 
>     $ yavta -c10 --file=/tmp/vin-capture/isp0-checkerboard-#.bin /dev/video0
>     Device /dev/video0 opened.
>     Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
>     Video format: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
>     8 buffers requested.
>     length: 8294400 offset: 0 timestamp type/source: mono/EoF
>     Buffer 0/0 mapped at address 0xffffbe5d7000.
>     length: 8294400 offset: 32768 timestamp type/source: mono/EoF
>     Buffer 1/0 mapped at address 0xffffbddee000.
>     length: 8294400 offset: 65536 timestamp type/source: mono/EoF
>     Buffer 2/0 mapped at address 0xffffbd605000.
>     length: 8294400 offset: 98304 timestamp type/source: mono/EoF
>     Buffer 3/0 mapped at address 0xffffbce1c000.
>     length: 8294400 offset: 131072 timestamp type/source: mono/EoF
>     Buffer 4/0 mapped at address 0xffffbc633000.
>     length: 8294400 offset: 163840 timestamp type/source: mono/EoF
>     Buffer 5/0 mapped at address 0xffffbbe4a000.
>     length: 8294400 offset: 196608 timestamp type/source: mono/EoF
>     Buffer 6/0 mapped at address 0xffffbb661000.
>     length: 8294400 offset: 229376 timestamp type/source: mono/EoF
>     Buffer 7/0 mapped at address 0xffffbae78000.
>     Unable to start streaming: Invalid argument (22).
> 
> I read in patch 12/12 "The user can also switch over to testing the test 
> pattern by configuring the routes accordingly", but not how to do that 
> to achieve the same functionality as the staging driver. Inspecting the 
> media graph gives little help. Would it be possible to extend the cover 
> letter with this information?

I can do that, sure, but routing setup depends on the board you test on... :/
Basically, the deserializer media node has 6 pads now. Pad 4 is first CSI
output port and pad 6 is the internal VPG source pad. By default, the route
from internal VPG pad to pad 4 is active. So, you shouldn't need to set any
routes on max96712 node for testing VPG. This is how it looks like:

- entity 120: max96712 2-0027 (7 pads, 5 links, 1 route)      
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev11                                                        
        routes:                          
                6/0 -> 4/0 [ACTIVE]
        pad0: Sink                                                                                      
                <- "max96717 8-0040":1 []                                                               
        pad1: Sink                              
                <- "max96717 9-0040":1 []                                                               
        pad2: Sink                                                                                                                                                                                              
                <- "max96717 10-0040":1 []          
        pad3: Sink                                                                                      
                <- "max96717 14-0040":1 []                                                              
        pad4: Source                            
                [stream:0 fmt:RGB888_1X24/1920x1080 field:none colorspace:srgb]
                -> "csidev-4ad30000.csi":0 []
        pad5: Source
        pad6: Sink, Internal
                [stream:0 fmt:RGB888_1X24/1920x1080 field:none colorspace:srgb]

Below is the test script I use to set the routings and links for all the
pipeline in order to test VPG. I'm testing on an i.MX95 board.

./media-ctl -r
./media-ctl -d /dev/media0 -R '"max96712 2-0027" [6/0 -> 4/0 [1]]'
./media-ctl -d /dev/media0 --set-v4l2 '"max96712 2-0027":6/0 [fmt:RGB24/1920x1080 field:none]'
./media-ctl -d /dev/media0 -R '"csidev-4ad30000.csi" [0/0 -> 1/0 [1]]'
./media-ctl -d /dev/media0 --set-v4l2 '"csidev-4ad30000.csi":0/0 [fmt:RGB24/1920x1080 field:none]'
./media-ctl -d /dev/media0 -R '"4ac10000.syscon:formatter@20" [0/0 -> 1/0 [1]]'
./media-ctl -d /dev/media0 --set-v4l2 '"4ac10000.syscon:formatter@20":0/0 [fmt:RGB24/1920x1080 field:none]'
./media-ctl -d /dev/media0 -R '"crossbar" [2/0 -> 7/0 [1]]'
./media-ctl -d /dev/media0 --set-v4l2 '"crossbar":2/0 [fmt:RGB24/1920x1080 field:none]'
./media-ctl -d /dev/media0 --set-v4l2 '"mxc_isi.2":0/0 [fmt:RGB24/1920x1080 field:none]'
./media-ctl -d /dev/media0 -l "'max96712 2-0027':4 -> 'csidev-4ad30000.csi':0 [1]"

./v4l2-ctl --device /dev/video2 --set-fmt-video=width=1920,height=1080,pixelformat=RGB3 --stream-mmap --stream-count=100

However, I suspect that, in your case, the downstream drivers do not support
streams and streaming cannot start. But I might be wrong though...

> 
> To be clear, I don't care about the change in behavior as this driver 
> obviously primary aim should be to  support GMSL2 cameras, not 
> test-pattern generation. It is important for me that it is possible to 
> enable the test pattern generation $somehow at runtime (i.e. no DTS 
> changes). As this is the only method I have to test a bunch of boards.

That's the idea. I can switch between capturing from sensors and generating the
test pattern at runtime. I don't do any changes in the DTB. However, I believe
the downstream devices need to support streams as well in order to work.

> 
> It would also be nice if the patterns generated (output frames) as 
> closely as possible would resembles what is generated today. That way I 
> don't have to alter my CI pipelines too much :-)

I didn't touch the pattern generation part at all. From what I can see, it
looks the same.

Thanks,
Laurentiu

> 
> > 
> > The series only supports tunneling mode and uses the first MIPI-CSI
> > port. Support for more functionality can be added later, if needed.
> > 
> > I sent the set as a RFC because it depends on Sakari's pending internal
> > pads patch which is needed if we want to have an elegant solution for
> > allowing the user to switch between streaming from sensors or just
> > video pattern generation.
> > 
> > Also, the set depends on my previous series which was not yet merged:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=14255
> > 
> > Thanks,
> > Laurentiu
> > 
> > Laurentiu Palcu (11):
> >   dt-bindings: i2c: maxim,max96712: add a couple of new properties
> >   staging: media: max96712: convert to using CCI register access helpers
> >   staging: media: max96712: change DT parsing routine
> >   staging: media: max96712: add link frequency V4L2 control
> >   staging: media: max96712: add I2C mux support
> >   staging: media: max96712: add support for streams
> >   staging: media: max96712: allow enumerating MBUS codes
> >   staging: media: max96712: add set_fmt routine
> >   staging: media: max96712: add gpiochip functionality
> >   staging: media: max96712: add fsync support
> >   staging: media: max96712: allow streaming from connected sensors
> > 
> > Sakari Ailus (1):
> >   media: mc: Add INTERNAL pad flag
> > 
> >  .../bindings/media/i2c/maxim,max96712.yaml    |   45 +
> >  .../media/mediactl/media-types.rst            |    8 +
> >  drivers/media/mc/mc-entity.c                  |   10 +-
> >  drivers/staging/media/max96712/max96712.c     | 1406 +++++++++++++++--
> >  include/uapi/linux/media.h                    |    1 +
> >  5 files changed, 1352 insertions(+), 118 deletions(-)
> > 
> > -- 
> > 2.44.1
> > 
> 
> -- 
> Kind Regards,
> Niklas Söderlund

