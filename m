Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E830652F64E
	for <lists+linux-gpio@lfdr.de>; Sat, 21 May 2022 01:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239933AbiETXmT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 19:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbiETXmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 19:42:18 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A93D19FF7F
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 16:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1653090137; x=1684626137;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cbxuNpr/zCC3fo3EPXew8NY8Z0HqAPgONnWiV+/hf/c=;
  b=B5EWxpCnEF8DlmOAvy36DvFuzE0KpfRW73zXWOj2+m1mk352LDSu/6Ak
   4SWXYfwZ3DVbl4NUeXS138FkOvezdP5LtahxhNL7PhPRHaMIupdOOTDyC
   I2QInRkQlDFoeCilh6DvateTwr75X1qPtDFSAVM8TstHrQkmXO4LEHNus
   YLM1JEoabz3toxeQ8jlDPaQId/KH+V5P++pr03B5cP2S8zZGyAHCW8yPU
   neMEAPfrkLRw3rfbXZwa3+5CQvdWppY2PEnqKK+WOI19gmFtdcKVo7+jy
   NI1QkK3+UrrU0KwD0zLq1d0Qeu7HBmE4D4ZIiNWHPNrcDJzXbgrbSJi8F
   g==;
X-IronPort-AV: E=Sophos;i="5.91,240,1647273600"; 
   d="scan'208";a="199760345"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 21 May 2022 07:42:17 +0800
IronPort-SDR: xmGyYbmp4iVlxXDkYHaNnI6Gc1esDfYMNzso1EFuKxOboQ0Sl2jgYroQzrXzLWv6DMHiZNDLxO
 qjbXPAxml0wCqByc80psIcxVvh2A4IThD4UqtbP6Sml0hcfTrIG1YU0MMaEZuPy/H0z2UZD2Ut
 kmjrGvod+BYOfhEcELSLQr4T8nBbMh6j2Oj+qtSYcAYBNug3kpiP60rQ48/lj4mdXoRgSpGn12
 fekLLRN+kyMujotgyn6DZH9YqJOvH0jnogIRT6ztZRXqXWITRvCSeQOzqxVfWDzXQFPj0suBVH
 1CI58aIwftSOVhp1aYTQE1O4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2022 16:07:38 -0700
IronPort-SDR: 7y7LePYqHpgRjnkVZattSlBnfnT9nw7sCgU5f9aOrkwbpH+LYrs4+UcNSUVGZc/yxCX8gHwYSw
 YPr0kQyiIxUNiTaxCgA7hGS3rxtHdr3NWnHRAe1zYNIYBxyAb7TUtUwMW2AXXaWTEOEq2Q22pc
 jxjqYwA9dqERFkA3IN/sO8mzI3w4iemZI1ZmDrQ/KvRWHIY+NUZfav1DNB0CT4fkUxZ+RwT2oi
 dZrhCZgVm37pvAk/Tt8hdj8X1QYS2/yFw7EeN7GwNJNYXgImOsBdvRXJlXfKrz9a9lAxyj+4O8
 FYI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2022 16:42:17 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L4jtw3zFCz1SVp0
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 16:42:16 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1653090135; x=1655682136; bh=cbxuNpr/zCC3fo3EPXew8NY8Z0HqAPgONnW
        iV+/hf/c=; b=hhU532P0mw79hDtuG/IXya1FxRnUWF3nulx+yr48s+IZCMrZpbe
        mAHA5aMH8CfCcja+OpNPK2zikLvf33jRnFrmQ9zL+dkR7N3v8q7ift1GuhIp0pn5
        BsBZce1jLuLMqIp/38pso6xa3oQj/BGZPv1HGlXw1freyFBm2QNaftMowLznUEPU
        H98dXiyt6Ne12DsH6nbTcgXUqt32c+DTuveN8NmT5af77Y/QppjZgx5Vd9zG2h+c
        WWLxIqEOgCfDSPUUQHAWu/cLqnI2LNMsdeVxt11Kx3W9lVi6uHb8nGoEH8DrPEKs
        YPSHHpDaOxlX0Z6JcvBm3z8h5C3yODLZUrg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id ETKfVs2bn8ZO for <linux-gpio@vger.kernel.org>;
        Fri, 20 May 2022 16:42:15 -0700 (PDT)
Received: from [10.225.163.51] (unknown [10.225.163.51])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L4jtt3qJFz1Rvlc;
        Fri, 20 May 2022 16:42:14 -0700 (PDT)
Message-ID: <8e516ec1-fb85-7878-3c68-61798de9fa6a@opensource.wdc.com>
Date:   Sat, 21 May 2022 08:42:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] gpio: sifive: Make the irqchip immutable
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
References: <26519be2a2fdd4c6741658144e3a8d78cf4d000b.1653042202.git.geert+renesas@glider.be>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <26519be2a2fdd4c6741658144e3a8d78cf4d000b.1653042202.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 5/20/22 19:24, Geert Uytterhoeven wrote:
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the sifive driver:
> 
>     gpio gpiochip1: (38001000.gpio-controller): not an immutable chip, please consider fixing it!
> 
> Fix this by making the irqchip in the sifive driver immutable.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against gpio/for-next.
> Boot-tested on SiPEED MAiXBiT (Canaan K210).
> 
> v2:
>   - Factor out hwirq using preferred helper.
> ---
>  drivers/gpio/gpio-sifive.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 03b8c4de2e91e3c4..238f3210970cfa0e 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -75,10 +75,12 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>  	struct sifive_gpio *chip = gpiochip_get_data(gc);
> -	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +	int offset = hwirq % SIFIVE_GPIO_MAX;
>  	u32 bit = BIT(offset);
>  	unsigned long flags;
>  
> +	gpiochip_enable_irq(gc, hwirq);
>  	irq_chip_enable_parent(d);
>  
>  	/* Switch to input */
> @@ -101,11 +103,13 @@ static void sifive_gpio_irq_disable(struct irq_data *d)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>  	struct sifive_gpio *chip = gpiochip_get_data(gc);
> -	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +	int offset = hwirq % SIFIVE_GPIO_MAX;
>  
>  	assign_bit(offset, &chip->irq_state, 0);
>  	sifive_gpio_set_ie(chip, offset);
>  	irq_chip_disable_parent(d);
> +	gpiochip_disable_irq(gc, hwirq);
>  }
>  
>  static void sifive_gpio_irq_eoi(struct irq_data *d)
> @@ -137,7 +141,7 @@ static int sifive_gpio_irq_set_affinity(struct irq_data *data,
>  	return -EINVAL;
>  }
>  
> -static struct irq_chip sifive_gpio_irqchip = {
> +static const struct irq_chip sifive_gpio_irqchip = {
>  	.name		= "sifive-gpio",
>  	.irq_set_type	= sifive_gpio_irq_set_type,
>  	.irq_mask	= irq_chip_mask_parent,
> @@ -146,6 +150,8 @@ static struct irq_chip sifive_gpio_irqchip = {
>  	.irq_disable	= sifive_gpio_irq_disable,
>  	.irq_eoi	= sifive_gpio_irq_eoi,
>  	.irq_set_affinity = sifive_gpio_irq_set_affinity,
> +	.flags		= IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>  
>  static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> @@ -242,7 +248,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>  	chip->gc.parent = dev;
>  	chip->gc.owner = THIS_MODULE;
>  	girq = &chip->gc.irq;
> -	girq->chip = &sifive_gpio_irqchip;
> +	gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
>  	girq->fwnode = of_node_to_fwnode(node);
>  	girq->parent_domain = parent;
>  	girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research
