Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D02B77AAA3
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Aug 2023 20:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbjHMStj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Aug 2023 14:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbjHMStj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Aug 2023 14:49:39 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C831AA
        for <linux-gpio@vger.kernel.org>; Sun, 13 Aug 2023 11:49:40 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-4477b141804so1641887137.3
        for <linux-gpio@vger.kernel.org>; Sun, 13 Aug 2023 11:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691952579; x=1692557379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmaN2GX+8rcIno5l1s6htB9H3iAAMlN+q7ViLlX3OMM=;
        b=2Jfhtuv1uGtTKoD/IH+baTH5MPZqFToG9Eo7rs+jpWWI8OqGrXgQhUm5Y5Gx8ArpjB
         NJyOTj5cKhqNtIBf31PdYLZ9WBydI+KVTU4rFRMxowICHTPFkHQqs4niU8pss8SvS0Ca
         rs5zJwOXkaE7hsfG2um4d/gJI75ckl3DArMWyG8Hdqm7vbVVbNmiTN2Qvsw7ODvh4C2C
         smFzheXwTTXWOKm3MEfNETUXAlX3BpMxtNtz23AddZLZQmhZpKRJMZyG7btZaUfeRlYq
         zw7o+MUUMeKQ8LEbnPe6xHoJCJ/clXuS49d19hEsAvZQ3Gh6dLm0KsT5zGPBAc/lPSqK
         6UYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691952579; x=1692557379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmaN2GX+8rcIno5l1s6htB9H3iAAMlN+q7ViLlX3OMM=;
        b=hmCJjENCJ9O5e7BCBDHEs6LDKuQeP5KEB23xwMg8OIH7KUwwd0gyLDsSh0qECuEJCO
         hhjkT+wTWdW1DEhxU3x5bAH3GUIC7RXg6k2D/XGPdb8VCb8WnrEMn0JC8jS2/PaoSP22
         A4UpxjEt1oiut0cmKgr/nZx6fUNVir2P+H4QC8zFT2cekONkQDJNn22t/kgyHKj5JaQO
         M5f5WyV8OOdKa0ApPfgFi8728SzlriSwSwHPwW6LIZ3fNpkMwKj2a57TLkWgDgfUQKRf
         76cSmesKflVNBtulR7Tz9a4J0sdWTfzDBMBiTJwxCEyC1JXQJ3pn3TQ8sfJuGtya1vd1
         7OPQ==
X-Gm-Message-State: AOJu0YxzzCRZ1tLMkYp05QZD1k8ZWnMZdAchMz420+FlhXCdLfayGAIs
        OoFPnAufBuHt9JM5/SoCQCnkZtVsEmCsOlVF/ixZkQ==
X-Google-Smtp-Source: AGHT+IE9TRwV02mL4wJd3iohTHPxAPTVCTxAFxz+xOrfQF6MRyYGNkWBTqtISlU9XfpWdW/yf7o/ZQOtgR1uKWYU28o=
X-Received: by 2002:a67:f60f:0:b0:443:6e7b:ab8 with SMTP id
 k15-20020a67f60f000000b004436e7b0ab8mr7802898vso.5.1691952579530; Sun, 13 Aug
 2023 11:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230812071423.3481790-1-ruanjinjie@huawei.com>
In-Reply-To: <20230812071423.3481790-1-ruanjinjie@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 13 Aug 2023 20:49:28 +0200
Message-ID: <CAMRc=Md2D39ciYT6TmWRN60z16rD5uEkn8vuzj=Ap8fcchoAbA@mail.gmail.com>
Subject: Re: [PATCH -next] gpiolib: acpi: Use LIST_HEAD() to initialize the list_head
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 12, 2023 at 9:14=E2=80=AFAM Ruan Jinjie <ruanjinjie@huawei.com>=
 wrote:
>
> Use LIST_HEAD() to initialize the list_head instead of open-coding it.
>
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/gpio/gpiolib-acpi.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index fbda452fb4d6..db8e8e967bda 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -809,11 +809,9 @@ static int acpi_gpio_resource_lookup(struct acpi_gpi=
o_lookup *lookup,
>                                      struct acpi_gpio_info *info)
>  {
>         struct acpi_device *adev =3D lookup->info.adev;
> -       struct list_head res_list;
> +       LIST_HEAD(res_list);
>         int ret;
>
> -       INIT_LIST_HEAD(&res_list);
> -
>         ret =3D acpi_dev_get_resources(adev, &res_list,
>                                      acpi_populate_gpio_lookup,
>                                      lookup);
> @@ -1472,13 +1470,12 @@ int acpi_gpio_count(struct device *dev, const cha=
r *con_id)
>
>         /* Then from plain _CRS GPIOs */
>         if (count < 0) {
> -               struct list_head resource_list;
> +               LIST_HEAD(resource_list);
>                 unsigned int crs_count =3D 0;
>
>                 if (!acpi_can_fallback_to_crs(adev, con_id))
>                         return count;
>
> -               INIT_LIST_HEAD(&resource_list);
>                 acpi_dev_get_resources(adev, &resource_list,
>                                        acpi_find_gpio_count, &crs_count);
>                 acpi_dev_free_resource_list(&resource_list);
> --
> 2.34.1
>

My opinion: this is actually less readable than what is there now and
I doubt the compiler would generate less code. With this change I now
need to check what LIST_HEAD() actually does, while defining a temp
variable of a clear type and then using a macro to initialize it is
much more obvious.

I'll let Andy decide as ACPI is his domain but for me it's a NAK.

Bart
