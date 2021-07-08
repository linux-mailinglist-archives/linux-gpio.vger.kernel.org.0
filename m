Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C12A3C13DE
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jul 2021 15:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhGHNLI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jul 2021 09:11:08 -0400
Received: from mail-mw2nam12on2055.outbound.protection.outlook.com ([40.107.244.55]:10497
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230080AbhGHNLH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Jul 2021 09:11:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7egHVXUMIcnjE7/PABKZnDAJh5XVoYfUCxGYMiYr+E/K3evyVvtYhVald5YcVy6NqIAqur46VBiVeFQe6WB2t6zjbFKD0pxJr0tHMZ33+wv8EHzG6QAiqJvDyE/uqBN7XME9dh5SR2fgHfV84XfnIxkRqVXzlQGPiY0JRLo9N0vpCxvvM1MZEsrwgsSuHpTTKow2Zam2wl/4uVLFET45PK4W/I1S9RnhnR3OaFly5iLYmvJNbF3J0EfFPwx1VvLGr6Q2RnK8hAO0AymvjTe64r/7VnJ7UHi7U/y/TbEcHFzoY7pYhQ6t7A6oRzER79uJzDZpaxAAsfL1136CTSgbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WVFEalV1weFqyCc15w8kCWK08wITdLwN3E5U59GA1c=;
 b=b2U8KdMgYitTjosp/IHLPXIeljYc0W7kdVpTKQ/h8cJnjnaNk1N2b4zLstH/pUX83C029JXNSDTERbzc5d35/UDHE4uCT2dqeQJMJd4KPMwOY9qgkSamiIEvrGuV/Qe8Z2aY/MCehnPM6SqpEdT/zsOuTFu6Pmbsz1pV5y8tJa8tEy2DBFuDxmuc0OSCA20OmUNflEmtW6qFGri8G8UiNfiLxz0Y0nzvjouJFFGn4eicAAzSLZzlAEOXU2XiL1Pw6xLI8udweSuIYEbUzRq/iuGGRjEFBAhFjl1QBJzshTyJmfsgChxqpDFx9sF1n1KLcQfMgDNS9pU+VOjIqBGDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WVFEalV1weFqyCc15w8kCWK08wITdLwN3E5U59GA1c=;
 b=iTPGNKC1XUBVeufOsGwt2qbOQz6EAUke0HDDL2S+OcBQW9xx1uZsGD//ReP10yw6ghwe6H985trQFPogUzbrB9Q53WPAlBNaPVWgEVfqYnQTOipViejBd70aSh2NjSG/bcEibj2ICJ7OjLa3Aff2cZj1LXWj0gHLuQkH3hjfnjKBDfac5rblnjH8aDwqwTSjGkDDMcaQYjmOVMlqxOpH3aqGKCJJIfqJsJYLV+DGkzECuYSQt15GNAkVFxF76jB+22NZYsUbpPL5r8PfEmfC9IiZc4/jN0X3q98u9W3MfZq2Cng7WLZ6876O9iC5ddN2z7Lr7/2NZ5HviMtQSMCW5g==
Received: from BN9PR03CA0553.namprd03.prod.outlook.com (2603:10b6:408:138::18)
 by BN8PR12MB3027.namprd12.prod.outlook.com (2603:10b6:408:64::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 8 Jul
 2021 13:08:23 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::f4) by BN9PR03CA0553.outlook.office365.com
 (2603:10b6:408:138::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Thu, 8 Jul 2021 13:08:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 13:08:22 +0000
Received: from [10.26.49.10] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Jul
 2021 13:08:19 +0000
Subject: Re: [PATCH v5] gpio: tegra186: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>
CC:     <andy.shevchenko@gmail.com>, <bgolaszewski@baylibre.com>,
        <kyarlagadda@nvidia.com>, <ldewangan@nvidia.com>,
        <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <mperttunen@nvidia.com>, <smangipudi@nvidia.com>,
        <thierry.reding@gmail.com>
References: <2a8eb285-3b71-199c-1bf4-39fb47fac77e@nvidia.com>
 <1625130054-22947-1-git-send-email-akhilrajeev@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <5010ac2c-bfd0-1a79-d470-a1c601207f28@nvidia.com>
Date:   Thu, 8 Jul 2021 14:08:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625130054-22947-1-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c2cba67-b6df-4f3a-5a8c-08d94211773e
X-MS-TrafficTypeDiagnostic: BN8PR12MB3027:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3027873D11FC90047009076CD9199@BN8PR12MB3027.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jL/eqd3bmbneteElPHHDlOyyPto0MTmgkA5V17WckIVuhxKK4g/Yp1f0S7+JosXJOcPzQvtGwuD+5flY4HRnrC8GoAcVrxBzY7jcaJzPB4XYByri1/PfwxC6oyt0J6h0e27cdnmE/Se+d2NFsPVVP07N68qtU0CywhKJ9sx7acl0KCMr+6cx/yZ+FSyS5jEzRa0YjvaGKrDWJQE7CmiAMR5gEcBszM/cvZ919cgT287E4St0Y/Aqg7Y78kAwJlPWyFlI/vnLOsNmw51yfHHDWlHncIpc7mZomJXHLcLr96plBrwLexs5/7Q5pmCLpPSzSqVt4DBBLPSMR7fBwL4iq0cu0oVN2NDzFsKzJRF1vGtVpNKQT36otfwL2Rd/1r5zi9rO/fTx4ApoOiCcYNx+w0EVkPe+9X219cr14u89LnpU3m6uRIfG7J5az7vOzvqpERvK3YI93jzLzAsHdKtN9YQZ3/ge9n3Q6a+rNy765FwIut3v/7qG/0EXlUg3IYBY+BH1UK61hdKafYo4Kk1NlMRchTAhJoM7A3uAdAW2EYGqvdqyvoQiANHFcF7Xh4V4N2tVKlUFVv07SqnfoTqG/IGl5qlCtx8jfrxHDbyj2DX+I0LBX4ZaGcJWjweLHJggMr/wdoBwV76YXHjwxpiYNLvc581UGwuUyKfUNGppdgMMinY77c0zRt4GPUUk4UrsvTK04PXrwIeGi/lLoqpwr16SKjNVRVTPx2ka1/xyNIw=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(6862004)(70586007)(16526019)(82740400003)(36756003)(426003)(7636003)(2616005)(47076005)(26005)(356005)(186003)(336012)(4326008)(83380400001)(8676002)(70206006)(8936002)(37006003)(2906002)(316002)(53546011)(86362001)(54906003)(31686004)(16576012)(6636002)(36860700001)(31696002)(5660300002)(478600001)(36906005)(82310400003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 13:08:22.9879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2cba67-b6df-4f3a-5a8c-08d94211773e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3027
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 01/07/2021 10:00, Akhil R wrote:
> Add ACPI module ID to probe the driver from the ACPI based bootloader
> firmware.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
> v5 changes:
> 	* Updated ioremap_resource check as per Jon's comments.
> 
>  drivers/gpio/gpio-tegra186.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 1bd9e44..8a64dcb 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -620,15 +620,21 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>  	if (!gpio)
>  		return -ENOMEM;
>  
> -	gpio->soc = of_device_get_match_data(&pdev->dev);
> +	gpio->soc = device_get_match_data(&pdev->dev);
>  
>  	gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
> -	if (IS_ERR(gpio->secure))
> -		return PTR_ERR(gpio->secure);
> +	if (IS_ERR(gpio->secure)) {
> +		gpio->secure = devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(gpio->secure))
> +			return PTR_ERR(gpio->secure);
> +	}
>  
>  	gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
> -	if (IS_ERR(gpio->base))
> -		return PTR_ERR(gpio->base);
> +	if (IS_ERR(gpio->base)) {
> +		gpio->base = devm_platform_ioremap_resource(pdev, 1);
> +		if (IS_ERR(gpio->base))
> +			return PTR_ERR(gpio->base);
> +	}
>  
>  	err = platform_irq_count(pdev);
>  	if (err < 0)
> @@ -690,11 +696,13 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>  
>  	gpio->gpio.names = (const char * const *)names;
>  
> +#if defined(CONFIG_OF_GPIO)
>  	gpio->gpio.of_node = pdev->dev.of_node;
>  	gpio->gpio.of_gpio_n_cells = 2;
>  	gpio->gpio.of_xlate = tegra186_gpio_of_xlate;
> +#endif /* CONFIG_OF_GPIO */
>  
> -	gpio->intc.name = pdev->dev.of_node->name;
> +	gpio->intc.name = dev_name(&pdev->dev);
>  	gpio->intc.irq_ack = tegra186_irq_ack;
>  	gpio->intc.irq_mask = tegra186_irq_mask;
>  	gpio->intc.irq_unmask = tegra186_irq_unmask;
> @@ -918,10 +926,20 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, tegra186_gpio_of_match);
>  
> +static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
> +	{ .id = "NVDA0108", .driver_data = (kernel_ulong_t)&tegra186_main_soc },
> +	{ .id = "NVDA0208", .driver_data = (kernel_ulong_t)&tegra186_aon_soc },
> +	{ .id = "NVDA0308", .driver_data = (kernel_ulong_t)&tegra194_main_soc },
> +	{ .id = "NVDA0408", .driver_data = (kernel_ulong_t)&tegra194_aon_soc },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, tegra186_gpio_acpi_match);
> +
>  static struct platform_driver tegra186_gpio_driver = {
>  	.driver = {
>  		.name = "tegra186-gpio",
>  		.of_match_table = tegra186_gpio_of_match,
> +		.acpi_match_table = tegra186_gpio_acpi_match,
>  	},
>  	.probe = tegra186_gpio_probe,
>  	.remove = tegra186_gpio_remove,
> 

Looks good to me.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
