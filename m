Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAF527C771F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 21:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442241AbjJLTnw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 15:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442181AbjJLTnw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 15:43:52 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDFFC0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:43:49 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7b625ed7208so651549241.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697139829; x=1697744629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCTkZ1fUfzbOuiGFP95DtfRNkhOQqqMvuxlQeJsCNtU=;
        b=VVg2QvQye4dIxRUI2Z9mI6zKw78UyyYt8NH3C5CZQFskyz2ZXQ/u+FtgMzVkKUqnIy
         kCSDPHfmweR52mI4GAnLupNXKWOAzLZBeVduDe43ib00pw9PpB2TPGpuqPCs4H0NvbP3
         /S+fzz4dJMN0NosPjRW0AkCKlBvF/doN1PjOkIfbITKEwytGVmM6r/Q1WAEl6j2acyav
         apvSJ2X96P9MMwpkwVBmrooWk+CGB0pRDGbXP5pNDX29pZ9WoVYpdMjCQ+lSRFfHoxVT
         aW3ejbKthNPZpsmSVO3lpEeMTyTIvkKS4I1ftSzcdXggfPxfm/t+0VHM/hq05EDpgnAo
         zJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697139829; x=1697744629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCTkZ1fUfzbOuiGFP95DtfRNkhOQqqMvuxlQeJsCNtU=;
        b=DNZPsai9BiPHnvBhZ596jtsp/zcewkT3ydk3MXkKF3Jy4fMtSKYBJH+f3JiwHmVFEG
         2tuuLxKqHStm4I3BwQ8/mwS+jm2DNRjwDVcXkRCqUEHAo9iMnUDKs8c8KcxfOBXKYVmj
         /qYjkEvM5TPjbpBI61LXNs4gT+7hOVZmSMgjzP3o9OE28K4C1YN7DlOt1v/tyX6YzU0w
         vTrxJ/M/yYZ8zpoZLwf77nEyzAR/vyMmPHLttZf4dydvcCEkXsjLvuq1IusdXEQGXs1P
         Lx5UI6Qz4gR1wwNLoQF2r6ZQlVw5NVEBqONCZiqX27Yw9dSXGv2WT4gg1buch92uTIgf
         j2Kg==
X-Gm-Message-State: AOJu0YxC+4Y4XF52vrBcoKKmLPq+cy0R9l8ohyulWvmEULWrQ5OmPMzZ
        RkimVxSRu2Vf7o5fLYk/DTs5DZcgMq/7maJDvV31UA==
X-Google-Smtp-Source: AGHT+IFu8qmocIkqjtibvz6+7U+NGwk14uNik7r261ivJLKpu17KrmQWwIGQVjlBGzX1A86b3tqTXS3RmeXyZqlJa1M=
X-Received: by 2002:a67:f043:0:b0:452:de00:7ab4 with SMTP id
 q3-20020a67f043000000b00452de007ab4mr25589596vsm.5.1697139828986; Thu, 12 Oct
 2023 12:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231011120830.49324-1-brgl@bgdev.pl> <20231011120830.49324-32-brgl@bgdev.pl>
 <ZSbTXz6aEdMxG4Y/@smile.fi.intel.com>
In-Reply-To: <ZSbTXz6aEdMxG4Y/@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Oct 2023 21:43:38 +0200
Message-ID: <CAMRc=Mfyq=QG_xiEpL5wXB+sWwmnw30wWdRy4qm2xG7x4emiFQ@mail.gmail.com>
Subject: Re: [PATCH v2 31/62] pinctrl: remove pinctrl_gpio_request()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 6:55=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 11, 2023 at 02:07:59PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > There are no more users of pinctrl_gpio_request() so remove it.
>
> My question was and still is why can't we preserve most of the code?
> It seems with changing a prototype to a new one and using a temporary var=
iable
> will reduce the diff noise quite a lot.
>
> Another question is can we actually derive old functions from _new ones?
>
> Like
>
> foo_new(struct gpio_chip *gc, unsigned int offset)
> {
>         ...real implementation...
> }
>
> foo(unsigned gpio)
> {
>         ...something to get gpio chip and offset...
>         foo_new(gc, offset);
> }
>
> ?

Why would we do it? This is irrelevant for the final outcome.

Bart

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
