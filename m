Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E78E254085
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 10:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgH0IRt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 04:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbgH0IRs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 04:17:48 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35468C06121A;
        Thu, 27 Aug 2020 01:17:48 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id m8so2920454pfh.3;
        Thu, 27 Aug 2020 01:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bJ9yElb+Acw29JzFUwuSZa0RXTXvyJf8yxtdy5mxBOE=;
        b=cYRyCH+s0CHhZyYFik5WdC9H7AVhYsLzg98fOvQ7DEiIrCQnXIhTcyjsuh6yDDaH5F
         Q4oDTr7BfrZOmdL0iDRDbHWt0nFWuy14l6zyaZcUg0uqus6kvJzDV1zytwPORCirEgjm
         XWimNjensbSyOvhbAT1gxnZ2vAy1c5OyKpx9qsvStjGXQMfcEshIVf7lp654DCyiJpNh
         76oVadGuJd2/tmgZjAnZSMEYqZutfuvH3sOZev7QGY+a/OtM863iNLcDrRxtv9WPI+Id
         sevpQFLt30Cz+IoQPVAqtaSvpmqU23FlZNN7h56OId9V8IFW4dCmXl4CBL5UPBcyJ/5b
         2URA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bJ9yElb+Acw29JzFUwuSZa0RXTXvyJf8yxtdy5mxBOE=;
        b=ORpVYuBUU+MxzQuxIw3uVvHlMAk/G1CCDfPDA9T4bPkVDL+vhIP3q6dgRvvq7JbP2o
         iiNPaNX7Q4njtJ/6JCH4estmkWYNifrrRW5IOcAyXnf8fTsFk4HFf6ER7b9zf3+VUhLb
         5OTJs+FtIJu+Jc1brecJFnOhmeQWEwF/5rTt7c48eTQEQ8lXe90f1kAbgcQhDWEr8lSu
         +hjPR36+2vjWNBgV5+BwKT/N9dCI1Q+eDQui6gmQUJovTgf8VHrmXGKIbIPF6rs/v2n/
         uRIiJQqiIlaMkYUqF2yRlPS+dwc/MLyLwOvUEm9Zga/vLODJtBHMtxEEnsTEa4oeU+xF
         9ZBg==
X-Gm-Message-State: AOAM531tnTPDBkB1d84Qt1kMSJD97Ddcr6zCgtanqCFt6CaMYUJj8Aby
        kp6KI9V6/kR/w+cy6MxcEToJpww8FU3GyZA8Y+Y=
X-Google-Smtp-Source: ABdhPJwibcFU3MWFSdKqhPYCVIG9l4QILuHaSQJSVxhNqTtOKRs9O8nrVSqbuiF4GnBvjySs0piQjtPcYGhCGi4XtkU=
X-Received: by 2002:a63:f24a:: with SMTP id d10mr13608822pgk.4.1598516267600;
 Thu, 27 Aug 2020 01:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200827062804.16730-1-krzk@kernel.org>
In-Reply-To: <20200827062804.16730-1-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 11:17:31 +0300
Message-ID: <CAHp75Vdm2ckfDK8q_coJyFmJjftezu9j3oaEmWxRM8aJos+PXw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Add devm_fwnode_gpiod_get_optional() helpers
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 9:28 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Add devm_fwnode_gpiod_get_optional() and
> devm_fwnode_gpiod_get_index_optional() helpers, similar to regular
> devm_gpiod optional versions.  Drivers getting GPIOs from a firmware
> node might use it to remove some boilerplate code.
>

For both:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v2:
> 1. Return NULL
>
> Changes since v1:
> 1. New patch
> ---
>  drivers/gpio/gpiolib-devres.c | 71 +++++++++++++++++++++++++++++++++++
>  include/linux/gpio/consumer.h | 30 +++++++++++++++
>  2 files changed, 101 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
> index 7dbce4c4ebdf..f8476f6a65cc 100644
> --- a/drivers/gpio/gpiolib-devres.c
> +++ b/drivers/gpio/gpiolib-devres.c
> @@ -184,6 +184,37 @@ struct gpio_desc *devm_gpiod_get_from_of_node(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_gpiod_get_from_of_node);
>
> +/**
> + * devm_fwnode_gpiod_get_optional - Resource-managed fwnode_gpiod_get_index()
> + *                                  for optional GPIO
> + * @dev:       GPIO consumer
> + * @fwnode:    firmware node containing GPIO reference
> + * @con_id:    function within the GPIO consumer
> + * @flags:     GPIO initialization flags
> + * @label:     label to attach to the requested GPIO
> + *
> + * GPIO descriptors returned from this function are automatically disposed on
> + * driver detach.
> + *
> + * This is equivalent to devm_fwnode_gpiod_get_index(), except that when no
> + * GPIO with the specified index was assigned to the requested function it will
> + * return NULL.  This is convenient for drivers that need to handle optional
> + * GPIOs.
> + *
> + * On successful request the GPIO pin is configured in accordance with
> + * provided @flags.
> + */
> +struct gpio_desc *devm_fwnode_gpiod_get_optional(struct device *dev,
> +                                                struct fwnode_handle *fwnode,
> +                                                const char *con_id,
> +                                                enum gpiod_flags flags,
> +                                                const char *label)
> +{
> +       return devm_fwnode_gpiod_get_index_optional(dev, fwnode, con_id, 0,
> +                                                   flags, label);
> +}
> +EXPORT_SYMBOL_GPL(devm_fwnode_gpiod_get_optional);
> +
>  /**
>   * devm_fwnode_gpiod_get_index - get a GPIO descriptor from a given node
>   * @dev:       GPIO consumer
> @@ -226,6 +257,46 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_fwnode_gpiod_get_index);
>
> +/**
> + * devm_fwnode_gpiod_get_index_optional - Resource-managed fwnode_gpiod_get_index()
> + *                                        for optional GPIO
> + * @dev:       GPIO consumer
> + * @fwnode:    firmware node containing GPIO reference
> + * @con_id:    function within the GPIO consumer
> + * @index:     index of the GPIO to obtain in the consumer
> + * @flags:     GPIO initialization flags
> + * @label:     label to attach to the requested GPIO
> + *
> + * GPIO descriptors returned from this function are automatically disposed on
> + * driver detach.
> + *
> + * This is equivalent to devm_fwnode_gpiod_get_index(), except that when no
> + * GPIO with the specified index was assigned to the requested function it will
> + * return NULL.  This is convenient for drivers that need to handle optional
> + * GPIOs.
> + *
> + * On successful request the GPIO pin is configured in accordance with
> + * provided @flags.
> + */
> +struct gpio_desc *devm_fwnode_gpiod_get_index_optional(struct device *dev,
> +                                                      struct fwnode_handle *fwnode,
> +                                                      const char *con_id, int index,
> +                                                      enum gpiod_flags flags,
> +                                                      const char *label)
> +{
> +       struct gpio_desc *desc;
> +
> +       desc = devm_fwnode_gpiod_get_index(dev, fwnode, con_id, index, flags,
> +                                          label);
> +       if (IS_ERR(desc)) {
> +               if (PTR_ERR(desc) == -ENOENT)
> +                       return NULL;
> +       }
> +
> +       return desc;
> +}
> +EXPORT_SYMBOL_GPL(devm_fwnode_gpiod_get_index_optional);
> +
>  /**
>   * devm_gpiod_get_index_optional - Resource-managed gpiod_get_index_optional()
>   * @dev: GPIO consumer
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index 901aab89d025..7854d80b1e9a 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -183,11 +183,21 @@ struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
>                                          const char *con_id, int index,
>                                          enum gpiod_flags flags,
>                                          const char *label);
> +struct gpio_desc *devm_fwnode_gpiod_get_optional(struct device *dev,
> +                                                struct fwnode_handle *fwnode,
> +                                                const char *con_id,
> +                                                enum gpiod_flags flags,
> +                                                const char *label);
>  struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
>                                               struct fwnode_handle *child,
>                                               const char *con_id, int index,
>                                               enum gpiod_flags flags,
>                                               const char *label);
> +struct gpio_desc *devm_fwnode_gpiod_get_index_optional(struct device *dev,
> +                                                      struct fwnode_handle *fwnode,
> +                                                      const char *con_id, int index,
> +                                                      enum gpiod_flags flags,
> +                                                      const char *label);
>
>  #else /* CONFIG_GPIOLIB */
>
> @@ -562,6 +572,16 @@ struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
>         return ERR_PTR(-ENOSYS);
>  }
>
> +static inline
> +struct gpio_desc *devm_fwnode_gpiod_get_optional(struct device *dev,
> +                                                struct fwnode_handle *fwnode,
> +                                                const char *con_id,
> +                                                enum gpiod_flags flags,
> +                                                const char *label)
> +{
> +       return NULL;
> +}
> +
>  static inline
>  struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
>                                               struct fwnode_handle *fwnode,
> @@ -572,6 +592,16 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
>         return ERR_PTR(-ENOSYS);
>  }
>
> +static inline
> +struct gpio_desc *devm_fwnode_gpiod_get_index_optional(struct device *dev,
> +                                                      struct fwnode_handle *fwnode,
> +                                                      const char *con_id, int index,
> +                                                      enum gpiod_flags flags,
> +                                                      const char *label)
> +{
> +       return NULL;
> +}
> +
>  #endif /* CONFIG_GPIOLIB */
>
>  static inline
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
