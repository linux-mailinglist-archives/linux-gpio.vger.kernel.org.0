Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E50A52226AA
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 17:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbgGPPRG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 11:17:06 -0400
Received: from mail-eopbgr00089.outbound.protection.outlook.com ([40.107.0.89]:32741
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728412AbgGPPRF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jul 2020 11:17:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDdJChZXv/3ncTSzLK2jTxN2pENgye2K5Xd+kGJYoI9lWAcjtATTcp7hfZBOX12FEe4WL1xhdd7kzsC4bBaE7RuuVjPp3kcz6TF2i84sDePnTf5a+iBqI9IViYlTE/paL/FiFgO7CDpL9N20insQ6mtXJjOMMGUKuGKSQavUYaEUP16QxkuIYrQvmqj+Wcv3vEVvU/unR02nD6dtsHxJNhWdOsg09t8TmKlGV2Hp44t1GKrWKK3BD0PG/XeY2Zk6UlRrh288SI04kGJk7AIuOqL5mA7u7Jb6ZSXztUO7mPFbZ7Yqa7Af22c30uFg+cIDFptiN34/SG34h6fNqRyrsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFdGuwxw0VHrxWxsoqazc+EnobSOHz+1GdrnCDqwV+s=;
 b=k1NXpvnH8Mfm4USHCKCoj2vY6jtuXgHOWRxUAxHZEbxIKxmC1vMh35/MFeIkRxOUR5Y/1yE2OinC7svXKhoVZUk0FuV17mYZDkpnjq9G0p7uqhm+SDS8jHKIuYM/iVHchujZU9W6oBs9ZnuwFYTV+CK4exOTDsb3iVeyyjZqr2qZZ5nzPfzPHLhAaYyOEcRgdqO+a19OPAvt07MDNxJS2Ag2Zv9sQRWAoj+v6qsn55+FHAAGKJ3MyJkqDs/wjey1ObmHMojhompC1R+QNaJ9qLAUVKRtpCbABT69Q6CtYoG1aAM3pMAziaDKl34xP8ST+q6XZtX0/yRQr3QpkG7ljQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFdGuwxw0VHrxWxsoqazc+EnobSOHz+1GdrnCDqwV+s=;
 b=hnzLVpoLXR8mdOoTS/I9hB1BkuHzT+H0hTxmK7R9WT5g50A21+I77gaRUyUsmnHXo4KU3bwblfJFtxllbWKw4yi5EZ/prKedN17XpX4RE3AaeyT51vluBUStSYvWvD5hi+4nZZqGa2X9mgY9MgfXf9USa19kLZBQu+tGCuSPdQg=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0402MB3503.eurprd04.prod.outlook.com
 (2603:10a6:803:d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Thu, 16 Jul
 2020 15:14:25 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711%5]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 15:14:25 +0000
Subject: Re: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
To:     Anson Huang <Anson.Huang@nxp.com>, aisheng.dong@nxp.com,
        festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch,
        kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
References: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
From:   Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <c00f8fe3-d12a-0f91-c301-c028e5aa3f25@nxp.com>
Date:   Thu, 16 Jul 2020 18:14:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0021.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::31) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.102] (188.25.93.120) by AM0P190CA0021.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Thu, 16 Jul 2020 15:14:24 +0000
X-Originating-IP: [188.25.93.120]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8b1e96db-75be-4573-c869-08d8299aed21
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3503:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB35031D345639E0D7014C4057F97F0@VI1PR0402MB3503.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQooKmX5z5N4A76vo0mCMlHJuP9bIBkkMA3qZWgJWwxOd6RolqvM8i0GfL3FI5kYLs6eteumYE80DR2+oKivbG/NRQJyEdvSCukxdydD7wxfQ4NB7lpRsCl7LtgqcrApnj50kugLkQaWXHrKIfqxmFUY7Y787kN60h4q9YRMBAe9YjRrZOQj5CXSRlHwc2Joy9rRgHzj42gywS6/h6ctw+LyHWkZs5iwPoNzYr9xe1yh4hIVAwV1ULV5Dut9TVhmVpWcD+Xe7joxNnIo24nioxUB/xozsmFYGJECTvnhoPosZ+iFgZ1LxFqJJVz87lVH3t97Uqvgie4LFgOXIrOagFvXiIkMJMc62Z2GdLT5PjGFsiwnUzYgO9AL5XlV7wRQH1ItwupLfh8+OGvpQKw4Zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(31686004)(2906002)(52116002)(66946007)(66476007)(53546011)(66556008)(5660300002)(8676002)(8936002)(36756003)(316002)(478600001)(16526019)(83380400001)(6486002)(956004)(4326008)(2616005)(31696002)(86362001)(26005)(16576012)(44832011)(186003)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Azh7lJtUfLEgkt2x9PX26zW4Co/ewlCflO0Z5JwSg8lxgnOs2otS0E6BTyjV3p8jJ+UxbuRGo3e8in3zCmYSC2gvvL7m0XkIjRZdpFG9vhphmnHY7WjbA0FkJTJvxCwLgCX5ugmF0g8JR8sE5BqSre9wnvPEc0CWj4JorlNAQ5kxXWqxfSlMqdZKIG5JaeTPCRrUpcqErG4nbdD78ZpUyXHaCugSFk6ua73m3rj4HvrFzvyOwFnIsJuUpZkwRlqtVNSQSllygHRWka98Ue8pregyQbjgCkcRajIACbcb0lvB9ZbBD7bpQ/45yq/lOvzPeOEUruP9nZHO2YapD+GdZ44e2mR4LH2px/iaf96Lni/LvO+etAT7i0qr3JbgVri8XdSGxBO5OvXiSBDpb9ppyjsSf7Q4zB9RnRjTGnCHy4V0IKgbzu1emsZScmgdKINNqR/SerOOHDyDtYcs/tTJPY4zb247Jyijji5kqEW9IKE=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1e96db-75be-4573-c869-08d8299aed21
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 15:14:25.5270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8MiNO6x56NsJ8gdcgIKdndIBhp/mng2oy98rLC1vtoeauvZ/a1FuuBKAQ2tPgcCwDlixl33DmV8P8Iu+FV0jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3503
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Anson,

Few comments inline:

On 7/16/20 6:06 PM, Anson Huang wrote:
> To support building i.MX SCU pinctrl driver as module, below things need to be changed:
>
>      - Export SCU related functions and use "IS_ENABLED" instead of
>        "ifdef" to support SCU pinctrl driver user and itself to be
>        built as module;
>      - Use function callbacks for SCU related functions in pinctrl-imx.c
>        in order to support the scenario of PINCTRL_IMX is built in
>        while PINCTRL_IMX_SCU is built as module;
>      - All drivers using SCU pinctrl driver need to initialize the
>        SCU related function callback;
>      - Change PINCTR_IMX_SCU to tristate;
>      - Add module author, description and license.
>
> With above changes, i.MX SCU pinctrl driver can be built as module.


There are a lot of changes here. I think it would be better to try to 
split them

per functionality. One functional change per patch.


>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>   drivers/pinctrl/freescale/Kconfig           |  2 +-
>   drivers/pinctrl/freescale/pinctrl-imx.c     |  8 ++--
>   drivers/pinctrl/freescale/pinctrl-imx.h     | 57 ++++++++++++-----------------
>   drivers/pinctrl/freescale/pinctrl-imx8dxl.c |  3 ++
>   drivers/pinctrl/freescale/pinctrl-imx8qm.c  |  3 ++
>   drivers/pinctrl/freescale/pinctrl-imx8qxp.c |  3 ++
>   drivers/pinctrl/freescale/pinctrl-scu.c     |  5 +++
>   7 files changed, 42 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
> index 08fcf5c..570355c 100644
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
> @@ -7,7 +7,7 @@ config PINCTRL_IMX
>   	select REGMAP
>   
>   config PINCTRL_IMX_SCU
> -	bool
> +	tristate "IMX SCU pinctrl driver"
>   	depends on IMX_SCU
>   	select PINCTRL_IMX
>   
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 507e4af..b80c450 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -373,7 +373,7 @@ static int imx_pinconf_get(struct pinctrl_dev *pctldev,
>   	const struct imx_pinctrl_soc_info *info = ipctl->info;
>   
>   	if (info->flags & IMX_USE_SCU)
> -		return imx_pinconf_get_scu(pctldev, pin_id, config);
> +		return info->imx_pinconf_get(pctldev, pin_id, config);
>   	else
>   		return imx_pinconf_get_mmio(pctldev, pin_id, config);
>   }
> @@ -423,7 +423,7 @@ static int imx_pinconf_set(struct pinctrl_dev *pctldev,
>   	const struct imx_pinctrl_soc_info *info = ipctl->info;
>   
>   	if (info->flags & IMX_USE_SCU)
> -		return imx_pinconf_set_scu(pctldev, pin_id,
> +		return info->imx_pinconf_set(pctldev, pin_id,
>   					   configs, num_configs);
>   	else
>   		return imx_pinconf_set_mmio(pctldev, pin_id,
> @@ -440,7 +440,7 @@ static void imx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
>   	int ret;
>   
>   	if (info->flags & IMX_USE_SCU) {
> -		ret = imx_pinconf_get_scu(pctldev, pin_id, &config);
> +		ret = info->imx_pinconf_get(pctldev, pin_id, &config);
>   		if (ret) {
>   			dev_err(ipctl->dev, "failed to get %s pinconf\n",
>   				pin_get_name(pctldev, pin_id));
> @@ -629,7 +629,7 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
>   	for (i = 0; i < grp->num_pins; i++) {
>   		pin = &((struct imx_pin *)(grp->data))[i];
>   		if (info->flags & IMX_USE_SCU)
> -			imx_pinctrl_parse_pin_scu(ipctl, &grp->pins[i],
> +			info->imx_pinctrl_parse_pin(ipctl, &grp->pins[i],
>   						  pin, &list);
>   		else
>   			imx_pinctrl_parse_pin_mmio(ipctl, &grp->pins[i],
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
> index 333d32b..bdb86c2 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.h
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.h
> @@ -75,6 +75,21 @@ struct imx_cfg_params_decode {
>   	bool invert;
>   };
>   
> +/**
> + * @dev: a pointer back to containing device
> + * @base: the offset to the controller in virtual memory
> + */
> +struct imx_pinctrl {
> +	struct device *dev;
> +	struct pinctrl_dev *pctl;
> +	void __iomem *base;
> +	void __iomem *input_sel_base;
> +	const struct imx_pinctrl_soc_info *info;
> +	struct imx_pin_reg *pin_regs;
> +	unsigned int group_index;
> +	struct mutex mutex;
> +};
> +
>   struct imx_pinctrl_soc_info {
>   	const struct pinctrl_pin_desc *pins;
>   	unsigned int npins;
> @@ -98,21 +113,13 @@ struct imx_pinctrl_soc_info {
>   				  struct pinctrl_gpio_range *range,
>   				  unsigned offset,
>   				  bool input);
> -};
> -
> -/**
> - * @dev: a pointer back to containing device
> - * @base: the offset to the controller in virtual memory
> - */
> -struct imx_pinctrl {
> -	struct device *dev;
> -	struct pinctrl_dev *pctl;
> -	void __iomem *base;
> -	void __iomem *input_sel_base;
> -	const struct imx_pinctrl_soc_info *info;
> -	struct imx_pin_reg *pin_regs;
> -	unsigned int group_index;
> -	struct mutex mutex;
> +	int (*imx_pinconf_get)(struct pinctrl_dev *pctldev, unsigned int pin_id,
> +			       unsigned long *config);
> +	int (*imx_pinconf_set)(struct pinctrl_dev *pctldev, unsigned int pin_id,
> +			       unsigned long *configs, unsigned int num_configs);
> +	void (*imx_pinctrl_parse_pin)(struct imx_pinctrl *ipctl,
> +				      unsigned int *pin_id, struct imx_pin *pin,
> +				      const __be32 **list_p);
>   };
>   
>   #define IMX_CFG_PARAMS_DECODE(p, m, o) \
> @@ -137,7 +144,7 @@ struct imx_pinctrl {
>   int imx_pinctrl_probe(struct platform_device *pdev,
>   			const struct imx_pinctrl_soc_info *info);
>   
> -#ifdef CONFIG_PINCTRL_IMX_SCU
> +#if IS_ENABLED(CONFIG_PINCTRL_IMX_SCU)
>   #define BM_PAD_CTL_GP_ENABLE		BIT(30)
>   #define BM_PAD_CTL_IFMUX_ENABLE		BIT(31)
>   #define BP_PAD_CTL_IFMUX		27
> @@ -150,23 +157,5 @@ int imx_pinconf_set_scu(struct pinctrl_dev *pctldev, unsigned pin_id,
>   void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipctl,
>   			       unsigned int *pin_id, struct imx_pin *pin,
>   			       const __be32 **list_p);
> -#else
> -static inline int imx_pinconf_get_scu(struct pinctrl_dev *pctldev,
> -				      unsigned pin_id, unsigned long *config)
> -{
> -	return -EINVAL;
> -}
> -static inline int imx_pinconf_set_scu(struct pinctrl_dev *pctldev,
> -				      unsigned pin_id, unsigned long *configs,
> -				      unsigned num_configs)
> -{
> -	return -EINVAL;
> -}
> -static inline void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipctl,
> -					    unsigned int *pin_id,
> -					    struct imx_pin *pin,
> -					    const __be32 **list_p)
> -{
> -}
>   #endif
>   #endif /* __DRIVERS_PINCTRL_IMX_H */
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx8dxl.c b/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
> index 12b97da..d3020c0 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
> @@ -159,6 +159,9 @@ static struct imx_pinctrl_soc_info imx8dxl_pinctrl_info = {
>   	.pins = imx8dxl_pinctrl_pads,
>   	.npins = ARRAY_SIZE(imx8dxl_pinctrl_pads),
>   	.flags = IMX_USE_SCU,
> +	.imx_pinconf_get = imx_pinconf_get_scu,
> +	.imx_pinconf_set = imx_pinconf_set_scu,
> +	.imx_pinctrl_parse_pin = imx_pinctrl_parse_pin_scu,
>   };
>   
>   static const struct of_device_id imx8dxl_pinctrl_of_match[] = {
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx8qm.c b/drivers/pinctrl/freescale/pinctrl-imx8qm.c
> index 095acf4..8f46b940 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx8qm.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx8qm.c
> @@ -292,6 +292,9 @@ static const struct imx_pinctrl_soc_info imx8qm_pinctrl_info = {
>   	.pins = imx8qm_pinctrl_pads,
>   	.npins = ARRAY_SIZE(imx8qm_pinctrl_pads),
>   	.flags = IMX_USE_SCU,
> +	.imx_pinconf_get = imx_pinconf_get_scu,
> +	.imx_pinconf_set = imx_pinconf_set_scu,
> +	.imx_pinctrl_parse_pin = imx_pinctrl_parse_pin_scu,
>   };
>   
>   static const struct of_device_id imx8qm_pinctrl_of_match[] = {
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx8qxp.c b/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
> index 81ebd4c..6776ad6 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
> @@ -198,6 +198,9 @@ static struct imx_pinctrl_soc_info imx8qxp_pinctrl_info = {
>   	.pins = imx8qxp_pinctrl_pads,
>   	.npins = ARRAY_SIZE(imx8qxp_pinctrl_pads),
>   	.flags = IMX_USE_SCU,
> +	.imx_pinconf_get = imx_pinconf_get_scu,
> +	.imx_pinconf_set = imx_pinconf_set_scu,
> +	.imx_pinctrl_parse_pin = imx_pinctrl_parse_pin_scu,
>   };
>   
>   static const struct of_device_id imx8qxp_pinctrl_of_match[] = {
> diff --git a/drivers/pinctrl/freescale/pinctrl-scu.c b/drivers/pinctrl/freescale/pinctrl-scu.c
> index 9df45d3..59b5f8a 100644
> --- a/drivers/pinctrl/freescale/pinctrl-scu.c
> +++ b/drivers/pinctrl/freescale/pinctrl-scu.c
> @@ -7,6 +7,7 @@
>   
>   #include <linux/err.h>
>   #include <linux/firmware/imx/sci.h>
> +#include <linux/module.h>
>   #include <linux/of_address.h>
>   #include <linux/pinctrl/pinctrl.h>
>   #include <linux/platform_device.h>
> @@ -123,3 +124,7 @@ void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipctl,
>   		pin_scu->mux_mode, pin_scu->config);
>   }
>   EXPORT_SYMBOL_GPL(imx_pinctrl_parse_pin_scu);
> +
> +MODULE_AUTHOR("Dong Aisheng <aisheng.dong@nxp.com>");
> +MODULE_DESCRIPTION("NXP i.MX SCU common pinctrl driver");
> +MODULE_LICENSE("GPL v2");


