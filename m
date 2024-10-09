Return-Path: <linux-gpio+bounces-11095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 723E79961F8
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 10:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94A3D1C23396
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 08:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F39187FEB;
	Wed,  9 Oct 2024 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TVlYCyaR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E0A184528
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 08:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728461491; cv=none; b=uNzOkyJR1p0P1FSjxlu2I92qXkXqcX4tGOHUSgNUDu6d4lxUu1+MImg14nt3J88Oz8Yv6tEKpQpQvukZFbGdfSeAHAoNLaXCCEoWX7kVN21h9erS8FK5U2YhUzd/r/EvyvOx7qt5V1zLnTiwxGG1syEreIwcZZACKo1tOpwoUIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728461491; c=relaxed/simple;
	bh=uFkIJCmEHXFuGBYu8C7qbff+MFNDNAcB5CCG3QjJj8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4O49LDMviOm1Q66W/FruFnVvX94p1g2Ca0/hIzXEJSyfb5F8V4KCJICa5nll7ON+MWAFxMx+Ku6e9k38Q6bAOCQ5o09Ca8l2vD0lz+lE1UWZf4KsMcEqpo7lPiXE22+cQjhdxhrNA5RtO2QjhLIaFpX+hC1oQP20JDpUSCRud4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TVlYCyaR; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a99543ab209so401204166b.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 01:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1728461488; x=1729066288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbRJKAa8Db7miijxCfbPNlNKjyHa9eXLPD3ZC1KS7p0=;
        b=TVlYCyaRjTexbcvIsyfCH8STycGt005yiiWtjCQ4Gz54FMxcIB/RoHG37U72RY4XML
         oTQzn7DSwRJPqjZwuELZ37pPpWgrwUQA6Zu3fVdTHeVEF7yYNSecqHg/Oc/G2zJAiNY2
         Q6GMZCZzBk2dW53Sb2baDJtj0l0LWtht3m3P4zSKq0mUQu+o+CMsIDmfZ+KLRVYBeA42
         XoJkzIKs/tCME37szeEP6Kpb7Qv9bcPcNaOQ1z/m7f5qFbit/JnDNl8qRB2+jBn341Jz
         L8pOiodTAsMZfgAPma9/ZfzITI0IkOrvwtG+7mDb6RLEbCNlLQEg83kJewOPDyATUhW/
         5/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728461488; x=1729066288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbRJKAa8Db7miijxCfbPNlNKjyHa9eXLPD3ZC1KS7p0=;
        b=ZjsevpDTXBkPBE0YvLjmLd4V+XBiLA8gX4h1Y0vil1Dv6Xwcpjw/8SrvoicOUJPIZf
         5UumY30z/0EaCKTQUSnNbC8Xc7R9sKLrazP33va1Q0Y1MzdiB/yQrbXhtTM7QOBu3tbq
         KK5Du7QoQ3xhog/q0PKxwMNiGYSSmnskNUn3dBaV5c/D6FikHz8I0k6OYLlRjTG5zMeX
         cTThlSkwPmQQ6oA9jkgvtafdsuUEDsLe1PdA1rv+DkbzD368xEx+Q8m0HAG2Lxx9dIug
         IUcO1K7ObjHGk8ZIzwmuNFoBDuNALx9RbrsMf8XPFEXG7r/0J5FE7QcfzhhoH4ZuGNGh
         PdPg==
X-Gm-Message-State: AOJu0YwAhZybmsv1xy2SmqbZn+U0sKLcMY01I0cxxtEP1dKRHcyDbAyd
	WeTohmEp9ajPeCqSkeE5F4ny0Hg4m8qAG0BKyJGWImuuOCiKu1tGEQEV7kzq+X0=
X-Google-Smtp-Source: AGHT+IFi+kq5mbi2fyjEQUlOIPw0e4a1jwgaju6x57/KbakaFKYMNz/FU2pJttoym1jAaVJ9UMyz7Q==
X-Received: by 2002:a17:907:60ce:b0:a99:50b8:9a10 with SMTP id a640c23a62f3a-a998d3301b8mr99613766b.64.1728461487610;
        Wed, 09 Oct 2024 01:11:27 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994a8da5d3sm470893966b.134.2024.10.09.01.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 01:11:27 -0700 (PDT)
Message-ID: <7fe863c8-b883-45b0-b0e9-e376764d0bb7@tuxon.dev>
Date: Wed, 9 Oct 2024 11:11:25 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Always call rzg2l_gpio_request()
 for interrupt pins
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241003131642.472298-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241003131642.472298-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Prabhakar,

On 03.10.2024 16:16, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Ensure that rzg2l_gpio_request() is called for GPIO pins configured as
> interrupts, regardless of whether they are muxed in u-boot. This
> guarantees that the pinctrl core is aware of the GPIO pin usage via
> pinctrl_gpio_request(), which is invoked through rzg2l_gpio_request().
> 
> Fixes: 2fd4fe19d0150 ("pinctrl: renesas: rzg2l: Configure interrupt input mode")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Output before this patch on G2L/SMARC:
> root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-pins | grep P2_1
> pin 17 (P2_1): UNCLAIMED
> 
> Output after this patch G2L/SMARC:
> root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-pins | grep P2_1
> pin 17 (P2_1): GPIO 11030000.pinctrl:529
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 60ef20ca3ccf..1dceaf8290ea 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -2368,20 +2368,11 @@ static const struct irq_chip rzg2l_gpio_irqchip = {
>  
>  static int rzg2l_gpio_interrupt_input_mode(struct gpio_chip *chip, unsigned int offset)
>  {
> -	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
> -	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[offset];
> -	u64 *pin_data = pin_desc->drv_data;
> -	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
> -	u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
> -	u8 reg8;
>  	int ret;
>  
> -	reg8 = readb(pctrl->base + PMC(off));
> -	if (reg8 & BIT(bit)) {
> -		ret = rzg2l_gpio_request(chip, offset);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = rzg2l_gpio_request(chip, offset);
> +	if (ret)
> +		return ret;
>  

With this approach I'm getting the following on RZ/G3S SMARC Carrier II board:

[    0.368129] pinctrl-rzg2l 11030000.pinctrl: pinctrl-rzg2l support registered
[    0.390426] 1004b800.serial: ttySC0 at MMIO 0x1004b800 (irq = 42,
base_baud = 0) is a scif
[    0.390558] printk: legacy console [ttySC0] enabled
[    1.601991] pinctrl-rzg2l 11030000.pinctrl: pin P12_0 already requested
by 11030000.pinctrl:608; cannot claim for 11030000.pinctrl:608
[    1.614208] pinctrl-rzg2l 11030000.pinctrl: error -EINVAL: pin-96
(11030000.pinctrl:608)
[    1.622313] gpio gpiochip0: (11030000.pinctrl): can't look up hwirq 96
[    1.631801] ravb 11c30000.ethernet eth0: Base address at 0x11c30000,
d2:7b:7f:8f:d8:52, IRQ 46.
[    1.645752] pinctrl-rzg2l 11030000.pinctrl: pin P12_1 already requested
by 11030000.pinctrl:609; cannot claim for 11030000.pinctrl:609
[    1.657923] pinctrl-rzg2l 11030000.pinctrl: error -EINVAL: pin-97
(11030000.pinctrl:609)
[    1.666035] gpio gpiochip0: (11030000.pinctrl): can't look up hwirq 97
[    1.675573] ravb 11c40000.ethernet eth1: Base address at 0x11c40000,
d2:7b:7f:8f:d8:52, IRQ 47.
[    1.700907] pinctrl-rzg2l 11030000.pinctrl: pin P18_0 already requested
by 11030000.pinctrl:656; cannot claim for 11030000.pinctrl:656
[    1.713272] pinctrl-rzg2l 11030000.pinctrl: error -EINVAL: pin-144
(11030000.pinctrl:656)
[    1.721496] gpio gpiochip0: (11030000.pinctrl): can't look up hwirq 144
[    1.729209] pinctrl-rzg2l 11030000.pinctrl: pin P0_1 already requested
by 11030000.pinctrl:513; cannot claim for 11030000.pinctrl:513
[    1.741345] pinctrl-rzg2l 11030000.pinctrl: error -EINVAL: pin-1
(11030000.pinctrl:513)
[    1.749432] gpio gpiochip0: (11030000.pinctrl): can't look up hwirq 1
[    1.756285] pinctrl-rzg2l 11030000.pinctrl: pin P0_3 already requested
by 11030000.pinctrl:515; cannot claim for 11030000.pinctrl:515
[    1.768475] pinctrl-rzg2l 11030000.pinctrl: error -EINVAL: pin-3
(11030000.pinctrl:515)
[    1.776524] gpio gpiochip0: (11030000.pinctrl): can't look up hwirq 3
[    1.783124] gpio-keys keys: Found button without gpio or irq
[    1.788851] renesas_sdhi_internal_dmac 11c00000.mmc: mmc0 base at
0x0000000011c00000, max clock rate 125 MHz
[    1.798791] gpio-keys keys: probe with driver gpio-keys failed with
error -22


All these ports are hogs to configure them as input. Removing the hog
property make this patch work but I'm not sure this is the right approach
(see below diff).

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 71424e69939e..6e95933cd7ef 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -196,15 +196,6 @@ &sdhi2 {
 #endif

 &pinctrl {
-#if SW_CONFIG3 == SW_ON
-       eth0-phy-irq-hog {
-               gpio-hog;
-               gpios = <RZG2L_GPIO(12, 0) GPIO_ACTIVE_LOW>;
-               input;
-               line-name = "eth0-phy-irq";
-       };
-#endif
-
        eth0_pins: eth0 {
                txc {
                        pinmux = <RZG2L_PORT_PINMUX(1, 0, 1)>;  /* ET0_TXC */
@@ -239,15 +230,6 @@ mux {
                };
        };

-#if SW_CONFIG3 == SW_ON
-       eth1-phy-irq-hog {
-               gpio-hog;
-               gpios = <RZG2L_GPIO(12, 1) GPIO_ACTIVE_LOW>;
-               input;
-               line-name = "eth1-phy-irq";
-       };
-#endif
-
        eth1_pins: eth1 {
                txc {
                        pinmux = <RZG2L_PORT_PINMUX(7, 0, 1)>;  /* ET1_TXC */
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 4509151344c4..9dd313f6f8c2 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -71,26 +71,6 @@ &i2c0 {
 };

 &pinctrl {
-       key-1-gpio-hog {
-               gpio-hog;
-               gpios = <RZG2L_GPIO(18, 0) GPIO_ACTIVE_LOW>;
-               input;
-               line-name = "key-1-gpio-irq";
-       };
-
-       key-2-gpio-hog {
-               gpio-hog;
-               gpios = <RZG2L_GPIO(0, 1) GPIO_ACTIVE_LOW>;
-               input;
-               line-name = "key-2-gpio-irq";
-       };
-
-       key-3-gpio-hog {
-               gpio-hog;
-               gpios = <RZG2L_GPIO(0, 3) GPIO_ACTIVE_LOW>;
-               input;
-               line-name = "key-3-gpio-irq";
-       };

        scif0_pins: scif0 {
                pinmux = <RZG2L_PORT_PINMUX(6, 3, 1)>, /* RXD */


>  	return rzg2l_gpio_direction_input(chip, offset);
>  }

