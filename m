Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D31952F64B
	for <lists+linux-gpio@lfdr.de>; Sat, 21 May 2022 01:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235829AbiETXlF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 19:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354147AbiETXlD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 19:41:03 -0400
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B0D1E3E2
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 16:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1653090060; x=1684626060;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Nt1uwXYF46z/v40XD4nqkQwRmMJ/b7kCvc76K9BQryE=;
  b=NCEtJzmLLJ3gmfQTRUL643mzEVsZJFe8yEs7uMZDVs9Fztz10Nrdk25f
   7QMzcLPaC2W6BEqlLl9P98lQAunh4I6c7mqfrZfu/GKTrNO50c/PnRq3E
   JuNGP78Y4hQwbJ77zUKjhuKGJXUr2c1WxBH9OElUuNSPCpRxL/Ih9hlVM
   MqPKCOjtXUQixr0NW+Ky17bSC4jew3f7L4+Wn0A2VMORV1lwdaQYVhGSz
   4MC4G1iElW+uNV1MmrcNsNABxwHRAJ5ZcGfkqqPQmhW2vqawcqY8qaTGT
   dDLSfhZlNI6GA4R0gX22dKRoP19rEg+nmXREy3DN3kvyTtIzs+1dn4LqE
   g==;
X-IronPort-AV: E=Sophos;i="5.91,240,1647273600"; 
   d="scan'208";a="312942069"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 21 May 2022 07:40:59 +0800
IronPort-SDR: CyCI/L24THLX+2bEmktVClFRioBeMVndXDwZl29mgrUhO0JH8hprCuqHEivDIUxyYqPM5WUcT2
 GeBocG+61Myk+SaCtDIefB1Dpcvt0UbKFRlkWvKxe5uQBfXWN1GLc+sXc+9ODHreojPyqDoVLh
 VxOdRnCtBSIoLjEkhw3rF0c0PW7K2diMk/lyy8BmYnR+rb15UKPAHCd8KOwtTm+ImxMd5UkYyX
 WRFcNTcjNtbTz2HFJMwE3OVgrsXo1Zb4HKPanbMfHr+VymyIeTqPURRMS098TK7OP7RocaB2Px
 duYxo0NfVfsNkuLoMqviv86s
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2022 16:06:21 -0700
IronPort-SDR: xfSxSQVD6Xknw9SKzREP7DoiyfITzGkg08B6XfbknKOW87hnR/jTdro9vG3VROMza4LoGCUjMV
 ndSk/MbIAdp7uCGJFtK/ZYIe/cFqDcWwf4jSId2bDX6ruyF1myYh11Q8P8jtRV9PNT7s2qA2DJ
 3uZ3mkAsVjN4AWPPkh4WfMsq/rt9/hU+VNjFK13ULX6vQqByDugHykS2BT5sUrAk4mJ2x/vB7W
 knxGijbR7LWQy9BPWra5SAklrA/+usqUCjAkBZbJF2HgMTTaK39tX/8skWSF2ItnI/lraRiBNk
 Ftc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2022 16:41:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L4jsR34SXz1SVp1
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 16:40:59 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1653090058; x=1655682059; bh=Nt1uwXYF46z/v40XD4nqkQwRmMJ/b7kCvc7
        6K9BQryE=; b=jFj9Vb7mjvbkGd+qO7do6l7OhOv6bwhQ+InRCPDR0v3t9RB1AlY
        koAhowfvZWUbAYMsOs3lKo2MkqQyG6niLlHOHb26hqhGuDOkS1qGC0RoayGgfWvb
        v4T6X6dNnJFnvnu34/yaxXZ5eE/zzgq15RtzMFKwu9TGWlXUfxeTSeqHqKmHx10M
        OkNQ765CsWvZ7a0RELD8l6CcWxoAq3UNupu559py1FthOxCBeregq2kTURA0NwKV
        r1cI0qYffbs9dFkVc1tZlk1EOsinEVyJ5KpCn6jQ860/dpldubC2snEl4cew8++A
        MAVCkxMlp7iw/AbHFlqOtVt0D1oVK9d9LvQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id tVBk-ZmdAtiB for <linux-gpio@vger.kernel.org>;
        Fri, 20 May 2022 16:40:58 -0700 (PDT)
Received: from [10.225.163.51] (unknown [10.225.163.51])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L4jsN72n1z1Rvlc;
        Fri, 20 May 2022 16:40:56 -0700 (PDT)
Message-ID: <93d0095e-eced-0310-6ca4-a559db79d1d5@opensource.wdc.com>
Date:   Sat, 21 May 2022 08:40:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] gpio: dwapb: Make the irqchip immutable
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
References: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
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

On 5/20/22 19:23, Geert Uytterhoeven wrote:
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the dwapb driver:
> 
>     gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!
> 
> Fix this by making the irqchip in the dwapb driver immutable.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against gpio/for-next.
> Boot-tested on SiPEED MAiXBiT (Canaan K210).

FYI, fully fixed userspace is available here:

git@github.com:damien-lemoal/buildroot.git
branch: k210-v16

Need some patch commit message cleanup and I will post that to buildroot list.

> 
> v2:
>   - Factor out hwirq using preferred helper.
> ---
>  drivers/gpio/gpio-dwapb.c | 38 ++++++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 7130195da48d75dd..04afe728e18748df 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -95,7 +95,6 @@ struct dwapb_context {
>  #endif
>  
>  struct dwapb_gpio_port_irqchip {
> -	struct irq_chip		irqchip;
>  	unsigned int		nr_irqs;
>  	unsigned int		irq[DWAPB_MAX_GPIOS];
>  };
> @@ -252,24 +251,30 @@ static void dwapb_irq_mask(struct irq_data *d)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>  	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
>  	unsigned long flags;
>  	u32 val;
>  
>  	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(irqd_to_hwirq(d));
> +	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(hwirq);
>  	dwapb_write(gpio, GPIO_INTMASK, val);
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	gpiochip_disable_irq(gc, hwirq);
>  }
>  
>  static void dwapb_irq_unmask(struct irq_data *d)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>  	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
>  	unsigned long flags;
>  	u32 val;
>  
> +	gpiochip_enable_irq(gc, hwirq);
> +
>  	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(irqd_to_hwirq(d));
> +	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(hwirq);
>  	dwapb_write(gpio, GPIO_INTMASK, val);
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
> @@ -364,8 +369,23 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
>  
>  	return 0;
>  }
> +#else
> +#define dwapb_irq_set_wake	NULL
>  #endif
>  
> +static const struct irq_chip dwapb_irq_chip = {
> +	.name		= DWAPB_DRIVER_NAME,
> +	.irq_ack	= dwapb_irq_ack,
> +	.irq_mask	= dwapb_irq_mask,
> +	.irq_unmask	= dwapb_irq_unmask,
> +	.irq_set_type	= dwapb_irq_set_type,
> +	.irq_enable	= dwapb_irq_enable,
> +	.irq_disable	= dwapb_irq_disable,
> +	.irq_set_wake	= dwapb_irq_set_wake,
> +	.flags		= IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
>  static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
>  				   unsigned offset, unsigned debounce)
>  {
> @@ -439,16 +459,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  	girq->default_type = IRQ_TYPE_NONE;
>  
>  	port->pirq = pirq;
> -	pirq->irqchip.name = DWAPB_DRIVER_NAME;
> -	pirq->irqchip.irq_ack = dwapb_irq_ack;
> -	pirq->irqchip.irq_mask = dwapb_irq_mask;
> -	pirq->irqchip.irq_unmask = dwapb_irq_unmask;
> -	pirq->irqchip.irq_set_type = dwapb_irq_set_type;
> -	pirq->irqchip.irq_enable = dwapb_irq_enable;
> -	pirq->irqchip.irq_disable = dwapb_irq_disable;
> -#ifdef CONFIG_PM_SLEEP
> -	pirq->irqchip.irq_set_wake = dwapb_irq_set_wake;
> -#endif
>  
>  	/*
>  	 * Intel ACPI-based platforms mostly have the DesignWare APB GPIO
> @@ -475,7 +485,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  		girq->parent_handler = dwapb_irq_handler;
>  	}
>  
> -	girq->chip = &pirq->irqchip;
> +	gpio_irq_chip_set_chip(girq, &dwapb_irq_chip);
>  
>  	return;
>  

Looks OK to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research
