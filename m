Return-Path: <linux-gpio+bounces-9436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B3D965C32
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 10:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD93F284BC8
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 08:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B812616DC34;
	Fri, 30 Aug 2024 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="upDV8wVE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2068.outbound.protection.outlook.com [40.92.41.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E518B225DA;
	Fri, 30 Aug 2024 08:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725008265; cv=fail; b=DzAu1Fbv9SQoACrAGCIZT6ZOEfybnLrcFKOac2QGM7zChtmez+kgpw/AEYBIIlLTjGnx5uuC0B5vquQNvGk9W2i/SFdbWOgH569ip8GzK0WZ1oNmCBuiriQXz2c6GtD+G0E/tpkGF7HIlfGssBnTaPaik16GBVsYkOdOI3QmKcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725008265; c=relaxed/simple;
	bh=isdwj6+csFLpEbbGWlvyBz4gCbJ0lLHlHzxch5s/MUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N9tCgui6zvRjZt9/YEmhVJ67nyze8O3LnNhPgLZ8FJdqU8vHESPeXlMUpjEWCGzk4f0L3A8ptIzCklP5AqyzE3R9cisWMBpIKlNFve2fzjQaDIMGg06UKMHq/RWp0YxWi9mXZdlkXFCZ47bjWZacZJB+LtqsNJeErUBXKuM8D6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=upDV8wVE; arc=fail smtp.client-ip=40.92.41.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruIGZol79q0Jd+y2StZVerQHeKa6gArF+inCfgoIA8p0XyOtTkBosGoAlvO3HTXwmN5XiF2J/Ep5T9OsnvlY4XbuQt27il3Vzjilg+2kJPvLvZBXKJkrXXZIwSo2/D3iJfdOvh0cVVI7WrdBZubFCXydFLTkzUSotY2yceqAhcs9/w/wNfStH1VQv+OuYyatWVXXQ0DLiVqyD9MSXuCPDPl6/ZQpqZYDqBq6gBJK24NJPFPi5qpRar+W+H7uK5YJmhyIgK1LDjc3uToxtitJT38CMEKbFFYgE9Z0F7xEyuY3d7DlUH1nAXvAS7fGbUksS5fcIOJdFeEAHE3ATFYa5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5W3SMicb/p7f8Nd8T6O1ikpnEqvpvyS7P5X49TsnYM=;
 b=nTsw39xhiFutt2Z4WMocQSisJPtv5EIIxjzjXvIQP4bo4k1zIJ+tdfOH62eieqo5jMbCoX4a94eaNbgrdPCjzKVBj5jA8w7uQNXYgJvY3pSuFTt6JOmoie7cX+RZ3I6MkgwENwiO03/6i5i0QEpRNqaVVxh8EzCVKjv/OE1orlP91qXzMovH3FmdHKu/FO6R1NS0gZgt56gyIpx1IJ0ydHdJWWlf/MW7EJUIXFEeOfATlZvT7zR3br9L+ZVE7BDVF+KkfoysnKJLG/gOMRd/eJ+C1oOjn4hqdfDLtqmN5Aqfh9ShZjBlxlRL64SgPY7X/9g+mg+CZa9wk65ggpJmTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5W3SMicb/p7f8Nd8T6O1ikpnEqvpvyS7P5X49TsnYM=;
 b=upDV8wVEayTs/4mMrLeMsu6yml+dsw/TYiz8+VkP2WwYqFx4XNbxKUJwdIe7mVrDZvc8TbO/nRytRxtgrqW1CVCyNUdmsDITHrMX1FZP3ETqnMfTTDZ39JQc7fiK28pQXkb6Z7xs/CpIVj25uXVCEbT9rjJkTfNtBTX/JAmcI3Ms40/3MCxMjklz+UhiXv7hlWBRmh7V3HrHMTwXVf8oFRqezZqviQf760C4f7Qt7rVT/EtzX3kjhobV1I4LSok+LFtjEPqORUXHfQsGhoICXRBJjgvvsi/DkOtTd1fMT7wtG0BFgxxLYcABHZi+A4MR54jRh+EvDkhoiAWbUEjjcQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH3PR20MB7520.namprd20.prod.outlook.com (2603:10b6:610:1e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 08:57:42 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Fri, 30 Aug 2024
 08:57:42 +0000
Date: Fri, 30 Aug 2024 16:56:39 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] pinctrl: sophgo: cv18xx: fix missed __iomem type
 identifier
Message-ID:
 <IA1PR20MB495362BA72EADB07698E487EBB972@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495307A3CFAFD79188CED3B9BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495307A3CFAFD79188CED3B9BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [czUPhW4wo6HXwJO9/5klGWMtv2KqO+B29aS+VlccgOM=]
X-ClientProxiedBy: TYCP301CA0076.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::10) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <wsu44tqstx4zakxfatfmaztadwv4zp6l7wnk2czt3fkkzagoyp@bjnxu7lofaap>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH3PR20MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce04bfd-932d-4e0a-d538-08dcc8d1ce79
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|19110799003|461199028|5072599009|6090799003|15080799006|1602099012|4302099013|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	Rtm9+Y/vw+AQn4bZ2ivWJRDXHLIUdGbLK2th4ktJG9YjDlZ2tO8Fndr6WogJoBc5LMOcgS+jjHiseoMM/58roafif6xVx5RWTySggK4VpzMv5o0dDkSaMq0WT61lN6FzgWS9mspK3ThnHO7TRvV6pSU2PNTSqZpHrCBfHr2p/8cucC1IaRBCWHrTsud+ZJ+vXHczVaP6u3t8p9akLqplnmUyWzKbL9c6rb/+81/n6lAflUknhcs2z6uh90LDxB9bL9K1xmJhlYWfbeMQqq8+9DoG0UzKSrm3oLU2wc6gH8Po54+NLzsLcN3g4ziwkjFqnRjAxio6v0cT2NFVkePDoHO0eDtfHeLDuA1NgJkfRk3kPl1CR3wg7tpeL6Y2laOjaLwg8JYNE3/Uv1yeA7CKn2xBPiVuWHSPPw5J3jECRJT6QHSHKs0vEP9m+cMS5FZ/q/X6D0RGRDVt4djRAoowBdAYbLyAYx+PTznBFuHSv9Sd5zut5SRPTu1t7HNWWW+UhIkQRu91gCTBXOw8J7iqlKfh2rTiHvXNxa6Nov5ZU8tVvgj7qLSZcF2qyL1edD8OAhtQy2LofBTmHmot0uG+6BfT6E/Yf0YJNJbAG/NmI47+InDSo2OmChBUay//9uVrRyTNE249x1z/zyrs25bbElf1gnAw4myJtIMqzT69irQwTrPO89bAnh10DPOA9r4G1h9UnL2iI3gkyGZBn4Mb28ZdyVtxnTPH4ayknjQ0ZhcYYWwVoWmblqD8V2roCZnkpq7z+wyjQ8sSYtWvHbQwN4rQ0Odws6LEbs6GOtalDMSjentzp7rVaxShOvunbLhRzdADB0fP2N4/h9+yYfSN0j4tMDw6OSwtauxYdtJCJjQMNedxNYh1PB++gR2GfDZVjsHYwaS/nvfKx7Mbwe2Jz5ij2MtQm4YtMkqiC8aKB5g=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BFAQbx6PeLd91l5YZIgkEWqJ+5NRkFj54doSkyxvsdPjiUGD8nJUf+cZiAwu?=
 =?us-ascii?Q?SSP+2tN+8L90Z4i1qputSWkZThxwTOS+5RU72bmr2yyMP/qzbhIGXOBXGrwP?=
 =?us-ascii?Q?QExNDcDZ7GITEizgOX0USVJTkHHiqV5ZU/mcaEAznG8rjXYmbYDIuvjTNKea?=
 =?us-ascii?Q?7PVH7rIFBBl84VXUYCOMKZ6HYCA6uhJNl6+lKNFxYaY4rn5Ajf/LvddJCV1P?=
 =?us-ascii?Q?WEZ51bj3pq7Jg6qpMT4dwj9oyhFHnhYYCDX1FouHpPYxAeGrTFEbvpqTNT5V?=
 =?us-ascii?Q?tBNzh7h/uhnYb2FWzvPpl0YnEO/LNpF4d/NdherNppz5mnJlmCDeFX8CIG8E?=
 =?us-ascii?Q?XQMwv82WZV8lsR3g3L+70uvWgHlOVyZo4OK6+03ERPOYMsyB5GjZKv6rPLUZ?=
 =?us-ascii?Q?pTnndNthAF+rCRCy5ur3DqZQn4gYqU42jC7gxoQyMdv8231YWzXDgSXutBdJ?=
 =?us-ascii?Q?VKHcZhptE3QFVLcffifWt6l6oFsb783hquRHyrbN9dJe6gWFM6Po3q5G6I+g?=
 =?us-ascii?Q?e09Jeo9bJ1D3PmdFZWZMrlnqPL3k8kbcJr8Xdj8ycb+LV1EWkfDpffwu6UMg?=
 =?us-ascii?Q?YcSCAS0n/PwX8KJWu4avai/yb6h/bb9frGe7UgKmg4WNOESwX09Li1UVtrmR?=
 =?us-ascii?Q?xqtNZwlYDK71ms7CXUATVYG11F6uJs+KrxiqX3y9AI7UY5HlTOO+fdUBM7l/?=
 =?us-ascii?Q?DYnOTUKzbOQoJyM3IgNCPAuKWerOMvC5YQFtqkj/+yC28NlSk3FImWyhwLsV?=
 =?us-ascii?Q?hDTMxRFcDKWNuAE6FQ0u7G5+fbkMn/T2QBCx8dzIQZCgbyLLFmZqyROUjLdY?=
 =?us-ascii?Q?pAPQ/MUvZs8DVWJQUDBaTuyvxcdbGN6jVUoesDqQFCSJcsMDosysjcq1vcf0?=
 =?us-ascii?Q?xhWfrBk/rC5jSmg6Z8Ju6aI5GaCeMBV8+zoJ8XqpKl6Vqp8+QFU34Xey2cdu?=
 =?us-ascii?Q?pqse/AZ7RGibC0hUNZXBVvOEzmXPtc86A0GiwsA4zsLtc+IDu4yhF9US2GPS?=
 =?us-ascii?Q?aHeM792f4FAv6G/4/Lv93jf65z3BRCYk0lY2GfPLClViYFFmp+G49u/f3i2p?=
 =?us-ascii?Q?B0aJOgD7CYwUtxdf8493IR732JGa+K/IHIQH0K94c9fwCas+kgNIDjkNCk1q?=
 =?us-ascii?Q?S+T9QFFyN/ItbRphYngsi/lqrnm05VeGJaKqTE8RUS+Ra2xjJn/6+PREr3B8?=
 =?us-ascii?Q?IBbDa3XodUMXH/zZyYXafM3ZdM0ac5th3iw7nQctVt9PA3zldv3LWVQ8UBjD?=
 =?us-ascii?Q?kCV0oe4HfgEktXnDArpQ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce04bfd-932d-4e0a-d538-08dcc8d1ce79
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 08:57:42.0588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR20MB7520

On Fri, Aug 30, 2024 at 04:46:16PM GMT, Inochi Amaoto wrote:
> As the variable reg in "cv1800_pctrl_dbg_show" misses a "__iomem"
> type identifier, a warning will be issued by the compiler. Add
> this identifier to avoid this warning.
> 
> Fixes: a29d8e93e710e ("pinctrl: sophgo: add support for CV1800B SoC")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408271555.kpOmi9I8-lkp@intel.com/
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
> index e63cfcc37377..d18fc5aa84f7 100644
> --- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
> +++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
> @@ -125,7 +125,7 @@ static void cv1800_pctrl_dbg_show(struct pinctrl_dev *pctldev,
>  	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
>  	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
>  	u32 value;
> -	void *reg;
> +	void __iomem *reg;
>  
>  	if (pin->pin >> PIN_BGA_ID_OFFSET)
>  		seq_printf(seq, "pos: %c%u ",
> -- 
> 2.46.0
> 

Ignore this noise and use v2. I use a wrong format for the fixes.

