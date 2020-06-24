Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220642074A3
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 15:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389302AbgFXNeL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 09:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388896AbgFXNeK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 09:34:10 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC748C061573;
        Wed, 24 Jun 2020 06:34:10 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b7so2320959pju.0;
        Wed, 24 Jun 2020 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o2BDas5hPmBEDguTVlPQc/PXdhVs9KoBO9DKMp79/t8=;
        b=dOiY63xNlCtO6ROQwhWxekDmNHRcu81tw9rgW8ErlqUMS3bJVQwyM9WT/XzBbXbs/c
         fSZluzQB9tQsVN/+WHJW/yyc6kSKLB2eIvpXsZnAuuA3gHAkq6GGuDMA5fFFKOe1iPzd
         Z7QOmN/HO3l299Gmkev2X5d1Q0SJpkomAKN26FwBUw4pf1HXI/EpsXRUpeOfRR9kCf9Z
         1cgCYwSq9t1x47cBOIz901HtbuOmAAeMt2yvA+dJPZHdoRhLoGETux31qxGfYN73zc7F
         q+TJeie2XdbU663c7a9+8lIxIDvVBCHNk+pCEiiBOfnznp/HKNx3WfPvlPpf4PcYKqY5
         y4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2BDas5hPmBEDguTVlPQc/PXdhVs9KoBO9DKMp79/t8=;
        b=nAFU/AqniABPJuG+eak+fec7vWcxXt50LWQByMQKBGyWl5bXZs6j/wDzbIh1XS7hi7
         m3Lq9dvxSjAohIuHxkjZ25wmEuDE2nJzQCrGhdQaeN+GHuGNeC6yHDgfhUmc9vuEfdXs
         rKWdgylPd0Oc4nPGtB4LtE0II6IP2lDkBDahjNlV/2STRJZbPbWdTx/kofoxO6CdyKTk
         CMPaXsmL8htevEf4CeXoE95XsZYgbleOuyXYH6M9j2eL44eNl78UtKMqXB+546Ps9S1q
         0puWbnRUYDaqiPeceY/ANw5jgHJF4IHUv1Ta1qJV05+sIdbde1jtTWqokkRhAehcLNCE
         ys2g==
X-Gm-Message-State: AOAM532SUQXCZBZAFNkrRTBD2xignNc3eVhDU6i3dl+Ia2WgD9ZtcbYH
        TOGI+omgqrmHV5VKZzF4EySbZ0jq8kXsjlJViyE=
X-Google-Smtp-Source: ABdhPJxO8lO9U9avc+ALq1eRKS741/9RjAwHrIKzMzoMF6efsYE758//OT2ZAZ2BFZRrCvJAOlQXVT+6z5l2RF0e7mE=
X-Received: by 2002:a17:902:7288:: with SMTP id d8mr29144476pll.18.1593005650232;
 Wed, 24 Jun 2020 06:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200623060526.29922-1-mans0n@gorani.run> <80bbca9a625b2a0feb9b816906549b7c@walle.cc>
 <2291c01d-30df-518e-a952-644bd955f1f3@gorani.run> <69f5d1a1970838b8c4bd8d6e8dba6cac@walle.cc>
In-Reply-To: <69f5d1a1970838b8c4bd8d6e8dba6cac@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 24 Jun 2020 16:33:57 +0300
Message-ID: <CAHp75Vfc2udv2mLLJCFO6P+n8_kcO7OZKhH_XkOy7Cf4fnxgtA@mail.gmail.com>
Subject: Re: [PATCH] gpio: add GPO driver for PCA9570
To:     Michael Walle <michael@walle.cc>
Cc:     Sungbo Eo <mans0n@gorani.run>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 23, 2020 at 3:48 PM Michael Walle <michael@walle.cc> wrote:
> Am 2020-06-23 14:22, schrieb Sungbo Eo:
> > On 2020-06-23 17:31, Michael Walle wrote:
> >> Am 2020-06-23 08:05, schrieb Sungbo Eo:

...

> >> Did you have a look at drivers/gpio/gpio-regmap.c ? Your driver seems
> >> to be simple enough to be easily integrated with that. If you need a
> >> blueprint; because at the moment there is no driver in the kernel
> >> using that, you could have a look at:
> >> https://lore.kernel.org/linux-gpio/20200604211039.12689-7-michael@walle.cc/
> >
> > Thanks for your advice. I didn't really know what regmap is for...
> > It seems gpio-regmap is for gpio controllers having val/dir registers.
> > But pca9570 does not use port registers. The master only sends a data
> > byte without reg address.
>
> Ahh I missed that :(
>
> > I'm not sure how to apply gpio-regmap or
> > regmap-i2c here.
> > I'll try to investigate if setting reg_size or reg_bits to zero is
> > possible.
> >
> > Please correct me if I'm in the wrong direction.
>
> That won't work because the underlying regmap expects the address bits
> to be either 8 or 16. In this case I'd guess gpio-regmap, doesn't make
> sense, because there is actually no real gain.

From the DS:
"The device acknowledges and the master sends the data byte for P7 to
P0 and is acknowledged by the device. Writes to P7 to P4 are ignored
in the PCA9570 as only P3 through P0 are available. The 4-bit data is
presented on the port lines after it has been acknowledged by the
device. The number of data bytes that can be sent successively is not
limited. The previous data is overwritten every time a data byte has
been sent."

So, basically writing to the register the value of register can
simulate register map, but the question is do we gain anything from
that abstraction because it means that all 256 (or 16 for 4-bit
variant) registers are possible?


--
With Best Regards,
Andy Shevchenko
