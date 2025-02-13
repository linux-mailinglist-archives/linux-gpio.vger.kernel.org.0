Return-Path: <linux-gpio+bounces-15920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6880A3420D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 15:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67C9E1682F2
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 14:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1800C21D3C3;
	Thu, 13 Feb 2025 14:31:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E07828137F;
	Thu, 13 Feb 2025 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739457080; cv=none; b=hMjN1GE6aB081f3t7WZXfj9mXUnlPI+fcb3SdhuaIAmKblrGALRhP7HPuoT4sXE4MkFCiYf9Rkfo6uPAz8KdIuUMS9q9//ACaZfb2ZJlas8dXt7bskeI63g4139LV3ww774xcd/mwwogewIUZbLsjp+CLpYoy+AT2JOqx490o18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739457080; c=relaxed/simple;
	bh=31YhI11H59DYPu3hRaeC34ybAn18Xcpud5Cqlj7F4fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQEfn4blH+oz5hw9bnUsbv3gU65IMbuGIuHlOyZy1aFtPRFcPWvMbGVu+EnKuogYuyf6MYtYdPOgD4UjCdNyNbQN1BdetaY/TM5oEWS1gNjGWwdQFWNrebK5Ras5jtArNcQxnT0otvBu+3U1hFA7Gk7NrIaZwqoKNCNtDbKn0kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-51e902b58c0so557789e0c.0;
        Thu, 13 Feb 2025 06:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457077; x=1740061877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=diUPziCw23CNdHBFl3HK/c+BYvOaikSZHz1UhbL/zbk=;
        b=TGXu/VGixZwN9Z+GbGW6d0ohBnXlT5mqh7Kzf8Kne3zHIiAYuaDFWT2MyIF5bnx8Uj
         80t874XNPsl3HaEKEdRpZlzXCObQOwZCf5jM0SkBYeSFxge08WA6UxllMw5nMVlPV8hU
         BJat5J3IP6U5kmhVZhcHkGE6I3VrWUZ0czh3hZIOGjp1fLNfZD21QwFecKLAQACnEXEG
         GIfAGFVhVrwS9XKBPhqGDYDBRUO5TZbIjKrF8+RHbJYrj0LYmeFpoCDKeONJzylIXh4F
         2ijzOun2S1VXilMGCIBPXiqPlKpf06Km1UEXluPs9DfNnHOR4bf3TLUSlkUwlXdfJuhU
         QEzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1tPNYT5llmztstEQwf27S3fBA8hnz3P79qBF2nB/v22kosOF6l3ea+NHcHd+vqtKxVyw9FZvZevD5gC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya7PbX66hQ6PZ4SPZq79HaM5g7g1tiiZeo+QMNZnJjt5f/Dv1c
	gi93XeXYTWxjXDqoeg4MU/comrtiosZb6KodiWp1lMim+hQtfzRqc3PDKMTdyok=
X-Gm-Gg: ASbGncuDJVU7QKV7Sfw2ECi8lbfx/bfAfwl/ptZqkBHrXkWTNA5P42omzkhZlUtVNve
	o9/BuQgx5TCTZcRJIGdCWb38bFABRhLa9eAyQdZTo1Ohn+9zEVMVneCcZ1MDLoe1prDxdTo9cd2
	74hlATcVsSqvpujZ0BHNHuB6pn6immrkz4KQjWwURkPtwVnZEjp3UC1gCHVSmGe8d9DpH+vqSee
	qZWaWNLFRfFwwhPLyoFeG75jC/xU2ntkadDN5pGe+d4sZIevzoWtUb5Ea22RBZuPOuDrT4A0Yox
	ljr31RKMe+LSyOcNo7Otk62bx7LNeBJz7dU93DsHFxhLrjoPT+pYjA==
X-Google-Smtp-Source: AGHT+IF3UmNQqtqjAlt+l6j1IeW9PkmwBtIIM1c40DKdjOZCsXAsUy86h3W101MRUKHEBw5npuLIFA==
X-Received: by 2002:a05:6122:3bd5:b0:520:61ee:c7f9 with SMTP id 71dfb90a1353d-52067c75088mr6915913e0c.7.1739457077332;
        Thu, 13 Feb 2025 06:31:17 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e86be05esm195225241.21.2025.02.13.06.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 06:31:15 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-867129fdb0aso601249241.1;
        Thu, 13 Feb 2025 06:31:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVh93/JbTYs95s5PyM2Ni9F7Tqtu++iOhyMYqGqMlIQv66QoSYVtLQVQSoxt93LEpomlD/SO+SX5WzgyUo=@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:4bb:edc9:f95c with SMTP id
 ada2fe7eead31-4bbf210aa1emr6936904137.15.1739457074833; Thu, 13 Feb 2025
 06:31:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-3-koichiro.den@canonical.com> <CAMuHMdXCAH=5Az9fq33-8izCLRbzxOM6zj8VbPWj0iR=KXPFtw@mail.gmail.com>
 <uwd2pczhwy6coa2oopsb3drtulnhvw5snmktikhbuhc5lljzio@3ixj2ksfhb4l>
In-Reply-To: <uwd2pczhwy6coa2oopsb3drtulnhvw5snmktikhbuhc5lljzio@3ixj2ksfhb4l>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 15:31:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXM2q5SHshb4f8kCxVM7REBbngFBYo2JFd+fOd6mpADFA@mail.gmail.com>
X-Gm-Features: AWEUYZmKn_OItAplv5izWu0V-KBIoXzcBxNXkklj1NElG-CEstlrOvtuO-vw0p4
Message-ID: <CAMuHMdXM2q5SHshb4f8kCxVM7REBbngFBYo2JFd+fOd6mpADFA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] gpio: aggregator: introduce basic configfs interface
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

On Thu, 13 Feb 2025 at 15:13, Koichiro Den <koichiro.den@canonical.com> wrote:
> On Wed, Feb 12, 2025 at 02:48:12PM GMT, Geert Uytterhoeven wrote:
> > On Mon, 3 Feb 2025 at 04:12, Koichiro Den <koichiro.den@canonical.com> wrote:
> > > The existing sysfs 'new_device' interface has several limitations:
> > > * No way to determine when GPIO aggregator creation is complete.
> > > * No way to retrieve errors when creating a GPIO aggregator.
> > > * No way to trace a GPIO line of an aggregator back to its
> > >   corresponding physical device.
> > > * The 'new_device' echo does not indicate which virtual gpiochip<N>
> > >   was created.
> > > * No way to assign names to GPIO lines exported through an aggregator.
> > >
> > > Introduce the new configfs interface for gpio-aggregator to address
> > > these limitations. It provides a more streamlined, modern, and
> > > extensible configuration method. For backward compatibility, the
> > > 'new_device' interface and its behaviour is retained for now.
> > >
> > > This commit implements minimal functionalities:
> > >
> > >   /config/gpio-aggregator/<name-of-your-choice>/
> > >   /config/gpio-aggregator/<name-of-your-choice>/live
> > >   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/
> > >   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/key
> > >   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/offset
> > >
> > > Basic setup flow is:
> > > 1. Create a directory for a GPIO aggregator.
> > > 2. Create subdirectories for each line you want to instantiate.
> > > 3. In each line directory, configure the key and offset.
> > >    The key/offset semantics are as follows:
> > >    * If offset is >= 0:
> > >      - key specifies the name of the chip this GPIO belongs to
> > >      - offset specifies the line offset within that chip.
> > >    * If offset is <0:
> > >      - key needs to specify the GPIO line name.
> > > 4. Return to the aggregator's root directory and write '1' to the live
> > >    attribute.
> > >
> > > For example, the command in the existing kernel doc:
> > >
> > >   echo 'e6052000.gpio 19 e6050000.gpio 20-21' > new_device
> > >
> > > is equivalent to:
> > >
> > >   mkdir /sys/kernel/config/gpio-aggregator/<custom-name>
> > >   # Change <custom-name> to name of your choice (e.g. "aggr0")
> > >   cd /sys/kernel/config/gpio-aggregator/<custom-name>
> > >   mkdir line0 line1 line2  # Only "line<Y>" naming allowed.
> > >   echo e6052000.gpio > line0/key
> > >   echo 19            > line0/offset
> > >   echo e6050000.gpio > line1/key
> > >   echo 20            > line1/offset
> > >   echo e6050000.gpio > line2/key
> > >   echo 21            > line2/offset
> > >   echo 1             > live
> > >
> > > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

> > > --- a/drivers/gpio/gpio-aggregator.c
> > > +++ b/drivers/gpio/gpio-aggregator.c

> > > +       /*
> > > +        * Undepend is required only if device disablement (live == 0)
> >
> > s/Undepend/Lock-up/?
>
> I must admit that I couldn't find a best suitable antonym to 'depend'.
> IMO Lock-up sounds a bit misleading. How about 'Unlock'?

I wrote "Lock-up" to match the "lockup" in aggr_lockup_configfs() below.
But now I understand why you wrote "Undepend": when passed "false",
aggr_lockup_configfs() calls configfs_undepend_item_unlocked(),
so "Undepend" is fine.

> > > +        * succeeds or if device enablement (live == 1) fails.
> > > +        */
> > > +       if (live == !!ret)
> > > +               aggr_lockup_configfs(aggr, false);
> > > +
> > > +       return ret ?: count;
> > > +}

> > > +static struct config_group *
> > > +gpio_aggr_make_group(struct config_group *group, const char *name)
> > > +{
> > > +       /* arg space is unneeded */
> > > +       struct gpio_aggregator *aggr = kzalloc(sizeof(*aggr), GFP_KERNEL);
> > > +       if (!aggr)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       mutex_lock(&gpio_aggregator_lock);
> > > +       aggr->id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
> > > +       mutex_unlock(&gpio_aggregator_lock);
> > > +
> > > +       if (aggr->id < 0) {
> > > +               kfree(aggr);
> > > +               return ERR_PTR(aggr->id);
> > > +       }
> >
> > The above more or less duplicates the existing code in
> > new_device_store().
>
> I'll factor out the common part and add new funcs gpio_alloc()/gpio_free().
> Please let me know if any objections.

Thanks, that would be fine!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

