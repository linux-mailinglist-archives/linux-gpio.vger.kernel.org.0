Return-Path: <linux-gpio+bounces-15871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E107A32A33
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 16:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30D70188C022
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50D9211471;
	Wed, 12 Feb 2025 15:36:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6011220458B;
	Wed, 12 Feb 2025 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739374590; cv=none; b=giN0X0jNV6YzLwWcxUCepfiDkWbaLIYNWP+pEepFW+USHdE1k9HIBT1V5h7xCYeJBB8A/yabGF/9n8mGz4ML7acQpyjxt4rxA0R69theFPsTa8u47y6Me0Li6ETomyTOQPJ5UTzBDQpqMSLkosVv7ymcVtLE1sb7g5lSXlQKWi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739374590; c=relaxed/simple;
	bh=Y2Z1VCKjxS4yIRjxkepxwoahZFA0qDUNZodOPIXUHu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOsVX5uAN12kqbcEWocBM5dkL135Cyv1+EsWNgxDtEYz7d0Hb/xTyMK7WqN6cocAto3tLZ1+l2jvparFiVCC8x0SiIjjIuIHvYKbEy+mUE0QV68BSY5X9l2U6ls3FuCL6/r85ueSms4s9QtLK3tNm3OYBIwBcsiZDLRWOlq6big=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4ba722d3916so1705391137.2;
        Wed, 12 Feb 2025 07:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739374586; x=1739979386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jru7tjkitD6CGL0LXzfuui9MsmBiVNjlQsiAhN4uIG4=;
        b=ixsWjhbwEILLk2KHLq/GV17nNEcS3f5Ayj2goPedl4wiY5GN/sOSPh0PgCCztsXy6F
         nai5sfiUVFO7rPOgAiQ74d9t7JZCrZUPq62arrMTjWUvNbFvBAbqelQ351sY9g3PxLdZ
         ikVx212ma7bwbXwJJcleb8mmvM7krJ4jcOvVWKeSDWRTANVf1lFdHv6Jo/6/U//lsJVj
         RelDtueeqlZzJfjZ1g3QDWhQU0tcNUq8rh88qd0jGfIVPOp4bvxhlv8hPevpzUT5x4yT
         ymt7Lz7/PRdQbhuvCdGYx+pa0UqoVTtAaFPdIC7N6oJWiJN6ojTOSuD7oa9SojF/9npj
         bRvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB76F+gB9JSkhrzARf8zbXKhObDybRi6uqeNvJoLn46fuMNCZZJuhxNTW1YJSrtH2/319Z7Lp8Jrk/7+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/RXknKbgnHkpgeKesOJz58MPYTCxazk0Pt5RHSWI9+JrRKiTI
	oQi9V4rA1VnY6/8/B+m9i11LEHRzZYtMxau5cPnpjsbUBwxVFB8b/dakQj3K+f4=
X-Gm-Gg: ASbGncu0dFbx5Bv6yBydkFJLkXVa9BoN4rKTlkL0KVrICdhlsbQef1QayJwwRHRSMOr
	OexV8PpbrLpoT7tRfvl9GoMoHHjxbSnxwcN2Pk0brfvhDob9BAYw4kj5SzL0v4xt6oSwtKknpmB
	yBBzB7d0PKlTMgJT3YU5RC+A4xfNAQKkO4wUVgjs+WnVfhnX0oC3Hhf947O/waC2FsA/WRceMoR
	1IK5Db/7lFa1IdojJ4cDGty2HCMndzISTjveA1ZhBIlX1HgX0XgPLUUSsQYXuhkkIwHYwPlUS8U
	dY1b2Qe2YUHtMpSLwDX0ZlzBMmbuMZYzMKDgAZgC9H0c5pTRU+mx2SuObA==
X-Google-Smtp-Source: AGHT+IFl+vhDZ44u90HJXMvSDBCnSDzIWDU5ViJ/7hOfqDiH1CS8tekpdQ3cUzuiOmodiWATv2OVCQ==
X-Received: by 2002:a05:6102:f97:b0:4bb:becc:c7c7 with SMTP id ada2fe7eead31-4bbf55710camr2492459137.15.1739374586361;
        Wed, 12 Feb 2025 07:36:26 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba772d7239sm2313796137.19.2025.02.12.07.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 07:36:26 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51fd609388dso1418696e0c.1;
        Wed, 12 Feb 2025 07:36:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbVeLQntW0yYD2x6xTfCoqPmdrJpcDW4a7eh2EUW9HFBt+lN998o1gyBi2okRLG8ywhRE7VVm8p5lzpDs=@vger.kernel.org
X-Received: by 2002:a05:6122:4684:b0:520:43e0:8ea0 with SMTP id
 71dfb90a1353d-52069e1c67emr2446624e0c.11.1739374585810; Wed, 12 Feb 2025
 07:36:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-9-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-9-koichiro.den@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 16:36:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVNg5eAtKZ=X7qqnNybk1mS4-5HTVP_ut44D2qEpzkXPA@mail.gmail.com>
X-Gm-Features: AWEUYZk6fVo-zwslR1TI7xbnxvkkenPo-NuOB3O3OirBt25LNMkyG6w3Ev1woc4
Message-ID: <CAMuHMdVNg5eAtKZ=X7qqnNybk1mS4-5HTVP_ut44D2qEpzkXPA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] gpio: aggregator: expoose aggregator created via
 legacy sysfs to configfs
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

Thanks for your patch!

On Mon, 3 Feb 2025 at 04:14, Koichiro Den <koichiro.den@canonical.com> wrote:
> Expose settings for aggregators created using the sysfs 'new_device'
> interface to configfs. Once written to 'new_device', an "_auto.<N>" path
> appears in the configfs regardless of whether the probe succeeds.
> Consequently, users can no longer use that prefix for custom GPIO
> aggregator names. The 'live' attribute changes to 1 when the probe
> succeeds and the GPIO forwarder is instantiated.
>
> Note that the aggregator device created via sysfs is asynchrnous, i.e.

asynchronous

> writing into 'new_device' returns without waiting for probe completion,
> and the probe may succeed, fail, or eventually succeed via deferred
> probe. Thus, the 'live' attribute may change from 0 to 1 asynchronously
> without notice. So, editting key/offset/name while it's waiting for

editing

> deferred probe is prohibited.
>
> The configfs auto-generation relies on create_default_group(), which
> inherently prohibits rmdir(2). To align with the limitation, this commit
> also prohibits mkdir(2) for them. When users want to change the number
> of lines for an aggregator initialized via 'new_device', they need to
> tear down the device using 'delete_device' and reconfigure it from
> scratch. This does not break previous behaviour; users of legacy sysfs
> interface simply gain additional almost read-only configfs exposure.
>
> Still, users can write into 'live' attribute to toggle the device unless

write to the

> it's waiting for deferred probe. So once probe succeeds, they can
> deactivate it in the same manner as the devices initialized via
> configfs.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

> @@ -73,6 +76,10 @@ struct gpio_aggregator_line {
>         enum gpio_lookup_flags flags;
>  };
>
> +struct gpio_aggregator_pdev_meta {
> +       bool init_via_sysfs;
> +};

The use of this structure to indicate the instantiation method looks
a bit hacky to me, but I don't see a better way...

> +
>  static DEFINE_MUTEX(gpio_aggregator_lock);     /* protects idr */
>  static DEFINE_IDR(gpio_aggregator_idr);
>
> @@ -127,6 +134,14 @@ static bool aggr_is_active(struct gpio_aggregator *aggr)
>         return !!aggr->pdev && platform_get_drvdata(aggr->pdev);
>  }
>
> +/* Only aggregators created via legacy sysfs can be "activating". */
> +static bool aggr_is_activating(struct gpio_aggregator *aggr)
> +{
> +       lockdep_assert_held(&aggr->lock);
> +
> +       return !!aggr->pdev && !platform_get_drvdata(aggr->pdev);

No need for "!!".

> +}
> +
>  static size_t aggr_count_lines(struct gpio_aggregator *aggr)
>  {
>         lockdep_assert_held(&aggr->lock);

> @@ -1002,6 +1048,14 @@ gpio_aggr_make_group(struct config_group *group, const char *name)
>         if (!aggr)
>                 return ERR_PTR(-ENOMEM);
>
> +       /*
> +        * "_auto" prefix is reserved for auto-generated config group
> +        * for devices create via legacy sysfs interface.
> +        */
> +       if (strncmp(name, AGGREGATOR_LEGACY_PREFIX,
> +                   sizeof(AGGREGATOR_LEGACY_PREFIX)) == 0)
> +               return ERR_PTR(-EINVAL);

Missing kfree(aggr) in case of failure.

> +
>         mutex_lock(&gpio_aggregator_lock);
>         aggr->id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
>         mutex_unlock(&gpio_aggregator_lock);
> @@ -1044,6 +1098,8 @@ static struct configfs_subsystem gpio_aggr_subsys = {
>  static int aggr_parse(struct gpio_aggregator *aggr)
>  {
>         char *args = skip_spaces(aggr->args);
> +       struct gpio_aggregator_line *line;
> +       char name[CONFIGFS_ITEM_NAME_LEN];
>         char *key, *offsets, *p;
>         unsigned int i, n = 0;
>         int error = 0;
> @@ -1055,14 +1111,29 @@ static int aggr_parse(struct gpio_aggregator *aggr)
>
>         args = next_arg(args, &key, &p);
>         while (*args) {
> +               scnprintf(name, CONFIGFS_ITEM_NAME_LEN, "line%u", n);

sizeof(name), to protect against future changes of name[].

>  static ssize_t new_device_store(struct device_driver *driver, const char *buf,
>                                 size_t count)
>  {
> +       struct gpio_aggregator_pdev_meta meta;

You might as well pre-initialize this:

   = { .init_via_sysfs = true };

> +       char name[CONFIGFS_ITEM_NAME_LEN];
>         struct gpio_aggregator *aggr;
>         struct platform_device *pdev;
>         int res, id;
> @@ -1112,6 +1210,7 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
>
>         memcpy(aggr->args, buf, count + 1);
>
> +       aggr->init_via_sysfs = true;
>         aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
>                                 GFP_KERNEL);
>         if (!aggr->lookups) {
> @@ -1128,10 +1227,22 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
>                 goto free_table;
>         }
>
> +       scnprintf(name, CONFIGFS_ITEM_NAME_LEN,

sizeof(name)

> +                 "%s.%d", AGGREGATOR_LEGACY_PREFIX, id);
> +       INIT_LIST_HEAD(&aggr->list_head);
> +       mutex_init(&aggr->lock);
> +       config_group_init_type_name(&aggr->group, name, &gpio_aggr_device_type);
> +       init_completion(&aggr->probe_completion);

The code above is now almost identical to gpio_aggr_make_group().

> +
> +       /* Expose to configfs */
> +       res = configfs_register_group(&gpio_aggr_subsys.su_group, &aggr->group);
> +       if (res)
> +               goto remove_idr;
> +
>         aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, id);
>         if (!aggr->lookups->dev_id) {
>                 res = -ENOMEM;
> -               goto remove_idr;
> +               goto unregister_group;
>         }
>
>         res = aggr_parse(aggr);
> @@ -1140,7 +1251,9 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
>
>         gpiod_add_lookup_table(aggr->lookups);
>
> -       pdev = platform_device_register_simple(DRV_NAME, id, NULL, 0);
> +       meta.init_via_sysfs = true;
> +
> +       pdev = platform_device_register_data(NULL, DRV_NAME, id, &meta, sizeof(meta));
>         if (IS_ERR(pdev)) {
>                 res = PTR_ERR(pdev);
>                 goto remove_table;

> @@ -1258,7 +1379,26 @@ static struct platform_driver gpio_aggregator_driver = {
>
>  static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
>  {
> -       aggr_free(p);
> +       /*
> +        * There should be no aggregator created via configfs, as their
> +        * presence would prevent module unloading.
> +        */
> +       struct gpio_aggregator *aggr = (struct gpio_aggregator *)p;

The cast is not needed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

