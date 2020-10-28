Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C0829D46F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 22:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgJ1VwH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 17:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727786AbgJ1VwG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 17:52:06 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921B1C0613CF;
        Wed, 28 Oct 2020 14:52:06 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id f7so1156402oib.4;
        Wed, 28 Oct 2020 14:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hsiBaHtytHat8/EztZJPMms+wc+gkK9fFhRbXpui7XQ=;
        b=MQEVLxlQBAUE8Edv0UruJBsGHTS6407b6J0mWXgnZtxQWJVTgvfoZAswU7xJkgQYQ0
         Ddm8sQ76zjJVRKtkQlFy90/AG4a+nCqMy6zwee3lZeSF58nUjzSCyR6e5ipuATwKeQFx
         +dpfnl3557iDt1HkVOdgqrc/F0u3oSsHc41Nw5dv21WL9SpIUx4hRzE3USyBCuRi6Rfd
         7tuyWySJ5FCOs5D5P4BwoT+Kdd7sZpT5YW6+QKiL8YaQN3JGb90e1j3XsaGJDBGK6uGY
         fiWnh8PoMxckM3nrVT395A+mMs9GIBD/ul5M6+fZHqzzmTg6GJIP3AVVGMnWB1PRla0t
         k7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hsiBaHtytHat8/EztZJPMms+wc+gkK9fFhRbXpui7XQ=;
        b=WNtPKcbP2JxSkulBXowV3IIiDZ12QDrGoILu5h7gcZLNJHspPhsy0Aw/4dGUdPAo5n
         RAcb43Ez5gNj7vP4/zgXLTslWZFu765q8/QGKeOAz0gq6PzAbW4Ok0Q03Ri2gSdsWxVp
         23St3rWcISojR3OHwYYtFU/4XEN7cuGATiROBb8cUjFXtXv2GqSAClF09zBmh1tvxJEb
         55wTB2UHEXD3gYK8S7kzm6uOanYrNCojSEjfX2me9U/0U3XEUA3VoIgaSBbKLNp3N6KK
         ilITnByRqdQpxhfzLWIoND3bzUyUQdPf6rjRxxQTTfeHsSkhgW53njsQyiYJFuNaZE8r
         7K1w==
X-Gm-Message-State: AOAM530mdRXOqrOzS84LUHvH7eXL5ZKLCRkSA1dVUHfJ7kAp/jZnUjPi
        xrOePGq92UixBYb5LsabStWzDP/37xDPWnM+PJJ30Yt/MgA=
X-Google-Smtp-Source: ABdhPJy8JQRH34yo0LYH7fgqv7KNi4P+zNVt6GyrQjGrjJOIklaLoU3uoLRGVJm039L01MwTAaSTVYc9qlINuCALcKg=
X-Received: by 2002:a17:90a:fb92:: with SMTP id cp18mr651136pjb.228.1603916683534;
 Wed, 28 Oct 2020 13:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201027135325.22235-1-vincent.whitchurch@axis.com> <CAMRc=Mdjm8tgxF_76T3f6r3TwghLKtrFtUv7ywtX3-nEQzVGtA@mail.gmail.com>
In-Reply-To: <CAMRc=Mdjm8tgxF_76T3f6r3TwghLKtrFtUv7ywtX3-nEQzVGtA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Oct 2020 22:25:32 +0200
Message-ID: <CAHp75Vff1AyKDb=JiocsAefnft+tcm+BnuWDrxViQqZAQZjuVg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mockup: Allow probing from device tree
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel@axis.com, devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 8:41 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Tue, Oct 27, 2020 at 2:54 PM Vincent Whitchurch
> <vincent.whitchurch@axis.com> wrote:

...

> > +#include <linux/of.h>
>
> Please keep the includes ordered alphabetically.

Besides the fact that that is a wrong header to be included.
mod_devicetable.h is the correct one.
(See also below)

...

> > +#ifdef CONFIG_OF
> > +static const struct of_device_id gpio_mockup_of_match[] = {
> > +       { .compatible = "gpio-mockup", },
> > +       {},
> > +};
> > +MODULE_DEVICE_TABLE(of, gpio_mockup_of_match);
> > +#endif
>
> You don't need this ifdef - of_match_ptr() will evaluate to NULL if
> CONFIG_OF is disabled and the compiler will optimize this struct out.

It's not so. If you drop ugly ifdeffery (and I vote for that, see also
above) the of_match_ptr() must be dropped as well.
Otherwise the compiler will issue the warning. So it is either all or none.

-- 
With Best Regards,
Andy Shevchenko
