Return-Path: <linux-gpio+bounces-34241-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI+pGhpKxmmgIAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34241-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:12:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BAB3418F4
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54A443114DD8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 09:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175B13DA7C4;
	Fri, 27 Mar 2026 09:08:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F85F3932DD
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602503; cv=none; b=Gg8fBQLU/fZaNaNNfEIUtrSElQ2ge89sDpcvY1c1roPFsTIf0eleFErEnMKpwywduC/guKyc7AK0ME59N3a7+yzvPpbEWvnkV5htrQO7VyJ5Rq/fHLnOENkIa56hdk23849Kt/0idK2ckMUk8tWKnasU009NNfnurSZTU3R2Hns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602503; c=relaxed/simple;
	bh=mYddDiLjRIiBo+VXrYSKXlZ7TkAluu4urY+vSi+s2Zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oySiixc9Q7JDTGRHePzPfAkZ4i9RtwNYpR8knZov6Opsag3P+vkKYMTP/cuxT4eI3oxtdbVusRAeygASYrnwwXcdUW65poBSGEK6iS58JwICajzAGN80oLlYI3H9ZUe0+pG8F+hx1wi1wzjMZApXMRVw1tEiDOkdTXTUGSxuv3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56cd842b60bso1373586e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 02:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602495; x=1775207295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeLMshVR0nsPw/iZt1BDXxCDpZRjG9f/fkTDxEhSQHU=;
        b=MrCixG2FfoU8bJJZxDwYE4tYFPkNJZa2sIXAyTPSzTDVtxG3PD2Is5A+EwSSaCkhgO
         CM169sTNef48kgc07rhd88lael2/0ZSoOK5CAoRXDZY+U+BQAu2FWSxeHLshWAh+RiJE
         DDbSmgmFkiHD1Pcr0bAgN6efvTxsOBoP5h3g51B6XOrYLO5EW+FU+fkZnb3QjaqfX61v
         r04RyCPOgf9txaNfsR1OfGUAXbKeRv1q07zX2xbgSyqIVFcJ4klYusyUl9SYZ0lANnTT
         uD0MO71Zq/bUXMkf/0pkSfrXRZEpgXrXj6UEudft08vkMpawZAzgUXaQnB9VcgZ+6qde
         TiUw==
X-Forwarded-Encrypted: i=1; AJvYcCVrCLhlfdr4xsxk18k0YDm5o3gzWu5KdZ6PWae79fdSCFIVStPxSCEg/vbwLL2ybxAK1qiQ3ZrswLlA@vger.kernel.org
X-Gm-Message-State: AOJu0YwvPS4BS+bc/3JssR8GXUrMXOSPBouv2b0AkTe8XTQm0JDlIKk1
	cslXYzXAbOKXMp8QNiYnUISLvEo2GrVZROd8+0XV9CJUJz6U/oWwTxVFDXHXh8EAY2k=
X-Gm-Gg: ATEYQzwb695Gdm5LC5/Oi0zUFwlij11z/3rv8R5xUfEBgpsgLxqZDvVMNAZ+JKLkZKR
	/ovfIUi2zaCKtCTGFK2DUeZ7yGtS/HcspUSFowl/jzqCn4uX70ry3gQJ+DWSsYaX/Fu7CYnzlaO
	xpAZsqpu3MHueOI2qIBlH5GiRMlidsfy0XAMXQCa45Hba12spJwB2+roqCFzhtHq17KdA0bdgi0
	BaMSHs/eB41W/O5vd65PGc0EgAoe/LmxuJnQUtReeTdyUYE2JjxfP8XpJQhltg/F5uEsYToq5pn
	+Y996fZeQSxChHD5ZtbJLDskJvwJiWxCKoA6+IZ+VFP4iTYGb0wn256PhcKazglWDxGhAUKkC98
	oqtrHZ0N32g0kbI77F9JbU8jisDERKUo3g8jYSwOl52S7lIMv4lbfHqVJPpj6tHhfgDoS8Mp5kr
	Z82Y8HmwQnuTQSaq6rxUQkXJioi3/D5iXHcLdpSlwJGg8RNAuHjvOgNED5Jy1RVYoMVfOoIvg=
X-Received: by 2002:a05:6122:80ac:b0:56b:1eb:d396 with SMTP id 71dfb90a1353d-56d4a67062fmr587398e0c.14.1774602495023;
        Fri, 27 Mar 2026 02:08:15 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31c29de8sm7759212e0c.6.2026.03.27.02.08.13
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:08:14 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-604d732cd22so1147367137.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 02:08:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtvg3azgeWK1uisET8nKvhGBZ5hxqIeD7nmya6Q5v0pVW+1WsG00bPZtAc9w9jIbh3Fyflt2/JO4DO@vger.kernel.org
X-Received: by 2002:a05:6102:390e:b0:604:f29d:84be with SMTP id
 ada2fe7eead31-604f904cadamr719685137.3.1774602493193; Fri, 27 Mar 2026
 02:08:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-gpio-hogs-multiple-v2-1-7c3813460e4f@oss.qualcomm.com>
In-Reply-To: <20260326-gpio-hogs-multiple-v2-1-7c3813460e4f@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Mar 2026 10:08:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZjCP7EOaruhjZ1uRNK4=HVZ_hjUkZGyqxiizqi_2rwg@mail.gmail.com>
X-Gm-Features: AQROBzBdr6sIAp5W8NrHbjRfvn9tx7UeWmkqq0bQqItBRyQm5XaOxmLC4qs6Kc8
Message-ID: <CAMuHMdVZjCP7EOaruhjZ1uRNK4=HVZ_hjUkZGyqxiizqi_2rwg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: fix hogs with multiple lines
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34241-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,msgid.link:url,linux-m68k.org:email,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: D8BAB3418F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

On Thu, 26 Mar 2026 at 15:18, Bartosz Golaszewski
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
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - Use a default value of 2 for the number of GPIO cells
> - Use kzalloc_objs() instead of kcalloc()
> - Propagate the error number from fwnode_property_read_u32()
> - Remove special cases forced by the lack of default cells value
> - Link to v1: https://patch.msgid.link/20260325-gpio-hogs-multiple-v1-1-7e3a7347f0d6@oss.qualcomm.com

Thanks for the update!

> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -938,12 +938,18 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
>         struct fwnode_handle *gc_node = dev_fwnode(&gc->gpiodev->dev);
>         struct fwnode_reference_args gpiospec;
>         enum gpiod_flags dflags;
> +       const char *name = NULL;
>         struct gpio_desc *desc;
>         unsigned long lflags;
> -       const char *name;
> +       size_t num_hogs;

unsigned int should be sufficient to store the quotient of two positive
32-bit numbers.

>         int ret, argc;
> -       u32 gpios[3]; /* We support up to three-cell bindings. */
> -       u32 cells;
> +       /*
> +        * For devicetree-based systems, this needs to be defined in bindings
> +        * and there's no real default value. For other firmware descriptions
> +        * it makes the most sense to use 2 cells for the GPIO offset and
> +        * request flags.
> +        */
> +       u32 cells = 2;
>
>         lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
>         dflags = GPIOD_ASIS;
> @@ -952,42 +958,22 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
>         argc = fwnode_property_count_u32(fwnode, "gpios");
>         if (argc < 0)
>                 return argc;
> -       if (argc > 3)
> -               return -EINVAL;
>
> -       ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
> -       if (ret < 0)
> +       ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
> +       if (ret && is_of_node(fwnode))
>                 return ret;
> +       if (!ret && (argc % cells))

No need to check for !ret, the %-test should be valid for non-DT, too.

I guess we can't have #gpio-cells = <0> (single-GPIO provider not
supporting flags), and it would be very difficult to hog it.

> +               return -EINVAL;
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
> +       num_hogs = argc / cells;
>
> -               for (int i = 0; i < argc; i++)
> -                       gpiospec.args[i] = gpios[i];
> +       u32 *gpios __free(kfree) = kzalloc_objs(*gpios, argc);
> +       if (!gpios)
> +               return -ENOMEM;
>
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
> +       ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
> +       if (ret < 0)
> +               return ret;
>
>         if (fwnode_property_present(fwnode, "input"))
>                 dflags |= GPIOD_IN;
> @@ -1000,11 +986,41 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
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

unsigned int

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
> +                               lflags |= GPIO_ACTIVE_LOW;
> +               }
> +
> +               desc = gpiochip_get_desc(gc, gpios[i * cells]);
> +               if (IS_ERR(desc))
> +                       return PTR_ERR(desc);
>
> -       return gpiod_hog(desc, name, lflags, dflags);
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

