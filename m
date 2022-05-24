Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A74A532697
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 11:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234445AbiEXJiU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 05:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235742AbiEXJiT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 05:38:19 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840A864BF1
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 02:38:17 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id i11so29875122ybq.9
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 02:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NF2zz4kFqP3PC8fzig7v4E+6UQ4zkF8eX8lOs9tvkiU=;
        b=VPn7h/LM8ilqVXEASM3aAcqEyrB58Phah17Xn0vyDCZ67SdEcz8J8gq/RJ2f/I0yYZ
         hfkHOK0UCJPj4OT/vbUy2KMOj01WJMnOe+FhJyb/STBn06CB3V2j3QdlyqkLKb7KIabb
         LNCp3npe3/2I6mQZMFz6yONZ/X6tV4F1n+KgTO4A0dbja6FHEl8Iyf8qMRsNwnvWtyFC
         FN3m93Rh8jIhZ6jpd0Ogm1N+ldz247kknHdkmjfXOq0WSZbvI/5JIn03WXiSDvyg37PW
         bNUo6RCfeZYd9ja0lCh7LFn3r+XaHlzFhvwL3R5mWe0M0/TvWINcEtVJSzzNzYYyBSg2
         f/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NF2zz4kFqP3PC8fzig7v4E+6UQ4zkF8eX8lOs9tvkiU=;
        b=0cWpDnFnVhsp5EdaHcyXjnbXUmAS9cIbUood7m6CzSYefRG2VnbXOAZgniXvemooKd
         G5B0eDgREBVNDyd6KlvKSoyxQE4EW+H00MN00l9G13fOXhVl1OgRUkpM8pasve6Z8Xmf
         /r/bsWHPIQ0QuycoSXEh86PEgz4Mz16cjwN5Jz9GOjN4eWKAEC6mFOLa8ze5pC6H+huU
         rKtdCIeWC40MdCK3/M4bdV+UwCff0qm7FcmUYL+3marihab8s7xNZrOhsc7zLLztcIVD
         oHPLYdPSW/+1SOh9ujO16NOBd+aGEHXLP8HXUtwOQ03df4vJZGv52cRzePGuwo/dlaMD
         zGUQ==
X-Gm-Message-State: AOAM530CCrXXHzZK9oV40H5Omkcn1bqjVo4ja3Ve7mct1StdTiBSadx+
        jNOuY0fGbcLsNp3MNCvStRNxtlgiH2H4o6hDPvcmZg==
X-Google-Smtp-Source: ABdhPJxMO3rgOixREUS4GR89jtTYKelIhD4PS4egd+xT7OOxwuu5Kdy/M5XYYekhTR+mh+jTsoiXenV70CskdB9zC34=
X-Received: by 2002:a05:6902:704:b0:64d:f270:22b0 with SMTP id
 k4-20020a056902070400b0064df27022b0mr25080658ybt.626.1653385097171; Tue, 24
 May 2022 02:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com> <20220524074007.2792445-3-Basavaraj.Natikar@amd.com>
In-Reply-To: <20220524074007.2792445-3-Basavaraj.Natikar@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 May 2022 11:38:06 +0200
Message-ID: <CACRpkdZ267_CjNoro4A+eBASjz=qCL4ixLnbsac5U+gCsBSGwg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: amd: Get and update IOMUX details
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Basavaraj,

thanks for your patch!

On Tue, May 24, 2022 at 9:40 AM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:

> Presently there is no way to change pinmux configuration runtime.
> Hence add IOMUX details which can be used to configure IOMUX
> gpio pins runtime to different functionalities.
>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Interesting!

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
> +
> +static void amd_update_iomux_info(struct amd_gpio *gpio_dev)
> +{
> +       acpi_handle sys_bus_handle;
> +       int status = acpi_get_handle(NULL, "\\_SB", &sys_bus_handle);
> +
> +       if (ACPI_FAILURE(status)) {
> +               dev_err(&gpio_dev->pdev->dev, "Failed to get SB handle\n");
> +               return;
> +       }
> +
> +       status = acpi_walk_namespace(ACPI_TYPE_REGION, sys_bus_handle, ACPI_UINT32_MAX,
> +                                    acpi_get_iomux_region, NULL, gpio_dev, NULL);
> +
> +       if (ACPI_FAILURE(status)) {
> +               dev_err(&gpio_dev->pdev->dev, "Failed to get acpi_get_iomux_region\n");
> +               return;
> +       }
> +}

Oh this looks scary to me, make sure you get the review from the GPIO
ACPI experts, Andy Shevchenko and/or Mika Westerberg. (Added on the
To: line)

Yours,
Linus Walleij
