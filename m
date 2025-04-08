Return-Path: <linux-gpio+bounces-18507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DF9A80EEB
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 16:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7CA8165EDF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 14:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21531EB194;
	Tue,  8 Apr 2025 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fnyXKbBA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010068.outbound.protection.outlook.com [52.101.69.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842F91B6CE5;
	Tue,  8 Apr 2025 14:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123833; cv=fail; b=Mh9XNxdGNqx/iwzt4DvQj8xrCwQBPYdzOViJfCRJN4H7FZCt55QjVlC+nM7I1rjcBNJkommohAJXYzg1a8kTI+omHsckayrFJtTbCjnBDuZMaO6HFsfQI9yjVAL7USH+FDxhl7K6i1ry1iklTHzQxfE37oXmUET/Rr3XDLbuGfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123833; c=relaxed/simple;
	bh=kjRLl72nXV/ARvNBTz0FTzp68cZuiqRnrflvxo5qrdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V5PYnvglF3NkmkH53SJjbx1e2HddSszmmi2cSfSq8WcDTTlOaFnVY+U+9avdbDhFNYqs68tj57bRwSVffZP2laKVwQhdqRYiecW9CWpbIVlsLo8N/GlTdpxZobcY4KLm5jzxciTC1UMwt6SuOHh9AMx5Y9K2jGQk+0VAhe3ztw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fnyXKbBA; arc=fail smtp.client-ip=52.101.69.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ib/58x30mcmkEU+V14leow+g0BfRmZS1hgd6iuMNOqw2cAgNZYPpEGUq7MQeaQJlh81P/iXoVtnBr4Zo9BVvBPOPIQ2NpIugSQGfwVosdMS7LXKLwgxUQPjOF6V1LzHYAkgzNEFy+rCiBM9YWeBdGOiGGq57ovxKfa42edaXjLA113ZJITldgoOSTLVC6xGVaB/JaUkY+VAUa4wDihHaxeSfttysc7sQPa8fnpo/oBqyh72q0rK5QaQ/HrYKQdAlzq8N9EAnDPWi59Cd/iIGZ0WtiPN/lMzs5P1o7wPleh5wSGajOO9Vh3KWh8wrFNQkZaFPbduUxZXKhyaEHcG2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fB8LIPBVU0uDKvwKmu89cLAX/+CWjfz2dXaiX5j8INs=;
 b=d+M+7f01rhRfwhlYUbUhAmd0RWaRYQnzfll+g4nYpg/WjHLc53V+P1KozdvaJ2Itff1N8csi/q3TRhVvPVA5vJYDLM5+OFHuxvEt0phfFI8+fca6k3VlxJI6y61cbIfPHKNagXrf1tWBq37FRuelWe8bRJW2Js8S+ap5kSN4qYO/g/ORjss/CuhfGSInGAocvh6p6p2RiQMb5Z8Ty8fMO6MExucR1j4uFIcCBxAO49xE5BMf+suYqSziCznPfOOXv/sTvry1rLzEEBNdgndp6mAJVb4J9XdZCPPM0Nj6e+pojxPDO2QbaxnjWVVX+fLwBgDW2KZSSXJEZL/2Ze6BYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fB8LIPBVU0uDKvwKmu89cLAX/+CWjfz2dXaiX5j8INs=;
 b=fnyXKbBAKQCiDb//nClyEtsi5JWdgpUXPmxtNPbrr92vcah4SCO2ZkRPJy7LUyGcbi010d0sH2R84OERd/D1BbZcpbsyuhyYG1LYCSswK6sC9bh2WFwxZNTtb3vfYA35HjrqSNXSriPF0Sj8RV3v4Xa5Z6jO13JNZm081EfFx4Cjl0g1bNDvqdMZGABTJcb1EcUbhHj1eUuPI8zPhJB45ZmU6GDyhK4hLTQbZg6WEHPFx5hA43FZ9RWORETvwsb+fqBE3qlk7aK3rYmS4s9CRrMp3cNzThO1Bg92mGO/O1KSqoM3345ySZ1LasDoXUFCCG+qeiM6LIrl3yJgGVk96w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA2PR04MB10130.eurprd04.prod.outlook.com (2603:10a6:102:408::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 14:50:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 14:50:27 +0000
Date: Tue, 8 Apr 2025 23:58:50 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
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
Message-ID: <20250408155850.GA31497@nxa18884-linux>
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
 <20250408-asoc-gpio-v1-4-c0db9d3fd6e9@nxp.com>
 <Z/UcOz7RlWSquLXH@opensource.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/UcOz7RlWSquLXH@opensource.cirrus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA2PR04MB10130:EE_
X-MS-Office365-Filtering-Correlation-Id: e426c389-45df-45a6-b947-08dd76acb38a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AE+ysww+K3Y2rJX6kboPJpTXVyUsXpI9WKbvkCC8GOuuCWFLVElW6RnMO6Sy?=
 =?us-ascii?Q?jVkt3gHlVwXUZ6mim4sV6gwuPp0kdp7fzllVtc0BgLtIhUhkVw+moAJkIv0Z?=
 =?us-ascii?Q?/C9bv6MxV12FiRPAZbP7+JtK7oO6+IHlDCQtDGZKsjBpLrxmcq4ckDEPQKu1?=
 =?us-ascii?Q?IocWEhnygLuAVw5U2SwKDbhNq3gyT18TYF4bLf/sopzRwGaOlENucd5XUTO+?=
 =?us-ascii?Q?rLbc4wJmcNQzaojQoNmKmHSvXHgeIwsIsSYMAalRjQB2pK1Q3H6N1kKJACok?=
 =?us-ascii?Q?0q7Bi5aF2jBAu6Qc2qEl7x8wZG+elxGYmmxDQYHtHLEJqharXiOCMMJwkO3R?=
 =?us-ascii?Q?XC4iwG/yu/AbeMys2CKejg6feASoM2b3McHdK8FDKeyJ4aFQFDYF6EpvyyRG?=
 =?us-ascii?Q?LDYA/4D0nYPE8OS5Bn4rBb1ijau3gFBMhHCuM1dgQwFlg31bq9e6wS4bBI4q?=
 =?us-ascii?Q?I10DVVjk1alVHVR/fAUd17fhz2yqN0e7CSf4rKzXpqOcGX1EU8W0nV+Ut4xq?=
 =?us-ascii?Q?CPMU92YQeAEoMu14ExNWEV9IMFdHb0Iqw9w2Us4BnpL0Z9oNEFqVTzSmemWE?=
 =?us-ascii?Q?SNvAg7UQnY63gMi14+V/u1U4ZBEiqR+lKWsHZlMFl3kxGqPh5ZLcV39dTxfu?=
 =?us-ascii?Q?m1Hb9ixutLOqiIwnO0bviEfDV1ELDgF8h0uTLtaaUS0gjqd3cSLH/0SWcD19?=
 =?us-ascii?Q?0BbWMcbvNci1ge/BlnkR0b+PPDCDLq8zP4TRU0RQ9+5EEjjm1wSE5TLa2ka2?=
 =?us-ascii?Q?RdF8Nbm4nA5JyOsRt7I9tNFvFb0R+qT84vJYqTdL5Uigef0SVkaSYJPpu+kX?=
 =?us-ascii?Q?k48Ef/gWKCithnrMDxFXeOyOzxAaomi4LXWeNioogB9RmKc9Fx5nqncc0/kJ?=
 =?us-ascii?Q?Lmh46VeAIU4I4XVMCArJzXJ5KteHvF3Oa6nVcbZU1ScJ6vtHFFowDhHjeeRJ?=
 =?us-ascii?Q?ZYV94tglyXHy1R98SXxMBBJOoSk5vTuilsNCV4yUq3ZPjEidZUsvonNe8ukH?=
 =?us-ascii?Q?A2cDndL5yE6OssbZwA6sozkLBXq5+p2PyCqfUqZmFHroYMuztnbLQHMVWKbA?=
 =?us-ascii?Q?J+Wy04bAF3KCP28C8/YoP9+TzMKiIKGwDjk6suOgAyuXI/FKtRdrql3/3BIB?=
 =?us-ascii?Q?fgpEnx6xu6JdZfeHOecqvJdf+r2y5CM+R8/OwjIYNViZ2WZwd0SAxAF34jtB?=
 =?us-ascii?Q?fciMOfWjfuDQBIVqnnH5KdQdugZrdkaw7qfjexl3N/cxOIaVwKykHf0dC/Sw?=
 =?us-ascii?Q?EpbZExHGmCQI4/KMT0QxsEfUxvaZ1DEt2SZLuHuwMZNL8z0R7K2aLCu9s3dN?=
 =?us-ascii?Q?eHH3rO32sZOvEYlgkOy1zWs1/DdpkjxTW8iE/2wJztJCwgYqN3CMLLlw2jI0?=
 =?us-ascii?Q?fTxjQs1lxlE5cbLLVUXzURtZ9jpK/W4uulEZe8aIgWlyvrRn/1cO3wGaCnqa?=
 =?us-ascii?Q?0v/ycrTXaY3FXgYkLtt5QMz4JmKvJcAn9GHnk+x3X+nQyFglGsgEm3U8zz/r?=
 =?us-ascii?Q?GYQM/Ecnhun8e7Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ndTWqbwiWDMQokSBih3vRqcAWvdDPbJQxgMLjTPuwhL9Y8JgFb88VCHb/P9E?=
 =?us-ascii?Q?kyoqbW+wmA1aF/lF/SyIdl2o9hW/gVnixh5yxW/H21P4WKNH+kJ2kss+nM4M?=
 =?us-ascii?Q?1WjBNYrxdM0+05WIpWF0rsVIp9tSM5Br/HUiJZkb3ZZOjpZHdxOglvE89WG7?=
 =?us-ascii?Q?iR5j+pVvC9nDrgwyr4DzkWpx4UqcstyoaTKmZzBhynpmJToAzWNWw6Hx4nSl?=
 =?us-ascii?Q?TQrpt+GUrA1JI1WpKBSBlwr6JtTlzbBSnyonI2INmHs3VhXKAWznsbf/Zq/V?=
 =?us-ascii?Q?QrLvrJ63XNP9VLvbaHsLFFkd9T9k9T3870tc8Z6AEOIDrjmDbvzEVBmzFlqN?=
 =?us-ascii?Q?DNdwW8GfWbdbhq9w6hDlorzXdW+P6lZhPe2kMSLFRM67R2tUCGv1vCV/auwp?=
 =?us-ascii?Q?JfF3w4DwripMWEf++rCFPZCmXEl3r8yA0SozRESxZuKlWKTg3b0Gzy9WUKfp?=
 =?us-ascii?Q?aoef0pjXk9f2MbmFeCWkNydigYNNEY6kL3z1DmBg9YcCXmN4OxRjD8EHdn/8?=
 =?us-ascii?Q?TfO0BiWggE51ZUP3w7fqW3WTXqchnxzssdB+GPqJvdh9k3QMSe5U2i7vx4+p?=
 =?us-ascii?Q?7ougg2io5fKd61d3to2QCMQ9Pz8xsBv5FB2EJ5JdskFujo0yqhbw510lWKLV?=
 =?us-ascii?Q?dN/EkOrHTmyhJru7rbrWbsB7tAlIegBdqD2/0486zufeWFJd9c99ZixEXlz0?=
 =?us-ascii?Q?olXRCDkVQVBguePBeMA+By82uv1SmbhsWeHerCxlpnJOnMWSxmk5xFZbc/iX?=
 =?us-ascii?Q?O+eKRClKpICZ8EhgEYH7UqiKGw2Pyx6JAe4LMOkdTifH0fsGZTsdrN4IYFwf?=
 =?us-ascii?Q?bcxAsyxsPexGiyCJlyx5AQbPfN9ncaJyIpHIEiPJsAzNA63GLgivwpwK2bO9?=
 =?us-ascii?Q?vSgsQgh9ovjGYlmwu1ASsn8O0riMbhJHlMG3SrNheNw56qNIRgG1d105xlCf?=
 =?us-ascii?Q?p0xr7Zn0no/gY3a6kxVNnrmSmn2X5zhF42WIJRGIXTEPaR8Nejih+KeaGKPw?=
 =?us-ascii?Q?0T3LXkE0w4bNygpgrGRvPb8aW98D1Ph3yHXP6OSG3KuHvBZe/ra5eg9cSImu?=
 =?us-ascii?Q?/ucSfmDrT/8EihbZbKgX29msG3P2yfq086gECv64sD58hrISe5KC0wFfh6DB?=
 =?us-ascii?Q?pZwdKkVFvk7kdqhPKmkVYv870lqsaHIbQCtp5pIqHYeaOVLwT/vLxvu193dW?=
 =?us-ascii?Q?dAsAA5GrRuGpcLo7aUMJ0GEgG6QUx+2wqQyK1DEwMDDGaPGlzMyT5m3BkS+w?=
 =?us-ascii?Q?zXy20xbVyPQs+aoVaXJmCFhQZINpbbc6iUEi3FJ4aE+u2erWqxLvEqDjzWXf?=
 =?us-ascii?Q?dPGT3iYEIkukgMSWoSkZYltFBoHmy4ehSL+uzUhw5YP6gkD4aWOGTPUq9beo?=
 =?us-ascii?Q?tS9FKGTL06xy7h4v8NQNLh6e9typxlyPc/sIAkHlRX48uyI/W0hmW1UECLLn?=
 =?us-ascii?Q?I0vuA6OU4OthUIZLaIxVlAcm4pPw+NpKxzG/Jl7keR6g4w1UomJAG2J9701i?=
 =?us-ascii?Q?0nRTpZqfmqqpm/m4JzvrkcXm/Q1OhwDz6diiGLSMox/sHDtf02jm5g3lp8fM?=
 =?us-ascii?Q?YMh3wdQRTL6EPzDFT0ewVPHv+ag623HgbJ0pQT3q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e426c389-45df-45a6-b947-08dd76acb38a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 14:50:27.7156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r588RDkGbv0suHHpwCBNuCvl22kfdIsh9AqogBc2S5hpkOsQL6QM8phX4yt6nY4nCQLYWkwfORcClB4pMGl87Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10130

On Tue, Apr 08, 2025 at 01:53:15PM +0100, Charles Keepax wrote:
>On Tue, Apr 08, 2025 at 09:40:00AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> Checking the current driver using legacy GPIO API, the
>> nreset value is first output HIGH, then LOW, then HIGH.
>> 
>> Checking the datasheet, nreset is should be held low after power
>> on, when nreset is high, it starts to work.
>> 
>
>Does feel like it would have made more sense to request it in
>reset at the start certainly, but as you say reasonable to leave
>well enough alone.

yeah. request it in reset state and set HIGH later is better.

I could update to use this new flow.

>
>> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
>> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
>> no in-tree DTS has the device, so all should be fine.
>
>Yeah it is technically wrong, discussed more below.
>
>> -	pdata->gpio_nreset = of_get_named_gpio(np, "cirrus,gpio-nreset", 0);
>> +	pdata->gpio_nreset = devm_gpiod_get_optional(&i2c_client->dev, "cirrus,gpio-nreset",
>> +						     GPIOD_OUT_LOW);
>
>Would be nice to call out that this part is already included in
>the quirks array in of_find_gpio_rename:
>
>944004eb56dc ("gpiolib: of: add a quirk for reset line for Cirrus CS42L56")

I will update commit log to include this.

>
>Took me a while to realise this would request the right property.

My bad.

>
>> -		gpio_set_value_cansleep(cs42l56->pdata.gpio_nreset, 0);
>> -		gpio_set_value_cansleep(cs42l56->pdata.gpio_nreset, 1);
>> +		gpiod_set_value_cansleep(cs42l56->pdata.gpio_nreset, 1);
>> +		gpiod_set_value_cansleep(cs42l56->pdata.gpio_nreset, 0);
>
>I can't say I super love this change as it will mean any users
>with a DT that worked with the driver before this change will see
>things break. As far as I know the parts you are updating in
>this series do not have a lot of users, (and none in tree as you
>note) so I guess if everyone else is happy, I don't really object.

A polarity quirk could be added to gpiolib-of, if this is preferred.
Before adding quirk, I would like to see whether Linus and Bartosz agree
on this.

BTW, [1] shows the chip is discontinued. Since there is no in-tree user
for quite some time, and new users would not use end-of-life chips,
should we totally delete this driver?

[1] https://www.cirrus.com/products/cs42l56/
  

Thanks,
Peng

>
>Thanks,
>Charles
>

