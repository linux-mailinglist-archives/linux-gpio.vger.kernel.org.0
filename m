Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3968479B8C2
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239581AbjIKUzI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236519AbjIKKsl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 06:48:41 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0D5EB
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 03:48:36 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-495e3d1edb4so668669e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 03:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694429315; x=1695034115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2W58yDzB9ApQ3ehdScVXN8upAm7VuvxcXWQWmiIa7E8=;
        b=vbmJyjyH7WIRAhPcn79K78KWUy7JCXMl7QhzxybMdBSM7KEbbEdWX7ddYege7OgUaW
         rXOAEL6zbWb4Dpl7lGntIxP9zMOl7kJ8gpY83Mb6Z7iAaOLzye9T0bvjxEN0CnjCDhGG
         KVtOK9ed7N/dCU3DNQK1nw8slW3zUxuUo63J6mgR1R/tQZJMG5yfRbgWz4XCjNjMZ4ne
         bBhZB63YFfOGMgjtgUD8NdLukfelmukauxD23zM4PfhzHzRrGpbfkRHbqE7E8T9tYDS5
         EfmnfLRA45RI1FHqVwVEH6ilwa0SIqcHi/cVkUX3N6d8+KvDcSVJdmPTG96jBMyMCTbr
         9UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694429315; x=1695034115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2W58yDzB9ApQ3ehdScVXN8upAm7VuvxcXWQWmiIa7E8=;
        b=uQ11393ag48s+w8z5JIPa0ONXP093YJs3USyqDWGB6EVTAS6K6+CeGwqSWWjuNqht6
         8GBIjkbmS1voOqon0GkEStfVLxp0CLpkzit5UYQe73iJVyB+GYGqOwAGR5wsMnpA4aoy
         aFu0SeicnkW72FfBraaW6RzdWHjt2XXuXWO7pHtZke3l3r8/fP5FdRkSPSPsA1dgYY7a
         wdxa+kTEZ/H8qc2DdtjqVhJtoSK0mMDI7dSvoKvg2IQD9TvTkg1rpRDuqMQuwJhjKWo9
         SFhzTfWsjPTvioyguU/U3VmOj5oXY/Bxo3GFpII57ezoFvCYzOmT2pnhAxHamJ0XmNpq
         S1WQ==
X-Gm-Message-State: AOJu0YzmVNaqXME39YuxuMlVpmIvxDK5IDu5+IeSRvfxi5PdCZ1MSjJf
        4trgq5OmPN8tRqwk+aQmSGCMM/rySWXXls6Z4E/7//k4fQ7iTCmI
X-Google-Smtp-Source: AGHT+IESQqYlvpx9o62WbrEPxO+OhV/gkv08dv7NBq9ahTs61O6b3M9evZiOXqQPoVqg/OxPT88hxKWQdDZ1ZREMzQU=
X-Received: by 2002:a1f:c743:0:b0:495:e688:72b7 with SMTP id
 x64-20020a1fc743000000b00495e68872b7mr1120879vkf.4.1694429315320; Mon, 11 Sep
 2023 03:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230907082751.22996-1-brgl@bgdev.pl> <ZPnaoOUiYDR3yqGu@smile.fi.intel.com>
 <CAMRc=MfDOaRbgCH4OH8roLorRNYEscg1WhNFN_nDGyz9xRVWiQ@mail.gmail.com> <ZP7lPn5BfAJj+soP@smile.fi.intel.com>
In-Reply-To: <ZP7lPn5BfAJj+soP@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 12:48:24 +0200
Message-ID: <CAMRc=MdOHzXp8AT7CWOM0SK4RfK9AMLEv8UmTiG4qGsqHFxA+g@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: sim: don't fiddle with GPIOLIB private members
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 11, 2023 at 12:00=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 08, 2023 at 02:39:28PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Sep 7, 2023 at 4:13=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Sep 07, 2023 at 10:27:51AM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > >  #include <linux/completion.h>
> > > >  #include <linux/configfs.h>
> > > >  #include <linux/device.h>
> > >
> > > > +#include <linux/device/bus.h>
> > >
> > > No need, the device.h guarantees that.
> >
> > Wait, wasn't you the one who always suggests including headers
> > directly if we're using any symbols defined in them? Like when I said
> > that we don't need to include linux/notifier.h because it's already
> > included in gpiolib.h and you argued the opposite? :)
> >
> > device_match_fwnode() is defined in linux/device/bus.h so I thought
> > it's in order to include it.
>
> Yes, but I am not radical with it, I am for a compromise when some header=
s
> guarantee to include some others. That is the case I believe, I don't thi=
nk
> device.h ever will be broken to the parts that are not include each other
> (too many things to change right now, if it happens, not in the feasible
>  future).
>
> ...
>
> > > > +static int gpio_sim_dev_match_fwnode(struct device *dev, void *dat=
a)
> > > > +{
> > > > +     /*
> > > > +      * We can't pass this directly to device_find_child() due to =
pointer
> > > > +      * type mismatch.
> > > > +      */
> > >
> > > Not sure if this comment adds any value.
> >
> > I disagree - I would have used device_match_fwnode() as argument
> > passed directly to device_find_child() but I cannot due to pointer
> > type mismatch error so we need this wrapper and it's useful to say
> > why.
>
> Yes, and we have dozen(s ?) of the similar wrappers without a comment.
> So, I'm still for removing it.
>

Meh, fair enough.

Bart
