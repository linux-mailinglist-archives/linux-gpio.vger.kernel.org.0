Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A554047D844
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 21:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhLVUYq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 15:24:46 -0500
Received: from mail-eopbgr00057.outbound.protection.outlook.com ([40.107.0.57]:40932
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229503AbhLVUYp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Dec 2021 15:24:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5eiz/Jwdx2rn4Hv7ENwwcOUqW/fAcQvW+YNryogPTXQ6CzSPRBXlbrnLonRL9IConmExLrmlwxoqrPJYRI7CEWfRJmUGcio4mPqFuOW4zoe6vdWKkUx7i3Z758iLe6sp8frC7dpVpr+jtrytg+tMzwDwehuBRJoyZefqSwlHb1uGuRjDzPWxaOyNCcRCum7mBGFj63ss7ERmVZp2MzzCdNIslL4AQKwl18GLixSMlhPjwQO9nJDhf9jq8wWcSzmqUaCae+KFAZ+RUq27BfiYL2xJfIeLOdbBB37mbgq0/FZ1P5K/vRAhIBC+p2yPDC1gYX6xRvoJaNvM7ZuDed0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5xWlSS+S5HPXXKIHYK7MabYSMPiV2KpK1ZAESoywSA=;
 b=fBAoD1o9InQxBQWOVP7UqF2jY4F6Ac1/tLvxmBNkVOzvQkskmKwgLH/9S/lYWSykLoOxqVZ8MAJxaUmuXTOho/zJdsrHMRo+mELtTwTcq89Y6u5wGXMguELV5VaVYutqG198O56rTnaIUeK4fQX9Mg6TqHBLo5e9Ml1l/I3Bw0AWLYbsNyxZ8E1qoCTVSCjopOegbveeEw5E2wWr1N4X+6MNBYD3G36D1KcId8GQyRL6jDQzEK8wyTN1SNM+UQzilKs0k1N6Mi7cLFCvfvCkOe4770jNlfsyiieXSZ3yqFl/8+79Pb6EBhHNXXt/GZeNI/lYNEzj6K/sOnfX3NQS1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5xWlSS+S5HPXXKIHYK7MabYSMPiV2KpK1ZAESoywSA=;
 b=dewK99Eu/g3y5LkYRJUOfGDoGNpOp1BA6fY7yYzQ7IiAt2tE0iZoehWeUuI2vPHXkFfs5Aw1eBf978fVqag3+TBKG9XTAUs7mhbXmjz7n920YjatLjMMLnosfzWz4c9TkXFwBsPMbqlqFGAtl+2tVxFRjlx+vj2pXJ3uiAVkoD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4679.eurprd04.prod.outlook.com (2603:10a6:20b:15::32)
 by AM6PR04MB6520.eurprd04.prod.outlook.com (2603:10a6:20b:f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.19; Wed, 22 Dec
 2021 20:24:43 +0000
Received: from AM6PR04MB4679.eurprd04.prod.outlook.com
 ([fe80::55e1:40ce:7346:5596]) by AM6PR04MB4679.eurprd04.prod.outlook.com
 ([fe80::55e1:40ce:7346:5596%5]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 20:24:43 +0000
Date:   Wed, 22 Dec 2021 22:24:41 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/4] pinctrl: imx: prepare for making "group_names" in
 "function_desc" const
Message-ID: <YcOJieHGeA7p+NIF@ryzen>
References: <20211216162206.8027-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211216162206.8027-1-zajec5@gmail.com>
X-ClientProxiedBy: AM5PR0201CA0009.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::19) To AM6PR04MB4679.eurprd04.prod.outlook.com
 (2603:10a6:20b:15::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3d3ac32-0acc-4de7-b3f8-08d9c589169c
X-MS-TrafficTypeDiagnostic: AM6PR04MB6520:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB6520DF34CC0131E7A6E4FAFFF67D9@AM6PR04MB6520.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YVehBZIHOtCrDfL7lrmcOrFZ1OXfRmvhBTjdGaOhnwO+p3V1s3g6K5PecPm0/kh2nrReavnn1EJqhTKgLbI5E2oc+3kO6UOstMkd+XIbwepJuCWIiLD5wPmiE3zAj/2LbsKw7t7q5cPp7+E2fBvtk7o9C7lGl+NrmHEqvwt2JYv7dGC6oU917VCN25JcAdgXIWf/o6478IAakNG+Kw6hpczESkahmIVNwXjTriYzL7leyJMWN+FB81QoPZncwQVm9dTxhfRaIp1SqA8Wp1yruFJC/K3yk0uUoiNKDjQOmn00R5v3KvQvEaf1uFKQg820SVtPEqwEN3tZheGrGDCSLkLND3TLTZ8ouBPZ3fR3B8kQ4MDihR1pba0GpVxrpLpvd/1CfRVS/ivydR51M82v8b9KFsY8oRBBJMdaXge1KW013bUQ/sH+SIsX75TDrHMXkkZ1q/aRun9zCTEyLkZXH8dqevgeQAOUbc4/sJtbv38x50miypm986BcoX0L4X2eXkus9CGOT2FQEHyA9HJsL928tWFjPi546IOIw9mb12BxpNC9kpows9aHIIM0O4hyHuEbvAnWfRwnUX/ZRPPPNI/Q+/9skUR8UeTrwObZn6Aeoc/f54kkfym/wXK5MIneXiE7cp+T4nl1OebhGnRDoPnhrNH4t48oSImkhOCXI/07FQRObpwRXyHiSTAmPDWZitz6wxM5NoFQW7ESbXvQOigXgnt+EEpZXkr3ny5L0Ws=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4679.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(316002)(33716001)(66946007)(38350700002)(6506007)(8936002)(7416002)(186003)(52116002)(2906002)(66556008)(53546011)(66476007)(6486002)(508600001)(4326008)(86362001)(83380400001)(26005)(44832011)(9686003)(6512007)(110136005)(5660300002)(38100700002)(8676002)(54906003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWx5Qy82Q0NKNzNzaXoxK3VwcjJSVzRicVVDSjRpU0FOTEhtckFtcGV3dmVX?=
 =?utf-8?B?dksvekcrR3JqWmRMa2JpdXRXN0VGRFlkQUgwWHI2M0xzRlBpUlp4bVI5dGN1?=
 =?utf-8?B?d244STIrK1E5WXNRZzlpUHV4bXl2T3o5Rm9pRG1ucFh6Vi85RHRBbXEvd09F?=
 =?utf-8?B?YTVMVUdGUndaUGtxTldoQ1N0Z1QxaUVJMGh2d3pFYjlVbG9HSW5pT1FlMTBP?=
 =?utf-8?B?MTc3dTVyNFhpVjZGS1hlcmljaFlEWWduczEzSUtJejVGZ05CRGw3ZHB1MXdP?=
 =?utf-8?B?OTNKTERUc2Y3bWJxVE51RHptZ1BQK05RaXM2M1FHWUNuYStGSGttYkVwRTgz?=
 =?utf-8?B?cXhzbzFvblpvWGdmclBlNmg3eU1tR0ZPSHd0SnJPcnY3ek9Ea1lXNUQ2bVR0?=
 =?utf-8?B?MlcyRytMM015ZVdFcUpRZEpRbTdpcFNWdU92WmVWOGFZdENCUWp1RnRLR1hO?=
 =?utf-8?B?eEtma2dWUjd3alR0ZDJFRitxWkYydzNyc0tkZmV6UTNSQXIxQXNFdEk2YnhW?=
 =?utf-8?B?amFHSFF5TktuYXJKVVBlanpvQUswaURZWjBXQ21JZXN4QytLZWIvb3VEeklt?=
 =?utf-8?B?MjVpTnpmczV4ZXlFSmt1UlZneUY0VHdncUw3b2pqa2hGdVhGYXlTUEZPNUVu?=
 =?utf-8?B?cFJGQlcrWkJhOERSK2gwZU56OGhYeDFsTFJQenhpNUxUczQ3eFkydXVYVlBH?=
 =?utf-8?B?UXNCOU92a2FqWjA5dG5qMW5KeS8yWUdDQ2hXNXBEUnVGOHpZTm9PVkdkR21s?=
 =?utf-8?B?KzRGc0pSTjYzSVVMTUJIWVZlQjNXS0h2aVJDZnF3MGVzdFR3a2owVElCZUhJ?=
 =?utf-8?B?NVRwbmcrbFVzS2R6T2FxaVZwT3Y4bmdMdlpvdGZSRHlKUzh1WjkzWTFjek5u?=
 =?utf-8?B?bWxKN3lCNVhGVnVsVlJqdVdtd0ttamU0MTY2bldPcUlGM3hRbTgzSGlsR0I1?=
 =?utf-8?B?bFdGaXkvL3hQbmMzcUVCRWNqNUpPQUpFb0twYmJhYVhsWFRMZHlndXQ5UTR6?=
 =?utf-8?B?Q0ZlQmFUVnJnN0IxWUdDOUxPMWtmcUdFalFlVXR3SmlyODJLdzJkL1J6Y01M?=
 =?utf-8?B?RHR6c21yVUlxMGZjNFBGMGtrazlacXpZd3h3M0dlWWh6aDEyM0RUZkV2SlhZ?=
 =?utf-8?B?TkE2Y0w2M0NVRURoQzd4Y0JOUlVCcVB4aE9lditpRVNnY1U5cGVJMVJ3MzFn?=
 =?utf-8?B?ekQ1ZjRGY215TGNWSHBJdWlNUE1ibExTYkwxc3dCUUUxcWYrUWZMS3B0eXlk?=
 =?utf-8?B?Zkw5ZGV6VzJqUWYxOFZ4S0J2VHhSNzgxTGw2Ri9ZZlI1NzBab255dTF2YStI?=
 =?utf-8?B?b1BtT3creVlzUGhFNGtuMkxEZmFoUXhmMUJLK0xQa3EreGFYaGpYa0JnM1ZO?=
 =?utf-8?B?QjduL0RpY2F5Y1VmOTdXWUpMWnh0dWtobG5UWmtaQlc1bHUrV2l2SktaYStS?=
 =?utf-8?B?Qjhxd1ZkOEllZTQxZC8zWHJyeFAzalNnTXFDQ29LWUxtakFIVnpaM1NDR3hQ?=
 =?utf-8?B?aHFVQXlwaTBYMVZ0RllzRWtJcCt4bU9hU3FXYjlwbU8xREZvZGZXZFVVNmY0?=
 =?utf-8?B?UzNOWXBHbEtjcnJmZzZNNkJzWG5ZNkJ2bm5wV2IzNkVENlN4ekxZRXVEYVhE?=
 =?utf-8?B?UmxENit2L1NEK1FVTGVNdkU2aVJiU3FLN1Z5ZGJyTHJLcEFGdEFORjVsdmJK?=
 =?utf-8?B?MmlPdUp3ZlNCVGhwY05ZWklud2ZHYXN2bVY1S3FlNnZ4eFpwR1cxOEFiTW1J?=
 =?utf-8?B?ZGlSdnZYMHBtazNGempOb1RVN2h1VHIwc1R5K2cyRGJTSStoby8xS0o3MG1X?=
 =?utf-8?B?YlhCNy9kR3owSWU2NTNXOWhsM1pFRU96eUY0TnFXOVA2UUQwNklWbTBsZUlx?=
 =?utf-8?B?ZjZKM25iYzIrYlVBVWU1SkQvdWRlbmpYWEpZWlhydkk1bE5ySVNNSkJ5a3hL?=
 =?utf-8?B?OUR1ZXZIYlZWLzYyS1pBS241OW5ueU13N2xsMWRjYjhva1ozSmtOb0V6ZnlG?=
 =?utf-8?B?amZnbEdtdUlYNGRSOWY1T1B5WkxUaHBlNjhaTDlEK25tTmx6M3RTOEpEYzRw?=
 =?utf-8?B?ZHY3anpkS0lMSzNTTE1uOENacnZxVEJHRWZYME1JZG1ORkVaNnoybWZOcXBa?=
 =?utf-8?B?NkJmWjRyQUdGdnFIY0hxdW1iU1J1bDVTL3RCSUhtS1QvdTFES0NkYW5hcEU3?=
 =?utf-8?Q?pwrreVI352d7B1st/lN0kW8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d3ac32-0acc-4de7-b3f8-08d9c589169c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4679.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 20:24:43.3320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFVdypO4ytXZ3PIuIQaRqI1qY9+o9nbZlSfrmsRRF4Fq+bQqUyQD2X3qlGJp6RjRNvxbCKaEmu5Xqr4F6pAgpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6520
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21-12-16 17:22:03, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> The plan for "struct function_desc" is to make its "group_names"
> /double/ const. That will allow drivers to use it with static const
> data.
> 
> This imx change is required to avoid:
> drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_parse_functions':
> drivers/pinctrl/freescale/pinctrl-imx.c:672:24: error: assignment of read-only location '*(func->group_names + (sizetype)(i * 4))'
>   672 |   func->group_names[i] = child->name;
>       |                        ^
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
> index daf28bc5661d..47b2ab1a14d0 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -648,6 +648,7 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
>  	struct device_node *child;
>  	struct function_desc *func;
>  	struct group_desc *grp;
> +	const char **group_names;
>  	u32 i = 0;
>  
>  	dev_dbg(pctl->dev, "parse function(%d): %pOFn\n", index, np);
> @@ -663,14 +664,16 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
>  		dev_err(ipctl->dev, "no groups defined in %pOF\n", np);
>  		return -EINVAL;
>  	}
> -	func->group_names = devm_kcalloc(ipctl->dev, func->num_group_names,
> -					 sizeof(char *), GFP_KERNEL);
> +
> +	group_names = devm_kcalloc(ipctl->dev, func->num_group_names,
> +				   sizeof(char *), GFP_KERNEL);
>  	if (!func->group_names)
This line needs to be:
  	if (!group_names)

Otherwise, the driver never probes successufully.

Linus, maybe you can squashed this fix in your tree without a resend.

>  		return -ENOMEM;
> +	for_each_child_of_node(np, child)
> +		group_names[i] = child->name;
> +	func->group_names = group_names;
>  
>  	for_each_child_of_node(np, child) {
> -		func->group_names[i] = child->name;
> -
>  		grp = devm_kzalloc(ipctl->dev, sizeof(struct group_desc),
>  				   GFP_KERNEL);
>  		if (!grp) {
> -- 
> 2.31.1
>
