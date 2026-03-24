Return-Path: <linux-gpio+bounces-34093-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKBiMNe6wmlilAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34093-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 17:24:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F969318F3E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 17:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20D193059C95
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 16:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562543DBD52;
	Tue, 24 Mar 2026 16:16:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964123563DD
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368994; cv=none; b=oAl5pITzCPc0ir5wL7CHw+S2cIt7bhNOSB/4hWBIePu5oYBSNC+V0DqlbM8rD2tvUEeZ8jW72a86pB/GEfsJ92fOHI2BO8eCU1yS/n3Z5nFfGifBzF+4HSUguNgDQ0ndGf5Sc2lG2fu0qiLUklThi7cPx0thUL8GpFpElvSGBB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368994; c=relaxed/simple;
	bh=BIc3wHAs8s2sPATriFf+fq+uKIS7NsyRMXlyBl5vVsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iq5jnQnpmpUp6hssEWrCl7yzxoqI6NuIKJW2M2mtWzSUV6w0s/Rgj4zeVaJpmeTbvwQVfZ5nVgHPd6Mv5jgOVHMYUz5+BmGW++JGzAZ5Omnahpq82th1LpXpDzhG/52ZMcUtTiZB323A9lGQSJncflISwTcFF09xXARBnfspWTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5674d8be45eso615969e0c.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 09:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368991; x=1774973791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmRf0clXa/z48rdOhDwIqsCZTl6MAr1IPl0XdGWzmtg=;
        b=XJM31Y+DtgIwn6uOlsgml15o6wuN5LibQdVL4FCbrwy/FzSjooqEOaDmwz0ENe8Z/R
         2MWIkR5R2m8y6CSCSfIs4zbxGpmQmz6HVsRPeCzags0DfCesAWYQZSYq4hRfr0Kb333R
         5xmShMZ6TzyZ1K4Yx8Vh7KlejvUa/tPTDaEdqF8SW6ZJrUWr7sd/XillLiRoiH8eZZBU
         bvCIIKFcliEBDzLd8C8rk1PLG1QiAq/84XvlnWQmzs+LsO27RHajWbqtc0gt3p3k4DuO
         Bm88T7SH1/+e5c+A8ZL6cm0oBKuiZs8F6uc0A2moymEn+C1H/3Be9VeBMdAeTOFljCv2
         qosA==
X-Forwarded-Encrypted: i=1; AJvYcCUJZHUMtUr5mYRK5jqYgLrKDhfguXCQvcSNtCms6qX3v9ZaWhOAabDxPQg1SaGOIqJFOkbjf5KuoMGv@vger.kernel.org
X-Gm-Message-State: AOJu0YxKX3PRIl0veFWkhLC9YjMRiln+UNfxcSAVAm4CzN9vnRoDrIJ7
	+95q/9fG75kX0PAxofvjA/+wWuXrt/L2nyjLZsoEqmrftwRkXu5+s4obQLb+xleA4f0=
X-Gm-Gg: ATEYQzyZ3eW8fDJ9uvvCrPHzS3b9xrNEj+/mA4GcedWrQAgsRbL0ts5Dy5jp0NErchN
	7YSE117ZteLxmeAiv6iAZZxzl+zpupIEti/ABDsV4s7prHO7a2iwD9aqplc45IAlZp/PQWXoING
	PoqPE26CQzaOrws1vObBwzvZli4pkZZVtb1cP+IOGSSKI5ddHaw/aMAKpXNdiODCQn9Ae2i7k7V
	gcE9W38oIrKKmfDIom/eWjHO+D0ONZotyHJOQ+Db9dRWiXeVAnVzAQ37Ph7arWiW+JJR4LIDhWR
	yXIpFd2Ux88ZG+cfgtnL7kHeftItblYf3nEQvnb+aock+GAZIu14X1r1+KphocIXeGfqPf/RZ6H
	zZtsCKTO6Jtt7pyI1aeHVJ5jKv9DICLEcak5FxbH0yz/+Mjty+XDl8t1wku9z7OU3JmbejK/emp
	Xdk1exWquAiFCumAS3yuQabhsqTmOKgdKGI6OTUw7PiGr3H9e/EXtcJOpmFrgE
X-Received: by 2002:a05:6102:41aa:b0:5f9:39e9:3562 with SMTP id ada2fe7eead31-60378fe8a7dmr243313137.2.1774368991498;
        Tue, 24 Mar 2026 09:16:31 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602afb5b832sm11431637137.12.2026.03.24.09.16.31
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 09:16:31 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-602947681ccso480181137.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 09:16:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHEKUkAvApcfg81vCTigCs8vtayZQBgTbJBLMBh9cYYskugwr4lc4hI/uQJKAtHNvGkOsG/erFYXPS@vger.kernel.org
X-Received: by 2002:a05:6102:5801:b0:603:270c:9ece with SMTP id
 ada2fe7eead31-60386ebc7d7mr249544137.11.1774368990997; Tue, 24 Mar 2026
 09:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com> <20260309-gpio-hog-fwnode-v2-2-4e61f3dbf06a@oss.qualcomm.com>
In-Reply-To: <20260309-gpio-hog-fwnode-v2-2-4e61f3dbf06a@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 17:16:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX6RuZXAozrF5m625ZepJTVVr4pcyKczSk12MedWvoejw@mail.gmail.com>
X-Gm-Features: AQROBzCujwdtX4JkcLDjVnd6LogBn_okx21mGqzFRhZGg9NW5EWThevgncjlCbw
Message-ID: <CAMuHMdX6RuZXAozrF5m625ZepJTVVr4pcyKczSk12MedWvoejw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] gpio: move hogs into GPIO core
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.intel.com,iki.fi,atomide.com,armlinux.org.uk,lwn.net,linuxfoundation.org,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-34093-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:url,qualcomm.com:email,intel.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 5F969318F3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

On Mon, 9 Mar 2026 at 13:43, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Refactor line hogging code by moving the parts duplicated in
> gpiolib-acpi-core.c and gpiolib-of.c into gpiolib.c, leaving just the
> OF-specific bits in the latter.
>
> This makes fwnode the primary API for setting up hogs and allows to use
> software nodes in addition to ACPI and OF nodes.
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch, which is now commit d1d564ec4992945d ("gpio:
move hogs into GPIO core") in gpio/gpio/for-next.

This breaks GPIO on the Renesas Marzen (R-Car H1) board:

    -gpio_rcar ffc40000.gpio: driving 32 GPIOs
    +gpiochip_add_data_with_key: GPIOs 512..543 (ffc40000.gpio) failed
to register, -22
    +gpio_rcar ffc40000.gpio: failed to add GPIO controller
    +gpio_rcar ffc40000.gpio: probe with driver gpio_rcar failed with error -22

> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -960,6 +960,98 @@ static void machine_gpiochip_add(struct gpio_chip *gc)
>         }
>  }
>
> +int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
> +{
> +       struct fwnode_handle *gc_node = dev_fwnode(&gc->gpiodev->dev);
> +       struct fwnode_reference_args gpiospec;
> +       enum gpiod_flags dflags;
> +       struct gpio_desc *desc;
> +       unsigned long lflags;
> +       const char *name;
> +       int ret, argc;
> +       u32 gpios[3]; /* We support up to three-cell bindings. */
> +       u32 cells;
> +
> +       lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
> +       dflags = GPIOD_ASIS;
> +       name = NULL;
> +
> +       argc = fwnode_property_count_u32(fwnode, "gpios");
> +       if (argc < 0)
> +               return argc;
> +       if (argc > 3)
> +               return -EINVAL;

The GPIO hog at [1] has a gpios property with two entries:

    gpios = <17 GPIO_ACTIVE_LOW>, <18 GPIO_ACTIVE_LOW>;

hence argc = 4, which is considered invalid.

The check should take into account the actual value of #gpio-cells,
and handle the presence of multiple GPIOs.

"git grep -Ww gpio-hog -- arch/*/boot/dts/ | grep 'gpios\s*=.*>,'" finds
several other places where multiple GPIOs are specified.

> +
> +       ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (is_of_node(fwnode)) {
> +               /*
> +                * OF-nodes need some additional special handling for
> +                * translating of devicetree flags.
> +                */
> +               ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
> +               if (ret)
> +                       return ret;
> +               if (!ret && argc != cells)
> +                       return -EINVAL;
> +
> +               memset(&gpiospec, 0, sizeof(gpiospec));
> +               gpiospec.fwnode = fwnode;
> +               gpiospec.nargs = argc;
> +
> +               for (int i = 0; i < argc; i++)
> +                       gpiospec.args[i] = gpios[i];
> +
> +               ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               /*
> +                * GPIO_ACTIVE_LOW is currently the only lookup flag
> +                * supported for non-OF firmware nodes.
> +                */
> +               if (gpios[1])
> +                       lflags |= GPIO_ACTIVE_LOW;
> +       }
> +
> +       if (fwnode_property_present(fwnode, "input"))
> +               dflags |= GPIOD_IN;
> +       else if (fwnode_property_present(fwnode, "output-low"))
> +               dflags |= GPIOD_OUT_LOW;
> +       else if (fwnode_property_present(fwnode, "output-high"))
> +               dflags |= GPIOD_OUT_HIGH;
> +       else
> +               return -EINVAL;
> +
> +       fwnode_property_read_string(fwnode, "line-name", &name);
> +
> +       desc = gpiochip_get_desc(gc, gpios[0]);
> +       if (IS_ERR(desc))
> +               return PTR_ERR(desc);
> +
> +       return gpiod_hog(desc, name, lflags, dflags);
> +}

[1] https://elixir.bootlin.com/linux/v6.19.9/source/arch/arm/boot/dts/renesas/r8a7779-marzen.dts#L196

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

