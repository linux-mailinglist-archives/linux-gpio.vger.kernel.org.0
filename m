Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 486333B137
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 10:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388267AbfFJItM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 04:49:12 -0400
Received: from mail-eopbgr710053.outbound.protection.outlook.com ([40.107.71.53]:45856
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388020AbfFJItM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Jun 2019 04:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIy52q9bpnnZTvA4xxHapQr8uCOcYVqeu/mtyBToV1w=;
 b=NPfxElpS9bLZFHiO6SixBC3Xt6OqSSTeY+UXqGpg6UGq3nexi+5fzmln8XMYrAwW0PDysfF/jwXy97Jb27mYRt54E8ynAHf9+flI+syoRZIYDsL+DL7DzpIUN+RZiMmp1MLdKMUTOFk13FCk44uzC7o4DTVY4+n/vjnntniRVzg=
Received: from DM6PR02CA0097.namprd02.prod.outlook.com (2603:10b6:5:1f4::38)
 by BYASPR01MB0021.namprd02.prod.outlook.com (2603:10b6:a03:72::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.16; Mon, 10 Jun
 2019 08:49:06 +0000
Received: from BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::207) by DM6PR02CA0097.outlook.office365.com
 (2603:10b6:5:1f4::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.17 via Frontend
 Transport; Mon, 10 Jun 2019 08:49:05 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; sedsystems.ca; dkim=none (message not signed)
 header.d=none;sedsystems.ca; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 BL2NAM02FT009.mail.protection.outlook.com (10.152.77.68) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1965.12
 via Frontend Transport; Mon, 10 Jun 2019 08:49:04 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:42346 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1haFzE-0002ml-5l; Mon, 10 Jun 2019 01:49:04 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1haFz9-0006ZI-2W; Mon, 10 Jun 2019 01:48:59 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x5A8muRY011668;
        Mon, 10 Jun 2019 01:48:56 -0700
Received: from [172.30.17.116]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1haFz6-0006Wy-1j; Mon, 10 Jun 2019 01:48:56 -0700
Subject: Re: [PATCH v3] gpio: xilinx: convert from OF GPIO to standard devm
 APIs
To:     Robert Hancock <hancock@sedsystems.ca>, linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhraj@xilinx.com
References: <1559927056-12064-1-git-send-email-hancock@sedsystems.ca>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <bdb2c988-acdb-b273-0d0b-d77317a96617@xilinx.com>
Date:   Mon, 10 Jun 2019 10:48:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559927056-12064-1-git-send-email-hancock@sedsystems.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(376002)(346002)(39860400002)(396003)(136003)(2980300002)(199004)(189003)(186003)(6246003)(65826007)(63266004)(478600001)(9786002)(77096007)(8936002)(230700001)(305945005)(44832011)(31696002)(81156014)(5660300002)(31686004)(4326008)(81166006)(107886003)(8676002)(36386004)(36756003)(426003)(70206006)(446003)(70586007)(2906002)(486006)(6666004)(356004)(229853002)(50466002)(476003)(336012)(106002)(126002)(26005)(2616005)(2486003)(52146003)(23676004)(64126003)(11346002)(47776003)(316002)(76176011)(14444005)(58126008)(65806001)(65956001)(5001870100001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYASPR01MB0021;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79b7a8f7-6cb6-4437-ce26-08d6ed807e57
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:BYASPR01MB0021;
X-MS-TrafficTypeDiagnostic: BYASPR01MB0021:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYASPR01MB0021BF26FADA3B0E38083449C6130@BYASPR01MB0021.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0064B3273C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: XD13ESfK678M7fO93qNNNAPa/7LTUTWAsFGkdv9Yx+jEGSwxn2puD83OTaOv1S/C/6GmL05IwfEn3aLDIxoDWvez9zjuRyLwiLIY1zLhZZkiIUCDQycaSdw4Flf38v+mBJz2s7n9cGiTq4RfAZBLtUA3CyRBCuV/B5TAWZKX1/QNkgziuOBw9Qs4UmIholPQiGPGMK+8v8zYBQGzIuRQi/fOa5RG9SKSKv8OQBDfdVCdCGjQjDAEmI1FHODdchEbn4sIxoL1v+9uDPQosUbnABJTWjU6izX90yXlNmTpSokB5Fbq26PBHVLvO90qUu3FbirXQ2V/e/QpOkO0TX1sWilSt0PZov4wEAzEWSSsLDD5/mhd4scwQpoejvSu+tPMR3jTm9KuZ6MkYzwj2ypXlQ36xk5xCqTe649iCoRRUgQ=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2019 08:49:04.7771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b7a8f7-6cb6-4437-ce26-08d6ed807e57
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYASPR01MB0021
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07. 06. 19 19:04, Robert Hancock wrote:
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
> Changed from v2: Cleaned up probe error message code
> 
>  drivers/gpio/Kconfig       |  1 -
>  drivers/gpio/gpio-xilinx.c | 90 +++++++++++++++++++---------------------------
>  2 files changed, 36 insertions(+), 55 deletions(-)
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
> index 32944eb..a9748b5 100644
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
> @@ -340,21 +316,28 @@ static int xgpio_probe(struct platform_device *pdev)
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
> +		dev_err(&pdev->dev, "failed to ioremap memory resource\n");
> +		return PTR_ERR(chip->regs);
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
> +		dev_err(&pdev->dev, "failed to add GPIO chip\n");
>  		return status;
>  	}
>  
> @@ -370,7 +353,6 @@ static int xgpio_probe(struct platform_device *pdev)
>  
>  static struct platform_driver xgpio_plat_driver = {
>  	.probe		= xgpio_probe,
> -	.remove		= xgpio_remove,
>  	.driver		= {
>  			.name = "gpio-xilinx",
>  			.of_match_table	= xgpio_of_match,
> 

Looks good.

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
