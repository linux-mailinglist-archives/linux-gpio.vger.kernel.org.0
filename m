Return-Path: <linux-gpio+bounces-15405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 492C0A28BE5
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 14:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C74A71603E4
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 13:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AEF146A63;
	Wed,  5 Feb 2025 13:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="LC3paigR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF9413A88A
	for <linux-gpio@vger.kernel.org>; Wed,  5 Feb 2025 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762755; cv=none; b=s3MFjWL2tviouDY//qPVW/aJ5+6DKPxpVLSplg+7RLvowxva9x/Axk50+zIMapZ7kKCkONM477qPoyIXi2FBbvXW8dFF+6MFiPeQqUDR9IiLco/hIaR3vyageOqEF1c6AEpL4xEo2upRYKl/Q8It/qluTlqKpiYVseKZshwfKrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762755; c=relaxed/simple;
	bh=XIlBawrt1HrnAL1fJF/NMVQKvvuIhgEKoVwat7RndvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSMvoGELKefksbMCumE0gWYQoEyOTfqVXnZqxQv9GwyjJjsGd5PZBfPzRVh8zMGqpDS1ha2qsVNnY8Wcurh2V85hjyOMtBZiFBvAX/NYcFHSarXErFsvuzopAirAbo42v+HEc8et86snFaD/JOD2RA6IPaNMiLIdhhKzgyOWnN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=LC3paigR; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 10E673FA55
	for <linux-gpio@vger.kernel.org>; Wed,  5 Feb 2025 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738762749;
	bh=tSugA90/VHb7IX3bkFcnQ+nO3Qe0hz7LEEDJxb8uKmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=LC3paigRbBKWv0SGZknM5iGXFXwSyi1FNDvaeypabsaXrZYbADvOfXLvAkgBx7RWC
	 kUPEr8sSGWMShLMRcnMtduAVBPyGdB7jyfqm/JmqJ/mK5TVPCVJX6FisPVhzafl0U7
	 bPX6FLlpmLuYaXa6u1KK/gLW1YFVG1M95Ma0EMGToP08tYftzWQyJlQsKCCneDXpTY
	 KJwOGNglEZZ2LxIxT+6SUZXpp2j34gt5gYU7nd4nElsyhWxeXQznnMR18VySnxKs89
	 VksAhcgEvZmVa3KoAUmJWdw8XxzaHjcUm5emzD0z/ZB20SrqL0TxXFmfCav7HEBp4y
	 H6uf9N0MAE36A==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f075a828bso32114035ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2025 05:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762747; x=1739367547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSugA90/VHb7IX3bkFcnQ+nO3Qe0hz7LEEDJxb8uKmo=;
        b=TT45BP+X0mMqvgvb4YOMAIrEU0SXxSVvpuNGBO+LSp/jKJezYxjSf1jk2jmm0NWmwN
         mCdgQIpo+LNfP7Ga2iT/h3vTc7ZT08LSCUKWmnWOTHUGlteL7WucyQPart+QVb+BG6Qe
         SI1QOdf1jPemYliS67P4tqLuoPePjMN8VpyRbVizzYGwZuSdTc7mTzq8QrNMyoIzNkDt
         jKKBmsJlTSwJWDJJ44ehQpbwnesJTe6lf11CY5kIuCb165GJVlzTIaC2w4lKWX67p/t0
         uH8uQUV+WhBnM+XURHJ0WjTBAiJxNQVKpDRZ43SglP0TqDoJJcABZQBORIWRDk8aS4Xp
         kCqg==
X-Gm-Message-State: AOJu0YysoHz3v00U1pOFrupNTw+CXjCqw0JTxbZChKpoUBlHCPwU/d7H
	e6ABK9ew6aZVwEa//7nuF1aJw7Q5nL6oyVk/yxMVn2b0TgGX/bAoBsRuGPwxFxq9FmwWRELOEb1
	KSsmE7j+P6gyqvqZpsc6uYMsuaE6krBOXJrt5mZOGBcViQ0g56QO6m4PRUH3sJg2FIfD8W4rWJR
	s=
X-Gm-Gg: ASbGnctzRn5fz42+Mp6oX8S770B+LD6JESOV/1rbD3wzJtRNYnCBrImKZ8hMLvu3JWL
	G5A6dkWenTv/6pi2bCQNoScf4RvH31HERO+Y6kkmFCtt0ihYwVrmg4sC2BvXOMD3TnBa6wwnAD7
	W1DX02z5kgJIspLu37LyuKn654BwixddFVtDtwfkubZmGyhfqMdAJwT9V3sStc3DM80ItbSJiYZ
	hbbnrgAUcNq/A0tgsl6w33qFS7vz47Xgo4YUx2UPdp6ba2Z+8CA1dIf4Bg8CSMa3LBaPnGke2fA
	D3m0W1k=
X-Received: by 2002:a17:902:e803:b0:215:e98c:c5c1 with SMTP id d9443c01a7336-21f17e74e67mr41446625ad.30.1738762746895;
        Wed, 05 Feb 2025 05:39:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIVRvCnElpUm14sHLZB2kuMes82lQ8It/4MSzK0Nn/xkxQ5iPNJpL3qRVBbRM57Ddm4/GQOg==
X-Received: by 2002:a17:902:e803:b0:215:e98c:c5c1 with SMTP id d9443c01a7336-21f17e74e67mr41446365ad.30.1738762746433;
        Wed, 05 Feb 2025 05:39:06 -0800 (PST)
Received: from localhost ([240f:74:7be:1:32aa:793b:6be9:7226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f15431cb5sm16344195ad.98.2025.02.05.05.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:39:06 -0800 (PST)
Date: Wed, 5 Feb 2025 22:39:04 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] gpio: aggregator: introduce basic configfs
 interface
Message-ID: <dmy4mvxut3l5kqds2b2fnnes5ukr73spddwgrbkeoqrb5p5wir@hkq6ltr7d6dt>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-3-koichiro.den@canonical.com>
 <CAMRc=MfcooZXBqVpbQ0ak+8LGsPDzwKSN3Zfb0eZDx1Bx4duzQ@mail.gmail.com>
 <lkqxpfu3uzh4p4as3msv322qwlm6frv3iujifs6f3t2fjl4sep@3hsp6gzdieik>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lkqxpfu3uzh4p4as3msv322qwlm6frv3iujifs6f3t2fjl4sep@3hsp6gzdieik>

On Tue, Feb 04, 2025 at 11:41:16PM GMT, Koichiro Den wrote:
> On Tue, Feb 04, 2025 at 01:48:49PM GMT, Bartosz Golaszewski wrote:
> > On Mon, Feb 3, 2025 at 4:12 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> > >
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
> > > ---
> > >  drivers/gpio/gpio-aggregator.c | 549 ++++++++++++++++++++++++++++++++-
> > >  1 file changed, 548 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
> > > index 570cd1ff8cc2..c63cf3067ce7 100644
> > > --- a/drivers/gpio/gpio-aggregator.c
> > > +++ b/drivers/gpio/gpio-aggregator.c
> > > @@ -9,10 +9,14 @@
> > >
> > >  #include <linux/bitmap.h>
> > >  #include <linux/bitops.h>
> > > +#include <linux/completion.h>
> > > +#include <linux/configfs.h>
> > >  #include <linux/ctype.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/idr.h>
> > >  #include <linux/kernel.h>
> > > +#include <linux/list.h>
> > > +#include <linux/lockdep.h>
> > >  #include <linux/mod_devicetable.h>
> > >  #include <linux/module.h>
> > >  #include <linux/mutex.h>
> > > @@ -34,11 +38,39 @@
> > >   */
> > >
> > >  struct gpio_aggregator {
> > > +       struct config_group group;
> > >         struct gpiod_lookup_table *lookups;
> > >         struct platform_device *pdev;
> > > +       struct mutex lock;
> > > +       int id;
> > > +
> > > +       /* Synchronize with probe */
> > > +       struct notifier_block bus_notifier;
> > > +       struct completion probe_completion;
> > > +       bool driver_bound;
> > > +
> > > +       /* List of gpio_aggregator_line. Always added in order */
> > > +       struct list_head list_head;
> > > +
> > >         char args[];
> > >  };
> > >
> > > +struct gpio_aggregator_line {
> > > +       struct config_group group;
> > > +       struct gpio_aggregator *parent;
> > > +       struct list_head entry;
> > > +
> > > +       /* Line index within the aggregator device */
> > > +       int idx;
> > > +
> > > +       /* GPIO chip label or line name */
> > > +       char *key;
> > > +       /* Can be negative to indicate lookup by line name */
> > > +       int offset;
> > > +
> > > +       enum gpio_lookup_flags flags;
> > > +};
> > > +
> > >  static DEFINE_MUTEX(gpio_aggregator_lock);     /* protects idr */
> > >  static DEFINE_IDR(gpio_aggregator_idr);
> > >
> > > @@ -61,6 +93,97 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
> > >         return 0;
> > >  }
> > >
> > > +static int aggr_notifier_call(struct notifier_block *nb, unsigned long action,
> > > +                             void *data)
> > > +{
> > > +       struct gpio_aggregator *aggr;
> > > +       struct device *dev = data;
> > > +
> > > +       aggr = container_of(nb, struct gpio_aggregator, bus_notifier);
> > > +       if (!device_match_name(dev, aggr->lookups->dev_id))
> > > +               return NOTIFY_DONE;
> > > +
> > > +       switch (action) {
> > > +       case BUS_NOTIFY_BOUND_DRIVER:
> > > +               aggr->driver_bound = true;
> > > +               break;
> > > +       case BUS_NOTIFY_DRIVER_NOT_BOUND:
> > > +               aggr->driver_bound = false;
> > > +               break;
> > > +       default:
> > > +               return NOTIFY_DONE;
> > > +       }
> > > +
> > > +       complete(&aggr->probe_completion);
> > > +       return NOTIFY_OK;
> > > +}
> > 
> > Suggestion: this is the third time we're seeing this mechanism being
> > used (after gpio-sim and gpio-virtuser). Maybe it's time to try and
> > abstract it as much of the code is shared?
> 
> That makes sense. I would add gpiolib-vgpio.[ch] and add an opaque
> * struct vgpio_common
> and two api functions as our first step:
> * vgpio_init(get_devname_cb) # bus notifier calls the cb to get devname
> * vgpio_register_pdev_sync(pdevinfo) # return -ENXIO when probe fails
> What do you think?

The previous comment was a bit too rough, sorry. I feel it's not a good
idea to write down detailed design plan here, so I'm thinking of having it
reviewed in v3. Please disregard the above comment.
I also noticed that this v2 patch series lacks 'select CONFIGFS_FS' for
CONFIG_GPIO_AGGREGATOR. I'll add it in v3.

In any case, I'll wait for further progress in the discussion at:
https://lore.kernel.org/all/CAMRc=Meb633zVgemPSeNtnm8oJmk=njcr2CQQbD5UJd=tBC5Zg@mail.gmail.com/

Thanks for the review.

Koichiro

> 
> Thanks,
> Koichiro
> 
> > 
> > The rest looks good to me.
> > 
> > Bart

