Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6E07532AD0
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 15:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbiEXNGz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 09:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237549AbiEXNGy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 09:06:54 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F73522E0
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 06:06:52 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id rs12so23484141ejb.13
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T1QbSIoaOqrSIJz/+n+q43t5YKXa2tv3lD3y6jPtZuM=;
        b=WPYwAuXaZUJHjioHE0N0swKbtRHgYuhaZWuvbECTPZp/D6/DCfNL6yWJ5jLmdCOVkN
         A16sMir3G7eUpXd6Dh9zN+3LHnRA2vaanWcE9P6bNNYdn86Am3H1recJrRz0Vy3tau9H
         VCUetKGvVPu9XsKl9TdYfg/rcLbeGunkoJLyxJqs3RdDkWHmCYgj/kQSsk+8zuRlg+ZX
         8q4bIfAOWjieeLc7jNn15P/GccTASlhRLMqObACUBUAm7qjLWOvpkFYhIQAqw66NR53L
         6s8ZW+iLM0Sdbgap6LpHfMyzMTCQhrOyYfoTPqEA96oJ9QSVc9YzdgXKmsMZ9H8Bnm6i
         epkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T1QbSIoaOqrSIJz/+n+q43t5YKXa2tv3lD3y6jPtZuM=;
        b=AN7jjlcuzc9JOIgC7vFaES3FvrUyLTT9L8GTj2bqMzHEPTjEkYegL4ip/o5V/NMhyf
         goj26jYZ1ChFzayVOYZ+NlIimEqGZ/7PswN1Xvnu7wniqTZJepxFuX/UI2AeuKKUI7rM
         17Ci2kiQHiE4f7w9bEOfYZwROXHlDAnTdJLzxo7VzrRjYiSiPs4HTy5DrdYD51GWxKHR
         fdH0egDw+Yaj16ylGb3YYQ2RxvYyjUdiiQd3IOkpJZ9sNL/zknyFhS/bXOyz6TF4t0hq
         tPoSgt6U/DeiXmHYxtruvb5YN1VPNvspoFhPsMB0ZAkBfj/oC9RtQ8RnhlEU/iDr8oxv
         J9MA==
X-Gm-Message-State: AOAM533tz5kZi49qJhQWANgACx3vbaEQWDVK0mpeAjRogrUj3yw5swsf
        S558gbWYBaHxrOY1JayDvrciIIy0d/EyJJ0R4WDCbS/XLF8=
X-Google-Smtp-Source: ABdhPJxBDfUTEuuusgKhjZDfGogWPZyML9h85FjhVwysI1SwYVnowZf7ZtcaZjstaZJ6k+xe7L3hy3jI5khBPjJr6do=
X-Received: by 2002:a17:907:6e01:b0:6fe:fe21:8c56 with SMTP id
 sd1-20020a1709076e0100b006fefe218c56mr4570511ejc.579.1653397610614; Tue, 24
 May 2022 06:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com> <20220524074007.2792445-3-Basavaraj.Natikar@amd.com>
In-Reply-To: <20220524074007.2792445-3-Basavaraj.Natikar@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 24 May 2022 15:06:14 +0200
Message-ID: <CAHp75Ve3NAiWRiSgiR59edL9939LBHQOWvVVika54xurs1tMXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: amd: Get and update IOMUX details
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 24, 2022 at 10:01 AM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:
>
> Presently there is no way to change pinmux configuration runtime.
> Hence add IOMUX details which can be used to configure IOMUX
> gpio pins runtime to different functionalities.

GPIO

run time

...

> +#include "../acpi/acpica/accommon.h"

One shoudn't ever include this except ACPICA code.

...

> +static acpi_status acpi_get_iomux_region(acpi_handle handle, u32 level,
> +                                        void *ctx, void **return_value)
> +{
> +       struct acpi_namespace_node *node = handle;
> +       union acpi_operand_object *region_obj;
> +       struct amd_gpio *gpio_dev = ctx;
> +
> +       /* Already mapped the IOMUX base */
> +       if (gpio_dev->iomux_base)
> +               return AE_OK;
> +
> +       /* Valid object */
> +       if (!node || !node->object)
> +               return AE_OK;
> +
> +       /* Valid operand or namespace node*/
> +       if ((ACPI_GET_DESCRIPTOR_TYPE(node->object) != ACPI_DESC_TYPE_OPERAND) &&
> +           (ACPI_GET_DESCRIPTOR_TYPE(node->object) != ACPI_DESC_TYPE_NAMED))
> +               return AE_OK;
> +
> +       /* Valid object type*/
> +       if (node->object->common.type == ACPI_TYPE_LOCAL_DATA)
> +               return AE_OK;
> +
> +       region_obj = node->object;
> +       if (!region_obj->region.handler)
> +               return AE_OK;
> +
> +       if (region_obj->region.space_id != ACPI_ADR_SPACE_SYSTEM_MEMORY)
> +               return AE_OK;
> +
> +       if (strncmp("IOMX", region_obj->region.node->name.ascii, strlen("IOMX")))
> +               return AE_OK;
> +
> +       gpio_dev->iomux_base = devm_ioremap(&gpio_dev->pdev->dev,
> +                                           region_obj->region.address,
> +                                           region_obj->region.length);
> +       if (!gpio_dev->iomux_base)
> +               dev_err(&gpio_dev->pdev->dev, "failed to devm_ioremap() iomux_base\n");
> +
> +       return AE_OK;
> +}

Your commit message is quite poor, can you add a lot of missed
details, i.e. how it's done in ACPI (DSDT), what the version of ACPI
specification have you in mind when implementing this, etc.

...

> +       acpi_handle sys_bus_handle;
> +       int status = acpi_get_handle(NULL, "\\_SB", &sys_bus_handle);
> +
> +       if (ACPI_FAILURE(status)) {
> +               dev_err(&gpio_dev->pdev->dev, "Failed to get SB handle\n");
> +               return;
> +       }

Usually you don't need an \\_SB handle. Why is it here?

-- 
With Best Regards,
Andy Shevchenko
