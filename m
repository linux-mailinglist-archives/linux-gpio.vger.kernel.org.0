Return-Path: <linux-gpio+bounces-9244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C602961B4C
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 03:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2547AB22ADD
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 01:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403A218B04;
	Wed, 28 Aug 2024 01:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="Hu2pi4YD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD46BA4A;
	Wed, 28 Aug 2024 01:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724807628; cv=fail; b=Lz+haTsMwvZUql/NTWYyyiR7767BKygzm2F/Tc964bfuREi+FmtAHwAMZR6aBl4ySMCVk8I2GGnbu/OaFHOwJySc8t50rEL/kfNAZdUt1VYYlWIqixK2TzZv2n11ZpZGrkkHZ3/EIlFuBPtQc/Ie3yAbVCto3xq6ucKlUA1dhWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724807628; c=relaxed/simple;
	bh=nadNRvah1uR+Wl3FYqpa66zP2IafzFElSnE2vRCO4tg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=rPsv6Ls4jg3nbDPkrkHdfD8Bkpt+1R4f5gaIMBN5ztE+jsFiMu81dlw79zVWsOMhBooRffVCawevujdUl7WBr7h04VhLYH6Vz0SwBwI5t7RF4Pa0pJxnc64Di5emHCLOcGCVpV38levs/iPIYJuPLAxVXx8gtVv1dVceGOu2PMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=Hu2pi4YD; arc=fail smtp.client-ip=209.222.82.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46]) by mx-outbound21-206.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 28 Aug 2024 01:13:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mql1FYFDGnIUMNH6/P0NctMMaMmJgxRohdaQ8Ykt2KEkvf6pVy157JZofYL1EPsLY8mS4VvxP/6jyFLD56fuMLPzZtIOjnJPwIsbL4BpUxg7fNZMuaOO4T6t2AKpIq3h+t3fZoBvZexM7Z1ahTyLWuErxtjaVvO/pmWYbo3Cc1VQAmh3obTHdfBMgpcH5vXZDjHbkYh8sj1Hjpyhhwtta8u9W8mOgrh116YdFUsZ9DAjgQZav2R6wJYNGd7R6uonliF0ja4Cmdko1d4kWzOWzF7BLn/O8bpKgyWAUrj9kmWAXkDqeUBr6SuXiZ2SY600FddRx4SlXD9ebBK/D9SIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EObt5i50iGh4auejXy74Fkt2ypeznzZReVY2waYYP4A=;
 b=X3+aDT1Eui1QfAx+QylI1gEjdNjE1pX3bci6Zhpxh9bR1KEbhGTG8dwXnIvJ6MOijxVbMxiV1lw93bJXnYS2mmLaNRPxyWHRZoJ0lHa/vqOQMh7HmhWlPyIXCBL6shoibvKYYfYTtsRJNz5LUayVFmbw+BT02o5q7sJM3kLNNbqO8iBuLoa2+9yux1drovFE1tgUj1qwEutb8p/HnAQP0zrWrUWKPe6k63VXLiBwiNdxp4EkIIGfzMRWfc6U9zTwoTVYpqVS+Y8e/tZqgqa0tykA/9+g9MPHeCeD5dUG9QU37M8QNJ76tX5hUjbis5vXM980yVme0V8uShxv3RrgUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EObt5i50iGh4auejXy74Fkt2ypeznzZReVY2waYYP4A=;
 b=Hu2pi4YDAMPuOGnJZhEpflu2rA2fbTEhEdEfyUy0ZKr2ej5hsuFUnPO9gsWR9Lko6wfUv/vXXd+npHhSiz0uTA6T8KO2QEdqVdw+UGXZ3ijLpYc3ht4TWWs2ckWBDmPT6UuozytUQR2Dk+SD8n64K6tycV4bwAm4Ul4bOyAr9AEOw+rCNn7z8gfr7RlZKfw6nNWMuPe86UcbbVmUB7kKZo8f/3k35kgVCaNCgJKs8wSmRrcBkkUlYHg96t7Kc8yvBDNssmFQwNe26rHtc32Ag4AvkuWuNRcs1kSEjpsSfKjh786bK+PqjzSnNbT0c631iFwyCOD//eaCv+8FT+1NTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from DS0PR10MB6918.namprd10.prod.outlook.com (2603:10b6:8:136::8) by
 PH0PR10MB4696.namprd10.prod.outlook.com (2603:10b6:510:3d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.18; Wed, 28 Aug 2024 01:13:28 +0000
Received: from DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae]) by DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae%5]) with mapi id 15.20.7918.017; Wed, 28 Aug 2024
 01:13:28 +0000
Date: Wed, 28 Aug 2024 11:13:21 +1000 (AEST)
From: David Leonard <David.Leonard@digi.com>
To: Frank Li <Frank.li@nxp.com>
cc: linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, 
    Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
    Jacky Bai <ping.bai@nxp.com>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
    linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/6] pinctrl: ls1012a: Add pinctrl driver support
In-Reply-To: <Zs4W9EGSCFfxDgq9@lizhi-Precision-Tower-5810>
Message-ID: <41b62521-63ce-e1d1-065f-d84b17da2b58@digi.com>
References: <8cd0b743-4fff-e17f-9543-d2d4d7879758@digi.com> <Zs4W9EGSCFfxDgq9@lizhi-Precision-Tower-5810>
Organization: Opengear Digi
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: SY6PR01CA0012.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::17) To DS0PR10MB6918.namprd10.prod.outlook.com
 (2603:10b6:8:136::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6918:EE_|PH0PR10MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: e12664a4-a394-4c5f-d2e5-08dcc6fe9f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZLQArqTUvgqwdZtXxLlJY5IjC1mOqXin2fLz4Sy3Bbs4Bx/ulFyPnEdJyzOh?=
 =?us-ascii?Q?t0W85WixwZOp5yJKbdHcZ8ydvB3UR8E6cIVTOqoQSBakZeBeWqLPls0G8DQu?=
 =?us-ascii?Q?jMHto6+hDJfOzQ4Jh7Ky2csyGtkCwnjG0wJ7hI4KR3qRHfoXM8Ft0a/GRwwx?=
 =?us-ascii?Q?ZtizCePZaHHdMtekc0ZrhxDrhl+xE/L3EN+OKYqNKLbzQDrOumaPejxZ1kVw?=
 =?us-ascii?Q?xgDWxxFFzVXtDLXoLEIjZv9jadGuPgD0jYzksGlvF30Y8/3lZSzyHw9tp9ln?=
 =?us-ascii?Q?WY6Fzk5kWe4tERIwzxrPeBMv+oKQ/DxFZlyMBCDS76EnfrAWXS+utQ36FobK?=
 =?us-ascii?Q?LDXqsW/OeGg3Ab2n65R39BTALPJTzh/lsGiLOQ1WFoH76i/gOksVEitSjsFh?=
 =?us-ascii?Q?8pQ28+92Md9QQYx4tpb3QfvrVm3OrlwiKGsY+NUDoeWznWwPEgKitPskoIC/?=
 =?us-ascii?Q?RJ+59kn94NxF3SL1EP9IfxcDMZIFBt8fQqi9IuyKJawZLbqhIVutWDggy0zp?=
 =?us-ascii?Q?lBgEWHIG+3TpFV+bk0dbQm5ZXc5EvqwufFH90T2vC1GCVzh/LrOLQwskZcjs?=
 =?us-ascii?Q?0VTIbSF+wk14nqb9jy0JY5lLRn2CEl1vBSOmcw/81e/1ASt18Z6pI57GEu0Z?=
 =?us-ascii?Q?dktTmPsH2MLSIbpPX2Q268fUGl2LOp0yROTaU3A5T+lhjlG+0RcCFmKPfeyV?=
 =?us-ascii?Q?dvZa7rtFXS4MyrCgmsHqhCOGUuhST9I6NFoaBaUXmhhBqMmv956+kOrYoP/e?=
 =?us-ascii?Q?BKZBd0mcN9Vd4zOID+HNCoe+cZ1jn8yyzPdZvXjcD129VlcSwtgARzKRovT4?=
 =?us-ascii?Q?PyC5jCTJ6+1HeWdzB0YZvCGG5Yd+c4rkkar11QfHOctmkF89pTYAOVD3/qto?=
 =?us-ascii?Q?viUvBcpicuz/YFw1XkhAlQEFpVAKE4wiKxevi48gutRhnNo4OE1s4r5YehZ5?=
 =?us-ascii?Q?k4tn5RpRTs268d8Kxc9MkqJIJUOyTZyuRWRHSn3Pi7/xsJKwxgb8Zrkxef3p?=
 =?us-ascii?Q?parypc0YHidsUg4BAqCXDnsLIHu7mYlvCVieE0sik7eMEkXMFRxTtyxc1CzW?=
 =?us-ascii?Q?MBh68qjEFZsKhIejeEkTUHKstBcx4+DlX4PzAHhuZ+flsH3eqld+77hUT65Q?=
 =?us-ascii?Q?RaHGKrpOgBta0MWeuh3Z2MSNZf6CkLEp+9AUB0mSmh7cUaGBWukHC9vMLbSK?=
 =?us-ascii?Q?awV5EXiGDOmb5mnH5L//WwCf4mDhyxEYVpyW9ocKAtyBGr0WzmwePUoqyTTV?=
 =?us-ascii?Q?/gnbk5MGiE+zEL2/8krn4G0zAluUbBw9qGsXVKTATMfJUDxxo4FOADDLFicO?=
 =?us-ascii?Q?bI68y49Yb0EcywZHm/845QxAkDJf4qPqmR2/lvsHOipJXA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6918.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VZpO7kLP9QGZaSDnJIJxzg6CSR+BnhK/Y7o1c9FoUF+U9VtqNlIOsGtBS1AQ?=
 =?us-ascii?Q?qsIttESNNbg1L7gakRE0byB5DSm9z9+IIUyeXs1QaPm8L4aTf+DTBl8R/28V?=
 =?us-ascii?Q?0AnozgJScgmm9f8XxLk3mK2V+P0emTmAzCLBXu63WGwJQOBjEGzvsyFakxsv?=
 =?us-ascii?Q?9I3uBKUy3gO74MQkXsDW2eX7Q5Z4XZEwLI9A2lKWvx+H9mKWAk8MBAMdlBdO?=
 =?us-ascii?Q?PhreJDgb9stDph/LogAQSbUimJ0HLjnCaPRwhGi5wwDrKmaGV8gAiQLRiBN3?=
 =?us-ascii?Q?RyB+PmtimAJ8fzv5PacDSPGJN/Mynrl1oeQW7LNSOyeBabmLlEM4VZB83/pS?=
 =?us-ascii?Q?tUSGArII7hMN8nFhYwji9ZLreqFNC0WuqY31t20/qp0poKo65W07A0ZIkvlp?=
 =?us-ascii?Q?ZHtQiY8do2mjgZERYeD3q9x2S8dQMsM8XMMu5ZMkQ7twHddWoONlYfULg4Yt?=
 =?us-ascii?Q?F6p3MdF9oy4MQcfgUJFq3aAsAwcUYpS0+iD1AyBd+tBJocXzcYmbgc71TbnU?=
 =?us-ascii?Q?Rd5s2Rbv+5ks4Bd1H9bC9UWjmdmf8iojf7/gwzzrF6lvX6D+bdJthsbrtBT1?=
 =?us-ascii?Q?wymPUcsnxkVdGXI9wsgjB1TwoK9deEfpNS0DbP5IDl/v+9KkiB3oenXOZPY4?=
 =?us-ascii?Q?4HTXA6+/gBNsf7Y7TF1voOnYt2jFdKzip6HTOYVg2XJcvaHpYNOaj3nfE64t?=
 =?us-ascii?Q?Q4v2fIllTRvhxpdFhQ7ju5JbewMFRfrwC8dP+G4ofRQW15gsLuPNyOsg68uk?=
 =?us-ascii?Q?XWRCWuDVcpMH1tNXDEvy3Mc2gmoiKUzJmZVRZ1WEWRll7+vxw9yBaFlbLfiG?=
 =?us-ascii?Q?vChQGj/UG/iRq/W9QRCSeXLqoNcZU+Usv5tCAg3WB/GEVjM5/M3Ut7qYooQL?=
 =?us-ascii?Q?bxraHddOvu9vM1o4N+6KCUGmKVpsikIfow0nHUrGMJFTrMdM4pwo4+KOcd/3?=
 =?us-ascii?Q?Z6ADIRGeb1ya3NyV0pqzxq73gqhy57IcyrTY5uN74MKqZ8S54xDMzMkS2vLw?=
 =?us-ascii?Q?5AK68+EcuGRHDi3BBVz6VpF532Hnzj00dMhvpC86acJrumfdxYhM9EvCIA+w?=
 =?us-ascii?Q?WtZkProsFzpYDBcKjbwxoDkLIn72q3sq36k+zPJOknb/B7yK+wrhAVv9pmWg?=
 =?us-ascii?Q?mkgNiDN/lGi0GdkwcQZ75meLHT+SNTF8T+2M4gXOrSxtILyr107nbleAGmla?=
 =?us-ascii?Q?Na4dAVVaMIlVG8PxPXpKiKCpUq5/qZvhwwqTW7gs+vqgtCB3yqTAJsD5L+bH?=
 =?us-ascii?Q?Wf1U5ZfxrdgJmC3HeQySkI5XKghq//zmXOzPSa/+eJ7j6cnzWYkhToOJZhQl?=
 =?us-ascii?Q?9uev9y+rW1B67rlYNT3gvOcgDpUtpmaUE6uo4yV/MToffxSr0HWBkKmhus4z?=
 =?us-ascii?Q?Pq0Y8lYDSNbOpG/8461rjrLFc9Uxds8kcN/szYBDitkV5f8cafFnTmE0Yrpm?=
 =?us-ascii?Q?aAKtzCBUyBFFMGpjyZLrilr/fo/w08MvV96yLST6+n//amsX/2gm3e83GB+b?=
 =?us-ascii?Q?a61lKYMJ20I+m2TbAqO2F2klrcYrxo1dibzj0YV1dyvJLZNq8N5gAcWKC1fm?=
 =?us-ascii?Q?IlVsc0D5Ftbv6AIoT2xVCGVLghImSEav+fzzgfMyYDzxcjPU8JThQbknOAbQ?=
 =?us-ascii?Q?XapQahb2cAKuz0t4Z0pPU8qqzsRMmtx2WodIUefSVAdl?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e12664a4-a394-4c5f-d2e5-08dcc6fe9f9f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6918.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 01:13:28.3202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwCUxQzhjfOv65SzQfzxLDxejknYgI0FfAhMyZwewvCoVpefBgL7hGazOJ2m1Yu3gNYQ3NWdf3Z/MD+bYpjU1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4696
X-BESS-ID: 1724807612-105582-4629-59963-1
X-BESS-VER: 2019.1_20240827.1824
X-BESS-Apparent-Source-IP: 104.47.66.46
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVoYWJmZAVgZQ0NTMLM081cLYIi
	0p0TTR0tjE2CQpLdEsJSUtNcnYIMlCqTYWAF/ot1lBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.258643 [from 
	cloudscan23-169.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

On Tue, 27 Aug 2024, Frank Li wrote:

> On Tue, Aug 27, 2024 at 12:05:24PM +1000, David Leonard wrote:
>> Add QorIQ LS1012A pinctrl driver, allowing i2c-core to exert
>> GPIO control over the second I2C bus.
>>
>> Signed-off-by: David Leonard <David.Leonard@digi.com>
>> ---
>
> Why not use pinctrl-single ?
>
> You can ref arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
>
> It did similar thing to use GPIO recover i2c bus.
>
> Just need change dts file.

This is a great suggestion for the LS1046A and means I could
withdraw the "fsl,ls1046a-pinctrl" driver, which I'll do.

But I don't think it's suitable for use with the LS1012A.
The reason is that the the LS1012A's pinmux register PMUXCR0 is more
complicated. It has a global override bit, overriding the "backing"
RCW configuration for 3 pingroups. In addition, when overriding, the
PMUXCR0 can only supply a subset of the functions that RCW can.

/*
  * LS1012A
  *    Group: qspi_1             qspi_2      qspi_3
  *           ================== =========== =============
  *    Pin:   62    123    124   61          122    60
  *           ----- ------ ----- ----------- ------ ------
  * i2c                                      SCL    SDA    (RCW only)
  * spi       SCK   DATA0
  * spi       SCK   DATA0        DATA1
  * spi       SCK   DATA0        DATA1       DATA2  DATA3
  * gpio      GPIO4 GPIO11 GPIO5
  * gpio                         GPIO12
  * gpio                                     GPIO13 GPIO14
  * gpio_reset                               GPIO13 REQ_B  (RCW only)
  */

In particular, when PMUXCR0 is overriding RCW, it can't provide "i2c"
or "gpio_reset" functions for qspi_3. It can only provide "spi" and "gpio".

The fsl,ls1012a-pinctrl driver recognises when you are asking
for the configuration that the RCW can provide, and diables the
override.

Cheers,

David

