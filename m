Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D6D314452
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 00:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhBHXxW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 18:53:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:34724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229554AbhBHXxV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Feb 2021 18:53:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C8D264E76;
        Mon,  8 Feb 2021 23:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612828359;
        bh=QZD4dUqK92h1IjoKwuq2tEkAwxPOn5Zy9ZgwehUP9to=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=A7aRbeecgXRVa+nadG2O+mAD57rTY6gNh9a40iDBfYc6Vw+GCKAKMHjWhPqM0MHUX
         Y0yThdUHdVyAdXOjHO0PILQifRNzqxBQOlY4pBGZQyOuHdO3zISe9wwLNb88sw++rQ
         0sZ3xc1e3SdVfpU1gATyw5oUukc7TRtfMPyiaAq9ofh6FMoQJaiPbimoO88fI2KHQI
         GJtNLUKsUbCQeGmLbYL1aQAGGB/uaXmoEzkDDjepyffPUrowW3b98nf6xTo0e9kybA
         2ZJksPlxqPz29nmrVqtqGsNpIha12OKG1uaCZ8Givgf7nXaSr2Fz9+OrZJAGtY56Lu
         ENv66OQAnYKvw==
Received: by mail-qk1-f170.google.com with SMTP id b14so2822254qkk.0;
        Mon, 08 Feb 2021 15:52:39 -0800 (PST)
X-Gm-Message-State: AOAM531NJSoq2BSvhPa+9X3ib3R1mJRw75210bw4u9nhl9hYLtP3n7cI
        LgrZkZ0ldFhsaInxMD4XNFriFJnWEDzTBBKxDg==
X-Google-Smtp-Source: ABdhPJxTfRnkEIzrOwcBVmBHMl51nxdMub3448K/abBbch4wMdMZHPGjHgeXFj+XwZIeokSoymUpfbHxDRXsPL2bsiA=
X-Received: by 2002:ae9:e915:: with SMTP id x21mr6990306qkf.311.1612828358689;
 Mon, 08 Feb 2021 15:52:38 -0800 (PST)
MIME-Version: 1.0
References: <20210208222203.22335-1-info@metux.net> <20210208222203.22335-5-info@metux.net>
In-Reply-To: <20210208222203.22335-5-info@metux.net>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 8 Feb 2021 17:52:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKQyLcnHd-ff7z=Kk3D7scN-MGA0jKk1iwHnZj747cgGw@mail.gmail.com>
Message-ID: <CAL_JsqKQyLcnHd-ff7z=Kk3D7scN-MGA0jKk1iwHnZj747cgGw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/12] of: base: introduce of_match_string()
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 8, 2021 at 4:24 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Introduce a new helper function that looks up a given propery and

typo

> matches all string elements against a given string. This is useful
> if we want to check wether one string element of some property

typo


> matches a given string.

Is there a user? Didn't see one in the series, but may have missed it.
I'd think we have some existing cases that could be converted.

> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/of/base.c  | 32 ++++++++++++++++++++++++++++++++
>  include/linux/of.h |  2 ++
>  2 files changed, 34 insertions(+)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index e5ef611ed233..649c2a32bb48 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -287,6 +287,38 @@ const void *of_get_property(const struct device_node *np, const char *name,
>  EXPORT_SYMBOL(of_get_property);
>
>  /*
> + * of_match_string - match a propery against given string
> + * @node: device_node to look up at
> + * @name: name of the property
> + * @value: value to match against
> + *
> + * Look for property by name and match all string elements against value.
> + * Returns true if the property exists and any one of the string elements
> + * matches the given value.
> + */
> +bool of_match_string(const struct device_node *node, const char* name,
> +                    const char* value)
> +{
> +       struct property *prop;
> +       const char *walk;
> +
> +       if (!name || !value)
> +               return false;
> +
> +       prop = of_find_property(node, name, NULL);
> +       if (!prop)
> +               return false;
> +
> +       for (walk=of_prop_next_string(prop, NULL); walk;
> +            walk=of_prop_next_string(prop, walk)) {
> +               if (strcmp(walk, value)==0)
> +                       return true;
> +       }
> +       return true;
> +}
> +EXPORT_SYMBOL_GPL(of_match_string);
> +
> +/*
>   * arch_match_cpu_phys_id - Match the given logical CPU and physical id
>   *
>   * @cpu: logical cpu index of a core/thread
> diff --git a/include/linux/of.h b/include/linux/of.h
> index dbf2c7442389..3612429632f4 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -355,6 +355,8 @@ extern bool of_device_is_big_endian(const struct device_node *device);
>  extern const void *of_get_property(const struct device_node *node,
>                                 const char *name,
>                                 int *lenp);
> +extern bool of_match_string(const struct device_node *node, const char* name,
> +                           const char* value);
>  extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread);
>  extern struct device_node *of_get_next_cpu_node(struct device_node *prev);
>  extern struct device_node *of_get_cpu_state_node(struct device_node *cpu_node,
> --
> 2.11.0
>
