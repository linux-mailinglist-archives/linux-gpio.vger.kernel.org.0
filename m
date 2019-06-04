Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCDF133F12
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 08:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfFDGmv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 02:42:51 -0400
Received: from mail-eopbgr50053.outbound.protection.outlook.com ([40.107.5.53]:5700
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726410AbfFDGmu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Jun 2019 02:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.onmicrosoft.com;
 s=selector1-cern-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qCOvZdlUfyT2PudrLabAQxPrcXMlTzIj0QN/nb6Sdk=;
 b=dRNSHiuNJQLI9Nzze4TlM41WZdCUvk3LSKUq7FgafbPoNaOhUwc8Nwdkz1GYEpEowsdeU4B9n5qx8CMVrwaXPb6X0K/NHzEKdg/AVo7M43LA4bvfH2coXHjoLnNy7+OMZo4/CK/YhY5FKfEjnDTRnhXGpAkTS3Ol+sHzszFIbOs=
Received: from VI1PR0601CA0039.eurprd06.prod.outlook.com
 (2603:10a6:800:1e::49) by HE1PR0601MB2585.eurprd06.prod.outlook.com
 (2603:10a6:3:49::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.21; Tue, 4 Jun
 2019 06:42:46 +0000
Received: from AM5EUR02FT059.eop-EUR02.prod.protection.outlook.com
 (2a01:111:f400:7e1e::203) by VI1PR0601CA0039.outlook.office365.com
 (2603:10a6:800:1e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.18 via Frontend
 Transport; Tue, 4 Jun 2019 06:42:46 +0000
Authentication-Results: spf=pass (sender IP is 188.184.36.48)
 smtp.mailfrom=cern.ch; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 188.184.36.48 as permitted sender) receiver=protection.outlook.com;
 client-ip=188.184.36.48; helo=cernmxgwlb4.cern.ch;
Received: from cernmxgwlb4.cern.ch (188.184.36.48) by
 AM5EUR02FT059.mail.protection.outlook.com (10.152.9.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1943.19 via Frontend Transport; Tue, 4 Jun 2019 06:42:46 +0000
Received: from cernfe04.cern.ch (188.184.36.41) by cernmxgwlb4.cern.ch
 (188.184.36.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 4 Jun
 2019 08:42:46 +0200
Received: from pcbe13614.localnet (2001:1458:202:121::100:40) by smtp.cern.ch
 (2001:1458:201:66::100:14) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 4 Jun 2019 08:42:46 +0200
From:   Federico Vaga <federico.vaga@cern.ch>
To:     Linus Walleij <linus.walleij@linaro.org>
Reply-To: <federico.vaga@cern.ch>
CC:     <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pat Riehecky <riehecky@fnal.gov>,
        "Alessandro Rubini" <rubini@gnudd.com>
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
Date:   Tue, 4 Jun 2019 08:42:45 +0200
Message-ID: <22282873.PltXLBtAh5@pcbe13614>
In-Reply-To: <20190603230604.30938-1-linus.walleij@linaro.org>
References: <20190603230604.30938-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [2001:1458:202:121::100:40]
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:188.184.36.48;IPV:NLI;CTRY:CH;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(2980300002)(199004)(189003)(230700001)(4326008)(11346002)(26005)(70206006)(426003)(336012)(106002)(186003)(126002)(486006)(476003)(70586007)(8676002)(54906003)(23726003)(316002)(8936002)(246002)(7636002)(86362001)(356004)(6916009)(14444005)(9686003)(305945005)(7736002)(33716001)(97756001)(2906002)(229853002)(966005)(6246003)(478600001)(6116002)(6306002)(446003)(50466002)(3450700001)(44832011)(47776003)(16526019)(43066004)(74482002)(5660300002)(53546011)(9576002)(46406003)(76176011)(561944003)(39026011);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0601MB2585;H:cernmxgwlb4.cern.ch;FPR:;SPF:Pass;LANG:en;PTR:cernmx12.cern.ch;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5453dbf7-4c55-4bb9-26b3-08d6e8b7daa3
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328)(7193020);SRVR:HE1PR0601MB2585;
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2585:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <HE1PR0601MB2585FF8C09D22F713F08A6CFEF150@HE1PR0601MB2585.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0058ABBBC7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4txl7Zm3ya8MuH0ELXe49ATOeVADUEYEQM+x0/LxQ/b+6mJXyPCxcHb2VU3gCOxXVuuA9TLppdMjymJAdhTlON2ZIEZpqtnnrjJDjdgTTzKVDxgV6Sxdbvo7cS9Fvlzc6Q1dIbZqFOALKAQkuyxv8y7+KXoN+nW/APnXdM+X0nUEByK/ER2V6tgF8QOOD9MqZTIxBH9gZQgImZCjBS8YUQR0EC2HpS/xmVsY6GPZxe1ozaPyXQB8ZabR1OaZ6FR4Wkp3JGyn4ICYl4p+1L+mKjuLAhat4YxqgO8GEERIjJCyS4wX8tH6WjXLA+ZVyD8VV8GmZ03CCpAI/b+7RfPgQvQcjFAW77W0MhZiW2ygTPmzGBeGcB8PAUUsgg2Abu4SRp+co0D2xYwgyrZzwQsxPlbLYmOakbCHd/IUqNXSHnQ=
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2019 06:42:46.1796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5453dbf7-4c55-4bb9-26b3-08d6e8b7daa3
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[188.184.36.48];Helo=[cernmxgwlb4.cern.ch]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2585
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus,

I take this occasion to renovate my proposal

https://lkml.org/lkml/2018/10/29/534


On Tuesday, June 4, 2019 1:06:04 AM CEST Linus Walleij wrote:
> This tries to convert the FMC subsystem to use GPIO descriptors.
> I say try because several pieces of this puzzle seems to not
> be in the mainline kernel.
>
> For details of this change, see drivers/gpio/TODO.
> 
> We assume the FMC device is created somewhere and the GPIOs can
> be added in this place using gpio descriptor tables from
> <linux/gpio/machine.h> as in other conversions, but the place
> where the FMC device is created does not seem to be in the
> mainline Linux kernel. We assume the index ordering can be
> made to match the current GPIO index order in FMC which
> isn't especially specific.
> 
> We get rid of some GPIO compatibility defines for kernel 3.0
> in the process, it is long overdue.
> 
> It might be that gpio numbers in this subsystem has nothing
> to do with gpio numbers in the GPIO subsystem, and it is just
> including <linux/gpio.h> and reusing some defines for no
> good reason. Then this should be changed to some approach
> decoupling FMC from the GPIO subsystem.
> 
> Cc: Federico Vaga <federico.vaga@cern.ch>
> Cc: Pat Riehecky <riehecky@fnal.gov>
> Cc: Alessandro Rubini <rubini@gnudd.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/fmc/fmc-core.c    |  1 +
>  drivers/fmc/fmc-trivial.c | 21 ++++++++++++++++-----
>  include/linux/fmc.h       | 15 ++++-----------
>  3 files changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/fmc/fmc-core.c b/drivers/fmc/fmc-core.c
> index bbcb505d1522..f08b6f81f442 100644
> --- a/drivers/fmc/fmc-core.c
> +++ b/drivers/fmc/fmc-core.c
> @@ -14,6 +14,7 @@
>  #include <linux/device.h>
>  #include <linux/fmc.h>
>  #include <linux/fmc-sdb.h>
> +#include <linux/gpio/consumer.h>
> 
>  #include "fmc-private.h"
> 
> diff --git a/drivers/fmc/fmc-trivial.c b/drivers/fmc/fmc-trivial.c
> index 8defdee3e3a3..bab02d17f02c 100644
> --- a/drivers/fmc/fmc-trivial.c
> +++ b/drivers/fmc/fmc-trivial.c
> @@ -15,7 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/fmc.h>
> 
>  static struct fmc_driver t_drv; /* initialized later */
> @@ -31,12 +31,12 @@ static irqreturn_t t_handler(int irq, void *dev_id)
> 
>  static struct fmc_gpio t_gpio[] = {
>  	{
> -		.gpio = FMC_GPIO_IRQ(0),
> -		.mode = GPIOF_DIR_IN,
> +		.gpio_index = FMC_GPIO_IRQ(0),
> +		.flags = GPIOD_IN,
>  		.irqmode = IRQF_TRIGGER_RISING,
>  	}, {
> -		.gpio = FMC_GPIO_IRQ(1),
> -		.mode = GPIOF_DIR_IN,
> +		.gpio_index = FMC_GPIO_IRQ(1),
> +		.flags = GPIOD_IN,
>  		.irqmode = IRQF_TRIGGER_RISING,
>  	}
>  };
> @@ -45,6 +45,7 @@ static int t_probe(struct fmc_device *fmc)
>  {
>  	int ret;
>  	int index = 0;
> +	int i;
> 
>  	index = fmc_validate(fmc, &t_drv);
>  	if (index < 0)
> @@ -53,6 +54,16 @@ static int t_probe(struct fmc_device *fmc)
>  	ret = fmc_irq_request(fmc, t_handler, "fmc-trivial", IRQF_SHARED);
>  	if (ret < 0)
>  		return ret;
> +	/*
> +	 * All GPIOs are associated with the FMC device using machine
> +	 * descriptor tables or similar. Pick the indices we want.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(t_gpio); i++) {
> +		t_gpio[i].gpiod = devm_gpiod_get_index(&fmc->dev,
> +						       NULL,
> +						       
t_gpio[i].gpio_index,
> +						       
t_gpio[i].flags);
> +	}
>  	/* ignore error code of call below, we really don't care */
>  	fmc_gpio_config(fmc, t_gpio, ARRAY_SIZE(t_gpio));
> 
> diff --git a/include/linux/fmc.h b/include/linux/fmc.h
> index 3dc8a1b2db7b..452688aa97db 100644
> --- a/include/linux/fmc.h
> +++ b/include/linux/fmc.h
> @@ -15,6 +15,7 @@
>  #include <linux/list.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/gpio/consumer.h>
> 
>  struct fmc_device;
>  struct fmc_driver;
> @@ -99,9 +100,9 @@ struct fmc_driver {
>   */
>  struct fmc_gpio {
>  	char *carrier_name; /* name or NULL for virtual pins */
> -	int gpio;
> -	int _gpio;	/* internal use by the carrier */
> -	int mode;	/* GPIOF_DIR_OUT etc, from <linux/gpio.h> */
> +	int gpio_index;
> +	struct gpio_desc *gpiod;
> +	enum gpiod_flags flags; /* see <linux/gpio/consumer.h> */
>  	int irqmode;	/* IRQF_TRIGGER_LOW and so on */
>  };
> 
> @@ -115,14 +116,6 @@ struct fmc_gpio {
>  #define FMC_GPIO_USER(x)	((x) + 0x1400)	/*  256 of them */
>  /* We may add SCL and SDA, or other roles if the need arises */
> 
> -/* GPIOF_DIR_IN etc are missing before 3.0. copy from <linux/gpio.h> */
> -#ifndef GPIOF_DIR_IN
> -#  define GPIOF_DIR_OUT   (0 << 0)
> -#  define GPIOF_DIR_IN    (1 << 0)
> -#  define GPIOF_INIT_LOW  (0 << 1)
> -#  define GPIOF_INIT_HIGH (1 << 1)
> -#endif
> -
>  /*
>   * The operations are offered by each carrier and should make driver
>   * design completely independent of the carrier. Named GPIO pins may be




