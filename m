Return-Path: <linux-gpio+bounces-15914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3FDA341A3
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 15:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3A2D16C4D5
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 14:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459BE23A9B2;
	Thu, 13 Feb 2025 14:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="nKPPdzv+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09AC23A9AF
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455993; cv=none; b=a0WKMeu4L9XhMJBVPs4Mc5aLap8Efhekn6d+jl1tp4uRvZjrHKeo3iU47XLHNwpOEBr6TNwRyOChNFPdd7M4ltIcupDMKUr3qZUowauQLTK2cgkQ9wvF3d0ex1gp1YR6/lIeuaYkedUHzjE3vues/zse+46x5lk/SMntAHx0zbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455993; c=relaxed/simple;
	bh=w9EDRrNS/qPN0D6DIdMF/UGB626BuOFajLNoMlFjPQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsFSo/QEaKwqwr8wS6ymKhKKlF5dr9agDxxFRSMwi+orYzb87/QZLDlFAJ7npblv075G4KPQFknFItiz5REcQW+6AoMlfPX4/8SbcysPwPKkTbMLMhYj/2f46H6XQsoVwh3NnhbUvTfFPZZvHzxAMqAT6VJguyomITDMKMgvxVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=nKPPdzv+; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DAE783F302
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739455982;
	bh=XGe8LpamlJKVdVuIRg1JADMoQRCF9KOaZW0vX5oQLeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=nKPPdzv+uZRBP/vEEW/HUC53MU1M/vNyRiwfUcluJlPaBole6z8VAh8UGFDOkdyTK
	 4weL1sQ2qXPvpusScsX37i/vkI7NPIKOFR69FV50wAaNa6RcmWrsusqPYnukN6NQBF
	 QtYjYLWh6SPr5Y7Ia8J1Fiwo0UrRjMm+GPT4TZc83ivTsjwgMK7uFOSOuenKHorLGr
	 9cNYnWUDP+5zr5InFPt6zYb9bOBLyx5dgxYNKCbREAhGhyrlGnVWlKAxNdQG0/thmC
	 W7PRr7RdIej8wycg9Vi8TLTLWt/JVwqkJTD+W5uIjWv8mMxHnKl41gwJIcaZYsSHce
	 lY94V0eW6V63A==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-220e62c4fc2so2649065ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 06:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455979; x=1740060779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGe8LpamlJKVdVuIRg1JADMoQRCF9KOaZW0vX5oQLeM=;
        b=b0ObjX/234Lcis6QxXNs1d/XU8YVeZozTM0/HptBRTfwnKc9G0TTtJ8x/iskdi2F7E
         HzvCAWc6/hEZDoqq3ovlhKI1mX4S//bS4EiEba7wAc60blGz93aL0796lrZqCs11kJmJ
         FzEcgXkJqERHAytXVZLV0YW/vyk8kZReVBY09PRRFtgtm3Gom3isfmao66REYbn7Vibl
         YoafREHHekrDbr3o5af6a8/Q79tKyjp1Ev64Gk5dfKwEWfANwRHYlQ8wRq8Ikq3KBqUU
         XIlFv7HmF2/tc4hxMrLHlWgM5T3Aqm/2K4RquMI+9ZbJzDTKYyzYIBPsy2hPQxSj0Jux
         8ITQ==
X-Gm-Message-State: AOJu0YwfS2hdjcByMWLxqqUTfbYC7VrXeT2fvi1BmpwMrVzwjuQr15D+
	rX9qJ0G3gkB2YeVS47gUIdXKcg3B8lUq51KmXYgvA/1G9GbIbbGb4NK1D0IP7g4ZaRe3KGUsxFa
	TtKnqgXlVc9bk4CVQLM5JyEL/amaTcNtxkHveFAiHHZL8qRmbEoGvYmmWmCj26V/JZJssh1IEEm
	c=
X-Gm-Gg: ASbGncvLsTMDTdtF8aZwv5nufqfMbd4evPwSM/XIWpPJjQsEEi4ca9Jvcz0yWTXKzXL
	l8Tq4xLDgiDGhrWxkHd1w7B6EmGOkRqapNGfbvDndUT/+hOzCGEeh/sYLLnypU7ZmmahSEDiuXH
	UCmwHcuvzR9RUgixSn6InUut6FFceDaJKgl7C6rem2e0Uqj3MS9g9hivyMKwliUikSl+gUEPhgJ
	Or01EXNxro04cyCZH+RXjKavf14S2Svnj1m4imQGt/wtzgBx7gwoG3Zka0GdJwWI/M3By+EX4a+
	I2RFjlM=
X-Received: by 2002:a17:902:dac2:b0:215:b75f:a1cb with SMTP id d9443c01a7336-220bbaafc7cmr110508835ad.9.1739455978828;
        Thu, 13 Feb 2025 06:12:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFqlgAEZkP/m5vX34A50sIbpJIWVEaplvjZxgLvlBPDOq37hOiYgiwjphpOIJ+Z0ODpby22A==
X-Received: by 2002:a17:902:dac2:b0:215:b75f:a1cb with SMTP id d9443c01a7336-220bbaafc7cmr110508475ad.9.1739455978431;
        Thu, 13 Feb 2025 06:12:58 -0800 (PST)
Received: from localhost ([240f:74:7be:1:5439:d90c:a342:e2bb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d067sm12690555ad.109.2025.02.13.06.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:12:58 -0800 (PST)
Date: Thu, 13 Feb 2025 23:12:56 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] gpio: aggregator: introduce basic configfs
 interface
Message-ID: <uwd2pczhwy6coa2oopsb3drtulnhvw5snmktikhbuhc5lljzio@3ixj2ksfhb4l>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-3-koichiro.den@canonical.com>
 <CAMuHMdXCAH=5Az9fq33-8izCLRbzxOM6zj8VbPWj0iR=KXPFtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXCAH=5Az9fq33-8izCLRbzxOM6zj8VbPWj0iR=KXPFtw@mail.gmail.com>

On Wed, Feb 12, 2025 at 02:48:12PM GMT, Geert Uytterhoeven wrote:
> Hi Den-san,
> 
> On Mon, 3 Feb 2025 at 04:12, Koichiro Den <koichiro.den@canonical.com> wrote:
> > The existing sysfs 'new_device' interface has several limitations:
> > * No way to determine when GPIO aggregator creation is complete.
> > * No way to retrieve errors when creating a GPIO aggregator.
> > * No way to trace a GPIO line of an aggregator back to its
> >   corresponding physical device.
> > * The 'new_device' echo does not indicate which virtual gpiochip<N>
> >   was created.
> > * No way to assign names to GPIO lines exported through an aggregator.
> >
> > Introduce the new configfs interface for gpio-aggregator to address
> > these limitations. It provides a more streamlined, modern, and
> > extensible configuration method. For backward compatibility, the
> > 'new_device' interface and its behaviour is retained for now.
> >
> > This commit implements minimal functionalities:
> >
> >   /config/gpio-aggregator/<name-of-your-choice>/
> >   /config/gpio-aggregator/<name-of-your-choice>/live
> >   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/
> >   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/key
> >   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/offset
> >
> > Basic setup flow is:
> > 1. Create a directory for a GPIO aggregator.
> > 2. Create subdirectories for each line you want to instantiate.
> > 3. In each line directory, configure the key and offset.
> >    The key/offset semantics are as follows:
> >    * If offset is >= 0:
> >      - key specifies the name of the chip this GPIO belongs to
> >      - offset specifies the line offset within that chip.
> >    * If offset is <0:
> >      - key needs to specify the GPIO line name.
> > 4. Return to the aggregator's root directory and write '1' to the live
> >    attribute.
> >
> > For example, the command in the existing kernel doc:
> >
> >   echo 'e6052000.gpio 19 e6050000.gpio 20-21' > new_device
> >
> > is equivalent to:
> >
> >   mkdir /sys/kernel/config/gpio-aggregator/<custom-name>
> >   # Change <custom-name> to name of your choice (e.g. "aggr0")
> >   cd /sys/kernel/config/gpio-aggregator/<custom-name>
> >   mkdir line0 line1 line2  # Only "line<Y>" naming allowed.
> >   echo e6052000.gpio > line0/key
> >   echo 19            > line0/offset
> >   echo e6050000.gpio > line1/key
> >   echo 20            > line1/offset
> >   echo e6050000.gpio > line2/key
> >   echo 21            > line2/offset
> >   echo 1             > live
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/gpio/gpio-aggregator.c
> > +++ b/drivers/gpio/gpio-aggregator.c
> > @@ -9,10 +9,14 @@
> >
> >  #include <linux/bitmap.h>
> >  #include <linux/bitops.h>
> > +#include <linux/completion.h>
> > +#include <linux/configfs.h>
> 
> Using configfs requires CONFIG_CONFIGFS_FS.
> So either GPIO_AGGREGATOR should select CONFIGFS_FS, or
> all configfs-related code should be protected by checks for
> CONFIG_CONFIGFS_FS.  Since we want to encourage people to use the new
> API, I think the former is preferred.

Indeed. I had mentioned this in the response to Bartosz here:
https://lore.kernel.org/all/dmy4mvxut3l5kqds2b2fnnes5ukr73spddwgrbkeoqrb5p5wir@hkq6ltr7d6dt/

I agree with the former.

> 
> >  #include <linux/ctype.h>
> >  #include <linux/delay.h>
> >  #include <linux/idr.h>
> >  #include <linux/kernel.h>
> > +#include <linux/list.h>
> > +#include <linux/lockdep.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > @@ -34,11 +38,39 @@
> >   */
> >
> >  struct gpio_aggregator {
> > +       struct config_group group;
> >         struct gpiod_lookup_table *lookups;
> >         struct platform_device *pdev;
> > +       struct mutex lock;
> > +       int id;
> > +
> > +       /* Synchronize with probe */
> > +       struct notifier_block bus_notifier;
> > +       struct completion probe_completion;
> > +       bool driver_bound;
> > +
> > +       /* List of gpio_aggregator_line. Always added in order */
> > +       struct list_head list_head;
> > +
> >         char args[];
> >  };
> >
> > +struct gpio_aggregator_line {
> > +       struct config_group group;
> > +       struct gpio_aggregator *parent;
> > +       struct list_head entry;
> > +
> > +       /* Line index within the aggregator device */
> > +       int idx;
> 
> unsigned int

Thanks. I'll fix this in v3.

> 
> > +
> > +       /* GPIO chip label or line name */
> > +       char *key;
> > +       /* Can be negative to indicate lookup by line name */
> > +       int offset;
> > +
> > +       enum gpio_lookup_flags flags;
> > +};
> > +
> >  static DEFINE_MUTEX(gpio_aggregator_lock);     /* protects idr */
> >  static DEFINE_IDR(gpio_aggregator_idr);
> 
> > +static bool aggr_is_active(struct gpio_aggregator *aggr)
> > +{
> > +       lockdep_assert_held(&aggr->lock);
> > +
> > +       return !!aggr->pdev && platform_get_drvdata(aggr->pdev);
> 
> No need for "!!".

I'll fix this in v3.

> 
> > +}
> 
> > +static void aggr_line_add(struct gpio_aggregator *aggr,
> > +                         struct gpio_aggregator_line *line)
> > +{
> > +       struct gpio_aggregator_line *tmp;
> > +
> > +       lockdep_assert_held(&aggr->lock);
> > +
> > +       list_for_each_entry(tmp, &aggr->list_head, entry) {
> > +               if (WARN_ON(tmp->idx == line->idx))
> 
> Can this really happen?

I don't think so. It was just a safeguard for the future to help us notice
when something very bad would happen, caused by changes on codebase. So let
me drop it in v3.

> 
> > +                       return;
> > +               if (tmp->idx > line->idx) {
> > +                       list_add_tail(&line->entry, &tmp->entry);
> > +                       return;
> > +               }
> > +       }
> > +       list_add_tail(&line->entry, &aggr->list_head);
> > +}
> 
> > +static void aggr_lockup_configfs(struct gpio_aggregator *aggr, bool lock)
> > +{
> > +       struct configfs_subsystem *subsys = aggr->group.cg_subsys;
> > +       struct gpio_aggregator_line *line;
> > +
> > +       /*
> > +        * The device only needs to depend on leaf lines. This is
> > +        * sufficient to lock up all the configfs entries that the
> > +        * instantiated, alive device depends on.
> > +        */
> > +       list_for_each_entry(line, &aggr->list_head, entry) {
> > +               if (lock)
> > +                       WARN_ON(configfs_depend_item_unlocked(
> > +                                       subsys, &line->group.cg_item));
> 
> Can this happen?
> I am also worried if this can be triggered by the user, combined
> with panic_on_warn.

I don't think so. This was just a safeguard for the future.

> 
> > +               else
> > +                       configfs_undepend_item_unlocked(
> > +                                       &line->group.cg_item);
> > +       }
> > +}
> > +
> > +static ssize_t
> > +gpio_aggr_line_key_show(struct config_item *item, char *page)
> > +{
> > +       struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
> > +       struct gpio_aggregator *aggr = line->parent;
> > +
> > +       guard(mutex)(&aggr->lock);
> > +
> > +       return sprintf(page, "%s\n", line->key ?: "");
> 
> Please use sysfs_emit() instead (everywhere).
> 

Thanks for pointing it out. I'll fix all of them in v3.

> 
> > +}
> 
> > +static ssize_t
> > +gpio_aggr_device_live_store(struct config_item *item, const char *page,
> > +                           size_t count)
> > +{
> > +       struct gpio_aggregator *aggr = to_gpio_aggregator(item);
> > +       int ret = 0;
> > +       bool live;
> > +
> > +       ret = kstrtobool(page, &live);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (live)
> > +               aggr_lockup_configfs(aggr, true);
> > +
> > +       scoped_guard(mutex, &aggr->lock) {
> > +               if (live == aggr_is_active(aggr))
> > +                       ret = -EPERM;
> > +               else if (live)
> > +                       ret = aggr_activate(aggr);
> > +               else
> > +                       aggr_deactivate(aggr);
> > +       }
> > +
> > +       /*
> > +        * Undepend is required only if device disablement (live == 0)
> 
> s/Undepend/Lock-up/?

I must admit that I couldn't find a best suitable antonym to 'depend'.
IMO Lock-up sounds a bit misleading. How about 'Unlock'?

> 
> > +        * succeeds or if device enablement (live == 1) fails.
> > +        */
> > +       if (live == !!ret)
> > +               aggr_lockup_configfs(aggr, false);
> > +
> > +       return ret ?: count;
> > +}
> 
> > +static struct config_group *
> > +gpio_aggr_make_group(struct config_group *group, const char *name)
> > +{
> > +       /* arg space is unneeded */
> > +       struct gpio_aggregator *aggr = kzalloc(sizeof(*aggr), GFP_KERNEL);
> > +       if (!aggr)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       mutex_lock(&gpio_aggregator_lock);
> > +       aggr->id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
> > +       mutex_unlock(&gpio_aggregator_lock);
> > +
> > +       if (aggr->id < 0) {
> > +               kfree(aggr);
> > +               return ERR_PTR(aggr->id);
> > +       }
> 
> The above more or less duplicates the existing code in
> new_device_store().

I'll factor out the common part and add new funcs gpio_alloc()/gpio_free().
Please let me know if any objections.

> 
> > +
> > +       INIT_LIST_HEAD(&aggr->list_head);
> > +       mutex_init(&aggr->lock);
> > +       config_group_init_type_name(&aggr->group, name, &gpio_aggr_device_type);
> > +       init_completion(&aggr->probe_completion);
> > +
> > +       return &aggr->group;
> > +}
> 
> Gr{oetje,eeting}s,

Thanks for the review.

Koichiro

> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

