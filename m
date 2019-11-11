Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 071FBF6F2A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2019 08:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfKKHmW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Nov 2019 02:42:22 -0500
Received: from smtp.eckelmann.de ([217.19.183.80]:6068 "EHLO smtp.eckelmann.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726845AbfKKHmW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 Nov 2019 02:42:22 -0500
X-Greylist: delayed 902 seconds by postgrey-1.27 at vger.kernel.org; Mon, 11 Nov 2019 02:42:20 EST
Received: from ws067.eckelmann.group (2a00:1f08:4007:5c00:1a60:24ff:fe97:84c9)
 by EX-SRV2.eckelmann.group (2a00:1f08:4007:e035:172:18:35:5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Mon, 11 Nov 2019 08:27:16 +0100
Date:   Mon, 11 Nov 2019 08:27:15 +0100
From:   Thorsten Scherer <thorsten.scherer@eckelmann.de>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
CC:     <mazziesaccount@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 40/62] gpio: gpio-siox: Use new GPIO_LINE_DIRECTION
Message-ID: <20191111072715.GB4117@ws067.eckelmann.group>
References: <cover.1572945896.git.matti.vaittinen@fi.rohmeurope.com>
 <91a796dd2811b58f4be30875f5ef644f0e43f241.1572945896.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <91a796dd2811b58f4be30875f5ef644f0e43f241.1572945896.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: [2a00:1f08:4007:5c00:1a60:24ff:fe97:84c9]
X-ClientProxiedBy: EX-SRV2.eckelmann.group (2a00:1f08:4007:e035:172:18:35:5)
 To EX-SRV2.eckelmann.group (2a00:1f08:4007:e035:172:18:35:5)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On Tue, Nov 05, 2019 at 12:30:58PM +0200, Matti Vaittinen wrote:
> It's hard for occasional GPIO code reader/writer to know if values 0/1
> equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT to help them out.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

for SIOX gpio:

Acked-by: Thorsten Scherer <t.scherer@eckelmann.de>

> ---
>  drivers/gpio/gpio-siox.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
> index 006a7e6a75f2..311f66757b92 100644
> --- a/drivers/gpio/gpio-siox.c
> +++ b/drivers/gpio/gpio-siox.c
> @@ -203,9 +203,9 @@ static int gpio_siox_direction_output(struct gpio_chip *chip,
>  static int gpio_siox_get_direction(struct gpio_chip *chip, unsigned int offset)
>  {
>  	if (offset < 12)
> -		return 1; /* input */
> +		return GPIO_LINE_DIRECTION_IN;
>  	else
> -		return 0; /* output */
> +		return GPIO_LINE_DIRECTION_OUT;
>  }
>  
>  static int gpio_siox_probe(struct siox_device *sdevice)
> -- 
> 2.21.0
> 

> Quoted from
> [PATCH 00/62] Add definition for GPIO direction
> <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
>
> Patches are compile-tested only. I have no HW to really test them.  Thus
> I'd appreciate carefull review. This work is mainly about converting
> zeros and ones to the new defines but it wouldn't be first time I
> get it wrong in one of the patches :)                                                   

Applied the patch(es) and tested them with SIOX device

Tested-by: Thorsten Scherer <t.scherer@eckelmann.de>

> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 
