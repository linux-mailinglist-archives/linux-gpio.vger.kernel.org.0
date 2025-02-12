Return-Path: <linux-gpio+bounces-15866-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF84FA328EB
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C32651655B1
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D72210F5D;
	Wed, 12 Feb 2025 14:45:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED702101AD;
	Wed, 12 Feb 2025 14:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739371502; cv=none; b=j7gYa445l5bmKN96YpGbzjJeR7vy3Hgc/c2stckRye3WQkzBAHrz9wT1Mu1caZ9VNz1jjZKQsP7XvtkKaJ9MkuxyXPeWaZM4il+BwyoUbOe5KrDpvkXuX5sZ/NzNBDgtajUBbiecIhwM/zqAQbYBATXmnAWu6xZUrtNz1rHGCgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739371502; c=relaxed/simple;
	bh=jdrJz5pOk6kZyQ3eI5McSaQ4BYx0Q5MoCJhd+esFO1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQNK5VXwTNaNnaLg/HWkPvUSWojnNpgn9dbalR1fXjl1WiqLL1Bb2ZgX4o1oXwVZX8EKMn8acOnRl28mWSfv0ayOrZWLMB4JBg6q283V6tm9Rn10NGBoh03CEw1Upr+sDG8FyaOOCN2Z02jaMSthTsTX69UQZGAHrukXwW+h6DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52067a2ca31so540975e0c.0;
        Wed, 12 Feb 2025 06:45:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739371498; x=1739976298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEDxnqf6oWr6fziB6l6K3WllpKY4awxVDsvWozfR/s8=;
        b=NiK+yghJYrzELdMlqkuTV6+DN9vSnz8pW4iEAQu53lNeJ/ff87zO7m1HxuWol1L27r
         ZOiSxt3ko2RvBscdWmiCPiaua8lGdXtmaqqPUs1/9uUWInAUY6k/oQLhugy0FaLM1XlQ
         IXVg4PXBJLVSirhg3m7nAL+auOlT4LcJW+HBS1jdwuqO1+hskHJtBOxZg5NfgrOlvbHc
         edk9zBAcCeMsGFoVcjMC6Wx7AiJhXl7KWnqgrCEO4FEXWAadbRhVW/KPqxhfuWUvF6H4
         8NgDzw0FKVgHIVq9dlqujsgUYmlUYMbu+O62gkWaUzPLYqns/l+aQroRiX1rnlTfkvGL
         kxhA==
X-Forwarded-Encrypted: i=1; AJvYcCXo0LjOI+qBAcz5hYe1BjXOxypwKqLRAaaXPNI8iIxzakEEjRmovkp2uWXlcfVR1ouAG2/fDeOC+SMVNik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaP8IahekOS2qnZe09nCyvN4aVkTvpIcvAyMrqblaraXitxb79
	Fs9iDenxNus2pobmbx7t5gqkQPbAKJ/+7JhYt4/OJpHyxL4CS5OZrxiAXXK/RYI=
X-Gm-Gg: ASbGnct1VquOHMIEeMyCl8Mu4xHuea64KnaHiiVPfkOsmC2XqVjUzkSIJtj/tqMWbr3
	CwCTdsAp0eAxrtFuoQKt/ApKWroGbppS0eonoJCKYKL5mxEw/x1QUWoaZlNZRYLIAvl6YNne9vg
	bEctzwiVHH1g9GHmnsXEQ2e1iSeVmd7PCucWDPyEeIfWlKYbpv5QnwbwfASEkhIu3TRRlyCsM/g
	3Rzngvwe8xaQpUx+ID2kwzRb9AuuoLNidpsKjHqh7sIXgPW1z/mamSMkANRv7kJ3pTOFo7EUUi9
	+e9I1Pc4aPI5S9rbnJMqGLp4RDAQMx7mmqKqwFkes/4lAjB3QB1VHQ==
X-Google-Smtp-Source: AGHT+IGIdWhHWJaVcigYKKC4si81fU7TMHtupMErlYWzlNIyeyFBbbQ7nGJqeCgczt1082vxyqA6KQ==
X-Received: by 2002:a05:6122:16a2:b0:520:6773:e5ba with SMTP id 71dfb90a1353d-52067b2abdemr3147759e0c.2.1739371498319;
        Wed, 12 Feb 2025 06:44:58 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5204e43616esm670120e0c.21.2025.02.12.06.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 06:44:58 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-866faa61728so3927669241.2;
        Wed, 12 Feb 2025 06:44:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+2o7/pj5UF+cI67vtth/0HiwtiJlm6VvU+GobBgGxr2grQKH1N8MPZiiXmqARjUTLbx6yfKRsNJ+e14c=@vger.kernel.org
X-Received: by 2002:a05:6102:c12:b0:4bb:eb4a:f9f0 with SMTP id
 ada2fe7eead31-4bbf2248e10mr3088946137.24.1739371497811; Wed, 12 Feb 2025
 06:44:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-6-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-6-koichiro.den@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 15:44:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAiuvxD4ydtsWfWXBhHLDJz66Ay8w15WHr278OnB=ZKg@mail.gmail.com>
X-Gm-Features: AWEUYZlBC_E2Mdx31xtuJpc0ys2cVZM7Oz-8acpKE4ZjaN81UYXjQ-HLSzxFpFE
Message-ID: <CAMuHMdVAiuvxD4ydtsWfWXBhHLDJz66Ay8w15WHr278OnB=ZKg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] gpio: aggregator: expose custom line names to
 forwarder gpio_chip
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

Thanks for your patch!

On Mon, 3 Feb 2025 at 04:12, Koichiro Den <koichiro.den@canonical.com> wrote:
> Previously, GPIO lines in the aggregator had empty names. Now that the

That is only true for aggregators created through the sysfs interface,
right?  When created from DT, gpio-line-names is already supported:
https://elixir.bootlin.com/linux/v6.13.2/source/Documentation/admin-guide/gpio/gpio-aggregator.rst#L72

> configfs interface supports custom names, update the GPIO forwarder to
> use them.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -425,6 +425,20 @@ static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *c
>  }
>  #endif /* !CONFIG_OF_GPIO */
>
> +static int gpiochip_fwd_line_names(struct device *dev, const char **names, int len)
> +{
> +       int num = device_property_string_array_count(dev, "gpio-line-names");
> +       if (!num)
> +               return 0;
> +       if (num > len) {
> +               pr_warn("gpio-line-names contains %d lines while %d expected",
> +                       num, len);
> +               num = len;
> +       }
> +       return device_property_read_string_array(dev, "gpio-line-names",
> +                                                names, num);
> +}
> +
>  /**
>   * gpiochip_fwd_create() - Create a new GPIO forwarder
>   * @dev: Parent device pointer
> @@ -447,6 +461,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
>  {
>         const char *label = dev_name(dev);
>         struct gpiochip_fwd *fwd;
> +       const char **line_names;
>         struct gpio_chip *chip;
>         unsigned int i;
>         int error;
> @@ -458,6 +473,16 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
>
>         chip = &fwd->chip;
>
> +       if (!dev_of_node(dev)) {
> +               line_names = devm_kcalloc(dev, sizeof(*line_names), ngpios, GFP_KERNEL);

So this is always allocated, even when no names are specified?

> +               if (!line_names)
> +                       return ERR_PTR(-ENOMEM);
> +
> +               error = gpiochip_fwd_line_names(dev, line_names, ngpios);
> +               if (error < 0)
> +                       return ERR_PTR(-ENOMEM);
> +       }
> +
>         /*
>          * If any of the GPIO lines are sleeping, then the entire forwarder
>          * will be sleeping.
> @@ -491,6 +516,9 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
>         chip->ngpio = ngpios;
>         fwd->descs = descs;
>
> +       if (!dev_of_node(dev))
> +               chip->names = line_names;
> +

Do you actually need to collect the names yourself?
Below, the driver does:

     error = devm_gpiochip_add_data(dev, chip, fwd);

and gpiochip_add_data_with_key() already calls gpiochip_set_names()
to retrieve the names from the gpio-line-names property.
What is missing to make that work?

>         if (chip->can_sleep)
>                 mutex_init(&fwd->mlock);
>         else
> @@ -530,10 +558,40 @@ to_gpio_aggregator_line(struct config_item *item)
>         return container_of(group, struct gpio_aggregator_line, group);
>  }
>
> +static struct fwnode_handle *aggr_make_device_swnode(struct gpio_aggregator *aggr)
> +{
> +       char **line_names __free(kfree) = NULL;

const (needed when gpio_aggregator_line.name becomes const)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

