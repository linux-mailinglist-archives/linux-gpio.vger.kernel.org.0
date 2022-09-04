Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C495AC64D
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Sep 2022 22:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234482AbiIDUPP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Sep 2022 16:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbiIDUPM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Sep 2022 16:15:12 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C29175B1
        for <linux-gpio@vger.kernel.org>; Sun,  4 Sep 2022 13:15:11 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w2so9063217edc.0
        for <linux-gpio@vger.kernel.org>; Sun, 04 Sep 2022 13:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=B0UcNE6NxxIEK/T2D5tC9KfKA9gJ+JcocCKLSydu1+k=;
        b=QsMqX+zGDd8becR5YbPdz3CvjWgJ/Ff19vFQlLyPQ1h1Kuu8+IMWsZh1cB7Cait8+n
         iE31bT2THSSmgkd9BAPM62u9HgLpoB1OIkfmnjLwBx3HL1mtltQxljzmt0ZCgScik2bH
         LIY2BMNdc/M7NzorgLISf5/k8DTT+V+ovxQWLFizYjrrdbKfCUi7JfH7Qx/t+cZormJ4
         rJ6FYsmDBXA9t/2xAEiMnkLTz7mUfab3Z+yr8u+YSRaO/+SSncW3jCFIGLB8vSJQ64Bg
         P184azlGAFE8liXKeaqsa0Dqpukvura38GhIqJb1/LaPKOMNEU8cml2AjGBiQcBcrQpi
         vWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=B0UcNE6NxxIEK/T2D5tC9KfKA9gJ+JcocCKLSydu1+k=;
        b=JSbY2LbNBiuAAm791lrw0yVEwyzzyt+F5ZerSykrj3CGggc4wnBgN1qKuuCBV5u7oZ
         gl2Qzl+fbrQsA5DuLeaLNKdW6ficJQelN4L2nU+2PMhsaYRDXOZyM17jQwme7eZ6p/Ek
         18HeEfTHyihm+eTa05gIwYmA8NVZjrZQ7rnXSYX7Rl9VMkAGZ6fFJgeIKrNgp0Aq1BwK
         fj8j5xyFXA5ZvBUq81wuE3K8EQaLMWn81iuPnCHErzIDMMRY5CY+RIUpYzd5I5hQfVt4
         Xl48L5KhZSRJvqy62HfwiJgXvDH9XNcN/on/RMlzjDh9TQ+3NmpFwws1l12tflhxiq7U
         U07A==
X-Gm-Message-State: ACgBeo25is48mhyfBELEdfILbvz/nHFcjxNXPF+EcDU+xFgkP2GqWKXy
        lBtPH4Jla4cVudOZfTZmb21UOPVJZb5PwsCuJK59Kg==
X-Google-Smtp-Source: AA6agR4HhRTeC470jwaUuyblo5zi9/wv7ouI3w+gC3QMbRTKnsiWG+DY/w8S3Xw5JC5qq+/xDHtQjaSrzSEIDNoXhjY=
X-Received: by 2002:a05:6402:4007:b0:448:6c4c:b40 with SMTP id
 d7-20020a056402400700b004486c4c0b40mr29495975eda.422.1662322509795; Sun, 04
 Sep 2022 13:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220902-get_gpiod_from_child-remove-v1-0-1e47125df20f@gmail.com> <20220902-get_gpiod_from_child-remove-v1-3-1e47125df20f@gmail.com>
In-Reply-To: <20220902-get_gpiod_from_child-remove-v1-3-1e47125df20f@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 4 Sep 2022 22:14:59 +0200
Message-ID: <CAMRc=Md=uOtULefxLRD_t2+o1_qcr5aSZe6Tzy+i+hOeNMejWQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpiolib: remove devm_fwnode_get_[index_]gpiod_from_child()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 3, 2022 at 2:56 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Now that there are no more users of these APIs in the kernel we can
> remove them.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index fe0f460d9a3b..2ccda8567533 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -594,27 +594,6 @@ struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
>                                            flags, label);
>  }
>
> -static inline
> -struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
> -                                               const char *con_id, int index,
> -                                               struct fwnode_handle *child,
> -                                               enum gpiod_flags flags,
> -                                               const char *label)
> -{
> -       return devm_fwnode_gpiod_get_index(dev, child, con_id, index,
> -                                          flags, label);
> -}
> -
> -static inline
> -struct gpio_desc *devm_fwnode_get_gpiod_from_child(struct device *dev,
> -                                                  const char *con_id,
> -                                                  struct fwnode_handle *child,
> -                                                  enum gpiod_flags flags,
> -                                                  const char *label)
> -{
> -       return devm_fwnode_gpiod_get_index(dev, child, con_id, 0, flags, label);
> -}
> -
>  #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_OF_GPIO)
>  struct device_node;
>
>
> --
> b4 0.10.0-dev-fc921

Either:

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>

Or I can take pull an immutable branch from the leds tree.

Bart
