Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20FBAC878F
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 13:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfJBLtt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 07:49:49 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25502 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfJBLtt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 07:49:49 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570016976; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=LBch/wz5i394L5o18V5AI7R9hLkEzpG0wNWiJqD6FLu/cmkjmxE7W6tO344De5MamRfYR1lUKZ1YcKvHlhh/R+VepDR3vFTyfO+cUffG8vt+3a1fgr71HufZ5xsu2ekj7lp+YUmg74UF9kNzwMdTlevqWqGIU2Y6itsYm3k0jcA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570016976; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=ox92V9Adzorjx0tQrqc3RRslx2hsZpMbg8dujiDq1WE=; 
        b=WLPti2tcn0SPN7YMFFawCIw03VmLhtel2ezlj2JLy66oxzx+NXuvKz0BL21hW8R6BkOAfQEVuczDms+eo+2ScQzhlwgPJgY2/wrAEcNnHMG5Q0mF+cJ8aLqxyktNB2fTRFmnb57RDPkKfHkWyhDxFJzw4wg+4s/330owDrH1xgY=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=S7A5gEUQHZzrEscYNjA5e/IryV7r7IWv6Rz5N5Wr/5RMXngvwOXCV17BLRAT7B/L9k6SXOtYXed4
    sG96VbCcNWFGQ0BLgWtfRYsCoyRBKX5R2Mk8XdzbQ2Q40BypEaHV  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570016976;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=2536; bh=ox92V9Adzorjx0tQrqc3RRslx2hsZpMbg8dujiDq1WE=;
        b=KwvfWHWWbAacHHBfNKiujkaYdP8aQGPzmSRcnmdp/DoxGGivvxb5ZSqiiGsmQgL3
        9rz8EOLdCSe2Q2TLXlgNsdnsFiL4xdy8ZTLgz7SlA14airq+qpWNVSoXae49K/NHp53
        DiYW36cUScw2u0fq8XHzfAqqfWWJWJ8uoGkDm6do=
Received: from [192.168.88.140] (171.221.113.164 [171.221.113.164]) by mx.zohomail.com
        with SMTPS id 1570016975340643.5907458374162; Wed, 2 Oct 2019 04:49:35 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: ingenic: Pass irqchip when adding gpiochip
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
References: <20191001133209.17164-1-linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thierry Reding <thierry.reding@gmail.com>
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5D948ECE.2050007@zoho.com>
Date:   Wed, 2 Oct 2019 19:49:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20191001133209.17164-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2019=E5=B9=B410=E6=9C=8801=E6=97=A5 21:32, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
>
> For chained irqchips this is a pretty straight-forward
> conversion.

Acked-by: Zhou Yanjie <zhouyanjie@zoho.com>

>
> Cc: Zhou Yanjie <zhouyanjie@zoho.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/pinctrl/pinctrl-ingenic.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-=
ingenic.c
> index 6e2683016c1f..06cae38f6daf 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -1940,6 +1940,7 @@ static int __init ingenic_gpio_probe(struct ingenic=
_pinctrl *jzpc,
>   {
>   =09struct ingenic_gpio_chip *jzgc;
>   =09struct device *dev =3D jzpc->dev;
> +=09struct gpio_irq_chip *girq;
>   =09unsigned int bank;
>   =09int err;
>  =20
> @@ -1982,10 +1983,6 @@ static int __init ingenic_gpio_probe(struct ingeni=
c_pinctrl *jzpc,
>   =09=09jzgc->gc.free =3D gpiochip_generic_free;
>   =09}
>  =20
> -=09err =3D devm_gpiochip_add_data(dev, &jzgc->gc, jzgc);
> -=09if (err)
> -=09=09return err;
> -
>   =09jzgc->irq =3D irq_of_parse_and_map(node, 0);
>   =09if (!jzgc->irq)
>   =09=09return -EINVAL;
> @@ -2000,13 +1997,22 @@ static int __init ingenic_gpio_probe(struct ingen=
ic_pinctrl *jzpc,
>   =09jzgc->irq_chip.irq_set_wake =3D ingenic_gpio_irq_set_wake;
>   =09jzgc->irq_chip.flags =3D IRQCHIP_MASK_ON_SUSPEND;
>  =20
> -=09err =3D gpiochip_irqchip_add(&jzgc->gc, &jzgc->irq_chip, 0,
> -=09=09=09handle_level_irq, IRQ_TYPE_NONE);
> +=09girq =3D &jzgc->gc.irq;
> +=09girq->chip =3D &jzgc->irq_chip;
> +=09girq->parent_handler =3D ingenic_gpio_irq_handler;
> +=09girq->num_parents =3D 1;
> +=09girq->parents =3D devm_kcalloc(dev, 1, sizeof(*girq->parents),
> +=09=09=09=09     GFP_KERNEL);
> +=09if (!girq->parents)
> +=09=09return -ENOMEM;
> +=09girq->parents[0] =3D jzgc->irq;
> +=09girq->default_type =3D IRQ_TYPE_NONE;
> +=09girq->handler =3D handle_level_irq;
> +
> +=09err =3D devm_gpiochip_add_data(dev, &jzgc->gc, jzgc);
>   =09if (err)
>   =09=09return err;
>  =20
> -=09gpiochip_set_chained_irqchip(&jzgc->gc, &jzgc->irq_chip,
> -=09=09=09jzgc->irq, ingenic_gpio_irq_handler);
>   =09return 0;
>   }
>  =20



