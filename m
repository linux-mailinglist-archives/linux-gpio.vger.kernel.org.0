Return-Path: <linux-gpio+bounces-18516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D29A812D7
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 18:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AFD61B840A3
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 16:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DCB22FF4D;
	Tue,  8 Apr 2025 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Y0I5Lbfh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xu9K15nE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D064E1D61A2;
	Tue,  8 Apr 2025 16:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131046; cv=fail; b=NRwxQS41UKhTym854e5UbBz5RXlGPmj310LzUIxIcRgsgjWucdgmNrISLybVev09jfn3KfgNtSvP8yPu8Zp79wXJh3SGo+UgB98xLrGEctl3K6j1MvQT6cXyejdkAY3RzmOif5K1G/3Uu6EB9/0AOUFKuYdoAl1lzyw4+UqP6J4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131046; c=relaxed/simple;
	bh=rnDtaAT4DeTciNwlBNwyS1C9Clh54N4rbqGp52D1KwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjG+IirhuYQkMMxswiOtsNGS3Vzy8W/S2UrHKuHXzdB/y3IQ6JTgXyAmGk+kGtBxj1VFQ5ob/TuyXFesftTdVg5OwPxi3QbjF3xuznCM8FaF5fV4OdpkwY1VIOPm2KusMofwCGqeta8mj4UhJRN2jDjRHZe20EgVbD3hAK9R5bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Y0I5Lbfh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xu9K15nE; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5385oLYR022099;
	Tue, 8 Apr 2025 11:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=rnDtaAT4DeTciNwlBN
	wyS1C9Clh54N4rbqGp52D1KwQ=; b=Y0I5LbfhWvwgKCdmJe+zxCMlq676HT0QTg
	Hjf+IpvMW9ktWuEFohFzB09mu3cggYW1gwzNYOPU5xkoyQGS0fCwghSEeQcNLC64
	matdhEIKoo/q225Fz1NnaR4l3uCnV6uXu2HVLzoH+oJxrq6pacDvbQEhkVJTvb9+
	LSY70dsP3QlVCzvZZr2p/AZVYDR+7xjTebS2UBeEGOgXrAVzHeTKk6f7PPEEzvtw
	+92Ktfy3g/DgEgZAc+oO0ldJ++JjHu+CWOscCSwT8NZyfX1PQvWyag25mv5g7Mwm
	NyIPmvcEwXAA3PmRYpND1Ur4R1RSciC3zEOo3s6lUAvv+vKByGtw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45u0xgmq2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 11:50:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=py9wUu4QztEmTqwbYLlWtvbK9HrwOLo1ArTHF/zstr6vaE/TJIvbrZOM0Ps8KPxSDkQhz6XhroW91Pujpkd0aJAIJrfmiZkhB5Aspqr1oAR/XwXKLVqbhTyuVzgXdDU1KEpYiyAmOz6+BLFbRxcSRyLv2W31NZjQs/vF/RUL/TWhcoPRfMNVUUpUlnh+QGHzcRBxesCJj+aQfwqlWeoKYV2mUefnfaHr1mCTfipH9jhXbK9JokNzVgnqnTZMTiPi7cBsWYHdDfSEZHHeXJr0lDKnEmS0CXBdSAr4ClpenDBKxCQFww+NeWBBQGjsLPlw0aKcXOgjUoiFwphkdt5AcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnDtaAT4DeTciNwlBNwyS1C9Clh54N4rbqGp52D1KwQ=;
 b=inRrGFvIf50Y8YRwftaWLiiugxY6hNefRJoFWz+DP8+f4hyH5AqL/pDzGieDPef4KdHxYVwKwwkva7INyi17hAxv0UKIALFya8bad+iNGOqidt6R4GQfUeGOJUYdvgbVbY6cautKwjowVcbZ9y4KJM8XBmRbo7WwM2gSNdY/kNP4dQlX4vlHEAUWvkOvVL8PrJOqFjb/w1vXyTxeHCwDCD10TfnIH7pcU6/e2x/JSieYDKhKC0/K3LyRlNs/gjzmq2hwq3stJFF+KB32pAOLE9pts0Wt9KWm4Pmjajjq9GgfS2ol09qXz9shZ1dt6U7qB3F/t7QnPwduOBseshE0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=cirrus.com; dmarc=fail
 (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnDtaAT4DeTciNwlBNwyS1C9Clh54N4rbqGp52D1KwQ=;
 b=xu9K15nEIDfvWOqRlbhDuepKOe4fvzz1FWHDfup8YPEpMD4JyxWX18lY/tadLwOQ6BzyMWWqlJHIso8lwtjnSL1OJQsCYop4urOBwjA/cnFK0gDxVYsq2FK7oN+R7gaNeRJCBJsFrU/S7mW3QLqkRjFdWn7hCvYxOx5ir9O8j6o=
Received: from SA1P222CA0083.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::21)
 by SA3PR19MB7814.namprd19.prod.outlook.com (2603:10b6:806:2fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 16:50:23 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::2) by SA1P222CA0083.outlook.office365.com
 (2603:10b6:806:35e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Tue,
 8 Apr 2025 16:50:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 8 Apr 2025 16:50:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 37CD7406544;
	Tue,  8 Apr 2025 16:50:21 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 1835B820259;
	Tue,  8 Apr 2025 16:50:21 +0000 (UTC)
Date: Tue, 8 Apr 2025 17:50:20 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, patches@opensource.cirrus.com,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/7] ASoC: codec: cs42l56: Convert to GPIO descriptors
Message-ID: <Z/VTzOW6X2ZB/QHg@opensource.cirrus.com>
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
 <20250408-asoc-gpio-v1-4-c0db9d3fd6e9@nxp.com>
 <66db9962-d773-4c7a-bf59-4698eca9eedc@sirena.org.uk>
 <20250408160408.GB31497@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408160408.GB31497@nxa18884-linux>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|SA3PR19MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d6be56-ab87-450d-ffa4-08dd76bd7440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d+Eo8NT6O2VIXtAOjGvDjRQxzGYuR67cusLzmf12SthLRvxHAXVqEZqluyHN?=
 =?us-ascii?Q?lhjbafRy1w++b3LDkMiwHe9bXvL04wGJDcbcz7/RaHgPzIDPwHOQ+Feu3LCz?=
 =?us-ascii?Q?U88OedYPuyKAYdbO6jiD6cXrKqE9whe61PVjDSAXlqSTSGOHH9n+e3k0154u?=
 =?us-ascii?Q?ydzATZP9yV9roP/wcN5oCEsd6dec8aXBkyH1SrIprfsVXG6YNXD1HuJhOt2H?=
 =?us-ascii?Q?StugIDJ/6bVsPsnFXCCwfgSA6VFS7SAMJpV6hDANO5fbsnVogaQ6eeyaIbXO?=
 =?us-ascii?Q?YKZKsplDxpEySEkrlO2ZvPw9DiEwL67S9oa0tQjJuY0BQrR56T15TJ+Pt6mm?=
 =?us-ascii?Q?7wsQ/VUhuIrufgtWXbVmvdxfxIRqqfEsy1wU8sDL7c8GWAGgoYqXvhAYdcho?=
 =?us-ascii?Q?pVBOwqy88wBdnsqthIzOOEAhmt3i2sniIlqYEk2mj+Uo6O9/PC/VGdnUk+UT?=
 =?us-ascii?Q?xbCM4ubfk84lEqYgzfuWiWE7AJzMJHYELU0R41+lyAAgT4YPvKghM48Xrula?=
 =?us-ascii?Q?6nKJLAKe1srULMJvw3gX+56X6yS5U0iXriZfqmM6SwBZ6S2gKCpM4zjX7wn/?=
 =?us-ascii?Q?ocKApILs4OgVJK2myiVVutOsc2KNxuvAxmjuUdka+gvzgvJJtQsDxdBBaglF?=
 =?us-ascii?Q?uIqE2QkwNOZ6CqCfTqYTXZQ2GPtZ7kqcSkV8r5d0c1T3HAIU+N9a9MO4tIxX?=
 =?us-ascii?Q?YdWTBe0hRHSfo0TvE+tcQyKia8OkE9VBCPvjttA2lydbE+0VTeVvafQCzn1l?=
 =?us-ascii?Q?4Z04Fuf8UbXsD8Ub4CebGnF3iwof9DLeHGiFgrJHaAwwR0H6ZHdUx+LpGnnY?=
 =?us-ascii?Q?MNMAzQaRmSYOlaMPrRFCDkWkz1BwuVLHA+D8lYeXCfREmhfAWr6Mq62g9T1r?=
 =?us-ascii?Q?VfnfxIBEUva9eoieTcjsZzmcGrQ3o4tF93R3dZnd6vxEj8criJ28l8+TSd15?=
 =?us-ascii?Q?TGSQQQUMiMPbor9Kk7MA5wV5inNXFVGD4cDmcU4GxvA6dNSyZdtKui6MPhpQ?=
 =?us-ascii?Q?03qN4Xty45B0ey0sPsto1DyyD+vJInoHLyTvlUnDGRz/iX7nqJaxBTyVXi/u?=
 =?us-ascii?Q?NuuhciB2QoRRNntUr1C7zVptGnXtvwoYehFvGbrj1RtM8Fox+qQCEubs3DoS?=
 =?us-ascii?Q?1vA07M4GLmyGIyGJV7KTWna/ZWQnPqXQexUVdPLfRiFxCyZgpEtWxcD3ahPS?=
 =?us-ascii?Q?iJkWY0kSHIMZczabAG7UVlPqptZYYngdHOHV3eXCT0PydLmIJY8EAYcoXa/t?=
 =?us-ascii?Q?Cfh9R5cBfJun3uCL7R5rDyUz+ZLCZNXi//qB2Cw3c90V0K1bAAV61+F93RE4?=
 =?us-ascii?Q?75T2yKdtGEIhCPjyTCn6igwcCI6XJwEPZxS+yUd4+Wuip+ljFsGERd/RBQEG?=
 =?us-ascii?Q?J7Z1iNq7sNGEkiLmK6H8cUcR1S+LmwSgJMQMAXEpCDxLFDEt1whfSNkaxtMR?=
 =?us-ascii?Q?aIx6rFk9Q3mt2Wrj5+4MbXoEcJwwK9Y/gYntJ8xBz024pNFz4wmpwTq1+b2T?=
 =?us-ascii?Q?97mpB2gP4DZG8CcbG1+i1tPaeyCKNyg2pa5d?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:50:22.5135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d6be56-ab87-450d-ffa4-08dd76bd7440
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB7814
X-Proofpoint-GUID: 8YKJ3PPE-kqJvHWzhzIatlFU7FdkkVMO
X-Authority-Analysis: v=2.4 cv=bOIWIO+Z c=1 sm=1 tr=0 ts=67f553d3 cx=c_pps a=PK5aExQQjalka8oDlC/sVA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=8AirrxEcAAAA:8 a=oU_Z_6HL0QReveL2Z8gA:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: 8YKJ3PPE-kqJvHWzhzIatlFU7FdkkVMO
X-Proofpoint-Spam-Reason: safe

On Wed, Apr 09, 2025 at 12:04:08AM +0800, Peng Fan wrote:
> On Tue, Apr 08, 2025 at 03:24:35PM +0100, Mark Brown wrote:
> >On Tue, Apr 08, 2025 at 09:40:00AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> >> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
> >> no in-tree DTS has the device, so all should be fine.
> >
> >This is the whole thing where gpiolib introducing inversion causing
> >confusion.

Indeed it comes up pretty often, even worse with ACPI, at least
in DT we can generally make new things use the flag.

> Let's see whether Linus and Bartosz prefer a polarity quirk for this.

Yeah happy to wait see what Linus and Bartosz think, as noted I
am ok either way really, just mostly wanted to make sure we were
making a concious choice.

> But honestly, I am thinking if might be better to remove the drivers
> that for end-of-life chips and no users for quite long time(years?).

As for removing the drivers, I don't have a great objection to
that they are all end of life products with no in tree users. But
on the flip side the cost of keeping them seems fairly low here.
Personally, I would be inclined to keep the driver and just leave
the polarity stuff as is. That should mean any out of tree users
remain in what ever state they are currently in and if a user
turns up wanting it one way or the other then an in tree user
probably wins.

Thanks,
Charles

