Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18D11F63D4
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 10:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgFKImV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 04:42:21 -0400
Received: from mail-eopbgr150051.outbound.protection.outlook.com ([40.107.15.51]:22887
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726651AbgFKImV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jun 2020 04:42:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guRGX/iD39p9E6YnWJoiU/5f/nQUdzinVNTq15oS9dIp53vt5HB+w54A84zGwlVON6G5lVsBgw3q0W66OpOBGB3gQ4XNXETUv+bv9p/TFMV+SElgHMMui481J9yg6A2BDtu1CC6HyHyWYW2URX606BsSM7Dulte69yzCccBivUS8s6TCDzx++xgQSJV1kgR2UKp1RWvrZA6Gjw9yBCD44jT6LkrreScSwrtIlpRGeEgDFaOtAtMlZkSPBjtGLqKQaDDYV9/uvoPQJnzDZPu1V/L/TaiAHsjvwlXYa3TszM4I1f1WRclbCr3mnYsT6lT42pmUXjoj2M7MPd4Yn3tc3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaKLcSMzri/TGVbDLMfiPh3RMLvoqPo4w7dwSjzRa9s=;
 b=XOwloy7R9Cs6LIfHCN7YNMvlP8Uo8s9Ge0K7MSVHngNfFW6jwDrzEDMMYxuMEauDBN04G/YCnTMY62WRo5BzQAEkN54MfqDuXXiU1jn8hUofBQeptwX4uiwb1StxyrHG9zEsly43ogYTr+nsrkYXdvZTcHmUPdpOzmNEajBCMpS/OCQG4df6W8Rw0FssQbcYC/MHpSRsoaZnmcyeenyFJczt6nfU9jsR+nr/LsjFXSCgCRICjMTlyuDmmUjn+efdyM/S3UjEz/7FTjp5XcNAWEJ8SkmllBuBbjVdG+pY3Rzxto9f79HHBQIy/asnRwiK+AgEpzJAP7g0OpN1u2xRHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaKLcSMzri/TGVbDLMfiPh3RMLvoqPo4w7dwSjzRa9s=;
 b=aKkH4nPkOQl2CL6O/IWNnCYvdaw39QLfRy2hjsV+Xk0uqyv38iuNXO1g0eTYnNU9EY497ODjTSJZ8TMbCVEO3214lnSXOR/H/dKiDGS5hq3SMER8FjsLNYbw9EIq7zKfsvPT6fKoXdlVWbHGWSA7zxwTwLi7juvRJGwnicUceno=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0401MB2464.eurprd04.prod.outlook.com
 (2603:10a6:800:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Thu, 11 Jun
 2020 08:42:17 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60%3]) with mapi id 15.20.3066.023; Thu, 11 Jun 2020
 08:42:17 +0000
Subject: Re: [PATCH V4 4/9] pinctrl: imx8mn: Support building as module
To:     Anson Huang <Anson.Huang@nxp.com>, aisheng.dong@nxp.com,
        festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch,
        kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
References: <1591775865-26872-1-git-send-email-Anson.Huang@nxp.com>
 <1591775865-26872-5-git-send-email-Anson.Huang@nxp.com>
From:   Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <33292cab-c49d-0878-dd8c-1166258e089b@nxp.com>
Date:   Thu, 11 Jun 2020 11:42:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1591775865-26872-5-git-send-email-Anson.Huang@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0110.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::15) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:2f08:560d:e500:fcf6:7c4d:8076:b570] (2a02:2f08:560d:e500:fcf6:7c4d:8076:b570) by AM0PR01CA0110.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 08:42:16 +0000
X-Originating-IP: [2a02:2f08:560d:e500:fcf6:7c4d:8076:b570]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0c6849ab-3f55-4489-4cdd-08d80de358cd
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2464:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB246489B0406B9CCFB69AC275F9800@VI1PR0401MB2464.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DImLV8J8FexEW+sHFXrJ06czzddzPXy6fja/UdRWbtx5WYQRbh64LUOUVL2Nok1SDZekkXV71JhbboYozr+hlB7gVf5B7fhGYUuefRF/rg+0BXESOgxZ6azIQq983CydhplhoB4QBo4hZJUArNCW70kPUcKagLmsOhCE7yIOwu0ZJ1qL5bMDI7jXINqQFwqFSlWpjvcHDK+m05hNJc7JQE0BM3DN+hbECZ4IiVh/MPQLfrv7tpQ0KSLl8K9+agLU2XiW+Xhwc59JvCBKJ/PV5ckQtVEoPrepEWiV/y+61npYQKb4X7Kp5B5e7BFg3tTgqVOEj3TYQ7nFE5z2mXe4V0Qr2q9KeRu/G9e+/tSKtOBAy8aDZmbtW6ZjitF0zrPUb2M0udQnJmJ5w7TJGu3SxtiuhC7ewHSrbA8IstPB6Us=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(2906002)(31686004)(83380400001)(8676002)(186003)(316002)(86362001)(5660300002)(16526019)(66556008)(8936002)(478600001)(66946007)(66476007)(2616005)(31696002)(6486002)(4326008)(53546011)(36756003)(52116002)(44832011)(921003)(32563001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: GpH0JD7MWUdthuNbZSrrx7gA3DnKyjAWMUenfVat42egxvPlaC5sPuW1iDdvqJXDc4HYHrI/vOMQohS53RBNV6zIXje+BOoXPXtjLAfJg0A/6zbGWhiEhPkK419VRe0wIf72sV8O99KStnBf9GtBjfpSaGpSCj7zkQp2GYe9tOuQO3Ct2WgN1b1F0u+gBKy8XeTdnBwvLTQo842iVZ1DInrDhFv864DOQRfX+2zI6sj42+LJA3MV6OU1ueTbxV8wf4+8y3zwYjI0QnhwXnQnys6FMrhjfZKgOXTce7VosY9+OOsd/feojf6F4+D1JICKB6z5xe12Qmoy2ieZAsCiVLyRRKrOQG4kC4xP6P9dr2O4BcVIpmoEO4UFQ1WcrWU0dCNHRAEaYFg/ZhHZGse5oLBlSsP0XNM8SzrX2t5Xv3M2Irh64vN/pSWc3H7p3Ww6nwIlRD8zbEfEksY9SPv57kVzCZDEGovXeqF0yPO8gNmenZAGQIFup/o9vXmKal0MjfQf9/qZUVgSqCQBxZ6yVMC1nUDt2f/SNAJh3brpGTxPcOt/1tg2lmBVVMSRA0p3
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6849ab-3f55-4489-4cdd-08d80de358cd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 08:42:17.5510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /o8oBHa8emBcnA4L+AGRGfXy1Afn5n4egA2ha1vasKOFS4p4+MhRUDiqAUN4NjeG2vBBcLMBJKkGBvzznEpDNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2464
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Maybe this is obvious but I would really like to see an explanation

of why we are switching from arch_initcall to platform_init.

Commit message act as documentation  for the reviewers.

On 10.06.2020 10:57, Anson Huang wrote:
> Support building i.MX8MN pinctrl driver as module.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No change.
> ---
>   drivers/pinctrl/freescale/Kconfig          |  2 +-
>   drivers/pinctrl/freescale/pinctrl-imx8mn.c | 10 ++++------
>   2 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
> index 556adc3..fe3e49c 100644
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
> @@ -132,7 +132,7 @@ config PINCTRL_IMX8MM
>   	  Say Y here to enable the imx8mm pinctrl driver
>   
>   config PINCTRL_IMX8MN
> -	bool "IMX8MN pinctrl driver"
> +	tristate "IMX8MN pinctrl driver"
>   	depends on ARCH_MXC
>   	select PINCTRL_IMX
>   	help
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mn.c b/drivers/pinctrl/freescale/pinctrl-imx8mn.c
> index 100ed8c..b6db780 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx8mn.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx8mn.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/err.h>
>   #include <linux/init.h>
> +#include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/pinctrl/pinctrl.h>
>   #include <linux/platform_device.h>
> @@ -326,6 +327,7 @@ static const struct of_device_id imx8mn_pinctrl_of_match[] = {
>   	{ .compatible = "fsl,imx8mn-iomuxc", .data = &imx8mn_pinctrl_info, },
>   	{ /* sentinel */ }
>   };
> +MODULE_DEVICE_TABLE(of, imx8mn_pinctrl_of_match);
>   
>   static int imx8mn_pinctrl_probe(struct platform_device *pdev)
>   {
> @@ -340,9 +342,5 @@ static struct platform_driver imx8mn_pinctrl_driver = {
>   	},
>   	.probe = imx8mn_pinctrl_probe,
>   };
> -
> -static int __init imx8mn_pinctrl_init(void)
> -{
> -	return platform_driver_register(&imx8mn_pinctrl_driver);
> -}
> -arch_initcall(imx8mn_pinctrl_init);
> +module_platform_driver(imx8mn_pinctrl_driver);
> +MODULE_LICENSE("GPL v2");
