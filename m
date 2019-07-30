Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 241637A300
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 10:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729903AbfG3IRd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 04:17:33 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38112 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729057AbfG3IRc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 04:17:32 -0400
Received: by mail-ot1-f66.google.com with SMTP id d17so65441425oth.5
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2019 01:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Lt2LNgZteA1015AH8RPlPAXBlsU68AoI/PjuZOL4wJw=;
        b=ZZqg3NHJB4z6+JojyZylSodtfjtpvJwUx+cwfWp+DnQhgTTppNf0dLiAztppYgldNK
         ORKx4u2f9lgG8IftBhweOfW1KXfLrYFtGHzDxsOs2QhALyZQ//KGpMFucaootjPjwsSY
         xFj6f/G+WBq9rdDa5Ad/2/r1SSL57gv5MAJ42nYsJMRZVlKLhMPy3gGiLhcqOHfMmnWY
         4YhKnEQA5Pq4O8O0r12MPeT/99dYLJ218kEKGPp5/rR+N8RaDNcxY2QjamhP10EUpQEs
         va/6hZgXffizq7Jdbhqr0BUH9Qg3zjfGdzbLqmebeNFLUu+qmd7wSHHZ+Bu98RWr9Pma
         ZqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Lt2LNgZteA1015AH8RPlPAXBlsU68AoI/PjuZOL4wJw=;
        b=Chr5kYeVGkKrYjYm2X7h2hC3rC+vGZZgk/SrcqmCpto40jLi+1vKCq2ahMwpPhfadk
         Nmln6rtj0ZM0xZjvRN+R/VrfMK5GQts0TSLljxi9mCsganal+cFCTlOFgGoaEiZiyBy+
         Lhz3T7lR344Tgw3H7poQ158LrjMnD+5znKLByqxyWvqmx66bYEfNiwUz0Twwid7wT/I1
         4ovsZchmj8NXUoyGjt8i1fPTxGrrJvzjksHVIBtNWvwWxKfJL1MWCGKEgnaMor1/C/OP
         WKiT3IttCj0++LtkogfcH4n2OE6lO5r8+Vdl9FlUHQgaTFFQAXbWXgW9hgueIf+Hz40C
         aVpQ==
X-Gm-Message-State: APjAAAV+hYhgQ+RmBJHczS/DJsnoaM1MQrpUFEqjbCRPA1Moc1ymCY0G
        36z2QeEqDjBZ5l61glZ4HYgFaXNRDNIcZ9Zl0zbFymtLuSA=
X-Google-Smtp-Source: APXvYqyz1i8d2nUX1gnH+75CzrCpCIaTnZvWw7nQbDorzBheEXqkX1GB+JjXLi1OTF5M1F2B6bp52995KFFrXH5PXZ4=
X-Received: by 2002:a05:6830:1681:: with SMTP id k1mr3002752otr.256.1564474651973;
 Tue, 30 Jul 2019 01:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190730054347.15500-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190730054347.15500-1-yamada.masahiro@socionext.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 30 Jul 2019 10:17:21 +0200
Message-ID: <CAMpxmJViwcSCZVJM9DW=HYQkKeZh3E4fRCqU+314gvBo0njfKQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: remove less important #ifdef around declarations
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 30 lip 2019 o 07:44 Masahiro Yamada
<yamada.masahiro@socionext.com> napisa=C5=82(a):
>
> The whole struct/function declarations in this header are surrounded
> by #ifdef.
>
> As far as I understood, the motivation of this is probably to break
> the build earlier if a driver misses to select or depend on correct
> CONFIG options in Kconfig.
>
> Since commit 94bed2a9c4ae ("Add -Werror-implicit-function-declaration")
> no one cannot call functions that have not been declared.
>
> So, I see some benefit in doing this in the cost of uglier headers.
>
> In reality, it would not be so easy to catch missed 'select' or
> 'depends on' because GPIOLIB, GPIOLIB_IRQCHIP etc. are already selected
> by someone else eventually. So, this kind of error, if any, will be
> caught by randconfig bots.
>
> In summary, I am not a big fan of cluttered #ifdef nesting, and this
> does not matter for normal developers. The code readability wins.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - rebase
>
>  include/linux/gpio/driver.h | 27 ++++++++-------------------
>  1 file changed, 8 insertions(+), 19 deletions(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 6a0e420915a3..f28f534f451a 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -20,9 +20,6 @@ struct module;
>  enum gpiod_flags;
>  enum gpio_lookup_flags;
>
> -#ifdef CONFIG_GPIOLIB
> -
> -#ifdef CONFIG_GPIOLIB_IRQCHIP
>  /**
>   * struct gpio_irq_chip - GPIO interrupt controller
>   */
> @@ -161,7 +158,6 @@ struct gpio_irq_chip {
>          */
>         void            (*irq_disable)(struct irq_data *data);
>  };
> -#endif /* CONFIG_GPIOLIB_IRQCHIP */
>
>  /**
>   * struct gpio_chip - abstract a GPIO controller
> @@ -441,16 +437,12 @@ bool gpiochip_line_is_valid(const struct gpio_chip =
*chip, unsigned int offset);
>  /* get driver data */
>  void *gpiochip_get_data(struct gpio_chip *chip);
>
> -struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
> -
>  struct bgpio_pdata {
>         const char *label;
>         int base;
>         int ngpio;
>  };
>
> -#if IS_ENABLED(CONFIG_GPIO_GENERIC)
> -
>  int bgpio_init(struct gpio_chip *gc, struct device *dev,
>                unsigned long sz, void __iomem *dat, void __iomem *set,
>                void __iomem *clr, void __iomem *dirout, void __iomem *dir=
in,
> @@ -463,10 +455,6 @@ int bgpio_init(struct gpio_chip *gc, struct device *=
dev,
>  #define BGPIOF_READ_OUTPUT_REG_SET     BIT(4) /* reg_set stores output v=
alue */
>  #define BGPIOF_NO_OUTPUT               BIT(5) /* only input */
>
> -#endif /* CONFIG_GPIO_GENERIC */
> -
> -#ifdef CONFIG_GPIOLIB_IRQCHIP
> -
>  int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
>                      irq_hw_number_t hwirq);
>  void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq);
> @@ -555,15 +543,11 @@ static inline int gpiochip_irqchip_add_nested(struc=
t gpio_chip *gpiochip,
>  }
>  #endif /* CONFIG_LOCKDEP */
>
> -#endif /* CONFIG_GPIOLIB_IRQCHIP */
> -
>  int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset);
>  void gpiochip_generic_free(struct gpio_chip *chip, unsigned offset);
>  int gpiochip_generic_config(struct gpio_chip *chip, unsigned offset,
>                             unsigned long config);
>
> -#ifdef CONFIG_PINCTRL
> -
>  /**
>   * struct gpio_pin_range - pin range controlled by a gpio chip
>   * @node: list for maintaining set of pin ranges, used internally
> @@ -576,6 +560,8 @@ struct gpio_pin_range {
>         struct pinctrl_gpio_range range;
>  };
>
> +#ifdef CONFIG_PINCTRL
> +
>  int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_na=
me,
>                            unsigned int gpio_offset, unsigned int pin_off=
set,
>                            unsigned int npins);
> @@ -586,8 +572,6 @@ void gpiochip_remove_pin_ranges(struct gpio_chip *chi=
p);
>
>  #else /* ! CONFIG_PINCTRL */
>
> -struct pinctrl_dev;
> -
>  static inline int
>  gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
>                        unsigned int gpio_offset, unsigned int pin_offset,
> @@ -619,6 +603,11 @@ void gpiochip_free_own_desc(struct gpio_desc *desc);
>  void devprop_gpiochip_set_names(struct gpio_chip *chip,
>                                 const struct fwnode_handle *fwnode);
>
> +
> +#ifdef CONFIG_GPIOLIB
> +
> +struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
> +
>  #else /* CONFIG_GPIOLIB */
>
>  static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *de=
sc)
> @@ -630,4 +619,4 @@ static inline struct gpio_chip *gpiod_to_chip(const s=
truct gpio_desc *desc)
>
>  #endif /* CONFIG_GPIOLIB */
>
> -#endif
> +#endif /* __LINUX_GPIO_DRIVER_H */
> --
> 2.17.1
>

Patch applied, thanks!

Bartosz
