Return-Path: <linux-gpio+bounces-15331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D9FA27498
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 15:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C02BD1885C9A
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 14:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4154B2139C7;
	Tue,  4 Feb 2025 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="OwxXabYZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3AE211711
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680093; cv=none; b=Mo8YeSdestAzC1OzzJklhKexy7FA61COUokMQSo6lxCCaXwRzDv+bs9ENsStx8jILe/rIoTO1Et34elPEephitSiABe6s5gEroVbMO+LtxmpeGI53qKqREtXM6ctq9M6Ihrx9O1jfBdKDa+k2feF4/OUVaOZIVVTxK2ddXR/tdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680093; c=relaxed/simple;
	bh=BMGDwiLbAtv1kulz/bui98aV53RmfjV3bOyK6fXGhzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMKadUHc6CSMEu72zc/iEJ5r67l3lekrr45obwFCLgCgHFPHw8vahFjZXs0g187XHb6aiSluOM1NXaZ2NEppxC5JvzRnTB5qGnUjwATND06OCf5IEuf0djgbWoSxXooa4Gs8jJkUhawz8pxVSPlUZPYLFbjzEiYb5ydTP7nhP1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=OwxXabYZ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C8DAE3F2A0
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738680080;
	bh=EJaIOF0N/QTq/TdxcqovwMBZGpip11h7EW5dSH9cOBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=OwxXabYZQG1XJfoBJPDaNlAGHNCDaWfKYNlW3v3eq9MUOtLOZG+z831pG920o9ZBE
	 XXAO2BWH3/zrkzdAdTB5Yj0ORlMWY2Z3HKXQFIFjtWtl93ilhjX2OKui1EH81Bl9W9
	 r9Tfd1/i0QeRI2f/ety8loKnMHHM4dWLObbNFWDZjJjVJR16UlpRhYtCzBcV4F+F7a
	 JmzrDJnA0+v5YFvbO3FYEsG8Sm9rBKbO9ij+yRa93bLwATdqpldiM7v1S1MUBGiR1R
	 NmugNWpVZlUnAfiCrSCbAGpdmSeMWB0p/XxnGkhB72kiKdFNMqNOJRg1IALhX3NXC5
	 9q+dAbF7I8p1g==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2165433e229so127205645ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2025 06:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680079; x=1739284879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJaIOF0N/QTq/TdxcqovwMBZGpip11h7EW5dSH9cOBw=;
        b=jZDwDIuODaGR5V0sFsWFMeiHjhUcmr6wwsbMW68nYfBDRjZB4jEKVonwAlrxsTzQg1
         bsRXaygOjmOj99InPSrcgxBP/TcOdGZQBEUDXkayvCkRPlbPZ5EanJFsr0izjskd3Tre
         R2kL6PXK/9ns2zxjAeHLrNZTQvxkh3FlI/3JPaYxAONHV5b64UfnuDiiuJq0asL6aGpC
         5oqmrXykoT3LD4F94D65vMxD7qbCV6sB+GW/ji+pu7Mwyufr6EHIu5ZLYF9u5cDsYf3n
         dAVpsx1sS5Jt8x2xPMsnPHDhZBk/bjei+xbZMXEABG1PG+Bmo0GjVYVSeTQdh5xhKnux
         1iPw==
X-Gm-Message-State: AOJu0Yxsf066QDLa1NuBK8H7AAnp3iypQgXarZXP8E7BUEeA7MhXgVE3
	ru44sWSDUCAOyc1p90wm6Lb/BbUB6ezRfA8MKBr+RRROC13WROlE7ncoopmBW1oPM8AYAe4M+fj
	VPaC6DMfcFdd3lgZbFlLLeIT0l8Mi8rIEkN6k0Bw1fRgqQgCnLVD6e6ATj0JUuuqdTbyvfcwJDo
	U=
X-Gm-Gg: ASbGncuUeoWnekCg6GKaBWNguqYqMUa7qKyLMKklLR7LSsQUVQCC59xeKjou4WGvRy8
	htr/n+xjw0hdefRfCTQoiVL2N82ZHTK6jJDCaC8LTE/RmNmXmNRtq6RNTQH/5tuBPo+NiKp2nji
	K7TyLEiy6VQ1oZmIMpp4CZHSyIo+J/kzVEv6HTYoDL3hvCiZzsRDU+bi9Niz9NEj5Zx259Yy+ld
	SNyT7nxwUFPM8EbMLxEHP93aq+CDfL1LeD5qH2GFFyckZlN+nXWukfPXgVEgnANgUgn0Z9i64vJ
	JyKksnw=
X-Received: by 2002:a05:6a00:b4b:b0:729:1b8f:9645 with SMTP id d2e1a72fcca58-72fd0c7f7camr40080318b3a.24.1738680079407;
        Tue, 04 Feb 2025 06:41:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTIaNuKXb8Us1Vm3hkqF8NHqRSpyv0Xat8x2G6U4q91htnnEiYhrYyDf53JedhLPqXUEsj5w==
X-Received: by 2002:a05:6a00:b4b:b0:729:1b8f:9645 with SMTP id d2e1a72fcca58-72fd0c7f7camr40080286b3a.24.1738680079022;
        Tue, 04 Feb 2025 06:41:19 -0800 (PST)
Received: from localhost ([240f:74:7be:1:45f0:d4ba:baba:a275])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1cb70sm10335865b3a.180.2025.02.04.06.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:41:18 -0800 (PST)
Date: Tue, 4 Feb 2025 23:41:16 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] gpio: aggregator: introduce basic configfs
 interface
Message-ID: <lkqxpfu3uzh4p4as3msv322qwlm6frv3iujifs6f3t2fjl4sep@3hsp6gzdieik>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-3-koichiro.den@canonical.com>
 <CAMRc=MfcooZXBqVpbQ0ak+8LGsPDzwKSN3Zfb0eZDx1Bx4duzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfcooZXBqVpbQ0ak+8LGsPDzwKSN3Zfb0eZDx1Bx4duzQ@mail.gmail.com>

On Tue, Feb 04, 2025 at 01:48:49PM GMT, Bartosz Golaszewski wrote:
> On Mon, Feb 3, 2025 at 4:12 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
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
> > ---
> >  drivers/gpio/gpio-aggregator.c | 549 ++++++++++++++++++++++++++++++++-
> >  1 file changed, 548 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
> > index 570cd1ff8cc2..c63cf3067ce7 100644
> > --- a/drivers/gpio/gpio-aggregator.c
> > +++ b/drivers/gpio/gpio-aggregator.c
> > @@ -9,10 +9,14 @@
> >
> >  #include <linux/bitmap.h>
> >  #include <linux/bitops.h>
> > +#include <linux/completion.h>
> > +#include <linux/configfs.h>
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
> >
> > @@ -61,6 +93,97 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
> >         return 0;
> >  }
> >
> > +static int aggr_notifier_call(struct notifier_block *nb, unsigned long action,
> > +                             void *data)
> > +{
> > +       struct gpio_aggregator *aggr;
> > +       struct device *dev = data;
> > +
> > +       aggr = container_of(nb, struct gpio_aggregator, bus_notifier);
> > +       if (!device_match_name(dev, aggr->lookups->dev_id))
> > +               return NOTIFY_DONE;
> > +
> > +       switch (action) {
> > +       case BUS_NOTIFY_BOUND_DRIVER:
> > +               aggr->driver_bound = true;
> > +               break;
> > +       case BUS_NOTIFY_DRIVER_NOT_BOUND:
> > +               aggr->driver_bound = false;
> > +               break;
> > +       default:
> > +               return NOTIFY_DONE;
> > +       }
> > +
> > +       complete(&aggr->probe_completion);
> > +       return NOTIFY_OK;
> > +}
> 
> Suggestion: this is the third time we're seeing this mechanism being
> used (after gpio-sim and gpio-virtuser). Maybe it's time to try and
> abstract it as much of the code is shared?

That makes sense. I would add gpiolib-vgpio.[ch] and add an opaque
* struct vgpio_common
and two api functions as our first step:
* vgpio_init(get_devname_cb) # bus notifier calls the cb to get devname
* vgpio_register_pdev_sync(pdevinfo) # return -ENXIO when probe fails
What do you think?

Thanks,
Koichiro

> 
> The rest looks good to me.
> 
> Bart

