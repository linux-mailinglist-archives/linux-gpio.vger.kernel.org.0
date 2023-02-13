Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E67569476F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Feb 2023 14:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjBMNuF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Feb 2023 08:50:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjBMNt7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2023 08:49:59 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8591B57A
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 05:49:56 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id m1so13079327vst.7
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 05:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UCZ9/hjhw8oIjIDXMYo6eqNKWR70rfBUy82CaQZ+lNA=;
        b=JCW5rZcmgMPyJrkpZlFS2ZCoA/WLAaMncxjQpR5PjqOIVu312nFuBvNCFRW/0/gmEX
         0kdpS55aEx6vPbkjm5DQtnzkGUhvMnlfOaiu+HRQOErgrUdo7FWafNDdbSFQ8j5G28i4
         FTrWRs6f1ZqDDgkXJZfUEW6bZ/V9uEy2ahrH+EmmPfYS/3WkKBeaQ0gNYo4bDIPu9gNs
         XgBVbRnhTbeVzMY7lUa8hEcI4tVPqgahAKBx/MvA5NhHj4E1AtkJSdnProIHlS17UbI6
         ns1THSyfKDyh3qTx4x9lzRF1hAR6aJRdveWG2Upgpoc6hUEWPZQRzQAFcZMIhzGqR2eS
         vyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCZ9/hjhw8oIjIDXMYo6eqNKWR70rfBUy82CaQZ+lNA=;
        b=7lWR8cQ/nGNnFZdqR8viADAdKl4ij2mGOw7aYqZiJjd2yDOOt117VdmKI75CPSnYfp
         EkuUgplIuRccOxWYGkf2yynxO9Cv2Jp/9EmbUWIP7B7tB6AqADJ9U0x6UQz/qlb3yqpM
         nWY/3xIfiDrMFk6hZ1pJqs6HpsQDDIOjBvOg28zOKFfTS95TFXUBQO8p/urlb3DqPwbG
         0/Cha2h6LumdbP5TVrcsc8NnjFBAf2uKYiPEPqsV0VjE8jCsyiBNcARZP6iNmacxfYAd
         b/HS4q/zLdFcSnFN/tHWd3YdoRV6zOI9fvUFiTs7GbQqBHcKRDRIlcHYbGiwioZNvP5H
         wZSw==
X-Gm-Message-State: AO0yUKWhiMI6Kug4j6yXzhyyxOqhvHmCgvJuZ4ctPhmSxwlDYWGphQ96
        WpouDZCDe8bATfOHjX2/h7onXkd8nn58ptmK+zzP2Q==
X-Google-Smtp-Source: AK7set+W7lsI5WANmdZJA6NIfSwQ3wNhy8m0EutQ4NytSIo/qoBFRbrS8EYp+BFsmGOk4qYWQZrD3JMOrl33L1ZHApg=
X-Received: by 2002:a05:6102:d86:b0:3fd:7046:9232 with SMTP id
 d6-20020a0561020d8600b003fd70469232mr4195413vst.29.1676296195470; Mon, 13 Feb
 2023 05:49:55 -0800 (PST)
MIME-Version: 1.0
References: <20230212141355.12794-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230212141355.12794-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 13 Feb 2023 14:49:44 +0100
Message-ID: <CAMRc=McDPZMs+YTWbiFiG=WzkmrOKZmhSBfTyc7WwviX_ci+Cw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: sim: Use %pfwP specifier instead of calling
 fwnode API directly
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Feb 12, 2023 at 3:14 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Instead of calling fwnode_get_name() and supply as %s, use %pfwP which
> will do the same inside printf() call.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-sim.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 60514bc5454f..a51b5ea38ad5 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -377,8 +377,8 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
>
>         ret = fwnode_property_read_string(swnode, "gpio-sim,label", &label);
>         if (ret) {
> -               label = devm_kasprintf(dev, GFP_KERNEL, "%s-%s",
> -                                      dev_name(dev), fwnode_get_name(swnode));
> +               label = devm_kasprintf(dev, GFP_KERNEL, "%s-%pfwP",
> +                                      dev_name(dev), swnode);
>                 if (!label)
>                         return -ENOMEM;
>         }
> @@ -784,10 +784,9 @@ static int gpio_sim_add_hogs(struct gpio_sim_device *dev)
>                                                           GFP_KERNEL);
>                         else
>                                 hog->chip_label = kasprintf(GFP_KERNEL,
> -                                                       "gpio-sim.%u-%s",
> +                                                       "gpio-sim.%u-%pfwP",
>                                                         dev->id,
> -                                                       fwnode_get_name(
> -                                                               bank->swnode));
> +                                                       bank->swnode);
>                         if (!hog->chip_label) {
>                                 gpio_sim_remove_hogs(dev);
>                                 return -ENOMEM;
> --
> 2.39.1
>

Applied, thanks!

Bart
