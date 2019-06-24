Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C676E5092B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 12:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbfFXKqe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 06:46:34 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39229 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728654AbfFXKqe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 06:46:34 -0400
Received: by mail-io1-f66.google.com with SMTP id r185so968608iod.6
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2019 03:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fBt9QktoLd64Chah7MFgGo/Ww4Rt6gZg9l4gfXKcmpI=;
        b=BdSYOGyiwQEVHWX5UU8ZLqciWdf/4508u9hIvRwfy6/rOlHok3nrDXGlOI8L34d0j4
         IxFRRK1iYL0fWOTz+lxXjYaWc8Q1NdfJVN6WlYMLCF1DdbdmuM6YgcCdQHDIofOHErUm
         LsdJ462/cM7FfcbN7lCFOvtOr2lpV+JXpzMTs8fVcTfd47eNWJpkJnbl56fMARw7oqIy
         lZSJUoA0b1L6CBwYFgeW0dP1kvZc+xlMsAm+UoQeaxtZUa1KKpc/9jw35oTX8RCgRMAy
         XdkLWN8/xVghtWNIKtjoO77HAGYgoIOMH6h5MHyaWd2YtG7BlK7vsop6klNPR78G+Z0B
         84uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fBt9QktoLd64Chah7MFgGo/Ww4Rt6gZg9l4gfXKcmpI=;
        b=JfznRVwEx6tajs2XTMLpXyt/7rGlGXoLZiyiGosyzeA1NW6lSjj5dL7FdujvXWR+B2
         IGvYLuB/Ct7EmOs/ZO8MpmjLbtn6ehctxe5B5GxOcEmOQQTiGZwxXCUuFOBBMvzG8z4f
         EpB3MIxG6rtj++yeMyPSpHOC1Wzhwz1IB/pF0VztsoKF90yLBrYOLGYH9uDX9PsJdHxu
         HOT/OQE00nw4dqu8lIUOhHfQVSviNHjjrbhmu2FyyRr/joi5QkpFSpZRB4h154Iy3rwM
         HaVcFl4lDLBOBmitHp0lcNL2yrKpoVW8m2nJ1d5VYhFlBbpxNSCqYX2uZP9B3KlqHq17
         u+nw==
X-Gm-Message-State: APjAAAWO4ABEI22e2omIwY2ISsgI2prrwdh1vTQ6/EDXnRzsUryOnAGF
        Nwp+ePjYOAejtkM8i4kIJoGJCXsSgXj145zCj/t2Bg==
X-Google-Smtp-Source: APXvYqyh2MI1zxwKuqXI8jRvu7DwGxjtl7DyQm6NOa5vKvlv0rMY6C/dY8JslfYzmK2w+S1dLofjYB7Neqi7l01DiJE=
X-Received: by 2002:a5e:a712:: with SMTP id b18mr19413363iod.220.1561373193303;
 Mon, 24 Jun 2019 03:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190221162627.3476-1-brgl@bgdev.pl> <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
 <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com> <39ae399a-c606-c6de-f84d-35e39d0410c0@metux.net>
In-Reply-To: <39ae399a-c606-c6de-f84d-35e39d0410c0@metux.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 24 Jun 2019 12:46:22 +0200
Message-ID: <CAMRc=McepqowJNi6ay6x9KKoHOC8aCxP_ob12SgbsnJU_sKQng@mail.gmail.com>
Subject: Re: [PATCH] drivers: Adjust scope for CONFIG_HAS_IOMEM before devm_platform_ioremap_resource()
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Markus Elfring <Markus.Elfring@web.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 24 cze 2019 o 12:05 Enrico Weigelt, metux IT consult
<lkml@metux.net> napisa=C5=82(a):
>
> On 24.06.19 10:29, Bartosz Golaszewski wrote:
> > pt., 14 cze 2019 o 18:50 Markus Elfring <Markus.Elfring@web.de> napisa=
=C5=82(a):
> >>
> >> From: Markus Elfring <elfring@users.sourceforge.net>
> >> Date: Fri, 14 Jun 2019 17:45:13 +0200
> >>
> >> Move the preprocessor statement =E2=80=9C#ifdef CONFIG_HAS_IOMEM=E2=80=
=9D so that
> >> the corresponding scope for conditional compilation includes also comm=
ents
> >> for this function implementation.
> >>
> >> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> >> ---
> >>  drivers/base/platform.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> >> index 4d1729853d1a..a5f40974a6ef 100644
> >> --- a/drivers/base/platform.c
> >> +++ b/drivers/base/platform.c
> >> @@ -78,6 +78,7 @@ struct resource *platform_get_resource(struct platfo=
rm_device *dev,
> >>         return NULL;
> >>  }
> >>  EXPORT_SYMBOL_GPL(platform_get_resource);
> >> +#ifdef CONFIG_HAS_IOMEM
> >>
> >>  /**
> >>   * devm_platform_ioremap_resource - call devm_ioremap_resource() for =
a platform
> >> @@ -87,7 +88,6 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
> >>   *        resource management
> >>   * @index: resource index
> >>   */
> >> -#ifdef CONFIG_HAS_IOMEM
> >>  void __iomem *devm_platform_ioremap_resource(struct platform_device *=
pdev,
> >>                                              unsigned int index)
> >>  {
> >> --
> >> 2.22.0
> >>
> >
> > And what is the purpose of that?
>
> I can imagine that this could improve readability a little bit. Maybe if
> one uses same fancy ide/editor that can fold code blocks like functions
> and conditionals, this patch could make the code prettier.
>
> The patch seems pretty trivial and doesn't change any actual code, so
> I don't see hard resons for rejecting it.
>

In its current form it makes the code even less readable. The #ifdef
should actually be one line lower and touch the comment instead of the
EXPORT_SYMBOL() related to a different function.

Bart
