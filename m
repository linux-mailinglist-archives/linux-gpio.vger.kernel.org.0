Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3970B6DD66B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 11:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjDKJRn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 05:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjDKJRn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 05:17:43 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC602D5B
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 02:17:40 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id j8so5785908pjy.4
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 02:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681204660; x=1683796660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F0nTRaXrf2V0tg1NVg+KAGRcl4O4IbYc2SCoiGBsCJQ=;
        b=nD2AnxaLnJeRjg2wjAJ7oxLZPed0L2/RxCfrhkTYqHAZ5Imy/aOwDLKoHWfmH6yfOH
         1U4nzgCsg0gQl3sCyiCXu1CSD2bo0+WoCdcYuel4Tnp8uOU7DB8OMLCWnh/xc4UvFR9n
         azFN7TEkI7Cq5cWJrevW/qDCrMvp3hPXvyGgeyyIRGV33K8jlHAvGIgdAv2hrEdG1sY4
         WPIu7BZr9feN7fxOSJm3RIKSepbJ+3xWQrGm4OzLHBvmbHtHpQxAbRRCYwSLBHEHObNJ
         nWExdlOyv4fFyluzdsSr9oXFa6rJ/wCywx/CKpLdfDaDCLGPxeYj/pA8lHWTZqswtoB0
         Gs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681204660; x=1683796660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0nTRaXrf2V0tg1NVg+KAGRcl4O4IbYc2SCoiGBsCJQ=;
        b=zfAffb0VJZCit+5On9jK27JDCuQ1V7YIKMMmM71NvWrdyKkEPamlyi+dtwcdeXFt8p
         mlMnLz6+k7wNp/qnzSTLkTfkiVGduOb6L6fl9VqETvHouQ4HbdliZP6kKmtTVXdSJzxR
         WhN8IgYshyPmD/Zu1S5nn/8YBlfv02nE5JN0LumjNlZGXglf2DIB/WS402ZLGy1G4O3r
         3dgw8K/c8SomDXicy7aFuhZ3GT2SJ19WIAJi0okFTraA7UKvzkhznZfRgUzl49SH+RyN
         yGl4p8iXYXlUWF11WK3MuRmm8Y5FBJnTy2tvsA0MGBGkfPfIosSqJIRxQ1TVYD/ZCF/f
         OVyQ==
X-Gm-Message-State: AAQBX9dR3vWusQ8mz/nuVeHOClZUgcyXwrPPY7b7OW6Yzd/3REAiHVWL
        T3CKBSQLtnn37goXyq3S4oJ+j7rZr9Y8RIccYyq+zTOu5zCZR3O04lg=
X-Google-Smtp-Source: AKy350ZxAMFThKSNfQdoA4WKwScfFHoSgc87FL59q9tJS0BpfDuZ5c5ec59qFq6eNXBLMr+N4TZpI+s29AVEBVWjCQw=
X-Received: by 2002:a17:902:ec91:b0:1a2:87a2:c932 with SMTP id
 x17-20020a170902ec9100b001a287a2c932mr3359664plg.10.1681204660335; Tue, 11
 Apr 2023 02:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230411082806.41361-1-linus.walleij@linaro.org>
In-Reply-To: <20230411082806.41361-1-linus.walleij@linaro.org>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Tue, 11 Apr 2023 11:17:29 +0200
Message-ID: <CADYN=9K1yAvT7qBSE6T_D3R2G-JPvXzEW1cQz66-ozk28CAdJQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib: Simplify gpiochip_add_data_with_key() fwnode
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 11 Apr 2023 at 10:28, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The code defaulting to the parents fwnode if no fwnode was assigned
> is unnecessarily convoluted, probably due to refactoring. Simplify
> it and make it more human-readable.
>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Anders Roxell <anders.roxell@linaro.org>

> ---
> Anders: you can test this but I don't think it fixes the
> regression you have pointing to commit
> 24c94060fc9b4e0f19e6e018869db46db21d6bc7

Did not fix the issue though.


Cheers,
Anders



> ---
>  drivers/gpio/gpiolib.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 19bd23044b01..5801d682c12b 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -667,7 +667,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>                                struct lock_class_key *lock_key,
>                                struct lock_class_key *request_key)
>  {
> -       struct fwnode_handle *fwnode = NULL;
>         struct gpio_device *gdev;
>         unsigned long flags;
>         unsigned int i;
> @@ -675,12 +674,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>         int base = 0;
>         int ret = 0;
>
> -       /* If the calling driver did not initialize firmware node, do it here */
> -       if (gc->fwnode)
> -               fwnode = gc->fwnode;
> -       else if (gc->parent)
> -               fwnode = dev_fwnode(gc->parent);
> -       gc->fwnode = fwnode;
> +       /*
> +        * If the calling driver did not initialize firmware node, do it here
> +        * using the parent device, if any.
> +        */
> +       if (!gc->fwnode && gc->parent)
> +               gc->fwnode = dev_fwnode(gc->parent);
>
>         /*
>          * First: allocate and populate the internal stat container, and
> --
> 2.39.2
>
