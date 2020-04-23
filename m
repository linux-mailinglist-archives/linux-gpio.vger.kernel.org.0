Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67C91B583D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2020 11:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgDWJdP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Apr 2020 05:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgDWJdO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Apr 2020 05:33:14 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F84C03C1AF;
        Thu, 23 Apr 2020 02:33:14 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x25so5671767wmc.0;
        Thu, 23 Apr 2020 02:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ie8fd80pKQOw/4law6NwTSp7VLmg/W54peLA+cXfPAU=;
        b=U9L8z5YsVN10xsWQsxpWiPLnYbY4YpZLAcOeu2Vf6klussm+SSqTJ/dRhRuqObBmqa
         dzMrmnQIo2bBvYe4rIuHWMCZO/EmjDUXngmmFXgfWO8ZPP7aLdSm8lWGGC/lrb5rVp5T
         HxPqDjVlzspM5759e6HC2csaoGdLC6Ng657/FQG5nBDmwjQ5EWZfqJmjej0yBix2pgFw
         PlLO0/sAJVrGP6DSawa6PLBAyR3+bey6sAaFRVQ9MHEJ+7qsTrIcbOy9aFJlvhQXm5u5
         i2eTa73gCOqe8xY6LaDx47HcIKhRNF6wBPuke9fHiX9Z29p0FX2Q2gUBd4iyTWknpcrY
         vFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ie8fd80pKQOw/4law6NwTSp7VLmg/W54peLA+cXfPAU=;
        b=IAyjFC86/5E7/dB0d+XcUPDXrv3ev3IH5+RmWP1IMZ0g10rWhSrvHJhjTV6jtJJVAe
         3gw0fWSibxwj3xl8Lk329OBFLtWBYnYlgdHjaBt8wafyQdPoWrxG6J4MhmO7sL3EVyJh
         /Isre9sneEZo+kg5Vb3FU3md/jLkVhegBo0lu3fIQLadc32wK6BezZKSiVBCCSrJlzBb
         ezQxq7krrSNmco3CNEtsbHceusq2Zn5XM5YcTydK7JBcOpmXlOD9XX/DhB/1tMv2HSKe
         sT3Ss1ykDNHn0yMc5l+RIxKdUKSVmBvqtGaLclr+Y89cVDMnjT54nqpSuPE9IM1sVbbo
         x19g==
X-Gm-Message-State: AGi0PubBS7NbToMj2Lnr0KWvCLEwZSSeGltuyrlfvi1KEePO//RV+WUz
        +b5W3U6oQkhs9TzfseZJoOw=
X-Google-Smtp-Source: APiQypJn6Jo5bWNco1Dr1gsuy2tU1voc78b4d3AIYUCxtjdbTyeq+uU1kCe7feQnwy3TWyUwgYyTcg==
X-Received: by 2002:a7b:c931:: with SMTP id h17mr3317560wml.105.1587634392908;
        Thu, 23 Apr 2020 02:33:12 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id m15sm2748741wmc.35.2020.04.23.02.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 02:33:12 -0700 (PDT)
Subject: Re: [PATCH QEMU v2 4/5] ARM: PL061: Add gpiodev support
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alexander Graf <graf@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20200423090118.11199-1-geert+renesas@glider.be>
 <20200423090118.11199-5-geert+renesas@glider.be>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <520d1d07-7530-e133-af6e-a8b4615829b8@amsat.org>
Date:   Thu, 23 Apr 2020 11:33:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200423090118.11199-5-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 4/23/20 11:01 AM, Geert Uytterhoeven wrote:
> Make the PL061 GPIO controller user-creatable, and allow the user to tie
> a newly created instance to a gpiochip on the host.
> 
> To create a new GPIO controller, the QEMU command line must be augmented
> with:
> 
>     -device pl061,host=<gpiochip>
> 
> with <gpiochip> the name or label of the gpiochip on the host.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New.
> ---
>  hw/gpio/pl061.c | 35 +++++++++++++++++++++++++++++++++++
>  qemu-options.hx |  9 +++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> index 74ba733a8a5e8ca5..98204f9a586ae8c8 100644
> --- a/hw/gpio/pl061.c
> +++ b/hw/gpio/pl061.c
> @@ -12,11 +12,14 @@
>  #include "hw/arm/fdt.h"
>  #include "hw/gpio/pl061.h"
>  #include "hw/irq.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
> +#include "qapi/error.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "sysemu/device_tree.h"
> +#include "sysemu/gpiodev.h"
>  
>  //#define DEBUG_PL061 1
>  
> @@ -41,6 +44,9 @@ static const uint8_t pl061_id_luminary[12] =
>  typedef struct PL061State {
>      SysBusDevice parent_obj;
>  
> +#ifdef CONFIG_GPIODEV
> +    char *host;
> +#endif
>      MemoryRegion iomem;
>      uint32_t locked;
>      uint32_t data;
> @@ -370,10 +376,39 @@ static void pl061_init(Object *obj)
>      qdev_init_gpio_out(dev, s->out, 8);

Not related to this patch, but we should replace this 8 magic value by a
proper definition...

>  }
>  
> +#ifdef CONFIG_GPIODEV
> +static Property pl061_properties[] = {
> +    DEFINE_PROP_STRING("host", PL061State, host),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void pl061_realize(DeviceState *dev, Error **errp)
> +{
> +    PL061State *s = PL061(dev);
> +
> +    if (!dev->opts) {
> +        /* Not created by user */
> +        return;
> +    }
> +
> +    if (!s->host) {
> +        error_setg(errp, "'host' property is required");
> +        return;
> +    }
> +
> +    qemu_gpiodev_add(dev, s->host, 8, errp);
> +}
> +#endif /* CONFIG_GPIODEV */
> +
>  static void pl061_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
> +#ifdef CONFIG_GPIODEV
> +    device_class_set_props(dc, pl061_properties);
> +    dc->realize = pl061_realize;
> +    dc->user_creatable = true;
> +#endif
>      dc->vmsd = &vmstate_pl061;
>      dc->reset = &pl061_reset;
>  }
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 292d4e7c0cef6097..182de7fb63923b38 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -875,6 +875,15 @@ SRST
>  ``-device isa-ipmi-bt,bmc=id[,ioport=val][,irq=val]``
>      Like the KCS interface, but defines a BT interface. The default port
>      is 0xe4 and the default interrupt is 5.
> +
> +#ifdef CONFIG_GPIODEV
> +``-device pl061,host=gpiochip``
> +    Add a PL061 GPIO controller, and map its virtual GPIO lines to a GPIO
> +    controller on the host.
> +
> +    ``host=gpiochip``
> +        The name or label of the GPIO controller on the host.
> +#endif
>  ERST
>  
>  DEF("name", HAS_ARG, QEMU_OPTION_name,
> 

Instead of restricting this to the pl061, it would be cleaner you add a
GPIO_PLUGGABLE_INTERFACE (or GPIO_BINDABLE_INTERFACE or better name),
and have TYPE_PL061 implement it.
