Return-Path: <linux-gpio+bounces-34169-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIXBArUtxGmZwgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34169-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 19:47:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1E932AC52
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 19:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E7F230B4DBC
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 18:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F42D33B6C6;
	Wed, 25 Mar 2026 18:42:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51A63242BA
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 18:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464133; cv=none; b=LJmQqGw8tP8Ghob94soSgA8arRKglX26s5btf5LMgNI0dlRDY6cPXmaUAk0FaKTho0mupwOf98h9fgXzkwkApaZiDFODlEq+135KFnXP/+T3+cMqbXUxCRle0akROvhzU0gyyT2pcUPjgaBZ5ulI2UhVfRgf7hBl8C8wwNEkFlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464133; c=relaxed/simple;
	bh=bfTeD36m7Ullk5L1jo6SH+GigHcnF1GoRgV9s3OSnFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8tiF8SDMYCsY2Ry5u8JLd2FtRU4aczCAGfifRnt/zszsA6i51hvpvYKCYKlG5nWSihxJWvp9yB+TBvgkI1jTS7hD/lqJMxjKf0EZLMbmCRbcfFp/LHOsqNyGbzPipM5V0dODBRC8l0wS2RUYUfMRknqdfR1HaMhbaoLaa/1J9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-602903ad849so36153137.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 11:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774464131; x=1775068931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aD3RRMKcnhLrwqe0WAwzPlfJXdwopk87davQxw2QDSM=;
        b=W/RsJTJtC0gx+IUITU21J9B5TWES0dtf6D+HIPvRo07QWe6XyiW9mNpXgm5P0GnmPt
         dG79IxRzDix9kDo0Q++d/tSkLm1NOpmLSmy2BVQpAEyxySLbluMGatJhcDDZTCEJtNhC
         RV7M47hAIzlBEvcBI/dLI3DYxLHANjguJDRbE6FbzaMFmdd0Qckyd/B05dDeZBNVMzHX
         DcdC5ywcL36agp34pT0xuydAn0AJW42FFtg4OiJ3vUXlBsCUGZlNuM2qDB+3qfwYIFjp
         jY9+Y+xkZqZqXMh75oogyRCiwcUr5Est/fGQsfPwluGhxvOXOp5YQxj3o36cmeWGL9t2
         ZGIA==
X-Forwarded-Encrypted: i=1; AJvYcCVbtlDdv5APCvnEGdE6raCl/5YAIyzt4UBKj6DjJ5i1yQlkFpwz6FJ70WVSxaskMQV+COz2LC+3oKbb@vger.kernel.org
X-Gm-Message-State: AOJu0YzS+PFBzHCRBpQdkAxz+EY6Le2Wq8dPzQwMkTENB/rF3ttLzB3q
	nzZK0PRLzm+2V/v625YSFzV0vIUgRGNtuEofI+5k0RcIpgoHHi/okMzJxw9t1BDTfe8=
X-Gm-Gg: ATEYQzxB3z9RLtIb4aH3qz01gU9Gqdd+BUDyLA4MnVJm5Q2lwzZGn06u1eoMD9cyK7T
	fcjHvpOsBObK3wXz84X7fVsNX7RaK699FystaHofNZuYkTUNFNyT5WiafjO1yL/yZYRHRgufbbv
	+Ie0WiBCawqpdjotkA9EiNGyO33M3GL5z7uuaRiv2oXij6V19/MGliFAz8If2EUw6BIirbPb2Ve
	LdFIRxn+TFqOnJtU50TnxExssTpX2DpKngniZ8D/wLqNlzRO9Y2yxyH+ToIMl7K+kSGOyLyDO+U
	PWFbtoii+vEH9b1Cg0ACGm/438QbQwE92DEjTS4MMzSemM1malzaQyKsYvp2j9cn0pZx9WTEiul
	WPftEOt+80fE2j6MnzhUW5+U2JX7qoh0mq+tJth26k+PHmi0UMguk9o30IlQvPAeoOs8QvS/2ss
	M6xtL/CApa2ApQIiRegbQ3shDGM6QdCjJ2nH2cIqtyb40NGFy0eSLx32x78cFaXQga
X-Received: by 2002:a05:6102:554b:b0:5ff:a16b:93f0 with SMTP id ada2fe7eead31-60387268e91mr2116354137.22.1774464130599;
        Wed, 25 Mar 2026 11:42:10 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be162f25sm1013076241.5.2026.03.25.11.42.09
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 11:42:10 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5674d8be45eso127881e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 11:42:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXg68OUJHwBuFYmIOlh0xgmMM0AuUVw5U5dGZdD0Qg19G9nvQKFDZRlfF7nwXRPPzJAyiiFV/gReLDL@vger.kernel.org
X-Received: by 2002:a05:6122:3387:b0:56b:5e7e:d3fa with SMTP id
 71dfb90a1353d-56d21f56bcfmr2331636e0c.7.1774464129405; Wed, 25 Mar 2026
 11:42:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325-gpio-hogs-multiple-v1-1-7e3a7347f0d6@oss.qualcomm.com>
In-Reply-To: <20260325-gpio-hogs-multiple-v1-1-7e3a7347f0d6@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 19:41:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpQ_HmqXqB=MwJJYbNKgNvrb0ZdbNbiiz=CXK1qECBEQ@mail.gmail.com>
X-Gm-Features: AQROBzC5JiMRN7OZ7uNvlUBK6_mIDv8br2tHjFBjjLQcYFyaUf-7wpM6eZoCWUA
Message-ID: <CAMuHMdVpQ_HmqXqB=MwJJYbNKgNvrb0ZdbNbiiz=CXK1qECBEQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix hogs with multiple lines
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-34169-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 5D1E932AC52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

On Wed, 25 Mar 2026 at 11:18, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> After moving GPIO hog handling into GPIOLIB core, we accidentally stopped
> supporting devicetree hog definitions with multiple lines like so:
>
>         hog {
>                 gpio-hog;
>                 gpios = <3 0>, <4 GPIO_ACTIVE_LOW>;
>                 output-high;
>                 line-name = "foo";
>         };
>
> Restore this functionality to fix reported regressions.
>
> Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdX6RuZXAozrF5m625ZepJTVVr4pcyKczSk12MedWvoejw@mail.gmail.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks, that fixes the issue I saw on Marzen
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -938,12 +938,12 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
>         struct fwnode_handle *gc_node = dev_fwnode(&gc->gpiodev->dev);
>         struct fwnode_reference_args gpiospec;
>         enum gpiod_flags dflags;
> +       const char *name = NULL;
>         struct gpio_desc *desc;
>         unsigned long lflags;
> -       const char *name;
> +       size_t num_hogs;
>         int ret, argc;
> -       u32 gpios[3]; /* We support up to three-cell bindings. */
> -       u32 cells;
> +       u32 cells = 0;

Shouldn't the default be 2?

>
>         lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
>         dflags = GPIOD_ASIS;
> @@ -952,43 +952,21 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
>         argc = fwnode_property_count_u32(fwnode, "gpios");
>         if (argc < 0)
>                 return argc;
> -       if (argc > 3)
> +
> +       ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);

Should this call be protected by is_of_node(), like in the old code?

> +       if ((ret && is_of_node(fwnode)) || (!ret && (argc % cells)))
>                 return -EINVAL;
>
> +       num_hogs = ret ? 1 : (argc / cells);

While you avoid modulo and division by zero due to the check for ret,
using a default would let you always validate argc against cells,
and remove the need for special casing num_hogs.

> +
> +       u32 *gpios __free(kfree) = kcalloc(argc, sizeof(u32), GFP_KERNEL);

kzalloc_objs()?

> +       if (!gpios)
> +               return -ENOMEM;
> +
>         ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
>         if (ret < 0)
>                 return ret;
>
> -       if (is_of_node(fwnode)) {
> -               /*
> -                * OF-nodes need some additional special handling for
> -                * translating of devicetree flags.
> -                */
> -               ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
> -               if (ret)
> -                       return ret;
> -               if (!ret && argc != cells)
> -                       return -EINVAL;
> -
> -               memset(&gpiospec, 0, sizeof(gpiospec));
> -               gpiospec.fwnode = fwnode;
> -               gpiospec.nargs = argc;
> -
> -               for (int i = 0; i < argc; i++)
> -                       gpiospec.args[i] = gpios[i];
> -
> -               ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);
> -               if (ret)
> -                       return ret;
> -       } else {
> -               /*
> -                * GPIO_ACTIVE_LOW is currently the only lookup flag
> -                * supported for non-OF firmware nodes.
> -                */
> -               if (gpios[1])
> -                       lflags |= GPIO_ACTIVE_LOW;
> -       }
> -
>         if (fwnode_property_present(fwnode, "input"))
>                 dflags |= GPIOD_IN;
>         else if (fwnode_property_present(fwnode, "output-low"))
> @@ -1000,11 +978,41 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
>
>         fwnode_property_read_string(fwnode, "line-name", &name);
>
> -       desc = gpiochip_get_desc(gc, gpios[0]);
> -       if (IS_ERR(desc))
> -               return PTR_ERR(desc);
> +       for (unsigned int i = 0; i < num_hogs; i++) {
> +               if (is_of_node(fwnode)) {
> +                       /*
> +                        * OF-nodes need some additional special handling for
> +                        * translating of devicetree flags.
> +                        */
> +                       memset(&gpiospec, 0, sizeof(gpiospec));
> +                       gpiospec.fwnode = fwnode;
> +                       gpiospec.nargs = cells;
> +
> +                       for (int j = 0; j < cells; j++)
> +                               gpiospec.args[j] = gpios[i * cells + j];
> +
> +                       ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);
> +                       if (ret)
> +                               return ret;
> +               } else {
> +                       /*
> +                        * GPIO_ACTIVE_LOW is currently the only lookup flag
> +                        * supported for non-OF firmware nodes.
> +                        */
> +                       if (gpios[i * cells + 1])

This depends on cells being non-zero, and thus having a proper default,
too.

> +                               lflags |= GPIO_ACTIVE_LOW;
> +               }
>
> -       return gpiod_hog(desc, name, lflags, dflags);
> +               desc = gpiochip_get_desc(gc, gpios[i * cells]);
> +               if (IS_ERR(desc))
> +                       return PTR_ERR(desc);
> +
> +               ret = gpiod_hog(desc, name, lflags, dflags);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
>  }
>
>  static int gpiochip_hog_lines(struct gpio_chip *gc)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

