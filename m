Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507E21B78EC
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 17:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgDXPJ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 11:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727063AbgDXPJ2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Apr 2020 11:09:28 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B976C09B045;
        Fri, 24 Apr 2020 08:09:28 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x2so1217745pfx.7;
        Fri, 24 Apr 2020 08:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=SjsWKS0P6j4+0PWlGdo7sqKYmvlFOBzbcYnBUVrrUFk=;
        b=J05kz9Ow0ARHW+Rvq5ihe3AzNaoLD7Y5he9E0NYGt7dbkG/97kXcDVNsO1lEtlXwuy
         /fpDq/vhxxftOnPjbXORYM2a+hXS94tqRKb/408UXOpQnqGY7NuLHOiT2MiC8/7l9CTQ
         75GDceNY1S+ZKF6XnyOzmE4VvxsCHxNwvqX7XyfHjH04OYg/lO50X0993CXQHfVonegY
         Z02IjUwgTjMCDOmfJkLFDG+E5Y0CqTy7XhacBONwmSW4gCLQP+BnhJoRlxqjNhQ1M+ev
         87YSAOMhhQXm9JbVYZuDRPDQvpsunk5dMDToKMOJJCiM23iR//J9LbfasIxmJ+Nxckw+
         Ziyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=SjsWKS0P6j4+0PWlGdo7sqKYmvlFOBzbcYnBUVrrUFk=;
        b=hAjIqTFzGJ0rX5b0uYKUGenAIiJdxA0vA/Mt0vkFiW7rxfHQkLbkHCHyWSviVmxm/t
         XLfFE18kiaq4l52v455TKM9AIrjTbyuvnbh5rMydaMIdSstjE3c6jhhq+JgIxVkLYlZQ
         mjkbdf0LksY3Bh/4Wzezwrk8xFCTWch9ISGEj69iKOu/y9nZ1xRZ0/jEIWNNqNKzqx8t
         AWR3XNSjpISz+qGnCRKH14qRKNR5M64FjN3r33+ZN29Up+OwCMINY5TH05jcoYMvg0Qz
         bBjK2KKFHUoaV7HKmXMXWd3lE/Mv05NfvK8z9JyASp+1LMRx16mdIWk5rWWGGK8cidMD
         Qg9Q==
X-Gm-Message-State: AGi0PubEjQsMRHfnPQo5/rM7cLc5a2cS2y33mXhsK7kTa9n2M/NriHUD
        pTtO56N7MD/t3OunFP7jPu8=
X-Google-Smtp-Source: APiQypLXb7pHQTP0HUk4IAA6VBZcz32kstw1TM/2+eKyCQxPQSIXJ/TedLAeKp79bT7BZjbQ0j74aA==
X-Received: by 2002:a05:6a00:a:: with SMTP id h10mr10074220pfk.160.1587740968148;
        Fri, 24 Apr 2020 08:09:28 -0700 (PDT)
Received: from localhost ([176.122.158.64])
        by smtp.gmail.com with ESMTPSA id y26sm5781189pfn.185.2020.04.24.08.09.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Apr 2020 08:09:27 -0700 (PDT)
Date:   Fri, 24 Apr 2020 23:09:18 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1] gpio: fix several typos
Message-ID: <20200424150918.GB8853@nuc8i5>
References: <20200419163816.19856-1-zhengdejin5@gmail.com>
 <CAMpxmJUzrWRuHV-=EOgjd-N-iwhZwVGzF26tH0ybpzZQSP6VJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJUzrWRuHV-=EOgjd-N-iwhZwVGzF26tH0ybpzZQSP6VJQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 24, 2020 at 08:39:04AM +0200, Bartosz Golaszewski wrote:
> niedz., 19 kwi 2020 o 18:38 Dejin Zheng <zhengdejin5@gmail.com> napisał(a):
> >
> > Use codespell to fix lots of typos over frontends.
> >
> > CC: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > ---
> >  drivers/gpio/gpio-ftgpio010.c | 2 +-
> >  drivers/gpio/gpio-mm-lantiq.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
> > index fbddb1662428..4031164780f7 100644
> > --- a/drivers/gpio/gpio-ftgpio010.c
> > +++ b/drivers/gpio/gpio-ftgpio010.c
> > @@ -193,7 +193,7 @@ static int ftgpio_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
> >         if (val == deb_div) {
> >                 /*
> >                  * The debounce timer happens to already be set to the
> > -                * desireable value, what a coincidence! We can just enable
> > +                * desirable value, what a coincidence! We can just enable
> >                  * debounce on this GPIO line and return. This happens more
> >                  * often than you think, for example when all GPIO keys
> >                  * on a system are requesting the same debounce interval.
> > diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
> > index f460d71b0c92..538e31fe8903 100644
> > --- a/drivers/gpio/gpio-mm-lantiq.c
> > +++ b/drivers/gpio/gpio-mm-lantiq.c
> > @@ -36,7 +36,7 @@ struct ltq_mm {
> >   * @chip:     Pointer to our private data structure.
> >   *
> >   * Write the shadow value to the EBU to set the gpios. We need to set the
> > - * global EBU lock to make sure that PCI/MTD dont break.
> > + * global EBU lock to make sure that PCI/MTD don't break.
> >   */
> >  static void ltq_mm_apply(struct ltq_mm *chip)
> >  {
> > --
> > 2.25.0
> >
> 
> The subject line should be gpio: <name of the driver>: short message
> 
> And please split those into patches for each driver.
>
Hi Bart:

Thanks for your review, I will send the patch v2 for this change. 

BR,
Dejin
> Bart
