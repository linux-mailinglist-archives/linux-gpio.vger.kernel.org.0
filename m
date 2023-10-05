Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1738C7BA9F2
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 21:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbjJETVv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 15:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjJETVv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 15:21:51 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBE3CE
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 12:21:49 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-49369d29be3so544775e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 12:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696533708; x=1697138508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZ5nQ4FX57Hz3jHKgT06APZP5qfOfB/HcB4dGGZFKGk=;
        b=sb3BxPRBdVbf4n78JGnQp4Cov5mT93ycCokCfiPi3K7hfUM1rO/mChlpRPVYz070v7
         TTf1k/jIAnroFR0kET4wmBC2EKhRwAoks83VDVzaISXHbQMx/3kbFFJGIxDF3WctzgNQ
         M6FIJV3fBqBLl0G1EXDngJmYM10WGcWXT7Nm2iqZNyYSImtGO359PYoU1rYz5CeX0k3t
         iLzf0F3AsMZPLmp91rymVKgnDtWxXwO5aW5IqWNPPi/s9JDq2AbtTQ0RnpJfsvlYwVC8
         fuSUbmweDT0uRFjCPE2e2Cn56WR/mHUqqCXxjJwv3fYLQ8oh77PXZVFbGQ1i1pCukmBS
         Zt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696533708; x=1697138508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZ5nQ4FX57Hz3jHKgT06APZP5qfOfB/HcB4dGGZFKGk=;
        b=XJE9zt5oWUH+MTcuWxSE8lf5WKcHn4bwHql54F8bIzWmE70EUuwPmE+fi3r0ExQztR
         DLPCMll7nKcLWjqWz4lsC3pjtBkyTBVjgJdxGZNGRHifmy/y+t8Kp24N18rr6MiSorXn
         U2T4maTcsTJIvKQ2urKd+C84rUw/kmAx5psoCGE6amtU7K/vch8JijG1LxBbZloN+ECQ
         FEVdJe+JiKoE57YFxtXf+RseZW15S4xppM3LWhSl8QABpYkbVmcXHdXPA9qbMUn0bEll
         1Q/Bt9d45rPTcUndniWO+YMABpbQJwSQ0nw/5iER+LhsZrJNo2MOvdMTxp7SELgzhV6D
         pUsA==
X-Gm-Message-State: AOJu0YzLR3gfcjwQDJ2PkxMm5CElbrM45gPKeltgbeC8RTj9v7bqqrOT
        UaUYfBCJvDqpIWW0gXIBrlzSvoN0/pNrHYaPSgFHeQ==
X-Google-Smtp-Source: AGHT+IEwJl8lGnEeNibTIJXnkxtfJKixGZtnbqP5Q2WvwRFKjN9RjUnT2M2rYumDdBDVZ9T6bp8HXCnRHzv/w+QXEA8=
X-Received: by 2002:a1f:df01:0:b0:486:e696:c69a with SMTP id
 w1-20020a1fdf01000000b00486e696c69amr5398458vkg.16.1696533708218; Thu, 05 Oct
 2023 12:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231004162317.163488-1-hdegoede@redhat.com> <20231004162317.163488-2-hdegoede@redhat.com>
In-Reply-To: <20231004162317.163488-2-hdegoede@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 Oct 2023 21:21:37 +0200
Message-ID: <CAMRc=Membo2qcYGHLSNXCCk0Bvnd=pjXP_hUVP_x72DttCXUhg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] platform/x86: int3472: Add new skl_int3472_fill_gpiod_lookup()
 helper
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 4, 2023 at 6:23=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Add a new skl_int3472_fill_gpiod_lookup() helper.
>
> This is a preparation patch for removing usage of the deprecated
> gpiod_toggle_active_low() and acpi_get_and_request_gpiod() functions.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 32 +++++++++++++------
>  1 file changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/plat=
form/x86/intel/int3472/discrete.c
> index e33c2d75975c..351ecf047944 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -52,21 +52,15 @@ static void skl_int3472_log_sensor_module_name(struct=
 int3472_discrete_device *i
>         }
>  }
>
> -static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device=
 *int3472,
> -                                         struct acpi_resource_gpio *agpi=
o,
> -                                         const char *func, u32 polarity)
> +static int skl_int3472_fill_gpiod_lookup(struct gpiod_lookup *table_entr=
y,
> +                                        struct acpi_resource_gpio *agpio=
,
> +                                        const char *func, u32 polarity)
>  {
>         char *path =3D agpio->resource_source.string_ptr;
> -       struct gpiod_lookup *table_entry;
>         struct acpi_device *adev;
>         acpi_handle handle;
>         acpi_status status;
>
> -       if (int3472->n_sensor_gpios >=3D INT3472_MAX_SENSOR_GPIOS) {
> -               dev_warn(int3472->dev, "Too many GPIOs mapped\n");
> -               return -EINVAL;
> -       }
> -
>         status =3D acpi_get_handle(NULL, path, &handle);
>         if (ACPI_FAILURE(status))
>                 return -EINVAL;
> @@ -75,13 +69,31 @@ static int skl_int3472_map_gpio_to_sensor(struct int3=
472_discrete_device *int347
>         if (!adev)
>                 return -ENODEV;
>
> -       table_entry =3D &int3472->gpios.table[int3472->n_sensor_gpios];
>         table_entry->key =3D acpi_dev_name(adev);
>         table_entry->chip_hwnum =3D agpio->pin_table[0];
>         table_entry->con_id =3D func;
>         table_entry->idx =3D 0;
>         table_entry->flags =3D polarity;
>
> +       return 0;
> +}
> +
> +static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device=
 *int3472,
> +                                         struct acpi_resource_gpio *agpi=
o,
> +                                         const char *func, u32 polarity)
> +{
> +       int ret;
> +
> +       if (int3472->n_sensor_gpios >=3D INT3472_MAX_SENSOR_GPIOS) {
> +               dev_warn(int3472->dev, "Too many GPIOs mapped\n");
> +               return -EINVAL;
> +       }
> +
> +       ret =3D skl_int3472_fill_gpiod_lookup(&int3472->gpios.table[int34=
72->n_sensor_gpios],
> +                                           agpio, func, polarity);
> +       if (ret)
> +               return ret;
> +
>         int3472->n_sensor_gpios++;
>
>         return 0;
> --
> 2.41.0
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
