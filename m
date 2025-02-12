Return-Path: <linux-gpio+bounces-15851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 603AFA3277B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC1723A3ED0
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 13:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2CB3BB54;
	Wed, 12 Feb 2025 13:48:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F427181F;
	Wed, 12 Feb 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739368109; cv=none; b=rsaDIuFIEOwnjihBJQj6vd7STIxVG8lO/46InQN0OZE48I7XU8IIQ0KA5IA5G5OrS8+GQf8kwZHzzhet+6BEe/Et/dgbPCr7IGa+2PC4Pjrb7uUKkSfZk5zcYXw0pUwY6kwtgNkOhqcl7neCSucsSS/SUMTVWI+IKu8xqSjlwx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739368109; c=relaxed/simple;
	bh=YgNazSPuZP67B7SpYjUZ6vVvMN8W7GFutmn8IfY3wtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DtQDkensLTcyKSZW45LBGVCpTz/3mLAMELDuFNItotmx9iHbKQ5uSxKcCcRjFrmrGuQL5lSYlrtZj2Dl6AsSz5eZ7eWpbt8trBAm90HkqQttoJeRW0cHuMGuD0nE4dqqltggNCt115cT5oe6J/6LovWDTy3r53DQESj2sUOr624=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5205539e38cso583272e0c.0;
        Wed, 12 Feb 2025 05:48:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739368105; x=1739972905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLmliqgqberlgcuZIoGufpRBbuTFaATaAsV8mqEroag=;
        b=whpigQuSMvHTKgwWhAn7Vhj3NK7mbR3O0z3jLFvB2WUjLQp+Pt4tIvNE4nyqDWoXa6
         PTEHUrA/iHjuDOa21GMS/MekWIbdeVTX74idVN3/uFUy1Eeqam8BndSx0mLmIXh59NN6
         gjbNmMux8B7/aDyRCsqtMEV1InvuEsuiI+vX/tu+ugzuptEdfl9hh86uQ0TG8lOshQXt
         nVUuX9jnne3XROZXCuwUdoe4m9XhraVM2uuzMJE9P/5uhNR3ag/O3udO/5igKjN0Wlsm
         Qcp8WHKRMsWgK4GLau+BlWXpyPEHMQaEi3V1DB4B3NBplAyhY2uRnkUh/JiKzgjFgWtJ
         st4w==
X-Forwarded-Encrypted: i=1; AJvYcCXJn+xjeHW4v1pmzJSizh7VtHUfiZdik+vUPEc2JlZ4xMYIQFo/5TYMnfMpB6i4bPSR7Bqd82HAXd2AK38=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYgQYOJ1lrIHvjPoYlc82jx6OnTkQNU4Y3qGAxMcOTOqjb0mDs
	6DT6YUhM/uPPOfuJ4DQcbHSsc1xxKKFFRR8WsSRwt+4HKZHIKAJeLW0CYASfaaw=
X-Gm-Gg: ASbGnctNrnc6wo2zSKwqed1NPils2/+fAmuliJBzJpkwfW3vxP3wVbdk33NE2ii+zDf
	vlNLbdt/xzs3W/HwCKCXKC2NsMKtYTguMTPvvJdH1HF349H5rgoUziTE4hX7PQaQ8v03GtJ6Scg
	DYFn0fdTOgyWHIQ28FApaiCr5UZj7tSV4iJf/S0UFCUXaDaAGsom3m5jp+NBlNkWL51gLLTs5zq
	PBg7jNWKxXPrKXIHICo3aZ+GADUId6z4QXiGLvIjeNeh6XlU98K5iA7QVvzeJ0wTNHZ2wGJB2LP
	DX5Lp44EkaUayEMw4IKvU2xxs36gfU9Nx7mxJmG4uwSGgvGAHTsUCA==
X-Google-Smtp-Source: AGHT+IH3Y48R2ZJ4R6YKz93HIIVM5ywdZ/StoZIYRvEPTZ5OqfQ9q0VeYeAQ4FSS5J4WO+xWWrE8hg==
X-Received: by 2002:a05:6122:1797:b0:520:42d3:91c1 with SMTP id 71dfb90a1353d-52069e13313mr1408215e0c.10.1739368105124;
        Wed, 12 Feb 2025 05:48:25 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51f42734a5dsm1275726e0c.17.2025.02.12.05.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 05:48:24 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4ba722d3916so1667810137.2;
        Wed, 12 Feb 2025 05:48:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWweo9s6w9KIPtNa4k3nXGL3AbWZ1J/GHMAI1t09ClZ9M6f+LJsVu0+lemwMC9Ahwmi3tGyCZTvmzZ5E4M=@vger.kernel.org
X-Received: by 2002:a05:6102:290e:b0:4b1:1eb5:8ee3 with SMTP id
 ada2fe7eead31-4bbf56c9ea2mr1860862137.22.1739368104389; Wed, 12 Feb 2025
 05:48:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-3-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-3-koichiro.den@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 14:48:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXCAH=5Az9fq33-8izCLRbzxOM6zj8VbPWj0iR=KXPFtw@mail.gmail.com>
X-Gm-Features: AWEUYZnXuYGZ3QeleJZDyo2hHX3sf1Q4nEyvTm2jTsGdtwsxeYGffrrnLZjGaiM
Message-ID: <CAMuHMdXCAH=5Az9fq33-8izCLRbzxOM6zj8VbPWj0iR=KXPFtw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] gpio: aggregator: introduce basic configfs interface
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

On Mon, 3 Feb 2025 at 04:12, Koichiro Den <koichiro.den@canonical.com> wrote:
> The existing sysfs 'new_device' interface has several limitations:
> * No way to determine when GPIO aggregator creation is complete.
> * No way to retrieve errors when creating a GPIO aggregator.
> * No way to trace a GPIO line of an aggregator back to its
>   corresponding physical device.
> * The 'new_device' echo does not indicate which virtual gpiochip<N>
>   was created.
> * No way to assign names to GPIO lines exported through an aggregator.
>
> Introduce the new configfs interface for gpio-aggregator to address
> these limitations. It provides a more streamlined, modern, and
> extensible configuration method. For backward compatibility, the
> 'new_device' interface and its behaviour is retained for now.
>
> This commit implements minimal functionalities:
>
>   /config/gpio-aggregator/<name-of-your-choice>/
>   /config/gpio-aggregator/<name-of-your-choice>/live
>   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/
>   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/key
>   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/offset
>
> Basic setup flow is:
> 1. Create a directory for a GPIO aggregator.
> 2. Create subdirectories for each line you want to instantiate.
> 3. In each line directory, configure the key and offset.
>    The key/offset semantics are as follows:
>    * If offset is >= 0:
>      - key specifies the name of the chip this GPIO belongs to
>      - offset specifies the line offset within that chip.
>    * If offset is <0:
>      - key needs to specify the GPIO line name.
> 4. Return to the aggregator's root directory and write '1' to the live
>    attribute.
>
> For example, the command in the existing kernel doc:
>
>   echo 'e6052000.gpio 19 e6050000.gpio 20-21' > new_device
>
> is equivalent to:
>
>   mkdir /sys/kernel/config/gpio-aggregator/<custom-name>
>   # Change <custom-name> to name of your choice (e.g. "aggr0")
>   cd /sys/kernel/config/gpio-aggregator/<custom-name>
>   mkdir line0 line1 line2  # Only "line<Y>" naming allowed.
>   echo e6052000.gpio > line0/key
>   echo 19            > line0/offset
>   echo e6050000.gpio > line1/key
>   echo 20            > line1/offset
>   echo e6050000.gpio > line2/key
>   echo 21            > line2/offset
>   echo 1             > live
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -9,10 +9,14 @@
>
>  #include <linux/bitmap.h>
>  #include <linux/bitops.h>
> +#include <linux/completion.h>
> +#include <linux/configfs.h>

Using configfs requires CONFIG_CONFIGFS_FS.
So either GPIO_AGGREGATOR should select CONFIGFS_FS, or
all configfs-related code should be protected by checks for
CONFIG_CONFIGFS_FS.  Since we want to encourage people to use the new
API, I think the former is preferred.

>  #include <linux/ctype.h>
>  #include <linux/delay.h>
>  #include <linux/idr.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/lockdep.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -34,11 +38,39 @@
>   */
>
>  struct gpio_aggregator {
> +       struct config_group group;
>         struct gpiod_lookup_table *lookups;
>         struct platform_device *pdev;
> +       struct mutex lock;
> +       int id;
> +
> +       /* Synchronize with probe */
> +       struct notifier_block bus_notifier;
> +       struct completion probe_completion;
> +       bool driver_bound;
> +
> +       /* List of gpio_aggregator_line. Always added in order */
> +       struct list_head list_head;
> +
>         char args[];
>  };
>
> +struct gpio_aggregator_line {
> +       struct config_group group;
> +       struct gpio_aggregator *parent;
> +       struct list_head entry;
> +
> +       /* Line index within the aggregator device */
> +       int idx;

unsigned int

> +
> +       /* GPIO chip label or line name */
> +       char *key;
> +       /* Can be negative to indicate lookup by line name */
> +       int offset;
> +
> +       enum gpio_lookup_flags flags;
> +};
> +
>  static DEFINE_MUTEX(gpio_aggregator_lock);     /* protects idr */
>  static DEFINE_IDR(gpio_aggregator_idr);

> +static bool aggr_is_active(struct gpio_aggregator *aggr)
> +{
> +       lockdep_assert_held(&aggr->lock);
> +
> +       return !!aggr->pdev && platform_get_drvdata(aggr->pdev);

No need for "!!".

> +}

> +static void aggr_line_add(struct gpio_aggregator *aggr,
> +                         struct gpio_aggregator_line *line)
> +{
> +       struct gpio_aggregator_line *tmp;
> +
> +       lockdep_assert_held(&aggr->lock);
> +
> +       list_for_each_entry(tmp, &aggr->list_head, entry) {
> +               if (WARN_ON(tmp->idx == line->idx))

Can this really happen?

> +                       return;
> +               if (tmp->idx > line->idx) {
> +                       list_add_tail(&line->entry, &tmp->entry);
> +                       return;
> +               }
> +       }
> +       list_add_tail(&line->entry, &aggr->list_head);
> +}

> +static void aggr_lockup_configfs(struct gpio_aggregator *aggr, bool lock)
> +{
> +       struct configfs_subsystem *subsys = aggr->group.cg_subsys;
> +       struct gpio_aggregator_line *line;
> +
> +       /*
> +        * The device only needs to depend on leaf lines. This is
> +        * sufficient to lock up all the configfs entries that the
> +        * instantiated, alive device depends on.
> +        */
> +       list_for_each_entry(line, &aggr->list_head, entry) {
> +               if (lock)
> +                       WARN_ON(configfs_depend_item_unlocked(
> +                                       subsys, &line->group.cg_item));

Can this happen?
I am also worried if this can be triggered by the user, combined
with panic_on_warn.

> +               else
> +                       configfs_undepend_item_unlocked(
> +                                       &line->group.cg_item);
> +       }
> +}
> +
> +static ssize_t
> +gpio_aggr_line_key_show(struct config_item *item, char *page)
> +{
> +       struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
> +       struct gpio_aggregator *aggr = line->parent;
> +
> +       guard(mutex)(&aggr->lock);
> +
> +       return sprintf(page, "%s\n", line->key ?: "");

Please use sysfs_emit() instead (everywhere).


> +}

> +static ssize_t
> +gpio_aggr_device_live_store(struct config_item *item, const char *page,
> +                           size_t count)
> +{
> +       struct gpio_aggregator *aggr = to_gpio_aggregator(item);
> +       int ret = 0;
> +       bool live;
> +
> +       ret = kstrtobool(page, &live);
> +       if (ret)
> +               return ret;
> +
> +       if (live)
> +               aggr_lockup_configfs(aggr, true);
> +
> +       scoped_guard(mutex, &aggr->lock) {
> +               if (live == aggr_is_active(aggr))
> +                       ret = -EPERM;
> +               else if (live)
> +                       ret = aggr_activate(aggr);
> +               else
> +                       aggr_deactivate(aggr);
> +       }
> +
> +       /*
> +        * Undepend is required only if device disablement (live == 0)

s/Undepend/Lock-up/?

> +        * succeeds or if device enablement (live == 1) fails.
> +        */
> +       if (live == !!ret)
> +               aggr_lockup_configfs(aggr, false);
> +
> +       return ret ?: count;
> +}

> +static struct config_group *
> +gpio_aggr_make_group(struct config_group *group, const char *name)
> +{
> +       /* arg space is unneeded */
> +       struct gpio_aggregator *aggr = kzalloc(sizeof(*aggr), GFP_KERNEL);
> +       if (!aggr)
> +               return ERR_PTR(-ENOMEM);
> +
> +       mutex_lock(&gpio_aggregator_lock);
> +       aggr->id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
> +       mutex_unlock(&gpio_aggregator_lock);
> +
> +       if (aggr->id < 0) {
> +               kfree(aggr);
> +               return ERR_PTR(aggr->id);
> +       }

The above more or less duplicates the existing code in
new_device_store().

> +
> +       INIT_LIST_HEAD(&aggr->list_head);
> +       mutex_init(&aggr->lock);
> +       config_group_init_type_name(&aggr->group, name, &gpio_aggr_device_type);
> +       init_completion(&aggr->probe_completion);
> +
> +       return &aggr->group;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

