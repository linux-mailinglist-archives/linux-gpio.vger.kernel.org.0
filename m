Return-Path: <linux-gpio+bounces-8885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 057D0958F48
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 22:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5F8628569F
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 20:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F9E450E2;
	Tue, 20 Aug 2024 20:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SNM8PuTH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2052.outbound.protection.outlook.com [40.107.104.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8BE49651
	for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 20:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724186750; cv=fail; b=vGAWedq7HSTHSR0HCxqXeQP/FSjRumPfOd9YMwLQncKklSBe5iMbc86KlO+Vh4mmdO95B8eFvu59IUUAeLwgp/E6pzKzkS2AyZbRRsXUDtB2tF+T9P3smz1mlKluknG1bN9dUTtZrO2GOxYz8kQ1J3aZG0ymoLXxwOVE0Dv4my8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724186750; c=relaxed/simple;
	bh=O2mX79GErz/bQjH0j8CNhVsKBhoLQ3oE0FuTiRWw+YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XYnjsu4R6QaZoj3boLVoPd265HI4Q9w94U8Qjgl/sTVUz0RGFB/notAawlZehEgsE3SGHF8BOEhxwU5p+3ylR/rhXq/LU/R1J68Q35ehPChRuN7+F/qR3HJUZ3ynG/DhiC5IneKRoOUgy52Hd+gJXpdntO8EeeQuJyXDt0BwwtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SNM8PuTH; arc=fail smtp.client-ip=40.107.104.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rR7xkKTSawFc5BHvRZkmKHEcEcLI5x15aJ7kmDByGnjuqx1UeOL6eMB/eh9+lfY3bFGpUXMqhiab8G4hiAwQ60yq2i3Zl0ulp8XPnnVSb6LXRbsv46214y1L2jErfPl/HAFrrAxgDSvVLogw6sa+rD41+F6bzrNwEzdluxM5HPBhXdZ54DIYJRHy/61ZeOICJBbQPcRemMM83rM2eICqij3UD+rw0V/NoiNaqyMPeRLk257vc+ZfSH8lGTaBEX4bQPCYj/H7NQMi+mlujdLQkzRRiv0wdIJLwPR2UDQmoMyRrhaHq9E5K4DUcbfnqS9+5TqUH3xRtWfMOOnitNoCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgNSew7W/XuWfhKLUUbEgj+5K/WlLm5NLVpS1Pw8gnc=;
 b=MkxV0WVU/Q9I+txUIMcGZlHmqgBU0kgdTdCx/7pZo9axkb+ZiqgiDelLTpi/Jrr/qfDZAwiae1zTw7zA/kBwpCqK7V/iqbDdiCpmohYOEbveYNvDNBRFcw5dcD2wnjuCwmMNdCo7NYRAy2fb8FscomawnCrPRgrP8irUqJpdAJ/qrhu5vjNjEI7r461FQv+WnaQ3ToaqG+Wfjs5jxeOK1RFfsy2JZxcWjbWmkMz/G5wCmlXoIJUE6X7YoF39GyPzFP7aTYAVfyK4E6stdOenZqv0C3wKi/pPWZKn4Xu5LZvwVLPAHBQjmAYzXOU2yXvAsl39ILHVbRx9T2NNFHw0BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgNSew7W/XuWfhKLUUbEgj+5K/WlLm5NLVpS1Pw8gnc=;
 b=SNM8PuTHypuZnDX7DWlnxQ1Fpm9qlsCRFc8oZ68fRkbo2psF1vf68/JDFOlr/lffg5ZfUQPHjI05Nh6WiPPCnOYzZ+hXjGTXoE8za5og/PPXUs6GDyj50GCQ6bOaISfhrkCTeFdQejILVLP2cz08V24JQNFWG5x8hcUCszF8jexUFQvizzpIQ+81QNVXG0e1e9YF2vwRquS3ilkSefVemGrP8sqB4Z9+DfAGysfq+87e1BuNPiaKSMqFYL7nOFx0V3lew5vO19KjTcPakETPKuwDxc9sGOsxZ/i7sdLJ6rIH6A3Y54Hf5BUnqPgYgvrLwbwdk3R/fFA8hyk8h6w7wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10985.eurprd04.prod.outlook.com (2603:10a6:102:48a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:45:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 20:45:45 +0000
Date: Tue, 20 Aug 2024 16:45:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Subject: Re: pca953x: Probing too early
Message-ID: <ZsUAc/7jtfQyNU6m@lizhi-Precision-Tower-5810>
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10985:EE_
X-MS-Office365-Filtering-Correlation-Id: f283eb98-747e-42c0-91df-08dcc1591056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MSKMVBZo5IDflstNR2JUJNrfQQTZcglGmOsIA/OE3NVlBMPPNTTJ8/XGtbgt?=
 =?us-ascii?Q?zr7tN3fgZrAm8DK1uYUPUchYzh2vP8AVDYl2nmGh9TZ3y8j/HlnyBqTSgr0Z?=
 =?us-ascii?Q?sAb+K6Xc8MSHu1FGcyc2JEeWUp0LVtxrcE5ssUZlz+jKg/oIyk1HN7gqZz8T?=
 =?us-ascii?Q?EnS+XIxjtEULQevP++sKv+fqr7+vSc/Qu/5ff4V6Ym11Es/ffwmGNpg+SrW3?=
 =?us-ascii?Q?XUmNr9E3b+Xl0tBTsBAKvb8YqKxmx5fetPox6LpoPm0hPntJGCQ0fU2OrEh+?=
 =?us-ascii?Q?1G96l8vyrh6HYglyEEo4CH1qJ5dtGmn3LLg2bvlJpa9PqpKIkzPOdiyCUxOp?=
 =?us-ascii?Q?MvBfV/Hd5GQ+L917la1/qonkYd9+OvvwdcNCrHXixlop5mRBSmiN+5+G8sUK?=
 =?us-ascii?Q?vVK4lXTKmd5OJfFZkSvJU145LLOzM7p0mo0UxFrf+IrzymdqoiRqkYxmILQQ?=
 =?us-ascii?Q?I9v4ku9Ql5HOBGmaiXPPjdl6Xkgy5k8lU51Mh9xkJPSyZddgsEmdsrOSLF3H?=
 =?us-ascii?Q?KVgCBl7S1TfZgsJ8zggNVxXlSN03bMEgPNWFb522+EpZTYut2PtsM0KT2n4V?=
 =?us-ascii?Q?8GFVAg/a+7QtCvz1Oa9wtW3IwwyQINQR+IVL5hX3T6jKpKRwdJ31dDuZBh2a?=
 =?us-ascii?Q?QQZfSKgnmECoYQDuquYv4b/Qfls3O9RJaTBbz0URYXmRYrDtGu74TeKjNhsU?=
 =?us-ascii?Q?m2pz805eGrsZUEM9il1C+PIx2F+4Ny91TrdjGdB6CB94YiuXu01WpEkC3FTq?=
 =?us-ascii?Q?xNnTxG3bLKbNnX2FG+F+epwhucnHqzvaxh+GMkoDWFgO52RoRZnfn8rGCWnJ?=
 =?us-ascii?Q?kAByNU9m+csHN61SgI4iZ0PaXcSyBV2LTZbfuty6YWx18/ezX9Zaph6+sNLQ?=
 =?us-ascii?Q?aaCPOa4GxogwWVBZYzH08EO5k4oErmtqmwQI+d5FOy73tViXDNin09PPFItU?=
 =?us-ascii?Q?ATr5+808cXGejeu+318XYQyvwDpNp5DD0Is6fO3Odmi5t1LTRTUo9lQiHVMv?=
 =?us-ascii?Q?SF8CeYTHQySYCYjownHGr5OIAHHkW/b5+x4hgPC4kgQ8Rid3o9szmhPAq7i+?=
 =?us-ascii?Q?zdHNbVpYNe9GGMQEDSX1yR2HH0fv4oHZtqN80yxCQ0IkBIDv/RhAlAgUGBjQ?=
 =?us-ascii?Q?15dkLDSIImMjwHq1RBZQrGfC83AbvTSGiWCBYZf0REcQRNITCzPiyAdqt4pK?=
 =?us-ascii?Q?l6Hk7t4XeLuqK4w1rwdgKufgGcPZ0ju+4Tl9ahjkohi58x1je7NlVTorLHzD?=
 =?us-ascii?Q?3Sysil0nAmr+pTdwipr20hpTrAxOz8DdzGAynt11Tq58E0xAz1vakqn6nkzN?=
 =?us-ascii?Q?BZPTkvEmWznaV8WtYklHKGanKFWf5OheXDoikS0hKmwA2J0IRYjNxffa8p0G?=
 =?us-ascii?Q?csAiNH4M0h0vVxQnd+qJvkgzje4MZFI3O0rXycV32QzTeLjOzw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a6LkGwCDZ6YhKxc0dQjLPTH40mZdr6g8Opj0Sge4dLKQppJTMBAmwX+Tm27e?=
 =?us-ascii?Q?NHg3czOKI+831DploByIr3Dd6QIT4AueGK1iw0T7j/uzoJMzGACYS0npStWn?=
 =?us-ascii?Q?pIgpwT2TGK1rdwwBTho+mgYrSoFmp5ngHkjMdvYMHWAe8W5o2Rzn1+hAGtMT?=
 =?us-ascii?Q?3q4c5tGwnoRM9zOopJAlD/7QuEw8PNBUSMMl98wNvQhfLlU5SwcIkdaHCmrQ?=
 =?us-ascii?Q?3dsi8FwdaCvmprev20nhGt/MVgFdESC/Oo2aEfTaRujyHVRU3Pmpn20soVc6?=
 =?us-ascii?Q?mjH+huMgbEb8fdKMpLopxQtSJc7yvLTbgGh+VbZ1Ai+dNHZhBu5zLflhW568?=
 =?us-ascii?Q?JBcr13gP8cTekBRZl7NpmpyKc8mB1FoRpi6kn67De9Xj8fhbZWVdgS1xK4p7?=
 =?us-ascii?Q?+EJhH006fxXBId8hbMnpVp9HuB0eocJX9QtaLgUHxy573AiexPEJsIcuG1W/?=
 =?us-ascii?Q?bS7tcPmx8dpnwYSmDeA73rFaGzsVcy/GgeYBnfY2QBiM+WxXKSiB+16njKVu?=
 =?us-ascii?Q?XaghfOcAgxTFclrc+VaTsEcEEaCw7DyCYu6kGK5e8sgbMi65W5NJgG65IkGd?=
 =?us-ascii?Q?zp3MPw5bIVf7/lZiO2y243nwJ6+sJIEuY7rptEYBfGhDQctNkZ8p1VJxyhqj?=
 =?us-ascii?Q?zkcxq1SOr9sV0OVdSv/alwuceeZbI94XV6DwAj1qMd+K4X+VKOexkln/xF/g?=
 =?us-ascii?Q?MAQr1372iIzrViWrFjxeZi0Ft+cehMyhJNRXgC3HvPBIghcnALwQFEixK4R9?=
 =?us-ascii?Q?tHl/Z/tleSxgCLLFDNOi/GyTsV7tlw731noJozEq9bzRN5GsvSGMRXEDSj7W?=
 =?us-ascii?Q?ee0N22+LnpKnZDR3BELSvrV1hS2beEKnec7cAbiNVeaOVjsKyCdvB00CRfDl?=
 =?us-ascii?Q?ZEITB+3dNdF630XR13xIGleaZn4S/9k35P16rH2TtQIl65e2okjm89NroZQr?=
 =?us-ascii?Q?3yy5RV8VtxQ7i35GJ8NcD9fdF/wPgI7WWK5gKGAzksRNVffmGROMP0e8Op8S?=
 =?us-ascii?Q?YDbi2aSAvybbNwcLOG2yODrmaTSpkTjc+foZV9gcBiEQHnQ2QIs0ufkYSTMs?=
 =?us-ascii?Q?31FLoDKY3UeoVpkiJbb8YTN8+ss8Ezfb91RdbHxJb92sTjcDI3uwz2aMUQds?=
 =?us-ascii?Q?WNWUG0Ivmgr+2ZHEEPNSGecYVfG/zeRoSGJbyFId8vHLlKMxDxTq6xO1HVUM?=
 =?us-ascii?Q?dv0KtLtXEMxMcwhfRLV65yiY8R6uIQgTChOYzIXNAN2q4q3pIDSwUkG1ff7Q?=
 =?us-ascii?Q?0HwYFBkGPYrnsE8n0fkTLJkqG3TlsRb7XY0qQLjBmg3koBCfSh0X+TUR4MJK?=
 =?us-ascii?Q?WRxAzmTOM2vCtsBJhZHZPXLDqIa0x3Z9gJLq7nVxd7jSe7PwGj1PXpQKkduI?=
 =?us-ascii?Q?jXGAGO+0NJBRjNQY0BGZyNA4Q4mLxuJfvt7Sbe7KPXUf/16nX0s3nWveqX2t?=
 =?us-ascii?Q?2Nrr/O8M/D7iskO6DKydtdxC/5mj7hUxZXB5wQzl70By6OjAYpvQLVS7epid?=
 =?us-ascii?Q?EeJIUy/751t/X5VGLLHL/ypzP+KIDkRkBeXAP2BS8wNBMxt8ztnBQw9QQPqr?=
 =?us-ascii?Q?aMmLdXLpu/DC2y82idEC3kIn0yo4/jJc5MYn/X+o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f283eb98-747e-42c0-91df-08dcc1591056
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:45:45.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6BhUJQKUo6DKE4/S7Wvj/mHJlINYZyw4VbXQrIuGp+MNg5zSofS77Ti1ML9ums+uJRZyxDbOFjkAto4HVVqow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10985

On Tue, Aug 20, 2024 at 05:02:28PM -0300, Fabio Estevam wrote:
> Hi,
>
> I am seeing an issue with the PCA935X driver in 6.6.41 and
> 6.11.0-rc4-next-20240820.
>
> The pca953x is getting probed before its I2C parent (i2c-2):
>
> [    1.872917] pca953x 2-0020: supply vcc not found, using dummy regulator
> [    1.889195] pca953x 2-0020: using no AI
> [    1.893260] pca953x 2-0020: failed writing register
> [    1.898258] pca953x 2-0020: probe with driver pca953x failed with error -11

what cause probe failure? I think it should be defer probe if some resource
are not ready yet.

Frank

> [    1.905575] i2c i2c-2: IMX I2C adapter registered
>
> This problem is seen on a custom imx8mp board.
> I am not able to reproduce it on an imx8mm-evk.
>
> If I select the pca953x as a module or insert a delay inside its
> probe() function, it probes successfully.
>
> The drivers/gpio/gpio-pca953x.c has the following comments:
>
> /* register after i2c postcore initcall and before
>  * subsys initcalls that may rely on these GPIOs
>  */
> subsys_initcall(pca953x_init);
>
> but it seems this is not happening.
>
> I have also tried to register it like this:
>
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1369,21 +1369,7 @@ static struct i2c_driver pca953x_driver = {
>         .remove         = pca953x_remove,
>         .id_table       = pca953x_id,
>  };
> -
> -static int __init pca953x_init(void)
> -{
> -       return i2c_add_driver(&pca953x_driver);
> -}
> -/* register after i2c postcore initcall and before
> - * subsys initcalls that may rely on these GPIOs
> - */
> -subsys_initcall(pca953x_init);
> -
> -static void __exit pca953x_exit(void)
> -{
> -       i2c_del_driver(&pca953x_driver);
> -}
> -module_exit(pca953x_exit);
> +module_i2c_driver(pca953x_driver);
> )
>
> but this did not help either.
>
> Does anyone have any suggestions on how to fix this problem when the
> pca953x driver is built-in?
>
> Thanks,
>
> Fabio Estevam

