Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 045F46F715
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 04:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbfGVCFJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 22:05:09 -0400
Received: from anchovy1.45ru.net.au ([203.30.46.145]:58339 "EHLO
        anchovy1.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728572AbfGVCFJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 22:05:09 -0400
Received: (qmail 5710 invoked by uid 5089); 22 Jul 2019 02:05:06 -0000
Received: by simscan 1.2.0 ppid: 5644, pid: 5645, t: 0.0519s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy1.45ru.net.au with ESMTPA; 22 Jul 2019 02:05:05 -0000
Subject: Re: [PATCH 1/2] [PATCH] gpio: Replace usage of bare 'unsigned' with
 'unsigned int'
To:     Hennie Muller <hm@bitlabs.co.za>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190721125259.13990-1-hm@bitlabs.co.za>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <61045f29-73ca-cb62-ba6f-5b12970735a9@electromag.com.au>
Date:   Mon, 22 Jul 2019 10:05:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190721125259.13990-1-hm@bitlabs.co.za>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

G'day Hennie,

patch title should be:
gpio: viperboard: Replace usage of bare 'unsigned' with 'unsigned int'

On 21/07/2019 20:52, Hennie Muller wrote:
> Fixes a couple of warnings by checkpatch and sparse.
> 
> Signed-off-by: Hennie Muller <hm@bitlabs.co.za>
> ---
>   drivers/gpio/gpio-viperboard.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
> index 9b604f13e302..c301c1d56dd2 100644
> --- a/drivers/gpio/gpio-viperboard.c
> +++ b/drivers/gpio/gpio-viperboard.c
> @@ -79,7 +79,7 @@ MODULE_PARM_DESC(gpioa_freq,
>   /* ----- begin of gipo a chip -------------------------------------------- */
>   
>   static int vprbrd_gpioa_get(struct gpio_chip *chip,
> -		unsigned offset)
> +		unsigned int offset)

I've encountered these checkpatch warnings as well.

However 'struct gpio_chip' callbacks define the function signatures
as 'unsigned', not 'unsigned int'. So I've also left them as is, to explicitly
match the struct definition.

Be interested to know what the official take on this is.


>   {
>   	int ret, answer, error = 0;
>   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> @@ -129,7 +129,7 @@ static int vprbrd_gpioa_get(struct gpio_chip *chip,
>   }
>   
>   static void vprbrd_gpioa_set(struct gpio_chip *chip,
> -		unsigned offset, int value)
> +		unsigned int offset, int value)
>   {
>   	int ret;
>   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> @@ -170,7 +170,7 @@ static void vprbrd_gpioa_set(struct gpio_chip *chip,
>   }
>   
>   static int vprbrd_gpioa_direction_input(struct gpio_chip *chip,
> -			unsigned offset)
> +			unsigned int offset)
>   {
>   	int ret;
>   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> @@ -207,7 +207,7 @@ static int vprbrd_gpioa_direction_input(struct gpio_chip *chip,
>   }
>   
>   static int vprbrd_gpioa_direction_output(struct gpio_chip *chip,
> -			unsigned offset, int value)
> +			unsigned int offset, int value)
>   {
>   	int ret;
>   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> @@ -251,8 +251,8 @@ static int vprbrd_gpioa_direction_output(struct gpio_chip *chip,
>   
>   /* ----- begin of gipo b chip -------------------------------------------- */
>   
> -static int vprbrd_gpiob_setdir(struct vprbrd *vb, unsigned offset,
> -	unsigned dir)
> +static int vprbrd_gpiob_setdir(struct vprbrd *vb, unsigned int offset,
> +	unsigned int dir)
>   {
>   	struct vprbrd_gpiob_msg *gbmsg = (struct vprbrd_gpiob_msg *)vb->buf;
>   	int ret;
> @@ -273,7 +273,7 @@ static int vprbrd_gpiob_setdir(struct vprbrd *vb, unsigned offset,
>   }
>   
>   static int vprbrd_gpiob_get(struct gpio_chip *chip,
> -		unsigned offset)
> +		unsigned int offset)
>   {
>   	int ret;
>   	u16 val;
> @@ -305,7 +305,7 @@ static int vprbrd_gpiob_get(struct gpio_chip *chip,
>   }
>   
>   static void vprbrd_gpiob_set(struct gpio_chip *chip,
> -		unsigned offset, int value)
> +		unsigned int offset, int value)
>   {
>   	int ret;
>   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> @@ -338,7 +338,7 @@ static void vprbrd_gpiob_set(struct gpio_chip *chip,
>   }
>   
>   static int vprbrd_gpiob_direction_input(struct gpio_chip *chip,
> -			unsigned offset)
> +			unsigned int offset)
>   {
>   	int ret;
>   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> @@ -359,7 +359,7 @@ static int vprbrd_gpiob_direction_input(struct gpio_chip *chip,
>   }
>   
>   static int vprbrd_gpiob_direction_output(struct gpio_chip *chip,
> -			unsigned offset, int value)
> +			unsigned int offset, int value)
>   {
>   	int ret;
>   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> 


-- 
Regards
Phil Reid
