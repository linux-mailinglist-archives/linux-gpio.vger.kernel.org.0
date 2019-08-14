Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F19C8CD87
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 10:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbfHNIET (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 04:04:19 -0400
Received: from mail-eopbgr780084.outbound.protection.outlook.com ([40.107.78.84]:22122
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725265AbfHNIES (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Aug 2019 04:04:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yvo5IIs0zB5lRXKWeinn0h7cbzPiyp8CiQWYZnaM3xXMzUWbzjrIqjm7On6tXAcKcIvW4fiiiRB/KeoInjJlwMTYJiNeKpcx15YzXrGFanOOZ4gPvM8RlmyKOknJqkwzn6C60svyDqelRbGy+zj0ZGZJkBqYqrEZ0G4QajzRcS3Ll5lk7GjtbuTJsqlfq34oImYtS73bjXR1zLp5U9+rWyaP9RkzecbVFR9gZGJPNtUTzfjPpl7MxEzGxHP49VO0pKMQ+p2jF1pDIdoEgSS1zNZWaStfAmppjN7/lq7ZoyCDu8sXf8wi9wj7rLR4UiXxg2tCfcwi68AEztzuRpR/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5seFkiqPHNX971CBN2s/69SUx30FqzGSDTpF1QT3CA=;
 b=HVUjPNl5T2FJ+AIPAZqZfUiNhWaEEvqxUAo100OKUm/2UNogOC0SQPb3QmFtXaROsyqUXyx3+geEMdUI8TVQPttJyEqA9FpY20xHssOMko0sD0GHjvI2qyfzsOPjCdrlFBSoTQZTpbydvTQKU68tJnwy9ZI/Kr78YTJR37UthPSAc74MCxcY78/WVyBeMH68tx+T3sBC7yKDouWDzhEdf30PBHpoAbovlIENq8qM5Fum0eXq75ZCu4mSzDcwSWHkqWd01u25UXWS9WnZkqMZz9TRY6z3xPt8TlxL/oJsCxW2+kXXS+bllK8cjm0N9sbspET4HI3lmYyUqmFU5tiXLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5seFkiqPHNX971CBN2s/69SUx30FqzGSDTpF1QT3CA=;
 b=VOT5iFa4mEL+n5ihK4sPlmPL6nlwXUuMv6USnHRpfSEApl44BMnwAEnlzfwkQQWHvEfY1GqDmDOL4RSd3VmbGFGtmzSRwP24ayQPVSQHsS9DELwQv/Un3KujUxSEeZcfaSzOBb6+I0B6PNwenSoP0fiqGKNuHjx20GcEmTPfVIg=
Received: from MWHPR02CA0010.namprd02.prod.outlook.com (2603:10b6:300:4b::20)
 by BYAPR02MB4823.namprd02.prod.outlook.com (2603:10b6:a03:46::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.23; Wed, 14 Aug
 2019 08:04:15 +0000
Received: from BL2NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::202) by MWHPR02CA0010.outlook.office365.com
 (2603:10b6:300:4b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Wed, 14 Aug 2019 08:04:15 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT006.mail.protection.outlook.com (10.152.76.239) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2157.15
 via Frontend Transport; Wed, 14 Aug 2019 08:04:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hxoGT-0004xU-UZ; Wed, 14 Aug 2019 01:04:13 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hxoGO-0003C1-Qd; Wed, 14 Aug 2019 01:04:08 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x7E844mS008579;
        Wed, 14 Aug 2019 01:04:04 -0700
Received: from [172.30.17.116]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1hxoGJ-0003B3-P6; Wed, 14 Aug 2019 01:04:03 -0700
Subject: Re: [PATCH] gpio: zynq: Pass irqchip when adding gpiochip
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Thierry Reding <treding@nvidia.com>
References: <20190809132649.25176-1-linus.walleij@linaro.org>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <21218433-03c7-e525-e6b3-0dedfa9982b5@xilinx.com>
Date:   Wed, 14 Aug 2019 10:04:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809132649.25176-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(979002)(4636009)(136003)(346002)(39860400002)(376002)(396003)(2980300002)(199004)(189003)(76176011)(186003)(230700001)(31696002)(476003)(8676002)(2616005)(36386004)(11346002)(446003)(26005)(336012)(4326008)(47776003)(426003)(50466002)(486006)(64126003)(23676004)(44832011)(305945005)(2486003)(63266004)(52146003)(478600001)(126002)(31686004)(6246003)(81156014)(316002)(36756003)(106002)(70586007)(54906003)(58126008)(65806001)(70206006)(9786002)(65826007)(81166006)(8936002)(65956001)(5660300002)(356004)(229853002)(2906002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB4823;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 942f6e65-7a51-4fb4-5600-08d7208dffac
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:BYAPR02MB4823;
X-MS-TrafficTypeDiagnostic: BYAPR02MB4823:
X-Microsoft-Antispam-PRVS: <BYAPR02MB48236B2C53CF14B67F5609AAC6AD0@BYAPR02MB4823.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 01294F875B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rFPmQw5vMGhuvmF0cn7VHV45p184DUeAhlTcSNn8fu+GM2jRatFAhmutqUZK1b5zoBR+CKCqJ4rDj+17gz68k8bvJ4148BBKtULiZ+f1RHYBvXzJ0ZkuptbDhVQbXpyl+F3FXrhI7TzqWBjEmtrU7ZTOFWCIhjAgFRs9iEWo+T4DZSaAzqPhFG2UHFhWQnuIPI722DG0uxmrhlDd5Lpin9Cd+6a2KnE8JoNrLRptM4ydAqPXBr5sd7rGXg0b85xvBqVKr4Ioidn43sHPwe91/ovs1NTv0S7KOEJfaFqgapfr59+WDfMNQTIiZ4J4DoIGXkwxm6LfqG52EvbyFjrRm7mjLBZOW5VvvV30dtYGjT+sGNSge5EMNQYbp+vho+zghKOlAxusIm0BN4bXJIaVEfkxs23+EMiuxbBxp0LguhU=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 08:04:14.5764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 942f6e65-7a51-4fb4-5600-08d7208dffac
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4823
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09. 08. 19 15:26, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> For chained irqchips this is a pretty straight-forward
> conversion.
> 
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-zynq.c | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index 86b0bd256c13..cd475ff4bcad 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -830,6 +830,7 @@ static int zynq_gpio_probe(struct platform_device *pdev)
>  	int ret, bank_num;
>  	struct zynq_gpio *gpio;
>  	struct gpio_chip *chip;
> +	struct gpio_irq_chip *girq;
>  	const struct of_device_id *match;
>  
>  	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> @@ -885,34 +886,38 @@ static int zynq_gpio_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_pm_dis;
>  
> -	/* report a bug if gpio chip registration fails */
> -	ret = gpiochip_add_data(chip, gpio);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to add gpio chip\n");
> -		goto err_pm_put;
> -	}
> -
>  	/* disable interrupts for all banks */
>  	for (bank_num = 0; bank_num < gpio->p_data->max_bank; bank_num++)
>  		writel_relaxed(ZYNQ_GPIO_IXR_DISABLE_ALL, gpio->base_addr +
>  			       ZYNQ_GPIO_INTDIS_OFFSET(bank_num));
>  
> -	ret = gpiochip_irqchip_add(chip, &zynq_gpio_edge_irqchip, 0,
> -				   handle_level_irq, IRQ_TYPE_NONE);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to add irq chip\n");
> -		goto err_rm_gpiochip;
> +	/* Set up the GPIO irqchip */
> +	girq = &chip->irq;
> +	girq->chip = &zynq_gpio_edge_irqchip;
> +	girq->parent_handler = zynq_gpio_irqhandler;
> +	girq->num_parents = 1;
> +	girq->parents = devm_kcalloc(&pdev->dev, 1,
> +				     sizeof(*girq->parents),
> +				     GFP_KERNEL);
> +	if (!girq->parents) {
> +		ret = -ENOMEM;
> +		goto err_pm_put;
>  	}
> +	girq->parents[0] = gpio->irq;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_level_irq;
>  
> -	gpiochip_set_chained_irqchip(chip, &zynq_gpio_edge_irqchip, gpio->irq,
> -				     zynq_gpio_irqhandler);
> +	/* report a bug if gpio chip registration fails */
> +	ret = gpiochip_add_data(chip, gpio);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to add gpio chip\n");
> +		goto err_pm_put;
> +	}
>  
>  	pm_runtime_put(&pdev->dev);
>  
>  	return 0;
>  
> -err_rm_gpiochip:
> -	gpiochip_remove(chip);
>  err_pm_put:
>  	pm_runtime_put(&pdev->dev);
>  err_pm_dis:
> 

Shubhrajyoti: Please retest it.

Thanks,
Michal
