Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9983B8D86
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 07:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234240AbhGAF4Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 01:56:16 -0400
Received: from mail-bn8nam11on2060.outbound.protection.outlook.com ([40.107.236.60]:13536
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229777AbhGAF4Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Jul 2021 01:56:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VM2jLfJMhRCbYPDemNcH9lsEoNJeS3PtR6thqvp1uvCJ6s6+KdJI3UtV4r9er4g1ykvyy6rww9GTRJ3ttUY07p2AEgqZ4ewV+xAHaenfMzBS+fMBmGb9av37NPmIwi9YJQnYK/I0gDpOuDculZ1bukDm5near6nsKahZJgfSkCgx1rx9WTRXE5zlY9JOQKr8p3qWpncS77N+xr/uRjGtozG9MaQesjEUR7wA5lbzKjatF1Oia5Fo3Mh5Jk5aCl+OG+A/+VsDdctKWHh0rxEr+I96przN4U5fyMDaEid6xYgSDNlEYt803P+CzJVWhe1TI1Q2Vb++QZfEt2pHfo9hTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwMWTY1BlvVARPQ8YlwC2rMQGoJYOjBE4j+FpRgCVaM=;
 b=L3C82jvGSKEeRvzM1epCZltmEFtDM+GQDY6RZDiK3DZUy/a3q1iadWBBV5zZg+CgpbtfGaLNSvPgQHZcKTYUsKnHJ6jvUOUwkj2w0oSYayL1dLDcaFOoWYLbYlrpz7o5yYeBzdrIV8Z6BM8amfBHIWBRndf0zQd3Jbw4YAKrSFHJ32qSPHXPkPt6zkmHbJGCiRxNco2LvXSENIFrBJsaVp93adlwRRWmysMgfpR59pk8ASQSkdUBa4xz40tgRLnLI31SAJ4i7nDCNlK+Om3EZjOl+lybnS8MFsTlDRP0c7RCBP4A9LrfWjSB17ePCLfyXdPXBuNUzjYXL7X4gh19Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwMWTY1BlvVARPQ8YlwC2rMQGoJYOjBE4j+FpRgCVaM=;
 b=K2IIs7enr3q0CJhxdq858s9CNuJF9TDC64camPgk56WLtuiIMN0mMnUPhmA2VFlFB1f4oWkAXTJot+crQFlXj9hwn5tuhYMEEDIXsQZ+429mvEmTKhkJpL7ELKOVlzxVj/vPdB/9kppx24aVJ+93KxdpscPugz7UJBQJKfx73xRXgZPWAqMXRPh7NDx+MAbe1heTEIKPU/WEs62kpo4c2QoeyQ3OntJaFww4AeXq75d/P+NeNKHe+pYijr0IHEhbBTxRXHpYdV/iFnW72hr0aPsDy6/ArBzrYYdyp32lRZm0EwyR0/Wiy/Irokb2Q+3fs3av3bIBgP3fqu3annsP2g==
Received: from BN8PR15CA0018.namprd15.prod.outlook.com (2603:10b6:408:c0::31)
 by CH2PR12MB4231.namprd12.prod.outlook.com (2603:10b6:610:7d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 1 Jul
 2021 05:53:44 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::d5) by BN8PR15CA0018.outlook.office365.com
 (2603:10b6:408:c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Thu, 1 Jul 2021 05:53:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 05:53:44 +0000
Received: from [10.26.49.10] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 05:53:40 +0000
Subject: Re: [PATCH v4] gpio: tegra186: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>, <andy.shevchenko@gmail.com>
CC:     <bgolaszewski@baylibre.com>, <kyarlagadda@nvidia.com>,
        <ldewangan@nvidia.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <smangipudi@nvidia.com>, <thierry.reding@gmail.com>
References: <CAHp75VfB8varyi5j=j8YaysdgofxFU1-xCKLFPrxiYz7KadGfA@mail.gmail.com>
 <1625115672-17932-1-git-send-email-akhilrajeev@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <2a8eb285-3b71-199c-1bf4-39fb47fac77e@nvidia.com>
Date:   Thu, 1 Jul 2021 06:53:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625115672-17932-1-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68ac5d3c-c63d-4398-c472-08d93c549624
X-MS-TrafficTypeDiagnostic: CH2PR12MB4231:
X-Microsoft-Antispam-PRVS: <CH2PR12MB423169ADFD5D0F8BFA468BC3D9009@CH2PR12MB4231.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k8zIzfHUg/gy87QMGCTMbjBEMxRdenvzkdNJWXrMpm77nSR3rwQV8C1cqtOxmHA9fZDn5MvvxWJxqFs0f7CHl0+3llFVEjUG7tJCHtGUDwavt3iyXVZFSqsfJY+NMWOUek+X6Y5WP/0FQAGhGWPtJEShYfh2QTUPb+z3yNSqZ+Syx8BPdPIj64AvCbAdytRUedJsZ5VSrqlNaJgwkamX9lH8vGe5iuOJ6hHdXmjVtPguRUyQHWgyKWi5y37FESgF8HwY5SD3+kMwtU1ixbVnVEAFL+2kvUDqMhAGu4aoWCrxAhMOQVbclIP1ZEt7vxr1N99rwqoPBDXWx5bQ5MOs+yrs4e1Axf+q0437vu381kiXFyqvWpQZso//X5Zftt/tyDChlkjLbHPQykHoj17fkpaTmUJwP8ZOtFCdfzfJmknag7Sxyfm+daJ3fcbonJE8VWGGbUkpmCFPzOn3E3wo8kZn74NMzU8UNThixvhAqC0acMKiXiJZoOo+fwPFeauDX4OMJHB9tu0UQv7OnW1kSUoa3oQPEaSEUIxhF5pnRds4infhIapYCFZrGGHcsJ1/tsMMQVzIzxxFa+6fNeWxLKGxojU+kX6vQecstIwlquKf2LeDlLt3d3eKrLKQWYg66jBZA1H+rRrQ3JLjTpqchOJ9qweBUhDzRQfGbFCiZwtopdW6RG2vuDX1I4Aa2/aBVz+u0aCUahk5XNZ0jXqAJLlc5Qg1Emwusbsaa/6gZLDrNTAjNhmZ2JlWaDObmrXw
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(36840700001)(46966006)(4326008)(70206006)(53546011)(47076005)(2616005)(356005)(36756003)(5660300002)(478600001)(86362001)(31696002)(2906002)(336012)(8936002)(8676002)(54906003)(110136005)(83380400001)(31686004)(426003)(316002)(82740400003)(16526019)(82310400003)(7636003)(70586007)(26005)(186003)(36860700001)(16576012)(43740500002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 05:53:44.1918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ac5d3c-c63d-4398-c472-08d93c549624
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4231
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 01/07/2021 06:01, Akhil R wrote:
> Add ACPI module ID to probe the driver from the ACPI based bootloader
> firmware.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 1bd9e44..e0ba8cd 100644
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
> -
>  	gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
> -	if (IS_ERR(gpio->base))
> -		return PTR_ERR(gpio->base);
> +
> +	if (IS_ERR(gpio->secure) || IS_ERR(gpio->base)) {


The OR here seems a bit odd, my preference would be how Andy suggested
initially ...

    gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
    if (IS_ERR(gpio->secure)) {
        gpio->secure = devm_platform_ioremap_resource(pdev, 0);
        if (IS_ERR(gpio->secure))
            return PTR_ERR(gpio->secure)
    }

Cheers
Jon

-- 
nvpublic
