Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7A83B2CB3
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 21:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729652AbfINTgm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 14 Sep 2019 15:36:42 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:17163 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729470AbfINTgl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Sep 2019 15:36:41 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: keNpXfLXUMoDMxEwDXkh1mbph9oViuJ4JrpXrJ1xCqVup2vET7FDtb/AgXnpGSP8bhWt3hK3ED
 M2ecOs3Uzbx/jrAqI0h1XFbDiPrHDVi8jLp9RRSbdUNcbC7kgoF5pTk5/7Rn1v81U5Y5pPPJGw
 4VrpogipfA5ZH0fLogMBvjEhSyttU5D5yM0YDXpik8iBIcZjBJ/QkWKiT6eQUu/I0uYCaDVJsB
 QDupPgUqYtqi8/8L9NJRY2wtZzdem1JzD05xhgGXzZWgO8+O8CZ9yp5WBa1pumUaMXN77ZBc4Z
 29E=
X-IronPort-AV: E=Sophos;i="5.64,506,1559545200"; 
   d="scan'208";a="49099072"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Sep 2019 12:36:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 14 Sep 2019 12:36:41 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 14 Sep 2019 12:36:40 -0700
Date:   Sat, 14 Sep 2019 21:36:40 +0200
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: at91-pio4: implement .get_multiple and
 .set_multiple
Message-ID: <20190914193640.rukypixp6t54fwfc@sekiro>
Mail-Followup-To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20190905141304.22005-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190905141304.22005-1-alexandre.belloni@bootlin.com>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 05, 2019 at 04:13:04PM +0200, Alexandre Belloni wrote:
> 
> Implement .get_multiple and .set_multiple to allow reading or setting
> multiple pins simultaneously. Pins in the same bank will all be switched at
> the same time, improving synchronization and performances.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thanks for this improvement. You can keep my ack for v3 as the changes
should be the commit message only. I'll be off for three weeks.

Regards

Ludovic

> ---
>  drivers/pinctrl/pinctrl-at91-pio4.c | 60 +++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
> index d6de4d360cd4..488a302a60d4 100644
> --- a/drivers/pinctrl/pinctrl-at91-pio4.c
> +++ b/drivers/pinctrl/pinctrl-at91-pio4.c
> @@ -328,6 +328,35 @@ static int atmel_gpio_get(struct gpio_chip *chip, unsigned offset)
>  	return !!(reg & BIT(pin->line));
>  }
>  
> +static int atmel_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
> +				   unsigned long *bits)
> +{
> +	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
> +	unsigned int bank;
> +
> +	bitmap_zero(bits, atmel_pioctrl->npins);
> +
> +	for (bank = 0; bank < atmel_pioctrl->nbanks; bank++) {
> +		unsigned int word = bank;
> +		unsigned int offset = 0;
> +		unsigned int reg;
> +
> +#if ATMEL_PIO_NPINS_PER_BANK != BITS_PER_LONG
> +		word = BIT_WORD(bank * ATMEL_PIO_NPINS_PER_BANK);
> +		offset = bank * ATMEL_PIO_NPINS_PER_BANK % BITS_PER_LONG;
> +#endif
> +		if (!mask[word])
> +			continue;
> +
> +		reg = atmel_gpio_read(atmel_pioctrl, bank, ATMEL_PIO_PDSR);
> +		bits[word] |= mask[word] & (reg << offset);
> +
> +		pr_err("ABE: %d %08x\n", bank, bits[word]);
> +	}
> +
> +	return 0;
> +}
> +
>  static int atmel_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
>  				       int value)
>  {
> @@ -358,11 +387,42 @@ static void atmel_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
>  			 BIT(pin->line));
>  }
>  
> +static void atmel_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
> +				    unsigned long *bits)
> +{
> +	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
> +	unsigned int bank;
> +
> +	for (bank = 0; bank < atmel_pioctrl->nbanks; bank++) {
> +		unsigned int bitmask;
> +		unsigned int word = bank;
> +
> +#if ATMEL_PIO_NPINS_PER_BANK != BITS_PER_LONG
> +		word = BIT_WORD(bank * ATMEL_PIO_NPINS_PER_BANK);
> +#endif
> +		if (!mask[word])
> +			continue;
> +
> +		bitmask = mask[word] & bits[word];
> +		atmel_gpio_write(atmel_pioctrl, bank, ATMEL_PIO_SODR, bitmask);
> +
> +		bitmask = mask[word] & ~bits[word];
> +		atmel_gpio_write(atmel_pioctrl, bank, ATMEL_PIO_CODR, bitmask);
> +
> +#if ATMEL_PIO_NPINS_PER_BANK != BITS_PER_LONG
> +		mask[word] >>= ATMEL_PIO_NPINS_PER_BANK;
> +		bits[word] >>= ATMEL_PIO_NPINS_PER_BANK;
> +#endif
> +	}
> +}
> +
>  static struct gpio_chip atmel_gpio_chip = {
>  	.direction_input        = atmel_gpio_direction_input,
>  	.get                    = atmel_gpio_get,
> +	.get_multiple           = atmel_gpio_get_multiple,
>  	.direction_output       = atmel_gpio_direction_output,
>  	.set                    = atmel_gpio_set,
> +	.set_multiple           = atmel_gpio_set_multiple,
>  	.to_irq                 = atmel_gpio_to_irq,
>  	.base                   = 0,
>  };
> -- 
> 2.21.0
> 
> 
