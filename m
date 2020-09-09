Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3DDA262BC6
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 11:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgIIJ0Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 05:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgIIJ0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 05:26:12 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C8FC061573
        for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2020 02:26:12 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id e23so2548172eja.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2020 02:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r6DZDXW2YGItYWu3dtFgHpQyQnbLb2FyzRV1Tm+8JvY=;
        b=MLtuElp1YLqmIO7OwQ6l20NeACyG2PIdqREORO+akPvUrIJCNfv+jHg31uTBSo7tvY
         CWEcZxrZOG/vFPhcUp88soN0nhZBwCZS/ZxqylYK2NDagz4mQaUufqceBiMtj5lUOCYC
         hJBvGSk25zG56nS6GkLDsmc/oLxglNmKYqU29+p9CcUCnB/CunbqRkprARZw+gg/67zV
         CAiaQ3H/+18KUUyU5U5TSqVDidt4eCNkNnnDRe4WPtvtlQFi0i/XED+LXl3xyO4HW7Vf
         jp7VUZSBHJvvk0b7RYSAEd99Pq8U03/mtiK3fVP1LH4DnerRYFX89OZBSf+VE2dNMbde
         o27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r6DZDXW2YGItYWu3dtFgHpQyQnbLb2FyzRV1Tm+8JvY=;
        b=TgdTjV1QHAXnm8RnjIgoi9XC+a1on45IVRVlGsgpROiswJJlJerk4WDv/nt64nBb9Q
         2i2uB36P7KJM8DzgSXDZ0L247Gk/f2bSVBAwxsfgCIKSHTqQT2qO5kdjue6J0dsFVn+g
         p4HaPOjUwdKTRXg/H+8PcBsA/medgSW3lgcy4873j7NPo9s0ytzXDxJ7Fwu/sQLhRRdO
         sbfPlcGw2e+5BaXDhp8nOBTPoikaSnha1qJOplDdS+3bNPpiceUN+F56y/21prG2Xnkb
         hwGUBXqT25XZklIf4tSfypmS1aCckVUR/WhkeacYN1SzglRggw8qhQqqKfZlrBa4CuDt
         julw==
X-Gm-Message-State: AOAM5308ItZM1xoIAV6BuOXIpWT9ZZvdP0h1eFbPRc+uVg39Vz1rjcev
        +TpaKH4FRq2L+tEWkZE9G8uBXlYfAPbv7DXu2gZmRg==
X-Google-Smtp-Source: ABdhPJwnH/OaaOXRFuOx08+jmJH/w+WnKzlsJruGsmUcYnh6fd9B+IgiKxG2Pi4LXbnAZHCO/70tnv307RgxU8Bvfw0=
X-Received: by 2002:a17:906:c1c3:: with SMTP id bw3mr2653214ejb.516.1599643571188;
 Wed, 09 Sep 2020 02:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200905133549.24606-1-warthog618@gmail.com> <20200905133549.24606-8-warthog618@gmail.com>
 <20200909092401.GA1431678@sol>
In-Reply-To: <20200909092401.GA1431678@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 9 Sep 2020 11:26:00 +0200
Message-ID: <CAMpxmJXh9pKMAXgPWSCPXeyjP0CSo=A5SgLPrL2eRxX-LAyKag@mail.gmail.com>
Subject: Re: [PATCH v7 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 11:24 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Sat, Sep 05, 2020 at 09:35:36PM +0800, Kent Gibson wrote:
> > Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> > returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
> >
> > The struct linereq implementation is based on the v1 struct linehandle
> > implementation.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >
>
> [snip]
>
> >               if (copy_from_user(&offset, ip, sizeof(offset)))
> >                       return -EFAULT;
> > @@ -1104,6 +1505,25 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
> >                MAJOR(devt), gdev->id);
> >
> >       return 0;
> > +     /*
> > +      * array sizes must ensure 64-bit alignment and not create holes in
> > +      * the struct packing.
> > +      */
> > +     BUILD_BUG_ON(IS_ALIGNED(GPIO_V2_LINES_MAX, 2));
> > +     BUILD_BUG_ON(IS_ALIGNED(GPIO_MAX_NAME_SIZE, 8));
> > +
> > +     /*
> > +      * check that uAPI structs are 64-bit aligned for 32/64-bit
> > +      * compatibility
> > +      */
> > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_attribute), 8));
> > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config_attribute), 8));
> > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config), 8));
> > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_request), 8));
> > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info), 8));
> > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info_changed), 8));
> > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_event), 8));
> > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_values), 8));
> >  }
> >
>
> A couple of things here - these should all be !IS_ALIGNED.
> And the BUILD_BUG_ON gets compiled out, and so doesn't fail, if they are
> after the return.
>
> How would you like that fixed - v8 or a patch once v7 is in?
>
> Cheers,
> Kent.

v8 please. Why is it compiled out though? Does it need some config option?

Bart
