Return-Path: <linux-gpio+bounces-36064-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uATwL0ia+GkAxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36064-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:08:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 370AA4BD78A
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77321302812B
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 13:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE8B3D8120;
	Mon,  4 May 2026 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaK1Gjfg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327F83101CE
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 13:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899926; cv=pass; b=V41uW2+FrvcBjNGK93Mfs4dfZRcxD5FkACdl7Bc9cSa6EB1tL4Cj4PPzaArj9r7Jv3ci/HMdnZYFLUDHHU20l3POiBanB7EgxE+438JSAlkINTQY/NGnQP3jV9FT2xfMNTkWZh5BlHW8GrxpnVqJDJbcXHvpCZLZfCcA6lrRp0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899926; c=relaxed/simple;
	bh=LkZxqG9sFfFwTKujkEUG6TiagqWhbk7hlxo2348PS18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tfnyal5RmxaRoM9sDiJRI31qzBNIrBi3wtXAtJY+BvczHTIqmIUa/ZNj+z1iWP+jZmRfhvrDX0x++k1BFTgUM6GRuD84W1bj1qqcHaAIARrp2PyxNk90L9n71N+5HdOrD5s9K88ayg9LMxS0ViIh5oscNhLE4gs3OOXs+HUhRI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaK1Gjfg; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7bd8cc5ad52so6979557b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 06:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777899924; cv=none;
        d=google.com; s=arc-20240605;
        b=LBBIAeXUYIscPZ+CETe+Py2ojjVZBjnL+c+9PJUcy5Guh5epgkzCfwIwT8WhdtRfHg
         V0a1qUWqFTHr5Ufsrtn5AOStyfmjbUKQ/Aa9YXVM8XAYkcfstzbUjISeivxOYmJLh6tT
         Jxpl0VV374sqdP2M68EmNf7v36+F8ovLQJs9mQ2Atp6+nJ4OMBYFOEFamtJ88ou9wCR0
         JGmbWIbEC7RPeQjyhqG7zByD+DXTNPJnJwdnOgcq2cQgM5xJgC+Y7sLgvV2kALxqyFuH
         ntFE6bGXutJtUJjEJMtIHY/+xDYp1Ml0qR1QHr7wLM6VRMEDDzgl4wY+3GTkXbJ3H7nZ
         vyZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PnvQyi3FBfNDM2W4w/Cdk/CdyBzPdQ+FG5jG0iru5/o=;
        fh=m0zZaSJtn+Bp/hicv+dOyvFODWH85ZE1Ae9Gul3ohnM=;
        b=H6y2wEYSUZ+VWd8o8KWIK+sFDwrqSEetCumCzKTCF/Dj5GBVO865aZh7FwuyyQ/eHE
         pLhN39sMMWms3qG/Cg4iS4al+c0wXnjL1bqwICX7ANO76nSUvd6c0++HNuP4Xg4qxVod
         TnmZUwFUNUOgu6FahI7Bb2ZQsGQjMMii4SKhhTZ0i28hq9DdkV7o43zvO+oPAbeoMiRy
         EF4Pwu8BXhO2nBtjHX7u0n5TJu+OCu7bvHlSE3eGVGrvfqgAkNGeZkHw2GQUSXymEj7N
         IN2FMWJl/H5M3HnH9nrnpa+XGGzZAJT1WxUcfYbCpyP4RwMmrghq5KoncHFH8OG8BQal
         V3bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777899924; x=1778504724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnvQyi3FBfNDM2W4w/Cdk/CdyBzPdQ+FG5jG0iru5/o=;
        b=RaK1GjfgVlh50LqUCfw808AA/Z23KxY7zN2finunQ4eZmVt2SK2YuJiCKh1gdqtGF3
         39Cq/9fZxpjCunpqTL527w0cy3Pc+x8ys0fqcf13r15ZLztKUwQKMh3il1Fh2YkhHjQy
         kgdlspU10ZhKKTTTFiefd1dUTC56blufXNPudo5HETQYuG/GFQ/jsrB2ULCKEdHCQCY/
         y4QbdSa5auUrwAu5ioVUKa3Zt+85OX5vl8/Xq03AFJgC6vaeP1cmTDemkXdFzQ8Y2GEM
         GP8pjL/24W9I3aMJMPQUa6GmMaZ2+2tIdWyMzTUKL+4n3yW5xhuX8AuuFJRie9ea94II
         u55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899924; x=1778504724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PnvQyi3FBfNDM2W4w/Cdk/CdyBzPdQ+FG5jG0iru5/o=;
        b=qRARoo7MM8qTJnc+FmZv5Y8LnjTnYvUlsxKMaTVvKzTsiPmp4sVbNLtXmn1I5qJVH4
         8+x9N0AycdAH86tO2ZcKK+DI2gO793sB37re/vo0YtudNs4VnLMg3aAdcXr/+eOgKI1V
         Hko+cg/t1vpqUxTFAbDiV9t1a5SpmjR3x06MLltd6WsMfKEXlBZv4TMhevmPZqfbmW3I
         dOF8LOhEyQFy0mlK8FVtAbh3WVNvo197cQ8QHL1bK1qTnEiTHysfNadOZq0tjuu7ufuU
         herSsZbVNa3bV1dvQ+DC+koR97BVIpLQw3ra/kaaWmfCjP70HvfGUbXxtxxWpoeNI8yV
         6w1g==
X-Gm-Message-State: AOJu0YyAuvQ1DnBUKata6BWIXlzmgbCMGWZGtKbvxA1wlkUTAtsPXhGN
	02AaWiCYFX3UV3hplNYnqwdgf7hCPZcaIh1FM71iPm20QBJ/m+eMW5aponOqbiEgoCG55jBBUPv
	KPoqwPC+G4EGYIAlZPOqTVp+xlwvrfR0=
X-Gm-Gg: AeBDiespDaVQphY4z84hxW4tSSbL/nEDB4PYnaHwaOP0SVs/ffMRQRPo1ctVXYC8vNt
	Pi3UPnlXSKsDXGPrKnBmzDUc/xCQNoO4Nrr9Q8fMijZN3VXGz4C17nQSj1PjzOeE/QUzHbHV0tJ
	qDyzLNhjtgrRhTrsx5VsbVZNb8byLEK67eaXO0w7jeyY7PUPZ6HkLlO4YjZZ86MQTOs+DsWD0To
	Xf4wOCWxY9HPjROPVYK0blU2wICWz1nkS62P/nu500eIaT5QNRPEKuHvGFu283zBDiMJnT50g8/
	bC0XG6K8fRyPe4qnEYWONjrOdSxtlQNClYSeIdcTkrUZ6YqGWe8=
X-Received: by 2002:a05:690c:67c5:b0:7ba:f6b4:3550 with SMTP id
 00721157ae682-7bd7714a623mr95106437b3.45.1777899923803; Mon, 04 May 2026
 06:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502210354.160439-1-m32285159@gmail.com> <CAMRc=MfdB3Ht6DGP5x1BqQ36RzLeRpP9nz+S2CcKMPhfD=O9hg@mail.gmail.com>
In-Reply-To: <CAMRc=MfdB3Ht6DGP5x1BqQ36RzLeRpP9nz+S2CcKMPhfD=O9hg@mail.gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 4 May 2026 08:05:12 -0500
X-Gm-Features: AVHnY4K2vDr_uOBhYFUca3dh7bZAtXsBZFBkjawFxiBC9UZPfCIkK4oby3Cxsrs
Message-ID: <CAKqfh0G+-XpoXzGkGKi7zziai1g-bzSdkg+qp4KEmnDn_6XpsA@mail.gmail.com>
Subject: Re: [PATCH] gpio: twl4030: Use guard(mutex)() over manual locking
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 370AA4BD78A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36064-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Bartosz,

On Mon, May 4, 2026 at 7:50=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Sat, 2 May 2026 23:03:54 +0200, Maxwell Doose <m32285159@gmail.com> sa=
id:
> > Replace mutex_lock() and mutex_unlock() pairs with the RAII macro
> > guard(mutex)(). This keeps the driver up-to-date with the latest
> > function macros.
> >
> > Remove now-redundant gotos and goto labels which will maintain
> > readability. In addition, replace some gotos with direct returns where
> > appropriate.
> >
> > Update certain control paths to make them more suited to the new
> > locking.
> >
> > Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> > ---
> >  drivers/gpio/gpio-twl4030.c | 69 ++++++++++++++-----------------------
> >  1 file changed, 26 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
> > index a851702befde..df17f9c08817 100644
> > --- a/drivers/gpio/gpio-twl4030.c
> > +++ b/drivers/gpio/gpio-twl4030.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/of.h>
> >  #include <linux/irqdomain.h>
> > +#include <linux/cleanup.h>
>
> Maybe order the includes alphabetically if you're at it?
>

I'll make sure that happens in the v2.

>
> >
> >  #include <linux/mfd/twl.h>
> >
> > @@ -209,7 +210,7 @@ static int twl_request(struct gpio_chip *chip, unsi=
gned offset)
> >       struct gpio_twl4030_priv *priv =3D gpiochip_get_data(chip);
> >       int status =3D 0;
> >
> > -     mutex_lock(&priv->mutex);
> > +     guard(mutex)(&priv->mutex);
> >
> >       /* Support the two LED outputs as output-only GPIOs. */
> >       if (offset >=3D TWL4030_GPIO_MAX) {
> > @@ -227,30 +228,29 @@ static int twl_request(struct gpio_chip *chip, un=
signed offset)
> >               /* Configure PWM OFF register first */
> >               status =3D twl_i2c_write_u8(TWL4030_MODULE_LED, 0x7f, reg=
 + 1);
> >               if (status < 0)
> > -                     goto done;
> > +                     return status;
> >
> >               /* Followed by PWM ON register */
> >               status =3D twl_i2c_write_u8(TWL4030_MODULE_LED, 0x7f, reg=
);
> >               if (status < 0)
> > -                     goto done;
> > +                     return status;
> >
> >               /* init LED to not-driven (high) */
> >               status =3D twl_i2c_read_u8(TWL4030_MODULE_LED, &cached_le=
den,
> >                                        TWL4030_LED_LEDEN_REG);
> >               if (status < 0)
> > -                     goto done;
> > +                     return status;
> >               cached_leden &=3D ~ledclr_mask;
> >               status =3D twl_i2c_write_u8(TWL4030_MODULE_LED, cached_le=
den,
> >                                         TWL4030_LED_LEDEN_REG);
> >               if (status < 0)
> > -                     goto done;
> > +                     return status;
> >
> >               status =3D 0;
> > -             goto done;
> >       }
> >
> >       /* on first use, turn GPIO module "on" */
> > -     if (!priv->usage_count) {
> > +     else if (!priv->usage_count) {
>
> This is a functional change, I'm not sure you want to change the logic.
>

The idea here was to drop the goto and just use "else if" instead,
since I've found goto to bypass a lot of the semantics that
__attribute__((cleanup())) enforces. The control paths that are taken
are the same though. I can also see about finding a different solution
but this one seemed like the best.

>
> >               struct twl4030_gpio_platform_data *pdata;
> >               u8 value =3D MASK_GPIO_CTRL_GPIO_ON;
> >
> > @@ -264,11 +264,9 @@ static int twl_request(struct gpio_chip *chip, uns=
igned offset)
> >               status =3D gpio_twl4030_write(REG_GPIO_CTRL, value);
> >       }
> >
> > -done:
> >       if (!status)
> >               priv->usage_count |=3D BIT(offset);
> >
> > -     mutex_unlock(&priv->mutex);
> >       return status;
> >  }
> >
> > @@ -276,10 +274,10 @@ static void twl_free(struct gpio_chip *chip, unsi=
gned offset)
> >  {
> >       struct gpio_twl4030_priv *priv =3D gpiochip_get_data(chip);
> >
> > -     mutex_lock(&priv->mutex);
> > +     guard(mutex)(&priv->mutex);
> >       if (offset >=3D TWL4030_GPIO_MAX) {
> >               WARN_ON_ONCE(twl4030_led_set_value(offset - TWL4030_GPIO_=
MAX, 1));
> > -             goto out;
> > +             return;
> >       }
> >
> >       priv->usage_count &=3D ~BIT(offset);
> > @@ -287,9 +285,6 @@ static void twl_free(struct gpio_chip *chip, unsign=
ed offset)
> >       /* on last use, switch off GPIO module */
> >       if (!priv->usage_count)
> >               gpio_twl4030_write(REG_GPIO_CTRL, 0x0);
> > -
> > -out:
> > -     mutex_unlock(&priv->mutex);
> >  }
> >
> >  static int twl_direction_in(struct gpio_chip *chip, unsigned offset)
> > @@ -297,17 +292,15 @@ static int twl_direction_in(struct gpio_chip *chi=
p, unsigned offset)
> >       struct gpio_twl4030_priv *priv =3D gpiochip_get_data(chip);
> >       int ret;
> >
> > -     mutex_lock(&priv->mutex);
> > +     guard(mutex)(&priv->mutex);
> >       if (offset < TWL4030_GPIO_MAX)
> >               ret =3D twl4030_set_gpio_direction(offset, 1);
> >       else
> > -             ret =3D -EINVAL;  /* LED outputs can't be set as input */
> > +             return -EINVAL; /* LED outputs can't be set as input */
> >
> >       if (!ret)
> >               priv->direction &=3D ~BIT(offset);
> >
> > -     mutex_unlock(&priv->mutex);
> > -
> >       return ret;
> >  }
> >
> > @@ -317,10 +310,9 @@ static int twl_get(struct gpio_chip *chip, unsigne=
d offset)
> >       int ret;
> >       int status =3D 0;
> >
> > -     mutex_lock(&priv->mutex);
> > +     guard(mutex)(&priv->mutex);
> >       if (!(priv->usage_count & BIT(offset))) {
> > -             ret =3D -EPERM;
> > -             goto out;
> > +             return -EPERM;
> >       }
> >
> >       if (priv->direction & BIT(offset))
> > @@ -328,10 +320,7 @@ static int twl_get(struct gpio_chip *chip, unsigne=
d offset)
> >       else
> >               status =3D twl4030_get_gpio_datain(offset);
> >
> > -     ret =3D (status < 0) ? status : !!status;
> > -out:
> > -     mutex_unlock(&priv->mutex);
> > -     return ret;
> > +     return (status < 0) ? status : !!status;
> >  }
> >
> >  static int twl_set(struct gpio_chip *chip, unsigned int offset, int va=
lue)
> > @@ -339,7 +328,7 @@ static int twl_set(struct gpio_chip *chip, unsigned=
 int offset, int value)
> >       struct gpio_twl4030_priv *priv =3D gpiochip_get_data(chip);
> >       int ret;
> >
> > -     mutex_lock(&priv->mutex);
> > +     guard(mutex)(&priv->mutex);
> >       if (offset < TWL4030_GPIO_MAX)
> >               ret =3D twl4030_set_gpio_dataout(offset, value);
> >       else
> > @@ -350,8 +339,6 @@ static int twl_set(struct gpio_chip *chip, unsigned=
 int offset, int value)
> >       else
> >               priv->out_state &=3D ~BIT(offset);
> >
> > -     mutex_unlock(&priv->mutex);
> > -
> >       return ret;
> >  }
> >
> > @@ -360,21 +347,19 @@ static int twl_direction_out(struct gpio_chip *ch=
ip, unsigned offset, int value)
> >       struct gpio_twl4030_priv *priv =3D gpiochip_get_data(chip);
> >       int ret =3D 0;
> >
> > -     mutex_lock(&priv->mutex);
> > -     if (offset < TWL4030_GPIO_MAX) {
> > -             ret =3D twl4030_set_gpio_direction(offset, 0);
> > -             if (ret) {
> > -                     mutex_unlock(&priv->mutex);
> > -                     return ret;
> > +     scoped_guard(mutex, &priv->mutex) {
> > +             if (offset < TWL4030_GPIO_MAX) {
> > +                     ret =3D twl4030_set_gpio_direction(offset, 0);
> > +                     if (ret)
> > +                             return ret;
> >               }
> > -     }
> >
> > -     /*
> > -      *  LED gpios i.e. offset >=3D TWL4030_GPIO_MAX are always output
> > -      */
> > +             /*
> > +              *  LED gpios i.e. offset >=3D TWL4030_GPIO_MAX are alway=
s output
> > +              */
> >
> > -     priv->direction |=3D BIT(offset);
> > -     mutex_unlock(&priv->mutex);
> > +             priv->direction |=3D BIT(offset);
> > +     }
> >
> >       return twl_set(chip, offset, value);
> >  }
> > @@ -388,15 +373,13 @@ static int twl_get_direction(struct gpio_chip *ch=
ip, unsigned offset)
> >        */
> >       int ret =3D GPIO_LINE_DIRECTION_OUT;
> >
> > -     mutex_lock(&priv->mutex);
> > +     guard(mutex)(&priv->mutex);
> >       if (offset < TWL4030_GPIO_MAX) {
> >               ret =3D twl4030_get_gpio_direction(offset);
> >               if (ret) {
>
> Drop the brackets if there's only one line left. Same elsewhere.
>

Nice catch, I must've missed that in my final review. That'll be
included in the v2.

best regards,
maxwell




>
>
> > -                     mutex_unlock(&priv->mutex);
> >                       return ret;
> >               }
> >       }
> > -     mutex_unlock(&priv->mutex);
> >
> >       return ret;
> >  }
> > --
> > 2.53.0
> >
> >
>
> Bart

