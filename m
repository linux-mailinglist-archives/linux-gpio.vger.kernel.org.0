Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 491063867E
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 10:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbfFGIq0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 04:46:26 -0400
Received: from mail-eopbgr780042.outbound.protection.outlook.com ([40.107.78.42]:54444
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726531AbfFGIq0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 7 Jun 2019 04:46:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YSI4pAHUnywAPNJ6QQmYSI9flKiJAoFIeqQoXqpOLk=;
 b=nVWzZxK+IshUMqt9RHicbrxFDy45i2l6Y+RMqy04Jo9AomoWI0aI1vLqmqfMBP7LDnSnfuicpEQuUOniNJLP0CtbvJITgpu+M0/SzeEmh6RGzlLK+IIgRvkQ0+bBQ7DRiF/AmXhOegiGOFAQy9MMK3TlHFEN3VBw+wrZr89Gt3s=
Received: from BL0PR02CA0080.namprd02.prod.outlook.com (2603:10b6:208:51::21)
 by CY4PR02MB2679.namprd02.prod.outlook.com (2603:10b6:903:126::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Fri, 7 Jun
 2019 08:46:20 +0000
Received: from BL2NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::200) by BL0PR02CA0080.outlook.office365.com
 (2603:10b6:208:51::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12 via Frontend
 Transport; Fri, 7 Jun 2019 08:46:20 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; sedsystems.ca; dkim=none (message not signed)
 header.d=none;sedsystems.ca; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT022.mail.protection.outlook.com (10.152.77.153) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1965.12
 via Frontend Transport; Fri, 7 Jun 2019 08:46:18 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hZAVu-0006b2-7r; Fri, 07 Jun 2019 01:46:18 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hZAVp-0001C8-4h; Fri, 07 Jun 2019 01:46:13 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x578k3Uc025800;
        Fri, 7 Jun 2019 01:46:04 -0700
Received: from [172.30.17.116]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1hZAVf-00018L-Es; Fri, 07 Jun 2019 01:46:03 -0700
Subject: Re: [PATCH v2] gpio: xilinx: convert from OF GPIO to standard devm
 APIs
To:     Robert Hancock <hancock@sedsystems.ca>, linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, Shubhrajyoti Datta <shubhraj@xilinx.com>
References: <1559838505-7388-1-git-send-email-hancock@sedsystems.ca>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <feee5c50-7231-72f5-2787-340c45cbfadf@xilinx.com>
Date:   Fri, 7 Jun 2019 10:46:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559838505-7388-1-git-send-email-hancock@sedsystems.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(979002)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(199004)(189003)(64126003)(50466002)(446003)(305945005)(2906002)(77096007)(4326008)(6246003)(31686004)(316002)(23676004)(65806001)(58126008)(36386004)(65956001)(229853002)(47776003)(478600001)(186003)(63266004)(11346002)(230700001)(2616005)(2486003)(9786002)(70586007)(76176011)(81166006)(44832011)(336012)(8676002)(106002)(52146003)(5660300002)(107886003)(476003)(65826007)(486006)(81156014)(126002)(356004)(70206006)(14444005)(31696002)(26005)(36756003)(426003)(8936002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR02MB2679;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0881fb2b-add2-4e2f-b6bf-08d6eb249c31
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:CY4PR02MB2679;
X-MS-TrafficTypeDiagnostic: CY4PR02MB2679:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB2679E1650BA12D97DCAB1991C6100@CY4PR02MB2679.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0061C35778
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: HXi5GCo0a4PglGGwMJhmoq4PEGusDjr4A+uR18xDZsSVEnzZt2VSiF9gbUFtpWqcVh2JhxaWvvPQ248RzpoGfWDJTkH42/5YlXO1LLFVlE6v8HDJ/rZlD3LiH0SYCfny7mbA2coyLwqim1w0appKlfJ/+gaJREuOmdvPbL/2Mu2qryP9lbH8SpJ2w+F+vshu54wk4gU9mS3W45OcjwBu6z4Jfg2fPlXIlPHKL7rqBIg1LKXT4nZ8XFPI2gSodJmGfxVL1NNrMMf8VmXNrWEiry3FxUnaQf3JPUyyWR4BSgAsMuvJgO44oVAW/VOZqoiGN7iURVQkoGqx+P/DEI03V8QDXc5Th7sKWKK/QEEi5579fvSEPP5jpyoSBRswdfP3+lgPr7YTy0kLCS2ekWO+WQYekw0Jo5wu9rkd6sHZRoI=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2019 08:46:18.8339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0881fb2b-add2-4e2f-b6bf-08d6eb249c31
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2679
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Shubhrajyoti

On 06. 06. 19 18:28, Robert Hancock wrote:
> This driver was using the OF GPIO helper API, but barely used any of its
> features and it cost more code than it saved. Also, the OF GPIO code is
> now deprecated. Convert it to use a more standard setup and use devm
> APIs for initialization to avoid the need for a remove function.
> 
> Our rationale for this change is that we are using the Xilinx GPIO with
> resources injected using the MFD core rather than on the device tree
> itself. Using platform rather than OF-specific resources allows this to
> work for free.
> 
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
> 
> Changes from v1:
> -use dev_name() to set GPIO chip label
> -use specific dev_err() for each probe error location rather than
>  a generic pr_err() message
> 
>  drivers/gpio/Kconfig       |  1 -
>  drivers/gpio/gpio-xilinx.c | 92 +++++++++++++++++++---------------------------
>  2 files changed, 38 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index acd40eb..66f1f13 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -602,7 +602,6 @@ config GPIO_XGENE_SB
>  
>  config GPIO_XILINX
>  	tristate "Xilinx GPIO support"
> -	depends on OF_GPIO
>  	help
>  	  Say yes here to support the Xilinx FPGA GPIO device
>  
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index 32944eb..1c0ed1d 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -11,7 +11,6 @@
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/of_platform.h>
> -#include <linux/of_gpio.h>
>  #include <linux/io.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/slab.h>
> @@ -33,14 +32,16 @@
>  
>  /**
>   * struct xgpio_instance - Stores information about GPIO device
> - * @mmchip: OF GPIO chip for memory mapped banks
> + * @gc: GPIO chip
> + * @regs: register block
>   * @gpio_width: GPIO width for every channel
>   * @gpio_state: GPIO state shadow register
>   * @gpio_dir: GPIO direction shadow register
>   * @gpio_lock: Lock used for synchronization
>   */
>  struct xgpio_instance {
> -	struct of_mm_gpio_chip mmchip;
> +	struct gpio_chip gc;
> +	void __iomem *regs;
>  	unsigned int gpio_width[2];
>  	u32 gpio_state[2];
>  	u32 gpio_dir[2];
> @@ -84,11 +85,10 @@ static inline int xgpio_offset(struct xgpio_instance *chip, int gpio)
>   */
>  static int xgpio_get(struct gpio_chip *gc, unsigned int gpio)
>  {
> -	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
>  	struct xgpio_instance *chip = gpiochip_get_data(gc);
>  	u32 val;
>  
> -	val = xgpio_readreg(mm_gc->regs + XGPIO_DATA_OFFSET +
> +	val = xgpio_readreg(chip->regs + XGPIO_DATA_OFFSET +
>  			    xgpio_regoffset(chip, gpio));
>  
>  	return !!(val & BIT(xgpio_offset(chip, gpio)));
> @@ -106,7 +106,6 @@ static int xgpio_get(struct gpio_chip *gc, unsigned int gpio)
>  static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>  	unsigned long flags;
> -	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
>  	struct xgpio_instance *chip = gpiochip_get_data(gc);
>  	int index =  xgpio_index(chip, gpio);
>  	int offset =  xgpio_offset(chip, gpio);
> @@ -119,7 +118,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  	else
>  		chip->gpio_state[index] &= ~BIT(offset);
>  
> -	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET +
> +	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
>  		       xgpio_regoffset(chip, gpio), chip->gpio_state[index]);
>  
>  	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> @@ -138,7 +137,6 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>  			       unsigned long *bits)
>  {
>  	unsigned long flags;
> -	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
>  	struct xgpio_instance *chip = gpiochip_get_data(gc);
>  	int index = xgpio_index(chip, 0);
>  	int offset, i;
> @@ -150,7 +148,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>  		if (*mask == 0)
>  			break;
>  		if (index !=  xgpio_index(chip, i)) {
> -			xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET +
> +			xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
>  				       xgpio_regoffset(chip, i),
>  				       chip->gpio_state[index]);
>  			spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> @@ -166,7 +164,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>  		}
>  	}
>  
> -	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET +
> +	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
>  		       xgpio_regoffset(chip, i), chip->gpio_state[index]);
>  
>  	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> @@ -184,7 +182,6 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>  static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
>  {
>  	unsigned long flags;
> -	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
>  	struct xgpio_instance *chip = gpiochip_get_data(gc);
>  	int index =  xgpio_index(chip, gpio);
>  	int offset =  xgpio_offset(chip, gpio);
> @@ -193,7 +190,7 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
>  
>  	/* Set the GPIO bit in shadow register and set direction as input */
>  	chip->gpio_dir[index] |= BIT(offset);
> -	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET +
> +	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
>  		       xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
>  
>  	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> @@ -216,7 +213,6 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
>  static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>  	unsigned long flags;
> -	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
>  	struct xgpio_instance *chip = gpiochip_get_data(gc);
>  	int index =  xgpio_index(chip, gpio);
>  	int offset =  xgpio_offset(chip, gpio);
> @@ -228,12 +224,12 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>  		chip->gpio_state[index] |= BIT(offset);
>  	else
>  		chip->gpio_state[index] &= ~BIT(offset);
> -	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET +
> +	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
>  			xgpio_regoffset(chip, gpio), chip->gpio_state[index]);
>  
>  	/* Clear the GPIO bit in shadow register and set direction as output */
>  	chip->gpio_dir[index] &= ~BIT(offset);
> -	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET +
> +	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
>  			xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
>  
>  	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> @@ -243,43 +239,23 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>  
>  /**
>   * xgpio_save_regs - Set initial values of GPIO pins
> - * @mm_gc: Pointer to memory mapped GPIO chip structure
> + * @chip: Pointer to GPIO instance
>   */
> -static void xgpio_save_regs(struct of_mm_gpio_chip *mm_gc)
> +static void xgpio_save_regs(struct xgpio_instance *chip)
>  {
> -	struct xgpio_instance *chip =
> -		container_of(mm_gc, struct xgpio_instance, mmchip);
> -
> -	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET,	chip->gpio_state[0]);
> -	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET, chip->gpio_dir[0]);
> +	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET,	chip->gpio_state[0]);
> +	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET, chip->gpio_dir[0]);
>  
>  	if (!chip->gpio_width[1])
>  		return;
>  
> -	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET + XGPIO_CHANNEL_OFFSET,
> +	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET + XGPIO_CHANNEL_OFFSET,
>  		       chip->gpio_state[1]);
> -	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET + XGPIO_CHANNEL_OFFSET,
> +	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET + XGPIO_CHANNEL_OFFSET,
>  		       chip->gpio_dir[1]);
>  }
>  
>  /**
> - * xgpio_remove - Remove method for the GPIO device.
> - * @pdev: pointer to the platform device
> - *
> - * This function remove gpiochips and frees all the allocated resources.
> - *
> - * Return: 0 always
> - */
> -static int xgpio_remove(struct platform_device *pdev)
> -{
> -	struct xgpio_instance *chip = platform_get_drvdata(pdev);
> -
> -	of_mm_gpiochip_remove(&chip->mmchip);
> -
> -	return 0;
> -}
> -
> -/**
>   * xgpio_of_probe - Probe method for the GPIO device.
>   * @pdev: pointer to the platform device
>   *
> @@ -340,21 +316,30 @@ static int xgpio_probe(struct platform_device *pdev)
>  		spin_lock_init(&chip->gpio_lock[1]);
>  	}
>  
> -	chip->mmchip.gc.ngpio = chip->gpio_width[0] + chip->gpio_width[1];
> -	chip->mmchip.gc.parent = &pdev->dev;
> -	chip->mmchip.gc.direction_input = xgpio_dir_in;
> -	chip->mmchip.gc.direction_output = xgpio_dir_out;
> -	chip->mmchip.gc.get = xgpio_get;
> -	chip->mmchip.gc.set = xgpio_set;
> -	chip->mmchip.gc.set_multiple = xgpio_set_multiple;
> +	chip->gc.base = -1;
> +	chip->gc.ngpio = chip->gpio_width[0] + chip->gpio_width[1];
> +	chip->gc.parent = &pdev->dev;
> +	chip->gc.direction_input = xgpio_dir_in;
> +	chip->gc.direction_output = xgpio_dir_out;
> +	chip->gc.get = xgpio_get;
> +	chip->gc.set = xgpio_set;
> +	chip->gc.set_multiple = xgpio_set_multiple;
> +
> +	chip->gc.label = dev_name(&pdev->dev);
> +
> +	chip->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(chip->regs)) {
> +		status = PTR_ERR(chip->regs);
> +		dev_err(&pdev->dev, "failed to ioremap memory resource: %d\n",
> +			status);
> +		return status;
> +	}
>  
> -	chip->mmchip.save_regs = xgpio_save_regs;
> +	xgpio_save_regs(chip);
>  
> -	/* Call the OF gpio helper to setup and register the GPIO device */
> -	status = of_mm_gpiochip_add_data(np, &chip->mmchip, chip);
> +	status = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
>  	if (status) {
> -		pr_err("%pOF: error in probe function with status %d\n",
> -		       np, status);
> +		dev_err(&pdev->dev, "failed to add GPIO chip: %d\n", status);
>  		return status;
>  	}
>  
> @@ -370,7 +355,6 @@ static int xgpio_probe(struct platform_device *pdev)
>  
>  static struct platform_driver xgpio_plat_driver = {
>  	.probe		= xgpio_probe,
> -	.remove		= xgpio_remove,
>  	.driver		= {
>  			.name = "gpio-xilinx",
>  			.of_match_table	= xgpio_of_match,
> 


Please take a look at it.
M
