Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D94B47E007
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 08:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239386AbhLWH4l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 02:56:41 -0500
Received: from mail-eopbgr60082.outbound.protection.outlook.com ([40.107.6.82]:58427
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239426AbhLWH4k (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Dec 2021 02:56:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhG//fwAUfGFUCFVm2va6IaXBhomR+NuZusT3kC4RbNsEydRT2najnltwf7rJx4aYFYfjnkepE5gOnCrZjzwW0VKpzPCL3+J3oVD1wfjhrGRNSe0q7i9UTEJssY0KhjRUQ0Mp6eoIMvim21q8+yuwUlW4+rSmgf3MGCFhZZCGiKmNu59CK3jnZEBtqpi/Mdbra49vC2J/9I9yfYCiK4n5AWM+yuemN6R6yR1l3hqdvWom3zyxH0yJkttrZWzwzrGYtRmqobxy0GBLmriNFWFKE7Y0cm2WPanwAEDqwLpUhVGg26qSs43d6YvDf9ueP0j6D6nAcrU/oqSNm2VZ7q+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjifpIeoveC9m/B5Nb0qeliGt9c7/3RcZZhIZEefjmM=;
 b=IfD1C0spdYCLC8JDblZSFbXPOGdpXS9gv5Amuy2RGDoGjbjns7kQWG1qFndSm3l+a5rvTWsLeR1zJ8EFZeyov8vCYud1p8vKctDXa5lmV5f2O3s7y3iVWBFsRc/KF53wJofTxX9WXKwSjl8+ZdM5vWekJ8LsFy0JG/k5S53poVdsNuD7ua5+4sUaBJ74LKJDypZY0cWUVFqiKIv19N2YEks2AmJdnjR7+vhQbc88arLP8iS1BffJSB2KB24hMUwegnvG/g+G/xA6O0X6OcYLzjJojFxt1ZYBh6XHH92CmgoPNPHdRlLDuy+8DINjoOKJDgZRLsXcwciqimAV71najg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjifpIeoveC9m/B5Nb0qeliGt9c7/3RcZZhIZEefjmM=;
 b=HfiNouiM8qbI8e5axE/dO1L5tNjV5Bl5GQwBfR6MLNXfzSLQNHxaW3Fw/QpjPCih/kJ/VOjmftMHw63Q+LNdrlyfFXCzikHOlHQCBekdbmQawXocuxb3f7cmpxABtbxv0FuPShy8GqYvYPJWzBC6nc4jI/d4nVtZRNBTvSP/FMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR0402MB2799.eurprd04.prod.outlook.com (2603:10a6:800:b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 07:56:38 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::4c4c:f2b2:addb:841]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::4c4c:f2b2:addb:841%6]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 07:56:38 +0000
Date:   Thu, 23 Dec 2021 09:56:36 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] pinctrl: imx: fix allocation result check
Message-ID: <YcQrtObo2+9Ym9DU@ryzen>
References: <20211222212807.27122-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211222212807.27122-1-zajec5@gmail.com>
X-ClientProxiedBy: VI1PR0901CA0098.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::24) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35729a28-5b24-455d-bf2a-08d9c5e9bf84
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2799:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2799A412B9CD974353DF04CFF67E9@VI1PR0402MB2799.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5XriL3UlezaqvKyybmc6+c6Nnnglz7J22oW3rAXtW4VUfTkZCCdEPwDCcmplhi7wWQS54SODpJ2sxV/rZnQ1WEv5CIONjdQ64VIw8U+sSKDSnjnOg5iWzW3acVs32xDX0wKRXnFogiXI2V/udV607klMnCVIEP/UEWAV6tVPPXFgfKot2cAP0lJvEc2SVgGa7fuxackXd+nvmyxWGt6Olg177dAD60rul48I02wj+zzVhtAW7YF+aGzzAwIru9JVBENtYPqpBSUus8rtTto3CcKvhD7+rl6JQAxCc4lCiQFNfxsETLfs2Us0p1l0GkDQTXxSxQO7AOedhJzen15C2Sp2vLEOlfDJYFWAQhM00ULBX1qOiYBLGv5i5aOy+SEkMbWtlzXmHB+gAtk1cyoXFTM9/XyoyXlB+zwYe3pOHoGaVUe+j/vDYnoKCz/QakpcsdDwEgTUpNis3/dkJpzVB+r9o9YkERmQAnCxSul1gs5VMI8YWAiKG7AT8++x7Fp3u5rfGKd+VdzkndyImUW+Xp/cs0xYQn9hONjy0D65aWmcRnazf//PmPsqzUfhJR7JaCOeTo0J9JLSllRG0Z/G6Jn201MaXC/wVuRZjl7za4MFCdZOqmsXLgtEdYIihIzvcXmUsOWorIiHc17aRX+Ckr1bbtwHIqyI/FUmh6vIDR5RdYJE6PwtVGVUjc9b/joM6efaeauZGxHKQRO6LsR0wptPJdFmwNNY1tFwBoiSACo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66476007)(66556008)(33716001)(5660300002)(186003)(86362001)(6916009)(54906003)(4326008)(66946007)(26005)(8936002)(316002)(2906002)(9686003)(6506007)(53546011)(7416002)(38100700002)(83380400001)(8676002)(6512007)(38350700002)(6486002)(508600001)(66574015)(44832011)(52116002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVhZczU3Zkt0YnhJblR6U3ErQnp6T1JnNml6dTRjdEFKOGFxd1EzcnRzSDRp?=
 =?utf-8?B?QXF0RFdYTngyMnpXazlaTEh5Yk5rUE5haFFWNkZYRnNuU0RoTVlXNTRtLzNs?=
 =?utf-8?B?bHZ3K2I3Q2N4Q0lpeWFBOTY2NnJlSVZPcjQwRmcwTTVzVnJ0TGV0WXBsV2lG?=
 =?utf-8?B?R3YrbHZnNmVKbkRQdGRyWUQra0VUalAyMkZONWlpVEpMZ3lHRkVBZVFLSW04?=
 =?utf-8?B?b0FsTWJDV0Y0cnpiaWczQWZZNnp4QVc0bWxpeGZWZnRVbklBWTRsdTBIQitr?=
 =?utf-8?B?Yzh4dFg0b0llS2dsbkllZFdkU255MDZzU0VFLzIyRm4wbnQrWjNxa3c4Y3NU?=
 =?utf-8?B?bjJoRHBrVU9MVHcrV29IbEhNY2hIWjMwaVNyeWN6NEZkS2c3MnV0K0R1d3Rw?=
 =?utf-8?B?Y0pzQ2NsUUxCSUpJaWVtZWZDc1RyOTRFVE1XVFdrbC9pbUl1UEMzMEhmM3Zp?=
 =?utf-8?B?RzE2dXVVcjBDNWQ5Q20vVkthTXlvemV3dmdtanJtNktncXpTVE5GRll3L3p5?=
 =?utf-8?B?dUVnNVdpWkJrSjlmSGRGdmZJeWJZRkRkSE5nb09YVUdLVDBwblRiY2JzRU12?=
 =?utf-8?B?V3g5Sm9yT1FIY2pNdDkvZjZ0QzU2bWlQb1hvOTB0U2l5aHNCZlA3L1E3ZHZh?=
 =?utf-8?B?Uk1oMDNMK2FDZHprMXNlRmJMQXFMY29LNVFUZHlXd3lWZnBpcDRQZGFaZzN4?=
 =?utf-8?B?dDhhYVZ5d2kzQjRJZ1NrRHN1b2x5bWdoN084Smh5NVZyYVRvUFNUNkxUM29C?=
 =?utf-8?B?Z2JhZnMzQStzNFBLK2ZNUDZMcnZsbG02bTR5S1dkUlE2MFptUTRkVFNGelh0?=
 =?utf-8?B?cFAvUDB2elNHOW55dkJXczBDWWNVSW5pNTRZcmFaVE5Ub1p6ZThuUTEyWW5l?=
 =?utf-8?B?eFk5b2xHblJjMVdrbDlCclFJSDhjU1YrQXdOd0RNL0c4WlhoT2pjUC9ScGJs?=
 =?utf-8?B?U1N0UGF4em85RHhMOEVDYTdtcHBnR1pvUXFQYzZNNzNzYjBseWVwd0dpaWpO?=
 =?utf-8?B?bG82SG16VDJzMHhoTGNLVytZOStVUFZxMUFiTXNNbnUvRU9UZlg2Q3hiQjU0?=
 =?utf-8?B?U25WMzlwWHBkNUhZdDA3QUNsWWpIcEduMjZGM1htemFpV1k3Q2l1UGl1WW90?=
 =?utf-8?B?ZWxDNHYvZ1VEQ0xKamcvZFhxOU12WGsrbUxxb09TbjhGVkJEREhWYUZoNXRn?=
 =?utf-8?B?dzg5K20zWk5kaFBGSUUzWTNyYzNxMDMvMnFGVzViSGNoMGJSRzA2NWQ5OEoz?=
 =?utf-8?B?SzY5Y2R6d2lZR1R6S0RMdk54OTRRNkhBUGc1aWhGTHRnRTdSV29CMzFaR1Er?=
 =?utf-8?B?RzBhcHA5ekVpNnFZQXdFUVJRa2ZTNWNhRnBBajlDYTl0WEgvQjVMQThsUENL?=
 =?utf-8?B?ZGVhYnZZdWh5NFJ2RnVhNlRHWGg1dkwvOXRQNXpUUkRINXZuL3N2aVVuNmlk?=
 =?utf-8?B?OVY4SGRmN0pPckF1ZlJHUEZ4elNjWEkveG1LemFSN2pQQ0djU2xwRkZTdVpp?=
 =?utf-8?B?NUdlckJHSXJ0NDNVaUpNMTVZQkU4RFl3bDZMY1FRejk5L0E1empuY0tWUHlN?=
 =?utf-8?B?UDdhN1NLOTBXUlJBWE9KVXovc3lYZC9UMW05Z0lKZDNlWmNSTTY2U1UwUGJ4?=
 =?utf-8?B?eVFVc1Ivc1dNUExic2lJblYvbFZFUVMzZ2NnclFPRmJrWTFOejZtYUt1bklm?=
 =?utf-8?B?ZW9CQndrbHN5a3JILzkwS3FwMStlT3dWbTUvMld6MnlCSko3eFowbld5Yzhl?=
 =?utf-8?B?bTNCa3J6a0cvaFMvdis4TnpnejZRQytvdWJ3Z1lPdTErTTBwdlp1M3ZTcDNH?=
 =?utf-8?B?L0s4ZVJwVWQ1SlhKVm4vOERmcno4Zlg1dkRLT1hpOTE4OGFGTG16ZVNvbkFk?=
 =?utf-8?B?NWRqZmhMMDBPRDdLcGV1dHAxYXNQT1lDa0w0bThBRGJNdDZ0QTdSM2FkZ28x?=
 =?utf-8?B?ZDVDVVFBbXRmNUFUVHBCY1VvNTlWOG9uNm9WeVp4ajVzUzd4WTFKbThXOEI4?=
 =?utf-8?B?V3ZBWFF0eC9qSDNNem9KdWs5SFJuMDBUZitRbDZHMndLQnF6MWYxSkNSNU1Y?=
 =?utf-8?B?bHlWWUpHS3F6Ym8vNzNPTHJtcFA3WE1UMThoeENPQS9wVkFadG85eFVRdFhS?=
 =?utf-8?B?bExBZTNpaXV2R0UwWWFFb2ZITnJaWG9rbVVKU1pya1B5NU9YWFM2MnJjWC9Q?=
 =?utf-8?Q?8cHI5dgC7CqLcTXtDDhARwo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35729a28-5b24-455d-bf2a-08d9c5e9bf84
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 07:56:38.2774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kle+5SoPLavTEXLpO4fP7ufb2dK9deAkLzB7NBLqC/BPMKUKAgLVp1E8ys2AYghfa6Q4IPZU+TCwoZgO9sUPuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2799
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21-12-22 22:28:07, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Fix code to check correct variable value.
> 
> Reported-by: Abel Vesa <abel.vesa@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> Fixes: 02f117134952 ("pinctrl: imx: prepare for making "group_names" in "function_desc" const")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> Linus: I'm not sure if you can rebase your tree. Treat it as separated
> patch or fixup. Depending on how to manage your repository.
> ---
>  drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 47b2ab1a14d0..16bc1bfc03e4 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -667,7 +667,7 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
>  
>  	group_names = devm_kcalloc(ipctl->dev, func->num_group_names,
>  				   sizeof(char *), GFP_KERNEL);
> -	if (!func->group_names)
> +	if (!group_names)
>  		return -ENOMEM;
>  	for_each_child_of_node(np, child)
>  		group_names[i] = child->name;
> -- 
> 2.31.1
>
