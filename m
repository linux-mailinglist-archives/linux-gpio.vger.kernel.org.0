Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A24007C39E
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 15:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfGaNc4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 09:32:56 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:12856 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbfGaNc4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 09:32:56 -0400
X-Greylist: delayed 370 seconds by postgrey-1.27 at vger.kernel.org; Wed, 31 Jul 2019 09:32:55 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1564579974;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=eeI4gZnZJZGldPPL3mXWdDeu3cB5xDQVHRkJ30tNC3Q=;
        b=rRLGobIy8l99Jd8WkGRriVwbLmzZ+QNIuF6gA8CC0lEpcyGCbUJP+NALDR9vtUIm0l
        DqsdO6Gfg37vD+pyg8TUySSN96WU8S5Eg5MPDash7Ndory9YIY9+gCOxe2j2oAlawvYZ
        5EVGlwR4aVa1UySutCA0zneVkeiKiJImp9yNacBuwVAdz7uhz+8iUxlrwc4VSLqhWzn7
        iJkaTKszc4ifpiE6/4U1pvraw3HXfmdPYSTdWwQknKeLtNpVpqbmF80GwBQd3p7Y+a/c
        aiEgrdC+EUbBpnBlsuDZSJ+jPy5AvRKQAFdLfpnBL+RAYP6zMxxz0/rFm4XmHuIsFnXS
        DIjw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.24 AUTH)
        with ESMTPSA id h0a328v6VDQiZRz
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 31 Jul 2019 15:26:44 +0200 (CEST)
Date:   Wed, 31 Jul 2019 15:26:44 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Message-ID: <404802328.319002.1564579604675@webmail.strato.com>
In-Reply-To: <20190731132406.17381-1-geert+renesas@glider.be>
References: <20190731132406.17381-1-geert+renesas@glider.be>
Subject: Re: [PATCH] pinctrl: sh-pfc: Use dev_notice_once() instead of
 open-coding
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.10.1-Rev16
X-Originating-IP: 85.212.153.30
X-Originating-Client: open-xchange-appsuite
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> On July 31, 2019 at 3:24 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> At the time of commit 9a643c9a11259955 ("sh-pfc: Convert message
> printing from pr_* to dev_*"), the dev_*_once() variants didn't exist
> yet, so the once behavior was open-coded.
> 
> Since commit e135303bd5bebcd2 ("device: Add dev_<level>_once variants")
> they do, so "revert" to the good practice of using a helper.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in sh-pfc-for-v5.4.
> 
>  drivers/pinctrl/sh-pfc/gpio.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
> index 97c1332c1045739a..64c09aa374ae011f 100644
> --- a/drivers/pinctrl/sh-pfc/gpio.c
> +++ b/drivers/pinctrl/sh-pfc/gpio.c
> @@ -255,18 +255,13 @@ static int gpio_pin_setup(struct sh_pfc_chip *chip)
>  #ifdef CONFIG_PINCTRL_SH_FUNC_GPIO
>  static int gpio_function_request(struct gpio_chip *gc, unsigned offset)
>  {
> -	static bool __print_once;
>  	struct sh_pfc *pfc = gpio_to_pfc(gc);
>  	unsigned int mark = pfc->info->func_gpios[offset].enum_id;
>  	unsigned long flags;
>  	int ret;
>  
> -	if (!__print_once) {
> -		dev_notice(pfc->dev,
> -			   "Use of GPIO API for function requests is deprecated."
> -			   " Convert to pinctrl\n");
> -		__print_once = true;
> -	}
> +	dev_notice_once(pfc->dev,
> +			"Use of GPIO API for function requests is deprecated, convert to pinctrl\n");
>  
>  	if (mark == 0)
>  		return -EINVAL;
> -- 
> 2.17.1

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli

>
