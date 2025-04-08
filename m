Return-Path: <linux-gpio+bounces-18494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F563A80B99
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 15:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0220290502F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 13:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D89226B2DC;
	Tue,  8 Apr 2025 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="D5SZA/Ss";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="edJikRmF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221726E166;
	Tue,  8 Apr 2025 12:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116830; cv=fail; b=RKpH05/uIpCC9bQEsRVrETGENBGviRwZjSF9SYE89VtdTMmP5lcm45QUzsvy1KnNV2vbyyg2wiV1K/3YcvJwf5Ixiz9a7hPPplfA7QauUl0SEf3xcKLDkaCQ/be9iQKQTQFrq2PWq90N6+olvsBDjJnjQx9oxEOJQZQuhyHqjjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116830; c=relaxed/simple;
	bh=pn6kMFM9v80eug6+yPdgG2cC8MJxP7Q57hHsKtqQyAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uu6HlcDf3GS8gpL8v0jl5MrdKXm5YgMxHmtVrEVSOrOFPdChyDCyfOWvnm2uK00fhF5l7BlFFfehbqAybcnVF+gLebcX3pWgPujdzeS2v/NlL3lHvjT6MJU5i6j0LsAi01XKMqHMlnSepeooecj05zcHGM3af37v4+7b1P8bYM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=D5SZA/Ss; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=edJikRmF; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5384tFRT031977;
	Tue, 8 Apr 2025 07:53:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=vLnVhFhn1N5i4WV1TL
	FJ32PkKD+mi0yCGGmkwPOjWog=; b=D5SZA/Sscc9uwioI9Swi1z2slpHi2Rl/nr
	yIKCVSYRyF0wj2wKqeIjLasuUOq60SNHYfd9ZFoLP6HCHqjR+K/RHpRW3zMQSqsG
	PLK2O4QaLh9cdrgLsgqn/BWyyb/1xqs3d9JI1Jq2i8mTnGoQqo92RKwPeu3Xt3IA
	VtqLrf2/RWQ5bCPn2IB2gIprfsevJYWYgPlqkEiVRogevN/1z6VDZm9BFWRgmJBS
	QwAYmrltH9zFdgHS8A29S1NtJQzXGLNomBsRGzrT6cHrNd3/ujRBSc9suKxmp0Rf
	a6urmHQlg6PfByYzL2EdXCvh4ZzDvTeWbtTpYMGQL2aRtNjhuVgA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45vemwj1dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 07:53:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHWzWDEedjSf+LEHVs/nXyZBnlpfWe5UdAF39+P/uwPakc9bgFsP9faL42z8FMKvxbCB+xWRYK0YEpboVnT0bYMmvVQC+03Y8ujNvGxUM6AFljEoZFiyG/aO4vaCuwBonh3ttOrzpPQhjl6TD3O1zftf+9b1JxI5nvkZXDh/bEsGRThIo1CYtJU27bO3/eWfp7877bcxEYIzeAhzONUtfpn32srPKBqyXz2YOlCAnNVDLLv3A999PlIREo5Ak8vK5QifeyOpUPRbgzfxfl8s/a41MN5tZibgREw9yn0HTMvnjnt1lBOwRKY682czCb3UXMI+6MiE4m1UpElzKH0/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLnVhFhn1N5i4WV1TLFJ32PkKD+mi0yCGGmkwPOjWog=;
 b=pA4jZqh7TUs/jYH+DNpdALvvj+dv/Nri+jEtRq0Xk/TEh0Br4oObQLxKd8BEzak+2MF4PWGgCLzsGbaCk2w7PiG0KkISbSDlOdy6+uCTuPGXRrTjF0j2G3T6Cf6U0+ZLL9d50cly82sMwweSJ2fjc7/MFUxfGvOq6CwohMyP6WjtyrfPwEp5fLEgy7YLKFyey4xZg8stWvW9CrT6Wdgz8O8x7ByNo5e/J5RvVszt8evGrrIEG4frTjbB9S7GM5s164hk2YC8GaixDpkqcyv4L/i5JVpj3mMdPMiZ9Z483JZs7bdc0LU7CbxUAedmLYOG6kkpVs7RAzKoJwGkVnX55Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=cirrus.com; dmarc=fail
 (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLnVhFhn1N5i4WV1TLFJ32PkKD+mi0yCGGmkwPOjWog=;
 b=edJikRmFSHvtmZpe1AkPd40jFHAR/yqlr7pWVmgaQ9uVOY/yC/NRxyMw1B3H17v3UniAfJNpw/0YZwVIWUANBoE3yc3vdBEIFw8cSfrqnmci2zxdi6pAgc7fAOATgWPPPZ//BmitZpHkFcSX9MS0fMrsCpHJj4NZU7tVhfltbLY=
Received: from BY5PR16CA0033.namprd16.prod.outlook.com (2603:10b6:a03:1a0::46)
 by SJ0PR19MB6897.namprd19.prod.outlook.com (2603:10b6:a03:4ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 12:53:19 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::3a) by BY5PR16CA0033.outlook.office365.com
 (2603:10b6:a03:1a0::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Tue,
 8 Apr 2025 12:53:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Tue, 8 Apr 2025 12:53:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F4059406544;
	Tue,  8 Apr 2025 12:53:16 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id D3E0C820259;
	Tue,  8 Apr 2025 12:53:16 +0000 (UTC)
Date: Tue, 8 Apr 2025 13:53:15 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, patches@opensource.cirrus.com,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/7] ASoC: codec: cs42l56: Convert to GPIO descriptors
Message-ID: <Z/UcOz7RlWSquLXH@opensource.cirrus.com>
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
 <20250408-asoc-gpio-v1-4-c0db9d3fd6e9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-asoc-gpio-v1-4-c0db9d3fd6e9@nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|SJ0PR19MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f362d48-61b7-4a06-8eb9-08dd769c5652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QVFFzYJXh6JRiHHD/cst4UeeOwz+fBdhPsx3dAjBP/p29AeS+e0h9dhmnlmo?=
 =?us-ascii?Q?Q+hOySDIEfrd2QgrFFeExA44mxoHXbLvAI1zdlsfnbNfgw+2ARKF5T3gjwkf?=
 =?us-ascii?Q?g5iiOoyyDrjgPieUdQ6PNab5L5lkIQZIeyNK2uKqDV6uOS4y1pTnIpmd9+rm?=
 =?us-ascii?Q?RxrF1amP6Q5uL00NIXoz35nYfGnAg958wITvFOea522DW439sR/FlwjnWfIc?=
 =?us-ascii?Q?cKNzqXUWEtYtBVSjyZzmhbs2D18sTy8b3bMrtcnGq8nyEaNjqrnIaxMb7pu+?=
 =?us-ascii?Q?uL7xQA52WcrKmzp0800ZLRm+0skBe98WtGH2z99eFUe3i3uRx9niwxC5+fY5?=
 =?us-ascii?Q?yPoqDj/gv2Jr54qookI/HEHHvzeTq2JPSUGVUTN099aS/+ot6Y5sEjvflMHb?=
 =?us-ascii?Q?oJDUOrDzN/Xn5oJY4kkjkd1jD5VeVnr8HwzCloyyEQwvq6Yy9YGOGzxtWsMW?=
 =?us-ascii?Q?qv6v/+l1eMqGP4edwHVuPzliAI9Iu9GOcQeleHr6qOD3DKa8YC6zuJsU01L3?=
 =?us-ascii?Q?+SqI73+l+yeDUYsUC/LWOV7TPTaqW46jVGzMOJh7+L46J/lw/LQgnE6dD2qv?=
 =?us-ascii?Q?JEMZYK/U2PvtH0ZUV/tQjskGoK3PBp8jO79942d7o8c4LEzQTce/bH8SARrA?=
 =?us-ascii?Q?/NQevR7XUAtUrw+8py1qDVUjUqFIoZkiwzlOuFTOHoMTX2mQwMmd5NMqmcna?=
 =?us-ascii?Q?O7Yd3uGX2mYEgjE/5oCScn87w6IsbQgianHrBdxbr2DXSQzJ+zFQZ7sjAOxh?=
 =?us-ascii?Q?cIlC+3AHzdGr5bfxnytbz4NaUsyeei89U+RZsRdqGSjdNOvLs7x9SjsdqiC0?=
 =?us-ascii?Q?s+QXDciN8mQHv8YlrdLyDMzJCxgypo59wUm3WxU54wLZKgb/2H+nhDBbGPGz?=
 =?us-ascii?Q?JBH2HfxSp+jZAF0qhfhfvb0RiMNreaHcqEzNlSc7Q2KC0DIAFzeuEwQhiBcB?=
 =?us-ascii?Q?ZpgqIfoKwFSgTQ+FJdag1wIGBdiuT4kmBdwNUmtK5i3eki2p/q5QWVqJIHMy?=
 =?us-ascii?Q?MS0fkXYpgW9k1Kt5JTerV2PCYuURi9MgTIP+DFu2fJae6c6sBXevhx6rpDOA?=
 =?us-ascii?Q?1M7gGOgOtpfJwH2wMUVmI9mRrQXj+OaAIgM434ehYFqYasdB7juS9uucVp4f?=
 =?us-ascii?Q?scRjJ9wjuU1MPSxxpnN4ZYIPyCF5Mc/vrJvzABae+X94ZW+VmSbU6JMuOfuz?=
 =?us-ascii?Q?euQzTL3V00tzUdzS8oOMm2WrE4JA1Wf93t11c/KohLgAH4khOvB8GnU4SVfk?=
 =?us-ascii?Q?9gLE3N2ie52J0QG7/6pAuoJjO3WV4vdg5pkwO6JUU5DrqfCV1VpEjqJ4RVKO?=
 =?us-ascii?Q?+VXEAURWohQ3RsbQnxocBdZzeVsIncMRfNT8yiAhU7sOmHQsSQ+oAH9Dh+BW?=
 =?us-ascii?Q?T7PN0DFW9ntddJnCn9Fmpz6q3agIgFkcTOGTiyCl/ZjPALJJWGp/HFiGpBv6?=
 =?us-ascii?Q?poBbxEN/Qs9x92wmCVVxlcLIfzaqdof3LidoqbaelNgFlaF5wYdaHkiUAB9G?=
 =?us-ascii?Q?5057kOmegbACHso=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 12:53:18.8423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f362d48-61b7-4a06-8eb9-08dd769c5652
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6897
X-Proofpoint-GUID: _BBeZ3suvQ8iFktZDsUJ2l39G9Rd9zKa
X-Proofpoint-ORIG-GUID: _BBeZ3suvQ8iFktZDsUJ2l39G9Rd9zKa
X-Authority-Analysis: v=2.4 cv=bYprUPPB c=1 sm=1 tr=0 ts=67f51c46 cx=c_pps a=ztkV8ooph0rfw1Th5QLTnw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=8AirrxEcAAAA:8 a=myEZPctyQtqCLxSq6_kA:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On Tue, Apr 08, 2025 at 09:40:00AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> Checking the current driver using legacy GPIO API, the
> nreset value is first output HIGH, then LOW, then HIGH.
> 
> Checking the datasheet, nreset is should be held low after power
> on, when nreset is high, it starts to work.
> 

Does feel like it would have made more sense to request it in
reset at the start certainly, but as you say reasonable to leave
well enough alone.

> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
> no in-tree DTS has the device, so all should be fine.

Yeah it is technically wrong, discussed more below.

> -	pdata->gpio_nreset = of_get_named_gpio(np, "cirrus,gpio-nreset", 0);
> +	pdata->gpio_nreset = devm_gpiod_get_optional(&i2c_client->dev, "cirrus,gpio-nreset",
> +						     GPIOD_OUT_LOW);

Would be nice to call out that this part is already included in
the quirks array in of_find_gpio_rename:

944004eb56dc ("gpiolib: of: add a quirk for reset line for Cirrus CS42L56")

Took me a while to realise this would request the right property.

> -		gpio_set_value_cansleep(cs42l56->pdata.gpio_nreset, 0);
> -		gpio_set_value_cansleep(cs42l56->pdata.gpio_nreset, 1);
> +		gpiod_set_value_cansleep(cs42l56->pdata.gpio_nreset, 1);
> +		gpiod_set_value_cansleep(cs42l56->pdata.gpio_nreset, 0);

I can't say I super love this change as it will mean any users
with a DT that worked with the driver before this change will see
things break. As far as I know the parts you are updating in
this series do not have a lot of users, (and none in tree as you
note) so I guess if everyone else is happy, I don't really object.

Thanks,
Charles

