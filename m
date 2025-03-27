Return-Path: <linux-gpio+bounces-18068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBF5A73492
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 15:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D7BE17928A
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 14:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4797E1547C0;
	Thu, 27 Mar 2025 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N+cYbUvC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DE8216393
	for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2025 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086024; cv=fail; b=DVYTz5+CYc2EbtRpYl9qjZbke4iqNSfZpzA9RmmqLQvoDEtN+AZAlgvdgb72Q1NbwveZHAESjfNony+INQ1Ei0g1Lwtn+yn0Otby8Ya0v1b1cLhW7UHTaekQohDWuYzpfdXBMI71wcb6cPg61tIIJhswpjWHuyiFcDr7cdU6waM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086024; c=relaxed/simple;
	bh=Vf6tQ1Xj2GljCK0pAXOohgsqEiFU0fe/W17EzpMTfm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y67iz3y/jpd372Il74aHzsoZpBotsfZgKrAX+Eye5cL1PRvNtXN83trAQdUj1Yhe36Zn3qYY4r8/86+0eZfid9QHOpCKH+20F2VuH9W8tuhQcu/BQ++yDdeTvTtbV0VWKFWo952Pg3x7moBNsuz4DWzhMr9ImcHPdEqykzJrqIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N+cYbUvC; arc=fail smtp.client-ip=40.107.21.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USqz/tAXp0h9vFWdOhROzUkNKCBRkwC/Qaw98CaPYlUuK3/G13GjlBzAQUQxVFngU5rFudoPAVOs/ViuJ9daBDeCSorx3H5+Ewdx7A3rcSRnbV52FvR21XIIbZ58TioywhjhCn8NqmqYik2ZdRVRcLWClhiUkf28WDTX1nWr2xXW+HA3PAfxXviZqR6E7EDoLXgLVzfKmgWa0wNad0tt1L0cRKf/HyzGMJJQ58PHh2hWGWIOQzvPoA/DfFv9KoZUmfcetXN45BEmoznUyrh0mutAathxCK0Fe8IFlksy0hPqHaVTlxGwnw0uD+OsMHC8PcKY3iIgy25/qQXb5ff7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRHX9e8UA+m4CdCGX0q4TS4swqphP3tns2aorVyF+sI=;
 b=PL942StQkq4UVz2sKArtO3xFYlsn6oGIpsAhrqqU05pS+mKUn8PLkzljLtjI7j/UYj7eXLeq7d4ZpENbzREP9LDjGXaaQVEd386PHPWnGFqyWJWTAgOzrjAoDcd9J4iFsEaxA1D2qHG3ylqznhM7wBt6gBwSne2b8KEmJ23rj+hQFltWmPgd5kai6ry6G5bllPI7DPLFFKGc3Xqv9ZTpbnO1dTPpbDQhrIWKD4lj83rVD3h8LGP3aqPybdH5QXZINY/hujRWuNbW7vNI6XBBUvFYKJIZumJWLjDA5MRMFiJul2AJwg2zbeBhkk2kgTNdrRY9IzcCt0cjQwMNnKJoHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRHX9e8UA+m4CdCGX0q4TS4swqphP3tns2aorVyF+sI=;
 b=N+cYbUvCeplDsN8sEHyeraQYreUSKZvCi4VYZ9yeTDSMdpUeftOjO2LEaTOn1qNbDwYAm5LgY2GgSzAPKdlbvo3wTwNvIH1vw/ycWEPQX0KplIiMSKkTVwBmztzlVr9EXgjpPZlGpdoj7fYM6sc+TD5AviWI5PbhPIey1F0qaKzxHyQ+0WHFEZ7vJLleZobRK78ws786keb/SGxQtDFzdq9dMx7bzHMkuw3XR7+FVQDMnk2N2Baia67S064jmYKblAINVWmWlcnnEurlTZkLMm6TKgBXbmt9d7qVPY4UNG9bfBqy7AnVXdTWxdG527pCAUAuVHFib6enM6my7YfIuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7226.eurprd04.prod.outlook.com (2603:10a6:102:8e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:33:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 14:33:38 +0000
Date: Thu, 27 Mar 2025 10:33:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Hui Wang <hui.wang@canonical.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linus.walleij@linaro.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	gary.bisson@boundarydevices.com
Subject: Re: [PATCH] pinctrl: imx: Return NULL if no group is matched and
 found
Message-ID: <Z+VhvEsLwtq97FG9@lizhi-Precision-Tower-5810>
References: <20250327031600.99723-1-hui.wang@canonical.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327031600.99723-1-hui.wang@canonical.com>
X-ClientProxiedBy: PH8P221CA0050.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: e2302676-bbb7-46ea-5920-08dd6d3c5d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JmYMO89nHjpIZC9//13QIigsZcjpCz1FsnJRwvC2Qhu52BPYRZ15TZg7PgBb?=
 =?us-ascii?Q?w/J5ce/LzckwMbaxEKoyvE+6+aHw4+nhK9L1j5QVwzAMGcBBqsw+p+DcK+CI?=
 =?us-ascii?Q?DIBQ4p8+rN4QNPRfvqSY/+l//CS1gg+vR4QlaON967AUafZEILueTKWd/hTA?=
 =?us-ascii?Q?KmUHjB5kc97LQNBcE4fLYLcwUnqwedqtxflH2vOABtovMi24VkWA75EynRro?=
 =?us-ascii?Q?cg6+rKvg6sS65PLVhueePacvyDh4FguLqvr3IWEa3aEFZKnPPtgcAlG4M+o3?=
 =?us-ascii?Q?zzwZPz/7bqe+N0cLF170K5xPbQLkbVJ/aTI2LuUdZsIePn5ELrOl5G44asGa?=
 =?us-ascii?Q?CKvnnabXQxap4iwUGN+2Ruh4CzU3FqxsMM2/Q5gpq1d7LkYkjhWYvd3knGr1?=
 =?us-ascii?Q?4j5/xj1E59ResBAoNnIVy8BeQgUiYhjefB/9avcrzj/LeJ7Xzb0T3DZrIj9/?=
 =?us-ascii?Q?23RE6qO8Ewp4smES0KWxuklp5NVUCMGdGaPB3q2sRHQAey8yzUmT4zXBLXqz?=
 =?us-ascii?Q?qpqMdqiPIv5fs8kIt3dRNN4/f94+B7AQqxysOajzij0IbBxBQ9yN8gtNw5Va?=
 =?us-ascii?Q?FtZimC/0g3uPVjPgucRSfu+a2rOXIeuTE7dWlxHEUbZYEaHqcrUCEqz7a+ZY?=
 =?us-ascii?Q?SFfwMSy58UlcsHv74HuK6DYa6UQ1CK6wOd8X0ms5w4WrTqPiFpQGB4NS7kIx?=
 =?us-ascii?Q?PhX+7kDr6UbH6LaJFKXiR1dvORucG7aWHcEM75Rt0c0r34Dkpq67sTx1bCMY?=
 =?us-ascii?Q?czoAI3lx0v9lD+szsQT49qy00h/e7tdi3hPqTFczHgKmve8t5wZBrImuxlg0?=
 =?us-ascii?Q?/jp0XuSHeVrprZ7Em3f8SOGOImD29Fc6QNVYrgNOVcOXtlqFW9iBYW/ZMexh?=
 =?us-ascii?Q?s4ezJV73dXBKoEzpx1ghushLLVsSVBU1ReL+x6jsX5JwaSxOhGRrkgf3YXog?=
 =?us-ascii?Q?vQ2I0NnPXVHcSSUbpEziHGyFgazPKB8ifH2DGRG8qslEtXoEXrDmFxwbIWnv?=
 =?us-ascii?Q?YP28tCsHVCBKntK4nhuK34BxSpwAO2g+CQ37caP9GrMCns0ZJUgwmDcLV/5i?=
 =?us-ascii?Q?h2Wzppud4eeGzHKQYLGRdUcqbaPzsjXcTtAqYO202LUeD9i/AV8eJBByi4ag?=
 =?us-ascii?Q?PbzBOSS+gZNS+8MAv21kYN7sI+FJecmB5vYwh/M36GT3YeT9P1LfbIp6l0hx?=
 =?us-ascii?Q?0iwOJYz8XN9YZ4EUKMow0+Q7p1ouurdBQbHiJ7o/qxoBHOxH8UizNfZC7lHW?=
 =?us-ascii?Q?4OSAn0X3EX3xaClkdZSgSVR5KFNED/HgFsifiQQudQ2PuGbgUBbMXf5FIdPN?=
 =?us-ascii?Q?XBJvQ+BQT0AQrsvIShH8rPa+IEsW3thfBp1o7BQzfQ5RMxhAmyW39fHCyBJ8?=
 =?us-ascii?Q?Dsnsn8GXCmqHWrMJQWzDY3sfq1vBv+iqVZdxW84mAIHML80Ox752RU+zQveu?=
 =?us-ascii?Q?fLAO18Nqm0yGHqFrDlEQJfSWL0PBtG6Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XCvwT0/S3yfFCUMZYsIUUsHyDYsEPvpAxBzq7iBzjzc+i59Z63EGCjPMlTGY?=
 =?us-ascii?Q?pzCzltW21GOOW1IkKxj69OnGunIPVi/iWmprdhLQ6OoRUCVrhek7Vk8mzGYd?=
 =?us-ascii?Q?uShiKwHIi1MX1pvTPBL7gM2HOzFBxKma+7XWYruMlJ/U1h786fE16xWvN6+o?=
 =?us-ascii?Q?RuxmPbD6LDMJo1tZ19Lz4B2iQDebAET5ON+Zp1s7uHl9+Xt2u+D0xVzl0nat?=
 =?us-ascii?Q?enA5STU+eW5Ip5jpRfefNHhZRZ/Al6b/qIRjZibWeOrKWnNQ0dbuuJk9l+NB?=
 =?us-ascii?Q?1pBk+M6O8+FjewEGu+VjoPlGVcqSd9ZabOFJ0T3/oioXNjhZT3Cp6ItFvnsw?=
 =?us-ascii?Q?biJTb4lr+h4iUhAM1apXj6w9uenKr4oAcYTeXA94RN6V9+QIgIVldg3zVutL?=
 =?us-ascii?Q?+CWX9Nbh+Y8+mLxKs+oSb8hwuP9zbhz9nOnrxiCr2okjktzzIyDjHnZR6uKF?=
 =?us-ascii?Q?4MfTYqT2u491MJW3kFT1oORGYbGa1DR1m+eVeIrtnuJsJixn0yc2rEgALuvJ?=
 =?us-ascii?Q?Dhjtn8PFZPJdXGYpj3/R6ZvMeUNPm3TNfOmetNAwABuzxY2q6A9Mx+dO18W6?=
 =?us-ascii?Q?6uM8P1ItjZAJAEONplgIt41ck05ZKogyBtip9INvvRiK7eoB/iF/NNOIWMV0?=
 =?us-ascii?Q?xmPOqi/U7kouiHBcbb3YdbmxNTDOkTNv87phovCTbxamfD2OkBdFGaOpNn6H?=
 =?us-ascii?Q?pEmy1TeBA0AslYNT4yDrDJgT1ONgCZiRv2vjxH2p65DGW8yjL3E1tYNpEkaU?=
 =?us-ascii?Q?0Cy4zsLVJ7fK6gBJExo3RjOtcdUnIKHrDPBIHRFhrCES/4vWmof6JmD2NBqJ?=
 =?us-ascii?Q?wjb5sJAa0HCJ1JsFvZdtaMVwqeli1hC3QnT/LXDfV4egekFs2TxhKxlVojJC?=
 =?us-ascii?Q?Bawcg649sADntscwa+me1UDxUlkdVTiTe0MnyBu2exqNV39JVBRVI45Qj0Ui?=
 =?us-ascii?Q?KZ2cCbyrLn90WhZYfOQoAtCsFQq2kv1eWn3Gb0+6WJpQ6cOoP51D5NHSlLGr?=
 =?us-ascii?Q?ptmzD8Q8Mo+SetzeZMGzdJBbNOckigMD6ao8Cu+X0AhL4ZJehnCdUTbvMWxM?=
 =?us-ascii?Q?wd3+239ebwHihQe3/JY6Hx0A3og+KZnw9MQ1ajAkfJR9vEKdRaquHfJp3ZC/?=
 =?us-ascii?Q?/5bsDdgjzXZVSdft0yjM5KF0O4mTtc5MCZyRez8MQLsuJAMNzqth/loqH2Z0?=
 =?us-ascii?Q?MBEgCD+zpH0cn4torG5C46o19zoN/2R9OuwhKioJ4oYnFHknCYBDB23OJwBv?=
 =?us-ascii?Q?hkwwi3CD2+QVgpOktdW7gJeH+dPWqtNFTG7ixLPmyXTrZ9AZ7ohH5wIGCieY?=
 =?us-ascii?Q?ZAJYiDJmNMLUAQBO3r//BgX8cmaJH9ryTMFAiQOEdAAp9KB9690JKiRey0UW?=
 =?us-ascii?Q?z52jft8qQt7uima4hmi+EjMt6B79nzFwUol8Xvqz55ifTsa7urh+v4x+ZQP8?=
 =?us-ascii?Q?W9g4+22GJoKZArc3XwMAh+ii9B9Zvk32ML0nQYqXVKvm3k3SwiFRTjO/+jCX?=
 =?us-ascii?Q?mhuDF6J1i0lfzpGHutYryG6TU+Oj4cnos0KgYTrK7nAP09yH/98XtdtCMzEV?=
 =?us-ascii?Q?JudElUPUMUdPJpLkCF0tIw74nFxK5Qnv8U+VA2n1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2302676-bbb7-46ea-5920-08dd6d3c5d1d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:33:38.6936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lG50hIx/al28T8Na4YFgVaDxda2F4CpWfo8H63KpRPrZ4YRENnOJA1/zk31hXYRZHfuNBhItC9txNMVKVM0wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7226

On Thu, Mar 27, 2025 at 11:16:00AM +0800, Hui Wang wrote:
> Currently if no group is matched and found, this function will return
> the last grp to the caller, this is not expected, it is supposed to
> return NULL in this case.
>
> Fixes: e566fc11ea76 ("pinctrl: imx: use generic pinctrl helpers for managing groups")
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/pinctrl/freescale/pinctrl-imx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 842a1e6cbfc4..18de31328540 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -37,16 +37,16 @@ static inline const struct group_desc *imx_pinctrl_find_group_by_name(
>  				struct pinctrl_dev *pctldev,
>  				const char *name)
>  {
> -	const struct group_desc *grp = NULL;
> +	const struct group_desc *grp;
>  	int i;
>
>  	for (i = 0; i < pctldev->num_groups; i++) {
>  		grp = pinctrl_generic_get_group(pctldev, i);
>  		if (grp && !strcmp(grp->grp.name, name))
> -			break;
> +			return grp;
>  	}
>
> -	return grp;
> +	return NULL;
>  }
>
>  static void imx_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
> --
> 2.34.1
>

