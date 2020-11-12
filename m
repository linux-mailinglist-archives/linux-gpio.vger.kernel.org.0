Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4FA42B0B3E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 18:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgKLR0A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 12:26:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgKLR0A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 12:26:00 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E457C0613D6
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 09:25:58 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id ay21so7266552edb.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 09:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EYH3xwiXEDAnNYFH6sRlnj0nrx9OC5GkHU2BEsYeg8c=;
        b=V1er74VJGkYMqey/iyOXhUJFrbfBMej3NDgDK/+Dsn878FmHqTP2crY3RgRv+amk6x
         qmjtEZmsJbcY0UAfQUB4Uy/Au7ucKUx4UikT7GphdZINd4kjRqdu7vhLTTTpV1YG4zaU
         7eSTqs1Ajd5b1s8r6edLBGVp0ADsMSfZVuRn4RIbtxiHxKc5NzogmuBfiG1TJ59nrTi8
         jDtqKDS+c/qmN9QYU5oKIdKjsCTqT85+uPsYArzF81ZO2o053KEPLRhdaNUI7gbS37YR
         ZYP6gYur4aoMH+k6trf/kSpCgk7T8XZUUHJ5JjANSOs0Y1Wmvue8yKT61v8pLlOtGbuv
         QViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EYH3xwiXEDAnNYFH6sRlnj0nrx9OC5GkHU2BEsYeg8c=;
        b=JJHeR2pagzGPrHS9huMisAATsrMgfi9w5p1cw3RJK8rbWWgoD08FXbP36ozHjKyjqI
         OGZeflevS7HndiZ0d5/vGvOFAnSIoZexE5B0g56WUh0xLsUeKLFwhEVLpbeQ4jqjH4f6
         M6Io8nKxitPE0zSRe8RzNvsdwAKBjVAyFOACs9Cs5caK0pR63tqnFtX0hvRaVImiUqfE
         Oh2Yr+bf4nD9QVGTux+1ZxEMDHMAxKNPX6G51VoF/IS9XqydNbTULD6fHs2kRQBUgWIP
         biYZjYmyxHcDr4MOSY5vEDLA9gQSMKbfLckL4F10qShJz+T6V2DpYEhpJoEnI2KjVYKz
         cu1A==
X-Gm-Message-State: AOAM531qA2KCGchya1as1Kl8qmG3SDMtvksR5XhU3bguR4gqH5korom0
        aqiOFPwo3X2Wbh2DC9qHiW5VW+B2iqq7TBtOXYMtEw==
X-Google-Smtp-Source: ABdhPJwDBX/NfTxaAUg6N/MVUgyGIi6++bAnqswSeUgMd0WUV9wPeIj1nATdpL6JniiSVSiXHWRN6oFLXiRoHp9hbx0=
X-Received: by 2002:aa7:d54b:: with SMTP id u11mr878250edr.341.1605201957042;
 Thu, 12 Nov 2020 09:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20201112163630.17177-1-nsaenzjulienne@suse.de> <20201112163630.17177-3-nsaenzjulienne@suse.de>
In-Reply-To: <20201112163630.17177-3-nsaenzjulienne@suse.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 12 Nov 2020 18:25:46 +0100
Message-ID: <CAMpxmJWZsqfkkTP99a_8mu+O4xHwNWDqHuvgt7Cs88bA-iMvQA@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] firmware: raspberrypi: Introduce devm_rpi_firmware_get()
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-pwm@vger.kernel.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-devicetree <devicetree@vger.kernel.org>, wahrenst@gmx.net,
        Linux Input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-rpi-kernel@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 5:44 PM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Itroduce devm_rpi_firmware_get(), it'll simplify the firmware handling
> for most consumers.
>
> Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>
> Changes since v2:
> - Introduce devm_rpi_firmware_get()
>
>  drivers/firmware/raspberrypi.c             | 31 +++++++++++++++++++++-
>  include/soc/bcm2835/raspberrypi-firmware.h |  8 ++++++
>  2 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
> index 438e17074a97..4ab2dfdc82ad 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
> @@ -237,10 +237,17 @@ static void rpi_firmware_delete(struct kref *kref)
>         kfree(fw);
>  }
>
> -void rpi_firmware_put(struct rpi_firmware *fw)
> +static void __rpi_firmware_put(void *data)
>  {

The '__' prefix is very vague and usually used for unlocked variants
of functions. The casting to void * in rpi_firmware_put() is also
unneeded. I would much prefer that the devres release callback be
called devm_rpi_firmware_put() and that it call rpi_firmware_put()
which would then call kref_put().

Bartosz

> +       struct rpi_firmware *fw = data;
> +
>         kref_put(&fw->consumers, rpi_firmware_delete);
>  }
> +
> +void rpi_firmware_put(struct rpi_firmware *fw)
> +{
> +       __rpi_firmware_put(fw);
> +}
>  EXPORT_SYMBOL_GPL(rpi_firmware_put);
>
>  static int rpi_firmware_probe(struct platform_device *pdev)
> @@ -326,6 +333,28 @@ struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node)
>  }
>  EXPORT_SYMBOL_GPL(rpi_firmware_get);
>
> +/**
> + * devm_rpi_firmware_get - Get pointer to rpi_firmware structure.
> + * @firmware_node:    Pointer to the firmware Device Tree node.
> + *
> + * Returns NULL is the firmware device is not ready.
> + */
> +struct rpi_firmware *devm_rpi_firmware_get(struct device *dev,
> +                                          struct device_node *firmware_node)
> +{
> +       struct rpi_firmware *fw;
> +
> +       fw = rpi_firmware_get(firmware_node);
> +       if (!fw)
> +               return NULL;
> +
> +       if (devm_add_action_or_reset(dev, __rpi_firmware_put, fw))
> +               return NULL;
> +
> +       return fw;
> +}
> +EXPORT_SYMBOL_GPL(devm_rpi_firmware_get);
> +
>  static const struct of_device_id rpi_firmware_of_match[] = {
>         { .compatible = "raspberrypi,bcm2835-firmware", },
>         {},
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> index fdfef7fe40df..73ad784fca96 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -142,6 +142,8 @@ int rpi_firmware_property_list(struct rpi_firmware *fw,
>                                void *data, size_t tag_size);
>  void rpi_firmware_put(struct rpi_firmware *fw);
>  struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node);
> +struct rpi_firmware *devm_rpi_firmware_get(struct device *dev,
> +                                          struct device_node *firmware_node);
>  #else
>  static inline int rpi_firmware_property(struct rpi_firmware *fw, u32 tag,
>                                         void *data, size_t len)
> @@ -160,6 +162,12 @@ static inline struct rpi_firmware *rpi_firmware_get(struct device_node *firmware
>  {
>         return NULL;
>  }
> +
> +static inline struct rpi_firmware *devm_rpi_firmware_get(struct device *dev,
> +                                       struct device_node *firmware_node)
> +{
> +       return NULL;
> +}
>  #endif
>
>  #endif /* __SOC_RASPBERRY_FIRMWARE_H__ */
> --
> 2.29.2
>
