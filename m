Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E923B5351
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 15:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhF0NDh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 09:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhF0NDg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 09:03:36 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF57C061574;
        Sun, 27 Jun 2021 06:01:12 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id l11so8276167pji.5;
        Sun, 27 Jun 2021 06:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=urTHBIKM6lEjpRzJNUmH8nQ9kyBs572HUnD7SYNnOog=;
        b=huXjUqxe3f5WRT4AR/1ssDz+NECEWjr7TaJ+5Nz053mehwqZ8i7Mhl8QH8A9Hq52Am
         8gJugi1gSzwvna6QWlN//Y20fG2GSGCdFLYTxa+uyrD87elnVAKRsHn1rhUJsS1QftMI
         0scZ/vkhj05Rf84kNNkpu9GqEhenKBdwZs0+mAWHwHw9KWD5iGm9Z3BjazxSFa5pspRP
         PIFhwYw5GjxQFTFJwRkf6P/eKMvzTgVVbl5BAq0a7PFHD3JSt7cJj+E8K2txoTvHftN6
         cQ3tFoQOuH30iMjfrruIpctFpen0MRlcYpnnRYIW9tOTqKRFjayaibvm3L8N6gEU7NTP
         gyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=urTHBIKM6lEjpRzJNUmH8nQ9kyBs572HUnD7SYNnOog=;
        b=eSK6URREDnxP65/vlFM4WDhfIcb/VeOZPbf1ecageD2MP7YGMZ48rj/q8AiRKp2Ud5
         pINK1NysYoox5VP8TXG4DlABXbOJTf3ko/WDvGwXU4t2fL53cQ8h6XKZmfNtetFXYFBY
         1hd7tTf7PD2jd7hOdLiA+aqMMdv+/wRzxfP4WD55qbMIONoSlVyDIsOSktz4G/6+Wwgk
         T3DtMgvss0g2KMVgF284UHRq/LyRt25R6lpz1rRJh/oKGISENMnJR51/57aUOOwqDSJh
         tKw7FyMjm9UxHY9eW+EAoPszU4YCkzIL+w/+lVHfwdC3do8JugF2hrmG73tAQErBvzkZ
         iZaA==
X-Gm-Message-State: AOAM5338rCVK+9jAJ5DZN+2G7l/sYI/rqqdYUmIrnXgG/fq5WyUsZCd0
        Zq/nGISxoLTE9HzOr/9yTrPqcagpgP+Ee+17tBg=
X-Google-Smtp-Source: ABdhPJy8T/jd/2TFl23UgtErSygoWYoU8Cqf4O0AgpGpucI2gqZ3jEGYjAer/BbUg+FW2ENCiYCl4urK/YlAdsey4fE=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr32510303pja.181.1624798872128;
 Sun, 27 Jun 2021 06:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
 <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com>
 <CAMhs-H_fcNDAOHm=tZB4ku9fzeea_7f4ZLg7w5KEmcNu+8wbQQ@mail.gmail.com>
 <CAHp75VeN+vww=Bj=g-nx9AT0FKSGAZ8CKQZn=ff2kfQWM+dxdw@mail.gmail.com> <CAMhs-H-WwCfPDspgxzN=W8QouZ7WPAeyJDYf_6=YezyCkTM=Vw@mail.gmail.com>
In-Reply-To: <CAMhs-H-WwCfPDspgxzN=W8QouZ7WPAeyJDYf_6=YezyCkTM=Vw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 27 Jun 2021 16:00:36 +0300
Message-ID: <CAHp75VcF-HDZ6mKvXT=zYnBrcPaNJ+SYJ72LQ7s-62zQ5ZqoQg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NeilBrown <neil@brown.name>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 27, 2021 at 1:56 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Sun, Jun 27, 2021 at 12:51 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sun, Jun 27, 2021 at 12:47 PM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > > On Sun, Jun 27, 2021 at 11:33 AM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Sat, Jun 26, 2021 at 7:18 PM Sergio Paracuellos
> > > > <sergio.paracuellos@gmail.com> wrote:
> > > > >
> > > > > The default handling of the gpio-line-names property by the
> > > > > gpiolib-of implementation does not work with the multiple
> > > > > gpiochip banks per device structure used by the gpio-mt7621
> > > > > driver.
> > > > >
> > > > > This commit adds driver level support for the device tree
> > > > > property so that GPIO lines can be assigned friendly names.
> >
> > > > > This driver has three gpiochips with 32 gpios each. Core implementation
> > > >
> > > > implementation
> > > >
> > > >
> > > > > got gpio's repeated along each gpio chip if chip.names is not assigned.
> > > > > To avoid this behaviour driver will set this names as empty or
> > > >
> > > > the driver
> > > > these names
> > > >
> > > > > with desired friendly line names. Consider the following sample with
> > > > > minimal entries for the first chip with this patch changes applied:
> > > >
> > > > The same comment as per v1:
> > > >
> > > > Any idea why it's not a duplicate of
> > > > https://elixir.bootlin.com/linux/v5.13-rc7/C/ident/devprop_gpiochip_set_names,
> > > > and why the latter is not called in your case?
> > >
> > > The core properly calls this function but not in the way expected.
> > > This driver implements three banks of 32 gpios each internally using
> > > one gpiochip per bank, all of them in the same device. So the core
> > > code you are pointing out here duplicates the same names along the
> > > three gpiochips which is not the expected behaviour. So implementing
> > > in this way and setting names at least reserved avoids the core code
> > > to be run and also avoids the duplication getting expected behaviour
> > > for all the banks and each line friendly name.
> >
> > Isn't it the problem of how we supply fwnode in that case?
> > Another possibility is to fix DT (although I'm not sure it's now possible).
>
> Since the fwnode is the same for all banks of the same device, each bank
> repeats the first MTK_BANK_WIDTH label names in each bank.

Can you point out the DT in question?

> This commit populates the gc.names member of each bank from the
> device-tree node within the driver. This overrides the default behavior
> since devprop_gpiochip_set_names() will only be called if names is NULL.

I believe this commit is not needed in the proposed (i.e. duplication) shape.
The fwnode supports primary and secondary ones. Thus, we may create a
pair of fwnodes when they will unify properties per device with
properties per child together (child is primary and device, i.e.
parent, is secondary).

-- 
With Best Regards,
Andy Shevchenko
